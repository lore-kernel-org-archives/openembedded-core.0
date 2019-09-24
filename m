Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id EEC787DEC6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 22:01:00 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id q10so8365240iop.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2019 15:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hYv5ONVNEGKCcYJRro9M9G/rLvrYrv88ERIV2Zgictk=;
	b=oNlSpL/RjbkGhdMVx300pWb13JfUkkfA5+EAP9pCSX2/iHDq+7hlaLnb9+XvhmOCA7
	KNhN//6zz7OlaKCHm/odOYGB+BulKAt0ooe/p71coxgmwplVgT30NTi0BowDso/d7Lo8
	DJKBZ22aX4W5W9zRVTX//r4Y/2AVsgu3qJQIZ3v+L2hgcbOn3wdTETr8ZO2/N2IByVM5
	QCS1uHfBVcVdsYPu76hZbSU9SYGLcvYP3kfWAdl/XPLYlARDOInYcm+aTzDVuqn14lNI
	Wq5GOIDVzxvUm+ASLHg63B/qkT5sShGFZWVFh6noUV4fW8vCBZ+Ab5Q1YFecckVKLJKY
	qwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hYv5ONVNEGKCcYJRro9M9G/rLvrYrv88ERIV2Zgictk=;
	b=Row3hEQNdDk0Kn6KnfQbeMvLJdIseT/06TUQpIjRqC5iK0/DpJqONMv1Ys43Dxoz+U
	HSa241c9U4qk1HGxWUX90pm889LF2FB7QvclDCmo7hyigI9c5f4Ux+u3GVZQXjW/0jHS
	f7wXB2MCLqrOsYXvpYS7kC7kpurNvQEBliddC1YH5Ki0E9Tr+eCyZc/S2Eh8iEebiTw5
	apIGbv1NQMhHtRbGjA4H2yt9xlOISA35tBc/tVDpMaHB8cdSnUAlZ7w2i1BIvWXCFmvg
	uXVG003nVDn/y2UW5zvx0KPFF1Q/bpi0P/wIyB0Vhb4suIy75onYT+nWBgGuhr5j6fkr
	26Nw==
X-Gm-Message-State: APjAAAUuy7jEmZrSzZ0dpPUPMTdl/1keRT7+674HdWv7ikG0BRvIuYG6
	pAPcpsvWPD1FVN0GlCh+9Xm96seV8oKxQQ==
X-Google-Smtp-Source: APXvYqwiewTkTID+8eodHxJGJEh96jJZVx8ohji87yGXo/BeEg/i7QBVVT1Ua7f2VpBblkRApupnOw==
X-Received: by 2002:a6b:c302:: with SMTP id t2mr5705070iof.217.1569362461531; 
	Tue, 24 Sep 2019 15:01:01 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	x12sm3040895ioh.76.2019.09.24.15.01.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 15:01:00 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue, 24 Sep 2019 18:00:54 -0400
