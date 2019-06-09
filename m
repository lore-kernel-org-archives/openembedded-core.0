Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id C3BD17E511
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:11 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id q15so1470716pgr.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=tNrxZ+BF6jAWqZcD3eUoBO56SmymSfLDIciun+94SV0=;
	b=FYL3nvOv+CjXdgn/qQI+KZgJZ1U+NQNqs+3Cn71jITG+Fih3wC1ZvL7x2LraA422sQ
	m+USVwlCtoJPns2rwylvR4Y+c8XTyKyxH631cu9jZiMP9w+Iy7zqSadoJJ5Ramyn2jBQ
	xRwSz1DhSauLsEXztpbLntMQJ2XLHo+oulUSGq3LQcm4YWgEM9SVH6rQTBUSULOqxa4a
	+5Fkc0zEJCDQ6aQV41/Vr9gShr1GRRKbcasKaHnqP2ZDzviVA/GZmf8c8pFVw+LUcKSq
	FgEkNxeX4kLujJCwXIYfrvPmYH0ySpsgzry0fQdyMvAb658pgNGAx89ghA5VdnQvsXMa
	XO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tNrxZ+BF6jAWqZcD3eUoBO56SmymSfLDIciun+94SV0=;
	b=rRI2IvcfSvLmOPc0onz7ALIqC6y4u1rnFm6uTXFosTZ+K7nfSSxCUGnQ3YkVnPfD+9
	Kwma7P1kWGeAZ1l9iQH5gD9Mw8AtRAZH0P7bFwFEeXptXRvQrWFa4vat75ZiE5WNmk3Y
	3JLGc67BBvhyxgyLiZVivti72x7GIrWcTWUCc3ciYuyRYimIYBX+CKJgzCdbgQY/wb9m
	EoYuH50L1ahRsoylp/fgjcSuuIMIew0D7YF+YLMf3Fxt5S5Nd5+vDkHjRcXVFUfvpcrM
	NJce8Kcxt8pes3KgVCIqH4gsas9NvKcn8gurwLzTfu/DUlC74C8IEk7oqZAkibAaQAQR
	IDZw==
X-Gm-Message-State: APjAAAWVz3FM194O3+7AxnVGUepUR2KCY05S3JfJ7nAeNX3rWaZ1lzQI
	t9G3x6Hckp/nQhC+tg8wDoqZHhpA
X-Google-Smtp-Source: APXvYqzRCAlExETjPLwwVxLqMdx3vhdcz7UdEZo1/ViCoxEn+B7QAbYUcDuqB0lNOZ1NrQCjzhBsaw==
X-Received: by 2002:aa7:808d:: with SMTP id v13mr69358823pff.198.1560092052340;
	Sun, 09 Jun 2019 07:54:12 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:11 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:42 -0700
