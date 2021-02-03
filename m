Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web12.4355.1612322658223775225
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Feb 2021 19:24:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Jzub36qz;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id v126so22097543qkd.11
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Feb 2021 19:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2JlSxBeQaumOfl3G8AabQLb6aozAb7V7dWRTGs72teI=;
        b=Jzub36qzhTOuvdA6MHYnG+4udpLxhmNSm8RmSdE5jyz134+o7j8VE+5tRmA8/TDxrL
         L9tGF0jol9Y/YPFxfWKS/Z0ErJkNsEg8o4OUVvebfmw5Nz9ghe+3miK4v8X+3QkGRkpX
         ej/hcpwQXD+XDgf8+K1zG0OCdDJKUrjinys0AMmM08w51Msen/Vo3waVdvXWeC8RtvLD
         bK/3hNc9/qvZhaewVa6K/KFQ0J3z51ysmymIx9iWOEYkGG/NsuyVF+9QteyygwM0QXNS
         ynwboprAkXPV7JSIs+DTxvTUSDXX5UOtprLiTExP9rdGIe0Hc44HDIu+3xNUB28Tim+1
         5JAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2JlSxBeQaumOfl3G8AabQLb6aozAb7V7dWRTGs72teI=;
        b=jeH2lWSJGsl8QnKJv2ogp0BxfdjMXqmJwYDBBbD6fPNuO+5nLBHQp270eRZFCWWgld
         s7kXTUdFvj5GGl5IphHttFlxmgrY4InyB5fAaWUO9/GPLtXcxUkdXDo1RopvzGHIIspS
         SS4MeF8wUCYke+2gEW15gh7Mmh49IGmR8hYISAjHT2+ls59A6L2bbX/ZBtFY9bGPPnm0
         Sv4vBCgnCtnzea4Gc2LnmoaMpNHsZhFPBQFF5DqbytLU+zsSjOijaRFFZ/xVFExjpULU
         5pF6dZvN3q6xNnzB0A2mYzdjbbAIbQgiaBntUdGPaOLZvwX91KViY0hS4qhGAncnbKkT
         EmEA==
X-Gm-Message-State: AOAM531aMxgHIcNrqSCmmC+JjHrOtU8l1ztRJj5u5Cu9qUVYJE4TGd7G
	nNqiaw6PpJWYwlMCA0JbZdA=
X-Google-Smtp-Source: ABdhPJxYVktX2HdEHgweCw6Gq30noaH9qtlOTwropWghUqpcpDnspGT32azrI67xb/c+Q5Hx1DOvGA==
X-Received: by 2002:ae9:e897:: with SMTP id a145mr843759qkg.36.1612322657281;
        Tue, 02 Feb 2021 19:24:17 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id v12sm721821qkg.63.2021.02.02.19.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 19:24:16 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/8] linux-yocto/5.10: update to v5.10.12