Message-Id: <cc94023974309379fc2d581f959970489db33b7f.1569362299.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1569362299.git.bruce.ashfield@gmail.com>
References: <cover.1569362299.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/5.2: update to v5.2.13
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
X-List-Received-Date: Tue, 24 Sep 2019 22:01:01 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the korg -stable updates that comprise the following
commits:

   218ca2e5affe Linux 5.2.13
   4c634717d778 Revert "Input: elantech - enable SMBus on new (2018+) systems"
   140839fe4e71 Linux 5.2.12
   5566d1c61b2f Revert "ASoC: Fail card instantiation if DAI format setup fails"
   4d8966020827 hsr: switch ->dellink() to ->ndo_uninit()
   072c9337f3a0 hsr: fix a NULL pointer deref in hsr_dev_xmit()
   08523d5a2f4a hsr: implement dellink to clean up resources
   a282179be747 bpf: fix use after free in prog symbol exposure
   0d5014b80e5c x86/ptrace: fix up botched merge of spectrev1 fix
   3af8db6a99f6 drm/i915/dp: Fix DSC enable code to use cpu_transcoder instead of encoder->type
   b6980646c9ab drm/i915: Do not create a new max_bpc prop for MST connectors
   79d5d7317ce3 iwlwifi: pcie: handle switching killer Qu B0 NICs to C0
   3146a6de3d58 iwlwifi: pcie: don't switch FW to qnj when ax201 is detected
   9e7e685012f2 iwlwifi: pcie: add support for qu c-step devices
   c013312ef7a8 iwlwifi: change 0x02F0 fw from qu to quz
   feee62efa7ad iwlwifi: add new cards for 9000 and 20000 series
   0fdbd727e12a iwlwifi: add new cards for 22000 and change wrong structs
   805363e2dfa5 iwlwifi: add new cards for 22000 and fix struct name
   e27fc3445751 mmc: sdhci-sprd: add get_ro hook function
   9ad0348f708d mmc: sdhci-sprd: Implement the get_max_timeout_count() interface
   d100666e3cfc mmc: sdhci-sprd: clear the UHS-I modes read from registers
   b018fcb92250 mac80211: Correctly set noencrypt for PAE frames
   08392de0ccc7 mac80211: Don't memset RXCB prior to PAE intercept
   4e118994cea8 cfg80211: Fix Extended Key ID key install checks
   b14f5ba7490e mac80211: fix possible sta leak
   3cd42050aac6 Revert "cfg80211: fix processing world regdomain when non modular"
   b6a0d1f9bf08 mm: memcontrol: fix percpu vmstats and vmevents flush
   bba5bcb0cc0e mm, memcg: partially revert "mm/memcontrol.c: keep local VM counters in sync with the hierarchical ones"
   8706ffe20444 mms: sdhci-sprd: add SDHCI_QUIRK_BROKEN_CARD_DETECTION
   d7c7531ac9a3 mt76: mt76x0u: do not reset radio on resume
   839e96131567 SUNRPC: Don't handle errors if the bind/connect succeeded
   90ff6dd4ced6 crypto: ccp - Ignore unconfigured CCP device on suspend/resume
   3c3c233738df VMCI: Release resource if the work is already queued
   6992ae83866a bus: hisi_lpc: Add .remove method to avoid driver unbind crash
   0a6caa4e3f21 bus: hisi_lpc: Unregister logical PIO range to avoid potential use-after-free
   3e3bf9dfdaf4 i2c: piix4: Fix port selection for AMD Family 16h Model 30h
   712029329a58 drm/i915: Call dma_set_max_seg_size() in i915_driver_hw_probe()
   0573f44d42b1 drm/i915: Don't deballoon unused ggtt drm_mm_node in linux guest
   f78e0d8172f3 drm/amdgpu: fix GFXOFF on Picasso and Raven2
   4c7ee7bd4f7e drm/amdgpu: Add APTX quirk for Dell Latitude 5495
   71817079db2f lib: logic_pio: Add logic_pio_unregister_range()
   0a6e75686543 lib: logic_pio: Avoid possible overlap for unregistering regions
   94cfb33438e0 lib: logic_pio: Fix RCU usage
   e0e3650991cd Revert "NFSv4/flexfiles: Abort I/O early if the layout segment was invalidated"
   666a848c6797 NFS: Ensure O_DIRECT reports an error if the bytes read/written is 0
   3fd824dc16de NFSv4/pnfs: Fix a page lock leak in nfs_pageio_resend()
   d3a2180a5720 lkdtm/bugs: fix build error in lkdtm_EXHAUST_STACK
   61c6f2b0000a fsi: scom: Don't abort operations for minor errors
   d886915cd91b typec: tcpm: fix a typo in the comparison of pdo_max_voltage
   82b520267b49 intel_th: pci: Add Tiger Lake support
   1c01033684f3 intel_th: pci: Add support for another Lewisburg PCH
   d36c706f854c stm class: Fix a double free of stm_source_device
   ba3e88a664c8 mmc: sdhci-sprd: add SDHCI_QUIRK2_PRESET_VALUE_BROKEN
   77162751167c mmc: sdhci-sprd: fixed incorrect clock divider
   a94076eed72e mmc: core: Fix init of SD cards reporting an invalid VDD range
   b8dd05ea2e74 mmc: sdhci-cadence: enable v4_mode to fix ADMA 64-bit addressing
   096179da39b6 mmc: sdhci-of-at91: add quirk for broken HS200
   cb82fa2d124a Revert "mmc: sdhci-tegra: drop ->get_ro() implementation"
   31f4eb72692c mei: me: add Tiger Lake point LP device ID
   871c867ac423 KVM: arm/arm64: vgic-v2: Handle SGI bits in GICD_I{S,C}PENDR0 as WI
   ea93e118ef2e KVM: arm/arm64: vgic: Fix potential deadlock when ap_list is long
   d69ebe85e169 KVM: PPC: Book3S: Fix incorrect guest-to-user-translation error handling
   3698cd854f43 tools/power turbostat: Fix caller parameter of get_tdp_amd()
   2d26f7f401e7 USB: storage: ums-realtek: Whitelist auto-delink support
   35f1b0a62c36 USB: storage: ums-realtek: Update module parameter description for auto_delink_en
   960ff077477e usb: host: xhci: rcar: Fix typo in compatible string matching
   6ca46f45c208 usb: host: ohci: fix a race condition between shutdown and irq
   73830b83ece9 usb: chipidea: udc: don't do hardware access if gadget has stopped
   0aa1e87affce usb: hcd: use managed device resources
   c07f658df19f USB: cdc-wdm: fix race between write and disconnect due to flag abuse
   43d94dafbcdd usb-storage: Add new JMS567 revision to unusual_devs
   7300afed0334 usbtmc: more sanity checking for packet size
   e56b7b3b9256 ftrace: Check for empty hash and comment the race with registering probes
   d784aa1a0f13 ftrace: Check for successful allocation of hash
   cd419e7c03e9 ftrace: Fix NULL pointer dereference in t_probe_next()
   6c781717c5cc HID: logitech-hidpp: remove support for the G700 over USB
   602038487748 x86/apic: Include the LDR when clearing out APIC registers
   edacccb34680 x86/apic: Do not initialize LDR and DFR for bigsmp
   af65ce08ec91 x86/mm/cpa: Prevent large page split when ftrace flips RW on kernel text
   861e386d11b5 uprobes/x86: Fix detection of 32-bit user mode
   4479763b8436 KVM: x86: Don't update RIP or do single-step on faulting emulation
   4344cb8cf72d KVM: x86: hyper-v: don't crash on KVM_GET_SUPPORTED_HV_CPUID when kvm_intel.nested is disabled
   7d01c081e861 kvm: x86: skip populating logical dest map if apic is not sw enabled
   e824fe6a6750 ALSA: usb-audio: Add implicit fb quirk for Behringer UFX1604
   4f3c293ccffe ALSA: usb-audio: Fix invalid NULL check in snd_emuusb_set_samplerate()
   ee26f3722d2b ALSA: seq: Fix potential concurrent access to the deleted pool
   853ccdea876b ALSA: hda - Fixes inverted Conexant GPIO mic mute led
   441f5ecc1e24 ALSA: line6: Fix memory leak at line6_init_pcm() error path
   6ff7b2c68d22 ALSA: hda/ca0132 - Add new SBZ quirk
   701ff405be9f ALSA: usb-audio: Check mixer unit bitmap yet more strictly
   b4b92e95d9e5 mm/zsmalloc.c: fix build when CONFIG_COMPACTION=n
   2905d7847cd5 xfrm/xfrm_policy: fix dst dev null pointer dereference in collect_md mode
   1c7fbbc0fc3f ipv4/icmp: fix rt dst dev null pointer dereference
   fc90789e580b openvswitch: Fix conntrack cache with timeout
   c1c3307a832a ipv4: mpls: fix mpls_xmit for iptunnel
   ae154dcba8f4 tcp: make sure EPOLLOUT wont be missed
   cbc9336afc74 net/smc: make sure EPOLLOUT is raised
   5b71ce93d7b1 net: fix __ip_mc_inc_group usage
   a6058b22e17e net: cpsw: fix NULL pointer exception in the probe error path
   c5df65fd6f06 ipv6: Fix return value of ipv6_mc_may_pull() for malformed packets
   dc428ae89cd4 ipv6/addrconf: allow adding multicast addr if IFA_F_MCAUTOJOIN is set
   8903c1ed2c14 mt76: usb: fix rx A-MSDU support
   962d7207f53b drm/bridge: tfp410: fix memleak in get_modes()
   d4ccc1744b55 selftests/bpf: install files test_xdp_vlan.sh
   d857dcf1c807 watchdog: bcm2835_wdt: Fix module autoload
   eeb6b4a09695 lcoking/rwsem: Add missing ACQUIRE to read_slowpath sleep loop
   931424d0781e locking/rwsem: Add missing ACQUIRE to read_slowpath exit when queue is empty
   5faa01cc2b1f tools: hv: fix KVP and VSS daemons exit code
   b6018c3a79e5 tools: hv: fixed Python pep8/flake8 warnings for lsvmbus
   c983df11ed19 usb: host: fotg2: restart hcd after port reset
   5a3db3021b17 drm/ast: Fixed reboot test may cause system hanged
   68fc8f1e9103 drm/scheduler: use job count instead of peek
   7046212603e0 i2c: emev2: avoid race when unregistering slave client
   38869e74c3ac i2c: rcar: avoid race when unregistering slave client
   6ad482444c98 riscv: fix flush_tlb_range() end address for flush_tlb_page()
   325fd0056cc0 arm64: cpufeature: Don't treat granule sizes as strict
   2a7a7ff625cd xen/blkback: fix memory leaks
   82fcf8a5d8f7 habanalabs: fix device IRQ unmasking for BE host
   a1a6c6b4f8d8 habanalabs: fix endianness handling for internal QMAN submission
   1900d706b9c4 habanalabs: fix completion queue handling when host is BE
   79e338d70c86 habanalabs: fix endianness handling for packets from user
   0a18515cc03f habanalabs: fix DRAM usage accounting on context tear down
   c041ddb75698 usb: gadget: mass_storage: Fix races between fsg_disable and fsg_set_alt
   3f1b93b5a45c usb: gadget: composite: Clear "suspended" on reset/disconnect
   4ab6b15a00ca dma-direct: don't truncate dma_required_mask to bus addressing capabilities
   583c8d3118e0 iommu/dma: Handle SG length overflow better
   4aab45c37962 omap-dma/omap_vout_vrfb: fix off-by-one fi value
   7ceddea2da13 dmaengine: stm32-mdma: Fix a possible null-pointer dereference in stm32_mdma_irq_handler()
   a4a200842e83 IB/mlx5: Fix implicit MR release flow
   a8bd4c018836 btrfs: trim: Check the range passed into to prevent overflow
   c1b16e1427f4 auxdisplay: panel: need to delete scan_timer when misc_register fails in panel_attach
   ceac72e0a8cc soundwire: cadence_master: fix definitions for INTSTAT0/1
   50b59bb1043b soundwire: cadence_master: fix register definition for SLAVE_STATE
   c88a50ced6de nvme-pci: Fix async probe remove race
   9dd8dc3d8a79 nvme: fix controller removal race with scan work
   be2e81d1d8d4 nvme-rdma: fix possible use-after-free in connect error flow
   f3b4b4440a0c nvme: fix a possible deadlock when passthru commands sent to a multipath device
   d067f76d2009 nvme-core: Fix extra device_put() call on error path
   a7b13f9b376d nvmet-file: fix nvmet_file_flush() always returning an error
   938f8292e9ef nvmet-loop: Flush nvme_delete_wq when removing the port
   19620ce482fc nvmet: Fix use-after-free bug when a port is removed
   a40201a850a8 afs: Fix missing dentry data version updating
   fb64ee182656 afs: Only update d_fsdata if different in afs_d_revalidate()
   b4988bb90114 afs: Fix off-by-one in afs_rename() expected data version calculation
   768edf3604b6 fs: afs: Fix a possible null-pointer dereference in afs_put_read()
   3bde518dd5f1 afs: Fix loop index mixup in afs_deliver_vl_get_entry_by_name_u()
   3e5fa7f20b76 afs: Fix the CB.ProbeUuid service handler to reply correctly
   f902c873cb0f nvme-multipath: revalidate nvme_ns_head gendisk in nvme_validate_ns
   76c2a562a193 dmaengine: ste_dma40: fix unneeded variable warning
   c3915fe1bf12 Linux 5.2.11
   85a55331d9ae rxrpc: Fix local refcounting
   fa321a9ce599 rxrpc: Fix local endpoint replacement
   d2783ccec7e0 rxrpc: Fix read-after-free in rxrpc_queue_local()
   486a72744507 rxrpc: Fix local endpoint refcounting
   3981720f800f powerpc: Allow flush_(inval_)dcache_range to work across ranges >4GB
   28ad328e672b io_uring: add need_resched() check in inner poll loop
   7fe55f17deee io_uring: don't enter poll loop if we have CQEs pending
   2b2c2647a19c io_uring: fix potential hang with polled IO
   2a50be6e0551 dm zoned: fix potential NULL dereference in dmz_do_reclaim()
   b295171cff3f IB/hfi1: Drop stale TID RDMA packets
   be46f90b7436 xfs: fix missing ILOCK unlock when xfs_setattr_nonsize fails due to EDQUOT
   92aeca3af02a mm/kasan: fix false positive invalid-free reports with CONFIG_KASAN_SW_TAGS=y
   f6d997de0883 mm/zsmalloc.c: fix race condition in zs_destroy_pool
   e3f9299cbe4c mm/zsmalloc.c: migration can leave pages in ZS_EMPTY indefinitely
   199faced432f mm, page_owner: handle THP splits correctly
   ef1cb3ee97ec mm: memcontrol: flush percpu vmevents before releasing memcg
   2bd82494d1d6 mm: memcontrol: flush percpu vmstats before releasing memcg
   27674f5f49a8 mm, page_alloc: move_freepages should not examine struct page of reserved memory
   764fa2f4ff59 mm/z3fold.c: fix race between migration and destruction
   641c1d8396dc genirq: Properly pair kobject_del() with kobject_add()
   f2f89f89e5fe dm zoned: properly handle backing device failure
   5d77bfe7e69d dm zoned: improve error handling in i/o map code
   544518b023cb dm zoned: improve error handling in reclaim
   ace23a455383 dm table: fix invalid memory accesses with too high sector number
   23c9e199076a dm space map metadata: fix missing store of apply_bops() return value
   f57bbd7c7894 dm raid: add missing cleanup in raid_ctr()
   e7b9e2afcc68 dm integrity: fix a crash due to BUG_ON in __journal_read_write()
   9e3dcb641f08 dm btree: fix order of block initialization in btree_split_beneath
   e92dfd8d1403 dm dust: use dust block size for badblocklist index
   a6d64ebeb5eb dm kcopyd: always complete failed jobs
   1e2528273532 psi: get poll_work to run when calling poll syscall next time
   b9e0cc134d73 IB/hfi1: Drop stale TID RDMA packets that cause TIDErr
   a382c2b3d9c2 IB/hfi1: Add additional checks when handling TID RDMA WRITE DATA packet
   47a2c4e414fb IB/hfi1: Add additional checks when handling TID RDMA READ RESP packet
   b568370cf1d7 IB/hfi1: Unsafe PSN checking for TID RDMA READ Resp packet
   f1c2546fff1f x86/boot: Fix boot regression caused by bootparam sanitizing
   6659665f0afd x86/boot: Save fields explicitly, zero out everything else
   4aa0f3b05a3a x86/CPU/AMD: Clear RDRAND CPUID bit on AMD family 15h/16h
   50d3cd159713 x86/apic: Handle missing global clockevent gracefully
   60d4af6a0e5f x86/retpoline: Don't clobber RFLAGS during CALL_NOSPEC on i386
   accdfad7aed6 userfaultfd_release: always remove uffd flags and clear vm_userfaultfd_ctx
   1069617a56d7 Drivers: hv: vmbus: Fix virt_to_hvpfn() for X86_PAE
   a7ef13769f73 gpiolib: never report open-drain/source lines as 'input' to user-space
   b3b7c576df89 scsi: ufs: Fix NULL pointer dereference in ufshcd_config_vreg_hpm()
   aaf36ec5aa67 drm/nouveau: Don't retry infinitely when receiving no data on i2c over AUX
   be85d2279c5c drm/amdgpu/gfx9: update pg_flags after determining if gfx off is possible
   9d87603371b7 libceph: fix PG split vs OSD (re)connect race
   bfb7dd36f7b9 ceph: don't try fill file_lock on unsuccessful GETFILELOCK reply
   a927f8a9dfd5 ceph: clear page dirty before invalidate page
   e9e5f8e96fe6 clk: socfpga: stratix10: fix rate caclulationg for cnt_clks
   328380940d3a Revert "dm bufio: fix deadlock with loop device"
   2ad350fb4c92 Revert "KVM: x86/mmu: Zap only the relevant pages when removing a memslot"
   24c5a3d468b2 HID: wacom: Correct distance scale for 2nd-gen Intuos devices
   ccdca005c5a3 HID: wacom: correct misreported EKR ring values
   89b925e73610 iwlwifi: mvm: disable TX-AMSDU on older NICs
   6c64df946909 selftests: kvm: Adding config fragments
   b53832252a68 KVM: arm: Don't write junk to CP15 registers on reset
   9b2b6603766b KVM: arm64: Don't write junk to sysregs on reset
   2590622af1a6 dt-bindings: riscv: fix the schema compatible string for the HiFive Unleashed board
   9941192b06ec perf pmu-events: Fix missing "cpu_clk_unhalted.core" event
   40db83cb0c86 perf cpumap: Fix writing to illegal memory in handling cpumap mask
   dcd75c90dec1 perf ftrace: Fix failure to set cpumask when only one cpu is present
   371879acb44e block, bfq: handle NULL return value by bfq_init_rq()
   6bfd59d99133 block: aoe: Fix kernel crash due to atomic sleep when exiting
   bcc19f380ecc drm/vmwgfx: fix memory leak when too many retries have occurred
   41dddcbf27fd x86/lib/cpu: Address missing prototypes warning
   8e88ef54c22a libata: add SG safety checks in SFF pio transfers
   9ba76a5214e4 libata: have ata_scsi_rw_xlat() fail invalid passthrough requests
   75d360c01f48 NFSv4: Ensure state recovery handles ETIMEDOUT correctly
   37f3fc22b32d net: hisilicon: Fix dma_map_single failed on arm64
   36ea6d81a99e net: hisilicon: fix hip04-xmit never return TX_BUSY
   9e7a5c2730bd net: hisilicon: make hip04_tx_reclaim non-reentrant
   39db6b4e6fa1 drm/amdgpu: pin the csb buffer on hw init for gfx v8
   84de7cd06750 net: stmmac: tc: Do not return a fragment entry
   f0d73daeef24 net: stmmac: Fix issues when number of Queues >= 4
   9474322cadfd net: cxgb3_main: Fix a resource leak in a error path in 'init_one()'
   4f339c4018a8 ata: rb532_cf: Fix unused variable warning in rb532_pata_driver_probe
   976dcd26cb03 s390: put _stext and _etext into .text section
   d810001f3e92 s390/mm: fix dump_pagetables top level page table walking
   580b216496b6 s390/protvirt: avoid memory sharing for diag 308 set/store
   1f54a9b84956 sched/psi: Do not require setsched permission from the trigger creator
   9ea2355c3117 sched/psi: Reduce psimon FIFO priority
   a343eca8fd92 sched/deadline: Fix double accounting of rq/running bw in push & pull
   4fe7ee5ed9b0 SMB3: Kernel oops mounting a encryptData share with CONFIG_DEBUG_VIRTUAL
   efb86f76c6c8 SMB3: Fix potential memory leak when processing compound chain
   6dfb0916b1fd drm/rockchip: Suspend DP late
   ef411a41d35a HID: input: fix a4tech horizontal wheel custom usage
   b6f61042d3c5 HID: quirks: Set the INCREMENT_USAGE_ON_DUPLICATE quirk on Saitek X52
   3055b274a141 NFS: Fix regression whereby fscache errors are appearing on 'nofsc' mounts
   83d99ded4b1d NFSv4: Fix a potential sleep while atomic in nfs4_do_reclaim()
   55a76b7b9a5c NFSv4.1: Only reap expired delegations
   00cfd19b4aab NFSv4.1: Fix open stateid recovery
   5ebc4cb05315 NFSv4: When recovering state fails with EAGAIN, retry the same recovery
   8c0391db53ef NFSv4: Fix a credential refcount leak in nfs41_check_delegation_stateid
   1cfb3722bb57 enetc: Select PHYLIB while CONFIG_FSL_ENETC_VF is set
   bf92682c476b net/ethernet/qlogic/qed: force the string buffer NULL-terminated
   e9da4fc7d8ec ASoC: amd: acp3x: use dma_ops of parent device for acp3x dma driver
   ac8bf342add9 can: peak_usb: force the string buffer NULL-terminated
   4a17b244620c can: sja1000: force the string buffer NULL-terminated
   c7bc59702fa8 spi: pxa2xx: Add support for Intel Tiger Lake
   8da2ee75f213 perf bench numa: Fix cpu0 binding
   cbffa423f725 net: phy: phy_led_triggers: Fix a possible null-pointer dereference in phy_led_trigger_change_speed()
   e17659fd38cf isdn: hfcsusb: Fix mISDN driver crash caused by transfer buffer on the stack
   b7737b00b86d enetc: Fix build error without PHYLIB
   4784684e960a iwlwifi: mvm: send LQ command always ASYNC
   14311a90347b iwlwifi: fix locking in delayed GTK setting
   743fa6a7baa8 iwlwifi: dbg_ini: move iwl_dbg_tlv_free outside of debugfs ifdef
   250352ddc2b4 iwlwifi: dbg_ini: move iwl_dbg_tlv_load_bin out of debug override ifdef
   de0f0564b100 iwlwifi: mvm: avoid races in rate init and rate perform
   505d5fc02a34 nvmem: Use the same permissions for eeprom as for nvmem
   f1079e415bc1 rxrpc: Fix the lack of notification when sendmsg() fails on a DATA packet
   04ce53b00a89 rxrpc: Fix potential deadlock
   68c55a2c6c2f netfilter: ipset: Fix rename concurrency with listing
   3fb7dc7af067 netfilter: ipset: Copy the right MAC address in bitmap:ip,mac and hash:ip,mac sets
   79ebfb394cbe netfilter: ipset: Actually allow destination MAC address for hash:ip,mac sets too
   edd7585d6751 net: stmmac: manage errors returned by of_get_mac_address()
   79ea14eea8cd mac80211_hwsim: Fix possible null-pointer dereferences in hwsim_dump_radio_nl()
   813f42fc5695 habanalabs: fix F/W download in BE architecture
   45d6a121c7dc isdn: mISDN: hfcsusb: Fix possible null-pointer dereferences in start_isoc_chain()
   c60f443cf039 qed: RDMA - Fix the hw_ver returned in device attributes
   349b39f98d1b net: usb: qmi_wwan: Add the BroadMobi BM818 card
   7446b2794d9f ASoC: ti: davinci-mcasp: Correct slot_width posed constraint
   ec10dcf3ae89 ASoC: rockchip: Fix mono capture
   205cd0f91481 ASoC: ti: davinci-mcasp: Fix clk PDIR handling for i2s master mode
   7bd8e226cd63 {nl,mac}80211: fix interface combinations on crypto controlled devices
   cb2150b718c0 st_nci_hci_connectivity_event_received: null check the allocation
   775d026bbfe2 st21nfca_connectivity_event_received: null check the allocation
   8f28ebbdf9bc libbpf: silence GCC8 warning about string truncation
   46af9cbcf73a Staging: fbtft: Fix GPIO handling
   ab4f4d331a98 ASoC: Fail card instantiation if DAI format setup fails
   2d0befff4db8 can: gw: Fix error path of cgw_module_init
   ad14579d403a can: mcp251x: add error check when wq alloc failed
   eae5534465c8 can: dev: call netif_carrier_off() in register_candev()
   7dae14d19c4f libbpf: fix using uninitialized ioctl results
   890626e2d964 selftests/bpf: add another gso_segs access
   24c21fa64560 selftests: forwarding: gre_multipath: Fix flower filters
   f4bed7ed14a2 selftests: forwarding: gre_multipath: Enable IPv4 forwarding
   82d861e06dc6 net: mvpp2: Don't check for 3 consecutive Idle frames for 10G links
   a25bd473e8c9 bonding: Force slave speed check after link state recovery for 802.3ad
   1c3e3000de80 ASoC: dapm: fix a memory leak bug
   5fa1d7a76dd0 selftests/bpf: fix sendmsg6_prog on s390
   5c447c1951cd bpf: sockmap, only create entry if ulp is not already enabled
   47032e94979e bpf: sockmap, synchronize_rcu before free'ing map
   2a574254d6f5 bpf: sockmap, sock_map_delete needs to use xchg
   705409085597 spi: pxa2xx: Balance runtime PM enable/disable on error
   bdeaab6261ff ASoC: SOF: use __u32 instead of uint32_t in uapi headers
   5cecec718e35 ASoC: dapm: Fix handling of custom_stop_condition on DAPM graph walks
   8d376e73adf1 netfilter: ebtables: fix a memory leak bug in compat
   0ea865793835 libbpf: sanitize VAR to conservative 1-byte INT
   3883ef3b1de6 mips: fix cacheinfo
   7afa881dd42a MIPS: kernel: only use i8253 clocksource with periodic clockevent
   22c0b70969e3 HID: Add 044f:b320 ThrustMaster, Inc. 2 in 1 DT
   e6cca5f2ab53 HID: logitech-hidpp: add USB PID for a few more supported mice
   e301eb65c861 ASoC: Intel: bytcht_es8316: Add quirk for Irbis NB41 netbook
   af3eab0b3016 ASoC: samsung: odroid: fix a double-free issue for cpu_dai
   b3978884ac59 ASoC: samsung: odroid: fix an use-after-free issue for codec
   cb7829e5aeb3 regulator: axp20x: fix DCDC5 and DCDC6 for AXP803
   7a2ec3fbdcb1 regulator: axp20x: fix DCDCA and DCDCD for AXP806
   3861684475d5 ASoC: audio-graph-card: add missing const at graph_get_dai_id()
   e5e516915f78 ASoC: audio-graph-card: fix an use-after-free in graph_get_dai_id()
   7b83af285ad2 ASoC: audio-graph-card: fix use-after-free in graph_dai_link_of_dpcm()
   86827ec32e56 ASoC: simple-card: fix an use-after-free in simple_for_each_link()
   9b7f263403ab ASoC: simple-card: fix an use-after-free in simple_dai_link_of_dpcm()
   c9479b9717c3 ASoC: simple_card_utils.h: care NULL dai at asoc_simple_debug_dai()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index cf5142cf84..763e60984d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c6eb169e914def00c37cc2917486c637d800d404"