Message-Id: <b898726fef05ec18d0870b5bea4c7c8c90250c9d.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 07/27] linux-yocto/5.0: update to v5.0.17
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:11 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the korg -stable commits that comprise the following
changes:

   d59f5a01fa43 Linux 5.0.17
   ba686f90778b f2fs: Fix use of number of devices
   78b8c59eee72 PCI: hv: Add pci_destroy_slot() in pci_devices_present_work(), if necessary
   f20f463b32bc PCI: hv: Add hv_pci_remove_slots() when we unload the driver
   d3a9cd23b172 PCI: hv: Fix a memory leak in hv_eject_device_work()
   7f9572e798ea virtio_ring: Fix potential mem leak in virtqueue_add_indirect_packed
   ba81b50090a4 powerpc/booke64: set RI in default MSR
   0da52ad69b37 powerpc/powernv/idle: Restore IAMR after idle
   d314437d17ad powerpc/book3s/64: check for NULL pointer in pgd_alloc()
   79e981a8503f drivers/virt/fsl_hypervisor.c: prevent integer overflow in ioctl
   1a84219f73b2 drivers/virt/fsl_hypervisor.c: dereferencing error pointers in ioctl
   8b8fc62b6c67 isdn: bas_gigaset: use usb_fill_int_urb() properly
   12786188dcf3 flow_dissector: disable preemption around BPF calls
   39f7b3941969 net: phy: fix phy_validate_pause
   4a91e5e4c58f tuntap: synchronize through tfiles array instead of tun->numqueues
   e0630246658a tuntap: fix dividing by zero in ebpf queue selection
   92edcf205388 vrf: sit mtu should not be updated when vrf netdev is the link
   13d54150e746 vlan: disable SIOCSHWTSTAMP in container
   83c25477e944 tipc: fix hanging clients using poll with EPOLLOUT flag
   be6a9818866d selinux: do not report error on connect(AF_UNSPEC)
   c3954f8f5a7e packet: Fix error path in packet_init
   7bc936f4f226 net: ucc_geth - fix Oops when changing number of buffers in the ring
   57ee33b48190 net: seeq: fix crash caused by not set dev.parent
   224b04c9e028 net: macb: Change interrupt and napi enable order in open
   a3bf31d7ffb2 net: ethernet: stmmac: dwmac-sun8i: enable support of unicast filtering
   261a8958a57e net: dsa: Fix error cleanup path in dsa_init_module
   2f679c41821f ipv4: Fix raw socket lookup for local traffic
   f8351176aed6 fib_rules: return 0 directly if an exactly same rule exists when NLM_F_EXCL not supplied
   e4607de103ba dpaa_eth: fix SG frame cleanup
   430a64f6fa2c bridge: Fix error path for kobject_init_and_add()
   69798384ba38 bonding: fix arp_validate toggling in active-backup mode
   d3ff0184ebd2 Don't jump to compute_result state from check_result state
   843135c1ce1e rtlwifi: rtl8723ae: Fix missing break in switch statement
   14654a1f2e2b mwl8k: Fix rate_idx underflow
   202436fe0810 cw1200: fix missing unlock on error in cw1200_hw_scan()
   92a9787bb38c drm/rockchip: fix for mailbox read validation.
   5b4ef3c5faf9 net: mvpp2: fix validate for PPv2.1
   45e1075e04cb net: sched: fix cleanup NULL pointer exception in act_mirr
   4b84cde61ce9 bpf: only test gso type on gso packets
   073d8f286f34 mm/page_alloc.c: avoid potential NULL pointer dereference
   61fadd8a5000 mm/memory_hotplug.c: drop memory device reference after find_memory_block()
   59c58e43e80f RDMA/hns: Bugfix for mapping user db
   26f70c4e0aef gpio: Fix gpiochip_add_data_with_key() error path
   fb53ebc9eb9a net: vrf: Fix operation not supported when set vrf mac
   ec69b3c91b3b Input: synaptics-rmi4 - fix possible double free
   6a2abf951ed3 Input: snvs_pwrkey - make it depend on ARCH_MXC
   21a3f7c2c76c drm/sun4i: Unbind components before releasing DRM and memory
   f79084e5372b Revert "drm/virtio: drop prime import/export callbacks"
   2455f6cbd19b ceph: handle the case where a dentry has been renamed on outstanding req
   d3a9275364d9 spi: ST ST95HF NFC: declare missing of table
   943609acd628 spi: Micrel eth switch: declare missing of table
   4c6df58231f8 ARM: 8856/1: NOMMU: Fix CCR register faulty initialization when MPU is disabled
   dc41fe5d6fb5 ARM: fix function graph tracer and unwinder dependencies
   0cb06e339cee drm/imx: don't skip DP channel disable for background plane
   7680e881fdaa gpu: ipu-v3: dp: fix CSC handling
   28e4593bb148 arm64/module: ftrace: deal with place relative nature of PLTs
   d0f8faa2f540 dmaengine: bcm2835: Avoid GFP_KERNEL in device_prep_slave_sg
   d4dc7d99b111 netfilter: fix nf_l4proto_log_invalid to log invalid packets
   ddb632889fae netfilter: never get/set skb->tstamp
   226ef4f27a45 selftests/net: correct the return value for run_afpackettests
   1a20185157b5 selftests/net: correct the return value for run_netsocktests
   2d83e90c2375 of_net: Fix residues after of_get_nvmem_mac_address removal
   7ba51c0e84b3 drm/sun4i: Fix component unbinding and component master deletion
   3000bdec55c8 drm/sun4i: Set device driver data at bind time for use in unbind
   1330679d64f8 s390: ctcm: fix ctcm_new_device error return code
   143c8279955e IB/mlx5: Fix scatter to CQE in DCT QP creation
   b3a64096c5ee MIPS: perf: ath79: Fix perfcount IRQ assignment
   ecef50c35a07 netfilter: nat: fix icmp id randomization
   c2987d193f8b netfilter: nf_tables: prevent shift wrap in nft_chain_parse_hook()
   b0a90cae081d netfilter: ctnetlink: don't use conntrack/expect object addresses as id
   a3a5ad78488b ipvs: do not schedule icmp errors from tunnels
   44fbb3db2bde selftests: netfilter: check icmp pkttoobig errors are set as related
   16b01614d369 drm: bridge: dw-hdmi: Fix overflow workaround for Rockchip SoCs
   5bc0352515ef init: initialize jump labels before command line option parsing
   57c2301fc9c9 mm: fix inactive list balancing between NUMA nodes and cgroups
   47d1b202e325 mm/hotplug: treat CMA pages as unmovable
   247e9fe2f4ad slab: store tagged freelist for off-slab slabmgmt
   4176e671a44e scsi: aic7xxx: fix EISA support
   e9697ba264c2 perf tools: Fix map reference counting
   d39036685e22 ocelot: Don't sleep in atomic context (irqs_disabled())
   d7200d0648e5 ipmi: ipmi_si_hardcode.c: init si_type array to fix a crash
   d2ae8127d693 perf top: Always sample time to satisfy needs of use of ordered queuing
   9b2395e2bfec tools lib traceevent: Fix missing equality check for strcmp
   b053700b6ce9 KVM: x86: avoid misreporting level-triggered irqs as edge-triggered in tracing
   7cee96602903 KVM: fix spectrev1 gadgets
   ac0cd21ff7f3 KVM: nVMX: always use early vmcs check when EPT is disabled
   ad0b4845927e x86/reboot, efi: Use EFI reboot for Acer TravelMate X514-51T
   47155c33761e x86/mm: Prevent bogus warnings with "noexec=off"
   e011d319f736 x86/build/lto: Fix truncated .bss with -fdata-sections
   5a8306e3b433 s390/pkey: add one more argument space for debug feature entry
   7a96a56eea04 drm/amd/display: If one stream full updates, full update all planes
   e3a41f93e337 qed: Fix the DORQ's attentions handling
   47ef1bab8d1d qed: Fix missing DORQ attentions
   deb2cc51dd52 qed: Fix the doorbell address sanity check
   2de1573a5ed9 qed: Delete redundant doorbell recovery types
   775e0e613250 afs: Fix in-progess ops to ignore server-level callback invalidation
   35d71b00267e afs: Unlock pages for __pagevec_release()
   f4faab6c9034 qede: fix write to free'd pointer error and double free of ptp
   40990109952a vxge: fix return of a free'd memblock on a failed dma mapping
   4230787c0655 mISDN: Check address length before reading address family
   2d56b3f53ac8 drm/amdgpu: shadow in shadow_list without tbo.mem.start cause page fault in sriov TDR
   bf4b7bc690e3 selftests: fib_tests: Fix 'Command line is not complete' errors
   b1e68de7659a clocksource/drivers/oxnas: Fix OX820 compatible
   641a9b94456d clocksource/drivers/npcm: select TIMER_OF
   44d7638b3934 drm/amd/display: extending AUX SW Timeout
   6661203b4210 drm/ttm: fix dma_fence refcount imbalance on error path
   1e1bdaca091e s390/3270: fix lockdep false positive on view->lock
   adefea883c1f tools/testing/nvdimm: Retain security state after overwrite
   40af621fefdb libnvdimm/pmem: fix a possible OOB access when read and write pmem
   7547c20fdd1c libnvdimm/security: provide fix for secure-erase to use zero-key
   8f2e6b8c9b0b nl80211: Add NL80211_FLAG_CLEAR_SKB flag for other NL commands
   0e36c8ed2d52 mac80211: fix memory accounting with A-MSDU aggregation
   c93951de3ecb cfg80211: Handle WMM rules in regulatory domain intersection
   7c7345f1cad8 mac80211: Increase MAX_MSG_LEN
   0c077b14bdc0 mac80211: fix unaligned access in mesh table hash function
   9d02fc4b7789 s390/dasd: Fix capacity calculation for large volumes
   181518b8eb4e libnvdimm/btt: Fix a kmemdup failure check
   f744a5e31a47 HID: input: add mapping for "Toggle Display" key
   0e56b93040c2 HID: input: add mapping for keyboard Brightness Up/Down/Toggle keys
   c64e4d22342c HID: input: add mapping for Expose/Overview key
   e42bcea02b46 libnvdimm/namespace: Fix a potential NULL pointer dereference
   469cc616e03c acpi/nfit: Always dump _DSM output payload
   a9189a36d66e iio: adc: xilinx: prevent touching unclocked h/w on remove
   1fc0aeddc0b7 iio: adc: xilinx: fix potential use-after-free on probe
   fc92e97e24df iio: adc: xilinx: fix potential use-after-free on remove
   a41382ca99e8 USB: serial: fix unthrottle races
   b5f2cb384e11 virt: vbox: Sanity-check parameter types for hgcm-calls coming from userspace
   a16532b59cca kernfs: fix barrier usage in __kernfs_new_node()
   0748cf2d9d1c selftests/seccomp: Handle namespace failures gracefully
   5c3c0ffa9d74 hwmon: (occ) Fix extended status bits
   a91e668131ad hwmon: (pwm-fan) Disable PWM if fetching cooling data fails
   b9d31180294a platform/x86: dell-laptop: fix rfkill functionality
   22c8b3235eb2 platform/x86: thinkpad_acpi: Disable Bluetooth for some machines
   8fb172181a29 platform/x86: sony-laptop: Fix unintentional fall-through
   54c140c5b614 bfq: update internal depth state when queue depth changes
   89e11ec0280b Linux 5.0.16
   f8bb2589227b x86/speculation/mds: Fix documentation typo
   14e3ad8a1452 Documentation: Correct the possible MDS sysfs values
   0acbbdf3e41d x86/mds: Add MDSUM variant to the MDS documentation
   4cf168a94fd5 x86/speculation/mds: Add 'mitigations=' support for MDS
   394e3d8de828 s390/speculation: Support 'mitigations=' cmdline option
   f905727fa11c powerpc/speculation: Support 'mitigations=' cmdline option
   bd600de16b82 x86/speculation: Support 'mitigations=' cmdline option
   6d7407ef9272 cpu/speculation: Add 'mitigations=' cmdline option
   c2b25b6b3582 x86/speculation/mds: Print SMT vulnerable on MSBDS with mitigations off
   3f7fe4ad1f62 x86/speculation/mds: Fix comment
   9cd62662dd7e x86/speculation/mds: Add SMT warning message
   c98b736e763d x86/speculation: Move arch_smt_update() call to after mitigation decisions
   fb49e1bb2061 x86/speculation/mds: Add mds=full,nosmt cmdline option
   08831a92501f Documentation: Add MDS vulnerability documentation
   ab8e3e63f23e Documentation: Move L1TF to separate directory
   31fd0223449e x86/speculation/mds: Add mitigation mode VMWERV
   3944139ce828 x86/speculation/mds: Add sysfs reporting for MDS
   0174e8984c2d x86/speculation/mds: Add mitigation control for MDS
   d9117863c521 x86/speculation/mds: Conditionally clear CPU buffers on idle entry
   100087c08030 x86/kvm/vmx: Add MDS protection when L1D Flush is not active
   481871997e37 x86/speculation/mds: Clear CPU buffers on exit to user
   a5a8ef7cd7c9 x86/speculation/mds: Add mds_clear_cpu_buffers()
   87f96d5e7525 x86/kvm: Expose X86_FEATURE_MD_CLEAR to guests
   78157c977674 x86/speculation/mds: Add BUG_MSBDS_ONLY
   ea3d1b32b86e x86/speculation/mds: Add basic bug infrastructure for MDS
   019159aec4b7 x86/speculation: Consolidate CPU whitelists
   26c0aff1ad63 x86/msr-index: Cleanup bit defines
   7b13756d2c32 Linux 5.0.15
   41d7bb19aa31 arm64: futex: Bound number of LDXR/STXR loops in FUTEX_WAKE_OP
   3b928b59fae0 locking/futex: Allow low-level atomic operations to return -EAGAIN
   be4b9a303a25 i3c: Fix a shift wrap bug in i3c_bus_set_addr_slot_status()
   4b1f2ad28fe1 ASoC: Intel: avoid Oops if DMA setup fails
   987722984163 UAS: fix alignment of scatter/gather segments
   349bb9138b3a Bluetooth: hci_bcm: Fix empty regulator supplies for Intel Macs
   41d5f23ef17b Bluetooth: Fix not initializing L2CAP tx_credits
   2c93762f4b38 Bluetooth: Align minimum encryption key size for LE and BR/EDR connections
   1c1727f4b948 Bluetooth: hidp: fix buffer overflow
   69d6687a5c66 scsi: qla2xxx: Fix device staying in blocked state
   aee2053554ea scsi: qla2xxx: Fix incorrect region-size setting in optrom SYSFS routines
   45076c8e403a scsi: lpfc: change snprintf to scnprintf for possible overflow
   185e58d16ac8 soc: sunxi: Fix missing dependency on REGMAP_MMIO
   34ebc8ad2ea4 ACPI / LPSS: Use acpi_lpss_* instead of acpi_subsys_* functions for hibernate
   61ae16c4586b cpufreq: armada-37xx: fix frequency calculation for opp
   573a935bfb4f iio: adc: qcom-spmi-adc5: Fix of-based module autoloading
   284af2788432 intel_th: pci: Add Comet Lake support
   704eaf49399f usb-storage: Set virt_boundary_mask to avoid SG overflows
   bba2feefcacd USB: cdc-acm: fix unthrottle races
   5b1c70f36832 USB: serial: f81232: fix interrupt worker not stop
   083a8f69962a usb: dwc3: Fix default lpm_nyet_threshold value
   9092861ce665 usb: dwc3: Allow building USB_DWC3_QCOM without EXTCON
   70a44a01f8a4 genirq: Prevent use-after-free and work list corruption
   b5dbb4058183 iommu/amd: Set exclusion range correctly
   6610c1785f70 perf/core: Fix perf_event_disable_inatomic() race
   a5f62d2c15a2 NFSv4.1 fix incorrect return value in copy_file_range
   a3aa7cab0fc2 platform/x86: pmc_atom: Drop __initconst on dmi table
   e6f2733f48cb nvmet: fix discover log page when offsets are used
   ea359038ab73 nvme-fc: correct csn initialization and increments on error
   407bb38bf3f7 nvme: cancel request synchronously
   e62732d12bd9 blk-mq: introduce blk_mq_complete_request_sync()
   e81f9ca291ac virtio-blk: limit number of hw queues by nr_cpu_ids
   677713b1254f ALSA: hda: Fix racy display power access
   7c7450aa9838 ASoC: stm32: sai: fix master clock management
   60ec4c3d39be ASoC: Intel: kbl: fix wrong number of channels
   c79f5a7a3559 drm/mediatek: no change parent rate in round_rate() for MT2701 hdmi phy
   718254750661 drm/mediatek: using new factor for tvdpll for MT2701 hdmi phy
   5b82d95ac6fe drm/mediatek: remove flag CLK_SET_RATE_PARENT for MT2701 hdmi phy
   273ed6c20cb5 drm/mediatek: make implementation of recalc_rate() for MT2701 hdmi phy
   4b112e5e6af9 drm/mediatek: fix the rate and divder of hdmi phy for MT2701
   a873474c769a drm/mediatek: fix possible object reference leak
   3051b6a1a14a scsi: csiostor: fix missing data copy in csio_scsi_err_handler()
   353392e5b9a5 KEYS: trusted: fix -Wvarags warning
   6fb3aa5d7307 RDMA/hns: Fix bug that caused srq creation to fail
   f4d87f9b027a RDMA/vmw_pvrdma: Fix memory leak on pvrdma_pci_remove
   3fa40c30fe4c virtio_pci: fix a NULL pointer reference in vp_del_vqs
   e0696fe3c10f drm/sun4i: tcon top: Fix NULL/invalid pointer dereference in sun8i_tcon_top_un/bind
   09c5ad16c22c slab: fix a crash by reading /proc/slab_allocators
   ad74ab443e30 objtool: Add rewind_stack_do_exit() to the noreturn list
   fa42760cf276 ASoC: cs35l35: Disable regulators on driver removal
   c577757d294e drm/amd/display: fix cursor black issue
   4b5f2b0ce17c drm/amdgpu: amdgpu_device_recover_vram always failed if only one node in shadow_list
   f528dbeec017 drm/amdgpu: Adjust IB test timeout for XGMI configuration
   255063992678 drm/amdkfd: Add picasso pci id
   2f0ec100032e ASoC: rockchip: pdm: fix regmap_ops hang issue
   dfa9efe42df2 xtensa: fix initialization of pt_regs::syscall in start_thread
   9680a806201d iov_iter: Fix build error without CONFIG_CRYPTO
   2e94d4e8f2b9 linux/kernel.h: Use parentheses around argument in u64_to_user_ptr()
   bae9b6b98342 perf/x86/intel: Initialize TFA MSR
   9bd3e66587f5 perf/x86/intel: Fix handling of wakeup_events for multi-entry PEBS
   83f3ed3b4bde drm/mediatek: Fix an error code in mtk_hdmi_dt_parse_pdata()
   693d72f920e7 ASoC: tlv320aic32x4: Fix Common Pins
   e904a8b14895 MIPS: KGDB: fix kgdb support for SMP platforms.
   59188acd0c7d IB/hfi1: Fix the allocation of RSM table
   a3270ed43389 IB/hfi1: Eliminate opcode tests on mr deref
   1f9f22f6c7d6 IB/hfi1: Clear the IOWAIT pending bits when QP is put into error state
   a2fdb5d19477 drm/omap: hdmi4_cec: Fix CEC clock handling for PM
   08aa8be65b52 ASoC: dapm: Fix NULL pointer dereference in snd_soc_dapm_free_kcontrol
   15d326f9548b ASoC: cs4270: Set auto-increment bit for register writes
   1be14f5da0b1 ASoC: stm32: dfsdm: fix debugfs warnings on entry creation
   9baa2f8ab758 ASoC: stm32: dfsdm: manage multiple prepare
   5bff91d2a18f clk: meson-gxbb: round the vdec dividers to closest
   b2b47cecd2ce ASoC: wm_adsp: Add locking to wm_adsp2_bus_error
   9fb991d9cf50 ASoC: rt5682: recording has no sound after booting
   b2cb6f8f307b ASoC: rt5682: fix jack type detection issue
   8425db671440 ASoC: rt5682: Check JD status when system resume
   3f60f8813be9 ASoC: samsung: odroid: Fix clock configuration for 44100 sample rate
   b44509a152a3 ASoC: nau8810: fix the issue of widget with prefixed name
   6c4a8ae4baa6 ASoC: nau8824: fix the issue of the widget with prefix name
   f4f4303c6d54 ASoC: dpcm: prevent snd_soc_dpcm use after free
   71ec072682ff ASoC:intel:skl:fix a simultaneous playback & capture issue on hda platform
   ad8af1f8d26e ASoC:hdac_hda:use correct format to setup hda codec
   30d948ac01d9 ASoC:soc-pcm:fix a codec fixup issue in TDM case
   6872cfa57c42 ASoC: stm32: sai: fix race condition in irq handler
   b329de3769b0 ASoC: stm32: sai: fix exposed capabilities in spdif mode
   27162c8fdfb9 ASoC: stm32: sai: fix iec958 controls indexation
   aba1a357cd90 ASoC: hdmi-codec: fix S/PDIF DAI
   045c73ba325d ASoC: tlv320aic3x: fix reset gpio reference counting
   ce3a072f275a staging: most: sound: pass correct device when creating a sound card
   2dbcc037de1a staging: most: cdev: fix chrdev_region leak in mod_exit
   3f57fef02fa7 staging: wilc1000: Avoid GFP_KERNEL allocation from atomic context.
   9cccac4ee35f staging: greybus: power_supply: fix prop-descriptor request size
   9fe5b8e9d4c2 ubsan: Fix nasty -Wbuiltin-declaration-mismatch GCC-9 warnings
   7c03a3534d24 Drivers: hv: vmbus: Remove the undesired put_cpu_ptr() in hv_synic_cleanup()
   634424f63373 net: stmmac: Use bfsize1 in ndesc_init_rx_desc

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 20 ++++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 922db1e..69c5909 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "36f6c28b2561bf4dcba5a326a51bc0aa6fc59330"
-SRCREV_meta ?= "d26eec23cf1057a715c05777a18f395678fcbf38"
+SRCREV_machine ?= "7365aab1a7b980f7d81b37f96841cbe88a306b7e"
+SRCREV_meta ?= "2bc19ce252b1ce753056b32c55f55f515698b42a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.0.13"
+LINUX_VERSION ?= "5.0.17"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index f407111..9888a3f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.0.13"
+LINUX_VERSION ?= "5.0.17"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "9e6c0e79debd9bb85ef44a93927fbe504e42c5a1"
-SRCREV_machine ?= "f990fd0ce123aa6035042efad09b2ddc3e7d48f4"
-SRCREV_meta ?= "d26eec23cf1057a715c05777a18f395678fcbf38"
+SRCREV_machine_qemuarm ?= "bb915f6be9a133fd702b152aa456cc31eea0936e"
+SRCREV_machine ?= "fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c"
+SRCREV_meta ?= "2bc19ce252b1ce753056b32c55f55f515698b42a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 466e929..dfbe495 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -11,15 +11,15 @@ KBRANCH_qemux86  ?= "v5.0/standard/base"
 KBRANCH_qemux86-64 ?= "v5.0/standard/base"
 KBRANCH_qemumips64 ?= "v5.0/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "74c4e04f742af858253252ae4160ee0fc5a65608"
