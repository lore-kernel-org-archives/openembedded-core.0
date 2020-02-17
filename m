Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id A4DA5614FE
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 16:01:03 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id p14so9119727pfn.4
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 08:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ck15ySwomfQuHOMq+aVQHT1wDbdLd1bPI2VGNojI9LA=;
	b=EsEbhrQZFYB1ZoF1fVHkUDChly2CAGFco8I5YC+MjWbtw82Fw3rZVk33afOh3AH/cw
	Xz9QgUMSiGma0TBs1wNhqxezdXhxXTxw7B1m53fc7QFt/ASViWDgLYHkFFRbcuLJZi+J
	qYyz99gURDRLw5Bg+r0G7awuCqa9ha9bwM49d0r/HaYIh6PbkdFFw5VpN7/e/eXRQORO
	sejqPgOYbEbRHSdrvkxRNI6KjHZY5xhKWuV1DccOw+LAWtqhxtCNiBbf6lEBv/K+WILD
	Xs1pyYCSiITALNw0RtWrQPHZoNgVbxkQ4iSDRZwSBp+eEpAtushOpk2tC9yueCo0ANnZ
	Gd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ck15ySwomfQuHOMq+aVQHT1wDbdLd1bPI2VGNojI9LA=;
	b=M0UFQdvIwS0ol0WNnV/5Azr7mYxAkLtEJ84RZkAgFR4/XFS4iwE+YFVbG2BB2MZ70K
	CJpfOMCMYN9m1C/VNOpI3D/RtBZUvplhvvwis3sYqNpAPP61c6oN2xHVdU/83XzvtF0P
	iwLZ8joAGSQkSDMcaBpqt0BgUyp4XgWbnRhozNVmKWoka3YbTq545hR4o8nsTlCdB1kr
	887UH1J3uOhqrgQ7YIEWhnTzGdIdtlSAR14kpwROaDSf7V0OoG+RZVYQuc03x1PCZfDh
	3hoMESWclKeosIl9xSa1X8105Ol+UlY9M7VX6wFb9IDrDviEp+x8x5mh4csoaLCNUd/4
	L2Vg==
X-Gm-Message-State: APjAAAXRxUm7HMB6Kkzi7/BeIPGpnmzsNBGHeEST8SnmWWQ4t3KXZlKa
	cSPt4n5rdFedHMyVS+S1p2gX88E/
