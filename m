Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com
	[209.85.166.46])
	by mail.openembedded.org (Postfix) with ESMTP id A96597D06D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 03:12:05 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id f6so6443188iop.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Mar 2019 20:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uxVP6WUTxB8C/yxIwJjOfN6DhBTDS4Wp9VvhRdlzQ1M=;
	b=JoYRae7ZjcF/BOR9uU8NpcpX6zAFMdKsPvTyGT/CGiMMxeHJbGjToKFBi7XDJ0Dv/l
	mk0omcNW+xEZPauhvH/ztQBq85tjI6h2YeqjDBknlcOw3eV03p4ZK9wC7PH0O4yVzMWA
	+PX+LecUqCBOMs8TxBIpaQ4bOnefGmL2f0ZDzm0ZBASa/Lck8r2Q1peTwSFL8n7ODrZS
	ZUOI7pGMDrsuya2r3FBQCucPPjMHJG3p2B5j4WFjrEbgeZS2NvbcSDesdr4PseFHVSHb
	/anUkKTJdOKsxowh09xYQHVotFNNjTs/0hJ+O+1OjelgCH+kOTxdhoNcsVL+ORHz+LwJ
	BJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uxVP6WUTxB8C/yxIwJjOfN6DhBTDS4Wp9VvhRdlzQ1M=;
	b=tf13iw+EcMW78mmTTScYTn8Rfa/hy0uRo69TYP2WRWNU6wY95B6dtu1MBYxe4c2N7Y
	mUQBN5IXZIA1V4U5nZvhwSYZwsrsL8MTn3/1gPs4TdL9OFW5ZbHNuZMkqLw5PsUZ9rPf
	JKbT4CFBP1dVW0qIhruAU1etW740r8dgJpYDrDYxXlbNbDPQGVwN32594ZYfUCTEtrYQ
	5WrBlhnmnqTRJm1yAwtt+rOAtzg99T9jTYtw757aQf5b1yNHbhkIyEJcCFKtvutNqGed
	gOJ0pcJpzgiWDZhEBpv5Pt6Q0yGH+MOWqVXUIuSqxFaX4uHUDfTn7Sg9rJq/hWzBd1qc
	lGeA==
X-Gm-Message-State: APjAAAX3BgdcRTLULyZiBH/L0imYjHZ0sIj1DDSj9sdSQ6ltN8BJmsG1
	wEcTCsvvRL3J69qn4rrrhXI=
X-Google-Smtp-Source: APXvYqz+WyEK3/n32t5a6u71gk1g0WBg667DnNzfHKWYX5kEOMkxdKv6Tz+K7acvCD1nNv6KvT4+Sw==
X-Received: by 2002:a5d:860e:: with SMTP id f14mr11047950iol.294.1553483525243;
	Sun, 24 Mar 2019 20:12:05 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195])
	by smtp.gmail.com with ESMTPSA id l8sm5443416itl.26.2019.03.24.20.12.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Mar 2019 20:12:04 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sun, 24 Mar 2019 23:11:53 -0400
