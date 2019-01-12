Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 17CCA7C0C6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 18:13:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0CIDaeX018380
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 12 Jan 2019 10:13:37 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Sat, 12 Jan 2019 10:13:36 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sat, 12 Jan 2019 13:12:52 -0500
Message-ID: <ffff11219f3daf5dab886f6fa36302646c93614d.1547316462.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1547316462.git.bruce.ashfield@windriver.com>
References: <cover.1547316462.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/4.19: update to v4.19.14
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
X-List-Received-Date: Sat, 12 Jan 2019 18:13:37 -0000
Content-Type: text/plain

Integrating the korg -stable updates that comprise the following commits:

   f630d3cc771e Linux 4.19.14
   a4a929aa46b4 MIPS: Only include mmzone.h when CONFIG_NEED_MULTIPLE_NODES=y
   feb0be15ee8b spi: bcm2835: Unbreak the build of esoteric configs
   62977aad0a52 tpm: tpm_i2c_nuvoton: use correct command duration for TPM 2.x
   7f4a7b1badcf tpm: tpm_try_transmit() refactor error flow.
   920735c63d8a arm64: compat: Avoid sending SIGILL for unallocated syscall numbers
   1817b2ccbd11 iommu/arm-smmu-v3: Fix big-endian CMD_SYNC writes
   f318d0cf26b1 KVM: arm/arm64: vgic: Fix off-by-one bug in vgic_get_irq()
   47ffaa7decc5 KVM: arm/arm64: vgic-v2: Set active_source to 0 when restoring state
   6318b1b7c90c KVM: arm/arm64: vgic: Cap SPIs to the VM-defined maximum
   f0fcc4d17cf4 KVM: arm/arm64: vgic: Do not cond_resched_lock() with IRQs disabled
   ce866af60e90 rtc: m41t80: Correct alarm month range with RTC reads
   badd5690661b ARM: dts: exynos: Specify I2S assigned clocks in proper node
   0fa68518047b arm/arm64: KVM: vgic: Force VM halt when changing the active state of GICv3 PPIs/SGIs
   7ec9ea679c96 arm64: KVM: Avoid setting the upper 32 bits of VTCR_EL2 to 1
   ba77e8c7f704 smb3: fix large reads on encrypted connections
   1827d1c439bc CIFS: Fix error mapping for SMB2_LOCK command which caused OFD lock problem
   db825a79e07a MIPS: Fix a R10000_LLSC_WAR logic in atomic.h
   34c512d883b3 MIPS: OCTEON: mark RGMII interface disabled on OCTEON III
   fb38b12e0b2b MIPS: Expand MIPS32 ASIDs to 64 bits
   88c61f5cb67d MIPS: Align kernel load address to 64KB
   76a9f7b4be28 MIPS: Ensure pmd_present() returns false after pmd_mknotpresent()
   e8ae2ae2aae5 MIPS: c-r4k: Add r4k_blast_scache_node for Loongson-3
   62452b351195 MIPS: math-emu: Write-protect delay slot emulation pages
   d642e0b630b0 tools lib traceevent: Fix processing of dereferenced args in bprintk events
   47af3cecd561 media: v4l2-tpg: array index could become negative
   245fc1c7f688 media: vb2: check memory model for VIDIOC_CREATE_BUFS
   845c7f6cbc98 media: vivid: free bitmap_cap when updating std/timings/etc.
   257ad26e7e98 media: imx274: fix stack corruption in imx274_read_reg
   7ce31f635b23 media: rc: cec devices do not have a lirc chardev
   2f8cff22960b media: cec-pin: fix broken tx_ignore_nack_until_eom error injection
   465153038583 media: cec: keep track of outstanding transmits
   e534754ffd93 serial: uartps: Fix interrupt mask issue to handle the RX interrupts properly
   5036fcd9b145 f2fs: sanity check of xattr entry size
   58d7ab7163d9 f2fs: fix validation of the block count in sanity_check_raw_super
   ce5b0057f768 f2fs: read page index before freeing
   9621ea6b9c4c dax: Use non-exclusive wait in wait_entry_unlocked()
   c555772c2a4e dax: Don't access a freed inode
   a9935a127688 powerpc/tm: Unset MSR[TS] if not recheckpointing
   71cda0af3670 brcmfmac: Fix out of bounds memory access during fw load
   fad6c183e20b brcmfmac: fix roamoff=1 modparam
   9eec74b48477 Btrfs: send, fix race with transaction commits that create snapshots
   6911b074a005 btrfs: run delayed items before dropping the snapshot
   10b04210aabf Btrfs: fix fsync of files with multiple hard links in new directories
   7708a83090ba btrfs: skip file_extent generation check for free_space_inode in run_delalloc_nocow
   c1f90eb01971 btrfs: dev-replace: go back to suspend state if another EXCL_OP is running
   28867a52e48d btrfs: dev-replace: go back to suspended state if target device is missing
   326ca6bd0fae cdc-acm: fix abnormal DATA RX issue for Mediatek Preloader.
   8a2fbdd5b020 cgroup: fix CSS_TASK_ITER_PROCS
   99dcd45f274e crypto: cfb - fix decryption
   d8e4b24ffbbb crypto: testmgr - add AES-CFB tests
   cc43a8afa8e3 crypto: chcr - small packet Tx stalls the queue
   0fa6bead41ba crypto: cavium/nitrox - fix a DMA pool free failure
   d095e1ba4165 clk: sunxi-ng: Use u64 for calculation of NM rate
   36ef9d14fdda clk: rockchip: fix typo in rk3188 spdif_frac parent
   9e9c669859f6 spi: bcm2835: Avoid finishing transfer prematurely in IRQ mode
   cc8b83ff6a69 spi: bcm2835: Fix book-keeping of DMA termination
   63f97d305aed spi: bcm2835: Fix race on DMA termination
   0cb4f6559087 ext4: check for shutdown and r/o file system in ext4_write_inode()
   bf2fd1f97040 ext4: force inode writes when nfsd calls commit_metadata()
   263663888d2f ext4: avoid declaring fs inconsistent due to invalid file handles
   6633fcb231a0 ext4: include terminating u32 in size of xattr entries when expanding inodes
   11bb168baef2 ext4: fix EXT4_IOC_GROUP_ADD ioctl
   0d078853b87a ext4: missing unlock/put_page() in ext4_try_to_write_inline_data()
   0a1c177dd903 ext4: fix possible use after free in ext4_quota_enable
   b878c8a7f08f ext4: add ext4_sb_bread() to disambiguate ENOMEM cases
   6665481e1c21 ocxl: Fix endiannes bug in read_afu_name()
   3fbf78b25268 ocxl: Fix endiannes bug in ocxl_link_update_pe()
   65e4e67de33d perf env: Also consider env->arch == NULL as local operation
   d124dd5c6ace perf pmu: Suppress potential format-truncation warning
   307dbd383650 perf script: Use fallbacks for branch stacks
   39dad822b785 perf tools: Use fallback for sample_addr_correlates_sym() cases
   0ada27a74438 perf thread: Add fallback functions for cases where cpumode is insufficient
   62977a9ba8dd perf machine: Record if a arch has a single user/kernel address space
   bf75d9382bc4 clocksource/drivers/arc_timer: Utilize generic sched_clock
   ca3a6fd272bb DRM: UDL: get rid of useless vblank initialization
   29ac2218a9f8 drm/v3d: Skip debugfs dumping GCA on platforms without GCA.
   6c56e89e4ebe platform-msi: Free descriptors in platform_msi_domain_free()
   c9dae887cf64 KVM: nVMX: Free the VMREAD/VMWRITE bitmaps if alloc_kvm_area() fails
   07cbcfc33fc9 arm64: KVM: Make VHE Stage-2 TLB invalidation operations non-interruptible
   edcf33b155fe KVM: x86: Use jmp to invoke kvm_spurious_fault() from .fixup
   4910271928c2 x86/mm: Drop usage of __flush_tlb_all() in kernel_physical_mapping_init()
   86ba6f66c9c1 x86/speculation/l1tf: Drop the swap storage limit restriction when l1tf=off
   aeb5e5341696 Input: elan_i2c - add ACPI ID for touchpad in ASUS Aspire F5-573G
   f1680565304c Input: atmel_mxt_ts - don't try to free unallocated kernel memory
   d648a9bdac4b s390/pci: fix sleeping in atomic during hotplug
   47148001ae12 ASoC: intel: cht_bsw_max98090_ti: Add pmc_plt_clk_0 quirk for Chromebook Gnawty
   c4b6173e54ca ASoC: intel: cht_bsw_max98090_ti: Add pmc_plt_clk_0 quirk for Chromebook Clapper
   6cd208cb934f staging: wilc1000: fix missing read_write setting when reading data
   80562cf3b188 media: dvb-usb-v2: Fix incorrect use of transfer_flags URB_FREE_BUFFER
   f295bc9b8c9c usb: roles: Add a description for the class to Kconfig
   9c1f18773406 Revert "usb: dwc3: pci: Use devm functions to get the phy GPIOs"
   b1ab9f3d69f6 usb: dwc2: disable power_down on Amlogic devices
   5e4dbeba2add usb: r8a66597: Fix a possible concurrency use-after-free bug in r8a66597_endpoint_disable()
   8a5d034b5e86 USB: serial: option: add Fibocom NL678 series
   f37b8b18b54f USB: serial: pl2303: add ids for Hewlett-Packard HP POS pole displays
   9339eaf7ff4f usb: dwc2: host: use hrtimer for NAK retries
   2c7882957c12 ALSA: hda/tegra: clear pending irq handlers
   22bc89a31109 ALSA: hda/realtek: Enable the headset mic auto detection for ASUS laptops
   302d9834ef29 ALSA: firewire-lib: use the same print format for 'without_header' tracepoints
   ec7334b5ad18 ALSA: firewire-lib: fix wrong assignment for 'out_packet_without_header' tracepoint
   438b26705896 ALSA: firewire-lib: fix wrong handling payload_length as payload_quadlet
   a8be7cd59d37 ALSA: fireface: fix for state to fetch PCM frames
   9ded351759d0 ALSA: hda/realtek: Enable audio jacks of ASUS UX391UA with ALC294
   691d06e60d9d ALSA: hda: add mute LED support for HP EliteBook 840 G4
   cec876b46e19 mtd: rawnand: omap2: Pass the parent of pdev to dma_request_chan()
   5cad883fd612 mtd: rawnand: marvell: prevent timeouts on a loaded machine
   586209404782 mtd: atmel-quadspi: disallow building on ebsa110
   34fc09193486 powerpc/fsl: Fix spectre_v2 mitigations reporting
   eb734900aa83 ALSA: emux: Fix potential Spectre v1 vulnerabilities
   56971d62c759 ALSA: pcm: Fix potential Spectre v1 vulnerability
   0d2270496891 ALSA: emu10k1: Fix potential Spectre v1 vulnerabilities
   67b6a811a5f0 ALSA: rme9652: Fix potential Spectre v1 vulnerability
   91dea490a4e1 IB/hfi1: Incorrect sizing of sge for PIO will OOPs
   648458fe97b5 r8169: fix WoL device wakeup enable
   e4a2ffe9029f net: Use __kernel_clockid_t in uapi net_stamp.h
   e15413d61d4e net: mvneta: fix operation for 64K PAGE_SIZE
   e97ecb19fee9 net/mlx5e: RX, Fix wrong early return in receive queue poll
   e72e92914387 net/mlx5e: Remove unused UDP GSO remaining counter
   af93ac090110 mlxsw: core: Increase timeout during firmware flash process
   a8b01caff7d4 qed: Fix command number mismatch between driver and the mfw
   5696ca93120b net: mvpp2: fix the phylink mode validation
   fe65dfcca1b9 net/mlx5e: RX, Verify MPWQE stride size is in range
   78512e346836 net/mlx5e: Cancel DIM work on close SQ
   935bc9ddd774 mscc: Configured MAC entries should be locked.
   ccc8b3747327 ipv6: route: Fix return value of ip6_neigh_lookup() on neigh_create() error
   2210c2737e19 nfp: flower: ensure TCP flags can be placed in IPv6 frame
   fe3f820c18b0 net/ipv6: Fix a test against 'ipv6_find_idev()' return value
   5ac4cc331bca ipv6: frags: Fix bogus skb->sk in reassembled packets
   9ed77be31e95 net/mlx5e: Remove the false indication of software timestamping support
   7942d5be4922 tipc: check group dests after tipc_wait_for_cond()
   71e848bd5e1d net/mlx5: Typo fix in del_sw_hw_rule
   3a1cbcf4f3ae xen/netfront: tolerate frags with no data
   d7c2162d5ab6 VSOCK: Send reset control packet when socket is partially bound
   2b23a3651749 vhost: make sure used idx is seen before log in vhost_add_used_n()
   2ce6d5aeafba tipc: use lock_sock() in tipc_sk_reinit()
   b66ecc4f0b36 tipc: fix a double kfree_skb()
   f404723deb69 tipc: fix a double free in tipc_enable_bearer()
   a2ee6fb9c675 tipc: compare remote and local protocols in tipc_udp_enable()
   dc6c13d5d5b4 tipc: check tsk->group in tipc_wait_for_cond()
   e52170348715 tcp: fix a race in inet_diag_dump_icsk()
   60f05dddf1eb sock: Make sock->sk_stamp thread-safe
   fff7f7178630 sctp: initialize sin6_flowinfo for ipv6 addrs in sctp_inet6addr_event
   2ec3976e29f2 qmi_wwan: Add support for Fibocom NL678 series
   b7934b17b8f8 qmi_wwan: Added support for Telit LN940 series
   a47e4db747f6 qmi_wwan: Added support for Fibocom NL668 series
   6e36567284cf ptr_ring: wrap back ->producer in __ptr_ring_swap_queue()
   4037ce1b28ca packet: validate address length if non-zero
   a35c9c1712df packet: validate address length
   781e26adfdea net/wan: fix a double free in x25_asy_open_tty()
   f624d95c9937 net/tls: allocate tls context using GFP_ATOMIC
   42e8bf856838 net: stmmac: Fix an error code in probe()
   e028017380f0 net/smc: fix TCP fallback socket release
   a1bce7196b72 netrom: fix locking in nr_find_socket()
   4d1edda006a5 net: phy: Fix the issue that netif always links up after resuming
   e3ba5b266e6b net: mvpp2: 10G modes aren't supported on all ports
   5ea9c08a8692 net: macb: restart tx after tx used bit read
   d5f9565c8d5a net: ipv4: do not handle duplicate fragments as overlapping
   acb70d28fe63 net/hamradio/6pack: use mod_timer() to rearm timers
   281731c8170a net: clear skb->tstamp in forwarding paths
   ec820972c543 isdn: fix kernel-infoleak in capi_unlocked_ioctl
   cde81154f86e ip: validate header length on virtual device xmit
   0d2b652b0732 ipv6: tunnels: fix two use-after-free
   cae3c9cf9d7d ipv6: explicitly initialize udp6_addr in udp_sock_create6()
   360fb1db92df ipv4: Fix potential Spectre v1 vulnerability
   32403fd3b529 ip6mr: Fix potential Spectre v1 vulnerability
   110c877da975 ieee802154: lowpan_header_create check must check daddr
   42b676c72e04 ibmveth: fix DMA unmap error in ibmveth_xmit_start error path
   3c859adedd52 gro_cell: add napi_disable in gro_cells_destroy
   3e881d8764ed ax25: fix a use-after-free in ax25_fillin_cb()
   c04c050f5bf9 Linux 4.19.13
   7f3ebea19795 drm/ioctl: Fix Spectre v1 vulnerabilities
   6bb41321166f proc/sysctl: don't return ENOMEM on lookup when a table is unregistering
   488f2c66dd46 Input: elantech - disable elan-i2c for P52 and P72
   a5e880969713 mm: don't miss the last page because of round-off error
   e27666dd8ffa mm, page_alloc: fix has_unmovable_pages for HugePages
   161a5654cf06 mm: thp: fix flags for pmd migration when split
   7592dbfaf3ef mm, memory_hotplug: initialize struct pages for the full memory section
   3fbd4d87f1d1 media: ov5640: Fix set format regression
   7f30924b488f iwlwifi: add new cards for 9560, 9462, 9461 and killer series
   9007fba734d0 Revert "mwifiex: restructure rx_reorder_tbl_lock usage"
   c151740ff107 iwlwifi: mvm: don't send GEO_TX_POWER_LIMIT to old firmwares
   fed44d6cb15f rtlwifi: Fix leak of skb when processing C2H_BT_INFO
   5ecdfbb0d9f0 xfrm_user: fix freeing of xfrm states on acquire
   89d6fff0747f mm: introduce mm_[p4d|pud|pmd]_folded
   ba38c3e78838 mm: make the __PAGETABLE_PxD_FOLDED defines non-empty
   28a3b553dd31 mm: add mm_pxd_folded checks to pgtable_bytes accounting functions
   384221cbb918 panic: avoid deadlocks in re-entrant console drivers
   0a95cba52bf2 x86/intel_rdt: Ensure a CPU remains online for the region's pseudo-locking sequence
   56f7bfac531a x86/vdso: Pass --eh-frame-hdr to the linker
   1e3b98b28c0d x86/mm: Fix decoy address handling vs 32-bit builds
   c623326a3398 x86/mtrr: Don't copy uninitialized gentry fields back to userspace
   9933bfb6d3f2 futex: Cure exit race
   c1f8e7acb0c2 Drivers: hv: vmbus: Return -EINVAL for the sys files for unopened channels
   1972ca047083 KVM: Fix UAF in nested posted interrupt processing
   229468c62942 kvm: x86: Add AMD's EX_CFG to the list of ignored MSRs
   76281d12dac9 KVM: X86: Fix NULL deref in vcpu_scan_ioapic
   82c8dbb376b9 posix-timers: Fix division by zero bug
   1f51527d020e gpiolib-acpi: Only defer request_irq for GpioInt ACPI event handlers
   85ac860a5fdf gpio: max7301: fix driver for use with CONFIG_VMAP_STACK
   0867cfaabcf7 mmc: omap_hsmmc: fix DMA API warning
   b38f6898b60c mmc: core: Use a minimum 1600ms timeout when enabling CACHE ctrl
   12df9797d98c mmc: core: Allow BKOPS and CACHE ctrl even if no HPI support
   f465300aab0d mmc: core: Reset HPI enabled state during re-init and in case of errors
   024d515aab9b scsi: sd: use mempool for discard special page
   690699b27185 scsi: t10-pi: Return correct ref tag when queue has no integrity profile
   073645885686 ubifs: Handle re-linking of inodes correctly while recovery
   507a953af925 USB: serial: option: add Telit LN940 series
   81dfcd0b2c17 USB: serial: option: add Fibocom NL668 series
   4e0f50024696 USB: serial: option: add Simcom SIM7500/SIM7600 (MBIM mode)
   cc0667b533a9 USB: serial: option: add HP lt4132
   7a37019379d6 USB: serial: option: add GosunCn ZTE WeLink ME3630
   a67fb441decd USB: xhci: fix 'broken_suspend' placement in struct xchi_hcd
   e13bfb357f5b xhci: Don't prevent USB2 bus suspend in state check intended for USB3 only
   8f980122236c USB: hso: Fix OOB memory access in hso_probe/hso_get_config_data
   9c5ccadb7b42 Revert "vfs: Allow userns root to call mknod on owned filesystems."
   38d072a4a717 iomap: Revert "fs/iomap.c: get/put the page in iomap_page_create/release()"
   2a7cb228d29c Linux 4.19.12
   b4c7c826709b Btrfs: fix missing delayed iputs on unmount
   5f286ec243d3 nvmet-rdma: fix response use after free
   b2d587568588 nvme: validate controller state before rescheduling keep alive
   cab9d27671db i2c: uniphier-f: fix violation of tLOW requirement for Fast-mode
   eb296b2d315b i2c: uniphier: fix violation of tLOW requirement for Fast-mode
   9d5db5becd74 i2c: scmi: Fix probe error on devices with an empty SMB0001 ACPI device node
   9be9c23a507a i2c: axxia: properly handle master timeout
   8175f9d39789 mlxsw: spectrum_switchdev: Fix VLAN device deletion via ioctl
   50dc13e2b3c6 vhost/vsock: fix reset orphans race with close timeout
   b5a8028c25f3 cifs: In Kconfig CONFIG_CIFS_POSIX needs depends on legacy (insecure cifs)
   e6a5c4948c2c drm/ast: Fix connector leak during driver unload
   10197442f1fb acpi/nfit: Fix user-initiated ARS to be "ARS-long" rather than "ARS-short"
   d689c1371d18 tools/testing/nvdimm: Align test resources to 128M
   878275fa3e75 drm/amdgpu/vcn: Update vcn.cur_state during suspend
   e6a57a90b371 net: mvpp2: fix phylink handling of invalid PHY modes
   f124acc92c83 net: mvpp2: fix detection of 10G SFP modules
   42d040e2c7b9 thermal: armada: fix legacy validity test sense
   4c2efd8cf5d9 ethernet: fman: fix wrong of_node_put() in probe function
   80eaec9b94bc ARM: 8816/1: dma-mapping: fix potential uninitialized return
   5cb9667104e8 ARM: 8815/1: V7M: align v7m_dma_inv_range() with v7 counterpart
   b3d52556794c ARM: 8814/1: mm: improve/fix ARM v7_dma_inv_range() unaligned address handling
   6ffd9f25c0e9 bpf: check pending signals while verifying programs
   efda3b1d90e5 net/mlx4_en: Fix build break when CONFIG_INET is off
   4ae4046a1246 mv88e6060: disable hardware level MAC learning
   2ef6e0fe383f macvlan: return correct error value
   2ed4392b0bb3 libata: whitelist all SAMSUNG MZ7KM* solid-state disks
   62a866ed4c48 Input: omap-keypad - fix keyboard debounce configuration
   65905f7b9033 Input: synaptics - enable SMBus for HP 15-ay000
   8e09f402321e clk: mmp: Off by one in mmp_clk_add()
   70c883946441 clk: mvebu: Off by one bugs in cp110_of_clk_get()
   92bc065001a6 drm/amd/powerplay: issue pre-display settings for display change event
   ee404810e01e drm/msm: Fix error return checking
   38b579de0b9a drm/msm: dpu: Fix "WARNING: invalid free of devm_ allocated data"
   b7c819a03ae8 drm/msm: dpu: Don't set legacy plane->crtc pointer
   80f68af97440 drm/msm/hdmi: Enable HPD after HDMI IRQ is set up
   580fd7b5452c ide: pmac: add of_node_put()
   b37b7d5b9086 drivers/tty: add missing of_node_put()
   78e974363bbc drivers/sbus/char: add of_node_put()
   90d62a36352a sbus: char: add of_node_put()
   20595815b058 SUNRPC: Fix a potential race in xprt_connect()
   de956d407811 nfs: don't dirty kernel pages read by direct-io
   b0cf59188ec2 liquidio: read sc->iq_no before release sc
   85099bea9743 bpf: Fix verifier log string check for bad alignment.
   aa4540d8cc87 bonding: fix 802.3ad state sent to partner when unbinding slave
   43f5afa3eaae net: aquantia: fix rx checksum offload bits
   0df6d609c5d2 net: stmmac: Move debugfs init/exit to ->probe()/->remove()
   bf69dc3cb1b8 ARC: io.h: Implement reads{x}()/writes{x}()
   dbb0f9e74655 drm/amdgpu: wait for IB test on first device open
   546486c5b196 drm/ttm: fix LRU handling in ttm_buffer_object_transfer
   01ba4fd98947 drm/msm: Grab a vblank reference when waiting for commit_done
   801f12d991bc drm/msm/dsi: configure VCO rate for 10nm PLL driver
   d60ec2e70298 drm/msm: fix handling of cmdstream offset
   7de8218615d3 drm/msm/gpu: Fix a couple memory leaks in debugfs
   35516413ae5a drm/msm: Fix task dump in gpu recovery
   985dea32ba57 x86/earlyprintk/efi: Fix infinite loop on some screen widths
   3965b4f0c37f drm/amd/display: Fix 6x4K displays light-up on Vega20 (v2)
   bdf7c4c84bea net: ethernet: ave: Replace NET_IP_ALIGN with AVE_FRAME_HEADROOM
   112a7f8e0540 tools/bpf: add addition type tests to test_btf
   8b26fd26d69f tools/bpf: fix two test_btf unit test cases
   a58fb8346d3c scsi: vmw_pscsi: Rearrange code to avoid multiple calls to free_irq during unload
   13b968d59bb5 scsi: libiscsi: Fix NULL pointer dereference in iscsi_eh_session_reset
   b288daf8e1da i2c: rcar: check bus state before reinitializing
   53e0d8ecc83f Input: hyper-v - fix wakeup from suspend-to-idle
   ff7d99c424ae mac80211_hwsim: fix module init error paths for netlink
   70b0baddd09b IB/hfi1: Remove race conditions in user_sdma send path
   2658687568cd locking/qspinlock, x86: Provide liveness guarantee
   150f038c9382 locking/qspinlock: Re-order code
   2a5f80c5bd72 Linux 4.19.11
   d92c66b30f93 x86/build: Fix compiler support check for CONFIG_RETPOLINE
   228f6f28d478 dm zoned: Fix target BIO completion handling
   7b942bad3818 drm/amdgpu: update SMC firmware image for polaris10 variants
   3ae86cfbbbf6 drm/amdgpu: update smu firmware images for VI variants (v2)
   2732df872c63 drm/amdgpu: add some additional vega10 pci ids
   95baf54676a8 drm/amdkfd: add new vega10 pci ids
   d68d2ad54474 drm/amdgpu/powerplay: Apply avfs cks-off voltages on VI
   f0e9995f7eed drm/i915/execlists: Apply a full mb before execution for Braswell
   d6ebe485da3d drm/i915/gvt: Fix tiled memory decoding bug on BDW
   683ef526234f Revert "drm/rockchip: Allow driver to be shutdown on reboot/kexec"
   4d5907f70ec1 drm/nouveau/kms/nv50-: also flush fb writes when rewinding push buffer
   d7fde95b7f3f drm/nouveau/kms: Fix memory leak in nv50_mstm_del()
   c97c353e5f29 powerpc: Look for "stdout-path" when setting up legacy consoles
   73732de1579f powerpc/msi: Fix NULL pointer access in teardown code
   13e318b8680e media: vb2: don't call __vb2_queue_cancel if vb2_start_streaming failed
   ee310e8ebb9e tracing: Fix memory leak of instance function hash filters
   8f01f990b19f tracing: Fix memory leak in set_trigger_filter()
   470cc678a12b tracing: Fix memory leak in create_filter()
   b543b5c0ac1c dm: call blk_queue_split() to impose device limits on bios
   09bc666fb411 dm cache metadata: verify cache has blocks in blocks_are_clean_separate_dirty()
   809c692c665d dm thin: send event about thin-pool state change _after_ making it
   bea8a160c621 ARM: dts: bcm2837: Fix polarity of wifi reset GPIOs
   0017698d34b0 ARM: mmp/mmp2: fix cpu_is_mmp2() on mmp2-dt
   d9267e136044 fuse: continue to send FUSE_RELEASEDIR when FUSE_OPEN returns ENOSYS
   113fe99d6376 mmc: sdhci: fix the timeout check window for clock and reset
   661feb2fc993 mmc: sdhci-omap: Fix DCRC error handling during tuning
   105819c8a545 mmc: core: use mrq->sbc when sending CMD23 for RPMB
   e1e99fea907a MMC: OMAP: fix broken MMC on OMAP15XX/OMAP5910/OMAP310
   2a335229946e ovl: fix missing override creds in link of a metacopy upper
   3faf68a42f97 ovl: fix decode of dir file handle with multi lower layers
   7290c71ded83 block/bio: Do not zero user pages
   beb98fda1853 arm64: dma-mapping: Fix FORCE_CONTIGUOUS buffer clearing
   d41c49daf259 userfaultfd: check VM_MAYWRITE was set after verifying the uffd is registered
   498a6e6be0de fs/iomap.c: get/put the page in iomap_page_create/release()
   b11d5c025d8e scripts/spdxcheck.py: always open files in binary mode
   a6136922d905 aio: fix spectre gadget in lookup_ioctx
   4c74d5f1836e pinctrl: sunxi: a83t: Fix IRQ offset typo for PH11
   67e255bf2f34 drm/msm: fix address space warning
   26527312c519 ARM: dts: qcom-apq8064-arrow-sd-600eval fix graph_endpoint warning
   cd50eeeb6646 i2c: aspeed: fix build warning
   340a904a1944 slimbus: ngd: mark PM functions as __maybe_unused
   14e8b9ec43c9 staging: olpc_dcon: add a missing dependency
   cda8e63c89d7 scsi: raid_attrs: fix unused variable warning
   dc5350715915 sched/pelt: Fix warning and clean up IRQ PELT config
   b23de3254f8c Linux 4.19.10
   d265655ae46b tcp: lack of available data can also cause TSO defer
   bddeb44981c1 bpf: fix off-by-one error in adjust_subprog_starts
   1fd99ac175e6 IB/hfi1: Fix an out-of-bounds access in get_hw_stats
   2a493d8ef5b9 ALSA: hda/realtek - Fix the mute LED regresion on Lenovo X1 Carbon
   178b1a584e7f ALSA: hda/realtek: Enable audio jacks of ASUS UX433FN/UX333FA with ALC294
   1be8246777c5 ALSA: hda/realtek: Enable audio jacks of ASUS UX533FD with ALC294
   487b6512d881 ALSA: hda/realtek: ALC294 mic and headset-mode fixups for ASUS X542UN
   c8461d87716b ALSA: hda/realtek - Fixed headphone issue for ALC700
   03e8b38c5177 ALSA: fireface: fix reference to wrong register for clock configuration
   384f18115267 dax: Check page->mapping isn't NULL
   111758f73595 flexfiles: enforce per-mirror stateid only for v4 DSes
   a31da26a15e9 ocfs2: fix potential use after free
   2a5d5f5f47b9 initramfs: clean old path before creating a hardlink
   c6900015132a kernel/kcov.c: mark funcs in __sanitizer_cov_trace_pc() as notrace
   359c0c4aefa1 proc: fixup map_files test on arm
   53f1c27ac5d5 debugobjects: avoid recursive calls with kmemleak
   ab31765ef4dd hfsplus: do not free node before using
   f7cbec75fb0b hfs: do not free node before using
   505bc9f38996 mm/page_alloc.c: fix calculation of pgdat->nr_zones
   6aab48ae8ab5 ocfs2: fix deadlock caused by ocfs2_defrag_extent()
   126afacf7a8f ACPI/IORT: Fix iort_get_platform_device_domain() uninitialized pointer value
   992a773cb9bb nvme-rdma: fix double freeing of async event data
   5893e48f8f8a nvme: flush namespace scanning work just before removing namespaces
   1bda8b799665 nvme: warn when finding multi-port subsystems without multipathing enabled
   1f925643315d fscache, cachefiles: remove redundant variable 'cache'
   d8bf97a0a489 cachefiles: Explicitly cast enumerated type in put_object
   02bd7b740cbb fscache: fix race between enablement and dropping of object
   52da87f0e2e8 afs: Fix validation/callback interaction
   ce469db0943b pstore/ram: Correctly calculate usable PRZ bytes
   ff5ac9bd16ef pvcalls-front: fixes incorrect error handling
   a9d79a0751a2 Revert "xen/balloon: Mark unallocated host memory as UNUSABLE"
   c1a21086bbbd xen: xlate_mmu: add missing header to fix 'W=1' warning
   f3c73ae453ed drm/ast: fixed reading monitor EDID not stable issue
   cbd6a7ea6068 drm/amdgpu: Add delay after enable RLC ucode
   3b54558a73d0 net: hisilicon: remove unexpected free_netdev
   e3fb9d84fdd1 ixgbe: recognize 1000BaseLX SFP modules as 1Gbps
   4b0f9f881bc1 igb: fix uninitialized variables
   eee2269fd04f cachefiles: Fix page leak in cachefiles_read_backing_file while vmscan is active
   a4a7a0d729c0 fscache: Fix race in fscache_op_complete() due to split atomic_sub & read
   5132f91318ed cachefiles: Fix an assertion failure when trying to update a failed object
   815899cf26f6 ALSA: usb-audio: Add vendor and product name for Dell WD19 Dock
   e5f42e061789 netfilter: nf_tables: deactivate expressions in rule replecement routine
   6d665dab42e7 usb: gadget: u_ether: fix unsafe list iteration
   227b1745cd97 net: thunderx: fix NULL pointer dereference in nic_remove
   bf1b47f33cb1 x86/kvm/vmx: fix old-style function declaration
   d6b1692d9b9e KVM: x86: fix empty-body warnings
   3c7670d56ac6 KVM: VMX: Update shared MSRs to be saved/restored on MSR_EFER.LMA changes
   8038f92df3eb netfilter: nf_conncount: remove wrong condition check routine
   5517d4c6dcbb netfilter: nat: fix double register in masquerade modules
   18218f827e3c netfilter: add missing error handling code for register functions
   4f03e063a554 IB/mlx5: Fix page fault handling for MW
   9838090d9859 netfilter: ipv6: Preserve link scope traffic original oif
   bf6f1276768f drm/meson: add support for 1080p25 mode
   5dda1e7d7ce4 thunderbolt: Prevent root port runtime suspend during NVM upgrade
   9ca88f3c4cb5 USB: omap_udc: fix rejection of out transfers when DMA is used
   b58128138f06 USB: omap_udc: fix USB gadget functionality on Palm Tungsten E
   634395d20d7d USB: omap_udc: fix omap_udc_start() on 15xx machines
   27b61cbaa809 USB: omap_udc: fix crashes on probe error and module removal
   66d73a4ef37e USB: omap_udc: use devm_request_irq()
   28ad9091e186 ipvs: call ip_vs_dst_notifier earlier than ipv6_dev_notf
   2aad202fcd4c fsi: master-ast-cf: select GENERIC_ALLOCATOR
   6bfebedaa810 bpf: fix check of allowed specifiers in bpf_trace_printk
   4c7d50c23a88 RDMA/hns: Bugfix pbl configuration for rereg mr
   ad374d10b78e exportfs: do not read dentry after free
   0aeda30045b6 ASoC: omap-dmic: Add pm_qos handling to avoid overruns with CPU_IDLE
   38f3a0f01052 ASoC: omap-mcpdm: Add pm_qos handling to avoid under/overruns with CPU_IDLE
   abf7201316a3 ASoC: omap-mcbsp: Fix latency value calculation for pm_qos
   1f1aedd6b19a tools: bpftool: fix potential NULL pointer dereference in do_load
   8653ffc34cee RDMA/rdmavt: Fix rvt_create_ah function signature
   59315d0ca4fa RDMA/bnxt_re: Avoid accessing the device structure after it is freed
   f4515855b7a1 RDMA/bnxt_re: Fix system hang when registration with L2 driver fails
   5a49ef9832e5 RDMA/core: Add GIDs while changing MAC addr only for registered ndev
   7c736fee5a5d RDMA/mlx5: Fix fence type for IB_WR_LOCAL_INV WR
   91f6a9aa7952 Btrfs: send, fix infinite loop due to directory rename dependencies
   b3159470aa8f ARM: dts: at91: sama5d2: use the divided clock for SMC
   4724b50f9e09 phy: qcom-qusb2: Fix HSTX_TRIM tuning with fused value for SDM845
   d801a3eff554 phy: qcom-qusb2: Use HSTX_TRIM fused value as is
   3d2d2ba0c296 objtool: Fix segfault in .cold detection with -ffunction-sections
   79cd7b0e114d objtool: Fix double-free in .cold detection error path
   a8657e682427 ASoC: acpi: fix: continue searching when machine is ignored
   2a031cab71cd PCI: imx6: Fix link training status detection in link up check
   67707627c2f2 perf tools: Restore proper cwd on return from mnt namespace
   f3ff2ac4169e hwmon: (w83795) temp4_type has writable permission
   fb0fc90cc20f netfilter: xt_hashlimit: fix a possible memory leak in htable_create()
   df66ef67c334 aio: fix failure to put the file pointer
   5689666aa134 bpf: allocate local storage buffers using GFP_ATOMIC
   0d4ff09997f3 hwmon: (mlxreg-fan) Fix macros for tacho fault reading
   842aeeac335e spi: omap2-mcspi: Add missing suspend and resume calls
   fa3ceb3b59e5 ASoC: dapm: Recalculate audio map forcely when card instantiated
   abbd01b77987 ASoC: omap-abe-twl6040: Fix missing audio card caused by deferred probing
   3ef0d19cd815 hwmon: (ina2xx) Fix current value calculation
   d70a6605fe94 s390/cpum_cf: Reject request for sampling in event initialization
   2309636dc474 ASoC: qcom: Set dai_link id to each dai_link
   88e8e3c710b1 ASoC: Intel: Power down links before turning off display audio power
   737f3bb3e4be ASoC: wm_adsp: Fix dma-unsafe read of scratch registers
   e4777c2e40f0 ASoC: rockchip: add missing slave_config setting for I2S
   dbc62bd3b05b hwmon: (raspberrypi) Fix initial notify
   08cff35113e5 hwmon (ina2xx) Fix NULL id pointer in probe()
   61170596e1c0 s390/cio: Fix cleanup when unsupported IDA format is used
   a4f21114d83e s390/cio: Fix cleanup of pfn_array alloc failure
   00bac44c9991 netfilter: nf_tables: fix use-after-free when deleting compat expressions
   e947f9aa9a61 netfilter: xt_RATEEST: remove netns exit routine
   f8328abb8782 perf tools: Fix crash on synthesizing the unit
   d15443a19d41 selftests: add script to stress-test nft packet path vs. control plane
   8fe8940ffcf6 netfilter: nf_tables: don't skip inactive chains during update
   4a3b49f0ced5 netfilter: nf_conncount: fix unexpected permanent node of list.
   ae60f4705f95 netfilter: nf_conncount: fix list_del corruption in conn_free
   08c7e68ab261 netfilter: nf_conncount: use spin_lock_bh instead of spin_lock
   f6168a800b6b sysv: return 'err' instead of 0 in __sysv_write_inode
   1eb8dd51887b arm64: dts: sdm845-mtp: Reserve reserved gpios
   411b321f0ff5 ASoC: sun8i-codec: fix crash on module removal
   b42ab5284412 tools: bpftool: prevent infinite loop in get_fdinfo()
   136c52373429 ARM: OMAP1: ams-delta: Fix possible use of uninitialized field
   28f3050b13ab ARM: dts: am3517-som: Fix WL127x Wifi interrupt
   9f7df2a39ab8 ARM: dts: logicpd-somlv: Fix interrupt on mmc3_dat1
   09372f3cbeed ARM: dts: LogicPD Torpedo: Fix mmc3_dat1 interrupt
   886e00c5fe3d ARM: dts: am3517: Fix pinmuxing for CD on MMC1
   de7e3f88dd5c staging: rtl8723bs: Fix the return value in case of error in 'rtw_wx_read32()'
   748b7861bce5 ASoC: qdsp6: q6afe-dai: Fix the dai widgets
   32d28e247da7 ASoC: qdsp6: q6afe: Fix wrong MI2S SD line mask
   8ec3e5552e4e ASoC: rsnd: fixup clock start checker
   5a8fbba77bf8 ARM: OMAP2+: prm44xx: Fix section annotation on omap44xx_prm_enable_io_wakeup
   9ac607494a5d net: fix XPS static_key accounting
   b4b8a71c72ba net: restore call to netdev_queue_numa_node_write when resetting XPS
   a275c66b4d81 sctp: update frag_point when stream_interleave is set
   4aa6d46d1711 net: phy: sfp: correct store of detected link modes
   a7dba859ca58 virtio-net: keep vnet header zeroed after processing XDP
   36206419989d tun: forbid iface creation with rtnl ops
   bbc83e8d08cb tcp: fix NULL ref in tail loss probe
   03b271cb9175 tcp: Do not underestimate rwnd_limited
   5148726f2c27 sctp: kfree_rcu asoc
   a482f800169c rtnetlink: ndo_dflt_fdb_dump() only work for ARPHRD_ETHER devices
   f5c9c30da730 Revert "net/ibm/emac: wrong bit is used for STA control"
   7fafda16bb64 net: use skb_list_del_init() to remove from RX sublists
   16218638a239 net: Prevent invalid access to skb->prev in __qdisc_drop_all
   ac1fb97e9136 net: phy: don't allow __set_phy_supported to add unsupported modes
   70727c00cbb7 net/mlx4_en: Change min MTU size to ETH_MIN_MTU
   1fa276e92009 net/mlx4_core: Correctly set PFC param if global pause is turned off.
   ec5d7ceda60a net: 8139cp: fix a BUG triggered by changing mtu with network traffic
   c4ec6a9a788a ipv6: sr: properly initialize flowi6 prior passing to ip6_route_output
   0e96b90351f4 neighbour: Avoid writing before skb->head in neigh_hh_output()
   fd018cb37ea0 ipv6: Check available headroom in ip6_xmit() even without options
   ffe5754d2823 ipv4: ipv6: netfilter: Adjust the frag mem limit when truesize changes
   be53d23e68c2 Linux 4.19.9
   0fc19a8881e6 HID: quirks: fix RetroUSB.com devices
   b74a078e48a9 mac80211: ignore NullFunc frames in the duplicate detection
   e9f8baa38c2a mac80211: fix reordering of buffered broadcast packets
   50749911b1cc mac80211: ignore tx status for PS stations in ieee80211_tx_status_ext
   a75ac4e15e9c mac80211: Clear beacon_int in ieee80211_do_stop
   e08ab93325bb mac80211: fix GFP_KERNEL under tasklet context
   daac338a9e7b mac80211_hwsim: Timer should be initialized before device registered
   d66c1b9280d1 cfg80211: Fix busy loop regression in ieee80211_ie_split_ric()
   98206f340033 libnvdimm, pfn: Pad pfn namespaces relative to other regions
   beb68a727fb9 kgdboc: fix KASAN global-out-of-bounds bug in param_set_kgdboc_var()
   3c1773b0275e gnss: sirf: fix activation retry handling
   41867ab9b0d3 tty: do not set TTY_IO_ERROR flag if console port
   ecbfb178c75c tty: serial: 8250_mtk: always resume the device in probe.
   b02b86bc74c3 Drivers: hv: vmbus: Offload the handling of channels to two workqueues
   e88ebc06bd53 x86/efi: Allocate e820 buffer before calling efi_exit_boot_service
   ce74d11a3794 kprobes/x86: Fix instruction patching corruption when copying more than one RIP-relative instruction
   1a9056407808 drm/i915: Downgrade Gen9 Plane WM latency error
   e8a7f59e3643 drm/amdgpu/gmc8: always load MC firmware in the driver
   39bdb32876df drm/amdgpu/gmc8: update MC firmware for polaris
   2abdfe248369 drm/msm: Move fence put to where failure occurs
   318f6e599dcd drm/lease: Send a distinct uevent
   fcf5d0dbfb7f drm/amdgpu: update mc firmware image for polaris12 variants
   2f94605195ab crypto: do not free algorithm before using
   35929281460b Revert commit ef9209b642f "staging: rtl8723bs: Fix indenting errors and an off-by-one mistake in core/rtw_mlme_ext.c"
   9138ce0a8011 staging: rtl8712: Fix possible buffer overrun
   99c694081ba2 cifs: Fix separator when building path from dentry
   bd5d1c273cce Revert "x86/e820: put !E820_TYPE_RAM regions into memblock.reserved"
   e92cc52ee5e7 arm64: dts: rockchip: remove vdd_log from rock960 to fix a stability issues
   33f310e09388 xhci: Prevent U1/U2 link pm states if exit latency is too long
   5d3b10677bf8 xhci: workaround CSS timeout on AMD SNPS 3.0 xHC
   3fe0c68aea21 ARM: 8806/1: kprobes: Fix false positive with FORTIFY_SOURCE
   37e74076f3cb dmaengine: cppi41: delete channel from pending list when stop channel
   374f384bc66f dmaengine: imx-sdma: use GFP_NOWAIT for dma descriptor allocations
   9063f5a99ea7 dmaengine: imx-sdma: implement channel termination via worker
   228bee887467 Revert "dmaengine: imx-sdma: alloclate bd memory from dma pool"
   2f79476548d8 Revert "dmaengine: imx-sdma: Use GFP_NOWAIT for dma allocations"
   37aefa023734 dmaengine: dw: Fix FIFO size for Intel Merrifield
   33154a299890 SUNRPC: Fix leak of krb5p encode pages
   1d9ca56698ad arm64: hibernate: Avoid sending cross-calling with interrupts disabled
   f9cd25b1e5e5 vhost/vsock: fix use-after-free in network stack callers
   2a622040a8bc virtio/s390: fix race in ccw_io_helper()
   79f6e9facb8b virtio/s390: avoid race on vcdev->config
   6c9ac388c6c8 parisc: Enable -ffunction-sections for modules on 32-bit kernel
   c91ec2c4eb65 Revert "mfd: cros_ec: Use devm_kzalloc for private data"
   24a776e398e9 media: dvb-pll: don't re-validate tuner frequencies
   d7db76065041 media: dvb-pll: fix tuner frequency ranges
   663bfc44d1a0 media: vicodec: fix memchr() kernel oops
   c4dabf370838 media: gspca: fix frame overflow error
   fbb982c6ad97 ALSA: hda/realtek: Fix mic issue on Acer AIO Veriton Z4860G/Z6860G
   ba3ce1bf275c ALSA: hda/realtek: Fix mic issue on Acer AIO Veriton Z4660G
   bf03eb5e297f ALSA: hda/realtek - Add support for Acer Aspire C24-860 headset mic
   642314e11ade ALSA: hda/realtek: ALC286 mic and headset-mode fixups for Acer Aspire U27-880
   071b34a1a5ed ALSA: hda/realtek - Fix speaker output regression on Thinkpad T570
   a2928e749812 ALSA: pcm: Fix interval evaluation with openmin/max
   19054c18846e ALSA: pcm: Call snd_pcm_unlink() conditionally at closing
   026fdecbc3d7 ALSA: pcm: Fix starvation on down_write_nonblock()
   2ea30d9d5fa1 ALSA: hda: Add support for AMD Stoney Ridge
   a7e719ace75e ALSA: usb-audio: Fix UAF decrement if card has no live interfaces in card.c
   86c257e05223 ALSA: usb-audio: Add SMSL D1 to quirks for native DSD support
   9d9026afc36b USB: serial: console: fix reported terminal settings
   1b2e742bf723 USB: check usb_get_extra_descriptor for proper size
   24e09d7a52ae usb: appledisplay: Add 27" Apple Cinema Display
   f025aa79bda0 usb: quirk: add no-LPM quirk on SanDisk Ultra Flair device
   c34678d4c155 net: amd: add missing of_node_put()
   ebc4b790103d team: no need to do team_notify_peers or team_mcast_rejoin when disabling port
   f1c4022ab268 ibmvnic: Update driver queues after change in ring size support
   a13220e6817c ibmvnic: Fix RX queue buffer cleanup
   0a98c7c5dc62 flexfiles: use per-mirror specified stateid for IO
   07b92c224d5c NFSv4.2 copy do not allocate memory under the lock
   d1862827f41a iommu/vt-d: Use memunmap to free memremap
   549e3c24ac34 net: faraday: ftmac100: remove netif_running(netdev) check before disabling interrupts
   d69eb98a86c0 riscv: fix warning in arch/riscv/include/asm/module.h
   bfa634ba505a net/ibmnvic: Fix deadlock problem in reset
   07f745f9a6d6 qed: Fix QM getters to always return a valid pq
   b63de4413656 qed: Fix bitmap_weight() check
   e359a17143ef NFSv4: Fix a NFSv4 state manager deadlock
   4a9ad460a07b net: ena: fix crash during failed resume from hibernation
   d7dace92d040 mtd: spi-nor: Fix Cadence QSPI page fault kernel panic
   d861fe2fd5b1 HID: multitouch: Add pointstick support for Cirque Touchpad
   699faa9cf00c Revert "HID: uhid: use strlcpy() instead of strncpy()"
   0799feafeb1b cpufreq: ti-cpufreq: Only register platform_device when supported
   1a488242d942 mtd: rawnand: qcom: Namespace prefix some commands
   4ef9e48c9c8f tc-testing: tdc.py: Guard against lack of returncode in executed command
   9806e7473d10 tc-testing: tdc.py: ignore errors when decoding stdout/stderr
   b8c51924b4e1 gpio: mockup: fix indicated direction
   b9284d6c30cb gpio: pxa: fix legacy non pinctrl aware builds again
   9ebacc1a8754 drivers/net/ethernet/qlogic/qed/qed_rdma.h: fix typo
   b53fa368dd8e net/mlx4: Fix UBSAN warning of signed integer overflow
   034f7ad3f706 net/mlx4_core: Fix uninitialized variable compilation warning
   5110c0406c8c net/mlx4_core: Zero out lkey field in SW2HW_MPT fw command
   3374518d4d1a drm/amd/display: Support amdgpu "max bpc" connector property (v2)
   a0c25b4098b8 drm/amdgpu: Add amdgpu "max bpc" connector property (v2)
   12163e3e6902 bnxt_en: Fix filling time in bnxt_fill_coredump_record()
   0e79e30e6121 nvme-fc: resolve io failures during connect
   b65fa443e56e s390/ism: clear dmbe_mask bit before SMC IRQ handling
   8b87305f816c Revert "usb: gadget: ffs: Fix BUG when userland exits with submitted AIO transfers"
   3355199746b8 usb: dwc2: pci: Fix an error code in probe
   4f22a32f555d qed: Fix reading wrong value in loop condition
   d4105c836c13 qed: Fix rdma_info structure allocation
   52da24907e6e qed: Fix overriding offload_tc by protocols without APP TLV
   631ebe93bdcb qed: Fix PTT leak in qed_drain()
   147bcca117b8 bnx2x: Assign unique DMAE channel number for FW DMAE transactions.
   821d0b9afa8d amd/iommu: Fix Guest Virtual APIC Log Tail Address Register
   2e959f250949 batman-adv: Expand merged fragment buffer for full packet
   25683accf7c7 batman-adv: Use explicit tvlv padding for ELP packets
   92724c1deaf9 HID: input: Ignore battery reported by Symbol DS4308
   27b504af882b test_firmware: fix error return getting clobbered
   0e3e8e31877a can: rcar_can: Fix erroneous registration
   1f329e64e1f1 can: ucan: remove set but not used variable 'udev'
   f2e78c08e844 scsi: ufs: Fix hynix ufs bug with quirk on hi36xx SoC
   c97a2a726cef iommu/ipmmu-vmsa: Fix crash on early domain free
   e2807327b562 mt76: fix building without CONFIG_LEDS_CLASS
   4a4c9b29a0c1 brcmutil: really fix decoding channel info for 160 MHz bandwidth
   093255da5688 iommu/vt-d: Fix NULL pointer dereference in prq_event_thread()
   f84263bfd801 media: ipu3-cio2: Unregister device nodes first, then release resources
   61880fb56851 media: omap3isp: Unregister media device as first
   cd7b7f509cd0 media: cec: check for non-OK/NACK conditions while claiming a LA
   35eaa0ee4e69 media: vicodec: lower minimum height to 360

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb      | 20 ++++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index f823683526ee..4a987d52c034 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "78404e3a73613f8e07c276e55112989f897cdd04"
-SRCREV_meta ?= "096c8bd3bd11801f95683bbe4bcc885a2318f51d"
+SRCREV_machine ?= "7a0b04e5a8d036cd9dcc6ee64a838e8d8d5cdd56"
+SRCREV_meta ?= "d9a3d567a7b5617f757d132090ca1646e139301f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.19.8"
+LINUX_VERSION ?= "4.19.14"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index 0a79f442a075..8506f7c880ad 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.19.8"
+LINUX_VERSION ?= "4.19.14"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "2594d14d76ae2c49ad43b626662fe53da807ddca"
-SRCREV_machine ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
-SRCREV_meta ?= "096c8bd3bd11801f95683bbe4bcc885a2318f51d"
+SRCREV_machine_qemuarm ?= "d11db6c6617f689e6b9e2afaa3d3b2036c6d3d30"
+SRCREV_machine ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
+SRCREV_meta ?= "d9a3d567a7b5617f757d132090ca1646e139301f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index f410cc8cdb31..bd9b6a3543e5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -11,21 +11,21 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
 KBRANCH_qemux86-64 ?= "v4.19/standard/base"
 KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "8b378ac8aca51207085c8df616a6fe56af19f0b4"