Date: Tue,  2 Feb 2021 22:24:04 -0500
Message-Id: <7505122018a18556375d6a69eec68ab3dd05fa16.1612322536.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1612322536.git.bruce.ashfield@gmail.com>
References: <cover.1612322536.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    05f6d2aa7e2f Linux 5.10.12
    d5ac8304e180 printk: fix string termination for record_print_text()
    861c2e349a36 printk: fix buffer overflow potential for print_text()
    cb14bbbb7bbf tools: Factor HOSTCC, HOSTLD, HOSTAR definitions
    f472a59aa182 mm: fix a race on nr_swap_pages
    c11f7749f1fc mm/page_alloc: add a missing mm_page_alloc_zone_locked() tracepoint
    c6fd968f5843 objtool: Don't fail on missing symbol table
    d92d00861e98 io_uring: fix sleeping under spin in __io_clean_op
    7bccd1c19128 io_uring: dont kill fasync under completion_lock
    186725a80c4e io_uring: fix skipping disabling sqo on exec
    54b4c4f9aba9 io_uring: fix uring_flush in exit_files() warning
    0682759126bc io_uring: fix false positive sqo warning on flush
    8cb6f4da831b io_uring: do sqo disable on install_fd error
    0e3562e3b2ae io_uring: fix null-deref in io_disable_sqo_submit
    a63d9157571b io_uring: stop SQPOLL submit on creator's death
    da67631a33c3 io_uring: add warn_once for io_uring_flush()
    18f31594ee52 io_uring: inline io_uring_attempt_task_drop()
    7bf3fb6243a3 kernel/io_uring: cancel io_uring before task works
    08a922a6fdf8 iwlwifi: dbg: Don't touch the tlv data
    1fa2fa7932f9 RDMA/vmw_pvrdma: Fix network_hdr_type reported in WC
    77727dfda786 media: v4l2-subdev.h: BIT() is not available in userspace
    94fb5ff34544 media: Revert "media: videobuf2: Fix length check for single plane dmabuf queueing"
    0fa0a05b4089 HID: multitouch: Apply MT_QUIRK_CONFIDENCE quirk for multi-input devices
    a7f6d4ab4434 HID: wacom: Correct NULL dereference on AES pen proximity
    e843e4f78258 futex: Handle faults correctly for PI futexes
    abc4dd792f8d futex: Simplify fixup_pi_state_owner()
    a597f12e971c futex: Use pi_state_update_owner() in put_pi_state()
    6d28ac502f9a rtmutex: Remove unused argument from rt_mutex_proxy_unlock()
    5b2c5a9561c2 futex: Provide and use pi_state_update_owner()
    5ede8ee2cb16 futex: Replace pointless printk in fixup_owner()
    ab5e9a320e44 futex: Ensure the correct return value from futex_lock_pi()
    bf5eb7d21ab0 Revert "mm/slub: fix a memory leak in sysfs_slab_add()"
    43f2e6077f44 gpio: mvebu: fix pwm .get_state period calculation
    b97134d15127 Linux 5.10.11
    1daa298a0418 Revert "mm: fix initialization of struct page for holes in memory layout"
    f2a79851c776 mm: fix initialization of struct page for holes in memory layout
    5405cb30db87 Commit 9bb48c82aced ("tty: implement write_iter") converted the tty layer to use write_iter. Fix the redirected_tty_write declaration also in n_tty and change the comparisons to use write_iter instead of write. also in n_tty and change the comparisons to use write_iter instead of write.
    e8572713897e fs/pipe: allow sendfile() to pipe again
    eb5381efaf36 interconnect: imx8mq: Use icc_sync_state
    0b6672fd778c kernfs: wire up ->splice_read and ->splice_write
    11167454e9cb kernfs: implement ->write_iter
    6ce10b6481cd kernfs: implement ->read_iter
    436bc4c45a58 bpf: Local storage helpers should check nullness of owner ptr passed
    b379dfbc1edd drm/i915/hdcp: Get conn while content_type changed
    9e9ae646eb80 ASoC: SOF: Intel: hda: Avoid checking jack on system suspend
    e9c4068fb0f6 tcp: Fix potential use-after-free due to double kfree()
    5cc760632083 x86/sev-es: Handle string port IO to kernel memory properly
    6c19578d4634 net: systemport: free dev before on error path
    e018e57fd5c0 tty: fix up hung_up_tty_write() conversion
    875f1b4bf890 tty: implement write_iter
    f5bbf7f47570 x86/sev: Fix nonistr violation
    39afef8a282b pinctrl: qcom: Don't clear pending interrupts when enabling
    f8a622d21295 pinctrl: qcom: Properly clear "intr_ack_high" interrupts when unmasking
    022dac5bcde9 pinctrl: qcom: No need to read-modify-write the interrupt status
    49aec69ee40c pinctrl: qcom: Allow SoCs to specify a GPIO function that's not 0
    22c3cb558a4b net: core: devlink: use right genl user_ptr when handling port param get/set
    6a791693a013 net: mscc: ocelot: Fix multicast to the CPU port
    70746a4779ad tcp: fix TCP_USER_TIMEOUT with zero window
    981e1807748a tcp: do not mess with cloned skbs in tcp_add_backlog()
    013ed7c845df net: dsa: b53: fix an off by one in checking "vlan->vid"
    f0f3d3e6e938 net: Disable NETIF_F_HW_TLS_RX when RXCSUM is disabled
    261b8f617d2a net: mscc: ocelot: allow offloading of bridge on top of LAG
    9898801780ed ipv6: set multicast flag on the multicast route
    0083dc292ee4 net_sched: reject silly cell_log in qdisc_get_rtab()
    56ef551205e4 net_sched: avoid shift-out-of-bounds in tcindex_set_parms()
    3cb2de5242ec ipv6: create multicast route with RTPROT_KERNEL
    e5f323b7aba3 udp: mask TOS bits in udp_v4_early_demux()
    03ca5c229a49 net_sched: gen_estimator: support large ewma log
    a6fc8314dc40 tcp: fix TCP socket rehash stats mis-accounting
    fee5a83dfc4a kasan: fix incorrect arguments passing in kasan_add_zero_shadow
    ecd63f04e728 kasan: fix unaligned address is unhandled in kasan_remove_zero_shadow
    b65578cec113 skbuff: back tiny skbs with kmalloc() in __netdev_alloc_skb() too
    73171b677fc4 lightnvm: fix memory leak when submit fails
    76e2b0b65d47 cachefiles: Drop superfluous readpages aops NULL check
    20fa3a744279 nvme-pci: fix error unwind in nvme_map_data
    88072260f3ca nvme-pci: refactor nvme_unmap_data
    13bcd09b2f50 sh_eth: Fix power down vs. is_opened flag ordering
    7e2bf98d534f selftests/powerpc: Fix exit status of pkey tests
    55c869b1324f net: dsa: mv88e6xxx: also read STU state in mv88e6250_g1_vtu_getnext
    2fc06bfa701d octeontx2-af: Fix missing check bugs in rvu_cgx.c
    19187877057d ASoC: SOF: Intel: fix page fault at probe if i915 init fails
    ba548335c8e8 locking/lockdep: Cure noinstr fail
    8c262be154ff sh: Remove unused HAVE_COPY_THREAD_TLS macro
    233900505617 sh: dma: fix kconfig dependency for G2_DMA
    e929068ad5b3 drm/i915/hdcp: Update CP property in update_pipe
    5897a78fd13f tools: gpio: fix %llu warning in gpio-watch.c
    3fa4a03fd01e tools: gpio: fix %llu warning in gpio-event-mon.c
    83d7403b2e3e netfilter: rpfilter: mask ecn bits before fib lookup
    238b5ebdb6a6 cls_flower: call nla_ok() before nla_next()
    23d02ee1d455 x86/cpu/amd: Set __max_die_per_package on AMD
    0b3efe55e583 x86/entry: Fix noinstr fail
    a2989acadc8b drm/i915: Only enable DFP 4:4:4->4:2:0 conversion when outputting YCbCr 4:4:4
    75b944403000 drm/i915: s/intel_dp_sink_dpms/intel_dp_set_power/
    881363cbddb1 driver core: Extend device_is_dependent()
    b3bc56e3f503 driver core: Fix device link device name collision
    8cd3c48c1baf drivers core: Free dma_range_map when driver probe failed
    3a9eb1141390 xhci: tegra: Delay for disabling LFPS detector
    9e7d7c034708 xhci: make sure TRB is fully written before giving it to the controller
    6b81e926bb98 usb: cdns3: imx: fix can't create core device the second time issue
    cc7f1a32424e usb: cdns3: imx: fix writing read-only memory issue
    eb87dd389e0f usb: bdc: Make bdc pci driver depend on BROKEN
    9bbf039671dc usb: udc: core: Use lock when write to soft_connect
    43e2ae5a7493 USB: gadget: dummy-hcd: Fix errors in port-reset handling
    ea0dd2da3ac7 usb: gadget: aspeed: fix stop dma register setting.
    c6e50ff9363c USB: ehci: fix an interrupt calltrace error
    f270d1d75563 ehci: fix EHCI host controller initialization sequence
    ee3a62cb263b serial: mvebu-uart: fix tx lost characters at power off
    225c87b40a78 stm class: Fix module init return on allocation failure
    f583ccebacdf intel_th: pci: Add Alder Lake-P support
    2df15ef2a9cc io_uring: fix short read retries for non-reg files
    f3ac7a5996d7 io_uring: fix SQPOLL IORING_OP_CLOSE cancelation state
    ca75872dd9f3 io_uring: iopoll requests should also wake task ->in_idle state
    371f3fbf4ff1 mm: fix numa stats for thp migration
    0dc3a130cc37 mm: memcg: fix memcg file_dirty numa stat
    26f54dac1564 mm: memcg/slab: optimize objcg stock draining
    cb5fe25c8220 proc_sysctl: fix oops caused by incorrect command parameters
    c351dc4d774e x86/setup: don't remove E820_TYPE_RAM for pfn 0
    bd08075c8640 x86/mmx: Use KFPU_387 for MMX string operations
    f19c54317e1b x86/topology: Make __max_die_per_package available unconditionally
    f5ee8afc1971 x86/fpu: Add kernel_fpu_begin_mask() to selectively initialize state
    c530b17272d1 irqchip/mips-cpu: Set IPI domain parent chip
    2edf2c9f3e5e cifs: do not fail __smb_send_rqst if non-fatal signals are pending
    062dea906be1 powerpc/64s: fix scv entry fallback flush vs interrupt
    1bac5333d47e counter:ti-eqep: remove floor
    855b115749d8 iio: adc: ti_am335x_adc: remove omitted iio_kfifo_free()
    dbecf6631344 drivers: iio: temperature: Add delay after the addressed reset command in mlx90632.c
    5b136903db0e iio: ad5504: Fix setting power-down state
    c9894c169ec6 iio: common: st_sensors: fix possible infinite loop in st_sensors_irq_thread
    61aad39e2e13 i2c: sprd: depend on COMMON_CLK to fix compile tests
    3b56eecdc7da perf evlist: Fix id index for heterogeneous systems
    ec939c13c3ff can: peak_usb: fix use after free bugs
    e771a8740761 can: vxcan: vxcan_xmit: fix use after free bug
    593c072b7b3c can: dev: can_restart: fix use after free bug
    66ee6d91d327 selftests: net: fib_tests: remove duplicate log test
    636868a52d33 xsk: Clear pool even for inactive queues
    517732c1b52b ALSA: hda: Balance runtime/system PM if direct-complete is disabled
    ca431352900a gpio: sifive: select IRQ_DOMAIN_HIERARCHY rather than depend on it
    bc183873967e platform/x86: hp-wmi: Don't log a warning on HPWMI_RET_UNKNOWN_COMMAND errors
    d77bc052c438 platform/x86: intel-vbtn: Drop HP Stream x360 Convertible PC 11 from allow-list
    3e21c4dbc3ae drm/vc4: Unify PCM card's driver_name
    adc0cb3adf8b i2c: octeon: check correct size of maximum RECV_LEN packet
    37d4f78ae274 iov_iter: fix the uaccess area in copy_compat_iovec_from_user
    ce4d02da78a3 printk: fix kmsg_dump_get_buffer length calulations
    cf3cca5f1580 printk: ringbuffer: fix line counting
    2cd90971a2c9 RDMA/cma: Fix error flow in default_roce_mode_store
    56c1362981b3 RDMA/umem: Avoid undefined behavior of rounddown_pow_of_two()
    eb8ca93e4929 drm/amdkfd: Fix out-of-bounds read in kdf_create_vcrat_image_cpu()
    ef9eb913c050 bpf: Reject too big ctx_size_in for raw_tp test run
    93f8cc947b13 arm64: entry: remove redundant IRQ flag tracing
    29c95dc43fde powerpc: Fix alignment bug within the init sections
    3f46eda5dff4 powerpc: Use the common INIT_DATA_SECTION macro in vmlinux.lds.S
    7c7b2b560583 bpf: Prevent double bpf_prog_put call from bpf_tracing_prog_attach
    cfaa40727152 crypto: omap-sham - Fix link error without crypto-engine
    f733c696e74a scsi: ufs: Fix tm request when non-fatal error happens
    1ef1c2e25a4a scsi: ufs: ufshcd-pltfrm depends on HAS_IOMEM
    20758d0493c3 scsi: megaraid_sas: Fix MEGASAS_IOC_FIRMWARE regression
    dbba7a38b007 btrfs: print the actual offset in btrfs_root_name
    1f54a26bdb60 RDMA/ucma: Do not miss ctx destruction steps in some cases
    1e00ef8a5d22 pinctrl: mediatek: Fix fallback call path
    9eea5cc5f641 pinctrl: aspeed: g6: Fix PWMG0 pinctrl setting
    73ad8d0c7b05 gpiolib: cdev: fix frame size warning in gpio_ioctl()
    653368189090 nfsd: Don't set eof on a truncated READ_PLUS
    de82ec8e5e8c nfsd: Fixes for nfsd4_encode_read_plus_data()
    8478091a1bd5 x86/xen: fix 'nopvspin' build error
    434f246733e7 RISC-V: Fix maximum allowed phsyical memory for RV32
    e1b2ecb562fa RISC-V: Set current memblock limit
    90ab323edfcd libperf tests: Fail when failing to get a tracepoint id
    680559480c95 libperf tests: If a test fails return non-zero
    2ca824c79376 io_uring: flush timeouts that should already have expired
    f3f906bb36cc drm/nouveau/kms/nv50-: fix case where notifier buffer is at offset 0
    bb2ee33ec396 drm/nouveau/mmu: fix vram heap sizing
    685a45858bf9 drm/nouveau/i2c/gm200: increase width of aux semaphore owner fields
    2249a3f0aed9 drm/nouveau/privring: ack interrupts the same way as RM
    c2cd3e1d69f8 drm/nouveau/bios: fix issue shadowing expansion ROMs
    3970a9851fe9 drm/amd/display: Fix to be able to stop crc calculation
    0a3be22a90ac HID: logitech-hidpp: Add product ID for MX Ergo in Bluetooth mode
    17c9b5100056 drm/amd/display: disable dcn10 pipe split by default
    285a86df680c drm/amdgpu/psp: fix psp gfx ctrl cmds
    9e82f2aa5912 riscv: defconfig: enable gpio support for HiFive Unleashed
    a416b33e8b78 dts: phy: add GPIO number and active state used for phy reset
    4685e186ab85 dts: phy: fix missing mdio device and probe failure of vsc8541-01 device
    99e301aca69c x86/xen: Fix xen_hvm_smp_init() when vector callback not available
    a8fddd4192f8 x86/xen: Add xen_no_vector_callback option to test PCI INTX delivery
    fa5f2e04daa4 xen: Fix event channel callback via INTX/GSI
    95379fec8264 arm64: make atomic helpers __always_inline
    64de608c9899 riscv: cacheinfo: Fix using smp_processor_id() in preemptible
    cec20e26750c ALSA: hda/tegra: fix tegra-hda on tegra30 soc
    a8749dfcb892 clk: tegra30: Add hda clock default rates to clock driver
    4301e3448aeb HID: Ignore battery for Elan touchscreen on ASUS UX550
    1e6fc9768ed2 HID: logitech-dj: add the G602 receiver
    6bc83cce3e7f riscv: Enable interrupts during syscalls with M-Mode
    094a4af043bc riscv: Fix sifive serial driver
    c47d249af1bd riscv: Fix kernel time_init()
    de88bcba6611 scsi: sd: Suppress spurious errors when WRITE SAME is being disabled
    fb84da3a6882 scsi: scsi_debug: Fix memleak in scsi_debug_init()
    c419b747ee5a scsi: qedi: Correct max length of CHAP secret
    2536194bb3b0 scsi: ufs: Correct the LUN used in eh_device_reset_handler() callback
    62985a33c6a2 scsi: ufs: Relax the condition of UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
    55807e7cb0bc x86/hyperv: Fix kexec panic/hang issues
    246ab9b9ed63 dm integrity: select CRYPTO_SKCIPHER
    e03bbc55b149 HID: sony: select CONFIG_CRC32
    eacac9a92183 HID: multitouch: Enable multi-input for Synaptics pointstick/touchpad device
    00ee972739fb SUNRPC: Handle TCP socket sends with kernel_sendpage() again
    ae3e2f34b30d ASoC: rt711: mutex between calibration and power state changes
    14fe083fd052 ASoC: Intel: haswell: Add missing pm_ops
    142c6a6040de drm/i915: Check for rq->hwsp validity after acquiring RCU lock
    bdab6bdaa0e6 drm/i915/gt: Prevent use of engine->wa_ctx after error
    7f8049df7c50 drm/amd/display: DCN2X Find Secondary Pipe properly in MPO + ODM Case
    09846950a1b6 drm/amdgpu: remove gpu info firmware of green sardine
    eab4b3e27413 drm/syncobj: Fix use-after-free
    931bc41c59e3 drm/atomic: put state on error path
    9cb683c3c471 dm integrity: conditionally disable "recalculate" feature
    de4fabc02a58 dm integrity: fix a crash if "recalculate" used without "internal_hash"
    5a5095ac9e0b dm: avoid filesystem lookup in dm_get_dev_t()
    4749ffd9c432 mmc: sdhci-brcmstb: Fix mmc timeout errors on S5 suspend
    b97c26cfe1e6 mmc: sdhci-xenon: fix 1.8v regulator stabilization
    728d8ab4d6ac mmc: sdhci-of-dwcmshc: fix rpmb access
    ec302409d0a8 mmc: core: don't initialize block size from ext_csd if not present
    6b873acfb82a pinctrl: ingenic: Fix JZ4760 support
    13ef6bccab39 fs: fix lazytime expiration handling in __writeback_single_inode()
    adc11110d1e5 btrfs: send: fix invalid clone operations when cloning from the same file and root
    018abb50891e btrfs: don't clear ret in btrfs_start_dirty_block_groups
    14e17e90bfaa btrfs: fix lockdep splat in btrfs_recover_relocation
    5169a289fc8c btrfs: do not double free backref nodes on error
    9e2fc8f10c91 btrfs: don't get an EINTR during drop_snapshot for reloc
    d9deb4ccd026 ACPI: scan: Make acpi_bus_get_device() clear return pointer on error
    c5f23645ab51 dm crypt: fix copy and paste bug in crypt_alloc_req_aead
    367733db7a10 crypto: xor - Fix divide error in do_xor_speed()
    fba2b0d2e171 ALSA: hda/via: Add minimum mute flag
    d9984b976c65 ALSA: hda/realtek - Limit int mic boost on Acer Aspire E5-575T
    a03241a22a07 ALSA: seq: oss: Fix missing error check in snd_seq_oss_synth_make_info()
    de45a93792ea platform/x86: ideapad-laptop: Disable touchpad_switch for ELAN0634
    4d33a2e557da platform/x86: i2c-multi-instantiate: Don't create platform device for INT3515 ACPI nodes
    c47951346c3c i2c: bpmp-tegra: Ignore unknown I2C_M flags
    e633c0879be3 i2c: tegra: Wait for config load atomically while in ISR
    48481056537e mtd: rawnand: nandsim: Fix the logic when selecting Hamming soft ECC engine
    deffd59b8101 mtd: rawnand: gpmi: fix dst bit offset when extracting raw payload
    e65d6887fc16 scsi: target: tcmu: Fix use-after-free of se_cmd->priv

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 7e186c8eae..2c8cbeef87 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3ad985647155ca228a430e5c0f86cababbdddf8a"
-SRCREV_meta ?= "7c4c7ee59bff544ad38f7e9ae32294e081503bed"
+SRCREV_machine ?= "d77b720057d0d014fcbf41746377fd3ce44f487b"
+SRCREV_meta ?= "5833ca701711d487c9094bd1efc671e8ef7d001e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.10"
+LINUX_VERSION ?= "5.10.12"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 51975cb783..9fef2a8bdc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.10"
+LINUX_VERSION ?= "5.10.12"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "1e45cad5afd401eb582742812c0f0b3379f42db5"
-SRCREV_machine ?= "3457d0ae8a4c3981f789b69144f9c860d63c2cdf"
-SRCREV_meta ?= "7c4c7ee59bff544ad38f7e9ae32294e081503bed"
+SRCREV_machine_qemuarm ?= "ca3786c50e12f8ef14c41ea956ff1dbd66297a55"
+SRCREV_machine ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
+SRCREV_meta ?= "5833ca701711d487c9094bd1efc671e8ef7d001e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 282e86eec7..72d811b3d6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "49acdea639853d967b5a0a72dd288839d45f78c5"
-SRCREV_machine_qemuarm64 ?= "3457d0ae8a4c3981f789b69144f9c860d63c2cdf"
-SRCREV_machine_qemumips ?= "c096f7c97c84b4d96befc549af2767bc0558e388"
-SRCREV_machine_qemuppc ?= "3457d0ae8a4c3981f789b69144f9c860d63c2cdf"
-SRCREV_machine_qemuriscv64 ?= "3457d0ae8a4c3981f789b69144f9c860d63c2cdf"
-SRCREV_machine_qemux86 ?= "3457d0ae8a4c3981f789b69144f9c860d63c2cdf"
-SRCREV_machine_qemux86-64 ?= "3457d0ae8a4c3981f789b69144f9c860d63c2cdf"
-SRCREV_machine_qemumips64 ?= "cdbb51e878dbb2b400e9ec9d9a879507abd62f91"
-SRCREV_machine ?= "3457d0ae8a4c3981f789b69144f9c860d63c2cdf"
-SRCREV_meta ?= "7c4c7ee59bff544ad38f7e9ae32294e081503bed"
+SRCREV_machine_qemuarm ?= "4fe9a8ec66463c630ae10795450e48198eea6bc6"
+SRCREV_machine_qemuarm64 ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
+SRCREV_machine_qemumips ?= "80096aba0f08a7501b16d923190b87cf3addea05"
+SRCREV_machine_qemuppc ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
+SRCREV_machine_qemuriscv64 ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
+SRCREV_machine_qemux86 ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
+SRCREV_machine_qemux86-64 ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
+SRCREV_machine_qemumips64 ?= "c8a4e780d5f2dc7ebfb01ab78601ef7e23fb4fe9"
+SRCREV_machine ?= "34f8d41f5b524218a7421510c7251b856e1dcfb9"
+SRCREV_meta ?= "5833ca701711d487c9094bd1efc671e8ef7d001e"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.10"
+LINUX_VERSION ?= "5.10.12"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

