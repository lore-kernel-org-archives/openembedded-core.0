Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 091207E265
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 22:01:05 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id z19so8377505ior.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 15:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=mnGpsBbiXVyLaQG6S8XXu4BtBeCvmkanhs5FFv0u8U8=;
	b=Et0oi04HY2tYHFEOsVkVZHIax8BK4f8YsoggTy2IagnFeQt0NjO1h5yFMnak0ErMaU
	s1d9bv0Etpqm2AV/lPZhe/t1rwCTV0FOxHE4C7W15ixuPhMMCA295MbzATbwvgjzUiuh
	zTGUaKJoIK9I5wsoq61KUFK4BjmDAU82/mtqRJO/vDhISfP3ucDpyksY3BPTFoU1nzrs
	Fnqemqi9kYDbyD/FaX680TkffeGDliH8SxMfuAcc+L46YfH7FNtZqCDCY2474d21MWPl
	XQ3CxaOGxchSFCL5IzWAgsQGBUQF0wVCg6zerrdAMeS8CFsmINizlViZZyfq58pezHRV
	IMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=mnGpsBbiXVyLaQG6S8XXu4BtBeCvmkanhs5FFv0u8U8=;
	b=dqghlNLKpEGu8n/5TCg8fO3CmyEvW+DxOfIx15qMEjTrJ2b2x/LYOd4pJVs12kGVST
	lHRjMQlA8psNkSkzgLgf3Q1bZJBVK/cyyq0Nwbs+eRKecFUiMqgO9J8BlK1bTV7rW94V
	3tv4yFylXQHK1pVDUmYsbTBz/t9SU+96YEhCGhqy8MQ+EjRzAsNe13FyVTDv/zgopfeP
	l74RjFrc4go0qCub9fGTKAhpih7L5LtyP1hi2G8jIfC54cqCvID/mWn3Hx9JfVOrNq8G
	7Y581FdgKQ05X5k+8hx/CTbnqKPKs2VdE19UMLox9pUll41C+e2ko2GIwfSqfTfHi/j1
	GEFQ==
X-Gm-Message-State: APjAAAUHNUKoomMly/dZAEoYdtRNBbRQFUHN1RpzkZUQGOf/WpLFo9Qg
	4n5kkdgfKPUrdfRbA4vwAY0=
X-Google-Smtp-Source: APXvYqx5T0QF1R2rcxtkOjwqlbgowwN5FGtZTerIScgU2Yk/+ycy3tyLFQsOM7smYNld6nxqOK/7hQ==
X-Received: by 2002:a5d:9a86:: with SMTP id c6mr1508962iom.118.1569362466736; 
	Tue, 24 Sep 2019 15:01:06 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	x12sm3040895ioh.76.2019.09.24.15.01.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 15:01:05 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue, 24 Sep 2019 18:00:57 -0400
