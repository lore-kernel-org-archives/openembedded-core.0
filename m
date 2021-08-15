Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web08.12110.1629040143122195063
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Aug 2021 08:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gi6707rF;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id l24so12357238qtj.4
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Aug 2021 08:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gjG0Hnn10byB9pwoffeBuK1lhjS3G9CYxRRx/csRs0o=;
        b=gi6707rFffRn7rIxIAkhOwroFQiWXcJ+2xlhlFW/odl35cUGp3/QC6NzvCXIs0UEBu
         MtXOik70ENIBEhJaO3DgOG8uf6vVzF2EbzlUsfc2nIA/R4g6YrpOJkqALHXxBYGAMfEz
         lnDgRzl0GDn1yKyNjW3GL3uUgdmDw09rbovSh5+19pJzE14pXfbKyZB1dsCPaDcE+sCT
         AbjOWQkOKr9llXAoMKIe/WGvR47o+dgaudml/+nWkVXatX5yjstKXgkTs4+e4Sf/5FY8
         9a1ZzShQhPDAEBSYSlBfrSK6ZBITLketFCucWhQ7tp81sqa1vh9o8ozmH1VGDpJyW4je
         Uw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gjG0Hnn10byB9pwoffeBuK1lhjS3G9CYxRRx/csRs0o=;
        b=Au3DrErqoAUHfpRuUjbLvDMRvdqUPw/6IfcfXeShMHcOAQucQJbVhqft2qTcQQDUa/
         tHEcZhH7NGRxhyaDVIEc5P3kV94TiuiqcFl2C2P+6/iTKooKy5XdK/4WyvbfYseBDUS3
         MVl3fMPLFqEaD5z1cYuMxfOWzVGOqOn7SA4lrmM3a5n2SAf8nqGtd543R5rO1gIHFbrz
         v/LhsXBxnmzVxoVoeSWR9Ajz8v30ga47nm1/nJ7Nvp9j2g4GFfSCe5qQvXwSGRoQlq4j
         ZnJ3KA4iPbD7ivmE8ln2Lg2xTde1Hbg9FPuZGKF8YxJ4Q8w8lBOWEdPy1L1JWSUZK3Fk
         QPoQ==
X-Gm-Message-State: AOAM531010GoTD2+MFwns+r3B37Ogtic6qUUd9O9ELshHkb+L2M8hucE
	ZgPHWsbH2PzUCIzaE9I0nlpmQwf7ggWWWQ==
X-Google-Smtp-Source: ABdhPJzXDwuCkVQ2imNd3f8hncnLPocbkmvG+rAdHE+a8ijI2JoKAEh4ZEJ8REI2cy8SHIHpW7UIiA==
X-Received: by 2002:ac8:6991:: with SMTP id o17mr10430844qtq.248.1629040142053;
        Sun, 15 Aug 2021 08:09:02 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id n124sm4690466qkf.119.2021.08.15.08.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Aug 2021 08:09:01 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] linux-yocto/5.13: update to v5.13.7
