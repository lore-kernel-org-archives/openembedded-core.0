Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 63B7A614FE
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 16:01:02 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id b35so9259966pgm.13
	for <openembedded-core@openembedded.org>;
	Mon, 17 Feb 2020 08:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=JNXuDZcwOZaU49KPGixp64fkIaiX5ml9Vdq5fuJK/s8=;
	b=aCUfc5WQRQeCEHz5i4U0cjVr8EDsFZ33+G7UWyTLf5IDK+oU/+0sk+ndA21BXvwJgF
	WRRoiEB8cfazfdcnyu5jCuOwU1qcn81Zx6XbuQRUmbvIoiNuEoGdzqEnzSKn/5xDBHFe
	ymofF9KTUk0WVr8UaU3Zsdxjqv6Uwajd9/sV5sTtNT48HW8/eowlSsg92dBzsakb+VVE
	8Dw602vCTWRBkB8HwgPPDugKlaLiL4IxUS2xkM8o18lYNy45w8QTyHSfrbJmPlj6gCcF
	9aI9seEb/xjwqsG6eYiYUgj/eONn3SV6OxieFI9/zvak09je/312K0Gs9KzlY95sCVY0
	bxIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=JNXuDZcwOZaU49KPGixp64fkIaiX5ml9Vdq5fuJK/s8=;
	b=jF9P7TUvG8wkejrnHQ0Oac/ocKFFpuqgXrDkAHq5qCt3Ewws4rXElS2a22rnqzhFiO
	nySaPaWz+hGTPweAcww3p5+ktUNWMzxDmxk8QOqLsOb2WBheoGZlddIS4nmvhiQEIuji
	kYOG6ka/4nT8l7cWC32IK5TJiwhsMTbAYMIM/HMsWT4pQkuiCAOegaabquM2alYGs5FE
	n2+FhvSKMMXdYRPnQxHLvIAPfOmlBSatuOHenXyC6fdm/R1JgsEIzjHD+uuhPlIkFisi
	Q4Bq4KNBR3h5FHZAIXa4FHe9svFl0CZtfg10OOqDXB53yVY2KJkPXPBeHXVIec20lRNp
	SnKA==
X-Gm-Message-State: APjAAAXQZylpGS27MkDWOh+j4sccCt9Eps1p98DW5AgCwpuewXnpR+l1
	kQLWzVvAg1JIrDunRW1K4XDaV7JM