Message-Id: <74dfbaed34f8830d22948554799d36fcc4888419.1569362299.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1569362299.git.bruce.ashfield@gmail.com>
References: <cover.1569362299.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/5.2: update to v5.2.16
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Sep 2019 22:01:06 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.2 to the latest korg -stable release that comprises
the following commits:

    1e2ba4a74fa7 Linux 5.2.16
    2508f833875c x86/build: Add -Wnoaddress-of-packed-member to REALMODE_CFLAGS, to silence GCC9 build warning
    8803770b85d3 rsi: fix a double free bug in rsi_91x_deinit()
    d8bcd38cb933 platform/x86: pcengines-apuv2: use KEY_RESTART for front button
    f7a15c7068f0 platform/x86: pmc_atom: Add CB4063 Beckhoff Automation board to critclk_systems DMI table
    657d4ca80d64 KVM: SVM: Fix detection of AMD Errata 1096
    54d782e7c865 kvm: nVMX: Remove unnecessary sync_roots from handle_invept
    00ab9eeb0314 modules: always page-align module section allocations
    ec93d0db91ce modules: fix compile error if don't have strict module rwx
    0a199213f586 modules: fix BUG when load module with rodata=n
    63e3de7299ba iio: adc: stm32-dfsdm: fix data type
    bb9dee6edb5a iio: adc: stm32-dfsdm: fix output resolution
    83ad11d6d7fa Revert "Bluetooth: btusb: driver to enable the usb-wakeup feature"
    7c218ebc7899 mm/z3fold.c: fix lock/unlock imbalance in z3fold_page_isolate
    1894d857ce86 mm/z3fold.c: remove z3fold_migration trylock
    ead8b4f3b2f9 drm/mediatek: mtk_drm_drv.c: Add of_node_put() before goto
    009b31923398 drm: panel-orientation-quirks: Add extra quirk table entry for GPD MicroPC
    6dbe4b80180c firmware: ti_sci: Always request response from firmware
    71f0dafe61ce crypto: talitos - HMAC SNOOP NO AFEU mode requires SW icv checking.
    456945703690 crypto: talitos - Do not modify req->cryptlen on decryption.
    dcefbf43b003 crypto: talitos - fix ECB algs ivsize
    291d9ef44614 crypto: talitos - check data blocksize in ablkcipher.
    86545794d2e5 crypto: talitos - fix CTR alg blocksize
    808a33cd37dd crypto: talitos - check AES key size
    0a7737c960e3 driver core: Fix use-after-free and double free on glue directory
    6502d1acbe63 ubifs: Correctly use tnc_next() in search_dh_cookie()
    85e398e6aa01 PCI: Always allow probing with driver_override
    f5a7b0f01b23 mtd: rawnand: mtk: Fix wrongly assigned OOB buffer pointer issue
    7b20eb930bd0 clk: rockchip: Don't yell about bad mmc phases when getting
    4111a1f2142e mt76: mt7615: Use after free in mt7615_mcu_set_bcn()
    195d154b8a71 mt76: Fix a signedness bug in mt7615_add_interface()
    76d64d6d9ed8 clk: Simplify debugfs printing and add a newline
    268311c39a7f clk: Fix debugfs clk_possible_parents for clks without parent string names
    a9258bc6e0b3 drm/meson: Add support for XBGR8888 & ABGR8888 formats
    5924bb61ac94 x86/ima: check EFI SetupMode too
    c5699cc857a0 x86/boot: Use efi_setup_data for searching RSDP on kexec-ed kernels
    2fd4aaaf615d kernel/module: Fix mem leak in module_add_modinfo_attrs
    a9ce57d57155 powerpc: Add barrier_nospec to raw_copy_in_user()
    6876bd0c34c8 x86/purgatory: Change compiler flags from -mcmodel=kernel to -mcmodel=large to fix kexec relocation errors
    cc0feeebbb3f KVM: nVMX: handle page fault in vmread
    9e8659bdca66 KVM: x86/mmu: Reintroduce fast invalidate/zap for flushing memslot
    db68c0c83a76 KVM: x86: work around leak of uninitialized stack contents
    17cd7cf4b355 KVM: s390: Do not leak kernel stack data in the KVM_S390_INTERRUPT ioctl
    0c3ffd500445 KVM: s390: kvm_s390_vm_start_migration: check dirty_bitmap before using it as target for memset()
    71661b871973 regulator: twl: voltage lists for vdd1/2 on twl4030
    803c7bbc0d5d genirq: Prevent NULL pointer dereference in resend_irqs()
    041f865f676b mt76: mt76x0e: disable 5GHz band for MT7630E
    fbf07d827d82 Revert "rt2800: enable TX_PIN_CFG_LNA_PE_ bits per band"
    868921b1f3d5 ixgbe: Prevent u8 wrapping of ITR value to something less than 10us
    c42a7b87b8d7 ixgbe: fix double clean of Tx descriptors with xdp
    076566aafd94 ipc: fix sparc64 ipc() wrapper
    b2c92cb1d141 ipc: fix semtimedop for generic 32-bit architectures
    b68833b65bf0 drm/i915: Restore relaxed padding (OCL_OOB_SUPPRES_ENABLE) for skl+
    e0e11df7f249 drm/i915: Limit MST to <= 8bpc once again
    8eb5a78c20e8 drm/lima: fix lima_gem_wait() return value
    46d1c96a1a5e mmc: tmio: Fixup runtime PM management during remove
    f5e9862fedd0 mmc: tmio: Fixup runtime PM management during probe
    e5b9762c20a3 Revert "mmc: sdhci: Remove unneeded quirk2 flag of O2 SD host controller"
    0699a10fe9ed Revert "mmc: bcm2835: Terminate timeout work synchronously"
    c554749c3f7e cgroup: freezer: fix frozen state inheritance
    4fa875f06c43 Btrfs: fix assertion failure during fsync and use of stale transaction
    09234426db8f gpio: fix line flag validation in lineevent_create
    94cd945b2d24 gpio: fix line flag validation in linehandle_create
    c54f5198f527 gpio: mockup: add missing single_release()
    06477d8e4425 gpiolib: acpi: Add gpiolib_acpi_run_edge_events_on_boot option and blacklist
    3c0bf14d186b net: sock_map, fix missing ulp check in sock hash case
    f3724b27ca29 sctp: fix the missing put_user when dumping transport thresholds
    488eefe22491 net: fixed_phy: Add forward declaration for struct gpio_desc;
    e33190acd588 ipv6: addrconf_f6i_alloc - fix non-null pointer check to !IS_ERR()
    e854b3329bd9 net-ipv6: fix excessive RTF_ADDRCONF flag on ::1/128 local route (and others)
    eddd5617db91 tun: fix use-after-free when register netdev failed
    48da78093aa1 tipc: add NULL pointer check before calling kfree_rcu
    055102e1467f tcp: fix tcp_ecn_withdraw_cwr() to clear TCP_ECN_QUEUE_CWR
    434e93757f3f sctp: use transport pf_retrans in sctp_do_8_2_transport_strike
    91c1460ecbf5 sctp: Fix the link time qualifier of 'sctp_ctrlsock_exit()'
    af241597df3e sch_hhf: ensure quantum and hhf_non_hh_weight are non-zero
    c36f33d49df7 net: sched: fix reordering issues
    69b37604889b net: phylink: Fix flow control resolution
    92984818ff8c net: gso: Fix skb_segment splat when splitting gso_size mangled skb having linear-headed frag_list
    f8f235f9a5dc net: Fix null de-reference of device refcount
    c012f28d7a73 ixgbevf: Fix secpath usage for IPsec Tx offload
    dc0921f74221 ixgbe: Fix secpath usage for IPsec TX offload.
    3d970bbd8f0d isdn/capi: check message length in capi_write()
    2e898bf96a7d ipv6: Fix the link time qualifier of 'ping_v6_proc_exit_net()'
    4702849bf8af cdc_ether: fix rndis support for Mediatek based smartphones
    7b2687fe1142 bridge/mdb: remove wrong use of NLM_F_MULTI
    6e282ba6ff6b Linux 5.2.15
    e86a7794620a vhost: make sure log_num < in_num
    f6b72d0920f4 Btrfs: fix unwritten extent buffers and hangs on future writeback attempts
    051d85e1b2d3 drm/i915/icl: whitelist PS_(DEPTH|INVOCATION)_COUNT
    0b50b2beafe7 drm/i915: Add whitelist workarounds for ICL
    a22fc7cea6af drm/i915: whitelist PS_(DEPTH|INVOCATION)_COUNT
    abb4c8b10fc7 drm/i915: Support whitelist workarounds on all engines
    d05cba91e1de drm/i915: Support flags in whitlist WAs
    4b1bac380cdc virtio/s390: fix race on airq_areas[]
    8db034bb05b1 usb: chipidea: imx: fix EPROBE_DEFER support during driver probe
    e7bc0c0aeb77 usb: chipidea: imx: add imx7ulp support
    cb77c43fa0bb mmc: sdhci-sprd: Fix the incorrect soft reset operation when runtime resuming
    c0e2dbd7d707 drm/i915: Make sure cdclk is high enough for DP audio on VLV/CHV
    07c37f641842 drm/i915: Disable SAMPLER_STATE prefetching on all Gen11 steppings.
    c31f3dc4e075 IB/hfi1: Unreserve a flushed OPFN request
    bef755d188f5 IB/{rdmavt, qib, hfi1}: Convert to new completion API
    9d3d11319bd2 IB/rdmavt: Add new completion inline
    16d2d609ff0f bcache: fix race in btree_flush_write()
    913855877794 bcache: add comments for mutex_lock(&b->write_lock)
    b622ba2bcd4e bcache: only clear BTREE_NODE_dirty bit when it is set
    bb70b2729b7a batman-adv: Only read OGM tvlv_len after buffer len check
    e2b3974bc4ab batman-adv: fix uninit-value in batadv_netlink_get_ifindex()
    398f2c8277f2 powerpc/tm: Fix restoring FP/VMX facility incorrectly on interrupts
    7f20c56c0b7a powerpc/tm: Fix FP/VMX unavailable exceptions inside a transaction
    12c6a7776680 powerpc/64e: Drop stale call to smp_processor_id() which hangs SMP startup
    6890ea590cb7 vhost/test: fix build for vhost test - again
    478e21d516d2 vhost/test: fix build for vhost test
    9844e52dd977 drm/nouveau/sec2/gp102: add missing MODULE_FIRMWAREs
    ee116fa63272 drm/vmwgfx: Fix double free in vmw_recv_msg()
    1f570399e490 sched/fair: Don't assign runtime for throttled cfs_rq
    f43cf5ff54a2 ALSA: hda/realtek - Fix the problem of two front mics on a ThinkCentre
    b305db85076a ALSA: hda/realtek - Enable internal speaker & headset mic of ASUS UX431FL
    6157216e86f3 ALSA: hda/realtek - Add quirk for HP Pavilion 15
    dfdf3c29f72a ALSA: hda/realtek - Fix overridden device-specific initialization
    1a413713ee16 ALSA: hda - Fix potential endless loop at applying quirks
    d89e8b4684f1 gpio: pca953x: use pca953x_read_regs instead of regmap_bulk_read
    b3a1644a19a7 gpio: pca953x: correct type of reg_direction
    997fee5473ce Linux 5.2.14
    0ccc5c227f88 Revert "mmc: core: do not retry CMD6 in __mmc_switch()"
    317a66e24b46 x86/boot: Preserve boot_params.secure_boot from sanitizing
    1a7fd193e9d8 Revert "x86/apic: Include the LDR when clearing out APIC registers"
    ae96cf9e1e31 libceph: allow ceph_buffer_put() to receive a NULL ceph_buffer
    8d50b82ea79b x86/boot/compressed/64: Fix missing initialization in find_trampoline_placement()
    852a051ef22b KVM: arm/arm64: VGIC: Properly initialise private IRQ affinity
    44dfa46aaf7c gpio: Fix irqchip initialization order
    157ec0a3f834 RDMA/bnxt_re: Fix stack-out-of-bounds in bnxt_qplib_rcfw_send_message
    cf9ec2e9056c afs: use correct afs_call_type in yfs_fs_store_opaque_acl2
    3f6685835889 afs: Fix possible oops in afs_lookup trace event
    c231241d83b9 afs: Fix leak in afs_lookup_cell_rcu()
    7f134d569e1a KVM: arm/arm64: Only skip MMIO insn once
    39c62cdaa2d4 ceph: fix buffer free while holding i_ceph_lock in fill_inode()
    c4e28be29a45 ceph: fix buffer free while holding i_ceph_lock in __ceph_build_xattrs_blob()
    f41cd559f1f3 ceph: fix buffer free while holding i_ceph_lock in __ceph_setxattr()
    3ebab463e9f4 drm/amdgpu: prevent memory leaks in AMDGPU_CS ioctl
    23da8e9ef69b selftests/kvm: make platform_info_test pass on AMD
    666a41848d72 selftests: kvm: fix state save/load on processors without XSAVE
    dd53d830bb30 infiniband: hfi1: fix memory leaks
    bcb3211656fa infiniband: hfi1: fix a memory leak bug
    1e93149659cc IB/mlx4: Fix memory leaks
    fc38afc04343 RDMA/cma: fix null-ptr-deref Read in cma_cleanup
    d61a256fece2 nvme: Fix cntlid validation when not using NVMEoF
    e1031b6c8100 nvme-multipath: fix possible I/O hang when paths are updated
    6950d5b64a15 Tools: hv: kvp: eliminate 'may be used uninitialized' warning
    195b5aa923ec Input: hyperv-keyboard: Use in-place iterator API in the channel callback
    31b60e5c604c scsi: lpfc: Mitigate high memory pre-allocation by SCSI-MQ
    aa4bc3a35253 x86/boot/compressed/64: Fix boot on machines with broken E820 table
    3091859b0b5e HID: cp2112: prevent sleeping function called from invalid context
    e8fd4f47b224 HID: intel-ish-hid: ipc: add EHL device id
    d58500c6fcb4 kprobes: Fix potential deadlock in kprobe_optimizer()
    9ad89d579c01 sched/core: Schedule new worker even if PI-blocked
    086ddc5e7172 ravb: Fix use-after-free ravb_tstamp_skb
    37f12b895446 wimax/i2400m: fix a memory leak bug
    461f5b613b4d net: cavium: fix driver name
    1915dd1826be ibmvnic: Unmap DMA address of TX descriptor buffers after use
    895a07a5a03a net: kalmia: fix memory leaks
    241a735f5f68 cx82310_eth: fix a memory leak bug
    e8f8411a8def vfs: fix page locking deadlocks when deduping files
    a4234e27ed05 lan78xx: Fix memory leaks
    96ece5798677 clk: Fix potential NULL dereference in clk_fetch_parent_index()
    a6cb8dd3664e clk: Fix falling back to legacy parent string matching
    7da16490e5a5 net: myri10ge: fix memory leaks
    0f1c537cf09c liquidio: add cleanup in octeon_setup_iq()
    101743ca0284 selftests: kvm: fix vmx_set_nested_state_test
    5aac82ac9c7c selftests: kvm: provide common function to enable eVMCS
    926a6e9efce9 selftests: kvm: do not try running the VM in vmx_set_nested_state_test
    bf31a46ead59 cxgb4: fix a memory leak bug
    46bf670f4455 scsi: target: tcmu: avoid use-after-free after command timeout
    8e639df33729 scsi: qla2xxx: Fix gnl.l memory leak on adapter init failure
    6fe444e60cda drm/mediatek: set DMA max segment size
    1e12afb4c60a drm/mediatek: use correct device to import PRIME buffers
    2b4a29f04533 netfilter: nft_flow_offload: skip tcp rst and fin packets
    1dcb0d4eaf85 gpio: Fix build error of function redefinition
    f6bd80bc6223 ibmveth: Convert multicast list size for little-endian system
    d45c33d890bc s390/qeth: serialize cmd reply with concurrent timeout
    b12691c24ea9 Bluetooth: hci_qca: Send VS pre shutdown command.
    113d5ca74866 Bluetooth: btqca: Add a short delay before downloading the NVM
    ab0f749707ea net: tc35815: Explicitly check NET_IP_ALIGN is not zero in tc35815_rx
    37a0be861375 hv_netvsc: Fix a warning of suspicious RCU usage
    936315c0c94e ixgbe: fix possible deadlock in ixgbe_service_task()
    1dc961de7733 tools: bpftool: fix error message (prog -> object)
    ea3c243ce799 netfilter: nf_flow_table: teardown flow timeout race
    96a517d0ba5f netfilter: nf_flow_table: conntrack picks up expired flows
    586f00143091 netfilter: nf_tables: use-after-free in failing rule with bound set
    830b5c3760ff net: tundra: tsi108: use spin_lock_irqsave instead of spin_lock_irq in IRQ context
    60a4f2b2b6b8 clk: samsung: exynos542x: Move MSCL subsystem clocks to its sub-CMU
    c65a2b20a934 clk: samsung: exynos5800: Move MAU subsystem clocks to MAU sub-CMU
    f7bd5e9fe13f clk: samsung: Change signature of exynos5_subcmus_init() function
    8f37477964e9 net/mlx5e: Fix error flow of CQE recovery on tx reporter
    701b89908ba1 netfilter: nf_flow_table: fix offload for flows that are subject to xfrm
    b8a132a4c4b6 libbpf: set BTF FD for prog only when there is supported .BTF.ext data
    a65fb2895af4 libbpf: fix erroneous multi-closing of BTF FD
    fa689968da49 batman-adv: Fix netlink dumping of all mcast_flags buckets
    a4c88340b3ea net/rds: Fix info leak in rds6_inc_info_copy()
    fdd2bc365fc6 net/sched: pfifo_fast: fix wrong dereference when qdisc is reset
    e9cc0513248f net/sched: pfifo_fast: fix wrong dereference in pfifo_fast_enqueue
    0b003edac850 net: dsa: tag_8021q: Future-proof the reserved fields in the custom VID
    c7f05c1d9bf4 Add genphy_c45_config_aneg() function to phy-c45.c
    98ded313ffda net/sched: cbs: Set default link speed to 10 Mbps in cbs_set_port_rate
    622f16b30519 taprio: Set default link speed to 10 Mbps in taprio_set_picos_per_byte
    4f15d0e51268 taprio: Fix kernel panic in taprio_destroy
    61f10b1bb84d r8152: remove calling netif_napi_del
    5a9ceccb6385 Revert "r8152: napi hangup fix after disconnect"
    7e21536433d0 nfp: flower: handle neighbour events on internal ports
    f7ec32a4ae5c nfp: flower: prevent ingress block binds on internal ports
    64a2a93ba385 tcp: remove empty skb from write queue in error cases
    5cef2bfc9e3f tcp: inherit timestamp on mtu probe
    939cc35d5f81 net: stmmac: dwmac-rk: Don't fail if phy regulator is absent
    505aac7f4e48 net_sched: fix a NULL pointer deref in ipt action
    3c6dfd2adb7a net: sched: act_sample: fix psample group handling on overwrite
    5038bd027ac3 net: fix skb use after free in netpoll
    baa513580b25 mld: fix memory leak in mld_del_delrec()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index 490b1259b7..51897cecf0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "89f4bf508fd9ac595f548351e5558ba5d9f16a44"