Date: Sun, 15 Aug 2021 11:08:51 -0400
Message-Id: <919bcc0e14fb2181c2ac16d774d680187efd2a54.1629039837.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1629039837.git.bruce.ashfield@gmail.com>
References: <cover.1629039837.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.13 to the latest korg -stable release that comprises
the following commits:

    f17352f54186 Linux 5.13.7
    f2cd12e7fd48 ipv6: ip6_finish_output2: set sk into newly allocated nskb
    0f448675132a ARM: dts: versatile: Fix up interrupt controller node names
    0ad0e62e74ce iomap: remove the length variable in iomap_seek_hole
    521168b44c08 iomap: remove the length variable in iomap_seek_data
    84342d6983f2 cifs: fix the out of range assignment to bit fields in parse_server_interfaces
    a46f1f66cfcb firmware: arm_scmi: Fix range check for the maximum number of pending messages
    ec67007e7406 firmware: arm_scmi: Fix possible scmi_linux_errmap buffer overflow
    ca03de06def9 hfs: add lock nesting notation to hfs_find_init
    8a2d2974d002 hfs: fix high memory mapping in hfs_bnode_read
    c2820b902115 hfs: add missing clean-up in hfs_fill_super
    37ac00a0d358 drm/ttm: add a check against null pointer dereference
    f11bec89ad63 nvme-pci: fix multiple races in nvme_setup_io_queues
    b34c668a867f ipv6: allocate enough headroom in ip6_finish_output2()
    3ba36f82d50d rcu-tasks: Don't delete holdouts within trc_wait_for_one_reader()
    1dccf9d5a724 rcu-tasks: Don't delete holdouts within trc_inspect_reader()
    83af97f61527 sctp: move 198 addresses from unusable to private scope
    7fd4d15f11b3 net: annotate data race around sk_ll_usec
    18f12f741d09 net/802/garp: fix memleak in garp_request_join()
    7184851762b3 net/802/mrp: fix memleak in mrp_request_join()
    141cf6c82b4f cgroup1: fix leaked context root causing sporadic NULL deref in LTP
    c294c83fb614 workqueue: fix UAF in pwq_unbound_release_workfn()
    72d0df0831ff af_unix: fix garbage collect vs MSG_PEEK
    6fdb13a7e573 Linux 5.13.6
    2db604ff60dd skbuff: Fix build with SKB extensions disabled
    429826249d80 sfc: ensure correct number of XDP queues
    b1ea64337fde spi: spi-cadence-quadspi: Fix division by zero warning - try2
    c4443564f8f6 drm/i915/gvt: Clear d3_entered on elsp cmd submission.
    9bad2eae08e2 perf inject: Close inject.output on exit
    5cf3d397fcf6 arm64: entry: fix KCOV suppression
    12b439933302 Documentation: Fix intiramfs script name
    337deea6460d ARM: multi_v7_defconfig: Make NOP_USB_XCEIV driver built-in
    a5fd9d3d35bc skbuff: Release nfct refcount on napi stolen or re-used skbs
    8f738d2d51cf mptcp: fix 'masking a bool' warning
    ecc9318db5ff bonding: fix build issue
    da510a38cb60 spi: spi-cadence-quadspi: Revert "Fix division by zero warning"
    bc93e9909cc8 drm/amdgpu: update golden setting for sienna_cichlid
    52ee22ce8af2 drm/amdgpu: update the golden setting for vangogh
    72097f7beefd drm/amdgpu: update gc golden setting for dimgrey_cavefish
    75ab00b813e4 drm: Return -ENOTTY for non-drm ioctls
    c9d31f7d17e4 driver core: Prevent warning when removing a device link from unregistered consumer
    9d06d3d2a16d nds32: fix up stack guard gap
    7544d21b4014 misc: eeprom: at24: Always append device id even if label property is set.
    6ef92931cc5b rbd: always kick acquire on "acquired" and "released" notifications
    8b334d74fbbd rbd: don't hold lock_rwsem while running_list is being drained
    79da14fac0b5 hugetlbfs: fix mount mode command line processing
    4861f6d3b90f mm: fix the deadlock in finish_fault()
    5d4b4d2e3c8d memblock: make for_each_mem_range() traverse MEMBLOCK_HOTPLUG regions
    0e88a5bee0f5 mm: page_alloc: fix page_poison=1 / INIT_ON_ALLOC_DEFAULT_ON interaction
    ee791f0bba88 mm: call flush_dcache_page() in memcpy_to_page() and memzero_page()
    5040926bc22d kfence: skip all GFP_ZONEMASK allocations
    e9adaed2f126 kfence: move the size check to the beginning of __kfence_alloc()
    60e7f63de337 userfaultfd: do not untag user pointers
    a6ead78130ad io_uring: fix early fdput() of file
    81cebadedc37 io_uring: remove double poll entry on arm failure
    0d80ae099a49 io_uring: explicitly count entries for poll reqs
    2f13b6fece9a selftest: use mmap instead of posix_memalign to allocate memory
    fae0c4bb0366 posix-cpu-timers: Fix rearm racing against process tick
    52db60a983d2 bus: mhi: pci_generic: Fix inbound IPCR channel
    aed4f5b51aba bus: mhi: core: Validate channel ID when processing command completions
    a88270680663 bus: mhi: pci_generic: Apply no-op for wake using sideband wake boolean
    ce5b3de58fc2 driver core: auxiliary bus: Fix memory leak when driver_register() fail
    423123e428a1 ixgbe: Fix packet corruption due to missing DMA sync
    b9a178f189bb media: ngene: Fix out-of-bounds bug in ngene_command_config_free_buf()
    f5ef2fe05d38 btrfs: fix lock inversion problem when doing qgroup extent tracing
    6f919907e92e btrfs: fix unpersisted i_size on fsync after expanding truncate
    a02b54480573 btrfs: check for missing device in btrfs_trim_fs
    020d8ceab341 tracing: Synthetic event field_pos is an index not a boolean
    917a5bdd114a tracing: Fix bug in rb_per_cpu_empty() that might cause deadloop.
    29ecaddb8655 tracing/histogram: Rename "cpu" to "common_cpu"
    58f47cfe5210 tracepoints: Update static_call before tp_funcs when adding a tracepoint
    0ea2fd39f119 firmware/efi: Tell memblock about EFI iomem reservations
    68a4037d5dd0 usb: typec: stusb160x: Don't block probing of consumer of "connector" nodes
    eeb18490e8f4 usb: typec: stusb160x: register role switch before interrupt registration
    703527bf8391 usb: typec: tipd: Don't block probing of consumer of "connector" nodes
    61c129211a3d usb: dwc2: gadget: Fix sending zero length packet in DDMA mode.
    bd062872040b usb: dwc2: gadget: Fix GOUTNAK flow for Slave mode.
    36b53430c97f usb: dwc2: Skip clock gating on Samsung SoCs
    b85e8638ba15 usb: gadget: Fix Unbalanced pm_runtime_enable in tegra_xudc_probe
    7138b108ecdb USB: serial: cp210x: add ID for CEL EM3588 USB ZigBee stick
    f1a01c2b4628 USB: serial: cp210x: fix comments for GE CS1000
    8a55cb17e401 USB: serial: option: add support for u-blox LARA-R6 family
    c9d143a3d8aa usb: renesas_usbhs: Fix superfluous irqs happen after usb_pkt_pop()
    d4179cdb769a usb: max-3421: Prevent corruption of freed memory
    3b5d8c72ffd5 USB: usb-storage: Add LaCie Rugged USB3-FW to IGNORE_UAS
    9499b2d2cc60 usb: hub: Fix link power management max exit latency (MEL) calculations
    c7affd5b0226 usb: hub: Disable USB 3 device initiated lpm if exit latency is too high
    1408e47ab233 KVM: PPC: Book3S HV Nested: Sanitise H_ENTER_NESTED TM state
    35e114e6f84a KVM: PPC: Book3S: Fix H_RTAS rets buffer overflow
    3d98808e2414 usb: ehci: Prevent missed ehci interrupts with edge-triggered MSI
    2c476bab2818 xhci: Fix lost USB 2 remote wake
    6c15cef90a45 usb: xhci: avoid renesas_usb_fw.mem when it's unusable
    62b022edb187 Revert "usb: renesas-xhci: Fix handling of unknown ROM state"
    0def8cf06098 ALSA: pcm: Fix mmap capability check
    7ca1bb5bace3 ALSA: pcm: Call substream ack() method upon compat mmap commit
    7810cd82b1ad ALSA: hdmi: Expose all pins on MSI MS-7C94 board
    7b75c0f0a668 ALSA: hda/realtek: Fix pop noise and 2 Front Mic issues on a machine
    ac8ea355df6d ALSA: sb: Fix potential ABBA deadlock in CSP driver
    ecdaa9716666 ALSA: usb-audio: Add registration quirk for JBL Quantum headsets
    498129dedee0 ALSA: usb-audio: Add missing proc text entry for BESPOKEN type
    ca4c5e5c7beb s390/boot: fix use of expolines in the DMA code
    fde6627ce6dc s390/ftrace: fix ftrace_update_ftrace_func implementation
    93af4d65538c mmc: core: Don't allocate IDA for OF aliases
    025b6262dc96 io_uring: Fix race condition when sqp thread goes to sleep
    ccf23a088807 ACPI: fix NULL pointer dereference
    343b467acb55 proc: Avoid mixing integer types in mem_rw()
    11b40c8a67fe cifs: fix fallocate when trying to allocate a hole.
    a803678bd60e cifs: only write 64kb at a time when fallocating a small region of a file
    ea826bd778f5 dpaa2-switch: seed the buffer pool after allocating the swp
    a0f2f2bf424d drm/panel: raspberrypi-touchscreen: Prevent double-free
    6cd7bb123703 net: sched: cls_api: Fix the the wrong parameter
    c95f925b0c7e RISC-V: load initrd wherever it fits into memory
    0bc325702d70 net: dsa: sja1105: make VID 4095 a bridge VLAN too
    ec7be4fdd8e1 tcp: disable TFO blackhole logic by default
    ad9bfbe97bde riscv: Fix 32-bit RISC-V boot failure
    fecd81c2e62f ibmvnic: Remove the proper scrq flush
    fee8c811ab34 udp: check encap socket in __udp_lib_err
    c1de376423a7 sctp: update active_key for asoc when old key is being replaced
    65bd5af10d02 nvme: set the PRACT bit when using Write Zeroes with T10 PI
    bc08be0ed085 r8169: Avoid duplicate sysfs entry creation error
    2131ea612692 afs: Fix setting of writeback_index
    8dda575c8912 afs: check function return
    3d888afffcf3 afs: Fix tracepoint string placement with built-in AFS
    6bd6db23b44d Revert "USB: quirks: ignore remote wake-up on Fibocom L850-GL LTE modem"
    de3a841649ae nvme-pci: don't WARN_ON in nvme_reset_work if ctrl.state is not RESETTING
    a521c15683c1 drm/ttm: Force re-init if ttm_global_init() fails
    e7732c5a19a1 scsi: target: Fix NULL dereference on XCOPY completion
    2ed13e8f7829 i2c: mpc: Poll for MCF
    a706c12da916 ceph: don't WARN if we're still opening a session to an MDS
    115784bcccf1 ipv6: fix another slab-out-of-bounds in fib6_nh_flush_exceptions
    34f1e1f657fa net/sched: act_skbmod: Skip non-Ethernet packets
    502731a03f27 io_uring: fix memleak in io_init_wq_offload()
    23c492a50418 spi: spi-bcm2835: Fix deadlock
    140e0dbad4cf net: hns3: fix rx VLAN offload state inconsistent issue
    1e3b38761394 net: hns3: fix possible mismatches resp of mailbox
    e52445629c2e ALSA: hda: intel-dsp-cfg: add missing ElkhartLake PCI ID
    ce9f267d9e8a net/tcp_fastopen: fix data races around tfo_active_disable_stamp
    b9d21b9b46bd net: hisilicon: rename CACHE_LINE_MASK to avoid redefinition
    a24886feddba bnxt_en: Check abort error state in bnxt_half_open_nic()
    c2ed50ff29f8 bnxt_en: Validate vlan protocol ID on RX packets
    a1a54e07e63c bnxt_en: fix error path of FW reset
    c8c2eed44e41 bnxt_en: Add missing check for BNXT_STATE_ABORT_ERR in bnxt_fw_rset_task()
    4564b85633b2 bnxt_en: Refresh RoCE capabilities in bnxt_ulp_probe()
    52b6ad30a026 bnxt_en: don't disable an already disabled PCI device
    8ac2e2d69b35 ACPI: utils: Fix reference counting in for_each_acpi_dev_match()
    587c2751068a efi/dev-path-parser: Switch to use for_each_acpi_dev_match()
    4657af6770c0 ACPI: Kconfig: Fix table override from built-in initrd
    24376facf2fd spi: cadence: Correct initialisation of runtime PM again
    6128d746d705 scsi: target: Fix protect handling in WRITE SAME(32)
    868ffb5f290f scsi: iscsi: Fix iface sysfs attr detection
    bc1660206c37 netrom: Decrease sock refcount when sock timers expire
    c9437655302c sctp: trim optlen when it's a huge value in sctp_setsockopt
    cac71d27745f net: sched: fix memory leak in tcindex_partial_destroy_work
    a4a488915fea KVM: PPC: Fix kvm_arch_vcpu_ioctl vcpu_load leak
    cdf4a0589eaf KVM: PPC: Book3S: Fix CONFIG_TRANSACTIONAL_MEM=n crash
    69f253c44401 net: decnet: Fix sleeping inside in af_decnet
    626cb6d84ba2 efi/tpm: Differentiate missing and invalid final event log table.
    f6eeb0829e1a ASoC: soc-pcm: add a flag to reverse the stop sequence
    57df79dd0b47 dma-mapping: handle vmalloc addresses in dma_common_{mmap,get_sgtable}
    eeaa4b8d1e2e usb: hso: fix error handling code of hso_create_net_device
    d20ce763c690 spi: spi-cadence-quadspi: Fix division by zero warning
    d4c7797ab151 net: fix uninit-value in caif_seqpkt_sendmsg
    3d6f06fb19fb bpftool: Check malloc return value in mount_bpffs_for_pin
    464c306367cb bpf, sockmap, udp: sk_prot needs inuse_idx set for proc stats
    600b122a690b bpf, sockmap, tcp: sk_prot needs inuse_idx set for proc stats
    6c508a1c6c62 bpf, sockmap: Fix potential memory leak on unlikely error case
    6be4502a80e3 s390/bpf: Perform r1 range checking before accessing jit->seen_reg[r1]
    7006eabb4044 liquidio: Fix unintentional sign extension issue on left shift of u16
    1dd68ece22ba net: dsa: mv88e6xxx: NET_DSA_MV88E6XXX_PTP should depend on NET_DSA_MV88E6XXX
    5bd05b57e901 drm/vc4: hdmi: Drop devm interrupt handler for CEC interrupts
    3ba73cb98302 timers: Fix get_next_timer_interrupt() with no timers pending
    364ec7249d01 ASoC: SOF: Intel: Update ADL descriptor to use ACPI power states
    a7537dc73e69 xdp, net: Fix use-after-free in bpf_xdp_link_release
    cbb086074dab bpf: Fix tail_call_reachable rejection for interpreter when jit failed
    cd12f874ae10 bpf, test: fix NULL pointer dereference on invalid expected_attach_type
    bc813a1ae95c ASoC: rt5631: Fix regcache sync errors on resume
    09b8cc781058 spi: mediatek: fix fifo rx mode
    edd1b2b19214 regulator: hi6421: Fix getting wrong drvdata
    ae58c13a6b24 regulator: hi6421: Use correct variable type for regmap api val argument
    ffb6e766e200 spi: stm32: fixes pm_runtime calls in probe/remove
    5b64a59c2c6e ASoC: wm_adsp: Correct wm_coeff_tlv_get handling
    14e7330ad106 Kbuild: lto: fix module versionings mismatch in GNU make 3.X
    4fc85eb66086 perf sched: Fix record failure when CONFIG_SCHEDSTATS is not set
    a83d04c140e3 perf data: Close all files in close_dir()
    ed0bdfef4ba5 perf probe-file: Delete namelist in del_events() on the error path
    871c7043aa52 perf lzma: Close lzma stream on exit
    e4518a4141f2 perf script: Fix memory 'threads' and 'cpus' leaks on exit
    a412ae547ed5 perf script: Release zstd data
    f50f139670f9 perf report: Free generated help strings for sort option
    97bb58171315 perf env: Fix memory leak of cpu_pmu_caps
    9f29d864b4ad perf test maps__merge_in: Fix memory leak of maps
    976804a726c7 perf dso: Fix memory leak in dso__new_map()
    e39103cfa102 perf test event_update: Fix memory leak of unit
    4db1e70516a4 perf test event_update: Fix memory leak of evlist
    19239ff4c98d perf test session_topology: Delete session->evlist
    76b70b7987e7 perf env: Fix sibling_dies memory leak
    1e338fb1f779 perf probe: Fix dso->nsinfo refcounting
    7ec2746ef5c6 perf map: Fix dso->nsinfo refcounting
    54dc8a81b785 perf inject: Fix dso->nsinfo refcounting
    ebeae3340557 firmware: arm_scmi: Ensure drivers provide a probe function
    1824f2a7d4a7 ARM: dts: aspeed: Update e3c246d4i vuart properties
    9fe5024f5738 arm64: mte: fix restoration of GCR_EL1 from suspend
    3a2c492e7528 KVM: SVM: Fix sev_pin_memory() error checks in SEV migration utilities
    9d85689380b6 KVM: SVM: Return -EFAULT if copy_to_user() for SEV mig packet header fails
    319b79706f63 KVM: x86/pmu: Clear anythread deprecated bit when 0xa leaf is unsupported on the SVM
    916450b2101b sfc: fix lack of XDP TX queues - error XDP TX failed (-22)
    14a3ed8ef868 net: ocelot: fix switchdev objects synced for wrong netdev with LAG offload
    d1f7e509dc3a nvme-pci: do not call nvme_dev_remove_admin from nvme_remove
    b093e56f137c net: phy: marvell10g: fix differentiation of 88X3310 from 88X3340
    b2fe6fc671ea mptcp: properly account bulk freed memory
    cd7f1414f170 mptcp: refine mptcp_cleanup_rbuf
    b24550868ff6 mptcp: use fast lock for subflows when possible
    c888aa863218 selftests: mptcp: fix case multiple subflows limited by server
    fe2350115a5f mptcp: avoid processing packet if a subflow reset
    1dabd873933f mptcp: add sk parameter for mptcp_get_options
    89aa6912f2cf mptcp: fix syncookie process if mptcp can not_accept new subflow
    1aa3ffb95fdc mptcp: remove redundant req destruct in subflow_check_req()
    688984fc1af1 mptcp: fix warning in __skb_flow_dissect() when do syn cookie for subflow join
    5a870ea6e8b7 drm/vmwgfx: Fix a bad merge in otable batch takedown
    441b2f191e9f cxgb4: fix IRQ free race during driver unload
    efdf9d46bc15 pwm: sprd: Ensure configuring period and duty_cycle isn't wrongly skipped
    6c75b21b2aab selftests: icmp_redirect: IPv6 PMTU info should be cleared after redirect
    84d37878814b selftests: icmp_redirect: remove from checking for IPv6 route get
    b11b6ecda552 stmmac: platform: Fix signedness bug in stmmac_probe_config_dt()
    350e10d21733 ipv6: fix 'disable_policy' for fwd packets
    8994e395fc39 bonding: fix incorrect return value of bond_ipsec_offload_ok()
    4ac748c4b224 bonding: fix suspicious RCU usage in bond_ipsec_offload_ok()
    42ec69b9cd7d bonding: Add struct bond_ipesc to manage SA
    d5e9ed0855a4 bonding: disallow setting nested bonding + ipsec offload
    c24d04866549 bonding: fix suspicious RCU usage in bond_ipsec_del_sa()
    a1f01d2ddb55 ixgbevf: use xso.real_dev instead of xso.dev in callback functions of struct xfrmdev_ops
    9863701fa0ec bonding: fix null dereference in bond_ipsec_add_sa()
    9ae2584fdd67 bonding: fix suspicious RCU usage in bond_ipsec_add_sa()
    08d21fa872ec bpf, samples: Fix xdpsock with '-M' parameter missing unload process
    b2a6c45d44e9 gve: Fix an error handling path in 'gve_probe()'
    2f2b3b953b43 net: stmmac: Terminate FPE workqueue in suspend
    317de567c112 igb: Fix position of assignment to *ring
    6c82171aa35b igb: Check if num of q_vectors is smaller than max before array access
    e2b71652a5e3 iavf: Fix an error handling path in 'iavf_probe()'
    2f5343365d17 e1000e: Fix an error handling path in 'e1000_probe()'
    b928fdcafad9 fm10k: Fix an error handling path in 'fm10k_probe()'
    a0169ebdb140 igb: Fix an error handling path in 'igb_probe()'
    67ad97444580 igc: Fix an error handling path in 'igc_probe()'
    67a846441f8e ixgbe: Fix an error handling path in 'ixgbe_probe()'
    9d81d1be9f31 igc: change default return of igc_read_phy_reg()
    8e24c12f2ff6 igb: Fix use-after-free error during reset
    ea5e36b7367e igc: Fix use-after-free error during reset

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.13.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.13.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
index daf3d41a69..7c64be9839 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f7609685b99c816483dd1eb4d3d7cfd236abcd8a"
-SRCREV_meta ?= "45ba17c2208f4b39c36fdb748df5929b8f6b6f83"
+SRCREV_machine ?= "9d25766975f6a5f7970538037ec053739dfe2917"
+SRCREV_meta ?= "ace78a314c1fcbf7bd34791f4b0d014c83bb9b2e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.13.5"
+LINUX_VERSION ?= "5.13.7"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
index 4cc0d9409f..6314ca7d49 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.13.5"
+LINUX_VERSION ?= "5.13.7"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "52d457436c83b3ce994a12d5387c532df7859e3d"
-SRCREV_machine ?= "e167b61e5f9f6e6de8d57f72ed022ea6cdf9ba85"
-SRCREV_meta ?= "45ba17c2208f4b39c36fdb748df5929b8f6b6f83"
+SRCREV_machine:qemuarm ?= "b20abcb92e2131d0307bcc2fc71619449c0a7313"
+SRCREV_machine ?= "463cfa7f09e18123185a5c04f6bd874baed76ccb"
+SRCREV_meta ?= "ace78a314c1fcbf7bd34791f4b0d014c83bb9b2e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
index 9a215bfe11..ad879c121d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.13/standard/base"
 KBRANCH:qemux86-64 ?= "v5.13/standard/base"
 KBRANCH:qemumips64 ?= "v5.13/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d7f11adcd88182a9201a9901f3ccd07e2143bf5b"