-SRCREV_meta ?= "a36c82128d9ccec878d1c0c4542b87d6cf5e9a7c"
+SRCREV_machine ?= "9a8cede3b709ca206cf8f133cd0d708a83846c97"
+SRCREV_meta ?= "f88e1531f8ff31810f40482371450932b927f0c8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.2.10"
+LINUX_VERSION ?= "5.2.13"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index c2193c0c72..ae196c64c2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.2.10"
+LINUX_VERSION ?= "5.2.13"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "94d03154067049b417526f46429729d4ba1e09b7"
-SRCREV_machine ?= "8d8bf56b2373bfdb1a9702b96a0e91e6706f62d4"
-SRCREV_meta ?= "a36c82128d9ccec878d1c0c4542b87d6cf5e9a7c"
+SRCREV_machine_qemuarm ?= "8c520d2fa63f9d778ebc76577407efa36228a0d1"
+SRCREV_machine ?= "29a2a741f89cd4155990831edc7250a3c38efc34"
+SRCREV_meta ?= "f88e1531f8ff31810f40482371450932b927f0c8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index 9a75f17818..ffb7c28cee 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d329dc7256dfef66dedb604cafea5b5685c57f9d"
-SRCREV_machine_qemuarm64 ?= "8d8bf56b2373bfdb1a9702b96a0e91e6706f62d4"
-SRCREV_machine_qemumips ?= "6a46b8261433131ea99e5725d3fd75969004617c"
-SRCREV_machine_qemuppc ?= "8d8bf56b2373bfdb1a9702b96a0e91e6706f62d4"
-SRCREV_machine_qemuriscv64 ?= "8d8bf56b2373bfdb1a9702b96a0e91e6706f62d4"
-SRCREV_machine_qemux86 ?= "8d8bf56b2373bfdb1a9702b96a0e91e6706f62d4"
-SRCREV_machine_qemux86-64 ?= "8d8bf56b2373bfdb1a9702b96a0e91e6706f62d4"
-SRCREV_machine_qemumips64 ?= "06bd563009ffc480befa0d116faed18e63785739"
-SRCREV_machine ?= "8d8bf56b2373bfdb1a9702b96a0e91e6706f62d4"
-SRCREV_meta ?= "a36c82128d9ccec878d1c0c4542b87d6cf5e9a7c"
+SRCREV_machine_qemuarm ?= "a79bec3a74094b71c15b55d6fd2bd705aeda13d5"
+SRCREV_machine_qemuarm64 ?= "29a2a741f89cd4155990831edc7250a3c38efc34"
+SRCREV_machine_qemumips ?= "5510032fbac1094d8868953c12303f465858a05d"
+SRCREV_machine_qemuppc ?= "29a2a741f89cd4155990831edc7250a3c38efc34"
+SRCREV_machine_qemuriscv64 ?= "29a2a741f89cd4155990831edc7250a3c38efc34"
+SRCREV_machine_qemux86 ?= "29a2a741f89cd4155990831edc7250a3c38efc34"
+SRCREV_machine_qemux86-64 ?= "29a2a741f89cd4155990831edc7250a3c38efc34"
+SRCREV_machine_qemumips64 ?= "d30be093f992de20a76c5eee972b74edf986a66c"
+SRCREV_machine ?= "29a2a741f89cd4155990831edc7250a3c38efc34"
+SRCREV_meta ?= "f88e1531f8ff31810f40482371450932b927f0c8"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.2.10"
+LINUX_VERSION ?= "5.2.13"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


