Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 450927E50D
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:10 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id f97so2632715plb.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RNuH33QbVCd8iK/Pl85edWdBmBE8UsNOD3M4qXEOiWE=;
	b=e9puLEEF4lw4RB8ZGIAxWXoxJSAAolNu3Y3vj4OtheJ2ZEs8oHetHLfbM6u0qMnb+A
	yc7KfsFkRHhEyHD3dlWKP0Ptowcb6fQMUe4M0mu6te2P/DO4gzlcy7lqkkUg4izmyOrQ
	NY5GqmHaMlORhyCgRLuyNwTqq+BuOGXaoyIavIHzNN27lp1/N4D8il/DyUM2dFxnckHN
	bmOyJVf5TbXFPbS5IZeM7FEevwV4Z7aKHNdP329CP+umq8SjBfhGtAtdKEfbOVN5m4I1
	BUKxrJlUCniKjhr0ZJoCTtUKr343Ummv4LH2Dy0JKuV8iA/phoTIH3NK4OTPCgaeoQE+
	32kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RNuH33QbVCd8iK/Pl85edWdBmBE8UsNOD3M4qXEOiWE=;
	b=jOrGzKfRBZERQMjpYYK9jF78ILF8IrCqFo6r+k+VXPpoLfZGD18jkRzfOnoMm8nyBT
	3qM2rhIJhx3gvfrcBKMe5HMUneF7Hv4TGw2ccw77BTWqhqw2EcsS53MQsmacbWKg0tp2
	uvn6LwG1zQEKibOz31UXU2TvbYruXIx1C35R4XT7L8HvQtrklgjMs7962vPN5iM26Xnl
	Wlw4IlCGsc+uYLXnRJeAkiAKimdzeNdJ19ffB2KK8w+CvodJk/GUQ2JI1dr+B2oVbkgx
	mb8CKDsoNfJ2GYwqVkqVRguzlhMCR5szDOn45z3AeZDNVIb+IjEhwW07t/nY9iBUMcKz
	py2g==
X-Gm-Message-State: APjAAAWKPZOpI3UqZuub5NW2gOvmXic2XW5aTN3eJyyST0mfLWAx3suE
	SkMI1tZb9OdGs0jFekbypfFqsY7r
X-Google-Smtp-Source: APXvYqzDBQz0JChEjBbsIoPFuKip1kon8G8sICHW7L5aV4GFsElK+u1GDYNJ0E4r6HljuvOQmr5hfQ==
X-Received: by 2002:a17:902:a5c5:: with SMTP id
	t5mr67213839plq.288.1560092050725; 
	Sun, 09 Jun 2019 07:54:10 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:10 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:40 -0700