Message-Id: <6e0fcc87e4e34c8773edb310b96f837483cb4cbf.1553483380.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1553483380.git.bruce.ashfield@gmail.com>
References: <cover.1553483380.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] linux-yocto/4.19: update to v4.19.30
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
X-List-Received-Date: Mon, 25 Mar 2019 03:12:05 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the korg -stable releases that comprise the following
commits:

   7794d3522606 Linux 4.19.30
   842bdbe83ccc vhost/vsock: fix vhost vsock cid hashing inconsistent
   090ce34b7832 i40e: report correct statistics when XDP is enabled
   eab8018fd289 staging: erofs: fix race when the managed cache is enabled
   96ce54b24c38 drm: Block fb changes for async plane updates
   27143c71d68b It's wrong to add len to sector_nr in raid10 reshape twice
   d6b577c6201f perf/x86/intel: Make dev_attr_allow_tsx_force_abort static
   92c9a3897a4c perf/x86/intel: Fix memory corruption
   835bc1e2a904 ALSA: hda/realtek: Enable headset MIC of Acer TravelMate X514-51T with ALC255
   be888d9a0ed3 ALSA: hda/realtek - Reduce click noise on Dell Precision 5820 headphone
   8f6cf57ebe5d ALSA: hda/realtek: Enable audio jacks of ASUS UX362FA with ALC294
   5da055b1ca56 ALSA: hda - add more quirks for HP Z2 G4 and HP Z240
   2191cd581f46 ALSA: hda: Extend i915 component bind timeout
   8b2d66397541 ALSA: firewire-motu: fix construction of PCM frame for capture direction
   bb2dde7c9edc ALSA: bebob: use more identical mod_alias for Saffire Pro 10 I/O against Liquid Saffire 56
   a8eae05f8dbf perf/x86: Fixup typo in stub functions
   2835c059726a f2fs: wait on atomic writes to count F2FS_CP_WB_DATA
   275a2c08c313 net: sched: flower: insert new filter to idr after setting its mask
   345af5abca67 missing barriers in some of unix_sock ->addr and ->path accesses
   f56b3c297ca7 net/smc: fix smc_poll in SMC_INIT state
   795cb33c32d2 bonding: fix PACKET_ORIGDEV regression
   2e4b2aeb0209 ipv6: route: enforce RCU protection in ip6_route_check_nh_onlink()
   96dd4ef3c0ce ipv6: route: enforce RCU protection in rt6_update_exception_stamp_rt()
   1856bbbea652 ipvlan: disallow userns cap_net_admin to change global mode/flags
   e5c31b5a6854 team: use operstate consistently for linkup
   b9d0cb758145 ipv6: route: purge exception on removal
   fe38cbc9e38a net: Set rtm_table to RT_TABLE_COMPAT for ipv6 for tables > 255
   96a3b14450af mdio_bus: Fix use-after-free on device_register fails
   13b430574e61 net/x25: fix a race in x25_bind()
   c3bdcd9dd2fe net/mlx4_core: Fix qp mtt size calculation
   c3bcf8cb401d net/mlx4_core: Fix locking in SRIOV mode when switching between events and polling
   1f34d8d2e513 net/mlx4_core: Fix reset flow when in command polling mode
   f09a656b68ef vxlan: test dev->flags & IFF_UP before calling gro_cells_receive()
   9f7aeee6542e vxlan: Fix GRO cells race condition between receive and link delete
   173e9023a068 tcp: handle inet_csk_reqsk_queue_add() failures
   fba43f49fdf7 tcp: Don't access TCP_SKB_CB before initializing it
   8accd04eb9a4 tcp: do not report TCP_CM_INQ of 0 for closed connections
   0e6b33fa9ae1 sctp: remove sched init from sctp_stream_init
   c5952168e9da rxrpc: Fix client call queueing, waiting for channel
   eaa0962e1eb2 route: set the deleted fnhe fnhe_daddr to 0 in ip_del_fnhe to fix a race
   ec61b95340f8 ravb: Decrease TxFIFO depth of Q3 and Q2 to one
   34dc08b9e916 pptp: dst_release sk_dst_cache in pptp_sock_destruct
   14d5e73b01ba net/x25: reset state in x25_connect()
   b5c109075aca net/x25: fix use-after-free in x25_device_event()
   7cfb97ba8396 net: sit: fix UBSAN Undefined behaviour in check_6rd
   86a71f00f9f5 net/hsr: fix possible crash in add_timer()
   996ee1aca7de net: hsr: fix memory leak in hsr_dev_finalize()
   ab13fe32a01a lan743x: Fix TX Stall Issue
   223264734865 lan743x: Fix RX Kernel Panic
   96d58cd882ed l2tp: fix infoleak in l2tp_ip6_recvmsg()
   7760937dc278 ipv4/route: fail early when inet dev is missing
   df737fd03391 gro_cells: make sure device is up in gro_cells_receive()
   ef9ef4adb85c connector: fix unsafe usage of ->real_parent
   ce194fa2b267 Linux 4.19.29
   26b6e018e558 perf/x86/intel: Implement support for TSX Force Abort
   fdd820949a74 x86: Add TSX Force Abort CPUID/MSR
   9e071aa6c28c perf/x86/intel: Generalize dynamic constraint creation
   f99f7dae782e perf/x86/intel: Make cpuc allocations consistent
   7053a6faf019 driver core: Postpone DMA tear-down until after devres release
   adaa310f8a01 ath9k: Avoid OF no-EEPROM quirks without qca,no-eeprom
   b4d965a37d89 cifs: allow calling SMB2_xxx_free(NULL)
   e5d7b94cc435 staging: erofs: keep corrupted fs from crashing kernel in erofs_namei()
   28b8f234edaf staging: erofs: fix race of initializing xattrs of a inode at the same time
   53a989a95a09 staging: erofs: fix memleak of inode's shared xattr array
   9dc84155425c staging: erofs: fix fast symlink w/o xattr when fs xattr is on
   f581642c8a2c staging: erofs: add error handling for xattr submodule
   4f5a4c888106 gfs2: Fix missed wakeups in find_insert_glock
   e6e00017910c netfilter: xt_TEE: add missing code to get interface index in checkentry.
   02d86085cac6 netfilter: xt_TEE: fix wrong interface selection
   f9a0a08d9c99 drm: disable uncached DMA optimization for ARM and arm64
   bb2c205cd3a0 ARM: dts: exynos: Fix max voltage for buck8 regulator on Odroid XU3/XU4
   bfc341b61f5c ARM: dts: exynos: Add minimal clkout parameters to Exynos3250 PMU
   cd10bc8261eb ARM: dts: exynos: Fix pinctrl definition for eMMC RTSN line on Odroid X2/U3
   103ec440943e arm64: dts: hikey: Revert "Enable HS200 mode on eMMC"
   e6eb5e3561ca arm64: dts: hikey: Give wifi some time after power-on
   271c5a5d546b arm64: dts: zcu100-revC: Give wifi some time after power-on
   36e3673d01af x86/PCI: Fixup RTIT_BAR of Intel Denverton Trace Hub
   917f943781a9 scsi: aacraid: Fix missing break in switch statement
   dcdd1bcbc099 iscsi_ibft: Fix missing break in switch statement
   fe34541ab930 Input: elan_i2c - add id for touchpad found in Lenovo s21e-20
   b3b29dc53104 Input: wacom_serial4 - add support for Wacom ArtPad II tablet
   7066774e60e4 nvme-pci: add missing unlock for reset error
   6d482bc56977 blk-iolatency: fix IO hang due to negative inflight counter
   1781ae6f0eac qede: Fix system crash on configuring channels.
   84828dd2ba92 qed: Consider TX tcs while deriving the max num_queues for PF.
   d727c0edf646 qed: Fix EQ full firmware assert.
   72426ed2a149 fs: ratelimit __find_get_block_slow() failure message.
   3cc6703d43f9 nvme-pci: fix rapid add remove sequence
   e3aabe4c2467 nvme: lock NS list changes while handling command effects
   25aa5c8b063a drm/amdgpu: use spin_lock_irqsave to protect vm_manager.pasid_idr
   ee84b62fba23 i2c: omap: Use noirq system sleep pm ops to idle device for suspend
   29f7b376d399 Revert "scsi: libfc: Add WARN_ON() when deleting rports"
   cd8520a283c4 MIPS: Remove function size check in get_frame_info()
   738f9e2774d6 perf trace: Support multiple "vfs_getname" probes
   47e3f3c08605 perf symbols: Filter out hidden symbols from labels
   825e58bc9800 s390/qeth: cancel close_dev work before removing a card
   5327c5530c9b s390/qeth: fix use-after-free in error path
   575a2461e50b s390/qeth: release cmd buffer in error paths
   5058447bf760 netfilter: nf_nat: skip nat clash resolution for same-origin entries
   5c39e08fc417 selftests: netfilter: add simple masq/redirect test cases
   974ed365b164 selftests: netfilter: fix config fragment CONFIG_NF_TABLES_INET
   0203f0c963e9 dmaengine: dmatest: Abort test in case of mapping error
   5eae58996b7e vsock/virtio: reset connected sockets on device removal
   cd2013568dd5 vsock/virtio: fix kernel panic after device hot-unplug
   f3ffd4559de2 dmaengine: at_xdmac: Fix wrongfull report of a channel as in use
   7cf4466df6ca drm/sun4i: tcon: Prepare and enable TCON channel 0 clock at init
   ae26a7109c15 bpf: Fix syscall's stackmap lookup potential deadlock
   3bbe6a421280 bpf: fix potential deadlock in bpf_prog_register
   e3bc64c9aa50 bpf: fix lockdep false positive in percpu_freelist
   0ace0d28941b bpf, selftests: fix handling of sparse CPU allocations
   232bd90cf238 relay: check return of create_buf_file() properly
   2a5c84e164d2 irqchip/gic-v3-its: Fix ITT_entry_size accessor
   fbdbb19457ce net: stmmac: Disable EEE mode earlier in XMIT callback
   496eaed7fe94 net: stmmac: Send TSO packets always from Queue 0
   46ba03c591d9 net: stmmac: Fallback to Platform Data clock in Watchdog conversion
   8096bc39c63e drm/amdgpu: Transfer fences to dmabuf importer
   4ec880d7c199 drm/radeon: check if device is root before getting pci speed caps
   094392380989 drm/amdgpu: Add missing power attribute to APU check
   1bf791023315 irqchip/mmp: Only touch the PJ4 IRQ & FIQ bits on enable/disable
   423869f8871d irqchip/gic-v3-its: Gracefully fail on LPI exhaustion
   dc81cfafb4b9 irqchip/gic-v4: Fix occasional VLPI drop
   377ffe354dc0 usb: phy: fix link errors
   fbc3ed1339ec DTS: CI20: Fix bugs in ci20's device tree.
   f7e3fb0a6f9d batman-adv: release station info tidstats
   90f0a75be8eb arm64: dts: add msm8996 compatible to gicv3
   ac0997349142 ARM: pxa: ssp: unneeded to free devm_ allocated data
   a8795ba8995a bpf: sock recvbuff must be limited by rmem_max in bpf_setsockopt()
   7e2b2e24e356 bpftool: fix percpu maps updating
   1da961de4ad4 bpftool: Fix prog dump by tag
   9a0f0bbac9a0 wlcore: sdio: Fixup power on/off sequence
   2634448683d3 pinctrl: mcp23s08: spi: Fix regmap allocation for mcp23s18
   a50434de0cfe soc: fsl: qbman: avoid race in clearing QMan interrupt
   959773138ac9 arm64: dts: renesas: r8a77965: Enable DMA for SCIF2
   4dc8b2e57ee4 arm64: dts: renesas: r8a7796: Enable DMA for SCIF2
   f02070cb4b60 ARM: dts: imx6sx: correct backward compatible of gpt
   3edbed0dd13f ARM: dts: meson8m2: mxiii-plus: mark the SD card detection GPIO active-low
   ab2f85e59693 ARM: dts: meson8b: odroidc1: mark the SD card detection GPIO active-low
   94f31b4c9780 arm: dts: meson: Fix IRQ trigger type for macirq
   094ed50726a2 ARM: dts: sun8i: h3: Add ethernet0 alias to Beelink X2
   ec27bcd3f688 ARM: dts: omap4-droid4: Fix typo in cpcap IRQ flags
   b510051c73a7 ARM: OMAP: dts: N950/N9: fix onenand timings
   2cc84e2ea68d mm, memory_hotplug: fix off-by-one in is_pageblock_removable
   929278903367 autofs: fix error return in autofs_fill_super()
   1efb234ec251 autofs: drop dentry reference only when it is never used
   3d0acc076f5f fs/drop_caches.c: avoid softlockups in drop_pagecache_sb()
   f1524fd049de lib/test_kmod.c: potential double free in error handling
   71df1c8bc771 mm, memory_hotplug: test_pages_in_a_zone do not pass the end of zone
   6027792d6aa8 mm, memory_hotplug: is_mem_section_removable do not pass the end of a zone
   5edeae210cb8 x86_64: increase stack size for KASAN_EXTRA
   845d73be1b4c proc: fix /proc/net/* after setns(2)
   e2b45446c34f x86/kexec: Don't setup EFI info if EFI runtime is not enabled
   d7807b62276e apparmor: Fix aa_label_build() error handling for failed merges
   d92d3caf818d arm64: kprobe: Always blacklist the KVM world-switch code
   f964a4d2bb68 x86/microcode/amd: Don't falsely trick the late loading mechanism
   6efd69d63339 cifs: fix computation for MAX_SMB2_HDR_SIZE
   15fb5d73e47e x86/boot/compressed/64: Set EFER.LME=1 in 32-bit trampoline before returning to long mode
   bd13a72a537a net: macb: Apply RXUBR workaround only to versions with errata
   38be5d445c5b platform/x86: Fix unmet dependency warning for SAMSUNG_Q10
   25f37d15f080 platform/x86: Fix unmet dependency warning for ACPI_CMPC
   bdf1bd01327d scsi: 53c700: pass correct "dev" to dma_alloc_attrs()
   59411d98fb10 scsi: bnx2fc: Fix error handling in probe()
   8d27f830b615 scsi: scsi_debug: fix write_same with virtual_gb problem
   e546c8787e7b scsi: libfc: free skb when receiving invalid flogi resp
   40e35210abeb qed: Fix stack out of bounds bug
   9414e0854bbc qed: Fix system crash in ll2 xmit
   fac238779b14 qed: Fix VF probe failure while FLR
   1ba3511006f1 qed: Fix LACP pdu drops for VFs
   88bce339de23 qed: Fix bug in tx promiscuous mode settings
   5c72ca3bf625 nfs: Fix NULL pointer dereference of dev_name
   daf04674d08a selftests: timers: use LDLIBS instead of LDFLAGS
   c68cf0831b25 selftests: net: use LDLIBS instead of LDFLAGS
   eda52fa18e4f gpio: vf610: Mask all GPIO interrupts
   3355d641269f netfilter: ebtables: compat: un-break 32bit setsockopt when no rules are present
   1f4ccda30391 net: stmmac: dwmac-rk: fix error handling in rk_gmac_powerup()
   4a22084f6bbc net: hns: Fix wrong read accesses via Clause 45 MDIO protocol
   3e640b2cdc6e net: hns: Restart autoneg need return failed when autoneg off
   6b7d35440955 net: hns: Fix for missing of_node_put() after of_parse_phandle()
   c91f641625a7 net: altera_tse: fix msgdma_tx_completion on non-zero fill_level case
   419bb616e9ea xtensa: SMP: limit number of possible CPUs by NR_CPUS
   d9ba842efdf0 iomap: fix a use after free in iomap_dio_rw
   d23792f53f0d iomap: get/put the page in iomap_page_create/release()
   38f47557ae49 xtensa: SMP: mark each possible CPU as present
   c1327f9a1248 xtensa: smp_lx200_defconfig: fix vectors clash
   8655802aa155 xtensa: SMP: fix secondary CPU initialization
   0165df14095b selftests: cpu-hotplug: fix case where CPUs offline > CPUs present
   1ee82160e2ef IB/ipoib: Fix for use-after-free in ipoib_cm_tx_start
   dc04a00b3cbb riscv: Adjust mmap base address at a third of task size
   f43e42f46aa8 xtensa: SMP: fix ccount_timer_shutdown
   aad4dc749ed5 clk: qcom: gcc: Use active only source for CPUSS clocks
   cf872189c804 clk: ti: Fix error handling in ti_clk_parse_divider_data()
   a038ed686aa6 iommu/amd: Fix IOMMU page flush when detach device from a domain
   e0b03a6bad1a ipvs: Fix signed integer overflow when setsockopt timeout
   ffabf74c6796 riscv: fixup max_low_pfn with PFN_DOWN.
   9e1f977d82ec iommu/amd: Unmap all mapped pages in error path of map_sg
   697863bf7d72 iommu/amd: Call free_iova_fast with pfn in map_sg
   43b0c93918a0 IB/{hfi1, qib}: Fix WC.byte_len calculation for UD_SEND_WITH_IMM
   d5f05016b0e1 perf script: Fix crash when processing recorded stat data
   1e4b75416682 perf tools: Handle TOPOLOGY headers with no CPU
   6ec0698f1c40 perf core: Fix perf_proc_update_handler() bug
   5d1dc10ba3ac perf script: Fix crash with printing mixed trace point and other events
   8ce41db0dcfc vti4: Fix a ipip packet processing bug in 'IPCOMP' virtual tunnel
   ac8befb6dd60 media: uvcvideo: Fix 'type' check leading to overflow
   6a31767f84ad Linux 4.19.28
   ca490a987365 bpf: fix sanitation rewrite in case of non-pointers
   ebfb07e8c23e scsi: core: reset host byte in DID_NEXUS_FAILURE case
   b60d90b2d3d1 exec: Fix mem leak in kernel_read_file
   8d368fc58e7a Bluetooth: Fix locking in bt_accept_enqueue() for BH context
   43593a30a068 Bluetooth: btrtl: Restore old logic to assume firmware is already loaded
   cd61d473f71f selftests: firmware: fix verify_reqs() return value
   9765ec7f7a02 USB: serial: cp210x: fix GPIO in autosuspend
   09675c2f84bc gnss: sirf: fix premature wakeup interrupt enable
   c426de69ded0 xtensa: fix get_wchan
   f5e66cdb51fd aio: Fix locking in aio_poll()
   88793c034edf MIPS: irq: Allocate accurate order pages for irq stack
   5691b93f686e applicom: Fix potential Spectre v1 vulnerabilities
   9d53e36c8c09 usb: xhci: Fix for Enabling USB ROLE SWITCH QUIRK on INTEL_SUNRISEPOINT_LP_XHCI
   690e939da71d tracing: Fix event filters and triggers to handle negative numbers
   51c531805801 x86/boot/compressed/64: Do not read legacy ROM on EFI system
   eab5ea25ebee x86/CPU/AMD: Set the CPB bit unconditionally on F17h
   3846080998b9 net: sched: act_tunnel_key: fix NULL pointer dereference during init
   69e6fb1804cf net/sched: act_skbedit: fix refcount leak when replace fails
   f1446b164925 net/sched: act_ipt: fix refcount leak when replace fails
   4d8f5df0cbe9 net: dsa: mv88e6xxx: prevent interrupt storm caused by mv88e6390x_port_set_cmode
   457c1190c65c net: dsa: mv88e6xxx: power serdes on/off for 10G interfaces on 6390X
   cc211561d126 ipv4: Pass original device to ip_rcv_finish_core
   4f3221dee1e1 mpls: Return error for RTA_GATEWAY attribute
   a68d31cc5306 ipv6: Return error for RTA_VIA attribute
   8c0aa3f6908c ipv4: Return error for RTA_VIA attribute
   125bc1e67eee net: avoid use IPCB in cipso_v4_error
   f2397468fbd7 net: Add __icmp_send helper.
   e6620defc483 tun: remove unnecessary memory barrier
   947fc52b6bf4 xen-netback: fix occasional leak of grant ref mappings under memory pressure
   e5e5840183de xen-netback: don't populate the hash cache on XenBus disconnect
   488b940719b7 tun: fix blocking read
   ab04570d82b1 tipc: fix race condition causing hung sendto
   5fdb551fd6a6 net: socket: set sock->sk to NULL after calling proto_ops::release()
   d0bedaac932f net: sit: fix memory leak in sit_init_net()
   ed7a54419ef2 net: phy: phylink: fix uninitialized variable in phylink_get_mac_state
   d06816899758 net: phy: Micrel KSZ8061: link failure after cable connect
   f132b3f5f1ad net: nfc: Fix NULL dereference on nfc_llcp_build_tlv fails
   d1dd2e15c85e net: netem: fix skb length BUG_ON in __skb_to_sgvec
   e3713abc4248 netlabel: fix out-of-bounds memory accesses
   4afc9831f895 net: dsa: mv88e6xxx: Fix u64 statistics
   05d9f554b713 net: dsa: mv88e6xxx: Fix statistics on mv88e6161
   ceb7c2498695 lan743x: Fix TX Stall Issue
   99ed94582126 ipv4: Add ICMPv6 support when parse route ipproto
   d61918a5e401 hv_netvsc: Fix IP header checksum for coalesced packets
   36bd44bcb4b2 geneve: correctly handle ipv6.disable module parameter
   1713c8e18b44 bnxt_en: Drop oversize TX packets to prevent errors.
   8d1b9800c1ea tipc: fix RDM/DGRAM connect() regression
   089100d5fb43 team: Free BPF filter when unregistering netdev
   5e311e537e63 sky2: Disable MSI on Dell Inspiron 1545 and Gateway P-79
   8085d6d03fe3 sctp: call iov_iter_revert() after sending ABORT
   16a006d72f33 qmi_wwan: Add support for Quectel EG12/EM12
   7ce2a517fd8b net-sysfs: Fix mem leak in netdev_register_kobject
   3043bfe024e8 net: sched: put back q.qlen into a single location
   0429c9ef94c6 net: dsa: mv8e6xxx: fix number of internal PHYs for 88E6x90 family
   dea818999a1e net: dsa: mv88e6xxx: handle unknown duplex modes gracefully in mv88e6xxx_port_set_duplex
   b5ff77ddd96f ip6mr: Do not call __IP6_INC_STATS() from preemptible context
   de40920f3694 staging: android: ashmem: Avoid range_alloc() allocation with ashmem_mutex held.
   b8d048b73900 staging: android: ashmem: Don't call fallocate() with ashmem_mutex held.
   271800f564db staging: android: ion: fix sys heap pool's gfp_flags
   14af4eff14c2 staging: wilc1000: fix to set correct value for 'vif_num'
   63efda29f359 staging: comedi: ni_660x: fix missing break in switch statement
   40245f24133c staging: erofs: compressed_pages should not be accessed again after freed
   1fa7c9b4226f staging: erofs: fix illegal address access under memory pressure
   b46e1fc6ccee USB: serial: ftdi_sio: add ID for Hjelmslund Electronics USB485
   da20be9991d8 USB: serial: cp210x: add ID for Ingenico 3070
   965e716001c9 USB: serial: option: add Telit ME910 ECM composition
   cbace523cbaa staging: erofs: fix mis-acted TAIL merging behavior
   464b4279d34f cpufreq: Use struct kobj_attribute instead of struct global_attr
   adc2a008ae56 Linux 4.19.27
   7371994d6cfa x86/uaccess: Don't leak the AC flag into __put_user() value evaluation
   9f77e4cb12d4 MIPS: eBPF: Fix icache flush end address
   4a418a3d94f2 MIPS: BCM63XX: provide DMA masks for ethernet devices
   3bfa6413b03a MIPS: fix truncation in __cmpxchg_small for short values
   527cabfffbc5 hugetlbfs: fix races and page leaks during migration
   f0233ca89ce2 drm: Block fb changes for async plane updates
   de04d2973a62 mm: enforce min addr even if capable() in expand_downwards()
   ff86bb4dc656 mmc: sdhci-esdhc-imx: correct the fix of ERR004536
   d612d7b4ff4d mmc: cqhci: Fix a tiny potential memory leak on error condition
   e446ae40dc33 mmc: cqhci: fix space allocated for transfer descriptor
   17bf96122472 mmc: core: Fix NULL ptr crash from mmc_should_fail_request
   85d9ad404676 mmc: tmio: fix access width of Block Count Register
   5b716bc54e47 mmc: tmio_mmc_core: don't claim spurious interrupts
   c69e07a84d8f mmc: spi: Fix card detection during probe
   b246986a1fc0 kvm: selftests: Fix region overlap check in kvm_util
   60a4b3f7c867 KVM: nSVM: clear events pending from svm_complete_interrupts() when exiting to L1
   0149b03ec269 svm: Fix AVIC incomplete IPI emulation
   99b1dbe6ba17 cfg80211: extend range deviation for DMG
   7a27cb609f03 mac80211: Add attribute aligned(2) to struct 'action'
   0a7c92826f79 mac80211: don't initiate TDLS connection if station is not associated to AP
   e91cbe1de3b3 ibmveth: Do not process frames after calling napi_reschedule
   61fe1005f334 net: dev_is_mac_header_xmit() true for ARPHRD_RAWIP
   f7901f15d6f3 net: usb: asix: ax88772_bind return error when hw_reset fail
   156a43cc8986 drm/msm: Fix A6XX support for opp-level
   9f260d76b474 nvme-multipath: drop optimization for static ANA group IDs
   550e0ea7e7e4 nvme-rdma: fix timeout handler
   bbbb9874a9fe hv_netvsc: Fix hash key value reset after other ops
   d2ce8e1bd338 hv_netvsc: Refactor assignments of struct netvsc_device_info
   51b547f2a445 hv_netvsc: Fix ethtool change hash key error
   ad74456b500c net: altera_tse: fix connect_local_phy error path
   9de388112c63 scsi: csiostor: fix NULL pointer dereference in csio_vport_set_state()
   ee2a02a66821 scsi: lpfc: nvmet: avoid hang / use-after-free when destroying targetport
   30b62656690d scsi: lpfc: nvme: avoid hang / use-after-free when destroying localport
   edca54b897bb writeback: synchronize sync(2) against cgroup writeback membership switches
   c5a1dc256cc2 direct-io: allow direct writes to empty inodes
   bcb8e0a23698 staging: android: ion: Support cpu access during dma_buf_detach
   f73577353256 drm/sun4i: hdmi: Fix usage of TMDS clock
   89d9a53346b2 serial: fsl_lpuart: fix maximum acceptable baud rate with over-sampling
   1ed436cd1690 tty: serial: qcom_geni_serial: Allow mctrl when flow control is disabled
   8c5571b9df10 drm/amd/powerplay: OD setting fix on Vega10
   9ad6216e8c3c locking/rwsem: Fix (possible) missed wakeup
   2368e6d3bcf4 futex: Fix (possible) missed wakeup
   653a1dbcb011 sched/wake_q: Fix wakeup ordering for wake_q
   5024f0a29a8f sched/wait: Fix rcuwait_wake_up() ordering
   a2887f6fab98 mac80211: fix miscounting of ttl-dropped frames
   bbc300c8c75e staging: rtl8723bs: Fix build error with Clang when inlining is disabled
   a99e0377cca4 drivers: thermal: int340x_thermal: Fix sysfs race condition
   4749ffdfbb09 ARC: show_regs: lockdep: avoid page allocator...
   4e34dd37943d ARC: fix __ffs return value to avoid build warnings
   0655618dd92d irqchip/gic-v3-mbi: Fix uninitialized mbi_lock
   f352e84e6e3c selftests: gpio-mockup-chardev: Check asprintf() for error
   357d9c7a01c6 selftests: seccomp: use LDLIBS instead of LDFLAGS
   eecde0a099af phy: ath79-usb: Fix the main reset name to match the DT binding
   e55af638c4f4 phy: ath79-usb: Fix the power on error path
   fc8176da28b5 selftests/vm/gup_benchmark.c: match gup struct to kernel
   7bba7aff51ea ASoC: imx-audmux: change snprintf to scnprintf for possible overflow
   9500ecb9ad01 ASoC: dapm: change snprintf to scnprintf for possible overflow
   375a9673264c ASoC: rt5682: Fix PLL source register definitions
   7ff778648947 x86/mm/mem_encrypt: Fix erroneous sizeof()
   17fab8914f86 genirq: Make sure the initial affinity is not empty
   7746dd64c2c9 selftests: rtc: rtctest: add alarm test on minute boundary
   2409a869dad3 selftests: rtc: rtctest: fix alarm tests
   4670e8391710 usb: gadget: Potential NULL dereference on allocation error
   08c937f9a3db usb: dwc3: gadget: Fix the uninitialized link_state when udc starts
   03a5d4d55335 usb: dwc3: gadget: synchronize_irq dwc irq in suspend
   f29024c0e9a7 thermal: int340x_thermal: Fix a NULL vs IS_ERR() check
   fc1073dfc4e0 clk: vc5: Abort clock configuration without upstream clock
   71943c38620d clk: sysfs: fix invalid JSON in clk_dump
   acc934f57691 clk: tegra: dfll: Fix a potential Oop in remove()
   651023ed93ab ASoC: Variable "val" in function rt274_i2c_probe() could be uninitialized
   e7b2f9f2bce2 ALSA: compress: prevent potential divide by zero bugs
   a4964959ee83 ASoC: Intel: Haswell/Broadwell: fix setting for .dynamic field
   5a7005337c2a drm/msm: Unblock writer if reader closes file
   0f978ec3ed3e scsi: libsas: Fix rphy phy_identifier for PHYs with end devices attached
   a7c6cf3bdf33 mac80211: Change default tx_sk_pacing_shift to 7
   765c30b31849 genirq/matrix: Improve target CPU selection for managed interrupts.
   8cae7757e862 irq/matrix: Spread managed interrupts on allocation
   2948b8875df4 irq/matrix: Split out the CPU selection code into a helper
   51ea85abe794 Linux 4.19.26
   101e19726552 net: phylink: avoid resolving link state too early
   c80bf03569af pinctrl: max77620: Use define directive for max77620_pinconf_param values
   c014cae8e196 udlfb: handle unplug properly
   6546e1150c9b netfilter: ipt_CLUSTERIP: fix sleep-in-atomic bug in clusterip_config_entry_put()
   0c1054e0e5fd netfilter: nfnetlink_osf: add missing fmatch check
   783359cf762c netfilter: ipv6: Don't preserve original oif for loopback address
   a905b82e1ea3 netfilter: nft_compat: use-after-free when deleting targets
   1500d94e33d8 netfilter: nf_tables: fix flush after rule deletion in the same batch
   6ecc7407187c Revert "bridge: do not add port to router list when receives query with source 0.0.0.0"
   bff97255bb29 staging: erofs: unzip_vle_lz4.c,utils.c: rectify BUG_ONs
   9a6a676e16eb staging: erofs: unzip_{pagevec.h,vle.c}: rectify BUG_ONs
   bea01ea032a6 staging: erofs: {dir,inode,super}.c: rectify BUG_ONs
   60ce4b529797 staging: erofs: add a full barrier in erofs_workgroup_unfreeze
   08ec9e6892cc staging: erofs: fix `erofs_workgroup_{try_to_freeze, unfreeze}'
   b0a18cab6aeb staging: erofs: atomic_cond_read_relaxed on ref-locked workgroup
   398102f64acd staging: erofs: remove the redundant d_rehash() for the root dentry
   017f7fd75b24 staging: erofs: drop multiref support temporarily
   eb5913dfa5c1 staging: erofs: replace BUG_ON with DBG_BUGON in data.c
   34ac4c14f5d5 staging: erofs: complete error handing of z_erofs_do_read_page
   1c9d5a47c681 staging: erofs: fix a bug when appling cache strategy
   c375152be9dd net: avoid false positives in untrusted gso validation
   e93384b12443 net: validate untrusted gso packets without csum offload
   311722240ca6 kvm: x86: Return LA57 feature based on hardware capability
   6bab27b60c1a mac80211: allocate tailroom for forwarded mesh packets
   0329973ec999 drm/amd/display: Fix MST reboot/poweroff sequence
   d8a648cae347 drm/i915/fbdev: Actually configure untiled displays
   06fa18685411 gpu: drm: radeon: Set DPM_FLAG_NEVER_SKIP when enabling PM-runtime
   6834afab4bec drm/amdgpu: Set DPM_FLAG_NEVER_SKIP when enabling PM-runtime
   95aed87b9e2e ARC: define ARCH_SLAB_MINALIGN = 8
   7779566abb68 ARC: U-boot: check arguments paranoidly
   5f7814c0ae6f ARCv2: Enable unaligned access in early ASM code
   ebe390b42e60 parisc: Fix ptrace syscall number modification
   8b4b1d7cc4d0 KEYS: always initialize keyring_index_key::desc_len
   390c76534de1 KEYS: user: Align the payload buffer
   293f2dcd0d07 RDMA/srp: Rework SCSI device reset handling
   fdfd723e99e6 net/mlx5e: XDP, fix redirect resources availability check
   d569cb5ac0c4 net_sched: fix two more memory leaks in cls_tcindex
   dcd62aa6f895 net_sched: fix a memory leak in cls_tcindex
   056a17982adb net_sched: fix a race condition in tcindex_destroy()
   862600971c47 sit: check if IPv6 enabled before calling ip6_err_gen_icmpv6_unreach()
   c647233ea046 geneve: should not call rt6_lookup() when ipv6 was disabled
   7aab1e6d9edb net: socket: make bond ioctls go through compat_ifreq_ioctl()
   e37c96c11175 net: socket: fix SIOCGIFNAME in compat
   50021ba98fbd Revert "kill dev_ifsioc()"
   99f3c89669d9 Revert "socket: fix struct ifreq size in compat ioctl"
   c031b433801f team: avoid complex list operations in team_nl_cmd_options_set()
   5716864df7c4 sctp: set stream ext to NULL after freeing it in sctp_stream_outq_migrate
   e8eff9f4fc6a sctp: call gso_reset_checksum when computing checksum in sctp_gso_segment
   9e5cc54ea086 net: sfp: do not probe SFP module before we're attached
   c2ee2c708aae net/packet: fix 4gb buffer limit due to overflow check
   f3ec82db191b net/mlx5e: Don't overwrite pedit action when multiple pedit used
   4190a7bcd2af net/mlx4_en: Force CHECKSUM_NONE for short ethernet frames
   198198d5ae59 net: ena: fix race between link up and device initalization
   fd49ffa383b9 ipv6: propagate genlmsg_reply return code
   589503cb2486 inet_diag: fix reporting cgroup classid and fallback to priority
   c580bb3120cb batman-adv: fix uninit-value in batadv_interface_tx()
   ab125bd3caaf isdn: avm: Fix string plus integer warning from Clang
   6ed281fd85b6 net/mlx5e: Fix wrong (zero) TX drop counter indication for representor
   7f5491b9875a selftests: forwarding: Add a test case for externally learned FDB entries
   e26772f056b5 mlxsw: spectrum_switchdev: Do not treat static FDB entries as sticky
   4799417bb641 net: bridge: Mark FDB entries that were added by user as such
   d7ac3d3135ff mlxsw: pci: Return error on PCI reset timeout
   0aafea5d4b22 dpaa_eth: NETIF_F_LLTX requires to do our own update of trans_start
   8b92162f4e8b bpf: bpf_setsockopt: reset sock dst on SO_MARK changes
   0761f58c62d7 leds: lp5523: fix a missing check of return value of lp55xx_read
   ddb8d7c9d460 hwmon: (tmp421) Correct the misspelling of the tmp442 compatible attribute in OF device ID table
   e0d7b0a2a57a atm: he: fix sign-extension overflow on large shift
   22b304bfcb00 selftests/bpf: retry tests that expect build-id
   5c6fdd877eff bpf: zero out build_id for BPF_STACK_BUILD_ID_IP
   c4555b9f2807 bpf: don't assume build-id length is always 20 bytes
   5d6af6f9dd2f afs: Fix key refcounting in file locking code
   dc4ec1bad9e2 afs: Don't set vnode->cb_s_break in afs_validate()
   a45b037edae3 selftests: tc-testing: fix parsing of ife type
   2c69ea7f0c11 selftests: tc-testing: fix tunnel_key failure if dst_port is unspecified
   38a27ee2ea03 selftests: tc-testing: drop test on missing tunnel key id
   642e26628cf9 pvcalls-front: fix potential null dereference
   b4c5be499ba3 drm/sun4i: backend: add missing of_node_puts
   5604fdcfcfdc vhost: return EINVAL if iovecs size does not match the message size
   096a3170575f drm/amd/display: fix PME notification not working in RV desktop
   bf846e9035b5 drm/amdkfd: Don't assign dGPUs to APU topology devices
   6d09976cca02 drm/meson: add missing of_node_put
   c818b5b47181 always clear the X2APIC_ENABLE bit for PV guest
   73aa8292caba netfilter: nft_flow_offload: fix checking method of conntrack helper
   4c3b23e90307 scsi: cxgb4i: add wait_for_completion()
   b2ae824798e1 scsi: ufs: Fix geometry descriptor size
   a7ff8ada154d scsi: qedi: Add ep_state for login completion on un-reachable targets
   5641d2f8cdf2 scsi: ufs: Fix system suspend status
   2c3c854b56c6 scsi: tcmu: avoid cmd/qfull timers updated whenever a new cmd comes
   3dd0ce706e0b isdn: i4l: isdn_tty: Fix some concurrency double-free bugs
   1b8742ba98a5 net: stmmac: Prevent RX starvation in stmmac_napi_poll()
   2406055411ed net: stmmac: Fix the logic of checking if RX Watchdog must be enabled
   e8fbb5c98b04 net: stmmac: Check if CBS is supported before configuring
   fcfdb4022c82 net: stmmac: dwxgmac2: Only clear interrupts that are active
   4ef0d67c281f net: stmmac: Fix PCI module removal leak
   752f0bcb5d4d acpi/nfit: Fix race accessing memdev in nfit_get_smbios_id()
   99b490e3a0f3 powerpc/8xx: fix setting of pagetable for Abatron BDI debug tool.
   eeb370eaee98 RDMA/mthca: Clear QP objects during their allocation
   6d26c375a483 netfilter: nft_flow_offload: fix interaction with vrf slave device
   2f3480e34079 bpf: fix panic in stack_map_get_build_id() on i386 and arm32
   06b919a51772 pvcalls-front: Avoid get_free_pages(GFP_KERNEL) under spinlock
   26354d538df3 bpf: correctly set initial window on active Fast Open sender
   535be4692ffc netfilter: nft_flow_offload: Fix reverse route lookup
   703f4f653723 MIPS: jazz: fix 64bit build
   4047a7ad3b2e include/linux/compiler*.h: fix OPTIMIZER_HIDE_VAR
   93f3f4c0fdeb scsi: isci: initialize shost fully before calling scsi_add_host()
   14285a4a8487 scsi: qla4xxx: check return code of qla4xxx_copy_from_fwddb_param
   95d4f951e7bb netfilter: nf_tables: fix leaking object reference count
   e9255c284270 selftests: forwarding: Add a test for VLAN deletion
   0c596ab039d3 mlxsw: spectrum_acl: Add cleanup after C-TCAM update error condition
   7169938b07db xprtrdma: Double free in rpcrdma_sendctxs_create()
   ac3be9eb875f MIPS: ath79: Enable OF serial ports in the default config
   2ac1c6e71ee7 net/mlx4: Get rid of page operation after dma_alloc_coherent
   b5f7ead81de3 watchdog: mt7621_wdt/rt2880_wdt: Fix compilation problem
   fc396828a4e6 selftests/bpf: Test [::] -> [::1] rewrite in sys_sendmsg in test_sock_addr
   8b0d641e6152 bpf: Fix [::] -> [::1] rewrite in sys_sendmsg
   6bcf4e0703b1 net: hns: Fix use after free identified by SLUB debug
   08eb17ec3c1b qed: Fix qed_ll2_post_rx_buffer_notify_fw() by adding a write memory barrier
   1fa0cf450c88 qed: Fix qed_chain_set_prod() for PBL chains with non power of 2 page count
   bc4e383da82b xen/pvcalls: remove set but not used variable 'intf'
   7fc59021c1f5 mfd: mc13xxx: Fix a missing check of a register-read failure
   e42296ae45a6 mfd: tps65218: Use devm_regmap_add_irq_chip and clean up error path in probe()
   beaf260ec820 mfd: cros_ec_dev: Add missing mfd_remove_devices() call in remove
   ef1dc506cb50 mfd: axp20x: Add supported cells for AXP803
   48d17f5f9d74 mfd: axp20x: Re-align MFD cell entries
   49542ac0c460 mfd: axp20x: Add AC power supply cell for AXP813
   45acbfa661bb mfd: wm5110: Add missing ASRC rate register
   467829cc83a5 mfd: qcom_rpm: write fw_version to CTRL_REG
   eb617dc67878 mfd: bd9571mwv: Add volatile register to make DVFS work
   2990096c88cb mfd: ab8500-core: Return zero in get_register_interruptible()
   14da7f159711 mfd: mt6397: Do not call irq_domain_remove if PMIC unsupported
   9bf045ff761a mfd: db8500-prcmu: Fix some section annotations
   232860c51e78 mfd: twl-core: Fix section annotations on {,un}protect_pm_master
   1a4c9c4e0107 pvcalls-back: set -ENOTCONN in pvcalls_conn_back_read
   05ac8a683962 pvcalls-front: properly allocate sk
   81b8519de1b4 pvcalls-front: don't try to free unallocated rings
   9699f7a70eb8 pvcalls-front: read all data before closing the connection
   6bdf535f4aaf mfd: ti_am335x_tscadc: Use PLATFORM_DEVID_AUTO while registering mfd cells
   d87fa3f7711b backlight: pwm_bl: Fix devicetree parsing with auto-generated brightness tables
   f812bec554d0 KEYS: allow reaching the keys quotas exactly
   cbe43c3d35f5 ALSA: hda/realtek: Disable PC beep in passthrough on alc285
   c607b6d19859 ALSA: hda/realtek - Headset microphone and internal speaker support for System76 oryp5
   a89e0d5c603a proc, oom: do not report alien mms when setting oom_score_adj
   c7ddb2689d7a numa: change get_mempolicy() to use nr_node_ids instead of MAX_NUMNODES
   b8d7fb1efb96 ceph: avoid repeatedly adding inode to mdsc->snap_flush_list
   c74260710e62 libceph: handle an empty authorize reply
   a35b18616a73 mac80211: Free mpath object when rhashtable insertion fails
   007719caa958 mac80211: Use linked list instead of rhashtable walk for mesh tables
   af900ac68bb7 mac80211: Restore vif beacon interval if start ap fails
   cd10b02afb7c gpio: pxa: avoid attempting to set pin direction via pinctrl on MMP2
   a83243a85827 gpio: MT7621: use a per instance irq_chip structure
   4db02ac96841 MIPS: eBPF: Always return sign extended 32b values
   b5e57dbb5a0e tracing: Fix number of entries in trace header
   775ab7d3d12b ARM: 8834/1: Fix: kprobes: optimized kprobes illegal instruction
   eb1e5b1a64ee Linux 4.19.25
   eed11c69d275 ax25: fix possible use-after-free
   0137890a4a8f mISDN: fix a race in dev_expire_timer()
   74e1493e00f2 net/x25: do not hold the cpu too long in x25_new_lci()
   6a3f7237871c netfilter: nf_nat_snmp_basic: add missing length checks in ASN.1 cbs
   a7e0b9680aec sunrpc: fix 4 more call sites that were using stack memory with a scatterlist
   bc5d97268c0c PCI: Fix __initdata issue with "pci=disable_acs_redir" parameter
   f9e6a18a44de mmc: meson-gx: fix interrupt name
   88bfdab618df scsi: target/core: Use kmem_cache_free() instead of kfree()
   82f39f021944 hwmon: (lm80) Fix missing unlock on error in set_fan_div()
   718ccdb3ea31 net: Do not allocate page fragments that are not skb aligned
   1bdb1675f33f tcp: tcp_v4_err() should be more careful
   df1b583c1654 tcp: clear icsk_backoff in tcp_write_queue_purge()
   56e97e70f7e3 net: Add header for usage of fls64()
   a3b6fa373adc vxlan: test dev->flags & IFF_UP before calling netif_rx()
   03a6fc5712e8 vsock: cope with memory allocation failure at socket creation time
   9a752d37292b vhost: correctly check the return value of translate_desc() in log_used()
   1e3300eb2189 sky2: Increase D3 delay again
   6e04b8210f96 net: stmmac: handle endianness in dwmac4_get_timestamp
   176ab70112c5 net: stmmac: Fix a race in EEE enable callback
   618bd2c202b4 net: phy: xgmiitorgmii: Support generic PHY status read
   1764111c9972 net: ipv4: use a dedicated counter for icmp_v4 redirect packets
   4523bc864077 net: ip6_gre: initialize erspan_ver just for erspan tunnels
   4c1b91b82c43 net: fix IPv6 prefix route residue
   b2975c2e8342 net: Fix for_each_netdev_feature on Big endian
   eb5e6869125f net: crypto set sk to NULL when af_alg_release.
   bd1488b8d476 mlxsw: __mlxsw_sp_port_headroom_set(): Fix a use of local variable
   017d511085a3 dsa: mv88e6xxx: Ensure all pending interrupts are handled prior to exit
   bbbefe815f50 af_packet: fix raw sockets over 6in4 tunnel
   f287634fe321 Linux 4.19.24
   dd5f4d067a2c mm: proc: smaps_rollup: fix pss_locked calculation
   6a204bd5f1e6 drm/i915: Prevent a race during I915_GEM_MMAP ioctl with WC set
   4631e0b4cf46 drm/i915: Block fbdev HPD processing during suspend
   de48b5f3d0ef drm/vkms: Fix license inconsistent
   3312e0ae2faf drm: Use array_size() when creating lease
   029a38f8211f dm thin: fix bug where bio that overwrites thin block ignores FUA
   3ec93eb3808f dm crypt: don't overallocate the integrity tag space
   b2778ef8b906 x86/a.out: Clear the dump structure initially
   ddf966410ace md/raid1: don't clear bitmap bits on interrupted recovery.
   a2b3e2c0f576 signal: Restore the stop PTRACE_EVENT_EXIT
   0396cf55657c scsi: sd: fix entropy gathering for most rotational disks
   cdc356855685 x86/platform/UV: Use efi_runtime_lock to serialise BIOS calls
   45649b999632 tracing/uprobes: Fix output for multiple string arguments
   88e1e66a2a1a s390/zcrypt: fix specification exception on z196 during ap probe
   a3fadeff7122 alpha: Fix Eiger NR_IRQS to 128
   c56eef69ba24 alpha: fix page fault handling for r16-r18 targets
   657fbf79a880 Revert "mm: slowly shrink slabs with a relatively small number of objects"
   8d485d3a628b Revert "mm: don't reclaim inodes with many attached pages"
   93769fef8d61 Revert "nfsd4: return default lease period"
   17f4ddaa71f7 Input: elantech - enable 3rd button support on Fujitsu CELSIUS H780
   3bd120956db2 Input: bma150 - register input device after setting private data
   c4609e81e0b7 mmc: block: handle complete_work on separate workqueue
   248a2f3cbebe mmc: sunxi: Filter out unsupported modes declared in the device tree
   0d41c03c41ec kvm: vmx: Fix entry number check for add_atomic_switch_msr()
   c58f010bebfd x86/kvm/nVMX: read from MSR_IA32_VMX_PROCBASED_CTLS2 only when it is available
   2ab1483852b3 riscv: Add pte bit to distinguish swap from invalid
   22d6e72bb566 tools uapi: fix Alpha support
   49720ef58e89 ASoC: hdmi-codec: fix oops on re-probe
   bdd448108d85 ALSA: usb-audio: Fix implicit fb endpoint setup by quirk
   8715ba45d008 ALSA: hda - Add quirk for HP EliteBook 840 G5
   74cbb754d63f perf/x86: Add check_period PMU callback
   d10e77c26022 perf/core: Fix impossible ring-buffer sizes warning
   1b1de8b95b97 ARM: OMAP5+: Fix inverted nirq pin interrupts with irq_set_type
   d9a974fdaaa3 Input: elan_i2c - add ACPI ID for touchpad in Lenovo V330-15ISK
   2abf1ce44e28 Revert "Input: elan_i2c - add ACPI ID for touchpad in ASUS Aspire F5-573G"
   ede7fb452221 gpio: mxc: move gpio noirq suspend/resume to syscore phase
   b1765ebd9d12 CIFS: Do not assume one credit for async responses
   6804b3ecbe20 kvm: sev: Fail KVM_SEV_INIT if already initialized
   63715c1f0a67 cifs: Limit memory used by lock request calls to a page
   4b709998564b drm/nouveau/falcon: avoid touching registers if engine is off
   85a088cc4c8e drm/nouveau: Don't disable polling in fallback mode
   0a87c5333c90 gpio: pl061: handle failed allocations
   5cf199f8d03f ARM: dts: kirkwood: Fix polarity of GPIO fan lines
   6e7136c1c79f ARM: dts: da850-lcdk: Correct the sound card name
   8bea93c89bc8 ARM: dts: da850-lcdk: Correct the audio codec regulators
   f3b61cba316a ARM: dts: da850-evm: Correct the sound card name
   7c06896ea134 ARM: dts: da850-evm: Correct the audio codec regulators
   46bf9a8c8bb0 drm/amdgpu: set WRITE_BURST_LENGTH to 64B to workaround SDMA1 hang
   2f5581e82fe4 nvme: pad fake subsys NQN vid and ssvid with zeros
   6c27b5230e35 nvme-multipath: zero out ANA log buffer
   095cfdf857a3 nvme-pci: fix out of bounds access in nvme_cqe_pending
   1e746fe215eb nvme-pci: use the same attributes when freeing host_mem_desc_bufs.
   9e4a7beedf43 drm/bridge: tc358767: fix output H/V syncs
   0c13400bc743 drm/bridge: tc358767: reject modes which require too much BW
   ad9675e47b49 drm/bridge: tc358767: fix initial DP0/1_SRCCTRL value
   9ac48b301c2a drm/bridge: tc358767: fix single lane configuration
   32f833a85c9a drm/bridge: tc358767: add defines for DP1_SRCCTRL & PHY_2LANE
   d180c28698a1 drm/bridge: tc358767: add bus flags
   c6f27cdd4fca cpufreq: check if policy is inactive early in __cpufreq_get()
   fa92c4e6b244 riscv: fix trace_sys_exit hook
   da78c8cda5b9 tools uapi: fix RISC-V 64-bit support
   46f0e6984c84 perf test shell: Use a fallback to get the pathname in vfs_getname
   d20bfcb55003 perf report: Fix wrong iteration count in --branch-history
   db8c9ab3f47f ACPI: NUMA: Use correct type for printing addresses on i386-PAE
   f749f9702c98 drm/amdgpu/sriov:Correct pfvf exchange logic
   bdd8fd8a2efe ARM: fix the cockup in the previous patch
   e7a8dabe92f1 ARM: ensure that processor vtables is not lost after boot
   4645c6ccbd7a ARM: spectre-v2: per-CPU vtables to work around big.Little systems
   b11fd96c0eca ARM: add PROC_VTABLE and PROC_TABLE macros
   06b5ec99f2ee ARM: clean up per-processor check_bugs method call
   8a4cf73fed23 ARM: split out processor lookup
   e3e1b2a20ad3 ARM: make lookup_processor_type() non-__init
   19c186ab4ea7 ARM: 8810/1: vfp: Fix wrong assignement to ufp_exc
   042b172201a8 ARM: 8797/1: spectre-v1.1: harden __copy_to_user
   b7a95704e922 ARM: 8796/1: spectre-v1,v1.1: provide helpers for address sanitization
   beaf90b2d280 ARM: 8795/1: spectre-v1.1: use put_user() for __put_user()
   39b282ade6d0 ARM: 8794/1: uaccess: Prevent speculative use of the current addr_limit
   ba22d5941823 ARM: 8793/1: signal: replace __put_user_error with __put_user
   73dad6efbe31 ARM: 8792/1: oabi-compat: copy oabi events using __copy_to_user()
   9cad5755b6e2 ARM: 8791/1: vfp: use __copy_to_user() when saving VFP state
   3a59b35c3cb8 ARM: 8790/1: signal: always use __copy_to_user to save iwmmxt context
   ec4842816f04 ARM: 8789/1: signal: copy registers using __copy_to_user()
   80c8452ad45f blk-mq: fix a hung issue when fsync
   d4aaa45f2d98 eeprom: at24: add support for 24c2048
   57e85c67d033 dt-bindings: eeprom: at24: add "atmel,24c2048" compatible string
   67d52fae61c1 Linux 4.19.23
   c2109f05b7fd Revert "exec: load_script: don't blindly truncate shebang string"
   6f8c14ee7b6f Linux 4.19.22
   9b65b18f817d svcrdma: Remove max_sge check at connect time
   4d376ab80483 svcrdma: Reduce max_send_sges
   4dd911f1e38e batman-adv: Force mac header to start of data on xmit
   a21222305015 batman-adv: Avoid WARN on net_device without parent in netns
   9d84284cc83b xfrm: refine validation of template and selector families
   f7fb58a78a63 libceph: avoid KEEPALIVE_PENDING races in ceph_con_keepalive()
   28f49e768d21 Revert "ext4: use ext4_write_inode() when fsyncing w/o a journal"
   8b8f7b04f868 xfrm: Make set-mark default behavior backward compatible
   2440f3cebcb0 SUNRPC: Always drop the XPRT_LOCK on XPRT_CLOSE_WAIT
   8274c3d4895b drm/vmwgfx: Return error code from vmw_execbuf_copy_fence_user
   d74ff5f67849 drm/vmwgfx: Fix setting of dma masks
   c2a354ce5458 drm/i915: always return something on DDI clock selection
   b81afe37ff55 drm/amd/powerplay: Fix missing break in switch
   56d3178666fb drm/modes: Prevent division by zero htotal
   a4c77aac0d5c mac80211: ensure that mgmt tx skbs have tailroom for encryption
   1ce0fcebff24 mic: vop: Fix use-after-free on remove
   49c473e1237e powerpc/radix: Fix kernel crash with mremap()
   d4e7c9420edd firmware: arm_scmi: provide the mandatory device release callback
   fe3dabb6a4b1 ARM: dts: da850: fix interrupt numbers for clocksource
   33bd0949212b ARM: tango: Improve ARCH_MULTIPLATFORM compatibility
   569051e12220 ARM: iop32x/n2100: fix PCI IRQ mapping
   f5b4de051294 MIPS: VDSO: Include $(ccflags-vdso) in o32,n32 .lds builds
   814e44507f96 mips: loongson64: remove unreachable(), fix loongson_poweroff().
   e32ba28eddad MIPS: VDSO: Use same -m%-float cflag as the kernel proper
   264b26201a22 MIPS: OCTEON: don't set octeon_dma_bar_type if PCI is disabled
   384cc5fd6727 mips: cm: reprime error cause
   7e44aab92783 tracing: uprobes: Fix typo in pr_fmt string
   9b66753c68a0 pinctrl: cherryview: fix Strago DMI workaround
   93f6fb609874 pinctrl: sunxi: Correct number of IRQ banks on H6 main pin controller
   c619140d4843 debugfs: fix debugfs_rename parameter checking
   0c548bab17c2 samples: mei: use /dev/mei0 instead of /dev/mei
   edd8fb55d7f1 mei: me: add ice lake point device id.
   db5f65bfc1fa misc: vexpress: Off by one in vexpress_syscfg_exec()
   959e46afeca1 signal: Better detection of synchronous signals
   f681f2684f14 signal: Always notice exiting tasks
   3e17af253e62 iio: ti-ads8688: Update buffer allocation for timestamps
   af770a1558c4 iio: chemical: atlas-ph-sensor: correct IIO_TEMP values to millicelsius
   38d28640db5a iio: adc: axp288: Fix TS-pin handling
   5b9ebf5bdf0a tools: iio: iio_generic_buffer: make num_loops signed
   88ff6a0b9975 libata: Add NOLPM quirk for SAMSUNG MZ7TE512HMHP-000L1 SSD
   7c5d650ad5a2 mtd: rawnand: gpmi: fix MX28 bus master lockup problem
   a72040a9d929 mtd: spinand: Fix the error/cleanup path in spinand_init()
   b3ce77578374 mtd: spinand: Handle the case where PROGRAM LOAD does not reset the cache
   3ca59bf1fb7c mtd: Make sure mtd->erasesize is valid even if the partition is of size 0
   43d3d5141515 Linux 4.19.21
   b00d9ff756b6 ath9k: dynack: check da->enabled first in sampling routines
   14acca60aee4 ath9k: dynack: make ewma estimation faster
   8b71aa1a3bb8 perf/x86/intel: Delay memory deallocation until x86_pmu_dead_cpu()
   fc3f15c672f6 IB/hfi1: Add limit test for RC/UC send via loopback
   29706d59abdf cacheinfo: Keep the old value if of_property_read_u32 fails
   c287265bfa65 serial: sh-sci: Do not free irqs that have already been freed
   57a3ef4dd520 serial: 8250_pci: Make PCI class test non fatal
   f50a8b34d7e4 serial: fix race between flush_to_ldisc and tty_open
   d5cb494b9613 perf tests evsel-tp-sched: Fix bitwise operator
   1aeeb176683d perf/core: Don't WARN() for impossible ring-buffer sizes
   5b27e3bc5a2b x86/MCE: Initialize mce.bank in the case of a fatal error in mce_no_way_out()
   4e6bfd756f8e perf/x86/intel/uncore: Add Node ID mask
   97a7fa90eae9 cpu/hotplug: Fix "SMT disabled by BIOS" detection for KVM
   236fd677125f KVM: nVMX: unconditionally cancel preemption timer in free_nested (CVE-2019-7221)
   24b027d2b138 kvm: fix kvm_ioctl_create_device() reference counting (CVE-2019-6974)
   5a45d3720b54 KVM: x86: work around leak of uninitialized stack contents (CVE-2019-7222)
   4cf73d54792b scsi: aic94xx: fix module loading
   5e91ba179a86 scsi: cxlflash: Prevent deadlock when adapter probe fails
   bbd5d7adde3b staging: speakup: fix tty-operation NULL derefs
   bc4162577c1a usb: gadget: musb: fix short isoc packets with inventra dma
   77541a0b0413 usb: gadget: udc: net2272: Fix bitwise and boolean operations
   19bc535e3729 usb: dwc3: gadget: Handle 0 xfer length for OUT EP
   a8438c38d7ce usb: phy: am335x: fix race condition in _probe
   8459f1d6ff62 irqchip/gic-v3-its: Plug allocation race for devices sharing a DevID
   ee73954d9a21 futex: Handle early deadlock return correctly
   4a9e4bcda782 dmaengine: imx-dma: fix wrong callback invoke
   84c1d5627597 dmaengine: bcm2835: Fix abort of transactions
   916eb6bd8da3 dmaengine: bcm2835: Fix interrupt race on RT
   c70374ce418e HID: debug: fix the ring buffer implementation
   6ccc9e1128e5 fuse: handle zero sized retrieve correctly
   f99027ab63be fuse: decrement NR_WRITEBACK_TEMP on the right page
   48be0eb05e7e fuse: call pipe_buf_release() under pipe lock
   a57ab2e71098 ALSA: hda/realtek - Headset microphone support for System76 darp5
   7cb468772a10 ALSA: hda/realtek - Use a common helper for hp pin reference
   65c9a62822f6 ALSA: hda/realtek - Fix lose hp_pins for disable auto mute
   7fd6d8193b85 ALSA: hda - Serialize codec registrations
   2a0aba551610 ALSA: usb-audio: Add support for new T+A USB DAC
   93e7d51029bd ALSA: compress: Fix stop handling on compressed capture streams
   1f78052b0991 xfs: eof trim writeback mapping as soon as it is cached
   1f1eb00c6ebb net/mlx5e: FPGA, fix Innova IPsec TX offload data path performance
   9143e1dcad36 virtio_net: Account for tx bytes and packets on sending xdp_frames
   c8ba1f7989c6 skge: potential memory corruption in skge_get_regs()
   7c2361308e17 sctp: walk the list of asoc safely
   7cd4e833761f sctp: check and update stream->out_curr when allocating stream_out
   21b8697e605a rxrpc: bad unlock balance in rxrpc_recvmsg
   7c1a5ce672f7 Revert "net: phy: marvell: avoid pause mode on SGMII-to-Copper for 88e151x"
   f2f054c485db rds: fix refcount bug in rds_sock_addref
   2c24ed77a8c0 net: systemport: Fix WoL with password after deep sleep
   b72ea6ec83be net/mlx5e: Force CHECKSUM_UNNECESSARY for short ethernet frames
   8104a5e73f1f net: dsa: slave: Don't propagate flag changes on down slave interfaces
   27a2fa009817 net: dsa: mv88e6xxx: Fix counting of ATU violations
   c8dfab5c610f net: dsa: Fix NULL checking in dsa_slave_set_eee()
   98cedccb8654 net: dsa: Fix lockdep false positive splat
   8e1428c9b39f net: dp83640: expire old TX-skb
   81733c642df8 lib/test_rhashtable: Make test_insert_dup() allocate its hash table dynamically
   cedc42f5d1e1 enic: fix checksum validation for IPv6
   15ed55e3b1a5 dccp: fool proof ccid_hc_[rt]x_parse_options()
   56ea9164467b thermal: hwmon: inline helpers when CONFIG_THERMAL_HWMON is not set
   0c802cbaa6db xfs: fix inverted return from xfs_btree_sblock_verify_crc
   c6c20af69c61 xfs: fix PAGE_MASK usage in xfs_free_file_space
   757332c643ca fs/xfs: fix f_ffree value for statfs when project quota is set
   886f0de16239 xfs: delalloc -> unwritten COW fork allocation can go wrong
   5a7455e922b4 xfs: fix transient reference count error in xfs_buf_resubmit_failed_buffers
   c3a66bf4ce40 xfs: fix shared extent data corruption due to missing cow reservation
   a96f3a55143a xfs: fix overflow in xfs_attr3_leaf_verify
   b6095cbd7841 xfs: Fix error code in 'xfs_ioc_getbmap()'
   a585ac0e767b xfs: cancel COW blocks before swapext
   62c7c0a8709b xfs: Fix xqmstats offsets in /proc/fs/xfs/xqmstat
   aacb2ab111c5 scripts/gdb: fix lx-version string output
   58e57bcbc1fb kernel/kcov.c: mark write_comp_data() as notrace
   ab5f74071257 exec: load_script: don't blindly truncate shebang string
   9cb8f8088d9a fs/epoll: drop ovflist branch prediction
   f0d32c54ff53 kernel/hung_task.c: force console verbose before panic
   9beb84c027f1 proc/sysctl: fix return error for proc_doulongvec_minmax()
   9c8939b03bac kernel/hung_task.c: break RCU locks based on jiffies
   d69ad39ad5d3 arm64/sve: ptrace: Fix SVE_PT_REGS_OFFSET definition
   d921bb16259e HID: lenovo: Add checks to fix of_led_classdev_register
   ec8f73c268a5 thermal: generic-adc: Fix adc to temp interpolation
   89c183580b4f PCI: imx: Enable MSI from downstream components
   3818c29a65d6 kdb: Don't back trace on a cpu that didn't round up
   6a7c0215d28c thermal: bcm2835: enable hwmon explicitly
   295b3e2af87c block/swim3: Fix -EBUSY error when re-opening device after unmount
   d579abcacb0b fsl/fman: Use GFP_ATOMIC in {memac,tgec}_add_hash_mac_address()
   711b2e7fc02f gdrom: fix a memory leak bug
   b67e3130a9ba isdn: hisax: hfc_pci: Fix a possible concurrency use-after-free bug in HFCPCI_l1hw()
   3b3ee499c4b5 zram: fix lockdep warning of free block handling
   f73c77535f67 mm/page_alloc.c: don't call kasan_free_pages() at deferred mem init
   066206bc6e9e ocfs2: improve ocfs2 Makefile
   69e63b49ddf9 ocfs2: don't clear bh uptodate for block read
   dc8bd7ed080d arch/sh/boards/mach-kfr2r09/setup.c: fix struct mtd_oob_ops build warning
   fa3c7c098c6a scripts/decode_stacktrace: only strip base path when a prefix of the path
   395cbb9a52ba perf python: Do not force closing original perf descriptor in evlist.get_pollfd()
   4b5abffd63eb cgroup: fix parsing empty mount option string
   df13b0369bc0 f2fs: fix sbi->extent_list corruption issue
   4d6b5b08f19f niu: fix missing checks of niu_pci_eeprom_read
   1e480ee6c0eb um: Avoid marking pages with "changed protection"
   69e7f87745e7 f2fs: fix use-after-free issue when accessing sbi->stat_info
   5d3b4cd8734b cifs: check ntwrk_buf_start for NULL before dereferencing it
   2cdf5246df0e MIPS: ralink: Select CONFIG_CPU_MIPSR2_IRQ_VI on MT7620/8
   1dc571ff4da2 crypto: ux500 - Use proper enum in hash_set_dma_transfer
   2b020c09a8c9 crypto: ux500 - Use proper enum in cryp_set_dma_transfer
   6201e8add97a seq_buf: Make seq_buf_puts() null-terminate the buffer
   040f76976ec5 hwmon: (lm80) fix a missing check of bus read in lm80 probe
   8dcf84789e31 hwmon: (lm80) fix a missing check of the status of SMBus read
   303d29d8f0cf perf build: Don't unconditionally link the libbfd feature test to -liberty and -lz
   8c642d71906b NFS: nfs_compare_mount_options always compare auth flavors.
   ad9241f24f15 kvm: Change offset in kvm_write_guest_offset_cached to unsigned
   fc090081d76a powerpc/fadump: Do not allow hot-remove memory from fadump reserved area.
   84a4572bf277 KVM: x86: svm: report MSR_IA32_MCG_EXT_CTL as unsupported
   a41cd69e4408 pinctrl: meson: meson8b: fix the GPIO function for the GPIOAO pins
   098fa4897213 pinctrl: meson: meson8: fix the GPIO function for the GPIOAO pins
   279eb1d94044 powerpc/mm: Fix reporting of kernel execute faults on the 8xx
   9e9435bc0bd4 fbdev: fbcon: Fix unregister crash when more than one framebuffer
   00e391ec584f ACPI/APEI: Clear GHES block_status before panic()
   d657e82f4e67 igb: Fix an issue that PME is not enabled during runtime suspend
   d01b26e77af8 ice: Do not enable NAPI on q_vectors that have no rings
   8a35f678e603 i40e: define proper net_device::neigh_priv_len
   6584e6c00435 fbdev: fbmem: behave better with small rotated displays and many CPUs
   54541a75bfb6 md: fix raid10 hang issue caused by barrier
   8d1385653698 video: clps711x-fb: release disp device node in probe()
   8f0132db09ad drm/amd/display: validate extended dongle caps
   bd9218ab042a drbd: Avoid Clang warning about pointless switch statment
   66345d5392a7 drbd: skip spurious timeout (ping-timeo) when failing promote
   af70af5b69a2 drbd: disconnect, if the wrong UUIDs are attached on a connected peer
   3d67b428ab20 drbd: narrow rcu_read_lock in drbd_sync_handshake
   8d317b0aae25 mlx5: update timecounter at least twice per counter overflow
   49f182e6be8d powerpc/powernv/ioda: Allocate indirect TCE levels of cached userspace addresses on demand
   394f925664bd iwlwifi: mvm: fix setting HE ppe FW config
   5a0c7fb5332a powerpc/perf: Fix thresholding counter data for unknown type
   d5e2df9ff507 net: hns3: add max vector number check for pf
   86760e0dfe36 cw1200: Fix concurrency use-after-free bugs in cw1200_hw_scan()
   993ba5d2b6c6 scsi: smartpqi: increase fw status register read timeout
   32ab5d8a7def scsi: smartpqi: correct volume status
   8b6f057f6f55 scsi: smartpqi: correct host serial num for ssa
   b124f08677c9 mlxsw: spectrum: Properly cleanup LAG uppers when removing port from LAG
   1552557b300b xfrm6_tunnel: Fix spi check in __xfrm6_tunnel_alloc_spi
   e5af9ce365ad mac80211: fix radiotap vendor presence bitmap handling
   e12194317d17 powerpc/uaccess: fix warning/error with access_ok()
   3564fa62a8d7 drm/amd/display: fix YCbCr420 blank color
   38f18b370546 Bluetooth: hci_bcm: Handle deferred probing for the clock supply
   1baca23ade65 drm/amd/display: Add retry to read ddc_clock pin
   a756020008e8 net: hns3: fix incomplete uninitialization of IRQ in the hns3_nic_uninit_vector_data()
   7c54ba4a5fd9 percpu: convert spin_lock_irq to spin_lock_irqsave.
   34f82d19c24b perf tools: Cast off_t to s64 to avoid warning on bionic libc
   7a311dca7708 perf header: Fix up argument to ctime()
   05bc28a1f991 usb: musb: dsps: fix runtime pm for peripheral mode
   2a86649dce14 usb: musb: dsps: fix otg state machine
   c709eeb02c04 arm64: KVM: Skip MMIO insn after emulation
   086ed19ecf79 livepatch: check kzalloc return values
   1157c2683c5b tools/power/x86/intel_pstate_tracer: Fix non root execution for post processing a trace file
   4cd197bfa6e1 bnxt_en: Disable MSIX before re-reserving NQs/CMPL rings.
   ae93f5f803ae i2c: sh_mobile: Add support for r8a774c0 (RZ/G2E)
   19d4c0fd85ac perf probe: Fix unchecked usage of strncpy()
   f5d5b5434912 btrfs: use tagged writepage to mitigate livelock of snapshot
   4d5410609151 perf header: Fix unchecked usage of strncpy()
   d177e25c9c3a perf dso: Fix unchecked usage of strncpy()
   630e972bc405 perf test: Fix perf_event_attr test failure
   283d0464734e tty: serial: samsung: Properly set flags in autoCTS mode
   193de9820598 serial: sh-sci: Resume PIO in sci_rx_interrupt() on DMA failure
   d71126505dba serial: sh-sci: Fix locking in sci_submit_rx()
   3733632e8bc0 btrfs: harden agaist duplicate fsid on scanned devices
   9790abdf8856 usb: renesas_usbhs: add support for RZ/G2E
   33d127eae60d mmc: jz4740: Get CD/WP GPIOs from descriptors
   3d49c3d76df7 mmc: sdhci-xenon: Fix timeout checks
   8ee43469ce6e mmc: sdhci-omap: Fix timeout checks
   1b2b6ce63058 mmc: sdhci-of-esdhc: Fix timeout checks
   759e641acdd9 memstick: Prevent memstick host from getting runtime suspended during card detection
   35e580cb6bc4 mmc: meson-mx-sdio: check devm_kasprintf for failure
   ffc1770245c7 mmc: bcm2835: reset host on timeout
   3d71a02198ac mmc: bcm2835: Recover from MMC_SEND_EXT_CSD
   43b7fa3b31b9 KVM: PPC: Book3S: Only report KVM_CAP_SPAPR_TCE_VFIO on powernv machines
   c4621bec5e0d ASoC: fsl: Fix SND_SOC_EUKREA_TLV320 build error on i.MX8M
   8b4116f08988 ARM: pxa: avoid section mismatch warning
   1a2500177b13 selftests/bpf: use __bpf_constant_htons in test_prog.c
   3332bf15bfde switchtec: Fix SWITCHTEC_IOCTL_EVENT_IDX_ALL flags overwrite
   6a1d712b4381 udf: Fix BUG on corrupted inode
   702286d3bd6e mlxsw: spectrum_acl: Limit priority value
   e640039aeeff phy: sun4i-usb: add support for missing USB PHY index
   b5c21b7e3130 i2c-axxia: check for error conditions first
   ccb7b328361a lightnvm: pblk: add lock protection to list operations
   10014ff04a4e lightnvm: pblk: fix resubmission of overwritten write err lbas
   3d786b91cd59 drm/msm: dpu: Only check flush register against pending flushes
   ba833ec5b0c8 drm/msm/dsi: fix dsi clock names in DSI 10nm PLL driver
   39d4c1c0dd76 tee: optee: avoid possible double list_del()
   a1ea1fb46fbf OPP: Use opp_table->regulators to verify no regulator case
   4c67633d4756 cpuidle: big.LITTLE: fix refcount leak
   c443284c0d7b platform/x86: mlx-platform: Fix tachometer registers
   ea225de3bd66 clk: imx6sl: ensure MMDC CH0 handshake is bypassed
   1f16ac59e7e5 sata_rcar: fix deferred probing
   710e1e561630 iommu/arm-smmu-v3: Use explicit mb() when moving cons pointer
   61010bd9811d iommu/arm-smmu: Add support for qcom,smmu-v2 variant
   00b0fbb8f0e3 iommu/arm-smmu-v3: Avoid memory corruption from Hisilicon MSI payloads
   b59d70c07ab7 usb: dwc3: gadget: Disable CSP for stream OUT ep
   dfb22b6810c7 ARM: dts: imx51-zii-rdu1: Do not specify "power-gpio" for hpa1
   b5bb2cad5264 watchdog: renesas_wdt: don't set divider while watchdog is running
   f06d48b0a4b9 ARM: dts: Fix up the D-Link DIR-685 MTD partition info
   72d18db66d85 media: coda: fix H.264 deblocking filter controls
   8cc0518a49b3 mips: bpf: fix encoding bug for mm_srlv32_op
   463499c27cf9 ARM: dts: Fix OMAP4430 SDP Ethernet startup
   3a6f1afa7be1 iommu/amd: Fix amd_iommu=force_isolation
   389de86c1045 pinctrl: sx150x: handle failure case of devm_kstrdup
   26e62a227324 gpio: mt7621: pass mediatek_gpio_bank_probe() failure up the stack
   6c95c2eebead gpio: mt7621: report failure of devm_kasprintf()
   7eff52c36cfb usb: dwc3: trace: add missing break statement to make compiler happy
   91e46947d02f IB/hfi1: Unreserve a reserved request when it is completed
   f7debeebcdeb kobject: return error code if writing /sys/.../uevent fails
   80eac1847950 driver core: Move async_synchronize_full call
   1de47c06b3a3 tipc: fix node keep alive interval calculation
   a42bbdcf538d drm/amdgpu/powerplay: fix clock stretcher limits on polaris (v2)
   fb1ab6ac62b9 media: imx274: select REGMAP_I2C
   1bf188456312 clk: sunxi-ng: a33: Set CLK_SET_RATE_PARENT for all audio module clocks
   322a53b8f9b0 usb: mtu3: fix the issue about SetFeature(U1/U2_Enable)
   0105d80dd157 timekeeping: Use proper seqcount initializer
   263b0f92be96 usb: hub: delay hub autosuspend if USB3 port is still link training
   272e858c2293 usb: dwc2: Disable power down feature on Samsung SoCs
   93a6d3464023 usb: dwc3: Correct the logic for checking TRB full in __dwc3_prepare_one_trb()
   64257468feed xtensa: xtfpga.dtsi: fix dtc warnings about SPI
   54e71cb05054 smack: fix access permissions for keyring
   60d803577519 media: DaVinci-VPBE: fix error handling in vpbe_initialize()
   832819d11d4a media: i2c: TDA1997x: select CONFIG_HDMI
   c91ff9ab06eb x86/fpu: Add might_fault() to user_insn()
   9d79635b6267 ARM: dts: aspeed: add missing memory unit-address
   4f770b4ba564 ARM: dts: mmp2: fix TWSI2
   5214c28b688a drm/v3d: Fix prime imports of buffers from other drivers.
   14743f8591a7 arm64: ftrace: don't adjust the LR value
   5f4161ae9a75 mt76x0: dfs: fix IBI_R11 configuration on non-radar channels
   87ae793221cc s390/zcrypt: improve special ap message cmd handling
   eca31fc35afb firmware/efi: Add NULL pointer checks in efivars API functions
   9c74cd4afbd3 thermal: Fix locking in cooling device sysfs update cur_state
   f8a33ec5367e Thermal: do not clear passive state during system sleep
   ed0526b271b9 arm64: io: Ensure value passed to __iormb() is held in a 64-bit register
   68b4512ca6fc perf: arm_spe: handle devm_kasprintf() failure
   af6db7e751ff drm: Clear state->acquire_ctx before leaving drm_atomic_helper_commit_duplicated_state()
   2f0fb76b3e41 nfsd4: fix crash on writing v4_end_grace before nfsd startup
   50d4088c003b soc: bcm: brcmstb: Don't leak device tree node reference
   3fbba4e55051 sunvdc: Do not spin in an infinite loop when vio_ldc_send() returns EAGAIN
   d65fbc4fe9a9 net: aquantia: return 'err' if set MPI_DEINIT state fails
   dd46de15d830 arm64: io: Ensure calls to delay routines are ordered against prior readX()
   8543f5fce30f i2c: sh_mobile: add support for r8a77990 (R-Car E3)
   d54d612a73a6 f2fs: fix wrong return value of f2fs_acl_create
   ddab3d0a38a5 f2fs: fix race between write_checkpoint and write_begin
   c96d2b9d35b9 f2fs: move dir data flush to write checkpoint process
   4acd5adecf20 staging: pi433: fix potential null dereference
   6eaf5b9e6e7c ACPI: SPCR: Consider baud rate 0 as preconfigured state
   b945ddacf4ab media: adv*/tc358743/ths8200: fill in min width/height/pixelclock
   9c0403537ece iio: accel: kxcjk1013: Add KIOX010A ACPI Hardware-ID
   687901c64686 iio: adc: meson-saradc: fix internal clock names
   050f7e22f6a5 iio: adc: meson-saradc: check for devm_kasprintf failure
   0f9dff37d027 powerpc/32: Add .data..Lubsan_data*/.data..Lubsan_type* sections explicitly
   cefe8d2c0863 dmaengine: xilinx_dma: Remove __aligned attribute on zynqmp_dma_desc_ll
   3b07abf1cedf ptp: Fix pass zero to ERR_PTR() in ptp_clock_register
   2dbfc1cdb68a clk: meson: meson8b: mark the CPU clock as CLK_IS_CRITICAL
   43cf81c200cd clk: meson: meson8b: fix the width of the cpu_scale_div clock
   c36d06457afc clk: meson: meson8b: do not use cpu_div3 for cpu_scale_out_sel
   73e933de8935 staging: erofs: fix the definition of DBG_BUGON
   9eb74335f6be media: mtk-vcodec: Release device nodes in mtk_vcodec_init_enc_pm()
   580d8b2f6e76 media: video-i2c: avoid accessing released memory area when removing driver
   da77b546055c media: rc: ensure close() is called on rc_unregister_device
   b0b10168d1b3 soc/tegra: Don't leak device tree node reference
   504dcc424d28 perf tools: Add Hygon Dhyana support
   b6293e6c9000 modpost: validate symbol names also in find_elf_symbol
   1b63e37679cb net/mlx5: EQ, Use the right place to store/read IRQ affinity hint
   f6d66139f887 bpf: libbpf: retry map creation without the name
   0857b8439b6b drm/amd/display: calculate stream->phy_pix_clk before clock mapping
   d43f6c2ea4c0 drm/amd/display: fix gamma not being applied correctly
   8218fcf4666c ARM: OMAP2+: hwmod: Fix some section annotations
   d57b35f44fed drm/rockchip: fix for mailbox read size
   ab96959699fd usbnet: smsc95xx: fix rx packet alignment
   5ca33f7980c9 staging: iio: ad7780: update voltage on read
   39561eee9c57 scsi: hisi_sas: change the time of SAS SSP connection
   aa422af6d3dd i40e: prevent overlapping tx_timeout recover
   5a6b7e1b19ca platform/chrome: don't report EC_MKBP_EVENT_SENSOR_FIFO as wakeup
   922fd2d04644 vbox: fix link error with 'gcc -Og'
   f060c825c455 fpga: altera-cvp: fix 'bad IO access' on x86_64
   42e19f5664f0 Tools: hv: kvp: Fix a warning of buffer overflow with gcc 8.0.1
   9f941e80e679 fpga: altera-cvp: Fix registration for CvP incapable devices
   0edcb650bfe3 staging:iio:ad2s90: Make probe handle spi_setup failure
   76707e34f477 iwlwifi: fw: do not set sgi bits for HE connection
   3a11ec548c5b dpaa2-ptp: defer probe when portal allocation failed
   4ee24ae83ccb MIPS: Boston: Disable EG20T prefetch
   ab143302b0b2 ptp: check gettime64 return code in PTP_SYS_OFFSET ioctl
   49796c356187 serial: fsl_lpuart: clear parity enable bit when disable parity
   7543c3cf17c6 drm/vc4: ->x_scaling[1] should never be set to VC4_SCALING_NONE
   99eed8a29f9f crypto: aes_ti - disable interrupts while accessing S-box
   22ccd257add3 powerpc/pseries: add of_node_put() in dlpar_detach_node()
   534a0c21119b x86/PCI: Fix Broadcom CNB20LE unintended sign extension (redux)
   ee9268a9b55b dlm: Don't swamp the CPU with callbacks queued during recovery
   0d041add1ba0 clk: boston: fix possible memory leak in clk_boston_setup()
   4660207706ca ARM: 8808/1: kexec:offline panic_smp_self_stop CPU
   433f2f810291 scsi: lpfc: Fix LOGO/PLOGI handling when triggerd by ABTS Timeout event
   83430596d497 scsi: mpt3sas: Call sas_remove_host before removing the target devices
   3d08cdeb4486 scsi: lpfc: Correct LCB RJT handling
   3bfb1ba39cac ath9k: dynack: use authentication messages for 'late' ack
   f2dd96e607c6 ath10k: assign 'n_cipher_suites' for WCN3990
   3e5bffa5371d wil6210: fix memory leak in wil_find_tx_bcast_2
   8edf1df19ca1 wil6210: fix reset flow for Talyn-mb
   752abfadcb8b nds32: Fix gcc 8.0 compiler option incompatible.
   a6eccfac8393 gpu: ipu-v3: image-convert: Prevent race between run and unprepare
   46ed4f4fa1cf genirq/affinity: Spread IRQs to all available NUMA nodes
   2198c2c15eee drm/sun4i: Initialize registers in tcon-top driver
   3555de57dca4 gpiolib: Fix possible use after free on label
   9e4b0f771735 ASoC: Intel: mrfld: fix uninitialized variable access
   9d9fcc11b860 pinctrl: bcm2835: Use raw spinlock for RT compatibility
   8095fe603e16 drm/vgem: Fix vgem_init to get drm device available.
   2ca14d0d2576 staging: iio: adc: ad7280a: handle error from __ad7280_read32()
   a8b9f4f627c3 drm/bufs: Fix Spectre v1 vulnerability
   26d074199730 devres: Align data[] to ARCH_KMALLOC_MINALIGN
   323e0195e63f Linux 4.19.20
   c0be624777ba cifs: Always resolve hostname before reconnecting
   e7f11c55ad60 md/raid5: fix 'out of memory' during raid cache recovery
   5b3109eb89dd of: overlay: do not duplicate properties from overlay for new nodes
   7251e4b835ea of: overlay: use prop add changeset entry for property in new nodes
   9af27fab0061 of: overlay: add missing of_node_get() in __of_attach_node_sysfs
   5006496fb2c8 of: overlay: add tests to validate kfrees from overlay removal
   3edc2fac969a of: Convert to using %pOFn instead of device_node.name
   214dea147ffa mm: migrate: don't rely on __PageMovable() of newpage after unlocking it
   ced41d9d6a1b mm: hwpoison: use do_send_sig_info() instead of force_sig()
   b6f534ab695b mm, oom: fix use-after-free in oom_kill_process
   d9f4d88d567e mm,memory_hotplug: fix scan_movable_pages() for gigantic hugepages
   7e70ddc33279 oom, oom_reaper: do not enqueue same task twice
   15033ca6bd13 mm/hugetlb.c: teach follow_hugetlb_page() to handle FOLL_NOWAIT
   c7122344f915 kernel/exit.c: release ptraced tasks before zap_pid_ns_processes
   9ee5987f311f btrfs: On error always free subvol_name in btrfs_mount
   5bce143671f3 Btrfs: fix deadlock when allocating tree block during leaf/node split
   50a874a4aa28 mmc: sdhci-iproc: handle mmc_of_parse() errors during probe
   8a32f086ff7e platform/x86: asus-nb-wmi: Drop mapping of 0x33 and 0x34 scan codes
   734f06f5a701 platform/x86: asus-nb-wmi: Map 0x35 to KEY_SCREENLOCK
   71ff3384d1fb IB/hfi1: Remove overly conservative VM_EXEC flag check
   1ac48dafac4b ALSA: hda/realtek - Fixed hp_pin no value
   eaf53ee6fba7 ALSA: usb-audio: Add Opus #3 to quirks for native DSD support
   9f753f62f6fa mmc: mediatek: fix incorrect register setting of hs400_cmd_int_delay
   65be3226f0e5 mmc: bcm2835: Fix DMA channel leak on probe error
   8b9be9db8a2a gfs2: Revert "Fix loop in gfs2_rbm_find"
   83c22cd104b2 gpio: sprd: Fix incorrect irq type setting for the async EIC
   3a4a800bf519 gpio: sprd: Fix the incorrect data register
   95fcc1427d7f gpio: pcf857x: Fix interrupts on multiple instances
   452ad274c926 gpiolib: fix line event timestamps for nested irqs
   ade5ad6b4ad6 gpio: altera-a10sr: Set proper output level for direction_output
   ad6615b15537 arm64: hibernate: Clean the __hyp_text to PoC after resume
   f40ebe14b971 arm64: hyp-stub: Forbid kprobing of the hyp-stub
   520036320530 arm64: Do not issue IPIs for user executable ptes
   a4f42f7b0121 arm64: kaslr: ensure randomized quantities are clean also when kaslr is off
   26d15be4abc0 ARM: cns3xxx: Fix writing to wrong PCI config registers after alignment
   0a3275d78585 NFS: Fix up return value on fatal errors in nfs_page_async_flush()
   0fb0acc0dd86 selftests/seccomp: Enhance per-arch ptrace syscall skip tests
   7e3251667a1f iommu/vt-d: Fix memory leak in intel_iommu_put_resv_regions()
   bb4e1ff5a8dd fs/dcache: Fix incorrect nr_dentry_unused accounting in shrink_dcache_sb()
   e9d56f920bb2 CIFS: Do not consider -ENODATA as stat failure for reads
   6e7045ec336b CIFS: Fix trace command logging for SMB2 reads and writes
   c6961288a5f4 CIFS: Do not count -ENODATA as failure for query directory
   fbb49172cd4f virtio_net: Differentiate sk_buff and xdp_frame on freeing
   ed6a5fc89e48 virtio_net: Use xdp_return_frame to free xdp_frames on destroying vqs
   05e260f9d02a virtio_net: Don't process redirected XDP frames when XDP is disabled
   0921dd505d30 virtio_net: Fix out of bounds access of sq
   d97117bd077d virtio_net: Fix not restoring real_num_rx_queues
   4c2e63dc6452 virtio_net: Don't call free_old_xmit_skbs for xdp_frames
   b6862baa3c88 virtio_net: Don't enable NAPI when interface is down
   37b34a91f346 sctp: set flow sport from saddr only when it's 0
   cbf23d40cece sctp: set chunk transport correctly when it's a new asoc
   a188f5685965 Revert "net/mlx5e: E-Switch, Initialize eswitch only if eswitch manager"
   505e5f3d4623 ip6mr: Fix notifiers call on mroute_clean_tables()
   50990a4085f2 net/mlx5e: Allow MAC invalidation while spoofchk is ON
   4ec13999d363 sctp: improve the events for sctp stream adding
   9f7d849beaae net: ip6_gre: always reports o_key to userspace
   aafe74b72689 vhost: fix OOB in get_rx_bufs()
   d0773852a7a3 ucc_geth: Reset BQL queue when stopping device
   dace52749243 tun: move the call to tun_set_real_num_queues
   e569927a1375 sctp: improve the events for sctp stream reset
   4fae696cdad1 ravb: expand rx descriptor data to accommodate hw checksum
   5f1a18e05b07 net: set default network namespace in init_dummy_netdev()
   fc4154c7a39e net/rose: fix NULL ax25_cb kernel panic
   2c6b572458a9 netrom: switch to sock timer API
   00865891898e net/mlx4_core: Add masking for a few queries on HCA caps
   0a198e0bb8be net: ip_gre: use erspan key field for tunnel lookup
   897ea28bd2f9 net: ip_gre: always reports o_key to userspace
   8de676664e59 l2tp: fix reading optional fields of L2TPv3
   3d418a254df1 l2tp: copy 4 more bytes to linear part if necessary
   fcc9c69a6ed7 ipvlan, l3mdev: fix broken l3s mode wrt local routes
   2f704348c93f ipv6: sr: clear IP6CB(skb) on SRH ip4ip6 encapsulation
   7e9a6476aaf5 ipv6: Consider sk_bound_dev_if when binding a socket to an address
   8877843b3b9f drm/msm/gpu: fix building without debugfs
   8c763a3cf502 Fix "net: ipv4: do not handle duplicate fragments as overlapping"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_4.19.bb              |  6 +++---
 .../linux/linux-yocto-tiny_4.19.bb            |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 0f3a498dcc..fdf7ce1435 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6a02e73544953583e575a0f6c8797b6f4eb02fb7"