X-Google-Smtp-Source: APXvYqwTulBzGJf27JvRB8imylQJ2VYf+iRYzfkgtnHiI05hMi3mNrOPB7eSZFtxGK44ZoSHTLrH/g==
X-Received: by 2002:a17:90a:b10b:: with SMTP id
	z11mr21118920pjq.132.1581955263241; 
	Mon, 17 Feb 2020 08:01:03 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:9144:9b3e:b52:fa29])
	by smtp.gmail.com with ESMTPSA id
	a22sm928041pfk.108.2020.02.17.08.01.02
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 08:01:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 17 Feb 2020 08:00:44 -0800
Message-Id: <69844300d3c547739cb1c3404c7b5ff74ed67d86.1581955142.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581955142.git.akuster808@gmail.com>
References: <cover.1581955142.git.akuster808@gmail.com>
Subject: [warrior 06/14] linux-yocto/4.19: update to v4.19.84
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
X-List-Received-Date: Mon, 17 Feb 2020 16:01:03 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/4.19 to the latest korg -stable release that comprises
the following commits:

    c555efaf1402 Linux 4.19.84
    46a4a014c48e kvm: x86: mmu: Recovery of shattered NX large pages
    6082f2e28887 kvm: Add helper function for creating VM worker threads
    5219505fcbb6 kvm: mmu: ITLB_MULTIHIT mitigation
    db77548b1652 KVM: vmx, svm: always run with EFER.NXE=1 when shadow paging is active
    37dfbc8ba763 KVM: x86: add tracepoints around __direct_map and FNAME(fetch)
    9ef1fae24d58 KVM: x86: change kvm_mmu_page_get_gfn BUG_ON to WARN_ON
    b182093d1c70 KVM: x86: remove now unneeded hugepage gfn adjustment
    e79234ce5765 KVM: x86: make FNAME(fetch) and __direct_map more similar
    8aaac3068623 kvm: mmu: Do not release the page inside mmu_set_spte()
    30d8d8d6cd92 kvm: Convert kvm_lock to a mutex
    a991063ce576 kvm: x86, powerpc: do not allow clearing largepages debugfs entry
    580c79e7e3e5 Documentation: Add ITLB_MULTIHIT documentation
    db5ae6596ae2 cpu/speculation: Uninline and export CPU mitigations helpers
    955607466ace x86/cpu: Add Tremont to the cpu vulnerability whitelist
    f9aa6b73a407 x86/bugs: Add ITLB_MULTIHIT bug infrastructure
    415bb221a070 x86/speculation/taa: Fix printing of TAA_MSG_SMT on IBRS_ALL CPUs
    4ad7466ddf2d x86/tsx: Add config options to set tsx=on|off|auto
    e3bf6b3ff55a x86/speculation/taa: Add documentation for TSX Async Abort
    2402432d5557 x86/tsx: Add "auto" option to the tsx= cmdline parameter
    a0808f06dfa1 kvm/x86: Export MDS_NO=0 to guests when TSX is enabled
    15dfa5d706df x86/speculation/taa: Add sysfs reporting for TSX Async Abort
    6c58ea8525bf x86/speculation/taa: Add mitigation for TSX Async Abort
    b8eb348ae408 x86/cpu: Add a "tsx=" cmdline option with TSX disabled by default
    37cf9ef900cc x86/cpu: Add a helper function x86_read_arch_cap_msr()
    4002d16a2ae1 x86/msr: Add the IA32_TSX_CTRL MSR
    dbf38b17a892 KVM: x86: use Intel speculation bugs and features as derived in generic x86 code
    fee619bb8136 drm/i915/cmdparser: Fix jump whitelist clearing
    255ed51599de drm/i915/gen8+: Add RC6 CTX corruption WA
    011b7173cbdb drm/i915: Lower RM timeout to avoid DSI hard hangs
    a7bda639a17f drm/i915/cmdparser: Ignore Length operands during command matching
    6e53c71a6913 drm/i915/cmdparser: Add support for backward jumps
    f27bc2b5950d drm/i915/cmdparser: Use explicit goto for error paths
    cdd77c6b4be4 drm/i915: Add gen9 BCS cmdparsing
    fea688c5dd81 drm/i915: Allow parsing of unsized batches
    7ce726b61c57 drm/i915: Support ro ppgtt mapped cmdparser shadow buffers
    fc3510fe6f6b drm/i915: Add support for mandatory cmdparsing
    fba4207cf15e drm/i915: Remove Master tables from cmdparser
    f1ff77080fa1 drm/i915: Disable Secure Batches for gen6+
    b4b1abdc6b18 drm/i915: Rename gen7 cmdparser tables
    e238e05ec2dc vsock/virtio: fix sock refcnt holding during the shutdown
    2e7e3f16901d iio: imu: mpu6050: Fix FIFO layout for ICM20602
    99ea48af7bd9 net: prevent load/store tearing on sk->sk_stamp
    d32629dcd1e5 netfilter: ipset: Copy the right MAC address in hash:ip,mac IPv6 sets
    5833560d54fd usbip: Fix free of unallocated memory in vhci tx
    6890b4bc3d2b cgroup,writeback: don't switch wbs immediately on dead wbs if the memcg is dead
    d3b3c0a14615 mm/filemap.c: don't initiate writeback if mapping has no dirty pages
    285eb6af4351 iio: imu: inv_mpu6050: fix no data on MPU6050
    d888a80727ab iio: imu: mpu6050: Add support for the ICM 20602 IMU
    522128128dec blkcg: make blkcg_print_stat() print stats only for online blkgs
    30b969392cf2 pinctrl: cherryview: Fix irq_valid_mask calculation
    ca79bb7e1168 ocfs2: protect extent tree in ocfs2_prepare_inode_for_write()
    2c655a111968 pinctrl: intel: Avoid potential glitches if pin is in GPIO mode
    713adf6dd327 e1000: fix memory leaks
    4a05571772cc igb: Fix constant media auto sense switching when no cable is connected
    1baab8352d80 net: ethernet: arc: add the missed clk_disable_unprepare
    24523745ed41 NFSv4: Don't allow a cached open with a revoked delegation
    440a748ed6df usb: dwc3: gadget: fix race when disabling ep with cancelled xfers
    e66f52eb3f29 hv_netvsc: Fix error handling in netvsc_attach()
    99d5f18cebbf drm/amd/display: Passive DP->HDMI dongle detection fix
    e5edbf9c45ce drm/amdgpu: If amdgpu_ib_schedule fails return back the error.
    b651ddc15e7a iommu/amd: Apply the same IVRS IOAPIC workaround to Acer Aspire A315-41
    214e4f0ecdd1 net: mscc: ocelot: refuse to overwrite the port's native vlan
    5aedcc8aa8be net: mscc: ocelot: fix vlan_filtering when enslaving to bridge before link is up
    3b956e63e2f3 net: hisilicon: Fix "Trying to free already-free IRQ"
    f09b99c883e8 fjes: Handle workqueue allocation failure
    6376736d016f nvme-multipath: fix possible io hang after ctrl reconnect
    1372527e6876 scsi: qla2xxx: stop timer in shutdown path
    f2bab3ed456c RDMA/hns: Prevent memory leaks of eq->buf_list
    55ca08347487 RDMA/iw_cxgb4: Avoid freeing skb twice in arp failure case
    e36be7959326 usbip: tools: Fix read_usb_vudc_device() error path handling
    cd9561a53d26 USB: ldusb: use unsigned size format specifiers
    c753113ae714 USB: Skip endpoints with 0 maxpacket length
    ef38f4d123d0 perf/x86/uncore: Fix event group support
    f14751658a01 perf/x86/amd/ibs: Handle erratum #420 only on the affected CPU family (10h)
    5b99e97b275a perf/x86/amd/ibs: Fix reading of the IBS OpData register and thus precise RIP validity
    45944c4a7743 usb: dwc3: remove the call trace of USBx_GFLADJ
    dff38149cec4 usb: gadget: configfs: fix concurrent issue between composite APIs
    10eb9abd21ba usb: dwc3: pci: prevent memory leak in dwc3_pci_probe
    c73ccf65e169 usb: gadget: composite: Fix possible double free memory bug
    26d31e1c3ab2 usb: gadget: udc: atmel: Fix interrupt storm in FIFO mode.
    88912019b49c usb: fsl: Check memory resource before releasing it
    3a2675a2d97a macsec: fix refcnt leak in module exit routine
    0d0ca85ad424 bonding: fix unexpected IFF_BONDING bit unset
    50e31318b525 ipvs: move old_secure_tcp into struct netns_ipvs
    102f4078fbdd ipvs: don't ignore errors in case refcounting ip_vs module fails
    81de0b500baa netfilter: nf_flow_table: set timeout before insertion into hashes
    d45fc2ed472b scsi: qla2xxx: Initialized mailbox to prevent driver load failure
    b6612a3dbad8 scsi: lpfc: Honor module parameter lpfc_use_adisc
    4e80e5614770 net: openvswitch: free vport unless register_netdevice() succeeds
    027253315d70 RDMA/uverbs: Prevent potential underflow
    d582769add68 scsi: qla2xxx: fixup incorrect usage of host_byte
    42de3a902443 net/mlx5: prevent memory leak in mlx5_fpga_conn_create_cq
    7dfdcd9407f3 net/mlx5e: TX, Fix consumer index of error cqe dump
    48dd71289ca3 RDMA/qedr: Fix reported firmware version
    6208c2bfe224 iw_cxgb4: fix ECN check on the passive accept
    89aa9e2626f4 RDMA/mlx5: Clear old rate limit when closing QP
    d6706b2ec108 HID: intel-ish-hid: fix wrong error handling in ishtp_cl_alloc_tx_ring()
    113a154ef2f2 dmaengine: sprd: Fix the possible memory leak issue
    6040f96d5147 dmaengine: xilinx_dma: Fix control reg update in vdma_channel_set_config
    78e7e0248eb8 HID: google: add magnemite/masterball USB ids
    8181146cd7de PCI: tegra: Enable Relaxed Ordering only for Tegra20 & Tegra30
    e2dd254bde5c usbip: Implement SG support to vhci-hcd and stub driver
    f865ae473c16 usbip: Fix vhci_urb_enqueue() URB null transfer buffer error path
    e9c0fc4a7ccd sched/fair: Fix -Wunused-but-set-variable warnings
    502bd151448c sched/fair: Fix low cpu usage with high throttling by removing expiration of cpu-local slices
    4ebee4875eab ALSA: usb-audio: Fix copy&paste error in the validator
    e0051889243d ALSA: usb-audio: remove some dead code
    4f6c52002699 ALSA: usb-audio: Fix possible NULL dereference at create_yamaha_midi_quirk()
    3a0cdf210b94 ALSA: usb-audio: Clean up check_input_term()
    9feeaa50e5b4 ALSA: usb-audio: Remove superfluous bLength checks
    f0e164f66e75 ALSA: usb-audio: Unify the release of usb_mixer_elem_info objects
    dae4d839e549 ALSA: usb-audio: Simplify parse_audio_unit()
    17821e2fb167 ALSA: usb-audio: More validations of descriptor units
    5e36cf8edb58 configfs: fix a deadlock in configfs_symlink()
    0dfc45be875a configfs: provide exclusion between IO and removals
    25c118d8d158 configfs: new object reprsenting tree fragments
    65524d647e9d configfs_register_group() shouldn't be (and isn't) called in rmdirable parts
    2bd63490c1dd configfs: stash the data we need into configfs_buffer at open time
    a7be2debb769 can: peak_usb: fix slab info leak
    ce9b94da0e04 can: mcba_usb: fix use-after-free on disconnect
    5a9e37f2029f can: dev: add missing of_node_put() after calling of_get_child_by_name()
    9289226f6982 can: gs_usb: gs_can_open(): prevent memory leak
    9f5c59428843 can: rx-offload: can_rx_offload_queue_sorted(): fix error handling, avoid skb mem leak
    ef502d5a84d6 can: peak_usb: fix a potential out-of-sync while decoding packets
    7ae08111ca70 can: c_can: c_can_poll(): only read status register after status IRQ
    0327c7818da2 can: flexcan: disable completely the ECC mechanism
    46265660e5ba can: usb_8dev: fix use-after-free on disconnect
    d8a76e300e37 SMB3: Fix persistent handles reconnect
    caddaf43b024 x86/apic/32: Avoid bogus LDR warnings
    dc1a91dc4917 intel_th: pci: Add Jasper Lake PCH support
    f9d3aea1dca2 intel_th: pci: Add Comet Lake PCH support
    64997ee49c8c netfilter: ipset: Fix an error code in ip_set_sockfn_get()
    1b0e60f6a48b netfilter: nf_tables: Align nft_expr private data to 64-bit
    2dae80b5b666 ARM: sunxi: Fix CPU powerdown on A83T
    20b9e094dcd3 iio: srf04: fix wrong limitation in distance measuring
    bee45b44b13e iio: imu: adis16480: make sure provided frequency is positive
    a428996147e2 iio: adc: stm32-adc: fix stopping dma
    78a1d6cdd302 ceph: add missing check in d_revalidate snapdir handling
    6f9657793a6e ceph: fix use-after-free in __ceph_remove_cap()
    3840610d60b2 arm64: Do not mask out PTE_RDONLY in pte_same()
    56f270a1d72c soundwire: bus: set initial value to port_status
    9a06efc745c3 soundwire: depend on ACPI
    a81a4637456b HID: wacom: generic: Treat serial number and related fields as unsigned
    e3fdd0c1a3d0 drm/radeon: fix si_enable_smc_cac() failed issue
    f39fbd05f921 perf tools: Fix time sorting
    66d53cd683a8 tools: gpio: Use !building_out_of_srctree to determine srctree
    8e358a027611 dump_stack: avoid the livelock of the dump_lock
    6c944fc51f0a mm, vmstat: hide /proc/pagetypeinfo from normal users
    2686f71fdcc5 mm: thp: handle page cache THP correctly in PageTransCompoundMap
    7dfa51beacac mm, meminit: recalculate pcpu batch and high limits after init completes
    8e6bf4bc3a88 mm: memcontrol: fix network errors from failing __GFP_ATOMIC charges
    6ecc16351a84 ALSA: hda/ca0132 - Fix possible workqueue stall
    6921b1609912 ALSA: bebob: fix to detect configured source of sampling clock for Focusrite Saffire Pro i/o series
    b85472244b70 ALSA: timer: Fix incorrectly assigned timer instance
    107451b87ea5 net: hns: Fix the stray netpoll locks causing deadlock in NAPI path
    26e398dcb3f1 ipv6: fixes rt6_probe() and fib6_nh->last_probe init
    05b761423d67 net: mscc: ocelot: fix NULL pointer on LAG slave removal
    1cfc967ef584 net: mscc: ocelot: don't handle netdev events for other netdevs
    a6fdbaeef1f2 qede: fix NULL pointer deref in __qede_remove()
    956b38853517 NFC: st21nfca: fix double free
    1143496c9632 nfc: netlink: fix double device reference drop
    760a1f7f22ee NFC: fdp: fix incorrect free object
    5580091ce7d9 net: usb: qmi_wwan: add support for DW5821e with eSIM support
    4fd218071f21 net: qualcomm: rmnet: Fix potential UAF when unregistering
    b9bda52f8f3e net: fix data-race in neigh_event_send()
    2fbfdb2de4a1 net: ethernet: octeon_mgmt: Account for second possible VLAN header
    88f8c39912bc ipv4: Fix table id reference in fib_sync_down_addr
    0ddabef89067 CDC-NCM: handle incomplete transfer of MTU
    27b5f4bf5ba9 bonding: fix state transition issue in link monitoring
    7d8dbefc22ff Linux 4.19.83
    818c96ac80be usb: gadget: udc: core: Fix segfault if udc_bind_to_driver() for pending driver fails
    b06f37eaa2b3 arm64: dts: ti: k3-am65-main: Fix gic-its node unit-address
    54ee5ccd0251 ASoC: pcm3168a: The codec does not support S32_LE
    3ddf2a70cf6d selftests/powerpc: Fix compile error on tlbie_test due to newer gcc
    e7aaa8dd60c5 selftests/powerpc: Add test case for tlbie vs mtpidr ordering issue
    ec199b24aa5c powerpc/mm: Fixup tlbie vs mtpidr/mtlpidr ordering issue on POWER9
    06e8438eddf8 platform/x86: pmc_atom: Add Siemens SIMATIC IPC227E to critclk_systems DMI table
    2d830cf287a5 wireless: Skip directory when generating certificates
    558d2bdad5f6 net/flow_dissector: switch to siphash
    f6ef35998fb0 r8152: add device id for Lenovo ThinkPad USB-C Dock Gen 2
    c33f7efec3b3 net: dsa: fix switch tree list
    6b5bf3f37f72 net: usb: lan78xx: Connect PHY before registering MAC
    07c62fc7bf28 net: bcmgenet: reset 40nm EPHY on energy detect
    6d3ccc2a5b19 net: phy: bcm7xxx: define soft_reset for 40nm EPHY
    97cc6827f418 net: bcmgenet: don't set phydev->link from MAC
    57e286f67554 net: dsa: b53: Do not clear existing mirrored port mask
    db91be8e27c8 net/mlx5e: Fix ethtool self test: link speed
    5eb1967bfde3 r8169: fix wrong PHY ID issue with RTL8168dp
    9e7c4fa275cf net/mlx5e: Fix handling of compressed CQEs in case of low NAPI budget
    0c3355cc8e19 selftests: fib_tests: add more tests for metric update
    b166e8838a97 ipv4: fix route update on metric change.
    cd3bcb44ee3b net: add READ_ONCE() annotation in __skb_wait_for_more_packets()
    4f3df7f1eaa7 net: use skb_queue_empty_lockless() in busy poll contexts
    eaf548feaa17 net: use skb_queue_empty_lockless() in poll() handlers
    afa1f5e98c11 udp: use skb_queue_empty_lockless()
    d5ac4232c376 net: add skb_queue_empty_lockless()
    83532eb48049 vxlan: check tun_info options_len properly
    a8a5adbbf779 udp: fix data-race in udp_set_dev_scratch()
    12fab1634ab1 selftests: net: reuseport_dualstack: fix uninitalized parameter
    321c99155f4b net: Zeroing the structure ethtool_wolinfo in ethtool_get_wol()
    9da271c1cdc1 net: usb: lan78xx: Disable interrupts before calling generic_handle_irq()
    40400fdd312a netns: fix GFP flags in rtnl_net_notifyid()
    1d72dbb4ca2f net/mlx4_core: Dynamically set guaranteed amount of counters per VF
    f05975d9f393 net: hisilicon: Fix ping latency when deal with high throughput
    1d5cb12a2539 net: fix sk_page_frag() recursion from memory reclaim
    189982d111c0 net: ethernet: ftgmac100: Fix DMA coherency issue with SW checksum
    5536fc891221 net: dsa: bcm_sf2: Fix IMP setup for port different than 8
    2c50a36d0b78 net: annotate lockless accesses to sk->sk_napi_id
    0cfaf03c5d58 net: annotate accesses to sk->sk_incoming_cpu
    07de738901d6 inet: stop leaking jiffies on the wire
    163901dc945b erspan: fix the tun_info options_len check for erspan
    96df1ec22b97 dccp: do not leak jiffies on the wire
    f291613ff140 cxgb4: fix panic when attaching to ULD fail
    1f032ca298dd nbd: handle racing with error'ed out commands
    82b7c99ee141 nbd: protect cmd->status with cmd->lock
    80b42f4381c2 cifs: Fix cifsInodeInfo lock_sem deadlock when reconnect occurs
    a7448991fa3e i2c: stm32f7: remove warning when compiling with W=1
    86fd9e339ab4 i2c: stm32f7: fix a race in slave mode with arbitration loss irq
    d746ce649556 i2c: stm32f7: fix first byte to send in slave mode
    18e7fae372a1 irqchip/gic-v3-its: Use the exact ITSList for VMOVP
    39637aafa173 MIPS: bmips: mark exception vectors as char arrays
    fcc3f7c810c3 of: unittest: fix memory leak in unittest_data_add
    c56b9da70d09 ARM: 8926/1: v7m: remove register save to stack before svc
    fa18f803d1f7 tracing: Fix "gfp_t" format for synthetic events
    63571a1f375e scsi: target: core: Do not overwrite CDB byte 1
    1df8da335d40 drm/amdgpu: fix potential VM faults
    3cd2b6492cde ARM: davinci: dm365: Fix McBSP dma_slave_map entry
    e18bf407ea3f perf kmem: Fix memory leak in compact_gfp_flags()
    05dd6283b8fc 8250-men-mcb: fix error checking when get_num_ports returns -ENODEV
    81809424cad7 perf c2c: Fix memory leak in build_cl_output()
    7a79420034e0 ARM: dts: imx7s: Correct GPT's ipg clock source
    e601e103cfed scsi: fix kconfig dependency warning related to 53C700_LE_ON_BE
    3dd0be3eeeb0 scsi: sni_53c710: fix compilation error
    cf372c60ed13 scsi: scsi_dh_alua: handle RTPG sense code correctly during state transitions
    3ee6a8bdae81 scsi: qla2xxx: fix a potential NULL pointer dereference
    9d27ba401eca ARM: mm: fix alignment handler faults under memory pressure
    f0eabc9e9acb pinctrl: ns2: Fix off by one bugs in ns2_pinmux_enable()
    9a5d5ffb3245 ARM: dts: logicpd-torpedo-som: Remove twl_keypad
    d7e2a8e271aa ASoc: rockchip: i2s: Fix RPM imbalance
    513474f59001 ASoC: wm_adsp: Don't generate kcontrols without READ flags
    bab5c14b5c89 regulator: pfuze100-regulator: Variable "val" in pfuze100_regulator_probe() could be uninitialized
    6ef17b446081 ASoC: rt5682: add NULL handler to set_jack function
    772c18df9f3d regulator: ti-abb: Fix timeout in ti_abb_wait_txdone/ti_abb_clear_all_txdone
    c4c0e64deb9a arm64: dts: Fix gpio to pinmux mapping
    0d3aef1ea7e8 arm64: dts: allwinner: a64: sopine-baseboard: Add PHY regulator delay
    a3a208ac4608 arm64: dts: allwinner: a64: pine64-plus: Add PHY regulator delay
    dc24ac36f304 ASoC: wm8994: Do not register inapplicable controls for WM1811
    0f037d0a62b0 regulator: of: fix suspend-min/max-voltage parsing
    b17eae5a0e16 kbuild: add -fcf-protection=none when using retpoline flags
    5ee93551c703 Linux 4.19.82
    914a7d429da5 Revert "ALSA: hda: Flush interrupts on disabling"
    8f5603029223 powerpc/powernv: Fix CPU idle to be called with IRQs disabled
    92930e922399 ALSA: usb-audio: Add DSD support for Gustard U16/X26 USB Interface
    c08182dbf057 ALSA: usb-audio: Update DSD support quirks for Oppo and Rotel
    d8808d2e79b5 ALSA: usb-audio: DSD auto-detection for Playback Designs
    831317430693 ALSA: timer: Fix mutex deadlock at releasing card
    145fadf6d99a ALSA: timer: Simplify error path in snd_timer_open()
    a6c91087f5d5 sch_netem: fix rcu splat in netem_enqueue()
    3ecf8529d52a net: usb: sr9800: fix uninitialized local variable
    14a703ef2dc4 bonding: fix potential NULL deref in bond_update_slave_arr
    24aaf7f4528f NFC: pn533: fix use-after-free and memleaks
    8d9c4a9b8677 rxrpc: Fix trace-after-put looking at the put peer record
    e8e51ce79c15 rxrpc: rxrpc_peer needs to hold a ref on the rxrpc_local record
    570ab0dd35f9 rxrpc: Fix call ref leak
    d634bd01b3a0 llc: fix sk_buff leak in llc_conn_service()
    3f3f7409f028 llc: fix sk_buff leak in llc_sap_state_process()
    948e8eba656f batman-adv: Avoid free/alloc race when handling OGM buffer
    74001646d47c NFS: Fix an RCU lock leak in nfs4_refresh_delegation_stateid()
    fd9a708c7bde drm/amdgpu/powerplay/vega10: allow undervolting in p7
    3e285a5c1401 dmaengine: cppi41: Fix cppi41_dma_prep_slave_sg() when idle
    a0e406be17e5 dmaengine: qcom: bam_dma: Fix resource leak
    64efcbc7a5a3 rtlwifi: Fix potential overflow on P2P code
    a81669161528 arm64: Ensure VM_WRITE|VM_SHARED ptes are clean by default
    8dd6066066a2 s390/idle: fix cpu idle time calculation
    ced8cb0230d0 s390/cmm: fix information leak in cmm_timeout_handler()
    be87ee689106 nl80211: fix validation of mesh path nexthop
    14e0dd84db60 HID: fix error message in hid_open_report()
    8a01c4b908cf HID: Fix assumption that devices have inputs
    cf143d65c556 HID: i2c-hid: add Trekstor Primebook C11B to descriptor override
    6608702bec70 scsi: target: cxgbit: Fix cxgbit_fw4_ack()
    45e7acdff38e USB: serial: whiteheat: fix line-speed endianness
    b7ad5aa67058 USB: serial: whiteheat: fix potential slab corruption
    36e02e1fba89 usb: xhci: fix __le32/__le64 accessors in debugfs code
    8e2cccd6c5d1 USB: ldusb: fix control-message timeout
    3f1a7d903b8d USB: ldusb: fix ring-buffer locking
    f1b94b60bb1c usb-storage: Revert commit 747668dbc061 ("usb-storage: Set virt_boundary_mask to avoid SG overflows")
    d1c188d330ca USB: gadget: Reject endpoints with 0 maxpacket value
    ceb6b658f0bd UAS: Revert commit 3ae62a42090f ("UAS: fix alignment of scatter/gather segments")
    a58cdc35d3a0 ALSA: hda/realtek - Add support for ALC623
    101bb262ba43 ALSA: hda/realtek - Fix 2 front mics of codec 0x623
    3ae205d7a0a2 ALSA: bebob: Fix prototype of helper function to return negative value
    62e42369de37 fuse: truncate pending writes on O_TRUNC
    72c913fdde9d fuse: flush dirty data/metadata before non-truncate setattr
    696da0225946 ath6kl: fix a NULL-ptr-deref bug in ath6kl_usb_alloc_urb_from_pipe()
    1a124f16b594 thunderbolt: Use 32-bit writes when writing ring producer/consumer
    f2cc221b6515 USB: legousbtower: fix a signedness bug in tower_probe()
    083322455c67 nbd: verify socket is supported during setup
    e0064f8de3f5 iwlwifi: exclude GEO SAR support for 3168
    5a445f805afc ALSA: hda/realtek: Reduce the Headphone static noise on XPS 9350/9360
    ce005e5d6e9f ARM: 8914/1: NOMMU: Fix exc_ret for XIP
    394c90d9ce13 tracing: Initialize iter->seq after zeroing in tracing_read_pipe()
    12e132664f92 s390/uaccess: avoid (false positive) compiler warnings
    da24be886ff6 NFSv4: Fix leak of clp->cl_acceptor string
    cad4448dfc9c nbd: fix possible sysfs duplicate warning
    c2ea451f22f1 virt: vbox: fix memory leak in hgcm_call_preprocess_linaddr
    5865397db6c3 MIPS: fw: sni: Fix out of bounds init of o32 stack
    317b6f68abb1 MIPS: include: Mark __xchg as __always_inline
    4a4206a83fc6 iio: imu: adis16400: release allocated memory on failure
    f2824a020746 drm/amdgpu: fix memory leak
    a1112c465593 perf/x86/amd: Change/fix NMI latency mitigation to use a timestamp
    2cd003a820fe sched/vtime: Fix guest/system mis-accounting on task switch
    58d33d4a4a1d x86/cpu: Add Comet Lake to the Intel CPU models header
    6258745b311b arm64: armv8_deprecated: Checking return value for memory allocation
    c3689876f5b9 fs: ocfs2: fix a possible null-pointer dereference in ocfs2_info_scan_inode_alloc()
    4de544b42c7a fs: ocfs2: fix a possible null-pointer dereference in ocfs2_write_end_nolock()
    c18d86047622 fs: ocfs2: fix possible null-pointer dereferences in ocfs2_xa_prepare_entry()
    2141f777e6e1 ocfs2: clear zero in unaligned direct IO
    af140367ae66 x86/xen: Return from panic notifier
    0169198631e7 MIPS: include: Mark __cmpxchg as __always_inline
    9b7591cf6cf6 efi/x86: Do not clean dummy variable in kexec path
    318885aa154d efi/cper: Fix endianness of PCIe class code
    02c1fb11b6a0 serial: mctrl_gpio: Check for NULL pointer
    497fd98a50b2 fs: cifs: mute -Wunused-const-variable message
    579249a08348 gpio: max77620: Use correct unit for debounce times
    7f3306a3b2df tty: n_hdlc: fix build on SPARC
    14a4689f8847 tty: serial: owl: Fix the link time qualifier of 'owl_uart_exit()'
    d21a5d4a7339 arm64: ftrace: Ensure synchronisation in PLT setup for Neoverse-N1 #1542419
    ca2cc4b47d01 nfs: Fix nfsi->nrequests count error on nfs_inode_remove_request
    aeb242943505 HID: hyperv: Use in-place iterator API in the channel callback
    9c75c230ded2 RDMA/iwcm: Fix a lock inversion issue
    962cff4f3f89 RDMA/hfi1: Prevent memory leak in sdma_init
    dfc1daba843b staging: rtl8188eu: fix null dereference when kzalloc fails
    3545c018d0c3 perf annotate: Return appropriate error code for allocation failures
    f8304a9310c3 perf annotate: Propagate the symbol__annotate() error return
    4e2ca0c9143c perf annotate: Fix the signedness of failure returns
    ec783e28e72d perf annotate: Propagate perf_env__arch() error
    f0ba7ab26bfc perf tools: Propagate get_cpuid() error
    c022c7f6171e perf jevents: Fix period for Intel fixed counters
    5ecf35ed5d17 perf script brstackinsn: Fix recovery from LBR/binary mismatch
    262ed71096ba perf map: Fix overlapped map handling
    d975e5970965 perf tests: Avoid raising SEGV using an obvious NULL dereference
    e3dc77d662ca libsubcmd: Make _FORTIFY_SOURCE defines dependent on the feature
    915eb63dac7b iio: fix center temperature of bmc150-accel-core
    78e6415d4f9a iio: adc: meson_saradc: Fix memory allocation order
    1b6901f3c600 power: supply: max14656: fix potential use-after-free
    a0d8a590d983 drm/amd/display: fix odm combine pipe reset
    a897f54e921c PCI/PME: Fix possible use-after-free on remove
    0e23eeb0fc58 net: dsa: mv88e6xxx: Release lock while requesting IRQ
    646e5c77b418 exec: load_script: Do not exec truncated interpreter path
    f251c83d6c08 ext4: disallow files with EXT4_JOURNAL_DATA_FL from EXT4_IOC_SWAP_BOOT
    cc4d8283f6e9 media: vimc: Remove unused but set variables
    c629fed0347e ALSA: hda/realtek - Apply ALC294 hp init also for S4 resume
    b73132b74d25 cifs: add credits from unmatched responses/messages
    ee4d28a716e8 CIFS: Respect SMB2 hdr preamble size in read responses
    2a2022688a91 scsi: lpfc: Correct localport timeout duration error
    1df87fc5e468 mlxsw: spectrum: Set LAG port collector only when active
    e32271519bb9 arm64: kpti: Whitelist HiSilicon Taishan v110 CPUs
    6021dd86ca38 arm64: Add MIDR encoding for HiSilicon Taishan CPUs
    9190141529fb rtc: pcf8523: set xtal load capacitance from DT
    961ba81d08d8 usb: handle warm-reset port requests on hub resume
    3a77562e18bf ALSA: usb-audio: Cleanup DSD whitelist
    a0608eec296d usb: dwc3: gadget: clear DWC3_EP_TRANSFER_STARTED on cmd complete
    d0e8b35e915e usb: dwc3: gadget: early giveback if End Transfer already completed
    335d4f818246 samples: bpf: fix: seg fault with NULL pointer arg
    c41f30e8d233 HID: steam: fix deadlock with input devices.
    4c8ae7221bcc HID: steam: fix boot loop with bluetooth firmware
    ce05beb3b402 NFSv4: Ensure that the state manager exits the loop on SIGKILL
    952b0285826e HID: Add ASUS T100CHI keyboard dock battery quirks
    24ec7c1b9b17 staging: mt7621-pinctrl: use pinconf-generic for 'dt_node_to_map' and 'dt_free_map'
    b064e272023c scripts/setlocalversion: Improve -dirty check with git-status --no-optional-locks
    9aafa2996921 clk: boston: unregister clks on failure in clk_boston_setup()
    1ba6488775f1 ath10k: assign 'n_cipher_suites = 11' for WCN3990 to enable WPA3
    a6af54d4ad0d platform/x86: Fix config space access for intel_atomisp2_pm
    8694ceba9338 platform/x86: Add the VLV ISP PCI ID to atomisp2_pm
    8c1b1d3c7593 HID: i2c-hid: Add Odys Winbook 13 to descriptor override
    3db3961160f6 HID: i2c-hid: Ignore input report if there's no data present on Elan touchpanels
    e0bcac994ad8 HID: i2c-hid: Disable runtime PM for LG touchscreen
    d8187ff32b23 netfilter: ipset: Make invalid MAC address checks consistent
    cb38a17cc880 Btrfs: fix deadlock on tree root leaf when finding free extent
    33970cf511c8 PCI: Fix Switchtec DMA aliasing quirk dmesg noise
    437de04184bc bcache: fix input overflow to writeback_rate_minimum
    be488566ef2f drm/msm/dpu: handle failures while initializing displays
    b5b3bb03c372 x86/cpu: Add Atom Tremont (Jacobsville)
    ab0888699734 tools/power turbostat: fix goldmont C-state limit decoding
    4da8b5f8a71d usb: dwc2: fix unbalanced use of external vbus-supply
    649ee6f0c677 HID: i2c-hid: add Direkt-Tek DTLAPY133-1 to descriptor override
    ce43554395a3 f2fs: fix to recover inode->i_flags of inode block during POR
    b619de076f9c f2fs: fix to recover inode's i_gc_failures during POR
    23848022460f powerpc/powernv: hold device_hotplug_lock when calling memtrace_offline_pages()
    bff91a961a05 sc16is7xx: Fix for "Unexpected interrupt: 8"
    157c391babd7 scsi: lpfc: Fix a duplicate 0711 log message number.
    6b2fbfacd74b f2fs: flush quota blocks after turnning it off
    e5641f02dc9e wil6210: fix freeing of rx buffers in EDMA mode
    d8ab4185ea55 btrfs: tracepoints: Fix wrong parameter order for qgroup events
    6bcbe35027e2 btrfs: qgroup: Always free PREALLOC META reserve in btrfs_delalloc_release_extents()
    96b9b94647b0 Btrfs: fix memory leak due to concurrent append writes with fiemap
    692aa7d55ff8 Btrfs: fix inode cache block reserve leak on failure to allocate data space
    a8afda7774a3 dm snapshot: rework COW throttling to fix deadlock
    223f1af69da8 dm snapshot: introduce account_start_copy() and account_end_copy()
    0ca37291020e zram: fix race between backing_dev_show and backing_dev_store
    ef244c308885 Linux 4.19.81
    27414f90ff6e RDMA/cxgb4: Do not dma memory off of the stack
    054441182b51 blk-rq-qos: fix first node deletion of rq_qos_del()
    2ada40308a0d PCI: PM: Fix pci_power_up()
    ccb02adf3293 xen/netback: fix error path of xenvif_connect_data()
    89ab39da1452 cpufreq: Avoid cpufreq_suspend() deadlock on system shutdown
    5f19cbb3ab3f memstick: jmb38x_ms: Fix an error handling path in 'jmb38x_ms_probe()'
    0b95aaae783f btrfs: tracepoints: Fix bad entry members of qgroup events
    1b921b5bc47f Btrfs: check for the full sync flag while holding the inode lock during fsync
    ac6bae2b524d Btrfs: add missing extents release on file extent cluster relocation error
    6cd5be9832eb btrfs: block-group: Fix a memory leak due to missing btrfs_put_block_group()
    a5a10f7800ed pinctrl: armada-37xx: swap polarity on LED group
    e0e489aa5bd0 pinctrl: armada-37xx: fix control of pins 32 and up
    5e9d71802ddc pinctrl: cherryview: restore Strago DMI workaround for all versions
    4dedaa73c4c4 x86/apic/x2apic: Fix a NULL pointer deref when handling a dying cpu
    1709917289cd x86/boot/64: Make level2_kernel_pgt pages invalid outside kernel area
    e49c84c51c3a dm cache: fix bugs when a GFP_NOWAIT allocation fails
    5ce7528c4d4a tracing: Fix race in perf_trace_buf initialization
    96202569b9fe perf/aux: Fix AUX output stopping
    01332b037066 CIFS: Fix use after free of file info structures
    71cf88165ff0 CIFS: avoid using MID 0xFFFF
    4292745536d2 arm64: Enable workaround for Cavium TX2 erratum 219 when running SMT
    d97e4a6d2b2f EDAC/ghes: Fix Use after free in ghes_edac remove path
    ca65fe21981b parisc: Fix vmap memory leak in ioremap()/iounmap()
    19e2ed7bfabe xtensa: drop EXPORT_SYMBOL for outs*/ins*
    30cff8ab6ed7 mm/memory-failure: poison read receives SIGKILL instead of SIGBUS if mmaped more than once
    91eec7692b94 hugetlbfs: don't access uninitialized memmaps in pfn_range_valid_gigantic()
    f712e3066f75 mm/page_owner: don't access uninitialized memmaps when reading /proc/pagetypeinfo
    bb6932c5a473 mm/slub: fix a deadlock in show_slab_objects()
    9792afbd630b mm/memory-failure.c: don't access uninitialized memmaps in memory_failure()
    01a44055a48a mmc: cqhci: Commit descriptors before setting the doorbell
    6ea856efef9f fs/proc/page.c: don't access uninitialized memmaps in fs/proc/page.c
    43a2a6c2f0fb drivers/base/memory.c: don't access uninitialized memmaps in soft_offline_page_store()
    4d5307c099af drm/amdgpu: Bail earlier when amdgpu.cik_/si_support is not set to 1
    11377c3e997e drm/ttm: Restore ttm prefaulting
    33af2a8ee304 drm/edid: Add 6 bpc quirk for SDC panel in Lenovo G50
    24ca62892032 mac80211: Reject malformed SSID elements
    73c066a9552a cfg80211: wext: avoid copying malformed SSIDs
    83dc16707f6d ACPI: CPPC: Set pcc_data[pcc_ss_id] to NULL in acpi_cppc_processor_exit()
    8e367b029e61 ASoC: rsnd: Reinitialize bit clock inversion flag for every format setting
    b0dd6a24255e Input: synaptics-rmi4 - avoid processing unknown IRQs
    aa9402c14df6 Input: da9063 - fix capability and drop KEY_SLEEP
    e254d4359259 scsi: ch: Make it possible to open a ch device multiple times again
    0c6905197c5b scsi: core: try to get module before removing device
    2a675e73dfec scsi: core: save/restore command resid for error handling
    0cea86f270e9 scsi: sd: Ignore a failure to sync cache due to lack of authorization
    3638ccda1009 scsi: zfcp: fix reaction on bit error threshold notification
    d07c028d2bc9 staging: wlan-ng: fix exit return when sme->key_idx >= NUM_WEPKEYS
    4034a5030589 MIPS: tlbex: Fix build_restore_pagemask KScratch restore
    9f7e157464cd USB: ldusb: fix read info leaks
    3b73a0e453bd USB: usblp: fix use-after-free on disconnect
    28ab2c5f5899 USB: ldusb: fix memleak on disconnect
    edd3e9c71cc8 USB: serial: ti_usb_3410_5052: fix port-close races
    068fcbe895cd usb: udc: lpc32xx: fix bad bit shift operation
    7ed43d2eb0ec ALSA: hda - Force runtime PM on Nvidia HDMI codecs
    7dda74810c9a ALSA: usb-audio: Disable quirks for BOSS Katana amplifiers
    6c8a9a46ec57 ALSA: hda/realtek - Enable headset mic on Asus MJ401TA
    30a83eb0a09d ALSA: hda/realtek - Add support for ALC711
    5366778bf0ed USB: legousbtower: fix memleak on disconnect
    99b45e7a1ba1 memfd: Fix locking when tagging pins
    2770f80afde7 sctp: change sctp_prot .no_autobind with true
    cd8c21ca7022 net: stmmac: disable/enable ptp_ref_clk in suspend/resume flow
    da4f0aed87d5 net: ipv6: fix listify ip6_rcv_finish in case of forwarding
    cc2d858b3f73 net/ibmvnic: Fix EOI when running in XIVE mode.
    3f9d4e3c2954 net: i82596: fix dma_alloc_attr for sni_82596
    da0baae9a725 net: bcmgenet: Set phydev->dev_flags only for internal PHYs
    c0f5839a483f net: bcmgenet: Fix RGMII_MODE_EN value for GENET v1/2/3
    16d67acad815 net: avoid potential infinite loop in tc_ctl_action()
    2fa80e64de33 ipv4: Return -ENETUNREACH if we can't create route but saddr is valid
    2ec0df4e3fee ipv4: fix race condition between route lookup and invalidation
    0d3ad773b445 ocfs2: fix panic due to ocfs2_wq is null
    0933b0db7fb2 Revert "drm/radeon: Fix EEH during kexec"
    9457994a53d1 md/raid0: fix warning message for parameter default_layout
    51f0c10890aa libata/ahci: Fix PCS quirk application
    9bc5a4db9aa9 namespace: fix namespace.pl script to support relative paths
    6acbcd1429f1 r8152: Set macpassthru in reset_resume callback
    0cb5c7b06a0a lib: textsearch: fix escapes in example code
    50699af3609c net: hisilicon: Fix usage of uninitialized variable in function mdio_sc_cfg_reg_write()
    db1e664e2d80 mips: Loongson: Fix the link time qualifier of 'serial_exit()'
    b43bf6b10344 net: dsa: rtl8366rb: add missing of_node_put after calling of_get_child_by_name
    a16a9c10b2b0 netfilter: nft_connlimit: disable bh on garbage collection
    13104599d07f mac80211: fix txq null pointer dereference
    09c5a5bb0f26 nl80211: fix null pointer dereference
    90a886b68faa xen/efi: Set nonblocking callbacks
    5d880444955e MIPS: dts: ar9331: fix interrupt-controller size
    6d0da953bd8e net: dsa: qca8k: Use up to 7 ports for all operations
    1cd24f5edab8 ARM: dts: am4372: Set memory bandwidth limit for DISPC
    960019214539 ieee802154: ca8210: prevent memory leak
    ec3817c62ede ARM: OMAP2+: Fix warnings with broken omap2_set_init_voltage()
    a23cd06c2cd2 ARM: OMAP2+: Fix missing reset done flag for am3 and am43
    fcff55e25593 scsi: qla2xxx: Fix unbound sleep in fcport delete path.
    c3d475c7d9b9 scsi: megaraid: disable device when probe failed after enabled device
    c6d91bd3fa35 scsi: ufs: skip shutdown if hba is not powered
    db783e05df55 nvme-pci: Fix a race in controller removal
    c3038e718a19 Linux 4.19.80
    0603d82bcae4 perf/hw_breakpoint: Fix arch_hw_breakpoint use-before-initialization
    91849adc9f90 PCI: vmd: Fix config addressing when using bus offsets
    cd4b60e57a7a x86/asm: Fix MWAITX C-state hint value
    99ada52ce213 hwmon: Fix HWMON_P_MIN_ALARM mask
    b9040fab5f36 tracing: Get trace_array reference for available_tracers files
    a6c9fb2c2ce4 ftrace: Get a reference counter for the trace_array on filter files
    b7f758631d69 tracing/hwlat: Don't ignore outer-loop duration when calculating max_latency
    6271cbff9309 tracing/hwlat: Report total time spent in all NMIs during the sample
    3766c9d9c47c arm64/sve: Fix wrong free for task->thread.sve_state
    6f64aa703c0c media: stkwebcam: fix runtime PM after driver unbind
    664ec2db3b1f Fix the locking in dcache_readdir() and friends
    a64241ba496c arm64: topology: Use PPTT to determine if PE is a thread
    b098a4cd99ff ACPI/PPTT: Add support for ACPI 6.3 thread flag
    a73306414fcd ACPICA: ACPI 6.3: PPTT add additional fields in Processor Structure Flags
    34ab38cd8098 MIPS: elf_hwcap: Export userspace ASEs
    aaa81d9e6523 MIPS: Disable Loongson MMI instructions for kernel build
    e9360f393d7b NFS: Fix O_DIRECT accounting of number of bytes read/written
    e0805d7f7f1b btrfs: fix uninitialized ret in ref-verify
    f7313de46e46 btrfs: fix incorrect updating of log root tree
    a8de7090805d cifs: use cifsInodeInfo->open_file_lock while iterating to avoid a panic
    f6c715708fb8 iio: adc: stm32-adc: fix a race when using several adcs with dma and irq
    a9968a4d6399 iio: adc: stm32-adc: move registers definitions
    410ab742a503 gpiolib: don't clear FLAG_IS_OUT when emulating open-drain/open-source
    b41013b51870 firmware: google: increment VPD key_len properly
    491a39dcee44 mm/vmpressure.c: fix a signedness bug in vmpressure_register_event()
    7bbe6eefdbb3 kernel/sysctl.c: do not override max_threads provided by userspace
    230b339a7c75 CIFS: Force reval dentry if LOOKUP_REVAL flag is set
    0bc78de461b4 CIFS: Force revalidate inode when dentry is stale
    d72c2115108f CIFS: Gracefully handle QueryInfo errors during open
    345c03a0defb blk-wbt: fix performance regression in wbt scale_up/scale_down
    d855a5f2dec7 perf inject jit: Fix JIT_CODE_MOVE filename
    47a4e4decddd perf llvm: Don't access out-of-scope array
    ee7ee6cfc3af efivar/ssdt: Don't iterate over EFI vars if no SSDT override was specified
    c9a182ddf2d4 iio: light: opt3001: fix mutex unlock race
    811616a6400d iio: adc: axp288: Override TS pin bias current for some models
    99757b1d9c17 iio: adc: ad799x: fix probe error handling
    2cb6f0417ee1 iio: adc: hx711: fix bug in sampling of data
    2f9a82e2d2e6 staging: vt6655: Fix memory leak in vt6655_probe
    df455ed36901 Staging: fbtft: fix memory leak in fbtft_framebuffer_alloc
    d58d477c5852 gpio: eic: sprd: Fix the incorrect EIC offset when toggling
    ce20fd3e1530 mei: avoid FW version request on Ibex Peak and earlier
    d7e57796b6c0 mei: me: add comet point (lake) LP device ids
    f931791751d3 USB: legousbtower: fix use-after-free on release
    e3f445666f51 USB: legousbtower: fix open after failed reset request
    99c0c615ff98 USB: legousbtower: fix potential NULL-deref on disconnect
    fe471bf16720 USB: legousbtower: fix deadlock on disconnect
    4fde6c982393 USB: legousbtower: fix slab info leak at probe
    dff3bc5edcf6 usb: renesas_usbhs: gadget: Fix usb_ep_set_{halt,wedge}() behavior
    55efffb294d2 usb: renesas_usbhs: gadget: Do not discard queues in usb_ep_set_{halt,wedge}()
    3b089cef3cc1 USB: dummy-hcd: fix power budget for SuperSpeed mode
    ab8d87d14d82 USB: microtek: fix info-leak at probe
    0f14e44ebc0e USB: usblcd: fix I/O after disconnect
    58c2b4c5610d USB: serial: fix runtime PM after driver unbind
    8dcda04939fd USB: serial: option: add support for Cinterion CLS8 devices
    f7ab1c54c1a4 USB: serial: option: add Telit FN980 compositions
    13b0420eb2ea USB: serial: ftdi_sio: add device IDs for Sienna and Echelon PL-20
    a463d20a5772 USB: serial: keyspan: fix NULL-derefs on open() and write()
    21917fcb05d1 serial: uartlite: fix exit path null pointer
    0c999b4b00db USB: ldusb: fix NULL-derefs on driver unbind
    39fe586c4069 USB: chaoskey: fix use-after-free on release
    2f2b039530ea USB: usblp: fix runtime PM after driver unbind
    2095532522d1 USB: iowarrior: fix use-after-free after driver unbind
    7f93c8c89541 USB: iowarrior: fix use-after-free on release
    2fdcf7e19bde USB: iowarrior: fix use-after-free on disconnect
    ab162d331cc1 USB: adutux: fix use-after-free on release
    ca9c18c00a95 USB: adutux: fix NULL-derefs on disconnect
    316f51d77597 USB: adutux: fix use-after-free on disconnect
    ea7255663398 xhci: Increase STS_SAVE timeout in xhci_suspend()
    cbc5abaa6f30 xhci: Prevent deadlock when xhci adapter breaks during init
    fde058a17c18 usb: xhci: wait for CNR controller not ready bit in xhci resume
    13e793da4f70 xhci: Fix USB 3.1 capability detection on early xHCI 1.1 spec based hosts
    d6bdd4686ffc xhci: Check all endpoints for LPM timeout
    faa0502a5be5 xhci: Prevent device initiated U1/U2 link pm if exit latency is too long
    077855ba2df2 xhci: Fix false warning message about wrong bounce buffer write length
    31604075ceb4 USB: usb-skeleton: fix NULL-deref on disconnect
    dcabc48fe0ac USB: usb-skeleton: fix runtime PM after driver unbind
    571a14063619 USB: yurex: fix NULL-derefs on disconnect
    a8fe336f20b9 USB: yurex: Don't retry on unexpected errors
    86575b7f636f USB: rio500: Remove Rio 500 kernel driver
    95bcc0d980ae f2fs: use EINVAL for superblock with invalid magic
    7d1688c6731b panic: ensure preemption is disabled during panic()
    dafd634415a7 Linux 4.19.79
    1bd17a737c9e nl80211: validate beacon head
    527ba5d7634b cfg80211: Use const more consistently in for_each_element macros
    ad180cace853 cfg80211: add and use strongly typed element iteration macros
    3dab5ba6d7ae staging: erofs: detect potential multiref due to corrupted images
    8b4341f9b80b staging: erofs: add two missing erofs_workgroup_put for corrupted images
    596bbc4e0edf staging: erofs: some compressed cluster should be submitted for corrupted images
    e7c44410387c staging: erofs: fix an error handling in erofs_readdir()
    1b94c1e80ca8 coresight: etm4x: Use explicit barriers on enable/disable
    effad578c23f vfs: Fix EOVERFLOW testing in put_compat_statfs64
    d976344d27f7 arm64/speculation: Support 'mitigations=' cmdline option
    af33d746286c arm64: Use firmware to detect CPUs that are not affected by Spectre-v2
    17d1acc4c61d arm64: Force SSBS on context switch
    fe22ea561ce0 arm64: ssbs: Don't treat CPUs with SSBS as unaffected by SSB
    dada3a4abb43 arm64: add sysfs vulnerability show for speculative store bypass
    f41df38898ec arm64: add sysfs vulnerability show for spectre-v2
    9d1bb39cdd96 arm64: Always enable spectre-v2 vulnerability detection
    b1a33cfd8034 arm64: Advertise mitigation of Spectre-v2, or lack thereof
    59a6dc262c85 arm64: Provide a command line to disable spectre_v2 mitigation
    c131623b1e9d arm64: Always enable ssb vulnerability detection
    47a11f2eafcc arm64: enable generic CPU vulnerabilites support
    512158d0c67e arm64: add sysfs vulnerability show for meltdown
    047aac35fd1a arm64: Add sysfs vulnerability show for spectre-v1
    edfc026626d6 arm64: fix SSBS sanitization
    09c22781dd2c arm64: docs: Document SSBS HWCAP
    a59d42ac50a1 KVM: arm64: Set SCTLR_EL2.DSSBS if SSBD is forcefully disabled and !vhe
    1eaff33e2441 arm64: ssbd: Add support for PSTATE.SSBS rather than trapping to EL3
    d286a37471b6 riscv: Avoid interrupts being erroneously enabled in handle_exception()
    5b67a4721ddd perf stat: Reset previous counts on repeat with interval
    15c57bf9dcf8 perf tools: Fix segfault in cpu_cache_level__read()
    e5331c37c08b tick: broadcast-hrtimer: Fix a race in bc_set_next
    140acbb09384 tools lib traceevent: Do not free tep->cmdlines in add_new_comm() on failure
    d1e4b4cc3bba powerpc/book3s64/radix: Rename CPU_FTR_P9_TLBIE_BUG feature flag
    f5f31a6ea558 powerpc/pseries: Fix cpu_hotplug_lock acquisition in resize_hpt()
    c688982ffaeb nbd: fix crash when the blksize is zero
    63bb8b76ed62 KVM: nVMX: Fix consistency check on injected exception error code
    34b13ff69668 KVM: PPC: Book3S HV: XIVE: Free escalation interrupts before disabling the VP
    1b155b4fe8b4 drm/radeon: Bail earlier when radeon.cik_/si_support=0 is passed
    04e0c84f137d nfp: flower: fix memory leak in nfp_flower_spawn_vnic_reprs
    575a5bb3d372 perf unwind: Fix libunwind build failure on i386 systems
    b0aaf65bb16a kernel/elfcore.c: include proper prototypes
    bab46480e6f9 perf build: Add detection of java-11-openjdk-devel package
    46ff0e2f869f sched/core: Fix migration to invalid CPU in __set_cpus_allowed_ptr()
    6cb7aa1b4f94 sched/membarrier: Fix private expedited registration check
    e250f2b6aa9e sched/membarrier: Call sync_core only before usermode for same mm
    9f33b178cbb2 libnvdimm/nfit_test: Fix acpi_handle redefinition
    7b4f541fcd1c fuse: fix memleak in cuse_channel_open
    2e93d24ac75e libnvdimm/region: Initialize bad block for volatile namespaces
    9025adf37ee8 thermal_hwmon: Sanitize thermal_zone type
    c01a9dbec18a thermal: Fix use-after-free when unregistering thermal zone device
    55ebeb4e865d ntb: point to right memory window index
    9dabade5c197 x86/purgatory: Disable the stackleak GCC plugin for the purgatory
    65348659535d pwm: stm32-lp: Add check in case requested period cannot be achieved
    19b1c70e911c pNFS: Ensure we do clear the return-on-close layout stateid on fatal errors
    1c70ae6a91f9 drm/amdgpu: Check for valid number of registers to read
    e0af3b19ad77 drm/amdgpu: Fix KFD-related kernel oops on Hawaii
    f7ace7f25214 netfilter: nf_tables: allow lookups in dynamic sets
    f217883bbc92 watchdog: aspeed: Add support for AST2600
    520c2a64fc78 ceph: reconnect connection if session hang in opening state
    0275113fc09a ceph: fix directories inode i_blkbits initialization
    2bc2a90a083a xen/pci: reserve MCFG areas earlier
    18dd2b05f349 9p: avoid attaching writeback_fid on mmap with type PRIVATE
    07f3596ce344 9p: Transport error uninitialized
    448deb13ab9e fs: nfs: Fix possible null-pointer dereferences in encode_attrs()
    4753e7a824cb ima: fix freeing ongoing ahash_request
    b69c3085fcc6 ima: always return negative code for error
    6df3c66de09d arm64: cpufeature: Detect SSBS and advertise to userspace
    3a0e673305e2 cfg80211: initialize on-stack chandefs
    16c75eb13a72 s390/cio: avoid calling strlen on null pointer
    3f41e88f4bd4 ieee802154: atusb: fix use-after-free at disconnect
    975859bb69b2 xen/xenbus: fix self-deadlock after killing user process
    e409b81d9ddb Revert "locking/pvqspinlock: Don't wait if vCPU is preempted"
    7ed2867ceb41 mmc: sdhci-of-esdhc: set DMA snooping based on DMA coherence
    4509a19d5082 mmc: sdhci: improve ADMA error reporting
    873f49d6a4e8 drm/i915/gvt: update vgpu workload head pointer correctly
    198bc7040c48 drm/nouveau/kms/nv50-: Don't create MSTMs for eDP connectors
    7a85c8673551 drm/msm/dsi: Fix return value check for clk_get_parent
    0e45633f49ef drm/omap: fix max fclk divider for omap36xx
    90ac4028739c perf stat: Fix a segmentation fault when using repeat forever
    22f28afd3d77 watchdog: imx2_wdt: fix min() calculation in imx2_wdt_set_timeout
    e7cf8cc79f93 PCI: Restore Resizable BAR size bits correctly for 1MB BARs
    956ce989c41f PCI: vmd: Fix shadow offsets to reflect spec changes
    06f250215beb timer: Read jiffies once when forwarding base clk
    12c6c4a50f66 usercopy: Avoid HIGHMEM pfn warning
    e010c9835183 tracing: Make sure variable reference alias has correct var_ref_idx
    022ca58f109e power: supply: sbs-battery: only return health when battery present
    5cb6dd823127 power: supply: sbs-battery: use correct flags field
    fb93ccde081e MIPS: Treat Loongson Extensions as ASEs
    a0dc60ac6bef crypto: ccree - use the full crypt length value
    f5c087a0d9a0 crypto: ccree - account for TEE not ready to report
    561bf9309209 crypto: caam - fix concurrency issue in givencrypt descriptor
    3683dd7074dc crypto: cavium/zip - Add missing single_release()
    cd8e0a5d94fb crypto: skcipher - Unmap pages after an external error
    9349108ae499 crypto: qat - Silence smp_processor_id() warning
    532920b26678 tools lib traceevent: Fix "robust" test of do_generate_dynamic_list_file
    4aaea17d3c31 can: mcp251x: mcp251x_hw_reset(): allow more time after a reset
    9124eac41a67 powerpc/book3s64/mm: Don't do tlbie fixup for some hardware revisions
    19c12f12093e powerpc/powernv/ioda: Fix race in TCE level allocation
    032ce7d766a9 powerpc/powernv: Restrict OPAL symbol map to only be readable by root
    ba3ca9fcb0e7 powerpc/mce: Schedule work from irq_work
    ee6eeeb88e79 powerpc/mce: Fix MCE handling for huge pages
    1284f2073415 ASoC: sgtl5000: Improve VAG power and mute control
    50090b75fa89 ASoC: Define a set of DAPM pre/post-up events
    42b888f63333 PM / devfreq: tegra: Fix kHz to Hz conversion
    9f0f39c92e4f nbd: fix max number of supported devs
    eff3a54aae68 KVM: nVMX: handle page fault in vmread fix
    21874027e1de KVM: X86: Fix userspace set invalid CR4
    30fbe0d380aa KVM: PPC: Book3S HV: Don't lose pending doorbell request on migration on P9
    4faa7f05af75 KVM: PPC: Book3S HV: Check for MMU ready on piggybacked virtual cores
    577a5119d7af KVM: PPC: Book3S HV: Fix race in re-enabling XIVE escalation interrupts
    46cb14a57088 s390/cio: exclude subchannels with no parent from pseudo check
    9aa823b3c0a6 s390/topology: avoid firing events before kobjs are created
    ddfef75f877b KVM: s390: Test for bad access register and size at the start of S390_MEM_OP
    8b41a30f91db s390/process: avoid potential reading of freed stack

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit e23a86fa40be2e1dfe50baeebe787e98f793cc5b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
(cherry picked from commit 8a36666265002805134cc3786c0e81bc709d8d10)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../linux/linux-yocto-rt_4.19.bb              |  6 +++---
 .../linux/linux-yocto-tiny_4.19.bb            |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 8e36d9aa48..f588d7f522 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0e4a79e608e92830693e511a3dd282ce7c3b3f41"