X-Google-Smtp-Source: APXvYqxNuCGlhq2dVjD5atHymnkoIZ3e4VmzibATjRU8qP/cDvx9zn2IUU52HvS9FHolGKOUfLfQFQ==
X-Received: by 2002:a63:2bc3:: with SMTP id
	r186mr18459594pgr.294.1581955260969; 
	Mon, 17 Feb 2020 08:01:00 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:9144:9b3e:b52:fa29])
	by smtp.gmail.com with ESMTPSA id
	a22sm928041pfk.108.2020.02.17.08.00.59
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 17 Feb 2020 08:00:59 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 17 Feb 2020 08:00:42 -0800
Message-Id: <71edff03db1a508ab9e1a919b5a5b90ee7316609.1581955142.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581955142.git.akuster808@gmail.com>
References: <cover.1581955142.git.akuster808@gmail.com>
Subject: [warrior 04/14] linux-yocto/4.19: update to v4.19.72
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
X-List-Received-Date: Mon, 17 Feb 2020 16:01:02 -0000

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating to the latest -korg -stable relase. A summary of the
changes follows:

   ee809c7e0895 Linux 4.19.72
   991467a47cf2 Revert "x86/apic: Include the LDR when clearing out APIC registers"
   0f134f6e722c libceph: allow ceph_buffer_put() to receive a NULL ceph_buffer
   5049632bc958 x86/boot/compressed/64: Fix missing initialization in find_trampoline_placement()
   b8727dff55f0 KVM: arm/arm64: VGIC: Properly initialise private IRQ affinity
   1a31b0d0ddfa afs: Fix leak in afs_lookup_cell_rcu()
   111d36b6fb7e KVM: arm/arm64: Only skip MMIO insn once
   b84817d96e0f ceph: fix buffer free while holding i_ceph_lock in fill_inode()
   5cd1e3552f0e ceph: fix buffer free while holding i_ceph_lock in __ceph_build_xattrs_blob()
   dfb8712c7acc ceph: fix buffer free while holding i_ceph_lock in __ceph_setxattr()
   ddb55cc39c70 selftests/kvm: make platform_info_test pass on AMD
   6cb9f8d60f8f selftests: kvm: fix state save/load on processors without XSAVE
   08c2052815e3 infiniband: hfi1: fix memory leaks
   d1b7f3252d56 infiniband: hfi1: fix a memory leak bug
   adb87027b5ff IB/mlx4: Fix memory leaks
   5e416b11b4a9 nvme-multipath: fix possible I/O hang when paths are updated
   5bbebceec61d Tools: hv: kvp: eliminate 'may be used uninitialized' warning
   1d42e40fe3c5 Input: hyperv-keyboard: Use in-place iterator API in the channel callback
   e02aac3edb46 x86/boot/compressed/64: Fix boot on machines with broken E820 table
   05d611c4ffb7 HID: cp2112: prevent sleeping function called from invalid context
   5e1d50a3eafe kprobes: Fix potential deadlock in kprobe_optimizer()
   a5839b6b3a79 ravb: Fix use-after-free ravb_tstamp_skb
   54eac3997ee4 wimax/i2400m: fix a memory leak bug
   7506e8c4bec8 net: cavium: fix driver name
   ea78dc8b5e66 ibmvnic: Unmap DMA address of TX descriptor buffers after use
   4fcb9b3f263e net: kalmia: fix memory leaks
   1ad45d0f69d2 cx82310_eth: fix a memory leak bug
   ac3cc25f380b vfs: fix page locking deadlocks when deduping files
   9ea1feadf5e0 lan78xx: Fix memory leaks
   375ab446ec76 net: myri10ge: fix memory leaks
   f13b7ec5e1c5 liquidio: add cleanup in octeon_setup_iq()
   2c3dd20f852a cxgb4: fix a memory leak bug
   b8cd0b7b09ed scsi: target: tcmu: avoid use-after-free after command timeout
   6c9a1e17d063 scsi: qla2xxx: Fix gnl.l memory leak on adapter init failure
   b3496367d9cb drm/mediatek: set DMA max segment size
   c9f595453bc3 drm/mediatek: use correct device to import PRIME buffers
   a54fa5dff8cd netfilter: nft_flow_offload: skip tcp rst and fin packets
   6052090280b8 gpio: Fix build error of function redefinition
   cc8aa6155611 ibmveth: Convert multicast list size for little-endian system
   32e912b91b5d Bluetooth: btqca: Add a short delay before downloading the NVM
   7b7a11549dc1 net: tc35815: Explicitly check NET_IP_ALIGN is not zero in tc35815_rx
   752832f2e8c9 hv_netvsc: Fix a warning of suspicious RCU usage
   463d87bc13ff tools: bpftool: fix error message (prog -> object)
   5776970fb4ec netfilter: nf_tables: use-after-free in failing rule with bound set
   d22ed7b72acf net: tundra: tsi108: use spin_lock_irqsave instead of spin_lock_irq in IRQ context
   3ddda4f3114b spi: bcm2835aux: fix corruptions for longer spi transfers
   fe49c3de7372 spi: bcm2835aux: remove dangerous uncontrolled read of fifo
   a4a9ee79036b spi: bcm2835aux: unifying code between polling and interrupt driven code
   ee271ead3b61 x86/boot: Preserve boot_params.secure_boot from sanitizing
   9484203d254d net/rds: Fix info leak in rds6_inc_info_copy()
   5977bc19ce7f tcp: remove empty skb from write queue in error cases
   6f3126379879 tcp: inherit timestamp on mtu probe
   6f8348f63706 net: stmmac: dwmac-rk: Don't fail if phy regulator is absent
   38166934f89c net_sched: fix a NULL pointer deref in ipt action
   5ff0ab0c668b net: sched: act_sample: fix psample group handling on overwrite
   6a2bd8261630 net: fix skb use after free in netpoll
   8a5d27eaba68 mld: fix memory leak in mld_del_delrec()
   e7d2672c66e4 Linux 4.19.71
   72168ae78629 Revert "Input: elantech - enable SMBus on new (2018+) systems"
   0fed55c248d9 Linux 4.19.70
   9854d089f790 Revert "ASoC: Fail card instantiation if DAI format setup fails"
   e064466cb614 mt76: mt76x0u: do not reset radio on resume
   b307f99dca5a x86/ptrace: fix up botched merge of spectrev1 fix
   3b26fa9e3ec3 i2c: piix4: Fix port selection for AMD Family 16h Model 30h
   4f4be79c9ee7 NFS: Ensure O_DIRECT reports an error if the bytes read/written is 0
   b5891b624b9a NFS: Pass error information to the pgio error cleanup routine
   812de6dee596 NFSv4/pnfs: Fix a page lock leak in nfs_pageio_resend()
   57c491fd844d NFS: Clean up list moves of struct nfs_page
   79f1b33c53a0 KVM: arm/arm64: vgic-v2: Handle SGI bits in GICD_I{S,C}PENDR0 as WI
   ab8ecc278dc8 KVM: arm/arm64: vgic: Fix potential deadlock when ap_list is long
   db1841a2dd4c KVM: PPC: Book3S: Fix incorrect guest-to-user-translation error handling
   938e383738d9 mac80211: Correctly set noencrypt for PAE frames
   4f139c0376fb mac80211: Don't memset RXCB prior to PAE intercept
   58f91aac4dfe mac80211: fix possible sta leak
   945b35972803 Revert "cfg80211: fix processing world regdomain when non modular"
   690a424838ca crypto: ccp - Ignore unconfigured CCP device on suspend/resume
   4e77b2ea941b VMCI: Release resource if the work is already queued
   2a964875def7 bus: hisi_lpc: Add .remove method to avoid driver unbind crash
   649532efef46 bus: hisi_lpc: Unregister logical PIO range to avoid potential use-after-free
   68b58d392464 drm/i915: Call dma_set_max_seg_size() in i915_driver_hw_probe()
   c7615333645d drm/i915: Don't deballoon unused ggtt drm_mm_node in linux guest
   6d3003f56449 drm/amdgpu: Add APTX quirk for Dell Latitude 5495
   c4616a9b3d3f lib: logic_pio: Add logic_pio_unregister_range()
   7faef13e6f68 lib: logic_pio: Avoid possible overlap for unregistering regions
   b865c2c6e3f2 lib: logic_pio: Fix RCU usage
   79829fc4ff33 fsi: scom: Don't abort operations for minor errors
   e44840b7320c typec: tcpm: fix a typo in the comparison of pdo_max_voltage
   e91c9c119dba intel_th: pci: Add Tiger Lake support
   ce1c894e1e89 intel_th: pci: Add support for another Lewisburg PCH
   cad1d3bfdd5d stm class: Fix a double free of stm_source_device
   abc42341b6c4 mmc: core: Fix init of SD cards reporting an invalid VDD range
   1ecc65e1418b mmc: sdhci-of-at91: add quirk for broken HS200
   be8e9fa67ea7 mei: me: add Tiger Lake point LP device ID
   5ed36421af24 USB: storage: ums-realtek: Whitelist auto-delink support
   f79d1598968b USB: storage: ums-realtek: Update module parameter description for auto_delink_en
   f46fd68a541f usb: host: xhci: rcar: Fix typo in compatible string matching
   7af7737491ce usb: host: ohci: fix a race condition between shutdown and irq
   a209827549da usb: chipidea: udc: don't do hardware access if gadget has stopped
   97bec7afb98f usb: hcd: use managed device resources
   ebad9fd106da USB: cdc-wdm: fix race between write and disconnect due to flag abuse
   cbf5a279a22d usb-storage: Add new JMS567 revision to unusual_devs
   8ea639525db6 ftrace: Check for empty hash and comment the race with registering probes
   9d98e0f4859d ftrace: Check for successful allocation of hash
   f184b16748f4 ftrace: Fix NULL pointer dereference in t_probe_next()
   edc454cd5a04 x86/apic: Include the LDR when clearing out APIC registers
   959832657c03 x86/apic: Do not initialize LDR and DFR for bigsmp
   941d875cd44a uprobes/x86: Fix detection of 32-bit user mode
   3c2b4827798e KVM: x86: Don't update RIP or do single-step on faulting emulation
   3ec35109c80a kvm: x86: skip populating logical dest map if apic is not sw enabled
   cbd905dac535 ALSA: usb-audio: Add implicit fb quirk for Behringer UFX1604
   b5d1f31d97af ALSA: usb-audio: Fix invalid NULL check in snd_emuusb_set_samplerate()
   98a2017c4a17 ALSA: seq: Fix potential concurrent access to the deleted pool
   842317de9797 ALSA: hda - Fixes inverted Conexant GPIO mic mute led
   5ef43bdc7321 ALSA: line6: Fix memory leak at line6_init_pcm() error path
   c94c0bf878bf ALSA: usb-audio: Check mixer unit bitmap yet more strictly
   5dd2db1ab006 mm/zsmalloc.c: fix build when CONFIG_COMPACTION=n
   9febfd30aede ipv4/icmp: fix rt dst dev null pointer dereference
   0a6a9c473080 tcp: make sure EPOLLOUT wont be missed
   3e79bd1e4f9a net/smc: make sure EPOLLOUT is raised
   ff129837a5f6 ipv6: Default fib6_type to RTN_UNICAST when not set
   02127bdfee97 ipv6/addrconf: allow adding multicast addr if IFA_F_MCAUTOJOIN is set
   a1407b26a6ed net: tls, fix sk_write_space NULL write when tx disabled
   fdc4400e9628 net/tls: swap sk_write_space on close
   f7009bbaff54 net/tls: Fixed return value when tls_complete_pending_work() fails
   dc066fd0d073 drm/tilcdc: Register cpufreq notifier after we have initialized crtc
   eba86f0a909f scsi: ufs: Fix RX_TERMINATION_FORCE_ENABLE define value
   edd40f54736d drm/bridge: tfp410: fix memleak in get_modes()
   2fa7c944e11f watchdog: bcm2835_wdt: Fix module autoload
   a3eb2eba2f79 drm/i915: fix broadwell EU computation
   c61c7246dc1f tools: hv: fix KVP and VSS daemons exit code
   0c39d818aae4 tools: hv: fixed Python pep8/flake8 warnings for lsvmbus
   39ad18a042ab usb: host: fotg2: restart hcd after port reset
   37654abed26f drm/ast: Fixed reboot test may cause system hanged
   1cc2ef1cfbd8 i2c: emev2: avoid race when unregistering slave client
   7048cd814f4e i2c: rcar: avoid race when unregistering slave client
   8bd5426889c2 arm64: cpufeature: Don't treat granule sizes as strict
   eb535aaf3cd7 xen/blkback: fix memory leaks
   339c1572a266 usb: gadget: mass_storage: Fix races between fsg_disable and fsg_set_alt
   122ab8ea641c usb: gadget: composite: Clear "suspended" on reset/disconnect
   21ec20f62fae iommu/dma: Handle SG length overflow better
   7f4b81365e83 omap-dma/omap_vout_vrfb: fix off-by-one fi value
   71d24f45f905 dmaengine: stm32-mdma: Fix a possible null-pointer dereference in stm32_mdma_irq_handler()
   377ebe613ed8 auxdisplay: panel: need to delete scan_timer when misc_register fails in panel_attach
   2f87eb895ebd soundwire: cadence_master: fix definitions for INTSTAT0/1
   29b064d300a2 soundwire: cadence_master: fix register definition for SLAVE_STATE
   4a9829195d9e nvme-pci: Fix async probe remove race
   431f579a5349 nvme: fix a possible deadlock when passthru commands sent to a multipath device
   32c0b8f10351 nvmet-loop: Flush nvme_delete_wq when removing the port
   9c55dc85d890 afs: Only update d_fsdata if different in afs_d_revalidate()
   24e093b96905 fs: afs: Fix a possible null-pointer dereference in afs_put_read()
   8e5179f982f9 afs: Fix loop index mixup in afs_deliver_vl_get_entry_by_name_u()
   dfc438c0bc6d afs: Fix the CB.ProbeUuid service handler to reply correctly
   7436dc2adeff nvme-multipath: revalidate nvme_ns_head gendisk in nvme_validate_ns
   2013d6ec0bc0 dmaengine: ste_dma40: fix unneeded variable warning
   97ab07e11fbf Linux 4.19.69
   6d47174198ac rxrpc: Fix local refcounting
   ce3f9e194d25 rxrpc: Fix local endpoint replacement
   a05354cbb822 rxrpc: Fix read-after-free in rxrpc_queue_local()
   f28023c4eedc rxrpc: Fix local endpoint refcounting
   32df8a30b734 powerpc: Allow flush_(inval_)dcache_range to work across ranges >4GB
   0d5e34c1e263 dm zoned: fix potential NULL dereference in dmz_do_reclaim()
   655bb2c4ace4 xfs: always rejoin held resources during defer roll
   83a8e6b2f2e3 xfs: Add attibute remove and helper functions
   b21ff6cfcc24 xfs: Add attibute set and helper functions
   b3a248f2307c xfs: Add helper function xfs_attr_try_sf_addname
   a9912f346bdc xfs: Move fs/xfs/xfs_attr.h to fs/xfs/libxfs/xfs_attr.h
   17c2b7af71f2 xfs: don't trip over uninitialized buffer on extent read of corrupted inode
   11f85d4d77af xfs: fix missing ILOCK unlock when xfs_setattr_nonsize fails due to EDQUOT
   ed11e6003314 mm/zsmalloc.c: fix race condition in zs_destroy_pool
   b30a2f608e94 mm/zsmalloc.c: migration can leave pages in ZS_EMPTY indefinitely
   db67ac031655 mm, page_owner: handle THP splits correctly
   42731deff2ea genirq: Properly pair kobject_del() with kobject_add()
   c14fe4e8fd01 dm zoned: properly handle backing device failure
   4530f2f1a79a dm zoned: improve error handling in i/o map code
   8b7c17bb2753 dm zoned: improve error handling in reclaim
   ded8e524cfa6 dm table: fix invalid memory accesses with too high sector number
   53e73d1079d7 dm space map metadata: fix missing store of apply_bops() return value
   2cff6c87a0dc dm raid: add missing cleanup in raid_ctr()
   795b0572729b dm integrity: fix a crash due to BUG_ON in __journal_read_write()
   8114012de6c1 dm btree: fix order of block initialization in btree_split_beneath
   e0fb8135de9e dm kcopyd: always complete failed jobs
   f7d157f33001 x86/boot: Fix boot regression caused by bootparam sanitizing
   d955601166f8 x86/boot: Save fields explicitly, zero out everything else
   e063b03b451a x86/CPU/AMD: Clear RDRAND CPUID bit on AMD family 15h/16h
   685e598e447e x86/apic: Handle missing global clockevent gracefully
   f9747104a5c8 x86/retpoline: Don't clobber RFLAGS during CALL_NOSPEC on i386
   cf13e30c58d4 userfaultfd_release: always remove uffd flags and clear vm_userfaultfd_ctx
   a6f236e1bd97 Drivers: hv: vmbus: Fix virt_to_hvpfn() for X86_PAE
   3783c7ee9920 gpiolib: never report open-drain/source lines as 'input' to user-space
   f88c31b43bab drm/nouveau: Don't retry infinitely when receiving no data on i2c over AUX
   51f6afddb147 libceph: fix PG split vs OSD (re)connect race
   f2951720629e ceph: don't try fill file_lock on unsuccessful GETFILELOCK reply
   7bed2889cd18 ceph: clear page dirty before invalidate page
   a8f7703f2213 clk: socfpga: stratix10: fix rate caclulationg for cnt_clks
   b608a5a238d5 Revert "dm bufio: fix deadlock with loop device"
   375c6c72f56c HID: wacom: Correct distance scale for 2nd-gen Intuos devices
   8317fe4a3906 HID: wacom: correct misreported EKR ring values
   3c4b283a0deb selftests: kvm: Adding config fragments
   ef61b79017ff KVM: arm: Don't write junk to CP15 registers on reset
   d5cb5b493030 KVM: arm64: Don't write junk to sysregs on reset
   590549487679 perf pmu-events: Fix missing "cpu_clk_unhalted.core" event
   06ed429b9018 perf cpumap: Fix writing to illegal memory in handling cpumap mask
   e49cfed0a8cb perf ftrace: Fix failure to set cpumask when only one cpu is present
   7aa8dfa450b4 block, bfq: handle NULL return value by bfq_init_rq()
   fa6f4687805a drm/vmwgfx: fix memory leak when too many retries have occurred
   923de016dc88 x86/lib/cpu: Address missing prototypes warning
   3ca013cd63be libata: add SG safety checks in SFF pio transfers
   3b84bbef51c4 libata: have ata_scsi_rw_xlat() fail invalid passthrough requests
   e0c030221b1f net: hisilicon: Fix dma_map_single failed on arm64
   4ab3052568e5 net: hisilicon: fix hip04-xmit never return TX_BUSY
   09ec5bf10749 net: hisilicon: make hip04_tx_reclaim non-reentrant
   b8d03c79e403 net: stmmac: tc: Do not return a fragment entry
   b6cd6d18423e net: stmmac: Fix issues when number of Queues >= 4
   45e7e4e66b08 net: cxgb3_main: Fix a resource leak in a error path in 'init_one()'
   db106f695414 s390: put _stext and _etext into .text section
   33bdea175df0 SMB3: Kernel oops mounting a encryptData share with CONFIG_DEBUG_VIRTUAL
   fab5a1fd17a6 SMB3: Fix potential memory leak when processing compound chain
   6cb4997861c8 drm/rockchip: Suspend DP late
   1c6ca0921705 HID: input: fix a4tech horizontal wheel custom usage
   f6f9c4491ec5 HID: quirks: Set the INCREMENT_USAGE_ON_DUPLICATE quirk on Saitek X52
   b6fb2f5b33f2 NFS: Fix regression whereby fscache errors are appearing on 'nofsc' mounts
   66daeec347f0 NFSv4: Fix a potential sleep while atomic in nfs4_do_reclaim()
   d1ba0b81e709 net/ethernet/qlogic/qed: force the string buffer NULL-terminated
   35d9e9211baf can: peak_usb: force the string buffer NULL-terminated
   895c8fcfedad can: sja1000: force the string buffer NULL-terminated
   a3d1263c9b03 perf bench numa: Fix cpu0 binding
   4533d08b6528 net: phy: phy_led_triggers: Fix a possible null-pointer dereference in phy_led_trigger_change_speed()
   07efe13b95ab isdn: hfcsusb: Fix mISDN driver crash caused by transfer buffer on the stack
   4db2043eec46 rxrpc: Fix the lack of notification when sendmsg() fails on a DATA packet
   0d68fbc2d07b rxrpc: Fix potential deadlock
   63dd147e7af0 netfilter: ipset: Fix rename concurrency with listing
   ea08214d8cd0 netfilter: ipset: Copy the right MAC address in bitmap:ip,mac and hash:ip,mac sets
   5a072ef6a296 netfilter: ipset: Actually allow destination MAC address for hash:ip,mac sets too
   ba42212ac0a0 mac80211_hwsim: Fix possible null-pointer dereferences in hwsim_dump_radio_nl()
   32cbe03539ac isdn: mISDN: hfcsusb: Fix possible null-pointer dereferences in start_isoc_chain()
   8a24df575c97 qed: RDMA - Fix the hw_ver returned in device attributes
   cb64e86ee0d1 net: usb: qmi_wwan: Add the BroadMobi BM818 card
   bfa713f5cec5 ASoC: ti: davinci-mcasp: Correct slot_width posed constraint
   dd0ff288e344 ASoC: rockchip: Fix mono capture
   c5cb10632c0f st_nci_hci_connectivity_event_received: null check the allocation
   0d73ba88f466 st21nfca_connectivity_event_received: null check the allocation
   714a8438fc8a ASoC: Fail card instantiation if DAI format setup fails
   bd2f4c7c2d6a can: gw: Fix error path of cgw_module_init
   3257103502cf can: mcp251x: add error check when wq alloc failed
   dbf790dcb8a9 can: dev: call netif_carrier_off() in register_candev()
   43d31fd9a8f2 selftests: forwarding: gre_multipath: Fix flower filters
   ef52e2b9a621 selftests: forwarding: gre_multipath: Enable IPv4 forwarding
   192bbe9d57ed net: mvpp2: Don't check for 3 consecutive Idle frames for 10G links
   a1e5a76db8dd bonding: Force slave speed check after link state recovery for 802.3ad
   b7038c195fd1 selftests/bpf: fix sendmsg6_prog on s390
   e6dc6409f474 ASoC: dapm: Fix handling of custom_stop_condition on DAPM graph walks
   71305e8ee503 netfilter: ebtables: fix a memory leak bug in compat
   70b4edd74b6d mips: fix cacheinfo
   326175aa28fd MIPS: kernel: only use i8253 clocksource with periodic clockevent
   a6067c6e630f HID: Add 044f:b320 ThrustMaster, Inc. 2 in 1 DT
   def4c11b3131 Linux 4.19.68
   7c13983a2860 mmc: sdhci-of-arasan: Do now show error message in case of deffered probe
   447f5f48f4fa net/mlx5e: Use flow keys dissector to parse packets for ARFS
   fbd8ab680675 net/mlx5e: Only support tx/rx pause setting for port owner
   b3410f0f8505 xen/netback: Reset nr_frags before freeing skb
   cc4ff0f4f564 tipc: initialise addr_trail_end when setting node addresses
   e89bb758c030 team: Add vlan tx offload to hw_enc_features
   eeb148d20819 sctp: fix the transport error_count check
   227f204ad197 sctp: fix memleak in sctp_send_reset_streams
   154e6bc497c9 net/packet: fix race in tpacket_snd()
   f588dccfc137 net/mlx4_en: fix a memory leak bug
   8905a249448c net: dsa: Check existence of .port_mdb_add callback before calling it
   d61d8ea9ca12 bonding: Add vlan tx offload to hw_enc_features
   40933af400c5 bnx2x: Fix VF's VLAN reconfiguration in reload.
   03d54393e3d7 iommu/amd: Move iommu_init_pci() to .init section
   62e023ddd01a Input: psmouse - fix build error of multiple definition
   28ff7d3b3fda netfilter: conntrack: Use consistent ct id hash calculation
   30b9da0ec2a2 arm64: ftrace: Ensure module ftrace trampoline is coherent with I-side
   a1cd2f7015bd dm: disable DISCARD if the underlying storage no longer supports it
   4af28b2f19b0 drm/i915/cfl: Add a new CFL PCI ID.
   3ca5b7b4afee USB: serial: option: Add Motorola modem UARTs
   e480d6cf6f79 USB: serial: option: add the BroadMobi BM818 card
   8175fa2987a6 USB: serial: option: Add support for ZTE MF871A
   afb677b29995 USB: serial: option: add D-Link DWM-222 device ID
   487d66ae8f45 USB: CDC: fix sanity checks in CDC union parser
   c02c0249ce55 usb: cdc-acm: make sure a refcount is taken early enough
   f417f9715f4c usb: gadget: udc: renesas_usb3: Fix sysfs interface of "role"
   7f52d6d2a82d USB: core: Fix races in character device registration and deregistraion
   367d103a4a93 iio: adc: max9611: Fix temperature reading in probe
   dac96992f00a staging: comedi: dt3000: Fix rounding up of timer divisor
   2e394bcfdcf3 staging: comedi: dt3000: Fix signed integer overflow 'divider * base'
   8c7053d162d9 KVM: arm/arm64: Sync ICH_VMCR_EL2 back when about to block
   c8d95668c4ca arm64: KVM: regmap: Fix unexpected switch fall-through
   0755b6b152cb asm-generic: fix -Wtype-limits compiler warnings
   7113a1bc19fa ocfs2: remove set but not used variable 'last_hash'
   01d8d08f4cd4 Revert "kmemleak: allow to coexist with fault injection"
   cf9a18d7bcd0 drm/exynos: fix missing decrement of retry counter
   c256729f2695 drm: msm: Fix add_gpu_components
   b4f0fee7f77c IB/mad: Fix use-after-free in ib mad completion handling
   a0258ff4993f IB/mlx5: Fix MR registration flow to use UMR properly
   efb742ce4e27 IB/core: Add mitigation for Spectre V1
   4a0d2eeea27a arm64/mm: fix variable 'pud' set but not used
   6af9263f685d arm64: unwind: Prohibit probing on return_address()
   ffb1a76d1c29 arm64/efi: fix variable 'si' set but not used
   48522289bf50 kbuild: Check for unknown options with cc-option usage in Kconfig and clang
   b3aebdd46d63 kbuild: modpost: handle KBUILD_EXTRA_SYMBOLS only for external modules
   23bc01f0d955 ata: libahci: do not complain in case of deferred probe
   68340db992f6 drm/amdgpu: fix a potential information leaking bug
   02d4fe0193d5 scsi: qla2xxx: Fix possible fcport null-pointer dereferences
   3435e025ed71 scsi: hpsa: correct scsi command status issue after reset
   f833deae2a06 Btrfs: fix deadlock between fiemap and transaction commits
   202aa96f052a drm/bridge: lvds-encoder: Fix build error while CONFIG_DRM_KMS_HELPER=m
   f69fd790edf7 libata: zpodd: Fix small read overflow in zpodd_get_mech_type()
   0a19fff567a0 perf header: Fix use of unitialized value warning
   ab5aa579ca82 perf header: Fix divide by zero error if f_header.attr_size==0
   a5e40452c916 irqchip/irq-imx-gpcv2: Forward irq type to parent
   dcb73180de61 irqchip/gic-v3-its: Free unused vpt_page when alloc vpe table fail
   e72e6ba17ab4 xen/pciback: remove set but not used variable 'old_state'
   ca5b26a8f1d8 clk: renesas: cpg-mssr: Fix reset control race condition
   af2ed1a05a7a clk: sprd: Select REGMAP_MMIO to avoid compile errors
   3e5f29b66675 clk: at91: generated: Truncate divisor to GENERATED_MAX_DIV + 1
   28fd9b37b6bb riscv: Make __fstate_clean() work correctly.
   cef0e9eb2231 netfilter: ebtables: also count base chain policies
   07d92caeb945 net: usb: pegasus: fix improper read if get_registers() fail
   f13de3d677d1 Input: iforce - add sanity checks
   08b3af00a161 Input: kbtab - sanity check for endpoint type
   b545dc9debe6 HID: hiddev: do cleanup in failure of opening a device
   0aab1a4653a6 HID: hiddev: avoid opening a disconnected device
   537d957b144f HID: holtek: test for sanity of intfdata
   9585f4440cec ALSA: hda - Let all conexant codec enter D3 when rebooting
   e58ba88d6c60 ALSA: hda - Add a generic reboot_notify
   6c4a536ca97b ALSA: hda - Fix a memory leak bug
   1bf5f827564c ALSA: hda - Apply workaround for another AMD chip 1022:1487
   58b9f19ee438 ALSA: usb-audio: Fix an OOB bug in parse_audio_mixer_unit
   46f9a1bc60a4 ALSA: usb-audio: Fix a stack buffer overflow bug in check_input_term
   d5bb12402805 ALSA: hda/realtek - Add quirk for HP Envy x360
   61f6ecb75845 xtensa: add missing isync to the cpu_reset TLB code
   7c001e5aab6d cpufreq: schedutil: Don't skip freq update when limits change
   7f68aa2e3e1b Revert "pwm: Set class for exported channels in sysfs"
   056368fc3ef7 mm/usercopy: use memory range to be accessed for wraparound check
   c8282f1b5653 mm/memcontrol.c: fix use after free in mem_cgroup_iter()
   3c0cb90e9212 mm: mempolicy: handle vma with unmovable pages mapped correctly in mbind
   cd825d87140d mm: mempolicy: make the behavior consistent when MPOL_MF_MOVE* and MPOL_MF_STRICT were specified
   f0fed8283deb mm/hmm: fix bad subpage pointer in try_to_unmap_one
   3858cca150c6 seq_file: fix problem when seeking mid-record
   50d15197254a sh: kernel: hw_breakpoint: Fix missing break in switch statement
   a5aa80588fcd Linux 4.19.67
   ac2951114955 iwlwifi: mvm: fix version check for GEO_TX_POWER_LIMIT support
   6a81677a2e65 iwlwifi: mvm: don't send GEO_TX_POWER_LIMIT on version < 41
   80bac45e3ad8 iwlwifi: mvm: fix an out-of-bound access
   7626b510fc77 iwlwifi: don't unmap as page memory that was mapped as single
   b38c56b76dcc mwifiex: fix 802.11n/WPA detection
   2bc73d914114 KVM: Fix leak vCPU's VMCS value into other pCPU
   d1489f0b4de7 NFSv4: Fix an Oops in nfs4_do_setattr
   898c19f1b4c8 smb3: send CAP_DFS capability during session setup
   50831f1a2f57 SMB3: Fix deadlock in validate negotiate hits reconnect
   2afa6c13e498 dax: dax_layout_busy_page() should not unmap cow pages
   a566750c3a78 mac80211: don't WARN on short WMM parameters from AP
   af9d64f871cf ALSA: hda - Workaround for crackled sound on AMD controller (1022:1457)
   06f0bcaceb8c ALSA: hda - Don't override global PCM hw info flag
   1c286e4e13f2 ALSA: hiface: fix multiple memory leak bugs
   bc972b6b52e2 ALSA: firewire: fix a memory leak bug
   edc388566a1d drm/i915: Fix wrong escape clock divisor init for GLK
   a73027204ac5 hwmon: (nct7802) Fix wrong detection of in4 presence
   9ce1b3eb5489 can: peak_usb: pcan_usb_fd: Fix info-leaks to USB devices
   cab569a44a52 can: peak_usb: pcan_usb_pro: Fix info-leaks to USB devices
   d4d904e4e258 ALSA: usb-audio: fix a memory leak bug
   e0d262a57fc7 x86/purgatory: Do not use __builtin_memcpy and __builtin_memset
   118293070096 HID: sony: Fix race condition between rumble and device remove.
   5c4689cbe95a s390/dma: provide proper ARCH_ZONE_DMA_BITS value
   d768173982ec perf/core: Fix creating kernel counters for PMUs that override event->cpu
   06dc92142b5e tty/ldsem, locking/rwsem: Add missing ACQUIRE to read_failed sleep loop
   0ba69e96cc62 test_firmware: fix a memory leak bug
   cdd92ebe29c2 scsi: scsi_dh_alua: always use a 2 second delay before retrying RTPG
   b620c6d5779a scsi: ibmvfc: fix WARN_ON during event pool release
   f254faed4153 scsi: megaraid_sas: fix panic on loading firmware crashdump
   bb41940c89bd ARM: dts: bcm: bcm47094: add missing #cells for mdio-bus-mux
   19e7df3e4fe7 ARM: davinci: fix sleep.S build error on ARMv4
   bdce5621e6b0 nvme: fix multipath crash when ANA is deactivated
   b1689742ff4a ACPI/IORT: Fix off-by-one check in iort_dev_find_its_id()
   38c919ec7b30 drbd: dynamically allocate shash descriptor
   f4e2d182d6a6 perf probe: Avoid calling freeing routine multiple times for same pointer
   101a155436fe perf tools: Fix proper buffer size for feature processing
   b065f404c946 ALSA: compress: Be more restrictive about when a drain is allowed
   30dd700da7de ALSA: compress: Don't allow paritial drain operations on capture streams
   f1ea9a638770 ALSA: compress: Prevent bypasses of set_params
   b9e2fa1e15b7 ALSA: compress: Fix regression on compressed capture streams
   77868c0003cc s390/qdio: add sanity checks to the fast-requeue path
   8729fe83b0d5 cpufreq/pasemi: fix use-after-free in pas_cpufreq_cpu_init()
   991c4756be69 drm: silence variable 'conn' set but not used
   ca1b1940a32a hwmon: (nct6775) Fix register address and added missed tolerance for nct6106
   56dc57c705ef allocate_flower_entry: should check for null deref
   f4cfdd46b356 mac80211: don't warn about CW params when not using them
   f2fd89817212 nl80211: fix NL80211_HE_MAX_CAPABILITY_LEN
   492c158ab2c0 iscsi_ibft: make ISCSI_IBFT dependson ACPI instead of ISCSI_IBFT_FIND
   8d641499bf96 drm/amd/display: Increase size of audios array
   f9420bfa29f9 drm/amd/display: Only enable audio if speaker allocation exists
   3998e684463a drm/amd/display: Fix dc_create failure handling and 666 color depths
   e7a8a794109c drm/amd/display: use encoder's engine id to find matched free audio device
   2a5e21adc71b drm/amd/display: Wait for backlight programming completion in set backlight level
   056af94d6e10 scripts/sphinx-pre-install: fix script for RHEL/CentOS
   36b6458d8541 netfilter: nft_hash: fix symhash with modulus one
   6f1d7f0d6689 netfilter: conntrack: always store window size un-scaled
   307b6e5d90dc netfilter: Fix rpfilter dropping vrf packets by mistake
   6f9dff8d1d58 vfio-ccw: Set pa_nr to 0 if memory allocation fails for pa_iova_pfn
   bb312b4aa8b0 netfilter: nfnetlink: avoid deadlock due to synchronous request_module
   f61c4d3a1f18 can: peak_usb: fix potential double kfree_skb()
   0e9038a26c9b can: rcar_canfd: fix possible IRQ storm on high load
   9479a0589923 usb: typec: tcpm: Ignore unsupported/unknown alternate mode requests
   3f524b631db7 usb: typec: tcpm: Add NULL check before dereferencing config
   bbc2e8206012 usb: typec: tcpm: remove tcpm dir if no children
   2ec5c9b785f4 usb: typec: tcpm: free log buf memory when remove debug file
   33f2240acfa8 usb: yurex: Fix use-after-free in yurex_delete
   49888a4f0ebc usb: host: xhci-rcar: Fix timeout in xhci_suspend()
   21344f0575f0 gfs2: gfs2_walk_metadata fix
   b674f7914a64 x86/purgatory: Use CFLAGS_REMOVE rather than reset KBUILD_CFLAGS
   0a9e41e27659 perf record: Fix module size on s390
   f1f662894361 perf db-export: Fix thread__exec_comm()
   532db2b9756a perf annotate: Fix s390 gap between kernel end and module start
   46b306f3cd7b mm/vmalloc: Sync unmappings in __purge_vmap_area_lazy()
   9935d7ed8406 x86/mm: Sync also unmappings in vmalloc_sync_all()
   dd524d488f5b x86/mm: Check for pfn instead of page in vmalloc_sync_one()
   b8a2169bcad8 Input: synaptics - enable RMI mode for HP Spectre X360
   3d180fe5cd76 Input: elantech - enable SMBus on new (2018+) systems
   ce7d4fe4e52b Input: usbtouchscreen - initialize PM mutex before using it
   c9a1c10487b9 loop: set PF_MEMALLOC_NOIO for the worker thread
   d79d76f2bbb0 mmc: cavium: Add the missing dma unmap when the dma has finished.
   fd3f902dd1d5 mmc: cavium: Set the correct dma max segment size for mmc_host
   9575ba61ba19 sound: fix a memory leak bug
   d397091dbac0 usb: iowarrior: fix deadlock on disconnect
   b43611cd762c usb: usbfs: fix double-free of usb memory upon submiturb error
   6dbc3b74daeb crypto: ccp - Ignore tag length when decrypting GCM ciphertext
   30692edea30d crypto: ccp - Add support for valid authsize values less than 16
   1c4393df3622 crypto: ccp - Fix oops by properly managing allocated structures
   b9de21575a20 staging: android: ion: Bail out upon SIGKILL when allocating memory.
   6b8f93b5a4f7 staging: gasket: apex: fix copy-paste typo
   fcab37830177 iio: adc: max9611: Fix misuse of GENMASK macro
   805bd34ac269 iio: cros_ec_accel_legacy: Fix incorrect channel setting
   893af1c79e42 Linux 4.19.66
   48fcdaba7b0d spi: bcm2835: Fix 3-wire mode if DMA is enabled
   ebda41dd170f cgroup: Fix css_task_iter_advance_css_set() cset skip condition
   0a9abd277819 cgroup: css_task_iter_skip()'d iterators must be advanced before accessed
   4340d175b898 cgroup: Include dying leaders with live threads in PROCS iterations
   370b9e6399da cgroup: Implement css_task_iter_skip()
   7528e95b7519 cgroup: Call cgroup_release() before __exit_signal()
   e6e9bcef12ca compat_ioctl: pppoe: fix PPPOEIOCSFWD handling
   473430ed6117 r8169: don't use MSI before RTL8168d
   0ccf47265e4c net/mlx5e: Prevent encap flow counter update async to user query
   cd84a10792f0 net/mlx5: Fix modify_cq_in alignment
   f378724e10ce tun: mark small packets as owned by the tap sock
   5295d6515485 tipc: compat: allow tipc commands without arguments
   eaa34bd4f7b5 ocelot: Cancel delayed work before wq destruction
   cd7f02fecac1 NFC: nfcmrvl: fix gpio-handling regression
   ce58a3655121 net/smc: do not schedule tx_work in SMC_CLOSED state
   51d240a144a5 net: sched: use temporary variable for actions indexes
   cb20f74135df net sched: update vlan action for batched events operations
   d82dc254b967 net: sched: Fix a possible null-pointer dereference in dequeue_func()
   44b96a38c2b5 net: qualcomm: rmnet: Fix incorrect UL checksum offload logic
   c8b05980c4bf net: phylink: Fix flow control for fixed-link
   4dddd08b571d net/mlx5: Use reversed order when unregister devices
   858f82c63667 net/mlx5e: always initialize frag->last_in_page
   edb7ad69c439 net: fix ifindex collision during namespace removal
   a19d4e34f092 net: bridge: mcast: don't delete permanent entries when fast leave is enabled
   639239be11ad net: bridge: delete local fdb on device init failure
   b3645a487373 mvpp2: refactor MTU change code
   ffab47bf69df mvpp2: fix panic on module removal
   3c46905fb182 mlxsw: spectrum: Fix error path in mlxsw_sp_module_init()
   f186fb5ccf69 ipip: validate header length in ipip_tunnel_xmit
   1bb2dd37cb87 ip6_tunnel: fix possible use-after-free on xmit
   fdcefa46c5c2 ip6_gre: reload ipv6h in prepare_ip6gre_xmit_ipv6
   c4c8899376c2 ife: error out when nla attributes are empty
   774358df88f7 bnx2x: Disable multi-cos feature.
   cb4626784f39 atm: iphase: Fix Spectre v1 vulnerability
   8440cdc77577 IB: directly cast the sockaddr union to aockaddr
   608cfdfa9eb7 HID: Add quirk for HP X1200 PIXART OEM mouse
   e830c2c3c174 HID: wacom: fix bit shift for Cintiq Companion 2
   2364ed0d8ed1 libnvdimm/bus: Fix wait_nvdimm_bus_probe_idle() ABBA deadlock
   7f000e7b4490 libnvdimm/bus: Prepare the nd_ioctl() path to be re-entrant
   3248536919c1 libnvdimm/region: Register badblocks before namespaces
   d16bbdbbcb50 libnvdimm/bus: Prevent duplicate device_unregister() calls
   c23106d4276d drivers/base: Introduce kill_device()
   7c43f84efd6d driver core: Establish order of operations for device_add and device_del via bitflag
   a152a7b411a5 gcc-9: don't warn about uninitialized variable
   93d6f0841eef scsi: fcoe: Embed fc_rport_priv in fcoe_rport structure
   cc4c818b2219 Linux 4.19.65
   7634b9cd27e8 Documentation: Add swapgs description to the Spectre v1 documentation
   b88241aef6f1 x86/speculation/swapgs: Exclude ATOMs from speculation through SWAPGS
   931b6bfe8af1 x86/entry/64: Use JMP instead of JMPQ
   23e7a7b3a75f x86/speculation: Enable Spectre v1 swapgs mitigations
   befb822c062b x86/speculation: Prepare entry code for Spectre v1 swapgs mitigations
   b5dd7f61fce4 x86/cpufeatures: Combine word 11 and 12 into a new scattered features word
   16ad0b63f382 x86/cpufeatures: Carve out CQM features retrieval
   9e034c61951a scsi: mpt3sas: Use 63-bit DMA addressing on SAS35 HBA
   3732a473be54 x86/vdso: Prevent segfaults due to hoisted vclock reads
   8320768d26aa gcc-9: properly declare the {pv,hv}clock_page storage
   354887ae3168 objtool: Support GCC 9 cold subfunction naming scheme
   89f3896b658b ARC: enable uboot support unconditionally
   8dd376273fb4 eeprom: at24: make spd world-readable again
   a7340d31abac drm/i915/gvt: fix incorrect cache entry for guest page mapping
   a1c020ce2669 IB/hfi1: Check for error on call to alloc_rsm_map_table
   e9cd4962a85b IB/mlx5: Fix RSS Toeplitz setup to be aligned with the HW specification
   924308d2a6ea IB/mlx5: Fix clean_mr() to work in the expected order
   7e5ce9f3943c IB/mlx5: Move MRs to a kernel PD when freeing them to the MR cache
   3cfa1087a172 IB/mlx5: Use direct mkey destroy command upon UMR unreg failure
   41be1928053a IB/mlx5: Fix unreg_umr to ignore the mkey state
   04fdca1f2f65 xen/swiotlb: fix condition for calling xen_destroy_contiguous_region()
   eb828241b491 nbd: replace kill_bdev() with __invalidate_device() again
   8dfef0f442c7 arm64: cpufeature: Fix feature comparison for CTR_EL0.{CWG,ERG}
   2bddc985656a arm64: compat: Allow single-byte watchpoints on all addresses
   c385cda0e70a drivers/perf: arm_pmu: Fix failure path in PM notifier
   5f80ac50b98c parisc: Fix build of compressed kernel even with debug enabled
   001f93d95d6c cgroup: kselftest: relax fs_spec checks
   6cb9e0d9ad3e s390/dasd: fix endless loop after read unit address configuration
   beb0cc781b8e mm: vmscan: check if mem cgroup is disabled or not before calling memcg slab shrinker
   72651bbdf3d5 ALSA: hda: Fix 1-minute detection delay when i915 module is not available
   46650ac2e1d8 selinux: fix memory leak in policydb_init()
   e7bb4c81b3c7 mtd: rawnand: micron: handle on-die "ECC-off" devices correctly
   fafaeae4d356 IB/hfi1: Fix Spectre v1 vulnerability
   fdb0fb56addb gpiolib: fix incorrect IRQ requesting of an active-low lineevent
   7e3efb655012 mmc: meson-mx-sdio: Fix misuse of GENMASK macro
   29841b5c6ab1 mmc: dw_mmc: Fix occasional hang after tuning on eMMC
   50d700408a00 Btrfs: fix race leading to fs corruption after transaction abort
   009d7a4eb329 Btrfs: fix incremental send failure after deduplication
   4c5a442561e8 kbuild: initialize CLANG_FLAGS correctly in the top Makefile
   3736612d2582 kconfig: Clear "written" flag to avoid data loss
   4c6500b5328f drm/nouveau: fix memory leak in nouveau_conn_reset()
   84ce045222e9 x86, boot: Remove multiple copy of static function sanitize_boot_params()
   740e0167a382 x86/paravirt: Fix callee-saved function ELF sizes
   ba5c072fbf8b x86/kvm: Don't call kvm_spurious_fault() from .fixup
   11cb9f8700c9 xen/pv: Fix a boot up hang revealed by int3 self test
   d3e36788d9be mlxsw: spectrum_dcb: Configure DSCP map as the last rule is removed
   48c5c4f0a47f ipc/mqueue.c: only perform resource calculation if user valid
   f87314225294 drivers/rapidio/devices/rio_mport_cdev.c: NUL terminate some strings
   35ee8b844845 uapi linux/coda_psdev.h: move upc_req definition from uapi to kernel side headers
   dea2ee496a85 coda: fix build using bare-metal toolchain
   cf3ddc00a47d coda: add error handling for fget
   93b83005ea87 lib/test_string.c: avoid masking memset16/32/64 failures
   8e087a2abaf8 lib/test_overflow.c: avoid tainting the kernel and fix wrap size
   439c79ed7718 mm/cma.c: fail if fixed declaration can't be honored
   1b84e67496d3 x86: math-emu: Hide clang warnings for 16-bit overflow
   242666b2b7e2 x86/apic: Silence -Wtype-limits compiler warnings
   ade866ad5aed be2net: Signal that the device cannot transmit during reconfiguration
   c0cca0e97ce4 ACPI: fix false-positive -Wuninitialized warning
   80f58147da0f x86: kvm: avoid constant-conversion warning
   d60e8c0cbccb perf version: Fix segfault due to missing OPT_END()
   abfe761a5358 scsi: zfcp: fix GCC compiler warning emitted with -Wmaybe-uninitialized
   d5568763dd1d ACPI: blacklist: fix clang warning for unused DMI table
   c47e25526071 ceph: return -ERANGE if virtual xattr value didn't fit in buffer
   b39c377ea08f ceph: fix improper use of smp_mb__before_atomic()
   d29fbf677963 cifs: Fix a race condition with cifs_echo_request
   f96c70fa810d btrfs: qgroup: Don't hold qgroup_ioctl_lock in btrfs_qgroup_inherit()
   d9245dabfce1 btrfs: fix minimum number of chunk errors for DUP
   e7fcc587e076 clk: sprd: Add check for return value of sprd_clk_regmap_init()
   a093208b4c73 fs/adfs: super: fix use-after-free bug
   85d854b42113 clk: tegra210: fix PLLU and PLLU_OUT1
   cf0fcc7fe200 dmaengine: rcar-dmac: Reject zero-length slave DMA requests
   a3524486535a MIPS: lantiq: Fix bitfield masking
   cdee3f53510a firmware/psci: psci_checker: Park kthreads before stopping them
   09ec6c6783ff kernel/module.c: Only return -EEXIST for modules that have finished loading
   fd53e45a11e9 arm64: dts: rockchip: fix isp iommu clocks and power domain
   d8388cbd4327 dmaengine: tegra-apb: Error out if DMA_PREP_INTERRUPT flag is unset
   f486088d38ec ftrace: Enable trampoline when rec count returns back to one
   ea26b427cb91 ARM: dts: rockchip: Mark that the rk3288 timer might stop in suspend
   22befe671728 ARM: dts: rockchip: Make rk3288-veyron-mickey's emmc work again
   8c5a33d34be6 ARM: dts: rockchip: Make rk3288-veyron-minnie run at hs200
   3c1d1bad8a57 ARM: riscpc: fix DMA
   b3060a1a313f Linux 4.19.64
   4736bb277744 ip_tunnel: allow not to count pkts on tstats by setting skb's dev to NULL
   475f7781a804 scsi: core: Avoid that a kernel warning appears during system resume
   c58a6507363b block, scsi: Change the preempt-only flag into a counter
   9b17512d9165 ceph: hold i_ceph_lock when removing caps for freeing inode
   b6c3b6a2c662 Fix allyesconfig output.
   135e7737e21f drivers/pps/pps.c: clear offset flags in PPS_SETPARAMS ioctl
   54695343b491 /proc/<pid>/cmdline: add back the setproctitle() special case
   54ffaa53e785 /proc/<pid>/cmdline: remove all the special cases
   a5a3915f17ab sched/fair: Use RCU accessors consistently for ->numa_group
   48046e092ad5 sched/fair: Don't free p->numa_faults with concurrent readers
   02cdc166128c vhost: scsi: add weight support
   239910101c4e vhost: vsock: add weight support
   3af3b843aee4 vhost_net: fix possible infinite loop
   ad5fc8953d61 vhost: introduce vhost_exceeds_weight()
   56966212e23f Bluetooth: hci_uart: check for missing tty operations
   3a0c22cbc5d0 iommu/iova: Fix compilation error with !CONFIG_IOMMU_IOVA
   4fd0eb60bad1 iommu/vt-d: Don't queue_iova() if there is no flush queue
   b3836af8560e media: radio-raremono: change devm_k*alloc to k*alloc
   afb5340f9438 NFS: Cleanup if nfs_match_client is interrupted
   8edcabb2c2e9 media: pvrusb2: use a different format for warnings
   8b44cc225e60 media: cpia2_usb: first wake up, then free in disconnect
   693019ee7d98 ath10k: Change the warning message string
   3cf6a0707088 media: au0828: fix null dereference in error path
   f13ee5ae0b2f ISDN: hfcsusb: checking idx of ep configuration
   22068d49d09d binder: fix possible UAF when freeing buffer
   ba2c247a4515 arm64: compat: Provide definition for COMPAT_SIGMINSTKSZ
   b544a6855dfb usb: dwc2: Fix disable all EP's on disconnect
   ec58bfa2d412 usb: dwc2: Disable all EP's on disconnect
   9e441c7844a6 NFSv4: Fix lookup revalidate of regular files
   24acd93f5995 NFS: Refactor nfs_lookup_revalidate()
   01eea1cbba9d NFS: Fix dentry revalidation on NFSv4 lookup
   8a474bc4e613 vsock: correct removal of socket from the list
   9d3586bcdae3 hv_sock: Add support for delayed close
   9a9de33a9dfa Linux 4.19.63
   408af82309a7 access: avoid the RCU grace period for the temporary subjective credentials
   1a547d24ec8a libnvdimm/bus: Stop holding nvdimm_bus_list_mutex over __nd_ioctl()
   b993a66d8ddc powerpc/tm: Fix oops on sigreturn on systems without TM
   b9310c56fcfb powerpc/xive: Fix loop exit-condition in xive_find_target_in_mask()
   c219444254cf ALSA: hda - Add a conexant codec entry to let mute led work
   491483ed70f1 ALSA: line6: Fix wrong altsetting for LINE6_PODHD500_1
   602744097b2e ALSA: ac97: Fix double free of ac97_codec_device
   9845fb5a3f90 hpet: Fix division by zero in hpet_time_div()
   e4c91583b39c mei: me: add mule creek canyon (EHL) device ids
   3d0a6926e610 fpga-manager: altera-ps-spi: Fix build error
   e907b1314481 binder: prevent transactions to context manager from its own process.
   7d20e3ba7072 x86/speculation/mds: Apply more accurate check on hypervisor platform
   5e87e8b4dc0c x86/sysfb_efi: Add quirks for some devices with swapped width and height
   e3dc9ea5464e btrfs: inode: Don't compress if NODATASUM or NODATACOW set
   1f37bec82f41 usb: pci-quirks: Correct AMD PLL quirk detection
   41d3dbb931c0 usb: wusbcore: fix unbalanced get/put cluster_id
   148959cc64e1 locking/lockdep: Hide unused 'class' variable
   b07687243d4a mm: use down_read_killable for locking mmap_sem in access_remote_vm
   4acb04ef5e42 locking/lockdep: Fix lock used or unused stats error
   af0883f9dcf6 proc: use down_read_killable mmap_sem for /proc/pid/maps
   0d72bb853afc cxgb4: reduce kernel stack usage in cudbg_collect_mem_region()
   6ecdcbcd3091 proc: use down_read_killable mmap_sem for /proc/pid/map_files
   3d617da8a956 proc: use down_read_killable mmap_sem for /proc/pid/clear_refs
   42beb7b3d446 proc: use down_read_killable mmap_sem for /proc/pid/pagemap
   1b3042d0d32b proc: use down_read_killable mmap_sem for /proc/pid/smaps_rollup
   a8c568fc4832 mm/mmu_notifier: use hlist_add_head_rcu()
   3062448e3ee2 memcg, fsnotify: no oom-kill for remote memcg charging
   041b127df733 mm/gup.c: remove some BUG_ONs from get_gate_page()
   fa099d6ddf68 mm/gup.c: mark undo_dev_pagemap as __maybe_unused
   8be4a30e2d34 9p: pass the correct prototype to read_cache_page
   071f2135cfec mm/kmemleak.c: fix check for softirq context
   7bd5902a1e18 sh: prevent warnings when using iounmap
   af50d6a1c245 block/bio-integrity: fix a memory leak bug
   7f775a67abe4 powerpc/eeh: Handle hugepages in ioremap space
   e7a41b276974 dlm: check if workqueues are NULL before flushing/destroying
   5d59e28c3d1b mailbox: handle failed named mailbox channel request
   2140a6b03a61 f2fs: avoid out-of-range memory access
   8a1a3d383923 block: init flush rq ref count to 1
   4b9dc73a0d4a powerpc/boot: add {get, put}_unaligned_be32 to xz_config.h
   549f726fb094 PCI: dwc: pci-dra7xx: Fix compilation when !CONFIG_GPIOLIB
   367cc371a8e3 RDMA/rxe: Fill in wc byte_len with IB_WC_RECV_RDMA_WITH_IMM
   4fe7ea29e4a6 perf hists browser: Fix potential NULL pointer dereference found by the smatch tool
   915945f3bdc2 perf annotate: Fix dereferencing freed memory found by the smatch tool
   b305dcff1518 perf session: Fix potential NULL pointer dereference found by the smatch tool
   19cf571c64b7 perf top: Fix potential NULL pointer dereference detected by the smatch tool
   995527db41f6 perf stat: Fix use-after-freed pointer detected by the smatch tool
   3b8c4eae5541 perf test mmap-thread-lookup: Initialize variable to suppress memory sanitizer warning
   dd0a0c72a10f PCI: mobiveil: Use the 1st inbound window for MEM inbound transactions
   270972df68fb PCI: mobiveil: Initialize Primary/Secondary/Subordinate bus numbers
   9eb4f2886db3 kallsyms: exclude kasan local symbols on s390
   4613f46ef472 PCI: mobiveil: Fix the Class Code field
   51308ec525cc PCI: mobiveil: Fix PCI base address in MEM/IO outbound windows
   05959ed85e34 arm64: assembler: Switch ESB-instruction with a vanilla nop if !ARM64_HAS_RAS
   007b01a27d4d IB/ipoib: Add child to parent list only if device initialized
   d48720bafd90 powerpc/mm: Handle page table allocation failures
   f14537bb81d1 IB/mlx5: Fixed reporting counters on 2nd port for Dual port RoCE
   d03aeb8d6b98 serial: sh-sci: Fix TX DMA buffer flushing and workqueue races
   48c73b8ee5c9 serial: sh-sci: Terminate TX DMA during buffer flushing
   ca730bf0cd67 RDMA/i40iw: Set queue pair state when being queried
   52373ab6a6c7 powerpc/4xx/uic: clear pending interrupt after irq type/pol change
   74520144700d um: Silence lockdep complaint about mmap_sem
   30edc7c1fed5 mm/swap: fix release_pages() when releasing devmap pages
   b4e77006d5a7 mfd: hi655x-pmic: Fix missing return value check for devm_regmap_init_mmio_clk
   9b1691c3f660 mfd: arizona: Fix undefined behavior
   d9c74176c275 mfd: core: Set fwnode for created devices
   7b24a4a363a9 mfd: madera: Add missing of table registration
   e00cf1dac30c recordmcount: Fix spurious mcount entries on powerpc
   9fac39480e39 powerpc/xmon: Fix disabling tracing while in xmon
   a80f67d5560c powerpc/cacheflush: fix variable set but not used
   b150423e0d5e iio: iio-utils: Fix possible incorrect mask calculation
   fc9c15c4e3ff PCI: xilinx-nwl: Fix Multi MSI data programming
   e3e2bb12c8a7 genksyms: Teach parser about 128-bit built-in types
   27f2335e1440 kbuild: Add -Werror=unknown-warning-option to CLANG_FLAGS
   1fa94381fdeb i2c: stm32f7: fix the get_irq error cases
   f930727faef2 PCI: sysfs: Ignore lockdep for remove attribute
   9d45fbee76af serial: mctrl_gpio: Check if GPIO property exisits before requesting it
   e7f206f42fb6 drm/msm: Depopulate platform on probe failure
   216462fa884f powerpc/pci/of: Fix OF flags parsing for 64bit BARs
   5d3ad905af43 mmc: sdhci: sdhci-pci-o2micro: Check if controller supports 8-bit width
   bf7cf9fb02db usb: gadget: Zero ffs_io_data
   ac380eb479de tty: serial_core: Set port active bit in uart_port_activate
   785e11c06db3 serial: imx: fix locking in set_termios()
   741f8b39b6d4 drm/rockchip: Properly adjust to a true clock in adjusted_mode
   fd0d171c7064 powerpc/pseries/mobility: prevent cpu hotplug during DT update
   6a7047471073 drm/amd/display: fix compilation error
   709ca46f1d46 phy: renesas: rcar-gen2: Fix memory leak at error paths
   725c7b781150 drm/virtio: Add memory barriers for capset cache.
   11b4e9f3695c drm/amd/display: Always allocate initial connector state state
   1a2425b597fa serial: 8250: Fix TX interrupt handling condition
   a0e7d6b7fa55 tty: serial: msm_serial: avoid system lockup condition
   e40f5a873fc7 tty/serial: digicolor: Fix digicolor-usart already registered warning
   5c0e54839d48 memstick: Fix error cleanup path of memstick_init
   0a50a272389f drm/crc-debugfs: Also sprinkle irqrestore over early exits
   26a66454541c drm/crc-debugfs: User irqsafe spinlock in drm_crtc_add_crc_entry
   4d14323a2eb5 gpu: host1x: Increase maximum DMA segment size
   f9bfd6bd8223 drm/bridge: sii902x: pixel clock unit is 10kHz instead of 1kHz
   7af9abd7d6bd drm/bridge: tc358767: read display_props in get_modes()
   49c7230d8f10 PCI: Return error if cannot probe VF
   2a18d76592e0 drm/edid: Fix a missing-check bug in drm_load_edid_firmware()
   210dfe630911 drm/amdkfd: Fix sdma queue map issue
   db64bc139440 drm/amdkfd: Fix a potential memory leak
   6b1d2871fe36 drm/amd/display: Disable ABM before destroy ABM struct
   c242a531bb06 drm/amdgpu/sriov: Need to initialize the HDP_NONSURFACE_BAStE
   147137f86b5b drm/amd/display: Fill prescale_params->scale for RGB565
   08b0bcc8076b tty: serial: cpm_uart - fix init when SMC is relocated
   c901780d9294 pinctrl: rockchip: fix leaked of_node references
   a9dfb6e43677 tty: max310x: Fix invalid baudrate divisors calculator
   b0084c1b5058 usb: core: hub: Disable hub-initiated U1/U2
   19755a124f4c staging: vt6656: use meaningful error code during buffer allocation
   b59f7650a507 iio: adc: stm32-dfsdm: missing error case during probe
   302e4cdca1f4 iio: adc: stm32-dfsdm: manage the get_irq error case
   586946ce83e4 drm/panel: simple: Fix panel_simple_dsi_probe
   49fb03de361d hvsock: fix epollout hang from race condition
   64f4694072aa Linux 4.19.62
   60e9babfda94 net: sched: verify that q!=NULL before setting q->flags
   c1d98b766ebe mm: vmscan: scan anonymous pages on file refaults
   7560e33369ed KVM: nVMX: Clear pending KVM_REQ_GET_VMCS12_PAGES when leaving nested
   967bc679c596 KVM: nVMX: do not use dangling shadow VMCS after guest reset
   3a17ca864baf ext4: allow directory holes
   caa4e08253eb ext4: use jbd2_inode dirty range scoping
   af3812b65c37 jbd2: introduce jbd2_inode dirty range scoping
   4becd6c11e9a mm: add filemap_fdatawait_range_keep_errors()
   c9ea4620a37f ext4: enforce the immutable flag on open files
   29171e82348c ext4: don't allow any modifications to an immutable file
   4a5cc64d8a8a perf/core: Fix race between close() and fork()
   75100ec5f079 perf/core: Fix exclusive events' grouping
   0e6ef184315d MIPS: lb60: Fix pin mappings
   dd5994ab1f00 gpio: davinci: silence error prints in case of EPROBE_DEFER
   c947cf3e9583 dma-buf: Discard old fence_excl on retrying get_fences_rcu for realloc
   95ee55cab118 dma-buf: balance refcount inbalance
   b72fb8dec183 net: bridge: stp: don't cache eth dest pointer before skb pull
   78701843ecc4 net: bridge: don't cache ether dest pointer on input
   41a8df71809e net: bridge: mcast: fix stale ipv6 hdr pointer when handling v6 query
   caf4488fc06e net: bridge: mcast: fix stale nsrcs pointer in igmp3/mld2 report handling
   bc9a2f36a7d6 sctp: not bind the socket in sctp_connect
   fde351aeff4a net/tls: make sure offload also gets the keys wiped
   d9571a9f5ec1 net_sched: unset TCQ_F_CAN_BYPASS when adding filters
   69cd58454615 netrom: hold sock when setting skb->destructor
   dc59a2abd33e netrom: fix a memory leak in nr_rx_frame()
   0c5cb5a12623 macsec: fix checksumming after decryption
   21252f49cddf macsec: fix use-after-free of skb during RX
   a8ba53da071e net/mlx5e: IPoIB, Add error path in mlx5_rdma_setup_rn
   a2aa162a6331 vrf: make sure skb->data contains ip header to make routing
   1b200acde418 tcp: Reset bytes_acked and bytes_received when disconnecting
   c60f57dfe995 tcp: fix tcp_set_congestion_control() use from bpf hook
   6323c238bb43 tcp: be more careful in tcp_fragment()
   b640ade07295 sky2: Disable MSI on ASUS P6T
   d9ee5afd9165 sctp: fix error handling on stream scheduler initialization
   bfa7913575b7 rxrpc: Fix send on a connected, but unbound socket
   3e4e6b71ece0 r8169: fix issue with confused RX unit after PHY power-down on RTL8411b
   97739e5c9e73 nfc: fix potential illegal memory access
   f47f68cc9d33 net: stmmac: Re-work the queue selection for TSO packets
   201d7d62a82a net: phy: sfp: hwmon: Fix scaling of RX power
   c60bce64615d net: openvswitch: fix csum updates for MPLS actions
   257441a07201 net: neigh: fix multiple neigh timer scheduling
   832d0ea751a8 net: make skb_dst_force return true when dst is refcounted
   6ab30a4cc5c6 net: dsa: mv88e6xxx: wait after reset deactivation
   5832ef4afd90 net: bcmgenet: use promisc for unsupported filters
   c0f4a6447977 ipv6: Unlink sibling route in case of failure
   0bd84505f16f ipv6: rt6_check should return NULL if 'from' is NULL
   47ce442783d7 ipv4: don't set IPv6 only flags to IPv4 addresses
   aee5dd00341b igmp: fix memory leak in igmpv3_del_delrec()
   9770fe1b202f hv_netvsc: Fix extra rcu_read_unlock in netvsc_recv_callback()
   d7cdac6dc418 caif-hsi: fix possible deadlock in cfhsi_exit_module()
   8fb37be12046 bnx2x: Prevent load reordering in tx completion processing
   7250956f6eaf Linux 4.19.61
   025eb12bb4b0 dm bufio: fix deadlock with loop device
   404f59e265ac dt-bindings: allow up to four clocks for orion-mdio
   03e6a668ea1f net: mvmdio: allow up to four clocks to be specified for orion-mdio
   dd87cc633ba5 blkcg: update blkcg_print_stat() to handle larger outputs
   73efdc5d7d3b blk-iolatency: clear use_delay when io.latency is set to zero
   1ab644bd02ab blk-throttle: fix zero wait time for iops throttled group
   91da712ff592 usb: Handle USB3 remote wakeup for LPM enabled devices correctly
   152ddf9f0458 Bluetooth: Add SMP workaround Microsoft Surface Precision Mouse bug
   98318cd31b95 intel_th: msu: Fix single mode with disabled IOMMU
   d6328d7c1a71 mtd: spinand: read returns badly if the last page has bitflips
   94f1db42a968 mtd: rawnand: mtk: Correct low level time calculation of r/w cycle
   30c6b34759f6 eCryptfs: fix a couple type promotion bugs
   92e23f5fc049 mmc: sdhci-msm: fix mutex while in spinlock
   01982f7bcc9d powerpc/pseries: Fix oops in hotplug memory notifier
   e725502b8548 powerpc/powernv/npu: Fix reference leak
   1e3b61cbc30d powerpc/watchpoint: Restore NV GPRs while returning from exception
   237ac0d73b55 powerpc/32s: fix suspend/resume when IBATs 4-7 are used
   7961981718d6 parisc: Fix kernel panic due invalid values in IAOQ0 or IAOQ1
   a6a0daa775e8 parisc: Ensure userspace privilege for ptraced processes in regset functions
   ef5c2e165ab0 crypto: caam - limit output IV to CBC to work around CTR mode DMA issue
   376b80276d84 gpu: ipu-v3: ipu-ic: Fix saturation bit offset in TPMEM
   ef30c0739439 xfs: abort unaligned nowait directio early
   669c867972c0 xfs: serialize unaligned dio writes against all other dio writes
   d61d885b17b0 xfs: fix reporting supported extra file attributes for statx()
   f614ef7a34b0 xfs: reserve blocks for ifree transaction during log recovery
   424543a53ae0 xfs: don't ever put nlink > 0 inodes on the unlinked list
   3a895cc066c0 xfs: rename m_inotbt_nores to m_finobt_nores
   2ab62234e823 xfs: don't overflow xattr listent buffer
   1dc8b13cc66d xfs: flush removing page cache in xfs_reflink_remap_prep
   788920d12b95 xfs: fix pagecache truncation prior to reflink
   41f64437f030 include/asm-generic/bug.h: fix "cut here" for WARN_ON for __WARN_TAINT architectures
   afa3e571cde3 coda: pass the host file in vma->vm_file on mmap
   2c0222b48e77 libnvdimm/pfn: fix fsdax-mode namespace info-block zero-fields
   656d06dab4d6 HID: wacom: correct touch resolution x/y typo
   1c871b4006b2 HID: wacom: generic: Correct pad syncing
   46f71a15abe7 HID: wacom: generic: only switch the mode on devices with LEDs
   cb4c2b94f629 IB/mlx5: Report correctly tag matching rendezvous capability
   4bd953241d81 Btrfs: add missing inode version, ctime and mtime updates when punching hole
   fffedf5cf67e Btrfs: fix fsync not persisting dentry deletions due to inode evictions
   110850fffeb0 Btrfs: fix data loss after inode eviction, renaming it, and fsync it
   6b71c62ea9da PCI: qcom: Ensure that PERST is asserted for at least 100 ms
   529e71cae929 PCI: Do not poll for PME if the device is in D3cold
   4d8504004c86 PCI: hv: Fix a use-after-free bug in hv_eject_device_work()
   f0ff76a42ef5 intel_th: pci: Add Ice Lake NNPI support
   66a13b5e4e9c drm/edid: parse CEA blocks embedded in DisplayID
   9854e06842bc perf/x86/amd/uncore: Set the thread mask for F17h L3 PMCs
   82c46f7b0918 perf/x86/amd/uncore: Do not set 'ThreadMask' and 'SliceMask' for non-L3 PMCs
   a847a5225432 perf/x86/intel: Fix spurious NMI on fixed counter
   0d4c0bb70665 x86/boot: Fix memory leak in default_get_smp_config()
   b52807e607f1 9p/virtio: Add cleanup path in p9_virtio_init
   1253882d64d0 9p/xen: Add cleanup path in p9_trans_xen_init
   007e5aaf287c xen/events: fix binding user event channels to cpus
   e380170b3b3a dm zoned: fix zone state management race
   1e4247d7958b padata: use smp_mb in padata_reorder to avoid orphaned padata jobs
   0489d808a5f2 drm/nouveau/i2c: Enable i2c pads & busses during preinit
   c77cbc873586 kconfig: fix missing choice values in auto.conf
   2c7b50c7b1d0 fs/proc/proc_sysctl.c: fix the default values of i_uid/i_gid on /proc/sys inodes.
   ba271659ad42 arm64: tegra: Fix AGIC register range
   ba27a25df6df KVM: x86/vPMU: refine kvm_pmu err msg when event creation failed
   87bae91a0fe9 media: videobuf2-dma-sg: Prevent size from overflowing
   cb2e2b0ae554 media: videobuf2-core: Prevent size alignment wrapping buffer size to 0
   deb78bd24e0c media: coda: Remove unbalanced and unneeded mutex unlock
   fc0232e24541 media: v4l2: Test type instead of cfg->type in v4l2_ctrl_new_custom()
   a4c4c06f1755 ALSA: hda/realtek: apply ALC891 headset fixup to one Dell machine
   8ba78e4d564e ALSA: hda/realtek - Fixed Headphone Mic can't record on Dell platform
   c92212a81617 ALSA: seq: Break too long mutex context in the write loop
   eb6c84e4b4f2 raid5-cache: Need to do start() part job after adding journal device
   3f42c0000b23 ASoC: dapm: Adapt for debugfs API change
   677b2aa3be5c lib/scatterlist: Fix mapping iterator when sg->offset is greater than PAGE_SIZE
   0b174bac4e43 pnfs: Fix a problem where we gratuitously start doing I/O through the MDS
   f64ff5914f00 pNFS: Fix a typo in pnfs_update_layout
   603e7497bf27 pnfs/flexfiles: Fix PTR_ERR() dereferences in ff_layout_track_ds_error
   5347e61954fc NFSv4: Handle the special Linux file open access mode
   6825ff011c7c iwlwifi: fix RF-Kill interrupt while FW load for gen2 devices
   a32e2ceca0ef iwlwifi: don't WARN when calling iwl_get_shared_mem_conf with RF-Kill
   d9ce0788da91 iwlwifi: pcie: fix ALIVE interrupt handling for gen2 devices w/o MSI-X
   04c52c105a38 iwlwifi: pcie: don't service an interrupt that was masked
   7ebddd5fe217 arm64: tegra: Update Jetson TX1 GPU regulator timings
   042451b921b1 regulator: s2mps11: Fix buck7 and buck8 wrong voltages
   8da63aa46e26 Input: alps - fix a mismatch between a condition check and its comment
   81368a9a98d9 Input: synaptics - whitelist Lenovo T580 SMBus intertouch
   cfb9250619c8 Input: alps - don't handle ALPS cs19 trackpoint-only device
   d657077eda7b Input: gtco - bounds check collection indent level
   f11ba9df8eed bcache: destroy dc->writeback_write_wq if failed to create dc->writeback_thread
   2ab14861d2eb bcache: fix mistaken sysfs entry for io_error counter
   3c466df8fc59 bcache: ignore read-ahead request failure on backing device
   4fc48cd21a31 bcache: Revert "bcache: free heap cache_set->flush_btree in bch_journal_free"
   ab966241d59a bcache: Revert "bcache: fix high CPU occupancy during journal"
   58169c189bd6 Revert "bcache: set CACHE_SET_IO_DISABLE in bch_cached_dev_error()"
   c3b7d27f3746 crypto: crypto4xx - fix a potential double free in ppc4xx_trng_probe
   a9fd1795fee6 crypto: ccp/gcm - use const time tag comparison.
   561c4424f1e3 crypto: ccp - memset structure fields to zero before reuse
   13805a5df489 crypto: crypto4xx - block ciphers should only accept complete blocks
   17e63172d536 crypto: crypto4xx - fix blocksize for cfb and ofb
   4598094d24c7 crypto: crypto4xx - fix AES CTR blocksize value
   1c9b0a766513 crypto: chacha20poly1305 - fix atomic sleep when using async algorithm
   eb99c084da28 crypto: arm64/sha2-ce - correct digest for empty data in finup
   4230e09e61e6 crypto: arm64/sha1-ce - correct digest for empty data in finup
   52f07c1ac70e crypto: ccp - Validate the the error value used to index error messages
   bed97f646997 crypto: ghash - fix unaligned memory access in ghash_setkey()
   ce7ec07abaf7 scsi: mac_scsi: Fix pseudo DMA implementation, take 2
   de769c762626 scsi: mac_scsi: Increase PIO/PDMA transfer length threshold
   3e9534fa5046 scsi: megaraid_sas: Fix calculation of target ID
   1334a3e2d6d0 scsi: core: Fix race on creating sense cache
   58f59f6072ab Revert "scsi: ncr5380: Increase register polling limit"
   7cfded7a705c scsi: NCR5380: Always re-enable reselection interrupt
   d91baba81a6e scsi: NCR5380: Reduce goto statements in NCR5380_select()
   e73db096691e xen: let alloc_xenballooned_pages() fail if not enough memory free
   ff54c44f1038 floppy: fix out-of-bounds read in copy_buffer
   a9444d9d0f6f floppy: fix invalid pointer dereference in drive_name
   5b565f3276f3 floppy: fix out-of-bounds read in next_valid_format
   6e34fd07484a floppy: fix div-by-zero in setup_format_params
   7c16c5eae41a iavf: fix dereference of null rx_buffer pointer
   e9896b29d010 net: mvmdio: defer probe of orion-mdio if a clock is not ready
   5f6c5f5ae25e gtp: fix use-after-free in gtp_newlink()
   141222216438 gtp: fix use-after-free in gtp_encap_destroy()
   0a5eca2c949c gtp: fix Illegal context switch in RCU read-side critical section.
   e117a04133c6 gtp: fix suspicious RCU usage
   202de90df2b7 Bluetooth: validate BLE connection interval updates
   ca33af18b5fc gtp: add missing gtp_encap_disable_sock() in gtp_encap_enable()
   0fdb922d0ef0 Bluetooth: Check state in l2cap_disconnect_rsp
   3b57b7a3a82a perf tests: Fix record+probe_libc_inet_pton.sh for powerpc64
   c814f618b799 Bluetooth: 6lowpan: search for destination address in all peers
   c82c4910e9e6 Bluetooth: Add new 13d3:3501 QCA_ROME device
   1cbce19bd697 Bluetooth: Add new 13d3:3491 QCA_ROME device
   578658df21d5 Bluetooth: hci_bcsp: Fix memory leak in rx_skb
   9d47bd217539 tools: bpftool: Fix json dump crash on powerpc
   2ad04d31bb3e gpiolib: Fix references to gpiod_[gs]et_*value_cansleep() variants
   157d1c7a1a00 bonding: validate ip header before check IPPROTO_IGMP
   88f751b066f2 selftests: bpf: fix inlines in test_lwt_seg6local
   ef5b204336b3 bpf, libbpf, smatch: Fix potential NULL pointer dereference
   0f2f2cebe64d rxrpc: Fix oops in tracepoint
   ca37b9a74689 net: usb: asix: init MAC address buffers
   51216937c319 bnx2x: Prevent ptp_task to be rescheduled indefinitely
   e358d2ab42f8 perf stat: Fix group lookup for metric group
   a64e018be77a perf stat: Make metric event lookup more robust
   7343178ccf7d bpf: fix uapi bpf_prog_info fields alignment
   af3790a46a55 iwlwifi: mvm: Drop large non sta frames
   036184af23e0 igb: clear out skb->tstamp after reading the txtime
   0024b12b776c net: mvpp2: prs: Don't override the sign bit in SRAM parser shift
   05592b9b7f25 ath10k: destroy sdio workqueue while remove sdio module
   26d86b29e806 net: hns3: add some error checking in hclge_tm module
   ddfdbcccd71a net: hns3: fix a -Wformat-nonliteral compile warning
   95d084809495 bcache: fix potential deadlock in cached_def_free()
   4b7758e9c4ed bcache: check c->gc_thread by IS_ERR_OR_NULL in cache_set_flush()
   81b88c05bc45 bcache: acquire bch_register_lock later in cached_dev_free()
   d81080a0bcf8 bcache: check CACHE_SET_IO_DISABLE bit in bch_journal()
   57cfb755c356 bcache: check CACHE_SET_IO_DISABLE in allocator code
   e78d1d234469 EDAC: Fix global-out-of-bounds write when setting edac_mc_poll_msec
   e54cc89e6f0a wil6210: drop old event after wmi_call timeout
   0388597d0627 crypto: asymmetric_keys - select CRYPTO_HASH where needed
   1dea395c9e12 crypto: serpent - mark __serpent_setkey_sbox noinline
   b346070c72cd ixgbe: Check DDM existence in transceiver before access
   0340c621eca8 rslib: Fix handling of of caller provided syndrome
   8ba93c59441a rslib: Fix decoding of shortened codes
   dad0b17e4a4e xsk: Properly terminate assignment in xskq_produce_flush_desc
   e69fac59c493 clocksource/drivers/exynos_mct: Increase priority over ARM arch timer
   12e20eca894b libata: don't request sense data on !ZAC ATA devices
   6e6bc34f8570 ASoC: Intel: hdac_hdmi: Set ops to NULL on remove
   1182ff224847 perf tools: Increase MAX_NR_CPUS and MAX_CACHES
   7201cc227d4a ath10k: fix PCIE device wake up failed
   8a808fadc9f7 ath10k: add missing error handling
   fe2ceeb4cffc ipvs: fix tinfo memory leak in start_sync_thread
   20de38d282b3 mt7601u: fix possible memory leak when the device is disconnected
   033577880135 x86/build: Add 'set -e' to mkcapflags.sh to delete broken capflags.c
   3f7952b275c8 mt7601u: do not schedule rx_tasklet when the device has been disconnected
   6f6e126e1995 rtlwifi: rtl8192cu: fix error handle when usb probe failed
   41864adfee2e net: stmmac: sun8i: force select external PHY when no internal one
   bce037abc29f media: hdpvr: fix locking and a missing msleep
   43b9fdc48377 media: vimc: cap: check v4l2_fill_pixfmt return value
   d562537dbf0d media: coda: increment sequence offset for the last returned frame
   3697c12c4425 media: coda: fix last buffer handling in V4L2_ENC_CMD_STOP
   6fd3e9f65db9 media: coda: fix mpeg2 sequence number handling
   c647c00f28af acpi/arm64: ignore 5.1 FADTs that are reported as 5.0
   b9f547b7bdd9 timer_list: Guard procfs specific code
   d86c0b73f75b ntp: Limit TAI-UTC offset
   8d8f0b9009d0 media: i2c: fix warning same module names
   6439110fbeee media: s5p-mfc: Make additional clocks optional
   57de3c78f0b7 ipvs: defer hook registration to avoid leaks
   06a3cd416224 ipsec: select crypto ciphers for xfrm_algo
   723ba7938492 arm64: Do not enable IRQs for ct_user_exit
   010bfbc93424 lightnvm: pblk: fix freeing of merged pages
   762bba1b7ee7 nvme-pci: set the errno on ctrl state change error
   c876a66553d7 nvme-pci: properly report state change failure in nvme_reset_work
   f0c83dd15ee1 nvme: fix possible io failures when removing multipathed ns
   10cc3a65a55b EDAC/sysfs: Fix memory leak when creating a csrow object
   f6502ce4f050 ACPICA: Clear status of GPEs on first direct enable
   3ae98dc2db1e blk-iolatency: only account submitted bios
   a952f7c384aa x86/cacheinfo: Fix a -Wtype-limits warning
   3252b29ea41b ipoib: correcly show a VF hardware address
   0e2af9b06c00 vhost_net: disable zerocopy by default
   4c57957ed6c8 perf evsel: Make perf_evsel__name() accept a NULL argument
   9e0bcb59b6c0 x86/atomic: Fix smp_mb__{before,after}_atomic()
   dd0260fd1e3a perf/x86/intel/uncore: Handle invalid event coding for free-running counter
   7fc96cd2b0de sched/fair: Fix "runnable_avg_yN_inv" not used warnings
   d8b7db6c5004 sched/core: Add __sched tag for io_schedule()
   930655b01367 xfrm: fix sa selector validation
   b7d66bbc8ad3 blkcg, writeback: dead memcgs shouldn't contribute to writeback ownership arbitration
   c8f75e753784 block: null_blk: fix race condition for null_del_dev
   1a3706d8f800 net: hns3: fix for skb leak when doing selftest
   6a47a42f51cf qed: iWARP - Fix tc for MPA ll2 connection
   670fb965da03 x86/cpufeatures: Add FDP_EXCPTN_ONLY and ZERO_FCS_FDS
   366ae49ed78c rcu: Force inlining of rcu_read_lock()
   1fb3ce14f28d ASoC: meson: axg-tdm: fix sample clock inversion
   32df4043aed4 x86/cpu: Add Ice Lake NNPI to Intel family
   914026d58100 selinux: fix empty write to keycreate file
   10e3788e6575 media: s5p-mfc: fix reading min scratch buffer size on MFC v6/v7
   7c10f8941b95 bpf: silence warning messages in core
   b01bf44c363d regmap: fix bulk writes on paged registers
   544cd592ca72 gpio: omap: ensure irq is enabled before wakeup
   ddeef7a00050 gpio: omap: fix lack of irqstatus_raw0 for OMAP4
   79644b600850 iommu: Fix a leak in iommu_insert_resv_region
   f2a4624be8f3 media: fdp1: Support M3N and E3 platforms
   63e53991d791 media: uvcvideo: Fix access to uninitialized fields on probe error
   c844f4da9b92 irqchip/meson-gpio: Add support for Meson-G12A SoC
   eac8b39d089a perf report: Fix OOM error in TUI mode on s390
   be32a9dc3f62 perf test 6: Fix missing kvm module load for s390
   3662d8bca087 perf cs-etm: Properly set the value of 'old' and 'head' in snapshot mode
   ac510285d40b ipset: Fix memory accounting for hash types on resize
   c7bf2df45044 net: sfp: add mutex to prevent concurrent state checks
   fa4059c5497e RAS/CEC: Fix pfn insertion
   99dcd701465f s390/qdio: handle PENDING state for QEBSM devices
   a76f32cbd38c net: axienet: Fix race condition causing TX hang
   9d643358386d net: fec: Do not use netdev messages too early
   403c43921479 crypto: inside-secure - do not rely on the hardware last bit for result descriptors
   50331c64f3dd net: stmmac: modify default value of tx-frames
   1a0a837afc41 net: stmmac: dwmac4: fix flow control issue
   713737cac327 perf jvmti: Address gcc string overflow warning for strncpy()
   fb83987cbe6b arm64: mm: make CONFIG_ZONE_DMA32 configurable
   c360eb592938 cpupower : frequency-set -r option misses the last cpu in related cpu list
   cac3032062e5 net: hns3: set ops to null when unregister ad_dev
   35407917b0bc media: wl128x: Fix some error handling in fm_v4l2_init_video_device()
   2fbde2746597 locking/lockdep: Fix merging of hlocks with non-zero references
   909034b8ac64 batman-adv: Fix duplicated OGMs on NETDEV_UP
   aa2ad8b6fb2f tua6100: Avoid build warnings.
   9072450736d0 crypto: talitos - Align SEC1 accesses to 32 bits boundaries.
   9d25aedef08f crypto: talitos - properly handle split ICV.
   fc25cfb03ea2 net: phy: Check against net_device being NULL
   ef10d46d04a5 media: staging: media: davinci_vpfe: - Fix for memory leak if decoder initialization fails.
   e36f25627362 media: saa7164: fix remove_proc_entry warning
   ea904c9f6a33 media: mc-device.c: don't memset __user pointer contents
   a6dd4862b98f perf annotate TUI browser: Do not use member from variable within its own initialization
   71b029a5d908 fscrypt: clean up some BUG_ON()s in block encryption/decryption
   2c6acf7478aa xfrm: Fix xfrm sel prefix length validation
   0544b64ceb64 af_key: fix leaks in key_pol_get_resp and dump_sp.
   b397462a010d signal/pid_namespace: Fix reboot_pid_ns to use send_sig not force_sig
   1c8e736115cd qed: Set the doorbell address correctly
   df6680de7a20 net: stmmac: dwmac4/5: Clear unused address entries
   d3969670cb5a net: stmmac: dwmac1000: Clear unused address entries
   810441651a8a media: media_device_enum_links32: clean a reserved field
   6fb470ace862 media: vpss: fix a potential NULL pointer dereference
   70da38e80509 media: marvell-ccic: fix DMA s/g desc number calculation
   add712b63185 media: ov7740: avoid invalid framesize setting
   b0e199e13495 crypto: talitos - fix skcipher failure due to wrong output IV
   6452712f95e3 media: spi: IR LED: add missing of table registration
   94f2b518a788 media: dvb: usb: fix use after free in dvb_usb_device_exit
   8f855c09e2af batman-adv: fix for leaked TVLV handler.
   83d133c96aad regmap: debugfs: Fix memory leak in regmap_debugfs_init
   2b5b12c0c1b7 ath: DFS JP domain W56 fixed pulse type 3 RADAR detection
   da153c0c5746 wil6210: fix spurious interrupts in 3-msi
   a4bf4fecff16 ath10k: add peer id check in ath10k_peer_find_by_id
   83c911f4bd68 ath6kl: add some bounds checking
   42dcbf20e182 ath9k: Check for errors when reading SREV register
   7e19e658e535 ath10k: Do not send probe response template for mesh
   009edc622bba wil6210: fix potential out-of-bounds read
   09593c25b975 dmaengine: imx-sdma: fix use-after-free on probe error path
   06e15cf5aead scsi: iscsi: set auth_protocol back to NULL if CHAP_A value is not supported
   37cb02da44dc arm64/efi: Mark __efistub_stext_offset as an absolute symbol explicitly
   73ebefc814ef MIPS: fix build on non-linux hosts
   7202df6be6ec MIPS: ath79: fix ar933x uart parity mode
   be9b6782a9eb Linux 4.19.60
   d173ce091c1a x86/entry/32: Fix ENDPROC of common_spurious
   466bdfc6c4d6 drm/udl: move to embedding drm device inside udl device.
   af48f7d79fae drm/udl: Replace drm_dev_unref with drm_dev_put
   cfd99eccede5 drm/udl: introduce a macro to convert dev to udl.
   8f14cf159e9f regmap-irq: do not write mask register if mask_base is zero
   820b010743ee crypto/NX: Set receive window credits to max number of CRBs in RxFIFO
   b24c6403633d crypto: talitos - fix hash on SEC1.
   ff1ce8ef1f88 crypto: talitos - move struct talitos_edesc into talitos.h
   b578b87bcab6 s390/qdio: don't touch the dsci in tiqdio_add_input_queues()
   b1d52630b12a s390/qdio: (re-)initialize tiqdio list entries
   02eb533e940a s390: fix stfle zero padding
   9db915738e40 ARC: hide unused function unw_hdr_alloc
   fc6975ee932b x86/irq: Seperate unused system vectors from spurious entry again
   9494cd392885 x86/irq: Handle spurious interrupt after shutdown gracefully
   7897f5a443fb x86/ioapic: Implement irq_get_irqchip_state() callback
   6074f6043c49 genirq: Add optional hardware synchronization for shutdown
   3f10ccc29780 genirq: Fix misleading synchronize_irq() documentation
   578db1aa595b genirq: Delay deactivation in free_irq()
   2656ee5a5ad5 linux/kernel.h: fix overflow for DIV_ROUND_UP_ULL
   9c875e8556d4 pinctrl: mediatek: Update cur_mask in mask/mask ops
   f6e01328cb0e cpu/hotplug: Fix out-of-bounds read when setting fail state
   fa99487a43cf pinctrl: mediatek: Ignore interrupts that are wake only during resume
   cd2646e57ec5 HID: multitouch: Add pointstick support for ALPS Touchpad
   9ea3b131441e HID: chicony: add another quirk for PixArt mouse
   94968c37b6d3 x86/boot/64: Add missing fixup_pointer() for next_early_pgt access
   729d25f43b64 x86/boot/64: Fix crash if kernel image crosses page table boundary
   136847140cc8 dm verity: use message limit for data block corruption message
   042be78692ae dm table: don't copy from a NULL pointer in realloc_argv()
   0fc080bc9a72 pinctrl: mcp23s08: Fix add_data and irqchip_add_nested call order
   00640eb0eafa ARM: dts: imx6ul: fix PWM[1-4] interrupts
   a8cc2a2c2841 sis900: fix TX completion
   3232bccddeba ppp: mppe: Add softdep to arc4
   5ec7753c7c9e be2net: fix link failure after ethtool offline test
   2a6ee36917f0 x86/apic: Fix integer overflow on 10 bit left shift of cpu_khz
   fdfff855cd36 afs: Fix uninitialised spinlock afs_volume::cb_break_lock
   d47f06ab0c0e ARM: omap2: remove incorrect __init annotation
   5d3c45538151 ARM: dts: gemini Fix up DNS-313 compatible string
   afda29dc5ac6 perf/core: Fix perf_sample_regs_user() mm check
   627fdcc9b718 efi/bgrt: Drop BGRT status field reserved bits check
   cf4deb2d4de6 clk: ti: clkctrl: Fix returning uninitialized data
   ff232a47567f irqchip/gic-v3-its: Fix command queue pointer comparison bug
   244db54441a1 firmware: improve LSM/IMA security behaviour
   079d7f16a973 drivers: base: cacheinfo: Ensure cpu hotplug work is done before Intel RDT
   68048dce650e nilfs2: do not use unexported cpu_to_le32()/le32_to_cpu() in uapi header
   86859ef10d25 Input: synaptics - enable SMBUS on T480 thinkpad trackpad
   438a3dc6f2c3 e1000e: start network tx queue only when link is up
   8020568b404b Revert "e1000e: fix cyclic resets at link up with active tx"
   3bd837bfe431 Linux 4.19.59
   70bae382b3dc staging: rtl8712: reduce stack usage, again
   b46475ecd930 staging: bcm2835-camera: Handle empty EOS buffers whilst streaming
   0ee144effcc3 staging: bcm2835-camera: Remove check of the number of buffers supplied
   fcbc6ddcd624 staging: bcm2835-camera: Ensure all buffers are returned on disable
   4502c43d7f3b staging: bcm2835-camera: Replace spinlock protecting context_map with mutex
   22a20b9f6d9f staging: fsl-dpaa2/ethsw: fix memory leak of switchdev_work
   cc396afa1959 MIPS: Remove superfluous check for __linux__
   d202b5adccfb VMCI: Fix integer overflow in VMCI handle arrays
   486c32325caa carl9170: fix misuse of device driver API
   524ad00e80b7 binder: fix memory leak in error path
   294b893a41cd lkdtm: support llvm-objcopy
   5c90a2ecd08a HID: Add another Primax PIXART OEM mouse quirk
   c04c751bef87 staging: comedi: amplc_pci230: fix null pointer deref on interrupt
   4e49c6c91c18 staging: comedi: dt282x: fix a null pointer deref on interrupt
   8419fd562a09 drivers/usb/typec/tps6598x.c: fix 4CC cmd write
   63b3028cd590 drivers/usb/typec/tps6598x.c: fix portinfo width
   57e16e0d8c68 usb: renesas_usbhs: add a workaround for a race condition of workqueue
   aa9a8038ea8b usb: dwc2: use a longer AHB idle timeout in dwc2_core_reset()
   cac4a04202fb usb: gadget: ether: Fix race between gether_disconnect and rx_submit
   449a8d08a4bc p54usb: Fix race between disconnect and firmware loading
   135d9ba3b285 Revert "serial: 8250: Don't service RX FIFO if interrupts are disabled"
   0891268f36a2 USB: serial: option: add support for GosunCn ME3630 RNDIS mode
   0a1c811bf033 USB: serial: ftdi_sio: add ID for isodebug v1
   bb902b6c87ff mwifiex: Don't abort on small, spec-compliant vendor IEs
   ffbbd626e1ce mwifiex: Abort at too short BSS descriptor element
   a2a24b57c27a Documentation/admin: Remove the vsyscall=native documentation
   8a815007f5fe Documentation: Add section about CPU vulnerabilities for Spectre
   bd9604022eb3 x86/tls: Fix possible spectre-v1 in do_get_thread_area()
   68ff28291a4f x86/ptrace: Fix possible spectre-v1 in ptrace_get_debugreg()
   d8e26651ce8d perf pmu: Fix uncore PMU alias list for ARM64
   018524b75852 block, bfq: NULL out the bic when it's no longer valid
   ff75e5f41e88 ALSA: hda/realtek - Headphone Mic can't record after S3
   87c3262b00d8 ALSA: usb-audio: Fix parse of UAC2 Extension Units
   ef374f5a2731 media: stv0297: fix frequency range limit
   5db079eb0acd udf: Fix incorrect final NOT_ALLOCATED (hole) extent length
   0fc3e9b9b603 fscrypt: don't set policy for a dead directory
   e9f76b954336 net :sunrpc :clnt :Fix xps refcount imbalance on the error path
   810cfc3d9d2e NFS4: Only set creation opendata if O_CREAT
   7075654ce7d0 net: dsa: mv88e6xxx: fix shift of FID bits in mv88e6185_g1_vtu_loadpurge()
   606561e16186 quota: fix a problem about transfer quota
   5ad566af08c1 scsi: qedi: Check targetname while finding boot target information
   37232abb6ea3 net: lio_core: fix potential sign-extension overflow on large shift
   740b2ac49518 ip6_tunnel: allow not to count pkts on tstats by passing dev as NULL
   a02ac12d2d48 drm: return -EFAULT if copy_to_user() fails
   4c938a635fc3 bnx2x: Check if transceiver implements DDM before access
   270ae00a0346 md: fix for divide error in status_resync
   5533d9ed4112 mmc: core: complete HS400 before checking status
   2da80536f629 qmi_wwan: extend permitted QMAP mux_id value range
   dc84e98393f7 qmi_wwan: avoid RCU stalls on device disconnect when in QMAP mode
   dbc6a83cf2bc qmi_wwan: add support for QMAP padding in the RX path
   292ba5b1faf4 bpf, x64: fix stack layout of JITed bpf code
   4c2ce7addda8 bpf, devmap: Add missing RCU read lock on flush
   ab44f8bcf2e5 bpf, devmap: Add missing bulk queue free
   8d09e862103b bpf, devmap: Fix premature entry free on destroying map
   ba0afe520ee9 mac80211: do not start any work during reconfigure flow
   de8cf2c0bc64 mac80211: only warn once on chanctx_conf being NULL
   9c2dd6d47131 ARM: davinci: da8xx: specify dma_coherent_mask for lcdc
   3bbcc8b9ad37 ARM: davinci: da850-evm: call regulator_has_full_constraints()
   443250665388 mlxsw: spectrum: Disallow prio-tagged packets when PVID is removed
   512bbb114b99 KVM: arm/arm64: vgic: Fix kvm_device leak in vgic_its_destroy
   41420ac584d7 Input: imx_keypad - make sure keyboard can always wake up system
   b71f312e9bf7 riscv: Fix udelay in RV32.
   122c6a71c08d drm/vmwgfx: fix a warning due to missing dma_parms
   d3861d4ca94c drm/vmwgfx: Honor the sg list segment size limitation
   c0b12abd1828 s390/boot: disable address-of-packed-member warning
   e71daed5176f ARM: dts: am335x phytec boards: Fix cd-gpios active level
   822c2ee81c63 ibmvnic: Fix unchecked return codes of memory allocations
   0f06004d16be ibmvnic: Refresh device multicast list after reset
   e65dd528bb8e ibmvnic: Do not close unopened driver during reset
   374180b11b29 net: phy: rename Asix Electronics PHY driver
   473a75c7fab5 can: af_can: Fix error path of can_init()
   486954277fc1 can: m_can: implement errata "Needless activation of MRAF irq"
   270149f78b9c can: mcp251x: add support for mcp25625
   33672c74b484 dt-bindings: can: mcp251x: add mcp25625 support
   07c96e8e8021 soundwire: intel: set dai min and max channels correctly
   c7e427e28a3a mwifiex: Fix heap overflow in mwifiex_uap_parse_tail_ies()
   8e115a079940 iwlwifi: Fix double-free problems in iwl_req_fw_callback()
   d4c0f752c1d2 mwifiex: Fix possible buffer overflows at parsing bss descriptor
   b8588a0981b7 mac80211: free peer keys before vif down in mesh
   acc42e5c2322 mac80211: mesh: fix RCU warning
   e3868c1a462f staging:iio:ad7150: fix threshold mode config bit
   6b1ce3971e05 soundwire: stream: fix out of boundary access on port properties
   6be857082611 bpf: sockmap, fix use after free from sleep in psock backlog workqueue
   bc84982f977d mac80211: fix rate reporting inside cfg80211_calculate_bitrate_he()
   3c24a931e972 samples, bpf: suppress compiler warning
   e7779115bbd9 samples, bpf: fix to change the buffer size for read()
   fe01e93c3fd1 Input: elantech - enable middle button support on 2 ThinkPads
   2883fc1ece69 soc: bcm: brcmstb: biuctrl: Register writes require a barrier
   2f1c962a7416 soc: brcmstb: Fix error path for unsupported CPUs
   e8250f730410 crypto: talitos - rename alternative AEAD algos.
   7a6bfa08b938 Linux 4.19.58
   f37de75cb8eb dmaengine: imx-sdma: remove BD_INTR for channel0
   018c968de710 dmaengine: qcom: bam_dma: Fix completed descriptors count
   870de1499505 MIPS: have "plain" make calls build dtbs for selected platforms
   8957895b35de MIPS: Add missing EHB in mtc0 -> mfc0 sequence.
   2b8f8a80ca8b MIPS: Fix bounds check virt_addr_valid
   80b25628ff26 svcrdma: Ignore source port when computing DRC hash
   8129a10ce78f nfsd: Fix overflow causing non-working mounts on 1 TB machines
   f25c06955f8d KVM: LAPIC: Fix pending interrupt in IRR blocked by software disable LAPIC
   f6472f50fbfc KVM: x86: degrade WARN to pr_warn_ratelimited
   ac0024baf073 netfilter: ipv6: nf_defrag: accept duplicate fragments again
   54e8cf41b20b bpf: fix bpf_jit_limit knob for PAGE_SIZE >= 64K
   e6c288f7307e net: hns: fix unsigned comparison to less than zero
   4f24801ef50b sc16is7xx: move label 'err_spi' to correct section
   318244f3641a netfilter: ipv6: nf_defrag: fix leakage of unqueued fragments
   a8891c5e2251 ip6: fix skb leak in ip6frag_expire_frag_queue()
   382bc84da904 rds: Fix warning.
   7e6af1fa80b8 ALSA: hda: Initialize power_state field properly
   c8c88293bf72 net: hns: Fixes the missing put_device in positive leg for roce reset
   6bf9677300f3 x86/boot/compressed/64: Do not corrupt EDX on EFER.LME=1 setting
   b91ec6ae14da selftests: fib_rule_tests: Fix icmp proto with ipv6
   e2851c3ee0be scsi: tcmu: fix use after free
   04096b3beace mac80211: mesh: fix missing unlock on error in table_path_del()
   e2379b044d67 f2fs: don't access node/meta inode mapping after iput
   e9fde78c3a4f drm/fb-helper: generic: Don't take module ref for fbcon
   7821bcce20aa media: s5p-mfc: fix incorrect bus assignment in virtual child device
   3ddc2a100706 net/smc: move unhash before release of clcsock
   cd54dc4cd37d mlxsw: spectrum: Handle VLAN device unlinking
   a8a296abee36 tty: rocket: fix incorrect forward declaration of 'rp_init()'
   fb814f215013 btrfs: Ensure replaced device doesn't have pending chunk allocation
   27ce6c2675f6 mm/vmscan.c: prevent useless kswapd loops
   c854d9b6ef8d ftrace/x86: Remove possible deadlock between register_kprobe() and ftrace_run_update_code()
   2e716c3b562d drm/imx: only send event on crtc disable if kept disabled
   8ec242fd431b drm/imx: notify drm core before sending event during crtc disable
   d2d061351d64 drm/etnaviv: add missing failure path to destroy suballoc
   ec5d99e18d30 drm/amdgpu/gfx9: use reset default for PA_SC_FIFO_SIZE
   ec6d8c9e6687 drm/amd/powerplay: use hardware fan control if no powerplay fan table
   b6d56f4f6a49 arm64: kaslr: keep modules inside module region when KASAN is enabled
   7cab3dfa6d74 ARM: dts: armada-xp-98dx3236: Switch to armada-38x-uart serial node
   c8790d7f76be tracing/snapshot: Resize spare buffer if size changed
   052b31810085 fs/userfaultfd.c: disable irqs for fault_pending and event locks
   ea38007107d6 lib/mpi: Fix karactx leak in mpi_powm
   7df1e2f59bde ALSA: hda/realtek - Change front mic location for Lenovo M710q
   899377c50e60 ALSA: hda/realtek: Add quirks for several Clevo notebook barebones
   d9b6936b134e ALSA: usb-audio: fix sign unintended sign extension on left shifts
   7f52af5e9baa ALSA: line6: Fix write on zero-sized buffer
   3663bf2baa97 ALSA: firewire-lib/fireworks: fix miss detection of received MIDI messages
   9d2ac58c1ef9 ALSA: seq: fix incorrect order of dest_client/dest_ports arguments
   ae3fa28f0938 crypto: cryptd - Fix skcipher instance memory leak
   015c20532ace crypto: user - prevent operating on larval algorithms
   54435b7fff7b ptrace: Fix ->ptracer_cred handling for PTRACE_TRACEME
   600d3712ae12 drm/i915/dmc: protect against reading random memory
   2b39351e3844 ftrace: Fix NULL pointer dereference in free_ftrace_func_mapper()
   938044171949 module: Fix livepatch/ftrace module text permissions race
   220adcc0e0ca tracing: avoid build warning with HAVE_NOP_MCOUNT
   79fccb9815db mm/mlock.c: change count_mm_mlocked_page_nr return type
   4fce0a79e985 scripts/decode_stacktrace.sh: prefix addr2line with $CROSS_COMPILE
   b7747ecb82be cpuset: restore sanity to cpuset_cpus_allowed_fallback()
   e33aeb9a7c0a i2c: pca-platform: Fix GPIO lookup code
   7cf431edfb71 platform/mellanox: mlxreg-hotplug: Add devm_free_irq call to remove flow
   c241f3fbfa1a platform/x86: mlx-platform: Fix parent device in i2c-mux-reg device registration
   f853112772b0 platform/x86: intel-vbtn: Report switch events when event wakes device
   2ac96173bee0 platform/x86: asus-wmi: Only Tell EC the OS will handle display hotkeys from asus_nb_wmi
   027e043f9c78 drm: panel-orientation-quirks: Add quirk for GPD MicroPC
   2446563dd6d7 drm: panel-orientation-quirks: Add quirk for GPD pocket2
   8be5629b9622 scsi: hpsa: correct ioaccel2 chaining
   c1bef204c70a SoC: rt274: Fix internal jack assignment in set_jack callback
   1023af0c069d ALSA: hdac: fix memory release for SST and SOF drivers
   26a6acde2a42 usb: gadget: udc: lpc32xx: allocate descriptor with GFP_ATOMIC
   9be058f5dd70 usb: gadget: fusb300_udc: Fix memory leak of fusb300->ep[i]
   5284327f4e17 x86/CPU: Add more Icelake model numbers
   74929087384f ASoC: sun4i-i2s: Add offset to RX channel select
   32475634e8a8 ASoC: sun4i-i2s: Fix sun8i tx channel offset mask
   7b7486398a32 ASoC: max98090: remove 24-bit format support if RJ is 0
   3b60f98ef496 drm/mediatek: call mtk_dsi_stop() after mtk_drm_crtc_atomic_disable()
   34e5e1c4874f drm/mediatek: clear num_pipes when unbind driver
   a8a86e9a5533 drm/mediatek: call drm_atomic_helper_shutdown() when unbinding driver
   79e095d234bb drm/mediatek: unbind components in mtk_drm_unbind()
   319f4699bcaa drm/mediatek: fix unbind functions
   dbd94f4938c6 spi: bitbang: Fix NULL pointer dereference in spi_unregister_master
   3f8d3c9506a5 ASoC: ak4458: rstn_control - return a non-zero on error only
   3c3dd68c48e8 ASoC: soc-pcm: BE dai needs prepare when pause release after resume
   4c31b4b4ba65 ASoC: ak4458: add return value for ak4458_probe
   0c19bcdb0db9 ASoC : cs4265 : readable register too low
   c549680ed59b netfilter: nft_flow_offload: IPCB is only valid for ipv4 family
   041c181e6ba0 netfilter: nft_flow_offload: don't offload when sequence numbers need adjustment
   48f611ecea0e netfilter: nft_flow_offload: set liberal tracking mode for tcp
   3b2734bc839d netfilter: nf_flow_table: ignore DF bit setting
   869eec894663 md/raid0: Do not bypass blocking queue entered for raid0 bios
   c9d8d3e9d7a0 block: Fix a NULL pointer dereference in generic_make_request()
   5dd6139a0aa2 Bluetooth: Fix faulty expression for minimum encryption key size check

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 885eeb589ed3150a17a8ac62c44632cb02171478)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../linux/linux-yocto-rt_4.19.bb              |  6 +++---
 .../linux/linux-yocto-tiny_4.19.bb            |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index da87d476f9..c55ef50a5d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ca2e3322f4c5678eaef6434c808d0842c805d74d"