-SRCREV_machine:qemuarm64 ?= "8ba49ea4d2954c788b44acf8efd2713d8d69f1e3"
-SRCREV_machine:qemumips ?= "9d92ef75cabdf752e3186aa734ba57866cc512d9"
-SRCREV_machine:qemuppc ?= "6fac7caad94efa0be0e46d04af4e7b5f1300aa92"
-SRCREV_machine:qemuriscv64 ?= "aa7f96bda2be286bc15b1131be30411bb6016ea1"
-SRCREV_machine:qemuriscv32 ?= "aa7f96bda2be286bc15b1131be30411bb6016ea1"
-SRCREV_machine:qemux86 ?= "aa7f96bda2be286bc15b1131be30411bb6016ea1"
-SRCREV_machine:qemux86-64 ?= "aa7f96bda2be286bc15b1131be30411bb6016ea1"
-SRCREV_machine:qemumips64 ?= "c6c25c0c1a64480f255a9c2e86895db0aea8b92b"
-SRCREV_machine ?= "aa7f96bda2be286bc15b1131be30411bb6016ea1"
-SRCREV_meta ?= "45ba17c2208f4b39c36fdb748df5929b8f6b6f83"
+SRCREV_machine:qemuarm ?= "e60a114de1d12cc9cc522744442c0e212992b480"
+SRCREV_machine:qemuarm64 ?= "0b6fb68102f301774228315b13aa9f5027f1bf3b"
+SRCREV_machine:qemumips ?= "05f785b4ea88d196349c9fd07e09e867d9ce04cb"
+SRCREV_machine:qemuppc ?= "ac41bcb4f779c128c43175f81c376a8b7a68e8d6"
+SRCREV_machine:qemuriscv64 ?= "c1eb1eaf6fd3f1302b89194f629eafb9368a326a"
+SRCREV_machine:qemuriscv32 ?= "c1eb1eaf6fd3f1302b89194f629eafb9368a326a"
+SRCREV_machine:qemux86 ?= "c1eb1eaf6fd3f1302b89194f629eafb9368a326a"
+SRCREV_machine:qemux86-64 ?= "c1eb1eaf6fd3f1302b89194f629eafb9368a326a"
+SRCREV_machine:qemumips64 ?= "f775f677e4f8e1a57e39b85ac74f3052477cef6d"
+SRCREV_machine ?= "c1eb1eaf6fd3f1302b89194f629eafb9368a326a"
+SRCREV_meta ?= "ace78a314c1fcbf7bd34791f4b0d014c83bb9b2e"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "45ba17c2208f4b39c36fdb748df5929b8f6b6f83"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "25423f4bd9a9ac3e6b0ce7ecfe56c36f4e514893"
+SRCREV_machine:class-devupstream ?= "f17352f54186bbf084d147e15efb5340430aacae"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.13/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.13.5"
+LINUX_VERSION ?= "5.13.7"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