-SRCREV_meta ?= "ad6f8b357720ca8167a090713b7746230cf4b314"
+SRCREV_machine ?= "f272b39688fbec016d91b5c0c9d1bb7b5bc3b2ca"
+SRCREV_meta ?= "e3efe5a5f9ded629a0df5e6b42eaddfab0ec2891"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.19.78"
+LINUX_VERSION ?= "4.19.84"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 2af79874e8..0f3b0d569b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.19.78"
+LINUX_VERSION ?= "4.19.84"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "be50001808f00efee538c2a3e7c0a5a2a2df65da"
-SRCREV_machine ?= "a915fbeae8ed987402f69666d90bef15a01c5823"
-SRCREV_meta ?= "ad6f8b357720ca8167a090713b7746230cf4b314"
+SRCREV_machine_qemuarm ?= "d971adf5221e18df3ba46bddee4719c85f98977a"
+SRCREV_machine ?= "acde437f3893a7b2eb8f1b2ec5f1e42176a90e4a"
+SRCREV_meta ?= "e3efe5a5f9ded629a0df5e6b42eaddfab0ec2891"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 73f1715b13..17620c74b5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -11,22 +11,22 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
 KBRANCH_qemux86-64 ?= "v4.19/standard/base"
 KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "7fde51abcaf389193ce5d87ebfb8e8fb66a9271a"