-SRCREV_meta ?= "b173a1b0a218f2bebc28251ef08ee592652b6bc0"
+SRCREV_machine ?= "264e7ef1dcc8ae753f36a7d13c8570690d28e3f9"
+SRCREV_meta ?= "d85f07e03c980eca5ffd5ba058985d6ed3a83801"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.19.19"
+LINUX_VERSION ?= "4.19.30"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 3f54f4f2d8..54e8de116f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.19.19"
+LINUX_VERSION ?= "4.19.30"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "94da18b1810c993f211e906a146adc69fbbd6304"
-SRCREV_machine ?= "148322096f4147947955fa83c9863eed4ac23897"
-SRCREV_meta ?= "b173a1b0a218f2bebc28251ef08ee592652b6bc0"
+SRCREV_machine_qemuarm ?= "03eb6106990498e86298646c682fce9fc61f2131"
+SRCREV_machine ?= "253c39a252f25843111b7be0c8247eb4bd6c328d"
+SRCREV_meta ?= "d85f07e03c980eca5ffd5ba058985d6ed3a83801"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index a3e6cd6526..fb4f7654b5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -11,22 +11,22 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
 KBRANCH_qemux86-64 ?= "v4.19/standard/base"
 KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "5fe7d1bfb1d030c1e696efef2ee89974874c0b01"
