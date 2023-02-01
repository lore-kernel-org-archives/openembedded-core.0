Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D51C636D7
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 16:37:23 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.28368.1675269439651982504
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 08:37:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AlGV+RTa;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id cr22so5366738qtb.10
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 08:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngl9exXjoZTp6h6ypOOtjmaPW/tRfoL0Ql6orJKlBGY=;
        b=AlGV+RTaJv4aqDpdDNy0r9UeF6fjS9SyZ7VuCQwKNF5oOUsK1brsP+tAm19uzRSkEi
         jrI9OtGg5PoGVyD2W/m+3AhekOSdwhMuB7mXA+P0Lt3ZjyRe8Vww68dO9hnWCfirh9vy
         j9oZ/foUlYyJsXcewW6jLECwJ6STe6FouEvDn/e5WgWnRvlD8woNwcT7KWjWZXCCtcXh
         6uTBJ0CfD+N6Vn/xR3HTPrO/x5z4H6TrqURQWjZZ7K/rfQ///4QPZUU0G0ThOiA5exSA
         mNk11UBGr4eLEPIq8dx4UVWFW7pCZwRasBj0YgvDkxJSONpnZZxc0Jldbwxd0ifEuCkc
         rfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ngl9exXjoZTp6h6ypOOtjmaPW/tRfoL0Ql6orJKlBGY=;
        b=y7azQOFR309YbPWO+qJ8r6zrvMHgCILMHkEQSTQwog2yda345PO7IA+cIeeuZXm+cc
         UtAJPhRDdtXLp2A/YhyZnnY/mMHJ2YKmRddJiIekz6rnuXnvCI1hee6QwAQnZufY55l1
         HAiClbDLh6951rkmPxSbUIETY85zuT7gKfRr4FHbeC500VwBEqO2eXOIBQrw2ustcTDD
         OT27ddsthdbnHwB/t8je/P0q2cSDjxZGESDbMs/tTDG7f+4rOsX0CH3QeO+RDaywgzsI
         sj9SkoTWRHIploEPLlA6DQorcKX68qI6qqPJRPaNhXl3c5LzbmVZsxsbShkJJsm/NZEw
         izpA==
X-Gm-Message-State: AO0yUKWMUPCHMveGErOKf4ftrRkrLktwjInXnTFa0D2vR6QBUK6MTygA
	J6SNTE809lVXTuf0Jr37k6zuEQlYovFlRA==
X-Google-Smtp-Source: AK7set8AWOlKzZSimjUey86Rn1vACkU6PG1tdt2h7H2zqj8TJLfPdjuqLjDhTD4T7+EP8GQ1wOhK9A==
X-Received: by 2002:ac8:5ac8:0:b0:3b8:6b4c:aba8 with SMTP id d8-20020ac85ac8000000b003b86b4caba8mr5229600qtd.39.1675269438139;
        Wed, 01 Feb 2023 08:37:18 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id r13-20020a05620a03cd00b0072771acaf09sm2791472qkm.126.2023.02.01.08.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 08:37:17 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3][kirstone] linux-yocto/5.10: update to v5.10.164
