Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web11.140776.1598036544236190038
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Aug 2020 12:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JbV9fHS+;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id i20so2292332qkk.8
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Aug 2020 12:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l+0+MfCvsYpVu+rXfNZaeMB5COIbH8Z+65LD6IM+nnc=;
        b=JbV9fHS+OPcHsAmYKnWPq/0fgOya3PV0pOWOqJQOsAaXN85c0rLy9cA1S+vmybMaby
         /vtG+Akiq7XjuoX/rNAMkGZdukHARAuIBXOi5phfT78RENoWHIQkDkiLNpC3xsDzBmGe
         r1W81Q+S58nebLWS6YxdDNwEBOiLazNTzpH8dEmwPMU/NU+8Lb3KfN0aoFYKr5HVYARX
         9yqwJys1KPHfBI4i88qhGzGvrrX1YLmwdYpeg3VHBvamW8nli5J44CrMnNML9l4TsMnn
         3yf8s+ZHA1Unf1+bCz+EKsgp7AiFj/KoLkBUaQqO91MvKJN4QRxC9/U/uLQ3udUmL8x5
         yhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l+0+MfCvsYpVu+rXfNZaeMB5COIbH8Z+65LD6IM+nnc=;
        b=Zyw2I2ukEmp+JqkT7FxG8NSy3zXvmKasJbiB/rib9TcUTiPDHIX8+znHFng/IqNpU5
         t6oerwUmOnO4T6c/8mx7njPJssGmdrAU8e8elkEYv+yAkpkTEJ2/4mMo8SYEJFdN9MBN
         r8fBtZRJ34nJNne24U1fWyKSQaXmhmdWibt7AshHaDNp8AlnhDSgX9J4QXgHWMXq3/I0
         hsYWxopgQwjrzAwparuVA0+r7cvD9h9xOquprrdv/rZiXqAWmSu/BARnnV+e0Im1Fsed
         PUp1yNwBrjAWnAZU0ig1vkHzk5aat+GT7llZdBS9Nl7YohCJLk8ghBUf8LLW+/IoagPw
         Qnmw==
X-Gm-Message-State: AOAM5305BWTXQ4VZrb5eWbF669e6U91/WE/lhxXbXQT2pFUQxb2EYIof
	GLAqgM8D8TsofcoK21zNR9d5rvpy54EjV4He
X-Google-Smtp-Source: ABdhPJzC2xpo7igAWjH1NZrmHhGx8Q5B/t/nTmoFVIjBLDljK80yuLM3apcEZuu+hwdi1hme50f7Pg==
X-Received: by 2002:a37:b787:: with SMTP id h129mr3846245qkf.402.1598036542836;
        Fri, 21 Aug 2020 12:02:22 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id e61sm2852845qtd.20.2020.08.21.12.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2020 12:02:21 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/5.8: update to v5.8.2