-SRCREV_meta ?= "20a6158aa35dbf11819382ef1eeb28915afea765"
+SRCREV_machine ?= "02f0c38dd20819c0e9d279e3b1e95280101ea8ab"
+SRCREV_meta ?= "a7cb57afb9fb9787079c28a1028d797632105e56"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.19.61"
+LINUX_VERSION ?= "4.19.72"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index cadf1a7402..f4f411de19 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.19.61"
+LINUX_VERSION ?= "4.19.72"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "b5a2efa31290f31384971494031285d394635938"
-SRCREV_machine ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
-SRCREV_meta ?= "20a6158aa35dbf11819382ef1eeb28915afea765"
+SRCREV_machine_qemuarm ?= "283b870cef5f79a6f07465828a51f27a6aed4c50"
+SRCREV_machine ?= "2d7c98a6748a64ca36fd1d2e60c517b16326df61"
+SRCREV_meta ?= "a7cb57afb9fb9787079c28a1028d797632105e56"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index 5edb97fed1..fb505862ee 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -11,22 +11,22 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
 KBRANCH_qemux86-64 ?= "v4.19/standard/base"
 KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ca3cb923f8d7962c6d47a8d29923e52da1818854"
-SRCREV_machine_qemuarm64 ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
-SRCREV_machine_qemumips ?= "f624314048dfac57e47ac91d89ca3dc8395ca47a"
-SRCREV_machine_qemuppc ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
-SRCREV_machine_qemux86 ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
-SRCREV_machine_qemux86-64 ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
-SRCREV_machine_qemumips64 ?= "ca47368b698795cd5cada84dbfcceda1f47da1aa"
-SRCREV_machine ?= "4ec6f255163da37a4c83528e5835b6b9baccee63"
-SRCREV_meta ?= "20a6158aa35dbf11819382ef1eeb28915afea765"
+SRCREV_machine_qemuarm ?= "b0be447bc9053d07f3438999778bd077679ae756"
+SRCREV_machine_qemuarm64 ?= "2d7c98a6748a64ca36fd1d2e60c517b16326df61"
+SRCREV_machine_qemumips ?= "3c8b21d0a335b5f418682969448574dfd0011f02"
+SRCREV_machine_qemuppc ?= "2d7c98a6748a64ca36fd1d2e60c517b16326df61"
+SRCREV_machine_qemux86 ?= "2d7c98a6748a64ca36fd1d2e60c517b16326df61"
+SRCREV_machine_qemux86-64 ?= "2d7c98a6748a64ca36fd1d2e60c517b16326df61"
+SRCREV_machine_qemumips64 ?= "2854797711fee4061fb760c2b6e0e3d3135195ab"
+SRCREV_machine ?= "2d7c98a6748a64ca36fd1d2e60c517b16326df61"
+SRCREV_meta ?= "a7cb57afb9fb9787079c28a1028d797632105e56"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
           "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.19.61"
+LINUX_VERSION ?= "4.19.72"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1