Message-Id: <0fc8464f5df989659b457cea56cdd969f3f4ea7e.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 05/27] linux-yocto/4.19: update to v4.19.44
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:10 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the korg -stable updates that comprise the following
commits:

   dafc674bbcb1 Linux 4.19.44
   9fa23ea14e8f PCI: hv: Add pci_destroy_slot() in pci_devices_present_work(), if necessary
   76888d135c4e PCI: hv: Add hv_pci_remove_slots() when we unload the driver
   a47e0054253f PCI: hv: Fix a memory leak in hv_eject_device_work()
   4179b8580219 powerpc/booke64: set RI in default MSR
   71b20cdb4353 powerpc/powernv/idle: Restore IAMR after idle
   69c2b71cb0c1 powerpc/book3s/64: check for NULL pointer in pgd_alloc()
   e9ec5073c90d drivers/virt/fsl_hypervisor.c: prevent integer overflow in ioctl
   ee3b53d89967 drivers/virt/fsl_hypervisor.c: dereferencing error pointers in ioctl
   afa485dc6f17 tipc: fix hanging clients using poll with EPOLLOUT flag
   98652e0b0a1b isdn: bas_gigaset: use usb_fill_int_urb() properly
   17d8a9ebaa99 tuntap: synchronize through tfiles array instead of tun->numqueues
   9c79732f98a8 tuntap: fix dividing by zero in ebpf queue selection
   737713e6d835 vrf: sit mtu should not be updated when vrf netdev is the link
   e38406070729 vlan: disable SIOCSHWTSTAMP in container
   dfdfad3d188f selinux: do not report error on connect(AF_UNSPEC)
   9f51d6f72063 packet: Fix error path in packet_init
   2e95eb9c92f7 net: ucc_geth - fix Oops when changing number of buffers in the ring
   210057b79e71 net: seeq: fix crash caused by not set dev.parent
   dfd919285f27 net: macb: Change interrupt and napi enable order in open
   68df8383f3ca net: ethernet: stmmac: dwmac-sun8i: enable support of unicast filtering
   9284895b7ee6 net: dsa: Fix error cleanup path in dsa_init_module
   da2e770f0c4a ipv4: Fix raw socket lookup for local traffic
   947fec630c41 fib_rules: return 0 directly if an exactly same rule exists when NLM_F_EXCL not supplied
   c7b5e55be825 dpaa_eth: fix SG frame cleanup
   a79feef32392 bridge: Fix error path for kobject_init_and_add()
   9c2cda31196a bonding: fix arp_validate toggling in active-backup mode
   0dc9ad4e904d powerpc/64s: Include cpu header
   db1b4aa651df um: Don't hardcode path as it is architecture dependent
   85f347944a6b Don't jump to compute_result state from check_result state
   ace28a8efdd4 rtlwifi: rtl8723ae: Fix missing break in switch statement
   d756d1dea670 mwl8k: Fix rate_idx underflow
   c300c98a94b4 cw1200: fix missing unlock on error in cw1200_hw_scan()
   575260507647 x86/kprobes: Avoid kretprobe recursion bug
   322a57551d06 nfc: nci: Potential off by one in ->pipes[] array
   f5e60565e6bd NFC: nci: Add some bounds checking in nci_hci_cmd_received()
   21e9515b7d16 net: strparser: partially revert "strparser: Call skb_unclone conditionally"
   85b9e8694f9c net/tls: fix the IV leaks
   e38c6748d1cc mlxsw: core: Do not use WQ_MEM_RECLAIM for mlxsw workqueue
   835ae6cc28d9 mlxsw: core: Do not use WQ_MEM_RECLAIM for mlxsw ordered workqueue
   880a328e197b mlxsw: core: Do not use WQ_MEM_RECLAIM for EMAD workqueue
   a80f62f781c2 mlxsw: spectrum_switchdev: Add MDB entries in prepare phase
   fb7c783b3139 net: fec: manage ahb clock in runtime pm
   c18731c2786c netfilter: nf_tables: add missing ->release_ops() in error path of newrule()
   5014aa937422 netfilter: nf_tables: use-after-free in dynamic operations
   9965da064e9a usb: typec: Fix unchecked return value
   68321994225d mm/memory.c: fix modifying of page protection by insert_pfn()
   bc3361461fcb net: dsa: mv88e6xxx: fix few issues in mv88e6390x_port_set_cmode
   19f4f94fdb2a powerpc/smp: Fix NMI IPI xmon timeout
   f8bd34d1d399 powerpc/smp: Fix NMI IPI timeout
   6a60fb62c82a mm/memory_hotplug.c: drop memory device reference after find_memory_block()
   fb67c97c4e2f RDMA/hns: Bugfix for mapping user db
   afc7cebbbb5e Input: synaptics-rmi4 - fix possible double free
   f621bc1bd7f4 drm/sun4i: Unbind components before releasing DRM and memory
   21b71e191bd8 spi: ST ST95HF NFC: declare missing of table
   09185e359827 spi: Micrel eth switch: declare missing of table
   3835cb5a911f ARM: 8856/1: NOMMU: Fix CCR register faulty initialization when MPU is disabled
   521ae4da71cc drm/imx: don't skip DP channel disable for background plane
   df3a97d197a3 gpu: ipu-v3: dp: fix CSC handling
   3a53fa469d60 netfilter: fix nf_l4proto_log_invalid to log invalid packets
   5bc3d4491821 selftests/net: correct the return value for run_netsocktests
   24b1c849ce9d drm/sun4i: Fix component unbinding and component master deletion
   1973df1ec5bc drm/sun4i: Set device driver data at bind time for use in unbind
   005325b7f026 s390: ctcm: fix ctcm_new_device error return code
   ca8648816e3d MIPS: perf: ath79: Fix perfcount IRQ assignment
   743a5a951d4d netfilter: nf_tables: prevent shift wrap in nft_chain_parse_hook()
   7b115755fb9d netfilter: ctnetlink: don't use conntrack/expect object addresses as id
   4e1994ef6365 ipvs: do not schedule icmp errors from tunnels
   cb9a11d017c6 selftests: netfilter: check icmp pkttoobig errors are set as related
   74e9b761fba0 init: initialize jump labels before command line option parsing
   6536de8232c8 mm: fix inactive list balancing between NUMA nodes and cgroups
   1134736869ef scsi: aic7xxx: fix EISA support
   ba87f547b0f7 ocelot: Don't sleep in atomic context (irqs_disabled())
   9e4fd5e0b81a ipmi: ipmi_si_hardcode.c: init si_type array to fix a crash
   7d4d8683e925 tools lib traceevent: Fix missing equality check for strcmp
   0c8afd514df0 KVM: x86: avoid misreporting level-triggered irqs as edge-triggered in tracing
   d39f3cc71382 KVM: fix spectrev1 gadgets
   4074bc379b1f x86/reboot, efi: Use EFI reboot for Acer TravelMate X514-51T
   3b51d71365e0 x86/build/lto: Fix truncated .bss with -fdata-sections
   8eb64692d6e2 s390/pkey: add one more argument space for debug feature entry
   e360515f41fc drm/amd/display: If one stream full updates, full update all planes
   58be7c109cea afs: Unlock pages for __pagevec_release()
   08f2c299b38c qede: fix write to free'd pointer error and double free of ptp
   090b74020014 vxge: fix return of a free'd memblock on a failed dma mapping
   f83beff28048 mISDN: Check address length before reading address family
   e4525c9d9ada selftests: fib_tests: Fix 'Command line is not complete' errors
   7828986b84ba clocksource/drivers/oxnas: Fix OX820 compatible
   6a414ef36840 clocksource/drivers/npcm: select TIMER_OF
   068d1cce7801 drm/amd/display: extending AUX SW Timeout
   2773e7454f4f s390/3270: fix lockdep false positive on view->lock
   4c8c9d514917 libnvdimm/pmem: fix a possible OOB access when read and write pmem
   f2565d0e5277 nl80211: Add NL80211_FLAG_CLEAR_SKB flag for other NL commands
   1d918120e37d mac80211: fix memory accounting with A-MSDU aggregation
   9d4da01f7d66 cfg80211: Handle WMM rules in regulatory domain intersection
   35e2abbaffa2 mac80211: Increase MAX_MSG_LEN
   bbe1ab38e1a2 mac80211: fix unaligned access in mesh table hash function
   e28e5055eacd s390/dasd: Fix capacity calculation for large volumes
   af5b7a150ef8 libnvdimm/btt: Fix a kmemdup failure check
   f7ab4818f74e HID: input: add mapping for "Toggle Display" key
   bbdccc170adf HID: input: add mapping for keyboard Brightness Up/Down/Toggle keys
   dc30867da997 HID: input: add mapping for Expose/Overview key
   e94f852e2034 libnvdimm/namespace: Fix a potential NULL pointer dereference
   5f72e3a021a6 acpi/nfit: Always dump _DSM output payload
   f07db1f1f54c iio: adc: xilinx: prevent touching unclocked h/w on remove
   6400212ae3b6 iio: adc: xilinx: fix potential use-after-free on probe
   06d5ea398e55 iio: adc: xilinx: fix potential use-after-free on remove
   5640d0781267 USB: serial: fix unthrottle races
   4c416eef65a7 virt: vbox: Sanity-check parameter types for hgcm-calls coming from userspace
   e361ccccdd51 kernfs: fix barrier usage in __kernfs_new_node()
   f1917f21c8f6 hwmon: (pwm-fan) Disable PWM if fetching cooling data fails
   87cc345aefc9 platform/x86: dell-laptop: fix rfkill functionality
   381eaca5017f platform/x86: thinkpad_acpi: Disable Bluetooth for some machines
   efe6802e812b platform/x86: sony-laptop: Fix unintentional fall-through
   824c212908b6 bfq: update internal depth state when queue depth changes
   3351e9d39947 Linux 4.19.43
   b21bde49d386 x86/speculation/mds: Fix documentation typo
   8e65568e9d23 Documentation: Correct the possible MDS sysfs values
   2e4c54890226 x86/mds: Add MDSUM variant to the MDS documentation
   12a0dad799fb x86/speculation/mds: Add 'mitigations=' support for MDS
   59a14fb5832c s390/speculation: Support 'mitigations=' cmdline option
   74857f69fec5 powerpc/speculation: Support 'mitigations=' cmdline option
   af5332dd991e x86/speculation: Support 'mitigations=' cmdline option
   8cb932aca5d6 cpu/speculation: Add 'mitigations=' cmdline option
   7ba793ae7b9f x86/speculation/mds: Print SMT vulnerable on MSBDS with mitigations off
   e9ae32266605 x86/speculation/mds: Fix comment
   b9faa4652867 x86/speculation/mds: Add SMT warning message
   b3a63d9c7453 x86/speculation: Move arch_smt_update() call to after mitigation decisions
   f7a119a762ef x86/speculation/mds: Add mds=full,nosmt cmdline option
   cfaa3d76301e Documentation: Add MDS vulnerability documentation
   e3803099d2f4 Documentation: Move L1TF to separate directory
   c50e81fe8a13 x86/speculation/mds: Add mitigation mode VMWERV
   8230c2028dce x86/speculation/mds: Add sysfs reporting for MDS
   2951067089a3 x86/speculation/mds: Add mitigation control for MDS
   4df98b3f3161 x86/speculation/mds: Conditionally clear CPU buffers on idle entry
   b39dc9a8cced x86/kvm/vmx: Add MDS protection when L1D Flush is not active
   e4fa775b5606 x86/speculation/mds: Clear CPU buffers on exit to user
   1f7c31be1e04 x86/speculation/mds: Add mds_clear_cpu_buffers()
   de89ff6f1674 x86/kvm: Expose X86_FEATURE_MD_CLEAR to guests
   aca9e8d8e2ce x86/speculation/mds: Add BUG_MSBDS_ONLY
   2e9104aa2633 x86/speculation/mds: Add basic bug infrastructure for MDS
   00b76324bd35 x86/speculation: Consolidate CPU whitelists
   e09450ffa980 x86/msr-index: Cleanup bit defines
   ca0056d97840 kvm: x86: Report STIBP on GET_SUPPORTED_CPUID
   1f1bc8222ce7 x86/cpu: Sanitize FAM6_ATOM naming
   34aae15cb179 Documentation/l1tf: Fix small spelling typo
   9c2556f428cf Linux 4.19.42
   9ccdbde1850c arm64: futex: Bound number of LDXR/STXR loops in FUTEX_WAKE_OP
   0f4ef8fb1dae locking/futex: Allow low-level atomic operations to return -EAGAIN
   6fee39874d1f ASoC: Intel: avoid Oops if DMA setup fails
   c3b3955f0250 UAS: fix alignment of scatter/gather segments
   38f092c41ceb Bluetooth: Align minimum encryption key size for LE and BR/EDR connections
   c6d1f9b4b2cb Bluetooth: hidp: fix buffer overflow
   de7fe08b92dc scsi: qla2xxx: Fix device staying in blocked state
   ef7014d76361 scsi: qla2xxx: Fix incorrect region-size setting in optrom SYSFS routines
   7a793ca17357 scsi: lpfc: change snprintf to scnprintf for possible overflow
   8b330b3efa91 soc: sunxi: Fix missing dependency on REGMAP_MMIO
   557be5771563 cpufreq: armada-37xx: fix frequency calculation for opp
   6b7daf1ff8bf intel_th: pci: Add Comet Lake support
   5b2ba94386eb usb-storage: Set virt_boundary_mask to avoid SG overflows
   18e6f3027642 USB: cdc-acm: fix unthrottle races
   bce2b9d63786 USB: serial: f81232: fix interrupt worker not stop
   caa5680dc05a usb: dwc3: Fix default lpm_nyet_threshold value
   33f2aa87c294 genirq: Prevent use-after-free and work list corruption
   29184cbaaec0 iommu/amd: Set exclusion range correctly
   42638d6aae06 perf/core: Fix perf_event_disable_inatomic() race
   c1189d68be7d platform/x86: pmc_atom: Drop __initconst on dmi table
   777943cd6c5f nvme-fc: correct csn initialization and increments on error
   0e8e67b8147f virtio-blk: limit number of hw queues by nr_cpu_ids
   d955bb0b3189 ASoC: Intel: kbl: fix wrong number of channels
   e5c749ad6d7f drm/mediatek: fix possible object reference leak
   8f4dbd17777f scsi: csiostor: fix missing data copy in csio_scsi_err_handler()
   fb357b9eb47d RDMA/hns: Fix bug that caused srq creation to fail
   8dfb2896d8c7 RDMA/vmw_pvrdma: Fix memory leak on pvrdma_pci_remove
   5984fd687600 virtio_pci: fix a NULL pointer reference in vp_del_vqs
   a8f5c1bceb25 drm/sun4i: tcon top: Fix NULL/invalid pointer dereference in sun8i_tcon_top_un/bind
   78bc98235e84 slab: fix a crash by reading /proc/slab_allocators
   cf6cb79d57b0 objtool: Add rewind_stack_do_exit() to the noreturn list
   e66e72710962 ASoC: cs35l35: Disable regulators on driver removal
   dd015a3b072a drm/amd/display: fix cursor black issue
   88294658ddbe ASoC: rockchip: pdm: fix regmap_ops hang issue
   95587274e9d5 linux/kernel.h: Use parentheses around argument in u64_to_user_ptr()
   7d10436ca569 perf/x86/intel: Initialize TFA MSR
   2b791e8ee7b2 perf/x86/intel: Fix handling of wakeup_events for multi-entry PEBS
   929d019d6d44 drm/mediatek: Fix an error code in mtk_hdmi_dt_parse_pdata()
   0fb785e28833 ASoC: tlv320aic32x4: Fix Common Pins
   e6efcbf3cbce MIPS: KGDB: fix kgdb support for SMP platforms.
   09c6954e83e8 IB/hfi1: Fix the allocation of RSM table
   3abd4aef917f IB/hfi1: Eliminate opcode tests on mr deref
   1ed91af83a45 drm/omap: hdmi4_cec: Fix CEC clock handling for PM
   d356db088333 ASoC: dapm: Fix NULL pointer dereference in snd_soc_dapm_free_kcontrol
   6f69661f6ebe ASoC: cs4270: Set auto-increment bit for register writes
   8f5077ceee5f ASoC: stm32: dfsdm: fix debugfs warnings on entry creation
   33ffe0807d52 ASoC: stm32: dfsdm: manage multiple prepare
   74f5898f660d clk: meson-gxbb: round the vdec dividers to closest
   8aa62dc731e5 ASoC: wm_adsp: Add locking to wm_adsp2_bus_error
   2ece73fe079b ASoC: rt5682: recording has no sound after booting
   afcbb3c755c9 ASoC: samsung: odroid: Fix clock configuration for 44100 sample rate
   7525d6104ca4 ASoC: nau8810: fix the issue of widget with prefixed name
   c2119de4ed41 ASoC: nau8824: fix the issue of the widget with prefix name
   29f1b9761520 ASoC:intel:skl:fix a simultaneous playback & capture issue on hda platform
   581a8bd9fa8b ASoC:soc-pcm:fix a codec fixup issue in TDM case
   c37f7344075a ASoC: stm32: sai: fix exposed capabilities in spdif mode
   2aeceaaff09b ASoC: stm32: sai: fix iec958 controls indexation
   6544b4966193 ASoC: hdmi-codec: fix S/PDIF DAI
   98a80393b82a ASoC: tlv320aic3x: fix reset gpio reference counting
   34ae4c6a3609 staging: most: cdev: fix chrdev_region leak in mod_exit
   2197e11bb624 staging: greybus: power_supply: fix prop-descriptor request size
   35d2c86db2d4 ubsan: Fix nasty -Wbuiltin-declaration-mismatch GCC-9 warnings
   eb7b8d1afb92 Drivers: hv: vmbus: Remove the undesired put_cpu_ptr() in hv_synic_cleanup()
   0f18e433b97b scsi: libsas: fix a race condition when smp task timeout
   e629cabe34ed net: stmmac: Use bfsize1 in ndesc_init_rx_desc
   21de7eb67cff Linux 4.19.41
   e7c2d066566b mm/kmemleak.c: fix unused-function warning
   5b94768bd07c ASoC: wm_adsp: Check for buffer in trigger stop
   c5c74e63985f media: v4l2: i2c: ov7670: Fix PLL bypass register values
   5f18c95d2964 i2c: i2c-stm32f7: Fix SDADEL minimum formula
   7a32cbf1720b x86/mm/tlb: Revert "x86/mm: Align TLB invalidation info"
   c48b027f2aa3 x86/mm: Fix a crash with kmemleak_scan()
   052c78f5cfe2 x86/mm/KASLR: Fix the size of the direct mapping section
   d572a3a03f63 clk: x86: Add system specific quirk to mark clocks as critical
   61ff44069f5b x86/mce: Improve error message when kernel cannot recover, p2
   c7e220eff874 powerpc/mm/hash: Handle mmap_min_addr correctly in get_unmapped_area topdown search
   a78c3898de59 mac80211: Honor SW_CRYPTO_CONTROL for unicast keys in AP VLAN mode
   574be221407e selinux: never allow relabeling on context mounts
   6b13ae52ac75 selinux: avoid silent denials in permissive mode under RCU walk
   53ffa56456fb gpio: mxc: add check to return defer probe if clock tree NOT ready
   a10c88bf365a Input: stmfts - acknowledge that setting brightness is a blocking call
   a99b9c82bde6 Input: snvs_pwrkey - initialize necessary driver data before enabling IRQ
   8d5c1c039708 IB/core: Destroy QP if XRC QP fails
   841487432d11 IB/core: Fix potential memory leak while creating MAD agents
   dabcbe58d8bc IB/core: Unregister notifier before freeing MAD security
   d1698f74bdbd platform/x86: intel_pmc_core: Handle CFL regmap properly
   51e777c795ce platform/x86: intel_pmc_core: Fix PCH IP name
   d4f1e3ef9586 ASoC: stm32: fix sai driver name initialisation
   7d3f7107079b ASoC: wm_adsp: Correct handling of compressed streams that restart
   3b958d5e6972 ASoC: Intel: bytcr_rt5651: Revert "Fix DMIC map headsetmic mapping"
   9d696f405e6d scsi: RDMA/srpt: Fix a credit leak for aborted commands
   f16e83170e25 staging: iio: adt7316: fix the dac write calculation
   ad774285beee staging: iio: adt7316: fix the dac read calculation
   7041e3d6b81f staging: iio: adt7316: allow adt751x to use internal vref for all dacs
   2ccaef716388 clk: qcom: Add missing freq for usb30_master_clk on 8998
   8897bf03ec30 Bluetooth: mediatek: fix up an error path to restore bdev->tx_state
   f5ad05e680aa Bluetooth: btusb: request wake pin with NOAUTOEN
   3f8497cfff3b perf/x86/amd: Update generic hardware cache events for Family 17h
   96e4471d3881 block: pass no-op callback to INIT_WORK().
   14f3c36b47ed ARM: iop: don't use using 64-bit DMA masks
   39839f3ec616 ARM: orion: don't use using 64-bit DMA masks
   04b4d5f75ab0 fs: stream_open - opener for stream-like files so that read and write can run simultaneously without deadlock
   a82cfd770651 xsysace: Fix error handling in ace_setup
   54ad0956ef93 sh: fix multiple function definition build errors
   b51fdcbe45d1 hugetlbfs: fix memory leak for resv_map
   6a62bbe82343 kmemleak: powerpc: skip scanning holes in the .bss section
   82e8da1f1a91 KVM: SVM: prevent DBG_DECRYPT and DBG_ENCRYPT overflow
   57186663b3a1 libcxgb: fix incorrect ppmax calculation
   5c5e9f23df7a net: hns: Fix WARNING when remove HNS driver with SMMU enabled
   c9f431017617 net: hns: fix ICMP6 neighbor solicitation messages discard problem
   1ff38d33d7c4 net: hns: Fix probabilistic memory overwrite when HNS driver initialized
   7713ee691767 net: hns: Use NAPI_POLL_WEIGHT for hns driver
   7e7befd8dee2 net: hns: fix KASAN: use-after-free in hns_nic_net_xmit_hw()
   98d6651f1878 arm64: fix wrong check of on_sdei_stack in nmi context
   69da58b7386c arm/mach-at91/pm : fix possible object reference leak
   8052c066e6d0 scsi: storvsc: Fix calculation of sub-channel count
   03260f46f2d1 scsi: core: add new RDAC LENOVO/DE_Series device
   4d043d3d2be1 vfio/pci: use correct format characters
   7ce0b428c046 HID: input: add mapping for Assistant key
   ce9e2dc03f63 rtc: da9063: set uie_unsupported when relevant
   e5be04ee1766 block: use blk_free_flush_queue() to free hctx->fq in blk_mq_init_hctx
   177edf25706a mfd: twl-core: Disable IRQ while suspended
   f0112b649525 debugfs: fix use-after-free on symlink traversal
   e22c11da0a86 jffs2: fix use-after-free on symlink traversal
   7cce2543cbcd net: stmmac: don't log oversized frames
   f86c1d3f10a2 net: stmmac: fix dropping of multi-descriptor RX frames
   0ab012e3df48 net: stmmac: don't overwrite discard_frame status
   2170bbf19f6e net: stmmac: don't stop NAPI processing when dropping a packet
   cd50daabf5ee net: stmmac: ratelimit RX error logs
   c13a936f46e3 net: stmmac: use correct DMA buffer size in the RX descriptor
   824451fdcfc2 bonding: show full hw address in sysfs for slave entries
   f91bb70a3616 net/mlx5: E-Switch, Fix esw manager vport indication for more vport commands
   7e0548e111e5 net: hns3: fix compile error
   6869dd570f10 HID: quirks: Fix keyboard + touchpad on Lenovo Miix 630
   bc031095828b riscv: fix accessing 8-byte variable from RV32
   0424b0b35793 igb: Fix WARN_ONCE on runtime suspend
   cc04b5b3314a reset: meson-audio-arb: Fix missing .owner setting of reset_controller_dev
   ef9533481c11 ARM: dts: rockchip: Fix gpu opp node names for rk3288
   894b4fc04387 batman-adv: fix warning in function batadv_v_elp_get_throughput
   7afe374cc718 batman-adv: Reduce tt_global hash refcnt only for removed entry
   6957021da735 batman-adv: Reduce tt_local hash refcnt only for removed entry
   be807f9b4fc4 batman-adv: Reduce claim hash refcnt only for removed entry
   8a734e251c0c rtc: sh: Fix invalid alarm warning for non-enabled alarm
   5b5c653ddf91 rtc: cros-ec: Fail suspend/resume if wake IRQ can't be configured
   2f4052ffd9be HID: debug: fix race condition with between rdesc_show() and device removal
   61effc648fe4 HID: logitech: check the return value of create_singlethread_workqueue
   dbfef4bd8836 arm64: dts: rockchip: fix rk3328-roc-cc gmac2io tx/rx_delay
   3e6b472f474a efi: Fix debugobjects warning on 'efi_rts_work'
   30673786f906 nvme-loop: init nvmet_ctrl fatal_err_work when allocate
   83c6688d679c USB: core: Fix bug caused by duplicate interface PM usage counter
   7b73c2a056b3 USB: core: Fix unterminated string returned by usb_string()
   7df0d2c7d092 usb: usbip: fix isoc packet num validation in get_pipe
   512ce15023a8 USB: dummy-hcd: Fix failure to give back unlinked URBs
   508954883054 USB: w1 ds2490: Fix bug caused by improper use of altsetting array
   9f632afe4f39 USB: yurex: Fix protection fault after device removal
   f02c6460a5b6 ALSA: hda/realtek - Apply the fixup for ASUS Q325UAR
   347411f9aded ALSA: hda/realtek - Fixed Dell AIO speaker noise
   f937634b6626 ALSA: hda/realtek - Add new Dell platform for headset mode
   b19c230648b5 i2c: Prevent runtime suspend of adapter when Host Notify is required
   04e07919f7da i2c: Allow recovery of the initial IRQ by an I2C client device.
   1e031ab31843 i2c: Clear client->irq in i2c_device_remove
   63eab25ed1cc i2c: Remove unnecessary call to irq_find_mapping
   e89ba70e10b2 i2c: imx: correct the method of getting private data in notifier_call
   d1493c5cbbad i2c: synquacer: fix enumeration of slave devices
   ec30811209e4 mac80211: don't attempt to rename ERR_PTR() debugfs dirs
   be7df63d3680 mwifiex: Make resume actually do something useful again on SDIO cards
   81a7534f9ef4 iwlwifi: fix driver operation for 5350

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 20 ++++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index dbcafcb..ef1d2a5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6f1eb46dc80d3f2639a88f188814dff33bad5816"
-SRCREV_meta ?= "6fface2df8bc35e72aaf3d79352413fd84175879"
+SRCREV_machine ?= "4dbcaca4c9ff89e866d2b5d01df005f317c618a4"
+SRCREV_meta ?= "6e8033d26894b07e17c48abb5951cc3d4dd9b2a9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.19.40"
+LINUX_VERSION ?= "4.19.44"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index e8f6618..22aac72 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.19.40"
+LINUX_VERSION ?= "4.19.44"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ef6efa945df9868dc9a0f7db3020a8a731567cd9"
-SRCREV_machine ?= "91f882dd7e774154eecc333db321f4e5e97bd144"
-SRCREV_meta ?= "6fface2df8bc35e72aaf3d79352413fd84175879"
+SRCREV_machine_qemuarm ?= "a3cd9d732b27e78f94634924b7232b6280dae002"
+SRCREV_machine ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
+SRCREV_meta ?= "6e8033d26894b07e17c48abb5951cc3d4dd9b2a9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 10db960..c6f5f0f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -11,22 +11,22 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
 KBRANCH_qemux86-64 ?= "v4.19/standard/base"
 KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0b50626d5ad94c4df20132c5c6064a7196220740"