-SRCREV_machine_qemuarm64 ?= "148322096f4147947955fa83c9863eed4ac23897"
-SRCREV_machine_qemumips ?= "7ec0c72dac55c5b72c82fb3bcc4f44ff59d79c4d"
-SRCREV_machine_qemuppc ?= "148322096f4147947955fa83c9863eed4ac23897"
-SRCREV_machine_qemux86 ?= "148322096f4147947955fa83c9863eed4ac23897"
-SRCREV_machine_qemux86-64 ?= "148322096f4147947955fa83c9863eed4ac23897"
-SRCREV_machine_qemumips64 ?= "141bb3296422e09cfb0a8ef06f2e7f1748bb8f65"
-SRCREV_machine ?= "148322096f4147947955fa83c9863eed4ac23897"
-SRCREV_meta ?= "b173a1b0a218f2bebc28251ef08ee592652b6bc0"
+SRCREV_machine_qemuarm ?= "3df49db2ea9b8e800cb30d5d695d4d2a2f8c1bed"
+SRCREV_machine_qemuarm64 ?= "253c39a252f25843111b7be0c8247eb4bd6c328d"
+SRCREV_machine_qemumips ?= "5dc975d0e586edd5d33bce62560f998f9a246be6"
+SRCREV_machine_qemuppc ?= "253c39a252f25843111b7be0c8247eb4bd6c328d"
+SRCREV_machine_qemux86 ?= "253c39a252f25843111b7be0c8247eb4bd6c328d"
+SRCREV_machine_qemux86-64 ?= "253c39a252f25843111b7be0c8247eb4bd6c328d"
+SRCREV_machine_qemumips64 ?= "bb7ae8a8cbe76c9ce2804f651936f059f9f621a2"
+SRCREV_machine ?= "253c39a252f25843111b7be0c8247eb4bd6c328d"
+SRCREV_meta ?= "d85f07e03c980eca5ffd5ba058985d6ed3a83801"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
           "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.19.19"
+LINUX_VERSION ?= "4.19.30"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