Date: Wed,  1 Feb 2023 11:37:14 -0500
Message-Id: <20230201163715.2205693-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201163715.2205693-1-bruce.ashfield@gmail.com>
References: <20230201163715.2205693-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 16:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176566

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    3a9f1b907bc4 Linux 5.10.164
    74985c575767 Revert "usb: ulpi: defer ulpi_register on ulpi_read_id timeout"
    a88a0d16e18f io_uring/io-wq: only free worker if it was allocated for creation
    b912ed1363b3 io_uring/io-wq: free worker if task_work creation is canceled
    68bcd0638570 drm/virtio: Fix GEM handle creation UAF
    4ca71bc0e199 efi: fix NULL-deref in init error path
    057f5ddfbc13 arm64: cmpxchg_double*: hazard against entire exchange variable
    9a5fd0844e7f arm64: atomics: remove LL/SC trampolines
    28840e46eaaf arm64: atomics: format whitespace consistently
    5dac4c7212a7 x86/resctrl: Fix task CLOSID/RMID update race
    446c7251f007 x86/resctrl: Use task_curr() instead of task_struct->on_cpu to prevent unnecessary IPI
    196c6f0c3e21 KVM: x86: Do not return host topology information from KVM_GET_SUPPORTED_CPUID
    0027164b24f2 Documentation: KVM: add API issues section
    caaea2ab6b6d iommu/mediatek-v1: Fix an error handling path in mtk_iommu_v1_probe()
    cf38e7624179 iommu/mediatek-v1: Add error handle for mtk_iommu_probe
    60806adc9be0 mm: Always release pages to the buddy allocator in memblock_free_late().
    092f0c2d1f83 net/mlx5e: Don't support encap rules with gbp option
    b3d47227f06f net/mlx5: Fix ptp max frequency adjustment range
    453277feb41c net/sched: act_mpls: Fix warning during failed attribute validation
    0ca78c99656f nfc: pn533: Wait for out_urb's completion in pn533_usb_send_frame()
    92b30a27e4fa hvc/xen: lock console list traversal
    14e72a56e16c octeontx2-af: Fix LMAC config in cgx_lmac_rx_tx_enable
    8e2bfcfaabc3 octeontx2-af: Map NIX block from CGX connection
    d9be5b57ab2c octeontx2-af: Update get/set resource count functions
    0d0675bc33e6 tipc: fix unexpected link reset due to discovery messages
    d83cac6c00b8 ASoC: wm8904: fix wrong outputs volume after power reactivation
    d4aa749e0464 regulator: da9211: Use irq handler when ready
    3ca8ef4d91ef EDAC/device: Fix period calculation in edac_device_reset_delay_period()
    28b9a0e216db x86/boot: Avoid using Intel mnemonics in AT&T syntax asm
    8cbeb60320ac powerpc/imc-pmu: Fix use of mutex in IRQs disabled section
    4e6a70fd8404 netfilter: ipset: Fix overflow before widen in the bitmap_ip_create() function.
    a3a1114aa615 xfrm: fix rcu lock in xfrm_notify_userpolicy()
    091f85db4c3f ext4: fix uninititialized value in 'ext4_evict_inode'
    98407a4ae34b usb: ulpi: defer ulpi_register on ulpi_read_id timeout
    3d13818a9995 xhci: Prevent infinite loop in transaction errors recovery for streams
    2f90fcedc5d6 xhci: move and rename xhci_cleanup_halted_endpoint()
    cad965cedbc4 xhci: store TD status in the td struct instead of passing it along
    9b63a80c45e9 xhci: move xhci_td_cleanup so it can be called by more functions
    44c635c60f78 xhci: Add xhci_reset_halted_ep() helper function
    10287d18f524 xhci: adjust parameters passed to cleanup_halted_endpoint()
    aaaa7cc4aba1 xhci: get isochronous ring directly from endpoint structure
    a81ace065694 xhci: Avoid parsing transfer events several times
    ba20d6056b6b clk: imx: imx8mp: add shared clk gate for usb suspend clk
    2b331d2137cc dt-bindings: clocks: imx8mp: Add ID for usb suspend clock
    cb769960ef48 clk: imx8mp: add clkout1/2 support
    85eaaa17c0a9 clk: imx8mp: Add DISP2 pixel clock
    6b21077146c5 iommu/amd: Fix ill-formed ivrs_ioapic, ivrs_hpet and ivrs_acpihid options
    5badda810f69 iommu/amd: Add PCI segment support for ivrs_[ioapic/hpet/acpihid] commands
    ab9bb65b8519 bus: mhi: host: Fix race between channel preparation and M0 event
    6c9e2c11c33c ipv6: raw: Deduct extension header length in rawv6_push_pending_frames
    112df4cd2b09 ixgbe: fix pci device refcount leak
    f401062d8dbd platform/x86: sony-laptop: Don't turn off 0x153 keyboard backlight during probe
    785607e5e6fb drm/msm/dp: do not complete dp_aux_cmd_fifo_tx() if irq is not for aux transfer
    8c71777b6a17 drm/msm/adreno: Make adreno quirks not overwrite each other
    afb6063aa89f cifs: Fix uninitialized memory read for smb311 posix symlink create
    51dbedee2ff3 s390/percpu: add READ_ONCE() to arch_this_cpu_to_op_simple()
    bddb35526784 s390/cpum_sf: add READ_ONCE() semantics to compare and swap loops
    2adc64f3e669 ASoC: qcom: lpass-cpu: Fix fallback SD line index handling
    5ee3083307ef s390/kexec: fix ipl report address for kdump
    d1725dbf2310 perf auxtrace: Fix address filter duplicate symbol selection
    eaabceae1b70 docs: Fix the docs build with Sphinx 6.0
    38c4a17c6b32 efi: tpm: Avoid READ_ONCE() for accessing the event log
    c47883105cff KVM: arm64: Fix S1PTW handling on RO memslots
    443b390f2cc9 ALSA: hda/realtek: Enable mute/micmute LEDs on HP Spectre x360 13-aw0xxx
    550efeff989b netfilter: nft_payload: incorrect arithmetics when fetching VLAN header bits
    19ff2d645f7a Linux 5.10.163
    de4a20e14823 ALSA: hda - Enable headset mic on another Dell laptop with ALC3254
    0ad275c139a3 ALSA: hda/hdmi: Add a HP device 0x8715 to force connect list
    df02234e6b87 ALSA: pcm: Move rwsem lock inside snd_ctl_elem_read to prevent UAF
    f8ed0a93b5d5 net/ulp: prevent ULP without clone op from entering the LISTEN status
    9f7bc28a6b8a net: sched: disallow noqueue for qdisc classes
    6eb02c596ec0 mptcp: use proper req destructor for IPv6
    f4c7afa951ea mptcp: dedicated request sock for subflow in v6
    31472f94c68f mptcp: remove MPTCP 'ifdef' in TCP SYN cookies
    5aa15a8400cc mptcp: mark ops structures as ro_after_init
    f5ef26276bb0 serial: fixup backport of "serial: Deassert Transmit Enable on probe in driver-specific way"
    2ecf0819e441 fsl_lpuart: Don't enable interrupts too early
    23ad034760dd ext4: don't set up encryption key during jbd2 transaction
    d9ff5ad203b6 ext4: disable fast-commit of encrypted dir operations
    5b700b9c0402 parisc: Align parisc MADV_XXX constants with all other architectures
    07b3672c4090 io_uring: Fix unsigned 'res' comparison with zero in io_fixup_rw_res()
    b57d7b1dcda1 efi: random: combine bootloader provided RNG seed with RNG protocol output
    da20f56a3532 mbcache: Avoid nesting of cache->c_list_lock under bit locks
    be01f35efa87 hfs/hfsplus: avoid WARN_ON() for sanity check, use proper error handling
    1f881d9201f6 hfs/hfsplus: use WARN_ON for sanity check
    434909edcae3 selftests: set the BUILD variable to absolute path
    a41d63f20471 ext4: don't allow journal inode to have encrypt flag
    af90f8b36d78 drm/i915/gvt: fix vgpu debugfs clean in remove
    bb7c7b2c89d2 drm/i915/gvt: fix gvt debugfs destroy
    bc847857fbd8 riscv: uaccess: fix type of 0 variable on error in get_user()
    f64e56fb285a fbdev: matroxfb: G200eW: Increase max memory from 1 MB to 16 MB
    d0c46b55d6d9 nfsd: fix handling of readdir in v4root vs. mount upcall timeout
    67e39c4f4cb3 x86/bugs: Flush IBP in ib_prctl_set()
    f13301a69aba nvme: fix multipath crash caused by flush request when blktrace is enabled
    3f257a98e54c ASoC: Intel: bytcr_rt5640: Add quirk for the Advantech MICA-071 tablet
    6df376e24569 udf: Fix extension of the last extent in the file
    84b2cc7b36b7 caif: fix memory leak in cfctrl_linkup_request()
    e5a05837445e drm/i915: unpin on error in intel_vgpu_shadow_mm_pin()
    232ef345e5d7 usb: rndis_host: Secure rndis_query check against int overflow
    2a9ee7c24b32 drivers/net/bonding/bond_3ad: return when there's no aggregator
    bc6a0993bf8f perf tools: Fix resources leak in perf_data__open_dir()
    ee756980e491 netfilter: ipset: Rework long task execution when adding/deleting entries
    ba5d27909745 netfilter: ipset: fix hash:net,port,net hang with /0 subnet
    b2c917e510e5 net: sched: cbq: dont intepret cls results when asked to drop
    5f65f48516bf net: sched: atm: dont intepret cls results when asked to drop
    f4a2ad100200 gpio: sifive: Fix refcount leak in sifive_gpio_probe
    7ec369e215bf ceph: switch to vfs_inode_has_locks() to fix file lock bug
    407710427dd5 filelock: new helper: vfs_inode_has_locks
    9f0ff5de3e81 drm/meson: Reduce the FIFO lines held when AFBC is not used
    ae2639cd2c8c RDMA/mlx5: Fix validation of max_rd_atomic caps for DC
    106d0d33c9d1 net: phy: xgmiitorgmii: Fix refcount leak in xgmiitorgmii_probe
    398e14bb735d net: amd-xgbe: add missed tasklet_kill
    e3d90ca90652 net/mlx5e: Fix hw mtu initializing at XDP SQ allocation
    6d655a9d8251 net/mlx5e: IPoIB, Don't allow CQE compression to be turned on by default
    670b20617346 net/mlx5: Avoid recovery in probe flows
    66b92b80c95e net/mlx5: Add forgotten cleanup calls into mlx5_init_once() error path
    b6c74d237648 vhost: fix range used in translate_desc()
    264fb6dcbfde vringh: fix range used in iotlb_translate()
    eabb3ceb04cd vhost/vsock: Fix error handling in vhost_vsock_init()
    e0f5c962c066 nfc: Fix potential resource leaks
    513787ff9a33 qlcnic: prevent ->dcb use-after-free on qlcnic_dcb_enable() failure
    b314f6c35121 net: sched: fix memory leak in tcindex_set_parms
    4226ce95a934 net: hns3: add interrupts re-initialization while doing VF FLR
    998ebbdc3bb1 nfsd: shut down the NFSv4 state objects before the filecache
    69d896b60957 veth: Fix race with AF_XDP exposing old or uninitialized descriptors
    5f41212dc2ec vmxnet3: correctly report csum_level for encapsulated packet
    0b70f6ea4d4f drm/panfrost: Fix GEM handle creation ref-counting
    e68e088d0d6a bpf: pull before calling skb_postpull_rcsum()
    cb0d627bc711 SUNRPC: ensure the matching upcall is in-flight upon downcall
    1be16a0c2f10 ext4: fix deadlock due to mbcache entry corruption
    0da99012d3f7 mbcache: automatically delete entries from cache on freeing
    1a56cd972ce1 ext4: fix race when reusing xattr blocks
    4cc218e217bf ext4: unindent codeblock in ext4_xattr_block_set()
    0e6fbc566fcc ext4: remove EA inode entry from mbcache on inode eviction
    27c08673978e mbcache: add functions to delete entry if unused
    fb59d12ae7f9 mbcache: don't reclaim used entries
    4c363e2961cd ext4: use kmemdup() to replace kmalloc + memcpy
    b8b7922374b0 ext4: fix leaking uninitialized memory in fast-commit journal
    a5584ba9b3b6 ext4: fix various seppling typos
    adfefe804b1f ext4: simplify ext4 error translation
    95eaa8a95358 ext4: move functions in super.c
    769469f8f188 fs: ext4: initialize fsdata in pagecache_write()
    b33e42d65efe ext4: use memcpy_to_page() in pagecache_write()
    60d4383c1bda mm/highmem: Lift memcpy_[to|from]_page to core
    f86d3338c87c ext4: correct inconsistent error msg in nojournal mode
    99017eb3deee ext4: goto right label 'failed_mount3a'
    56d87959c654 riscv: stacktrace: Fixup ftrace_graph_ret_addr retp argument
    ecb8e8b2e55f riscv/stacktrace: Fix stack output without ra on the stack top
    b5c75efd0a6c ravb: Fix "failed to switch device to config mode" message during unbind
    5451efb2ca30 staging: media: tegra-video: fix device_node use after free
    f899baf6cb0f x86/kprobes: Fix optprobe optimization check with CONFIG_RETHUNK
    5d112deb2a02 x86/kprobes: Convert to insn_decode()
    a1766efc5bbf perf probe: Fix to get the DW_AT_decl_file and DW_AT_call_file as unsinged data
    b5d0f7c24088 perf probe: Use dwarf_attr_integrate as generic DWARF attr accessor
    c0a3d2158437 media: s5p-mfc: Fix in register read and write for H264
    8ff64edf9d16 media: s5p-mfc: Clear workbit to handle error condition
    dcd1a4ade590 media: s5p-mfc: Fix to handle reference queue during finishing
    97e7896000ce x86/MCE/AMD: Clear DFR errors found in THR handler
    ec75bc43681b x86/mce: Get rid of msr_ops
    58de7a95f0e6 btrfs: replace strncpy() with strscpy()
    7a04f8500924 perf/x86/intel/uncore: Clear attr_update properly
    53d24a9592eb perf/x86/intel/uncore: Generalize I/O stacks to PMON mapping procedure
    9620f8a5c72f ARM: renumber bits related to _TIF_WORK_MASK
    630270978483 drm/amdgpu: make display pinning more flexible (v2)
    dfc01905b870 drm/amdgpu: handle polaris10/11 overlap asics (v2)
    30e95fdc9609 ext4: allocate extended attribute value in vmalloc area
    8d3e87d43c62 ext4: avoid unaccounted block allocation when expanding inode
    15d0cf84df07 ext4: initialize quota before expanding inode in setproject ioctl
    9882601ee689 ext4: fix inode leak in ext4_xattr_inode_create() on an error path
    407f47728c6c ext4: avoid BUG_ON when creating xattrs
    00092b218d2b ext4: fix error code return to user-space in ext4_get_branch()
    f06c980287f1 ext4: fix corruption when online resizing a 1K bigalloc fs
    9404839e0c9d ext4: fix delayed allocation bug in ext4_clu_mapped for bigalloc + inline
    84a2f2ed49d6 ext4: init quota for 'old.inode' in 'ext4_rename'
    71e99ec1315f ext4: fix bug_on in __es_tree_search caused by bad boot loader inode
    9020f56a3cad ext4: check and assert if marking an no_delete evicting inode dirty
    86c2a2ec4bd3 ext4: fix reserved cluster accounting in __es_remove_extent()
    98004f926d27 ext4: fix bug_on in __es_tree_search caused by bad quota inode
    20af66617eef ext4: add helper to check quota inums
    c0a738875c2e ext4: add EXT4_IGET_BAD flag to prevent unexpected bad inode
    f9cd6980800b ext4: fix undefined behavior in bit shift for ext4_check_flag_values
    7223d5e75f26 ext4: fix use-after-free in ext4_orphan_cleanup
    d6d18d6e2d06 ext4: add inode table check in __ext4_get_inode_loc to aovid possible infinite loop
    bdc698ce91f2 ext4: silence the warning when evicting inode with dioread_nolock
    68af1a4842b4 drm/ingenic: Fix missing platform_driver_unregister() call in ingenic_drm_init()
    bf83a303f2b5 drm/i915/dsi: fix VBT send packet port selection for dual link DSI
    439cbbc15195 drm/vmwgfx: Validate the box size for the snooped cursor
    0a0662d597de drm/connector: send hotplug uevent on connector cleanup
    21a773ec8994 device_cgroup: Roll back to original exceptions after copy failure
    3505c187b861 parisc: led: Fix potential null-ptr-deref in start_task()
    2c7c487cd850 remoteproc: core: Do pm_relax when in RPROC_OFFLINE state
    e291dea722de iommu/amd: Fix ivrs_acpihid cmdline parsing code
    28e71fd8d5d9 driver core: Fix bus_type.match() error handling in __driver_attach()
    772dbbfc2084 crypto: n2 - add missing hash statesize
    7c44205748ed PCI/sysfs: Fix double free in error path
    99ef6cc79158 PCI: Fix pci_device_is_present() for VFs by checking PF
    f29d127b372e ipmi: fix use after free in _ipmi_destroy_user()
    bfe1e039a0fd ima: Fix a potential NULL pointer access in ima_restore_measurement_list
    62307558e71e mtd: spi-nor: Check for zero erase size in spi_nor_find_best_erase_type()
    4e17819cb302 ipmi: fix long wait in unload when IPMI disconnect
    24bc27ea4e71 ASoC: jz4740-i2s: Handle independent FIFO flush bits
    652f1d66a8be wifi: wilc1000: sdio: fix module autoloading
    d9f6614a732b efi: Add iMac Pro 2017 to uefi skip cert quirk
    ffcf71676d3b md/bitmap: Fix bitmap chunk size overflow issues
    e94443252b46 rtc: ds1347: fix value written to century register
    6155aed4768c cifs: fix missing display of three mount options
    8c82733e2408 cifs: fix confusing debug message
    3df07728abde media: dvb-core: Fix UAF due to refcount races at releasing
    7dd5a68cdbbb media: dvb-core: Fix double free in dvb_register_device()
    1032520b2109 ARM: 9256/1: NWFPE: avoid compiler-generated __aeabi_uldivmod
    1306614412b8 staging: media: tegra-video: fix chan->mipi value on error
    52c0622e53ea tracing: Fix infinite loop in tracing_read_pipe on overflowed print_trace_line
    b838b1b9ca70 tracing/hist: Fix wrong return value in parse_action_params()
    ff3dd2c1befe x86/kprobes: Fix kprobes instruction boudary check with CONFIG_RETHUNK
    362495bf451f ftrace/x86: Add back ftrace_expected for ftrace bug reports
    b677629caebb x86/microcode/intel: Do not retry microcode reloading on the APs
    43dd254853aa KVM: nVMX: Inject #GP, not #UD, if "generic" VMXON CR0/CR4 check fails
    e61eacf99364 perf/core: Call LSM hook after copying perf_event_attr
    0cb31bd88361 tracing/hist: Fix out-of-bound write on 'action_data.var_ref_idx'
    18a489a3fda7 dm cache: set needs_check flag after aborting metadata
    2b17026685a2 dm cache: Fix UAF in destroy()
    342cfd8426df dm clone: Fix UAF in clone_dtr()
    a506b5c92757 dm integrity: Fix UAF in dm_integrity_dtr()
    34fe9c2251f1 dm thin: Fix UAF in run_timer_softirq()
    c84d1ca2285b dm thin: resume even if in FAIL mode
    94f01ecc2aa0 dm thin: Use last transaction's pmd->root when commit failed
    7e3757806973 dm thin: Fix ABBA deadlock between shrink_slab and dm_pool_abort_metadata
    b45e77b79215 dm cache: Fix ABBA deadlock between shrink_slab and dm_cache_metadata_abort
    d9fa243ab26c ALSA: hda/realtek: Apply dual codec fixup for Dell Latitude laptops
    2437b0622342 ALSA: patch_realtek: Fix Dell Inspiron Plus 16
    e379b88a8f8c cpufreq: Init completion before kobject_init_and_add()
    cea018aaf721 PM/devfreq: governor: Add a private governor_data for governor
    d1d73c303458 selftests: Use optional USERCFLAGS and USERLDFLAGS
    12576d2ebf65 arm64: dts: qcom: sdm850-lenovo-yoga-c630: correct I2C12 pins drive strength
    8546f11c42bd ARM: ux500: do not directly dereference __iomem
    0061ab5153fb btrfs: fix resolving backrefs for inline extent followed by prealloc
    c0aa6e6ab08d mmc: sdhci-sprd: Disable CLK_AUTO when the clock is less than 400K
    e918762f8a08 arm64: dts: qcom: sdm845-db845c: correct SPI2 pins drive strength
    c023597baecb jbd2: use the correct print format
    8c444b3061f0 ktest.pl minconfig: Unset configs instead of just removing them
    5148dfceab55 kest.pl: Fix grub2 menu handling for rebooting
    780297af3c85 soc: qcom: Select REMAP_MMIO for LLCC driver
    d5db9aaf1b47 media: stv0288: use explicitly signed char
    25dbd87379f8 net/af_packet: make sure to pull mac header
    c2137d565ceb net/af_packet: add VLAN support for AF_PACKET SOCK_RAW GSO
    7c15d7ecce00 rcu: Prevent lockdep-RCU splats on lock acquisition/release
    4c57f612f433 torture: Exclude "NOHZ tick-stop error" from fatal errors
    289f512d08c4 wifi: rtlwifi: 8192de: correct checking of IQK reload
    0f6d6974b08e wifi: rtlwifi: remove always-true condition pointed out by GCC 12
    40b844796b6b net/mlx5e: Fix nullptr in mlx5e_tc_add_fdb_flow()
    8b20aab8cfd0 ASoC/SoundWire: dai: expand 'stream' concept beyond SoundWire
    185c141946e0 ASoC: Intel/SOF: use set_stream() instead of set_tdm_slots() for HDAudio
    7b3631a2e17d kcsan: Instrument memcpy/memset/memmove with newer Clang
    2cd6026e2573 SUNRPC: Don't leak netobj memory when gss_read_proxy_verf() fails
    3b6c822238da tpm: tpm_tis: Add the missed acpi_put_table() to fix memory leak
    0bd9b4be721c tpm: tpm_crb: Add the missed acpi_put_table() to fix memory leak
    8ddc48068ac8 tpm: acpi: Call acpi_put_table() to fix memory leak
    b51d5fed9f53 mmc: vub300: fix warning - do not call blocking ops when !TASK_RUNNING
    252a72088280 f2fs: should put a page when checking the summary info
    882734bbc587 mm, compaction: fix fast_isolate_around() to stay within boundaries
    ae7793027766 md: fix a crash in mempool_free
    b591b2919d01 pnode: terminate at peers of source
    66f359ad66d4 ALSA: line6: fix stack overflow in line6_midi_transmit
    5e79f77ea42f ALSA: line6: correct midi status byte when receiving data from podxt
    56abf8046bc1 ovl: Use ovl mounter's fsuid and fsgid in ovl_link()
    c3e8bbcbaa87 binfmt: Fix error return code in load_elf_fdpic_binary()
    12407462d3fc hfsplus: fix bug causing custom uid and gid being unable to be assigned with mount
    44cf50587e82 pstore/zone: Use GFP_ATOMIC to allocate zone buffer
    0d992c044cfb HID: plantronics: Additional PIDs for double volume key presses quirk
    eaf0b782269f HID: multitouch: fix Asus ExpertBook P2 P2451FA trackpoint
    6f7e2fcab733 powerpc/rtas: avoid scheduling in rtas_os_term()
    f2167f10fcca powerpc/rtas: avoid device tree lookups in rtas_os_term()
    0af0e115ff59 objtool: Fix SEGFAULT
    57ae492f620c nvmet: don't defer passthrough commands with trivial effects to the workqueue
    4b3282a9779c nvme: fix the NVME_CMD_EFFECTS_CSE_MASK definition
    ab711f3eda7a ata: ahci: Fix PCS quirk application for suspend
    cc512539c44f nvme-pci: fix page size checks
    dfb6d54893d5 nvme-pci: fix mempool alloc size
    f5d8738fbe33 nvme-pci: fix doorbell buffer value endianness
    fe6ea044c4f0 cifs: fix oops during encryption
    f9089b95548f usb: dwc3: qcom: Fix memory leak in dwc3_qcom_interconnect_init
    ce2462bcf3ff pwm: tegra: Fix 32 bit build
    a8be7c2787b9 media: dvbdev: fix refcnt bug
    153319671a08 media: dvbdev: fix build warning due to comments
    740c537f52c1 ovl: fix use inode directly in rcu-walk mode
    f24474d12e68 gcov: add support for checksum field
    36be7afca103 regulator: core: fix deadlock on regulator enable
    e12f4c321247 iio: adc128s052: add proper .data members in adc128_of_match table
    9f604702b765 iio: adc: ad_sigma_delta: do not use internal iio_dev lock
    582f5fc2c586 reiserfs: Add missing calls to reiserfs_security_free()
    08371068fff8 HID: mcp2221: don't connect hidraw
    7a203471b980 HID: wacom: Ensure bootloader PID is usable in hidraw mode
    723ffde78af5 usb: dwc3: core: defer probe on ulpi_read_id timeout
    d17c82aad67a usb: dwc3: Fix race between dwc3_set_mode and __dwc3_set_mode
    2b725b6fbbe6 ALSA: hda/hdmi: Add HP Device 0x8711 to force connect list
    c863b673503e ALSA: hda/realtek: Add quirk for Lenovo TianYi510Pro-14IOB
    d3767082ebfa ALSA: usb-audio: add the quirk for KT0206 device
    7691fa41024e ima: Simplify ima_lsm_copy_rule
    1d8dcc3dadf9 pstore: Make sure CONFIG_PSTORE_PMSG selects CONFIG_RT_MUTEXES
    07b0ce902e28 afs: Fix lost servers_outstanding count
    1080729b9a56 perf debug: Set debug_peo_args and redirect_to_stderr variable to correct values in perf_quiet_option()
    1c7b03d00c07 pstore: Switch pmsg_lock to an rt_mutex to avoid priority inversion
    c3607ed7edfb LoadPin: Ignore the "contents" argument of the LSM hooks
    4138e1b7751c ASoC: rt5670: Remove unbalanced pm_runtime_put()
    fd49dc17c3d7 ASoC: rockchip: spdif: Add missing clk_disable_unprepare() in rk_spdif_runtime_resume()
    c0ae46693b85 ASoC: wm8994: Fix potential deadlock
    e4a8573b0460 ASoC: rockchip: pdm: Add missing clk_disable_unprepare() in rockchip_pdm_runtime_resume()
    06c9d468c068 ASoC: audio-graph-card: fix refcount leak of cpu_ep in __graph_for_each_link()
    812a18e48efb ASoC: mediatek: mt8173-rt5650-rt5514: fix refcount leak in mt8173_rt5650_rt5514_dev_probe()
    c2eb1a3877f5 ASoC: Intel: Skylake: Fix driver hang during shutdown
    72c0e552bc86 ALSA: hda: add snd_hdac_stop_streams() helper
    d3a8925d6c1d ALSA/ASoC: hda: move/rename snd_hdac_ext_stop_streams to hdac_stream.c
    2727dbfe8d06 hwmon: (jc42) Fix missing unlock on error in jc42_write()
    a076490b0211 orangefs: Fix kmemleak in orangefs_{kernel,client}_debug_init()
    b8affa0c6405 orangefs: Fix kmemleak in orangefs_prepare_debugfs_help_string()
    6e3c4d3fa5d4 drm/sti: Fix return type of sti_{dvo,hda,hdmi}_connector_mode_valid()
    f3d3f3564e8b drm/fsl-dcu: Fix return type of fsl_dcu_drm_connector_mode_valid()
    dcd28191be9b hugetlbfs: fix null-ptr-deref in hugetlbfs_parse_param()
    efd025f32fce clk: st: Fix memory leak in st_of_quadfs_setup()
    1c6447d0fc68 media: si470x: Fix use-after-free in si470x_int_in_callback()
    a63a1ae13469 mmc: renesas_sdhi: better reset from HS400 mode
    58e21146c0f9 mmc: f-sdh30: Add quirks for broken timeout clock capability
    4b737246ff50 regulator: core: fix use_count leakage when handling boot-on
    17c2eb9ce8c1 libbpf: Avoid enum forward-declarations in public API in C++ mode
    e8022da1fa2f blk-mq: fix possible memleak when register 'hctx' failed
    7d7ab25ead96 media: dvb-usb: fix memory leak in dvb_usb_adapter_init()
    2abd73433872 media: dvbdev: adopts refcnt to avoid UAF
    b42580c8d8aa media: dvb-frontends: fix leak of memory fw
    dd1e1bf916da ethtool: avoiding integer overflow in ethtool_phys_id()
    329a76635548 bpf: Prevent decl_tag from being referenced in func_proto arg
    148dcbd3af03 ppp: associate skb with a device at tx
    755eb0879224 mrp: introduce active flags to prevent UAF when applicant uninit
    037db10e3f93 net: add atomic_long_t to net_device_stats fields
    e2d60023aff4 drm/amd/display: fix array index out of bound error in bios parser
    10d713532ffc md/raid1: stop mdx_raid1 thread when raid1 array run failed
    100caacfa0ed drivers/md/md-bitmap: check the return value of md_bitmap_get_counter()
    7d86851c304a drm/sti: Use drm_mode_copy()
    dd31d7304018 drm/rockchip: Use drm_mode_copy()
    4f238212c7c0 drm/msm: Use drm_mode_copy()
    ebc3c77785dc s390/lcs: Fix return type of lcs_start_xmit()
    3ac0217ca918 s390/netiucv: Fix return type of netiucv_tx()
    eeb75f80bceb s390/ctcm: Fix return type of ctc{mp,}m_tx()
    9606bbc271ac drm/amdgpu: Fix type of second parameter in odn_edit_dpm_table() callback
    a42a23bdae61 drm/amdgpu: Fix type of second parameter in trans_msg() callback
    3cb18dea1119 igb: Do not free q_vector unless new one was allocated
    87792567d9ed wifi: brcmfmac: Fix potential shift-out-of-bounds in brcmf_fw_alloc_request()
    e7aa8a4709d4 hamradio: baycom_epp: Fix return type of baycom_send_packet()
    5b0b6553bf4a net: ethernet: ti: Fix return type of netcp_ndo_start_xmit()
    6d935a02658b bpf: make sure skb->len != 0 when redirecting to a tunneling device
    ebc2fb6afc98 qed (gcc13): use u16 for fid to be big enough
    648cdb8bf376 drm/amd/display: prevent memory leak
    c69bc8e34df4 ipmi: fix memleak when unload ipmi driver
    be4cd23cd36b ASoC: codecs: rt298: Add quirk for KBL-R RVP platform
    8af52492717e wifi: ar5523: Fix use-after-free on ar5523_cmd() timed out
    1824ccabee54 wifi: ath9k: verify the expected usb_endpoints are present
    2e8bb402b060 brcmfmac: return error when getting invalid max_flowrings from dongle
    6cd4865bb4be drm/etnaviv: add missing quirks for GC300
    4fd3a11804c8 hfs: fix OOB Read in __hfs_brec_find
    6edd0cdee578 acct: fix potential integer overflow in encode_comp_t()
    ec93b5430ec0 nilfs2: fix shift-out-of-bounds due to too large exponent of block size
    d464b035c061 nilfs2: fix shift-out-of-bounds/overflow in nilfs_sb2_bad_offset()
    b0b83d3f3ffa ACPICA: Fix error code path in acpi_ds_call_control_method()
    911999b19373 fs: jfs: fix shift-out-of-bounds in dbDiscardAG
    40dba68d4182 udf: Avoid double brelse() in udf_rename()
    3e997e4ce8ae fs: jfs: fix shift-out-of-bounds in dbAllocAG
    dcbc51d31d0a binfmt_misc: fix shift-out-of-bounds in check_special_flags
    22c1d8f24cdb x86/hyperv: Remove unregister syscore call from Hyper-V cleanup
    9b267051c82a video: hyperv_fb: Avoid taking busy spinlock on panic path
    0461a8c278b8 arm64: make is_ttbrX_addr() noinstr-safe
    5a52380b8193 rcu: Fix __this_cpu_read() lockdep warning in rcu_force_quiescent_state()
    906249381167 net: stream: purge sk_error_queue in sk_stream_kill_queues()
    7c3a20bfd23b myri10ge: Fix an error handling path in myri10ge_probe()
    3c973736909f rxrpc: Fix missing unlock in rxrpc_do_sendmsg()
    5c544c7c6afa net_sched: reject TCF_EM_SIMPLE case for complex ematch module
    a39b4de0804f mailbox: zynq-ipi: fix error handling while device_register() fails
    821be5a5ab09 skbuff: Account for tail adjustment during pull operations
    6736b61ecf23 openvswitch: Fix flow lookup to use unmasked key
    ea14220031b3 selftests: devlink: fix the fd redirect in dummy_reporter_test
    57ce1a36c060 rtc: mxc_v2: Add missing clk_disable_unprepare()
    1e2a27dab1e5 igc: Set Qbv start_time and end_time to end_time if not being configured in GCL
    edb995b5ec32 igc: Lift TAPRIO schedule restriction
    b48d3db89161 igc: recalculate Qbv end_time by considering cycle time
    3f2a944c23e8 igc: Add checking for basetime less than zero
    a0e2295c2aed igc: Use strict cycles for Qbv scheduling
    413fe82420aa igc: Enhance Qbv scheduling by using first flag bit
    a8f9698a05b5 net: add a helper to avoid issues with HW TX timestamping and SO_TXTIME
    ae5d96bae3cc net: igc: use skb_csum_is_sctp instead of protocol check
    4794d07fe635 net: add inline function skb_csum_is_sctp
    67349025f00d net: switch to storing KCOV handle directly in sk_buff
    3d5f83a62e82 r6040: Fix kmemleak in probe and remove
    aea9e64dec2c nfc: pn533: Clear nfc_target before being used
    6939f84e5369 mISDN: hfcmulti: don't call dev_kfree_skb/kfree_skb() under spin_lock_irqsave()
    b58c8719666d mISDN: hfcpci: don't call dev_kfree_skb/kfree_skb() under spin_lock_irqsave()
    30e0a066b611 mISDN: hfcsusb: don't call dev_kfree_skb/kfree_skb() under spin_lock_irqsave()
    2a930b75bf93 net: macsec: fix net device access prior to holding a lock
    c1207219a4bf nfsd: under NFSv4.1, fix double svc_xprt_put on rpc_create failure
    452e85cc3edf NFSD: Remove spurious cb_setup_err tracepoint
    09c007e23923 rtc: pcf85063: fix pcf85063_clkout_control
    e9453c13ae9c rtc: pic32: Move devm_rtc_allocate_device earlier in pic32_rtc_probe()
    34836c592345 rtc: st-lpc: Add missing clk_disable_unprepare in st_rtc_probe()
    8e65e707640b netfilter: flowtable: really fix NAT IPv6 offload
    1f5571cb1d7b powerpc/pseries/eeh: use correct API for error log size
    9dc96fee2648 powerpc/eeh: Drop redundant spinlock initialization
    12654b7d8deb remoteproc: qcom_q6v5_pas: Fix missing of_node_put() in adsp_alloc_memory_region()
    be5816b27bff remoteproc: qcom_q6v5_pas: detach power domains on remove
    582dd58a186c remoteproc: qcom_q6v5_pas: disable wakeup on probe fail or remove
    e4539eb5c0c3 remoteproc: sysmon: fix memory leak in qcom_add_sysmon_subdev()
    6a65f4644b65 pwm: sifive: Call pwm_sifive_update_clock() while mutex is held
    57f215a23167 iommu/sun50i: Remove IOMMU_DOMAIN_IDENTITY
    dc02d8e59d36 selftests/powerpc: Fix resource leaks
    464506de9bb3 powerpc/hv-gpci: Fix hv_gpci event list
    0abfe735be54 powerpc/83xx/mpc832x_rdb: call platform_device_put() in error case in of_fsl_spi_probe()
    da1a33795dfd powerpc/perf: callchain validate kernel stack pointer bounds
    8d2ff5b3e28d kbuild: refactor single builds of *.ko
    e3bdda22b49e kbuild: unify modules(_install) for in-tree and external modules
    e2155129599f kbuild: remove unneeded mkdir for external modules_install
    195cb98861dc powerpc/xive: add missing iounmap() in error path in xive_spapr_populate_irq_data()
    f0bd6504e580 powerpc/xmon: Fix -Wswitch-unreachable warning in bpt_cmds
    76957b6aed99 powerpc/xmon: Enable breakpoints on 8xx
    81c8bbf5b2b5 cxl: Fix refcount leak in cxl_calc_capp_routing
    40b4be399e0d powerpc/52xx: Fix a resource leak in an error handling path
    7fded04fbbb8 macintosh/macio-adb: check the return value of ioremap()
    2ac0a7059b7b macintosh: fix possible memory leak in macio_add_one_device()
    0d240ac0e4c3 iommu/fsl_pamu: Fix resource leak in fsl_pamu_probe()
    03f51c729975 iommu/amd: Fix pci device refcount leak in ppr_notifier()
    3929576f10ea rtc: pcf85063: Fix reading alarm
    aaed333e2237 rtc: snvs: Allow a time difference on clock register read
    f0c36ea4248a rtc: cmos: Disable ACPI RTC event on removal
    ca8cb20c2254 rtc: cmos: Rename ACPI-related functions
    9f9923baa291 rtc: cmos: Eliminate forward declarations of some functions
    462db582e8eb rtc: cmos: Call rtc_wake_setup() from cmos_do_probe()
    14ad1353c515 rtc: cmos: Call cmos_wake_setup() from cmos_do_probe()
    45b96601a6ec rtc: cmos: fix build on non-ACPI platforms
    f2ece2c722be rtc: cmos: Fix wake alarm breakage
    0bcfccb48696 rtc: cmos: Fix event handler registration ordering issue
    5814d77e2f72 rtc: rtc-cmos: Do not check ACPI_FADT_LOW_POWER_S0
    490b233677de dmaengine: idxd: Fix crc_val field for completion record
    a42e95547522 pwm: tegra: Improve required rate calculation
    ddd2bb08bd99 include/uapi/linux/swab: Fix potentially missing __always_inline
    c2a98433421e phy: usb: s2 WoL wakeup_count not incremented for USB->Eth devices
    ca31ad0932af iommu/sun50i: Fix flush size
    147af0c1e7fd iommu/sun50i: Fix R/W permission check
    3a63c4ff57bf iommu/sun50i: Consider all fault sources for reset
    160b92ab4a25 iommu/sun50i: Fix reset release
    aeef93416c09 RDMA/siw: Fix pointer cast warning
    5beadb55f4e3 power: supply: fix null pointer dereferencing in power_supply_get_battery_info
    72283ecfdc84 HSI: omap_ssi_core: Fix error handling in ssi_init()
    73ca3b19d902 perf symbol: correction while adjusting symbol
    c8e77bd7499f perf trace: Handle failure when trace point folder is missed
    bd29da58046a perf trace: Use macro RAW_SYSCALL_ARGS_NUM to replace number
    6364577ae225 perf trace: Return error if a system call doesn't exist
    1d6d90994a8d power: supply: fix residue sysfs file in error handle route of __power_supply_register()
    ae2eb995abb9 HSI: omap_ssi_core: fix possible memory leak in ssi_probe()
    6ba4b00f8837 HSI: omap_ssi_core: fix unbalanced pm_runtime_disable()
    ee13e2aec330 fbdev: uvesafb: Fixes an error handling path in uvesafb_probe()
    164857bc0223 fbdev: vermilion: decrease reference count in error path
    71bca42bc44f fbdev: via: Fix error in via_core_init()
    3922415e4c3f fbdev: pm2fb: fix missing pci_disable_device()
    f279a7af799d fbdev: ssd1307fb: Drop optional dependency
    c56c1449ccc3 thermal/drivers/imx8mm_thermal: Validate temperature range
    86fa7bb4e2d5 samples: vfio-mdev: Fix missing pci_disable_device() in mdpy_fb_probe()
    962f869b3678 tracing/hist: Fix issue of losting command info in error_log
    b7bf15aa1973 usb: storage: Add check for kcalloc
    9ac541a0898e i2c: ismt: Fix an out-of-bounds bug in ismt_access()
    61df25c41b8e i2c: mux: reg: check return value after calling platform_get_resource()
    6d79546622ba gpiolib: cdev: fix NULL-pointer dereferences
    aeee7ad0897f gpiolib: Get rid of redundant 'else'
    37d3de40c1ff vme: Fix error not catched in fake_init()
    b9fa01fb3140 staging: rtl8192e: Fix potential use-after-free in rtllib_rx_Monitor()
    daa8045a9913 staging: rtl8192u: Fix use after free in ieee80211_rx()
    46b3885c8cb4 i2c: pxa-pci: fix missing pci_disable_device() on error in ce4100_i2c_probe
    c46db6088bcc chardev: fix error handling in cdev_device_add()
    7b289b791a59 mcb: mcb-parse: fix error handing in chameleon_parse_gdd()
    0d1c2c8db289 drivers: mcb: fix resource leak in mcb_probe()
    e88b89a096af usb: gadget: f_hid: fix refcount leak on error path
    1b6a53e447ec usb: gadget: f_hid: fix f_hidg lifetime vs cdev
    52302c30b218 usb: gadget: f_hid: optional SETUP/SET_REPORT mode
    c3767f81056b usb: roles: fix of node refcount leak in usb_role_switch_is_parent()
    07905a92497c counter: stm32-lptimer-cnt: fix the check on arr and cmp registers update
    bb5e9402b24e iio: adis: add '__adis_enable_irq()' implementation
    3feb8fd8bf93 iio:imu:adis: Move exports into IIO_ADISLIB namespace
    83e321a2ec4d iio: adis: stylistic changes
    d1b73eebc70d iio: adis: handle devices that cannot unmask the drdy pin
    8eb2a679c603 iio:imu:adis: Use IRQF_NO_AUTOEN instead of irq request then disable
    50aaa6b1742c genirq: Add IRQF_NO_AUTOEN for request_irq/nmi()
    6b22e715bb5b iio: temperature: ltc2983: make bulk write buffer DMA-safe
    0f63c0ddc2ea cxl: fix possible null-ptr-deref in cxl_pci_init_afu|adapter()
    170e8c2d2b61 cxl: fix possible null-ptr-deref in cxl_guest_init_afu|adapter()
    d34742245e43 firmware: raspberrypi: fix possible memory leak in rpi_firmware_probe()
    0f67ed565f20 misc: sgi-gru: fix use-after-free error in gru_set_context_option, gru_fault and gru_handle_user_call_os
    57c857353d50 misc: tifm: fix possible memory leak in tifm_7xx1_switch_media()
    a40e1b0a922a ocxl: fix pci device refcount leak when calling get_function_0()
    7525741cb302 misc: ocxl: fix possible name leak in ocxl_file_register_afu()
    0b5a89e8bce1 test_firmware: fix memory leak in test_firmware_init()
    d7c4331c073a serial: sunsab: Fix error handling in sunsab_init()
    a26b13d158ae serial: altera_uart: fix locking in polling mode
    8ff88d007f1b tty: serial: altera_uart_{r,t}x_chars() need only uart_port
    af320d1a3cef tty: serial: clean up stop-tx part in altera_uart_tx_chars()
    07f4ca68b0f6 serial: pch: Fix PCI device refcount leak in pch_request_dma()
    46d08b0e0be5 serial: pl011: Do not clear RX FIFO & RX interrupt in unthrottle.
    d5b16eb076f4 serial: amba-pl011: avoid SBSA UART accessing DMACR register
    fab27438abe2 usb: typec: tipd: Fix spurious fwnode_handle_put in error path
    d3b6c28a71f1 usb: typec: tcpci: fix of node refcount leak in tcpci_register_port()
    1ca02df871ad usb: typec: Check for ops->exit instead of ops->enter in altmode_exit
    5d2b286eb034 staging: vme_user: Fix possible UAF in tsi148_dma_list_add
    775a6f8bed87 usb: fotg210-udc: Fix ages old endianness issues
    2fcb7c7d5219 uio: uio_dmem_genirq: Fix deadlock between irq config and handling
    9bf7a0b2b15c uio: uio_dmem_genirq: Fix missing unlock in irq configuration
    27b612bd09bd vfio: platform: Do not pass return buffer to ACPI _RST method
    18a720064695 class: fix possible memory leak in __class_register()
    7e74868a38b4 serial: tegra: Read DMA status before terminating
    fce9890e1be4 drivers: dio: fix possible memory leak in dio_init()
    d21714134505 IB/IPoIB: Fix queue count inconsistency for PKEY child interfaces
    aa96aff394a5 hwrng: geode - Fix PCI device refcount leak
    5998e5c30e83 hwrng: amd - Fix PCI device refcount leak
    38da26c8552e crypto: img-hash - Fix variable dereferenced before check 'hdev->req'
    15ca14894018 RDMA/hns: Fix page size cap from firmware
    83b2c33b53b2 RDMA/hns: Fix PBL page MTR find
    73ab1c956a32 orangefs: Fix sysfs not cleanup when dev init failed
    0c53bb661f0a RDMA/srp: Fix error return code in srp_parse_options()
    7cbf2fc276f7 RDMA/hfi1: Fix error return code in parse_platform_config()
    61c5b47c5b28 riscv/mm: add arch hook arch_clear_hugepage_flags
    09814c669d18 crypto: omap-sham - Use pm_runtime_resume_and_get() in omap_sham_probe()
    75c7b5d6b534 crypto: amlogic - Remove kcalloc without check
    357f3e175630 RDMA/nldev: Fix failure to send large messages
    25a8dabaabf6 f2fs: avoid victim selection from previous victim section
    d1b85d288345 RDMA/nldev: Add checks for nla_nest_start() in fill_stat_counter_qps()
    ad27f74e901f scsi: snic: Fix possible UAF in snic_tgt_create()
    22e8c7a56bb1 scsi: fcoe: Fix transport not deattached when fcoe_if_init() fails
    f4ba143b04a1 scsi: ipr: Fix WARNING in ipr_init()
    b520a3279681 scsi: scsi_debug: Fix possible name leak in sdebug_add_host_helper()
    9d0ad1e2bae7 scsi: fcoe: Fix possible name leak when device_register() fails
    2b142f6046ce scsi: scsi_debug: Fix a warning in resp_report_zones()
    eaa71cdae88a scsi: scsi_debug: Fix a warning in resp_verify()
    ac5cfe8bbbf9 scsi: hpsa: Fix possible memory leak in hpsa_add_sas_device()
    f671a3f2869d scsi: hpsa: Fix error handling in hpsa_add_sas_host()
    ce1a69cc8500 scsi: mpt3sas: Fix possible resource leaks in mpt3sas_transport_port_add()
    7ccfc2bb5879 padata: Fix list iterator in padata_do_serial()
    8e0681dd4eee padata: Always leave BHs disabled when running ->parallel()
    4a99e6a1049c crypto: tcrypt - Fix multibuffer skcipher speed test mem leak
    c808edbf580b scsi: hpsa: Fix possible memory leak in hpsa_init_one()
    6bb5a62bfd62 RDMA/rxe: Fix NULL-ptr-deref in rxe_qp_do_cleanup() when socket create failed
    164fa80330a8 RDMA/hns: fix memory leak in hns_roce_alloc_mr()
    3d47544ba0c7 crypto: ccree - Make cc_debugfs_global_fini() available for module init function
    34bab85c2e1f RDMA/hfi: Decrease PCI device reference count in error path
    d8f2a0bc52a8 PCI: Check for alloc failure in pci_request_irq()
    8b5f1af3352a RDMA/hns: Fix ext_sge num error when post send
    cc5e9153586a RDMA/hns: Repacing 'dseg_len' by macros in fill_ext_sge_inl_data()
    ed97ade655ea crypto: hisilicon/qm - add missing pci_dev_put() in q_num_set()
    2dfe1d221e1a crypto: cryptd - Use request context instead of stack for sub-request
    1ab9e15b1441 crypto: ccree - Remove debugfs when platform_driver_register failed
    33260f4c3ed3 scsi: scsi_debug: Fix a warning in resp_write_scat()
    917bf4c0a76d RDMA/siw: Set defined status for work completion with undefined status
    237a8936d621 RDMA/nldev: Return "-EAGAIN" if the cm_id isn't from expected port
    75af03fdf35a RDMA/siw: Fix immediate work request flush to completion queue
    ef8e236832fb f2fs: fix normal discard process
    9a32aa87a25d apparmor: Fix memleak in alloc_ns()
    417ef568a725 crypto: rockchip - rework by using crypto_engine
    6cd8bbb089be crypto: rockchip - delete unneeded variable initialization
    de041a2e7091 crypto: rockchip - remove non-aligned handling
    0971bc99d124 crypto: rockchip - better handle cipher key
    b0b9635f09e0 crypto: rockchip - add fallback for ahash
    fbd5f112dc9d crypto: rockchip - add fallback for cipher
    86f1e7f46ba9 crypto: rockchip - do not store mode globally
    a13c0ff862af crypto: rockchip - do not do custom power management
    f1acf7e69355 f2fs: Fix the race condition of resize flag between resizefs
    c42d8120bf47 PCI: pci-epf-test: Register notifier if only core_init_notifier is enabled
    16db9aaa4151 RDMA/core: Fix order of nldev_exit call
    9784b01eb46c PCI: dwc: Fix n_fts[] array overrun
    6962f682d0c3 apparmor: Use pointer to struct aa_label for lbs_cred
    f4c917a4b030 scsi: core: Fix a race between scsi_done() and scsi_timeout()
    3bebfa5f9345 crypto: nitrox - avoid double free on error path in nitrox_sriov_init()
    ee3cffc38efe crypto: sun8i-ss - use dma_addr instead u32
    bf4d7c66a18a apparmor: Fix abi check to include v8 abi
    78629ca972ac apparmor: fix lockdep warning when removing a namespace
    935d86b29093 apparmor: fix a memleak in multi_transaction_new()
    f694e627c603 stmmac: fix potential division by 0
    815b961c71af Bluetooth: RFCOMM: don't call kfree_skb() under spin_lock_irqsave()
    4002180e0761 Bluetooth: hci_core: don't call kfree_skb() under spin_lock_irqsave()
    82256faaeb3a Bluetooth: hci_bcsp: don't call kfree_skb() under spin_lock_irqsave()
    33af776a8d98 Bluetooth: hci_h5: don't call kfree_skb() under spin_lock_irqsave()
    5991402fe091 Bluetooth: hci_ll: don't call kfree_skb() under spin_lock_irqsave()
    0169acb41bc8 Bluetooth: hci_qca: don't call kfree_skb() under spin_lock_irqsave()
    f7dc27702b59 Bluetooth: btusb: don't call kfree_skb() under spin_lock_irqsave()
    214346a51724 sctp: sysctl: make extra pointers netns aware
    13286ad1c7c4 ntb_netdev: Use dev_kfree_skb_any() in interrupt context
    4df544f592ad net: lan9303: Fix read error execution path
    39b48a92edaf can: tcan4x5x: Remove invalid write in clear_interrupts
    334c9fb89232 net: amd-xgbe: Check only the minimum speed for active/passive cables
    03ea9ba5fd23 net: amd-xgbe: Fix logic around active and passive cables
    8eb5f8ae5132 net: amd: lance: don't call dev_kfree_skb() under spin_lock_irqsave()
    ee3b1364af26 hamradio: don't call dev_kfree_skb() under spin_lock_irqsave()
    b242358a27a7 net: ethernet: dnet: don't call dev_kfree_skb() under spin_lock_irqsave()
    decede59ea06 net: emaclite: don't call dev_kfree_skb() under spin_lock_irqsave()
    c43def060cae net: apple: bmac: don't call dev_kfree_skb() under spin_lock_irqsave()
    0e23250149f4 net: apple: mace: don't call dev_kfree_skb() under spin_lock_irqsave()
    91f09a776ae3 net/tunnel: wait until all sk_user_data reader finish before releasing the sock
    51e2d1b84aca net: farsync: Fix kmemleak when rmmods farsync
    0b3f452d0cf7 ethernet: s2io: don't call dev_kfree_skb() under spin_lock_irqsave()
    2b4af99b4486 of: overlay: fix null pointer dereferencing in find_dup_cset_node_entry() and find_dup_cset_prop()
    14b349a15c29 drivers: net: qlcnic: Fix potential memory leak in qlcnic_sriov_init()
    787d1bae7f11 net: stmmac: selftests: fix potential memleak in stmmac_test_arpoffload()
    8ed99944572b net: defxx: Fix missing err handling in dfx_init()
    e2227eee7ae1 net: vmw_vsock: vmci: Check memcpy_from_msg()
    3e8fd1d0fab4 clk: socfpga: Fix memory leak in socfpga_gate_init()
    4b672ee71c1c clk: socfpga: use clk_hw_register for a5/c5
    ae8190f19f96 clk: socfpga: clk-pll: Remove unused variable 'rc'
    782d0444eac9 blktrace: Fix output non-blktrace event when blk_classic option enabled
    2484f1596480 wifi: brcmfmac: Fix error return code in brcmf_sdio_download_firmware()
    f89c0fbb8bdb wifi: rtl8xxxu: Fix the channel width reporting
    d43003724879 wifi: rtl8xxxu: Add __packed to struct rtl8723bu_c2h
    7f3b4fa48222 spi: spi-gpio: Don't set MOSI as an input if not 3WIRE mode
    da13355bb996 clk: samsung: Fix memory leak in _samsung_clk_register_pll()
    d9b37ea8869e media: coda: Add check for kmalloc
    35ddd00b3658 media: coda: Add check for dcoda_iram_alloc
    6fdb8661b964 media: c8sectpfe: Add of_node_put() when breaking out of loop
    0b1e96d3fd6a mmc: mmci: fix return value check of mmc_add_host()
    1922def5cb13 mmc: wbsd: fix return value check of mmc_add_host()
    63400da6cd37 mmc: via-sdmmc: fix return value check of mmc_add_host()
    64b2c441171f mmc: meson-gx: fix return value check of mmc_add_host()
    fb3d596267a9 mmc: omap_hsmmc: fix return value check of mmc_add_host()
    00ac0f5f9592 mmc: atmel-mci: fix return value check of mmc_add_host()
    9bedf64dda84 mmc: wmt-sdmmc: fix return value check of mmc_add_host()
    3049a3b927a4 mmc: vub300: fix return value check of mmc_add_host()
    aabbedcb6c9a mmc: toshsd: fix return value check of mmc_add_host()
    7fa922c7a3dd mmc: rtsx_usb_sdmmc: fix return value check of mmc_add_host()
    b896a9b7a0c3 mmc: pxamci: fix return value check of mmc_add_host()
    3904eb97bb78 mmc: mxcmmc: fix return value check of mmc_add_host()
    7c3b301ca8b0 mmc: moxart: fix return value check of mmc_add_host()
    4a6e5d022280 mmc: alcor: fix return value check of mmc_add_host()
    81ea3d964f2b NFSv4.x: Fail client initialisation if state manager thread can't run
    3fbc3c78fa32 SUNRPC: Fix missing release socket in rpc_sockname()
    be7d90fc3a8f xprtrdma: Fix regbuf data not freed in rpcrdma_req_create()
    064912935921 ALSA: mts64: fix possible null-ptr-defer in snd_mts64_interrupt
    7df1fbe49bd2 media: saa7164: fix missing pci_disable_device()
    46a9b31369d7 ALSA: pcm: Set missing stop_operating flag at undoing trigger start
    be719496ae6a bpf, sockmap: fix race in sock_map_free()
    8c3ef38a0d58 hwmon: (jc42) Restore the min/max/critical temperatures on resume
    e7720ef53b23 hwmon: (jc42) Convert register access and caching to regmap/regcache
    6a03c31d08f9 regulator: core: fix resource leak in regulator_register()
    74ac7c9ee2d4 configfs: fix possible memory leak in configfs_create_dir()
    0cf92d235692 hsr: Synchronize sequence number updates.
    c671f2d10d83 hsr: Synchronize sending frames to have always incremented outgoing seq nr.
    28921ec555d5 hsr: Disable netpoll.
    8cee8543f002 net: hsr: generate supervision frame without HSR/PRP tag
    38d13a2a9e52 hsr: Add a rcu-read lock to hsr_forward_skb().
    ee4425e81d9b clk: qcom: clk-krait: fix wrong div2 functions
    6f25402d8a00 regulator: core: fix module refcount leak in set_supply()
    f532db69ab13 wifi: mt76: fix coverity overrun-call in mt76_get_txpower()
    4ecb7a6e61b1 wifi: cfg80211: Fix not unregister reg_pdev when load_builtin_regdb_keys() fails
    b2c0b94f4837 wifi: mac80211: fix memory leak in ieee80211_if_add()
    b0163248dbaf spi: spidev: mask SPI_CS_HIGH in SPI_IOC_RD_MODE
    ab19f402a12d bonding: uninitialized variable in bond_miimon_inspect()
    c58df40e3e67 bpf, sockmap: Fix data loss caused by using apply_bytes on ingress redirect
    28e4a763cd4a bpf, sockmap: Fix repeated calls to sock_put() when msg has more_data
    429a2a4258d5 netfilter: conntrack: set icmpv6 redirects as RELATED
    cd0e9ee50cb5 ASoC: pcm512x: Fix PM disable depth imbalance in pcm512x_probe
    7c1ddf7c664b drm/amdgpu: Fix PCI device refcount leak in amdgpu_atrm_get_bios()
    3991d98a8a07 drm/radeon: Fix PCI device refcount leak in radeon_atrm_get_bios()
    a012cdd4fd62 drm/amd/pm/smu11: BACO is supported when it's in BACO state
    57491967ad8f ASoC: mediatek: mt8173: Enable IRQ when pdata is ready
    52c9ad56c19d ASoC: mediatek: mt8173: Fix debugfs registration for components
    ae966649f665 wifi: iwlwifi: mvm: fix double free on tx path.
    ae66695aa1eb ALSA: asihpi: fix missing pci_disable_device()
    5458bc0f9df6 NFS: Fix an Oops in nfs_d_automount()
    bc60485b9347 NFSv4: Fix a deadlock between nfs4_open_recover_helper() and delegreturn
    d16d7870fd8f NFSv4.2: Fix initialisation of struct nfs4_label
    15feece7afcf NFSv4.2: Fix a memory stomp in decode_attr_security_label
    58a1023eb5f7 NFSv4.2: Clear FATTR4_WORD2_SECURITY_LABEL when done decoding
    193691ff5b76 ASoC: mediatek: mtk-btcvsd: Add checks for write and read of mtk_btcvsd_snd
    6013c3de9557 ASoC: dt-bindings: wcd9335: fix reset line polarity in example
    cf2cbca71472 drm/tegra: Add missing clk_disable_unprepare() in tegra_dc_probe()
    54ab1276001b media: s5p-mfc: Add variant data for MFC v7 hardware for Exynos 3250 SoC
    559891d430e3 media: dvb-usb: az6027: fix null-ptr-deref in az6027_i2c_xfer()
    e34cf6caccf5 media: dvb-core: Fix ignored return value in dvb_register_frontend()
    05be5d56f7ad pinctrl: pinconf-generic: add missing of_node_put()
    9916497a1239 clk: imx: replace osc_hdmi with dummy
    dabf7b675c16 media: imon: fix a race condition in send_packet()
    14d85b600bb1 media: vimc: Fix wrong function called when vimc_init() fails
    4518d7cc38b7 ASoC: qcom: Add checks for devm_kcalloc
    b73fac67f355 drbd: fix an invalid memory access caused by incorrect use of list iterator
    1d0c2b762dad mtd: maps: pxa2xx-flash: fix memory leak in probe
    7d1e0d237c4c bonding: fix link recovery in mode 2 when updelay is nonzero
    3725a8f26bdb drm/amdgpu: fix pci device refcount leak
    f4d70c139d31 clk: rockchip: Fix memory leak in rockchip_clk_register_pll()
    a065be02433e regulator: core: use kfree_const() to free space conditionally
    d7198b63cbee ALSA: seq: fix undefined behavior in bit shift for SNDRV_SEQ_FILTER_USE_EVENT
    88550b444647 ALSA: pcm: fix undefined behavior in bit shift for SNDRV_PCM_RATE_KNOT
    ad2d0a3dc224 HID: hid-sensor-custom: set fixed size for custom attributes
    0d6ae25da5cb bpf: Move skb->len == 0 checks into __bpf_redirect
    9920e87a84ec inet: add READ_ONCE(sk->sk_bound_dev_if) in inet_csk_bind_conflict()
    49aa080951aa media: videobuf-dma-contig: use dma_mmap_coherent
    847006001953 media: platform: exynos4-is: Fix error handling in fimc_md_init()
    49060c0da57a media: solo6x10: fix possible memory leak in solo_sysfs_init()
    0369af6fe33d media: vidtv: Fix use-after-free in vidtv_bridge_dvb_init()
    3afd738e7712 Input: elants_i2c - properly handle the reset GPIO when power is off
    0919982a1744 mtd: lpddr2_nvm: Fix possible null-ptr-deref
    effbf636162b wifi: ath10k: Fix return value in ath10k_pci_init()
    adf03c309968 ima: Fix misuse of dereference of pointer in template_desc_init_fields()
    3bd737289c26 integrity: Fix memory leakage in keyring allocation error path
    102df01caf5e drm/fourcc: Fix vsub/hsub for Q410 and Q401
    6f6a99fb620d drm/fourcc: Add packed 10bit YUV 4:2:0 format
    85273b4a7076 amdgpu/pm: prevent array underflow in vega20_odn_edit_dpm_table()
    f48c474efe05 regulator: core: fix unbalanced of node refcount in regulator_dev_lookup()
    21a1409e8cf7 ASoC: pxa: fix null-pointer dereference in filter()
    698bbaf0b4ed drm/mediatek: Modify dpi power on/off sequence.
    b4b30f56ec51 drm/radeon: Add the missed acpi_put_table() to fix memory leak
    cea79ae89b6b rxrpc: Fix ack.bufferSize to be 0 when generating an ack
    00fce49d142d net, proc: Provide PROC_FS=n fallback for proc_create_net_single_write()
    3d5cab726e3b media: camss: Clean up received buffers on failed start of streaming
    61c96d99d42c wifi: rsi: Fix handling of 802.3 EAPOL frames sent via control port
    624438195c32 Input: joystick - fix Kconfig warning for JOYSTICK_ADC
    330bc5533e8a mtd: Fix device name leak when register device failed in add_mtd_device()
    1a79539f4e8b clk: qcom: gcc-sm8250: Use retention mode for USB GDSCs
    e1989d808b86 bpf: propagate precision across all frames, not just the last one
    cdd73a5ed084 bpf: Check the other end of slot_type for STACK_SPILL
    42b2b7382aab bpf: propagate precision in ALU/ALU64 operations
    7fc38327fd64 media: platform: exynos4-is: fix return value check in fimc_md_probe()
    f9d19f3a044c media: vivid: fix compose size exceed boundary
    72e8d9c731a7 bpf: Fix slot type check in check_stack_write_var_off
    d959ff7fa9e5 drm/msm/hdmi: drop unused GPIO support
    b12f354fe61f drm/msm/hdmi: switch to drm_bridge_connector
    c4b035b1f036 ima: Handle -ESTALE returned by ima_filter_rule_match()
    d5b227f0d28d ima: Fix fall-through warnings for Clang
    576828e59a0e drm/panel/panel-sitronix-st7701: Remove panel on DSI attach failure
    f1aa976857a3 spi: Update reference to struct spi_controller
    dd958c7f3e77 clk: renesas: r9a06g032: Repair grave increment error
    110bf15825ed drm/rockchip: lvds: fix PM usage counter unbalance in poweron
    1874f9143fba can: kvaser_usb: Compare requested bittiming parameters with actual parameters in do_set_{,data}_bittiming
    669bdf121fa4 can: kvaser_usb: Add struct kvaser_usb_busparams
    a50ad6772f6f can: kvaser_usb_leaf: Fix bogus restart events
    cd56718e7cb6 can: kvaser_usb_leaf: Fix wrong CAN state after stopping
    f83742285f77 can: kvaser_usb_leaf: Fix improved state not being reported
    fbd155fe14c8 can: kvaser_usb_leaf: Set Warning state even without bus errors
    96af45b1b46e can: kvaser_usb: kvaser_usb_leaf: Handle CMD_ERROR_EVENT
    caea629409dc can: kvaser_usb: kvaser_usb_leaf: Rename {leaf,usbcan}_cmd_error_event to {leaf,usbcan}_cmd_can_error_event
    eafcf1b5997e can: kvaser_usb: kvaser_usb_leaf: Get capabilities from device
    cd50258e9c28 can: kvaser_usb: do not increase tx statistics when sending error message frames
    580c79fd57f3 media: exynos4-is: don't rely on the v4l2_async_subdev internals
    c93cac58a7e5 media: exynos4-is: Use v4l2_async_notifier_add_fwnode_remote_subdev
    4882492ad3f0 venus: pm_helpers: Fix error check in vcodec_domains_get()
    86d531c1d794 media: i2c: ad5820: Fix error path
    83f7e3c98871 media: coda: jpeg: Add check for kmalloc
    7e0ba56c7e5f pata_ipx4xx_cf: Fix unsigned comparison with less than zero
    85b297d7986c libbpf: Fix null-pointer dereference in find_prog_by_sec_insn()
    c61650b869e0 libbpf: Fix use-after-free in btf_dump_name_dups
    26ce3f0c8f61 drm/bridge: adv7533: remove dynamic lane switching from adv7533 bridge
    9b6851c18263 wifi: rtl8xxxu: Fix reading the vendor of combo chips
    98d9172822dc wifi: ath9k: hif_usb: Fix use-after-free in ath9k_hif_usb_reg_in_cb()
    c3fb3e9a2c0c wifi: ath9k: hif_usb: fix memory leak of urbs in ath9k_hif_usb_dealloc_tx_urbs()
    53915ecc43c5 rapidio: devices: fix missing put_device in mport_cdev_open
    cff9fefdfbf5 hfs: Fix OOB Write in hfs_asc2mac
    93cdd1263691 relay: fix type mismatch when allocating memory in relay_create_buf()
    bbaa9ca06329 eventfd: change int to __u64 in eventfd_signal() ifndef CONFIG_EVENTFD
    5ee850645e42 rapidio: fix possible UAF when kfifo_alloc() fails
    ad4842634d68 fs: sysv: Fix sysv_nblocks() returns wrong value
    6f8ef1de8c65 MIPS: OCTEON: warn only once if deprecated link status is being used
    7b88747d6d98 MIPS: BCM63xx: Add check for NULL for clk in clk_enable
    d4c38ee665a2 platform/x86: intel_scu_ipc: fix possible name leak in __intel_scu_ipc_register()
    17cd8c46cbec platform/x86: mxm-wmi: fix memleak in mxm_wmi_call_mx[ds|mx]()
    f983afc4326c PM: runtime: Do not call __rpm_callback() from rpm_idle()
    2cbbd78e08bc PM: runtime: Improve path in rpm_idle() when no callback
    46026bb057c3 xen/privcmd: Fix a possible warning in privcmd_ioctl_mmap_resource()
    70e7f308d7a8 x86/xen: Fix memory leak in xen_init_lock_cpu()
    fc134c355b52 x86/xen: Fix memory leak in xen_smp_intr_init{_pv}()
    95dbcb7e1c34 uprobes/x86: Allow to probe a NOP instruction with 0x66 prefix
    02617006b5a4 ACPICA: Fix use-after-free in acpi_ut_copy_ipackage_to_ipackage()
    7bc9c5ad522b clocksource/drivers/timer-ti-dm: Fix missing clk_disable_unprepare in dmtimer_systimer_init_clock()
    270700e7df96 cpu/hotplug: Make target_store() a nop when target == state
    fc89b8853aec futex: Resend potentially swallowed owner death notification
    4750cac4df68 futex: Move to kernel/futex/
    d8e7a44f488c clocksource/drivers/sh_cmt: Access registers according to spec
    0853787db28e clocksource/drivers/sh_cmt: Make sure channel clock supply is enabled
    97d9eb45ffa6 rapidio: rio: fix possible name leak in rio_register_mport()
    88fa351b20ca rapidio: fix possible name leaks when rio_add_device() fails
    2b7e59ed2e77 ocfs2: fix memory leak in ocfs2_mount_volume()
    45dabd8fe8a8 ocfs2: rewrite error handling of ocfs2_fill_super
    e403024c832b ocfs2: ocfs2_mount_volume does cleanup job before return error
    81d26aa9036a debugfs: fix error when writing negative value to atomic_t debugfs file
    f649e18c9c10 docs: fault-injection: fix non-working usage of negative values
    869a37ad6f78 lib/notifier-error-inject: fix error when writing -errno to debugfs file
    c39aa503f471 libfs: add DEFINE_SIMPLE_ATTRIBUTE_SIGNED for signed value
    0080461624e9 cpufreq: amd_freq_sensitivity: Add missing pci_dev_put()
    9346517ed2c2 genirq/irqdesc: Don't try to remove non-existing sysfs files
    d97e58f72875 nfsd: don't call nfsd_file_put from client states seqfile display
    2db53c705916 EDAC/i10nm: fix refcount leak in pci_get_dev_wrapper()
    f870d5863e8e irqchip: gic-pm: Use pm_runtime_resume_and_get() in gic_probe()
    5c0cacdd3549 platform/chrome: cros_usbpd_notify: Fix error handling in cros_usbpd_notify_init()
    0afcb759f6f6 perf/x86/intel/uncore: Fix reference count leak in __uncore_imc_init_box()
    d2afced51108 perf/x86/intel/uncore: Fix reference count leak in snr_uncore_mmio_map()
    c0539d5d474e perf/x86/intel/uncore: Fix reference count leak in hswep_has_limit_sbox()
    dac87e295cdd PNP: fix name memory leak in pnp_alloc_dev()
    e1049bf0ca5b selftests/efivarfs: Add checking of the test return value
    911773f08ce6 MIPS: vpe-cmp: fix possible memory leak while module exiting
    48d42f4464d7 MIPS: vpe-mt: fix possible memory leak while module exiting
    f5f2682d3a34 ocfs2: fix memory leak in ocfs2_stack_glue_init()
    c9a9aa02f0fa lib/fonts: fix undefined behavior in bit shift for get_default_font
    9f6ea28f295f proc: fixup uptime selftest
    d5bf025c5b71 timerqueue: Use rb_entry_safe() in timerqueue_getnext()
    2f2ae35c0012 platform/x86: huawei-wmi: fix return value calculation
    a1014fbc83e7 lib/debugobjects: fix stat count and optimize debug_objects_mem_init
    60a7a0aa9dd8 perf: Fix possible memleak in pmu_dev_alloc()
    294ed8bfc937 selftests/ftrace: event_triggers: wait longer for test_event_enable
    3ef12a4a8ef5 cpufreq: qcom-hw: Fix memory leak in qcom_cpufreq_hw_read_lut()
    aa5f2912bb2e fs: don't audit the capability check in simple_xattr_list()
    9e760e0cf28f PM: hibernate: Fix mistake in kerneldoc comment
    ef875e1c07dd alpha: fix syscall entry in !AUDUT_SYSCALL case
    1498d2723e74 cpuidle: dt: Return the correct numbers of parsed idle states
    2ff401441711 sched/uclamp: Fix relationship between uclamp and migration margin
    ca9ef12bf765 sched/fair: Cleanup task_util and capacity type
    6389c163c92b tpm/tpm_crb: Fix error message in __crb_relinquish_locality()
    5b217f4e79c0 tpm/tpm_ftpm_tee: Fix error handling in ftpm_mod_init()
    295f59cd2cde pstore: Avoid kcore oops by vmap()ing with VM_IOREMAP
    480bc6a165d6 ARM: mmp: fix timer_read delay
    d1b3164d0e11 pstore/ram: Fix error return code in ramoops_probe()
    4dad729f7c24 arm64: dts: armada-3720-turris-mox: Add missing interrupt for RTC
    872865db3b95 ARM: dts: turris-omnia: Add switch port 6 node
    c1322d5f6969 ARM: dts: turris-omnia: Add ethernet aliases
    d050513e6f59 ARM: dts: armada-39x: Fix assigned-addresses for every PCIe Root Port
    bac1a77b85e0 ARM: dts: armada-38x: Fix assigned-addresses for every PCIe Root Port
    ea907f303205 ARM: dts: armada-375: Fix assigned-addresses for every PCIe Root Port
    ea8e313bb9ba ARM: dts: armada-xp: Fix assigned-addresses for every PCIe Root Port
    697b92a648f2 ARM: dts: armada-370: Fix assigned-addresses for every PCIe Root Port
    73ab831afdc8 ARM: dts: dove: Fix assigned-addresses for every PCIe Root Port
    c2cb1683d121 arm64: dts: mediatek: mt6797: Fix 26M oscillator unit name
    126135283611 arm64: dts: mediatek: pumpkin-common: Fix devicetree warnings
    853d57e9612e arm64: dts: mt2712-evb: Fix usb vbus regulators unit names
    436ac713a4a3 arm64: dts: mt2712-evb: Fix vproc fixed regulators unit names
    148e77355797 arm64: dts: mt2712e: Fix unit address for pinctrl node
    a938c2a77492 arm64: dts: mt2712e: Fix unit_address_vs_reg warning for oscillators
    a455b0c509c9 arm64: dts: ti: k3-j721e-main: Drop dma-coherent in crypto node
    42d97a024ef6 arm64: dts: ti: k3-am65-main: Drop dma-coherent in crypto node
    359286f886fe perf/smmuv3: Fix hotplug callback leak in arm_smmu_pmu_init()
    9afac95b87fa perf: arm_dsu: Fix hotplug callback leak in dsu_pmu_init()
    5e88aec62e7f soc: ti: smartreflex: Fix PM disable depth imbalance in omap_sr_probe
    6a9a31c57887 soc: ti: knav_qmss_queue: Fix PM disable depth imbalance in knav_queue_probe
    e325b4ee414b soc: ti: knav_qmss_queue: Use pm_runtime_resume_and_get instead of pm_runtime_get_sync
    0542d56e6333 arm: dts: spear600: Fix clcd interrupt
    a8d4fb0bf10b soc: qcom: apr: Add check for idr_alloc and of_property_read_string_index
    6213df4f5fc2 soc: qcom: apr: make code more reuseable
    45d180a9f64b soc: qcom: llcc: make irq truly optional
    8fb204a4b5ac drivers: soc: ti: knav_qmss_queue: Mark knav_acc_firmwares as static
    6a2faf6fcefd ARM: dts: stm32: Fix AV96 WLAN regulator gpio property
    6d1b6dc38fe0 ARM: dts: stm32: Drop stm32mp15xc.dtsi from Avenger96
    933499bed78d objtool, kcsan: Add volatile read/write instrumentation to whitelist
    275a67e909f7 arm64: dts: qcom: msm8916: Drop MSS fallback compatible
    82baee2263b7 arm64: dts: qcom: sdm845-cheza: fix AP suspend pin bias
    82569f7e4044 arm64: dts: qcom: sdm630: fix UART1 pin bias
    4cef81dec2f1 ARM: dts: qcom: apq8064: fix coresight compatible
    5465b9a813fb arm64: dts: qcom: msm8996: fix GPU OPP table
    6cad948c9f4a arm64: dts: qcom: ipq6018-cp01-c1: use BLSPI1 pins
    60184b1437db usb: musb: remove extra check in musb_gadget_vbus_draw

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index c60ac9c1df..b405e26559 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "58d7abb88dadc31a3bdcaabc324ae015d77642b7"
-SRCREV_meta ?= "241c98f9a44c94336cc0731219a25155a9b2b094"
+SRCREV_machine ?= "bef23484a248b16734799b2e20c2cb54f10dbf02"
+SRCREV_meta ?= "c80b8535ceb3b543cbb942bf6988842440b419ad"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.162"
+LINUX_VERSION ?= "5.10.164"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 319afe7d90..8688ae1fd1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.162"
+LINUX_VERSION ?= "5.10.164"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "000c7b1d423312bee3df57ad9fb21c14aebb72a4"
-SRCREV_machine ?= "51ac36b99b75676c2091010f956157988a8d5de7"
-SRCREV_meta ?= "241c98f9a44c94336cc0731219a25155a9b2b094"
+SRCREV_machine:qemuarm ?= "6aba4eb1e717741460f622635615638ce58b959d"
+SRCREV_machine ?= "274102e69a66a9a5e5d844ab0e6f0e00a0b0317f"
+SRCREV_meta ?= "c80b8535ceb3b543cbb942bf6988842440b419ad"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 447e24845c..cffd318a7a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "380b1e992eafa722835adb09cbb5af5ff875f99f"
-SRCREV_machine:qemuarm64 ?= "5c57336460ee51401b72702b59900e488db6c43a"
-SRCREV_machine:qemumips ?= "8ab71234839a238d16fa117135de6e9b2b0c078e"
-SRCREV_machine:qemuppc ?= "1b1dea5d2e11efd49f323fd5ebcf368ad0bbb370"
-SRCREV_machine:qemuriscv64 ?= "353f388471e281c0f387436b035bfdcd2f468505"
-SRCREV_machine:qemuriscv32 ?= "353f388471e281c0f387436b035bfdcd2f468505"
-SRCREV_machine:qemux86 ?= "353f388471e281c0f387436b035bfdcd2f468505"
-SRCREV_machine:qemux86-64 ?= "353f388471e281c0f387436b035bfdcd2f468505"
-SRCREV_machine:qemumips64 ?= "d0d18a95acb1380e3f1173ff10346d98a50a596d"
-SRCREV_machine ?= "353f388471e281c0f387436b035bfdcd2f468505"
-SRCREV_meta ?= "241c98f9a44c94336cc0731219a25155a9b2b094"
+SRCREV_machine:qemuarm ?= "883d66d6ccfc4cedc3114056b093a615d52ade21"
+SRCREV_machine:qemuarm64 ?= "1ad0cb1a6e23446436925d091b1312a6c671df4e"
+SRCREV_machine:qemumips ?= "36a2c0a0bf3fb832075d04e7fad9b1ff6cfaa3c8"
+SRCREV_machine:qemuppc ?= "8cd004bdeab7d416914d014f70453395d3ef6ba1"
+SRCREV_machine:qemuriscv64 ?= "aa3e6f9612a65d12729f2ed729c421a0f29e3798"
+SRCREV_machine:qemuriscv32 ?= "aa3e6f9612a65d12729f2ed729c421a0f29e3798"
+SRCREV_machine:qemux86 ?= "aa3e6f9612a65d12729f2ed729c421a0f29e3798"
+SRCREV_machine:qemux86-64 ?= "aa3e6f9612a65d12729f2ed729c421a0f29e3798"
+SRCREV_machine:qemumips64 ?= "8280b4262663052c504b5d0f6990af84d6d3aaf4"
+SRCREV_machine ?= "aa3e6f9612a65d12729f2ed729c421a0f29e3798"
+SRCREV_meta ?= "c80b8535ceb3b543cbb942bf6988842440b419ad"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.162"
+LINUX_VERSION ?= "5.10.164"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