-SRCREV_machine_qemuarm64 ?= "f990fd0ce123aa6035042efad09b2ddc3e7d48f4"
-SRCREV_machine_qemumips ?= "dd9de85be86c3af916d5d9fde9cff70896aa72d8"
-SRCREV_machine_qemuppc ?= "f990fd0ce123aa6035042efad09b2ddc3e7d48f4"
-SRCREV_machine_qemux86 ?= "f990fd0ce123aa6035042efad09b2ddc3e7d48f4"
-SRCREV_machine_qemux86-64 ?= "f990fd0ce123aa6035042efad09b2ddc3e7d48f4"
-SRCREV_machine_qemumips64 ?= "4fc49a67d100bf80ac969b7e8889f419628df97b"
-SRCREV_machine ?= "f990fd0ce123aa6035042efad09b2ddc3e7d48f4"
-SRCREV_meta ?= "d26eec23cf1057a715c05777a18f395678fcbf38"
+SRCREV_machine_qemuarm ?= "0cf286c38da5959520f6c01e606c722deb069fd1"
+SRCREV_machine_qemuarm64 ?= "fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c"
+SRCREV_machine_qemumips ?= "577fd817ec6c9566277b341ac5911ea657ec5ba4"
+SRCREV_machine_qemuppc ?= "fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c"
+SRCREV_machine_qemux86 ?= "fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c"
+SRCREV_machine_qemux86-64 ?= "fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c"
+SRCREV_machine_qemumips64 ?= "f9e63bc3f0ee65f03b3f9963a938668e6abf9425"
+SRCREV_machine ?= "fa6f061d0da0c15c8685e6fad5b8ccc96a2e212c"
+SRCREV_meta ?= "2bc19ce252b1ce753056b32c55f55f515698b42a"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -28,7 +28,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.0.13"
+LINUX_VERSION ?= "5.0.17"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.7.4