Date: Fri, 21 Aug 2020 15:02:16 -0400
Message-Id: <c9d0bb421a2f7c6783f2c2bbf47c95da5537985d.1598036283.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1598036283.git.bruce.ashfield@gmail.com>
References: <cover.1598036283.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.8 to the latest korg -stable release that comprises
the following commits:

    ad8c735b1497 Linux 5.8.2
    7e430e763be2 task_work: only grab task signal lock when needed
    df18711f9c00 io_uring: enable lookup of links holding inflight files
    d181cfc89885 io_uring: add missing REQ_F_COMP_LOCKED for nested requests
    960ea38bfe7a io_uring: hold 'ctx' reference around task_work queue + execute
    a4418e11cf9b io_uring: Fix NULL pointer dereference in loop_rw_iter()
    06f96778837e s390/gmap: improve THP splitting
    74e0d05fc682 s390/numa: set node distance to LOCAL_DISTANCE
    d7776a09f52a s390/dasd: fix inability to use DASD with DIAG driver
    2026a268071e drm/xen-front: Fix misused IS_ERR_OR_NULL checks
    f798d7de4a01 xen/gntdev: Fix dmabuf import with non-zero sgt offset
    1cd690215d30 xen/balloon: make the balloon wait interruptible
    e26aab6587b1 xen/balloon: fix accounting in alloc_xenballooned_pages error path
    8a2845246554 firmware_loader: EFI firmware loader must handle pre-allocated buffer
    6573d3c1f402 irqdomain/treewide: Free firmware node after domain removal
    86caf5d8ac3e firmware: qcom_scm: Fix legacy convention SCM accessors
    0255b5803332 ARM: 8992/1: Fix unwind_frame for clang-built kernels
    89a16b68221c ARM: dts: exynos: Extend all Exynos5800 A15's OPPs with max voltage data
    dc12363fb7ff parisc: mask out enable and reserved bits from sba imask
    c33370975ce4 parisc: Implement __smp_store_release and __smp_load_acquire barriers
    5efde2158258 parisc: Do not use an ordered store in pa_tlb_lock()
    0730d6cd49e0 Revert "parisc: Revert "Release spinlocks using ordered store""
    56b60c71143a Revert "parisc: Use ldcw instruction for SMP spinlock release barrier"
    40ab3539bc7c Revert "parisc: Drop LDCW barrier in CAS code when running UP"
    6044b0d92ac6 Revert "parisc: Improve interrupt handling in arch_spin_lock_flags()"
    49b9263b2a15 Revert "mm/vmstat.c: do not show lowmem reserve protection information of empty zone"
    0e2d35b34891 erofs: fix extended inode could cross boundary
    00a43cd24d66 mtd: spi-nor: intel-spi: Simulate WRDI command
    a2e5af466884 mtd: rawnand: qcom: avoid write to unavailable register
    118612569083 spi: spidev: Align buffers for DMA
    1e4d8a76f09e PM / devfreq: Fix indentaion of devfreq_summary debugfs node
    83e35713b3d4 PM / devfreq: rk3399_dmc: Fix kernel oops when rockchip,pmu is absent
    4eeeaca1e935 include/asm-generic/vmlinux.lds.h: align ro_after_init
    768eb23b7670 MIPS: VZ: Only include loongson_regs.h for CPU_LOONGSON64
    f9bb92d06d9a cpufreq: dt: fix oops on armada37xx
    e147c355b717 cpufreq: Fix locking issues with governors
    8ad74327fb4b NFS: Don't return layout segments that are in use
    8a7dfccb581f NFS: Don't move layouts to plh_return_segs list while in use
    4db216cc1d59 io_uring: sanitize double poll handling
    fe552346a87b io_uring: fail poll arm on queue proc failure
    3c5d00a21128 io_uring: use TWA_SIGNAL for task_work uncondtionally
    93bc88750e69 io_uring: set ctx sq/cq entry count earlier
    3c374f0e63d7 drm/ttm/nouveau: don't call tt destroy callback on alloc failure.
    441ba3c8300b media: media-request: Fix crash if memory allocation fails
    0a4d8f8bc3c9 driver core: Fix probe_count imbalance in really_probe()
    eb0b64b4817c 9p: Fix memory leak in v9fs_mount
    72bc544c0dd4 kvm: x86: replace kvm_spec_ctrl_test_value with runtime test on the host
    2e91bbf598b2 fs/minix: reject too-large maximum file size
    4ded4aeb84a7 fs/minix: don't allow getting deleted inodes
    3362c7fb3f9a fs/minix: check return value of sb_getblk()
    77e0be9e8212 bitfield.h: don't compile-time validate _val in FIELD_FIT
    d613f0186778 tick/nohz: Narrow down noise while setting current task's tick dependency
    8720986cf5ab crypto: cpt - don't sleep of CRYPTO_TFM_REQ_MAY_SLEEP was not specified
    4a412ab6211b crypto: ccp - Fix use of merged scatterlists
    98df3304a1fc crypto: qat - fix double free in qat_uclo_create_batch_init_list
    a256a5c33ab3 crypto: hisilicon - don't sleep of CRYPTO_TFM_REQ_MAY_SLEEP was not specified
    6158e615334a pstore: Fix linking when crypto API disabled
    32e110843422 tpm: Unify the mismatching TPM space buffer sizes
    ec0cf56ee031 ALSA: usb-audio: add quirk for Pioneer DDJ-RB
    f8b0754bb141 ALSA: usb-audio: work around streaming quirk for MacroSilicon MS2109
    184f08d3789f ALSA: usb-audio: fix overeager device match for MacroSilicon MS2109
    2b4d81f58d9d ALSA: usb-audio: Creative USB X-Fi Pro SB1095 volume knob support
    9af94db4d1b7 ALSA: hda - reverse the setting value in the micmute_led_set
    d81a84e7bba0 ALSA: hda - fix the micmute led status for Lenovo ThinkCentre AIO
    09af2d0326b1 vdpasim: protect concurrent access to iommu iotlb
    53dcbd3acc74 iommu/vt-d: Skip TE disabling on quirky gfx dedicated iommu
    56448553974f usb: cdns3: gadget: always zeroed TRB buffer when enable endpoint
    1425bf7b1be0 USB: serial: cp210x: enable usb generic throttle/unthrottle
    bd5cc29fca5e USB: serial: cp210x: re-enable auto-RTS on open
    e9eb38791a1f r8152: Use MAC address from correct device tree node
    26121668ba97 net: phy: marvell10g: fix null pointer dereference
    6979755c3473 vsock: fix potential null pointer dereference in vsock_poll()
    c1a7c51485e1 net: initialize fastreuse on inet_inherit_port
    fe00aee967ec net: refactor bind_bucket fastreuse into helper
    0306c15114e2 vmxnet3: use correct tcp hdr length when packet is encapsulated
    743ae9f790ec tcp: correct read of TFO keys on big endian systems
    1cccda2d0888 net/tls: Fix kmap usage
    e6e356db45f4 net: Set fput_needed iff FDPUT_FPUT is set
    5512f2549e3d net: phy: fix memory leak in device-create error path
    d556aa7ab7b7 net/nfc/rawsock.c: add CAP_NET_RAW check.
    469cb3bb42d1 net: Fix potential memory leak in proto_register()
    4268aa35b6dd drivers/net/wan/lapbether: Added needed_headroom and a skb->len check
    e85a5151e5f9 af_packet: TPACKET_V3: fix fill status rwlock imbalance
    b879ed3103c1 crypto: aesni - add compatibility with IAS
    335e8039fddd x86/fsgsbase/64: Fix NULL deref in 86_fsgsbase_read_task
    dcab7f26a723 SUNRPC: Fix ("SUNRPC: Add "@len" parameter to gss_unwrap()")
    6c031aec6218 nfsd: avoid a NULL dereference in __cld_pipe_upcall()
    7f84e3caf510 svcrdma: Fix page leak in svc_rdma_recv_read_chunk()
    9bf49b97ab0b mtd: rawnand: brcmnand: Don't default to edu transfer
    a75fc224ebe8 pinctrl-single: fix pcs_parse_pinconf() return value
    eba0e0f5ae94 ocfs2: fix unbalanced locking
    e29f6ba2c10f dlm: Fix kobject memleak
    2bbe1b50734a media: mtk-mdp: Fix a refcounting bug on error in init
    ce1b309dd629 net: thunderx: initialize VF's mailbox mutex before first usage
    8eb42c65f162 selftests/net: relax cpu affinity requirement in msg_zerocopy test
    551cdcc12892 Revert "vxlan: fix tos value before xmit"
    b187671275ac hv_netvsc: do not use VF device if link is down
    adc38af984ad dpaa2-eth: Fix passing zero to 'PTR_ERR' warning
    3f730f7b0edf net: macb: Properly handle phylink on at91sam9x
    92bb2e6b119c net: thunderx: use spin_lock_bh in nicvf_set_rx_mode_task()
    312efc832854 gpio: don't use same lockdep class for all devm_gpiochip_add_data users
    5543ea25c09d fsl/fman: fix eth hash table allocation
    e5a4333e2cdf fsl/fman: check dereferencing null pointer
    d3d5c8c74008 fsl/fman: fix unreachable code
    47fe6d67f941 fsl/fman: fix dereference null return value
    f90112519854 fsl/fman: use 32-bit unsigned integer
    d097ca1397c0 net: spider_net: Fix the size used in a 'dma_free_coherent()' call
    66e007f01aa1 net: sgi: ioc3-eth: Fix the size used in some 'dma_free_coherent()' calls
    d0414b18f877 liquidio: Fix wrong return value in cn23xx_get_pf_num()
    17948294d0ae net: ethernet: aquantia: Fix wrong return value
    fba2cf348d9e net: mvpp2: fix memory leak in mvpp2_rx
    1a6a61db6f4c ftrace: Fix ftrace_trace_task return value
    f10a3fb43b02 net/mlx5: Delete extra dump stack that gives nothing
    b7855bad4c6a net/mlx5: DR, Change push vlan action sequence
    63d91a65f226 tools, bpftool: Fix wrong return value in do_dump()
    fccac9cc36b0 tools, build: Propagate build failures from tools/build/Makefile.build
    060bd61d4cc6 wl1251: fix always return 0 error
    c7565e834207 qtnfmac: Missing platform_device_unregister() on error in qtnf_core_mac_alloc()
    e879051c0828 rtw88: coex: only skip coex triggered by BT info
    1a93abb6a68d rtw88: fix short GI capability based on current bandwidth
    f2a4bd36a126 rtw88: fix LDPC field for RA info
    763c576f095b netfilter: nft_meta: fix iifgroup matching
    ae32b42b3641 ice: Graceful error handling in HW table calloc failure
    f0c20782f637 ice: Clear and free XLT entries on reset
    4bd27fb14f7b s390/qeth: don't process empty bridge port events
    22697ca855c0 s390/qeth: tolerate pre-filled RX buffer
    ee9f0d33c024 ASoC: fsl_sai: Fix value of FSL_SAI_CR1_RFW_MASK
    3d26a53f004d ASoC: meson: cards: deal dpcm flag change
    224e14999588 ASoC: core: use less strict tests for dailink capabilities
    bd82844099c4 MIPS: only register FTLBPar exception handler for supported models
    6edc078a22a2 libbpf: Fix register in PT_REGS MIPS macros
    fbcedc1579f5 drm/msm/dpu: don't use INTF_INPUT_CTRL feature on sdm845
    77c8cfdf8084 net: ll_temac: Use devm_platform_ioremap_resource_byname()
    7a4c9d17c8bc ASoC: soc-core: Fix regression causing sysfs entries to disappear
    0c7d64caaf13 ASoC: meson: axg-tdm-formatters: fix sclk inversion
    036a8c923358 ASoC: meson: axg-tdmin: fix g12a skew
    30fde1d41d73 ASoC: meson: axg-tdm-interface: fix link fmt setup
    3369ed2127bb RDMA/hns: Fix the unneeded process when getting a general type of CQE error
    a6c7b76332b3 RDMA/hns: Fix error during modify qp RTS2RTS
    fd926b32b9ca selftests/powerpc: Fix online CPU selection
    3e444bad470e powerpc/pseries/hotplug-cpu: Remove double free in error path
    c2ff56c52846 cpufreq: ap806: fix cpufreq driver needs ap cpu clk
    40e453d8a9df PCI: Release IVRS table in AMD ACS quirk
    c62142f3b48b RDMA/netlink: Remove CAP_NET_RAW check when dump a raw QP
    87ccb032ee9f RDMA/rtrs: remove WQ_MEM_RECLAIM for rtrs_wq
    2247e03d8206 RDMA/rtrs-clt: add an additional random 8 seconds before reconnecting
    34503392af35 nvmem: sprd: Fix return value of sprd_efuse_probe()
    081428bc9c3b selftests/powerpc: Fix CPU affinity for child process
    0e03270c6d95 powerpc/boot: Fix CONFIG_PPC_MPC52XX references
    a5baa27249bf powerpc/32s: Fix CONFIG_BOOK3S_601 uses
    94976f931d33 selftests/powerpc: Squash spurious errors due to device removal
    6c96e968f10c xfs: clear XFS_DQ_FREEING if we can't lock the dquot buffer to flush
    5db458a85892 xfs: fix inode allocation block res calculation precedence
    03acd91927d2 net: dsa: rtl8366: Fix VLAN set-up
    427fa4ecef77 net: dsa: rtl8366: Fix VLAN semantics
    536079c88a4f Bluetooth: hci_qca: Stop collecting memdump again for command timeout during SSR
    3d27182481fe Bluetooth: Fix suspend notifier race
    226020402b1f bpf: Fix bpf_ringbuf_output() signature to return long
    8a365b83f67e Bluetooth: hci_serdev: Only unregister device if it was registered
    715faee64cea Bluetooth: hci_h5: Set HCI_UART_RESET_ON_INIT to correct flags
    267dac50f18e Bluetooth: btusb: Fix and detect most of the Chinese Bluetooth controllers
    a7d08a5c1ed4 power: supply: check if calc_soc succeeded in pm860x_init_battery
    1fe77db0d48b Smack: prevent underflow in smk_set_cipso()
    cdb83ad0c45b Smack: fix another vsscanf out of bounds
    16b5b7dd945e RDMA/core: Fix return error value in _ib_modify_qp() to negative
    e415706d69fe PCI: cadence: Fix updating Vendor ID and Subsystem Vendor ID register
    8398e98caec2 PCI: cadence: Fix cdns_pcie_{host|ep}_setup() error path
    6c7b87f48585 gpio: regmap: fix type clash
    38c296c86322 macintosh/via-macii: Access autopoll_devs when inside lock
    d2b414c7916e powerpc/watchpoint: Fix DAWR exception for CACHEOP
    50b0fe566b11 powerpc/watchpoint: Fix DAWR exception constraint
    93f7e2100c93 powerpc/watchpoint: Fix 512 byte boundary limit
    1e43aee1568e bpf: Fix pos computation for bpf_iter seq_ops->start()
    7aa88d36b692 net: dsa: mv88e6xxx: MV88E6097 does not support jumbo configuration
    04ce7e5016de scsi: core: Add missing scsi_device_put() in scsi_host_block()
    c16097b56df8 scsi: mesh: Fix panic after host or bus reset
    14f820a1b601 scsi: megaraid_sas: Clear affinity hint
    1bcba06e5888 usb: gadget: f_uac2: fix AC Interface Header Descriptor wTotalLength
    88dcd13872b1 usb: dwc2: Fix error path in gadget registration
    816adf48d9ff usb: dwc3: meson-g12a: fix shared reset control use
    de27452f2308 thermal: int340x: processor_thermal: fix: update Jasper Lake PCI id
    0415ff8c7d6e MIPS: OCTEON: add missing put_device() call in dwc3_octeon_device_init()
    214d219e48a2 PCI: rcar: Fix runtime PM imbalance on error
    0d4b670195f5 powerpc/spufs: Fix the type of ret in spufs_arch_write_note
    a1d76052b1e3 ASoC: hdac_hda: fix deadlock after PCM open error
    7593350d7b72 qed: Fix ILT and XRCD bitmap memory leaks
    4a7063478d13 ASoC: tas2770: Fix reset gpio property name
    360ee482151c tools/bpftool: Fix error handing in do_skeleton()
    23072846b309 s390/bpf: Tolerate not converging code shrinking
    a463d46b323c s390/bpf: Use brcl for jumping to exit_ip if necessary
    fa9a83dab397 s390/bpf: Fix sign extension in branch_ku
    cec737d79fa4 phy: armada-38x: fix NETA lockup when repeatedly switching speeds
    e5e386a90961 mt76: mt7615: fix possible memory leak in mt7615_mcu_wtbl_sta_add
    3432b568dec4 mt76: mt7915: add missing CONFIG_MAC80211_DEBUGFS
    d8177e088f10 mt76: mt7915: potential array overflow in mt7915_mcu_tx_rate_report()
    fbdc18979b1d mt76: mt7615: fix potential memory leak in mcu message handler
    8c2729a1ead8 mt76: mt7663u: fix potential memory leak in mcu message handler
    6aee19b46bc7 mt76: mt7663u: fix memory leak in set key
    a73ed0f9bca1 powerpc/perf: Fix missing is_sier_aviable() during build
    66ce4246d1d3 coresight: etm4x: Fix save/restore during cpu idle
    3e75f65575c9 coresight: tmc: Fix TMC mode read in tmc_read_unprepare_etb()
    91813b6c4a71 coresight: etmv4: Counter values not saved on disable
    9b975cf2fb05 coresight: etmv4: Fix resource selector constant
    6d52214425ce thermal: ti-soc-thermal: Fix reversed condition in ti_thermal_expose_sensor()
    99075b81545c usb: core: fix quirks_param_set() writing to a const pointer
    e9ba39efa669 clk: qcom: gcc: Make disp gpll0 branch aon for sc7180/sdm845
    ef54393965e4 USB: serial: iuu_phoenix: fix led-activity helpers
    d1ffb4446102 PCI: loongson: Use DECLARE_PCI_FIXUP_EARLY for bridge_class_quirk()
    9d42c78119a0 spi: lantiq-ssc: Fix warning by using WQ_MEM_RECLAIM
    75d9f30b8b56 gpu: ipu-v3: Restore RGB32, BGR32
    19a106b23be9 drm/imx: tve: fix regulator_disable error path
    68c15a6dbc77 drm/imx: fix use after free
    20d2eba09230 powerpc/book3s64/pkeys: Use PVR check instead of cpu feature
    aa11151dd892 powerpc/mm/radix: Free PUD table when freeing pagetable
    05d976032bb8 phy: renesas: rcar-gen3-usb2: move irq registration to init
    27d42b1bcde1 media: s5p-g2d: Fix a memory leak in an error handling path in 'g2d_probe()'
    9922de2681e2 go7007: add sanity checking for endpoints
    43a040aea142 PCI/ASPM: Add missing newline in sysfs 'policy'
    94fbbc3cdd99 ASoC: meson: fixes the missed kfree() for axg_card_add_tdm_loopback
    c660787eb906 staging: rtl8192u: fix a dubious looking mask before a shift
    263875d7b606 ima: Fail rule parsing when the KEY_CHECK hook is combined with an invalid cond
    c7e3b96d1229 ima: Fail rule parsing when the KEXEC_CMDLINE hook is combined with an invalid cond
    8e07cdb1778e ima: Fail rule parsing when buffer hook functions have an invalid action
    bd6f756234dc ima: Free the entire rule if it fails to parse
    644a11adfcc7 ima: Free the entire rule when deleting a list of rules
    96022c3ddf63 ima: Have the LSM free its audit rule
    b76ca3f373b5 RDMA/rxe: Prevent access to wr->next ptr afrer wr is posted to send queue
    bdb550b1e420 RDMA/qedr: Add EDPM max size to alloc ucontext response
    06e28eb3bcef RDMA/qedr: Add EDPM mode type for user-fw compatibility
    01fdb8e7c330 RDMA/qedr: SRQ's bug fixes
    99d321c2a921 Bluetooth: Fix update of connection state in `hci_encrypt_cfm`
    13b052362be4 powerpc/vdso: Fix vdso cpu truncation
    fbbdd2434157 powerpc/rtas: don't online CPUs for partition suspend
    d411475796be powerpc/pseries: remove cede offline state for CPUs
    358d38e35d6d kernfs: do not call fsnotify() with name without a parent
    bc2599182f8e mwifiex: Prevent memory corruption handling keys
    63f6498a979a bpfilter: Initialize pos variable
    7a3c6b8c2987 scsi: scsi_debug: Add check for sdebug_max_queue during module init
    b62846a209d8 drm/bridge: sil_sii8620: initialize return of sii8620_readb
    43e8b3c268aa mmc: sdhci-of-arasan: Add missed checks for devm_clk_register()
    adb10d0dc592 phy: exynos5-usbdrd: Calibrating makes sense only for USB2.0 PHY
    a4fc32a7cebd dt-bindings: phy: uniphier: Fix incorrect clocks and clock-names for PXs3 usb3-hsphy
    84cbf55c6744 phy: cadence: salvo: fix wrong bit definition
    16835dc05924 drm: panel: simple: Fix bpc for LG LB070WV8 panel
    413d189f9a3c leds: core: Flush scheduled work for system suspend
    c5450ee5eb1a kobject: Avoid premature parent object freeing in kobject_cleanup()
    49d6de41c9da drm/stm: repair runtime power management
    f59499bcd70d samples: bpf: Fix bpf programs with kprobe/sys_connect event
    5c7ca8d75dce PCI: Fix pci_cfg_wait queue locking problem
    e36653b51177 RDMA/rxe: Skip dgid check in loopback mode
    6d283e10b30f xfs: fix reflink quota reservation accounting error
    95c286034452 xfs: don't eat an EIO/ENOSPC writeback error when scrubbing data fork
    9ff3281d903f xfs: preserve rmapbt swapext block reservation from freed blocks
    4173d4194d77 media: cros-ec-cec: do not bail on device_init_wakeup failure
    050f814243b6 media: exynos4-is: Add missed check for pinctrl_lookup_state()
    200a75ac7e46 media: tvp5150: Add missed media_entity_cleanup()
    dc2ac5c3a96a media: staging: rkisp1: rsz: fix resolution limitation on sink pad
    39e5b396bc9d media: staging: rkisp1: rsz: supported formats are the isp's src formats, not sink formats
    94f0fc91b3fd media: allegro: Fix some NULL vs IS_ERR() checks in probe
    9f32f439a33f media: firewire: Using uninitialized values in node_probe()
    101df88a5837 ipvs: allow connection reuse for unconfirmed conntrack
    013c7b012461 scsi: eesox: Fix different dev_id between request_irq() and free_irq()
    64c6cd408d98 scsi: powertec: Fix different dev_id between request_irq() and free_irq()
    9b470925a9dc RDMA/core: Fix bogus WARN_ON during ib_unregister_device_queued()
    8cb26b10f5b7 dma-buf: fix dma-fence-chain out of order test
    b48e8758634a iavf: Fix updating statistics
    1c5da372e87e iavf: fix error return code in iavf_init_get_resources()
    290ca6a85627 staging: vchiq_arm: Add a matching unregister call
    6545d3462e35 drm/radeon: fix array out-of-bounds read and write issues
    9707e1a7f8ac drm/amdgpu: ensure 0 is returned for success in jpeg_v2_5_wait_for_idle
    8ee5083de201 drm/amdgpu/debugfs: fix memory leak when amdgpu_virt_enable_access_debugfs failed
    5e3b4e09c9b9 scsi: qla2xxx: Make __qla2x00_alloc_iocbs() initialize 32 bits of request_t.handle
    da3684003dc1 tracing: Move pipe reference to trace array instead of current_tracer
    d579cc130a28 net: ethernet: ti: am65-cpsw-nuss: restore vlan configuration while down/up
    33333c08d28a lkdtm: Make arch-specific tests always available
    a4c1f5314327 selftests/lkdtm: Reset WARN_ONCE to avoid false negatives
    5397915bf77b lkdtm: Avoid more compiler optimizations for bad writes
    fe1f13b572b2 cxl: Fix kobject memleak
    cb52bc02e65d drm/mipi: use dcs write for mipi_dsi_dcs_set_tear_scanline
    bdcfb3217816 scsi: ufs: Disable WriteBooster capability for non-supported UFS devices
    b5118d2bbb8e scsi: cumana_2: Fix different dev_id between request_irq() and free_irq()
    36428bc924e6 net: atlantic: MACSec offload statistics checkpatch fix
    10b8d2696578 ASoC: Intel: Boards: cml_rt1011_rt5682: use statically define codec config
    e6046c52f127 ASoC: Intel: bxt_rt298: add missing .owner field
    5ee90079d049 ASoC: Intel: sof_sdw: add missing .owner field
    f678fb5fd3ba ASoC: Intel: cml_rt1011_rt5682: add missing .owner field
    72425036a6c5 ASoC: SOF: nocodec: add missing .owner field
    37c77ff3b1cc dpaa2-eth: fix condition for number of buffer acquire retries
    ed3f590f2ac6 staging: most: avoid null pointer dereference when iface is null
    10738d622ef0 media: omap3isp: Add missed v4l2_ctrl_handler_free() for preview_init_entities()
    41013c90d84c media: marvell-ccic: Add missed v4l2_async_notifier_cleanup()
    eadd4aa1c520 media: cxusb-analog: fix V4L2 dependency
    b50202c0770c Bluetooth: btmtksdio: fix up firmware download sequence
    6fb4ccc66e01 Bluetooth: btusb: fix up firmware download sequence
    56704a6ba1c7 ASoC: fsl_easrc: Fix uninitialized scalar variable in fsl_easrc_set_ctx_format
    d304a3f78d1b leds: lm355x: avoid enum conversion warning
    d95947426c42 powerpc/fixmap: Fix FIX_EARLY_DEBUG_BASE when page size is 256k
    10057c82dd62 powerpc/mm: Fix typo in IS_ENABLED()
    47fea4d1a23f clk: bcm63xx-gate: fix last clock availability
    a29030741107 drm/arm: fix unintentional integer overflow on left shift
    3ea4204a722a drm/panfrost: Fix inbalance of devfreq record_busy/idle()
    b9af8ae89d51 drm/etnaviv: Fix error path on failure to enable bus clk
    7022baca7cfb scsi: ufs: Fix imprecise load calculation in devfreq window
    c53b4ac934e4 iio: amplifiers: ad8366: Change devm_gpiod_get() to optional and add the missed check
    0f3ff5cba631 iio: improve IIO_CONCENTRATION channel type description
    5af9cf807b5e Bluetooth: hci_qca: Increase SoC idle timeout to 200ms
    1d22f52161b2 Bluetooth: hci_qca: Bug fix during SSR timeout
    17e8eb2db9cc ath10k: Acquire tx_lock in tx error paths
    1b1cacc13022 Bluetooth: Allow suspend even when preparation has failed
    4f87bf4b50b5 Bluetooth: hci_qca: Only remove TX clock vote after TX is completed
    88959e705f04 drm/mm: fix hole size comparison
    fe7a5d7fdea5 Bluetooth: hci_qca: Fix an error pointer dereference
    f1785f21b6be video: pxafb: Fix the function used to balance a 'dma_alloc_coherent()' call
    92f18805fd07 console: newport_con: fix an issue about leak related system resources
    ec47a8107033 video: fbdev: sm712fb: fix an issue about iounmap for a wrong address
    4d2663776cae btmrvl: Fix firmware filename for sd8997 chipset
    2e00553ce46e btmrvl: Fix firmware filename for sd8977 chipset
    86faf4735ccf mwifiex: Fix firmware filename for sd8997 chipset
    d41c930387d3 mwifiex: Fix firmware filename for sd8977 chipset
    4f82ecd46efe agp/intel: Fix a memory leak on module initialisation failure
    86a94d97881d drm/amdgpu: use the unlocked drm_gem_object_put
    1d2ead5d4b39 drm/bridge: ti-sn65dsi86: Fix off-by-one error in clock choice
    b81b49591375 drm/bridge: ti-sn65dsi86: Clear old error bits before AUX transfers
    d65751086ca7 drm/gem: Fix a leak in drm_gem_objects_lookup()
    7c83c5090850 drm/msm: ratelimit crtc event overflow error
    46c8b2e8255c crypto: caam - silence .setkey in case of bad key length
    d5c9f20e4ad7 io_uring: fix stalled deferred requests
    458ae14d4ce5 io_uring: fix racy overflow count reporting
    7ab9b92b614d ACPICA: Do not increment operation_region reference counts for field units
    064c5272a19d btrfs: qgroup: free per-trans reserved space when a subvolume gets dropped
    16a35c7dd8f4 btrfs: allow btrfs_truncate_block() to fallback to nocow for data space reservation
    11bf4638158a bcache: fix super block seq numbers comparision in register_cache_set()
    20fa1e9929e8 dyndbg: fix a BUG_ON in ddebug_describe_flags
    2f92047fea41 usb: bdc: Halt controller on suspend
    8415df3d6eb1 bdc: Fix bug causing crash after multiple disconnects
    7677cbd18b99 usb: gadget: net2280: fix memory leak on probe error handling paths
    fa979805e400 mmc: sdhci-pci-o2micro: Bug fix for O2 host controller Seabird1
    d5bf76c14acd x86/uaccess: Make __get_user_size() Clang compliant on 32-bit
    c234811c3754 ionic: update eid test for overflow
    7ee88f37ad1b drm/amd/powerplay: suppress compile error around BUG_ON
    2ae6cbe7652a gpu: host1x: debug: Fix multiple channels emitting messages simultaneously
    4e701b476f48 iwlegacy: Check the return value of pcie_capability_read_*()
    79f477d1beac platform/x86: asus-nb-wmi: add support for ASUS ROG Zephyrus G14 and G15
    b195c3db8434 brcmfmac: set state of hanger slot to FREE when flushing PSQ
    f41a2583e10b brcmfmac: To fix Bss Info flag definition Bug
    38a031bbdfd3 brcmfmac: keep SDIO watchdog running when console_interval is non-zero
    93e05fd717de Bluetooth: hci_qca: Bug fixes for SSR
    a82baea4babd bpf: Fix fds_example SIGSEGV error
    e9496b4f3165 drm/amd/powerplay: fix compile error with ARCH=arc
    e4c9ade43bc5 drm/amd/display: allow query ddc data over aux to be read only operation
    81ece245ce78 drm/amdgpu/display: properly guard the calls to swSMU functions
    53812570f84c drm/amdgpu/display bail early in dm_pp_get_static_clocks
    865e2dbadf68 drm/amdgpu/debugfs: fix ref count leak when pm_runtime_get_sync fails
    1adb2ff1f6b1 drm/amd/display: Improve DisplayPort monitor interop
    1839d11b9bb2 mm/mmap.c: Add cond_resched() for exit_mmap() CPU stalls
    b70d115ebdcf irqchip/irq-mtk-sysirq: Replace spinlock with raw_spinlock
    d77ecc91b0d8 net: phy: mscc: restore the base page in vsc8514/8584_config_init
    befe5de6250b drm/radeon: disable AGP by default
    175bbacf669b drm/debugfs: fix plain echo to connector "force" attribute
    376bf3ddda59 drm/msm: Fix a null pointer access in msm_gem_shrinker_count()
    37f45e55b596 drm: msm: a6xx: fix gpu failure after system resume
    f2ea1e1877d0 usb: mtu3: clear dual mode of u3port when disable device
    870ed79fc2b7 btrfs: fix lockdep splat from btrfs_dump_space_info
    14fad4e83050 mmc: sdhci-cadence: do not use hardware tuning for SD mode
    085af96b1506 drm/nouveau: fix multiple instances of reference count leaks
    ff0ef144057e drm/nouveau: fix reference count leak in nouveau_debugfs_strap_peek
    ef11e2b533de memory: samsung: exynos5422-dmc: Do not ignore return code of regmap_read()
    1020d869babf ionic: rearrange reset and bus-master control
    51d26960fcb0 drm/etnaviv: fix ref count leak via pm_runtime_get_sync
    49395a64e5f5 arm64: dts: hisilicon: hikey: fixes to comply with adi, adv7533 DT binding
    256d7e3a6752 drm/nouveau/kms/nv50-: Fix disabling dithering
    77a318a4da3e rtw88: 8822ce: add support for device ID 0xc82f
    679d3baca18f md-cluster: fix wild pointer of unlock_all_bitmaps()
    0ff3a2b771b9 bus: ti-sysc: Add missing quirk flags for usb_host_hs
    8131c27f8088 video: fbdev: neofb: fix memory leak in neo_scan_monitor()
    5cc3bdb0aea5 video: fbdev: savage: fix memory leak on error handling path in probe
    cccec0d3e0ef crypto: aesni - Fix build with LLVM_IAS=1
    90bcb927d66d drm/radeon: Fix reference count leaks caused by pm_runtime_get_sync
    59fed9e55e17 drm/amdgpu: avoid dereferencing a NULL pointer
    6cd01fb89ac9 fs/btrfs: Add cond_resched() for try_release_extent_mapping() stalls
    5a4f7281d5a6 io_uring: fix req->work corruption
    b51a31ec3e7c loop: be paranoid on exit and prevent new additions / removals
    35dfb4f8423e Bluetooth: add a mutex lock to avoid UAF in do_enale_set
    7fd31dbc8ece ARM: exynos: clear L310_AUX_CTRL_FULL_LINE_ZERO in default l2c_aux_val
    be90ca6b1f53 net: mscc: ocelot: fix encoding destination ports into multicast IPv4 address
    9638ef9db839 soc: qcom: rpmh-rsc: Set suppress_bind_attrs flag
    47b94c5c6604 drm/tilcdc: fix leak & null ref in panel_connector_get_modes
    22ca8cb2a5b9 block: don't do revalidate zones on invalid devices
    4c3aeda8791c irqchip/loongson-pch-pic: Fix the misused irq flow handler
    c790d6a2306b nvme-multipath: do not fall back to __nvme_find_path() for non-optimized paths
    ebd5b7f6b99e nvme-multipath: fix logic for non-optimized paths
    a7e15f57766c nvme-rdma: fix controller reset hang during traffic
    c11521f04ed9 nvme-tcp: fix controller reset hang during traffic
    ac26d372f1a3 irqchip/gic-v4.1: Use GFP_ATOMIC flag in allocate_vpe_l1_table()
    bc654671a452 irqchip/irq-bcm7038-l1: Guard uses of cpu_logical_map
    ee9db7fc3a2b kunit: tool: fix improper treatment of file location
    0044496d9440 kunit: tool: fix broken default args in unit tests
    dda3d66364ed irqchip/loongson-liointc: Fix potential dead lock
    922ce733868a irqchip/loongson-pch-pic: Check return value of irq_domain_translate_twocell()
    594496eccb4c irqchip/loongson-htvec: Check return value of irq_domain_translate_onecell()
    6affe6f7db79 irqchip/loongson-htvec: Fix potential resource leak
    1926d2da825f md: raid0/linear: fix dereference before null check on pointer mddev
    51ef07ca87be seccomp: Fix ioctl number for SECCOMP_IOCTL_NOTIF_ID_VALID
    d2d09105657d irqchip/ti-sci-inta: Fix return value about devm_ioremap_resource()
    8705ff60b829 scripts/selinux/mdp: fix initial SID handling
    35d16397b2ab iocost: Fix check condition of iocg abs_vdebt
    793788d7848c ARM: socfpga: PM: add missing put_device() call in socfpga_setup_ocram_self_refresh()
    0e16025c3657 spi: rockchip: Fix error in SPI slave pio read
    7ca8cc7b3ee0 soc: qcom: pdr: Reorder the PD state indication ack
    f743813ff463 arm64: dts: meson: fix mmc0 tuning error on Khadas VIM3
    8dcdb3754ffd arm64: dts: meson: misc fixups for w400 dtsi
    ff316db596a8 io_uring: fix sq array offset calculation
    680283e6992d regulator: fix memory leak on error path of regulator_register()
    ca1c20292739 recordmcount: only record relocation of type R_AARCH64_CALL26 on arm64.
    8e7d79dec504 tpm: Require that all digests are present in TCG_PCR_EVENT2 structures
    81fd1c90e748 crypto: x86/crc32c - fix building with clang ias
    6760df0358ef spi: lantiq: fix: Rx overflow error in full duplex mode
    067345b6863f spi: dw-dma: Fix Tx DMA channel working too fast
    af58be14b8c1 ARM: dts: stm32: Fix spi4 pins in stm32mp15-pinctrl
    19798aa6945c ARM: dts: sunxi: bananapi-m2-plus-v1.2: Fix CPU supply voltages
    2f2b61f5cb0c ARM: dts: sunxi: bananapi-m2-plus-v1.2: Add regulator supply to all CPU cores
    3b5043161541 ARM: dts: at91: sama5d3_xplained: change phy-mode
    ea2c9ccdbb33 reset: intel: fix a compile warning about REG_OFFSET redefined
    14ae200d052b ARM: dts: exynos: Disable frequency scaling for FSYS bus on Odroid XU3 family
    c1e877ce5e12 ARM: at91: pm: add missing put_device() call in at91_pm_sram_init()
    4f8c0858195c ARM: dts: gose: Fix ports node name for adv7612
    141b07accc60 arm64: dts: renesas: Fix SD Card/eMMC interface device node names
    459fae59fa50 ARM: dts: gose: Fix ports node name for adv7180
    7b49da0dd3f4 platform/x86: intel-vbtn: Fix return value check in check_acpi_dev()
    54ba0892aabc platform/x86: intel-hid: Fix return value check in check_acpi_dev()
    40bd5e36e27e m68k: mac: Fix IOP status/control register writes
    6b4132d29576 m68k: mac: Don't send IOP message until channel is idle
    d3e1f3ea5877 clk: scmi: Fix min and max rate when registering clocks with discrete rates
    02a4e7bc34eb crypto: qat - allow xts requests not multiple of block
    d4ec29ee8836 sched/uclamp: Fix initialization of struct uclamp_rq
    6d67baf624c6 arm64: dts: exynos: Fix silent hang after boot on Espresso
    0c348e7b0380 arm64: dts: sun50i-pinephone: dldo4 must not be >= 1.8V
    660f9b20f525 firmware: arm_scmi: Fix SCMI genpd domain probing
    7ea14136a7d4 rcu/tree: Repeat the monitor if any free channel is busy
    a1e2c6d58bd8 ARM: exynos: MCPM: Restore big.LITTLE cpuidle support
    c7b6519619aa crypto: ccree - fix resource leak on error path
    06769a572492 soc: qcom: rpmh-rsc: Don't use ktime for timeout in write_tcs_reg_sync()
    00734ff000fc blktrace: fix debugfs use after free
    71fc8e5f4cc3 memory: tegra: Fix an error handling path in tegra186_emc_probe()
    d84a71c79a0c arm64: dts: qcom: msm8916: Replace invalid bias-pull-none property
    f6ab00652486 crc-t10dif: Fix potential crypto notify dead-lock
    012f0e4c9732 EDAC: Fix reference count leaks
    b069187f3044 arm64: dts: rockchip: fix rk3399-puma gmac reset gpio
    ae3da7d2be00 arm64: dts: rockchip: fix rk3399-puma vcc5v0-host gpio
    4df058114a1c arm64: dts: rockchip: fix rk3368-lion gmac reset gpio
    6624632301bc sched: correct SD_flags returned by tl->sd_flags()
    4b53a8f2aed2 sched/fair: Fix NOHZ next idle balance
    f08ce56b56fe x86, sched: Bail out of frequency invariance if turbo_freq/base_freq gives 0
    6ddc271a3a55 x86, sched: Bail out of frequency invariance if turbo frequency is unknown
    2b611e8adc57 x86, sched: check for counters overflow in frequency invariant accounting
    792aececc15d perf/x86/intel/uncore: Fix oops when counting IMC uncore events on some TGL
    421caf5e2ba9 x86/mce/inject: Fix a wrong assignment of i_mce.status
    1e5993c9e22c ARM: dts: stm32: fix uart7_pins_a comments in stm32mp15-pinctrl
    ca1e6f9272ac ARM: dts: stm32: fix uart nodes ordering in stm32mp15-pinctrl
    d6828c99ab8a HID: input: Fix devices that return multiple bytes in battery report
    7701efa45b5b io_uring: abstract out task work running
    2f2bf462d1d4 kunit: capture stderr on all make subprocess calls
    0534d726fffe tracepoint: Mark __tracepoint_string's __used

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index e23e7dcfb1..6317f8da7b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
-SRCREV_meta ?= "a3138cb23c3b7409c516d5d2115da9534c120a0c"
+SRCREV_machine ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
+SRCREV_meta ?= "196209114496901389e2f9012c0600121fc617e0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.8.1"
+LINUX_VERSION ?= "5.8.2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 36a8ae4577..022779f97f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.8.1"
+LINUX_VERSION ?= "5.8.2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "566e869df9400258b6f162bf34933f5b6dcd0115"
-SRCREV_machine ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
-SRCREV_meta ?= "a3138cb23c3b7409c516d5d2115da9534c120a0c"
+SRCREV_machine_qemuarm ?= "15d5da73971d108241be861b5587949fd56933e9"
+SRCREV_machine ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
+SRCREV_meta ?= "196209114496901389e2f9012c0600121fc617e0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index aad689590c..ea167c1866 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "097417e785af04be0cbe757bc6e24456a3f701fd"
-SRCREV_machine_qemuarm64 ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
-SRCREV_machine_qemumips ?= "1fc5490bef8322680d73f6ab2c7b666eccc3bce1"
-SRCREV_machine_qemuppc ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
-SRCREV_machine_qemuriscv64 ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
-SRCREV_machine_qemux86 ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
-SRCREV_machine_qemux86-64 ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
-SRCREV_machine_qemumips64 ?= "e61fc06792254eed92c6908a9b35790ed54b0ace"
-SRCREV_machine ?= "d3c69e89ee5b5d4c3c19b8614bdcdc3f5dc7a8b3"
-SRCREV_meta ?= "a3138cb23c3b7409c516d5d2115da9534c120a0c"
+SRCREV_machine_qemuarm ?= "ca2de8f4027075ca7d7c973c2cc03f7d8b219a43"
+SRCREV_machine_qemuarm64 ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
+SRCREV_machine_qemumips ?= "5e0205a156d14b6341487a169b75ea45b67007b9"
+SRCREV_machine_qemuppc ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
+SRCREV_machine_qemuriscv64 ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
+SRCREV_machine_qemux86 ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
+SRCREV_machine_qemux86-64 ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
+SRCREV_machine_qemumips64 ?= "576f92f17434ae7dd027e8d465a32e4119ead4ee"
+SRCREV_machine ?= "3eb064c5f2b3938ef296c016bc7904cd66f50329"
+SRCREV_meta ?= "196209114496901389e2f9012c0600121fc617e0"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.8.1"
+LINUX_VERSION ?= "5.8.2"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