-SRCREV_machine_qemuarm64 ?= "a915fbeae8ed987402f69666d90bef15a01c5823"
-SRCREV_machine_qemumips ?= "8ac68d42beb24b275ac0d2a54a0a2291970e5dde"
-SRCREV_machine_qemuppc ?= "a915fbeae8ed987402f69666d90bef15a01c5823"
-SRCREV_machine_qemux86 ?= "a915fbeae8ed987402f69666d90bef15a01c5823"
-SRCREV_machine_qemux86-64 ?= "a915fbeae8ed987402f69666d90bef15a01c5823"
-SRCREV_machine_qemumips64 ?= "ea2cb8731306f734bf0227575e04cafac7dfade0"
-SRCREV_machine ?= "a915fbeae8ed987402f69666d90bef15a01c5823"
-SRCREV_meta ?= "ad6f8b357720ca8167a090713b7746230cf4b314"
+SRCREV_machine_qemuarm ?= "425023bd5cfe4f4f7b950c84f62861de600d4f6c"
+SRCREV_machine_qemuarm64 ?= "acde437f3893a7b2eb8f1b2ec5f1e42176a90e4a"
+SRCREV_machine_qemumips ?= "6273d88ca69ada3ae4684fc6301e39381f4cd3e4"
+SRCREV_machine_qemuppc ?= "acde437f3893a7b2eb8f1b2ec5f1e42176a90e4a"
+SRCREV_machine_qemux86 ?= "acde437f3893a7b2eb8f1b2ec5f1e42176a90e4a"
+SRCREV_machine_qemux86-64 ?= "acde437f3893a7b2eb8f1b2ec5f1e42176a90e4a"
+SRCREV_machine_qemumips64 ?= "f9368853646be5ce9f122adb733cbf8225641e8c"
+SRCREV_machine ?= "acde437f3893a7b2eb8f1b2ec5f1e42176a90e4a"
+SRCREV_meta ?= "e3efe5a5f9ded629a0df5e6b42eaddfab0ec2891"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
           "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.19.78"
+LINUX_VERSION ?= "4.19.84"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1