-SRCREV_machine_qemuarm64 ?= "91f882dd7e774154eecc333db321f4e5e97bd144"
-SRCREV_machine_qemumips ?= "db8e2bdaa546eb0c36752f235bad2133a9421564"
-SRCREV_machine_qemuppc ?= "91f882dd7e774154eecc333db321f4e5e97bd144"
-SRCREV_machine_qemux86 ?= "91f882dd7e774154eecc333db321f4e5e97bd144"
-SRCREV_machine_qemux86-64 ?= "91f882dd7e774154eecc333db321f4e5e97bd144"
-SRCREV_machine_qemumips64 ?= "392200ca22945e3f7bb8ad794607cdfa70f5ec76"
-SRCREV_machine ?= "91f882dd7e774154eecc333db321f4e5e97bd144"
-SRCREV_meta ?= "6fface2df8bc35e72aaf3d79352413fd84175879"
+SRCREV_machine_qemuarm ?= "c12bc1a098be009c44582e75af630ff573155473"
+SRCREV_machine_qemuarm64 ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
+SRCREV_machine_qemumips ?= "18ba7160ac7a094bf9659649c537303201eb022e"
+SRCREV_machine_qemuppc ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
+SRCREV_machine_qemux86 ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
+SRCREV_machine_qemux86-64 ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
+SRCREV_machine_qemumips64 ?= "d9c77fe2a6038848fbadd660882b78e590c3252e"
+SRCREV_machine ?= "f0c6c85e155632580bd44a5db01cbb19dcc1559c"
+SRCREV_meta ?= "6e8033d26894b07e17c48abb5951cc3d4dd9b2a9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
           "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.19.40"
+LINUX_VERSION ?= "4.19.44"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.7.4