-SRCREV_machine_qemuarm64 ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
-SRCREV_machine_qemumips ?= "58f59c2213a657515a158379db153ad618986235"
-SRCREV_machine_qemuppc ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
-SRCREV_machine_qemux86 ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
-SRCREV_machine_qemux86-64 ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
-SRCREV_machine_qemumips64 ?= "6f56a58c214379efe8949da6921b1c00c2af353a"
-SRCREV_machine ?= "1114697c04b9699112e78dd8fc6ec849609ca1cb"
-SRCREV_meta ?= "096c8bd3bd11801f95683bbe4bcc885a2318f51d"
+SRCREV_machine_qemuarm ?= "b960e1b087a8b0f192e5a9a3441dd47aecfa7d48"
+SRCREV_machine_qemuarm64 ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
+SRCREV_machine_qemumips ?= "99a57b9439d36397ce975cc45ab23264c02b96d4"
+SRCREV_machine_qemuppc ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
+SRCREV_machine_qemux86 ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
+SRCREV_machine_qemux86-64 ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
+SRCREV_machine_qemumips64 ?= "dff23f01307cbab688d9677ecd4b5f350ec435d9"
+SRCREV_machine ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
+SRCREV_meta ?= "d9a3d567a7b5617f757d132090ca1646e139301f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.19.8"
+LINUX_VERSION ?= "4.19.14"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