-SRCREV_meta ?= "1763be055f7ff1a3215c2d068f1df1b08ad5ac70"
+SRCREV_machine ?= "ba6587bae365332e58b2b6a30e4a93b9ff1c0b26"
+SRCREV_meta ?= "3f2c84ec315b2907de990a5097efe23c605d9e51"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.2.14"
+LINUX_VERSION ?= "5.2.16"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index a55fd3d3e4..c2b13c8f68 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.2.14"
+LINUX_VERSION ?= "5.2.16"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "cbcaf69305e4b0790bbdce30a615e5adfcba74a2"
-SRCREV_machine ?= "c225913886b6aff4372d209f41f59cee4eeae724"
-SRCREV_meta ?= "1763be055f7ff1a3215c2d068f1df1b08ad5ac70"
+SRCREV_machine_qemuarm ?= "370a0916e3713a04268fef6b835d0a43faf15196"
+SRCREV_machine ?= "23cc3d3314b5d3482c595baaa036edd2b6d1b69b"
+SRCREV_meta ?= "3f2c84ec315b2907de990a5097efe23c605d9e51"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index 8857bd019b..23b4f4f5af 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b1a5d8b801acdd81240824e167126adb3cdcd9f1"
-SRCREV_machine_qemuarm64 ?= "c225913886b6aff4372d209f41f59cee4eeae724"
-SRCREV_machine_qemumips ?= "26055f7dcb659edd43b21519019d4773188570c7"
-SRCREV_machine_qemuppc ?= "c225913886b6aff4372d209f41f59cee4eeae724"
-SRCREV_machine_qemuriscv64 ?= "c225913886b6aff4372d209f41f59cee4eeae724"
-SRCREV_machine_qemux86 ?= "c225913886b6aff4372d209f41f59cee4eeae724"
-SRCREV_machine_qemux86-64 ?= "c225913886b6aff4372d209f41f59cee4eeae724"
-SRCREV_machine_qemumips64 ?= "1266ed0842cc08adba6086ec4af268bc87a576a4"
-SRCREV_machine ?= "c225913886b6aff4372d209f41f59cee4eeae724"
-SRCREV_meta ?= "1763be055f7ff1a3215c2d068f1df1b08ad5ac70"
+SRCREV_machine_qemuarm ?= "279084b42cecd49010a59e2850887f39772226d8"
+SRCREV_machine_qemuarm64 ?= "23cc3d3314b5d3482c595baaa036edd2b6d1b69b"
+SRCREV_machine_qemumips ?= "e4e184d31c8e43987077a47d84d8e40963e4bf70"
+SRCREV_machine_qemuppc ?= "23cc3d3314b5d3482c595baaa036edd2b6d1b69b"
+SRCREV_machine_qemuriscv64 ?= "23cc3d3314b5d3482c595baaa036edd2b6d1b69b"
+SRCREV_machine_qemux86 ?= "23cc3d3314b5d3482c595baaa036edd2b6d1b69b"
+SRCREV_machine_qemux86-64 ?= "23cc3d3314b5d3482c595baaa036edd2b6d1b69b"
+SRCREV_machine_qemumips64 ?= "cf8ce04ac2a888234fbd168c7208504f632407fa"
+SRCREV_machine ?= "23cc3d3314b5d3482c595baaa036edd2b6d1b69b"
+SRCREV_meta ?= "3f2c84ec315b2907de990a5097efe23c605d9e51"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.2.14"
+LINUX_VERSION ?= "5.2.16"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


