Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DB10578AB2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 18:11:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w26IBNIn014566
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Mar 2018 10:11:23 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Tue, 6 Mar 2018 10:10:49 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 6 Mar 2018 13:11:12 -0500
Message-ID: <5b8e161835297caf6767e2d7cb3693ebde6c0543.1520359364.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1520359364.git.bruce.ashfield@windriver.com>
References: <cover.1520359364.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] linux-yocto/4.14: update to v4.14.24
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
X-List-Received-Date: Tue, 06 Mar 2018 18:11:23 -0000
Content-Type: text/plain

Updating the korg stable release which comprises the following commits:

   6e4548ea58e6 Linux 4.14.24
   ab5d9d1751bc net: sched: fix use-after-free in tcf_block_put_ext
   ac2be03ba64f net_sched: get rid of rcu_barrier() in tcf_block_put_ext()
   1c8e7e61cbdf net: sched: crash on blocks with goto chain action
   b6b42b3d2d95 net: sched: fix crash when deleting secondary chains
   bc44a1bbd131 arm64: dts: marvell: mcbin: add comphy references to Ethernet ports
   d8cf635c9142 arm64: dts: marvell: add comphy nodes on cp110 master and slave
   27245fc6f7a8 powerpc/pseries: Enable RAS hotplug events later
   60190108f7e2 MIPS: Implement __multi3 for GCC7 MIPS64r6 builds
   819cbaae314e mlxsw: pci: Wait after reset before accessing HW
   3d23aaff9e55 nfp: always unmask aux interrupts at init
   e69660fdecda of_mdio: avoid MDIO bus removal when a PHY is missing
   83d9e9c211fe net: gianfar_ptp: move set_fipers() to spinlock protecting area
   00c840f3b51c sctp: make use of pre-calculated len
   413e58ac3d84 sctp: add a ceiling to optlen in some sockopts
   cd659881219d xen/gntdev: Fix partial gntdev_mmap() cleanup
   5aee2c142e3d xen/gntdev: Fix off-by-one error when unmapping with holes
   197faf0c3a14 SolutionEngine771x: fix Ether platform data
   f5ac846ba15f mdio-sun4i: Fix a memory leak
   84ada11975b7 xen-netfront: enable device after manual module load
   0e29d0bac356 bnxt_en: Fix the 'Invalid VF' id check in bnxt_vf_ndo_prep routine.
   a74e2cb46cdb bnxt_en: Fix population of flow_type in bnxt_hwrm_cfa_flow_alloc()
   4a33ecfb67b9 x86/platform/intel-mid: Revert "Make 'bt_sfi_data' const"
   fa10314f23bc nvme-fabrics: initialize default host->id in nvmf_host_default()
   5e1311a13449 powerpc/pseries: Make RAS IRQ explicitly dependent on DLPAR WQ
   9024bb7e27d2 leds: core: Fix regression caused by commit 2b83ff96f51d
   be2b86901a34 bpf: sockmap missing NULL psock check
   5ac98131312a ia64, sched/cputime: Fix build error if CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y
   7e3acce11e08 block: drain queue before waiting for q_usage_counter becoming zero
   91c12917d4a8 wcn36xx: Fix dynamic power saving
   3f39cc7fe90b can: flex_can: Correct the checking for frame length in flexcan_start_xmit()
   0f258cc64f4e mac80211: mesh: drop frames appearing to be from us
   c38bd3a9fe11 nl80211: Check for the required netlink attribute presence
   d66a35c2a1fa net: ena: unmask MSI-X only after device initialization is completed
   aae87222cc9c i40e: don't remove netdev->dev_addr when syncing uc list
   0f51f3cf99df i40e/i40evf: Account for frags split over multiple descriptors in check linearize
   1edfa41adb10 uapi libc compat: add fallback for unsupported libcs
   5c9da1201713 x86/efi: Fix kernel param add_efi_memmap regression
   935454915c33 RDMA/netlink: Fix locking around __ib_get_device_by_index
   7cbd67344e05 drm/ttm: check the return value of kzalloc
   d31d0cf5a980 NET: usb: qmi_wwan: add support for YUGA CLM920-NC5 PID 0x9625
   49a8f703725e e1000: fix disabling already-disabled warning
   f22fec25935d macvlan: Fix one possible double free
   4d3d428c56a0 xfs: quota: check result of register_shrinker()
   4def40b2ee02 xfs: quota: fix missed destroy of qi_tree_lock
   ba28394c579b IB/ipoib: Fix race condition in neigh creation
   67851c9381a1 IB/mlx4: Fix mlx4_ib_alloc_mr error flow
   9d27ab346384 Input: xen-kbdfront - do not advertise multi-touch pressure support
   4132ec352700 ip6_tunnel: allow ip6gre dev mtu to be set below 1280
   d4727e485a1d btrfs: Fix flush bio leak
   4c6652a08139 s390/dasd: fix wrongly assigned configuration data
   622ded58410c afs: Fix missing error handling in afs_write_end()
   4ebaea9e65d2 genirq: Guard handle_bad_irq log messages
   1fd2d40b4667 IB/mlx5: Fix mlx5_ib_alloc_mr error flow
   c2acc8859138 led: core: Fix brightness setting when setting delay_off=0
   6b800ce9ee84 perf/x86/intel: Plug memory leak in intel_pmu_init()
   2f4c6c045305 bnx2x: Improve reliability in case of nested PCI errors
   9f00176d7c5e tg3: Enable PHY reset in MTU change path for 5720
   2c0d89a27335 tg3: Add workaround to restrict 5762 MRRS to 2048
   575650b6566b tipc: fix tipc_mon_delete() oops in tipc_enable_bearer() error path
   831923622a59 tipc: error path leak fixes in tipc_enable_bearer()
   cbc3dbfe4f37 netfilter: nf_tables: fix potential NULL-ptr deref in nf_tables_dump_obj_done()
   cdbde4c04c5c crypto: inside-secure - fix request allocations in invalidation path
   7cc6e8415d23 crypto: inside-secure - free requests even if their handling failed
   0971f188da94 crypto: inside-secure - per request invalidation
   0653ba0580ae arm64: dts: renesas: ulcb: Remove renesas, no-ether-link property
   22d5e20c6a55 lib/mpi: Fix umul_ppmm() for MIPS64r6
   36d0a678fb25 crypto: af_alg - Fix race around ctx->rcvused by making it atomic_t
   99b329b4611a ARM: dts: ls1021a: fix incorrect clock references
   8164587e5262 RDMA/vmw_pvrdma: Call ib_umem_release on destroy QP path
   831c169c9bac i915: Reject CCS modifiers for pipe C on Geminilake
   8a5c84b1055a netfilter: uapi: correct UNTRACKED conntrack state bit number
   b7b0385937fa scsi: storvsc: Fix scsi_cmd error assignments in storvsc_handle_error
   e2f52fa3f8d6 netfilter: nf_tables: fix chain filter in nf_tables_dump_rules()
   def8d0ae4ac9 xen/balloon: Mark unallocated host memory as UNUSABLE
   caca324f9373 ASoC: rsnd: fixup ADG register mask
   43da2bcade2a net/mlx5: Stay in polling mode when command EQ destroy fails
   a2cfb1c664c3 net/mlx5: Cleanup IRQs in case of unload failure
   9a472c211291 net/mlx5e: Fix ETS BW check
   11be1c24a60d net: stmmac: Fix bad RX timestamp extraction
   06dcd2d77a01 net: stmmac: Fix TX timestamp calculation
   3eeac1d10a1b ip6_tunnel: get the min mtu properly in ip6_tnl_xmit
   5dc4cbcfb5f2 ip6_gre: remove the incorrect mtu limit for ipgre tap
   212ea3380bbb ip_gre: remove the incorrect mtu limit for ipgre tap
   4699beb77127 vxlan: update skb dst pmtu on tx path
   26e6b9f0be83 net: arc_emac: fix arc_emac_rx() error paths
   9b72f8c448ec net: mediatek: setup proper state for disabled GMAC on the default
   c7f40ff40061 x86-64/Xen: eliminate W+X mappings
   54c153a0847b staging: ion: Fix ion_cma_heap allocations
   d61a373f4344 cgroup: Fix deadlock in cpu hotplug path
   56d80186a5ac ASoC: nau8825: fix issue that pop noise when start capture
   3cf652bedcb9 spi: atmel: fixed spin_lock usage inside atmel_spi_remove
   52a63f35cd70 mac80211_hwsim: Fix a possible sleep-in-atomic bug in hwsim_get_radio_nl
   647ed111f78f x86/stacktrace: Make zombie stack traces reliable
   e095ecaec6d9 xfrm: Reinject transport-mode packets through tasklet
   e677319068b0 drm/nouveau/pci: do a msi rearm on init
   0b9aeeb6070e net: phy: xgene: disable clk on error paths
   ac4dc9f1af33 sget(): handle failures of register_shrinker()
   60f1c1f27992 sctp: fix the issue that a __u16 variable may overflow in sctp_ulpq_renege
   c8b8dd735938 x86/asm: Allow again using asm.h when building for the 'bpf' clang target
   ba9443c55f36 ARM: 8731/1: Fix csum_partial_copy_from_user() stack mismatch
   ae3471f65a04 parisc: Reduce thread stack to 16 kb
   4b2e0f099619 ipv6: icmp6: Allow icmp messages to be looped back
   6de1b002a29f mtd: nand: brcmnand: Zero bitflip is not an error
   f485259011ad mtd: nand: gpmi: Fix failure when a erased page has a bitflip at BBM
   14862bfbffd9 net: usb: qmi_wwan: add Telit ME910 PID 0x1101 support
   043309fb5106 net: aquantia: Fix hardware DMA stream overload on large MRRS
   dabd233b757d net: aquantia: Fix actual speed capabilities reporting
   fbd047ffcccf nvme: check hw sectors before setting chunk sectors
   a1aef5ce2abe nvme-fc: remove double put reference if admin connect fails
   4d9f62729178 phy: cpcap-usb: Fix platform_get_irq_byname's error checking.
   959f6a0906d5 dmaengine: fsl-edma: disable clks on all error paths
   7cfa95893cbb scsi: aacraid: Fix I/O drop during reset
   647a37ec1a17 mm/frame_vector.c: release a semaphore in 'get_vaddr_frames()'
   7edaa9afb923 exec: avoid gcc-8 warning for get_task_comm
   f92679fee6ad hrtimer: Ensure POSIX compliance (relative CLOCK_REALTIME hrtimers)
   267ef1d33284 Linux 4.14.23
   ac3d021048be microblaze: fix endian handling
   9ce9f4e4a543 m32r: fix endianness constraints
   821e97898016 drm/i915/breadcrumbs: Ignore unsubmitted signalers
   1f0ffdc67108 drm/amdgpu: add new device to use atpx quirk
   4517799bf655 drm/amdgpu: Avoid leaking PM domain on driver unbind (v2)
   14fdf4448277 drm/amdgpu: add atpx quirk handling (v2)
   30537deb089c drm/amdgpu: only check mmBIF_IOV_FUNC_IDENTIFIER on tonga/fiji
   46c1e4023b58 drm/amdgpu: Add dpm quirk for Jet PRO (v2)
   68de83c13b30 drm/amdgpu: disable MMHUB power gating on raven
   8ac8aa5eba0e drm: Handle unexpected holes in color-eviction
   5c9beaf3aca7 drm/cirrus: Load lut in crtc_commit
   faf1a75046cb usb: renesas_usbhs: missed the "running" flag in usb_dmac with rx path
   51aba4e16ccc usb: gadget: f_fs: Use config_ep_by_speed()
   6e936140e0d7 usb: gadget: f_fs: Process all descriptors during bind
   7551ff0ab230 Revert "usb: musb: host: don't start next rx urb if current one failed"
   7e402ea2cdc2 usb: ldusb: add PIDs for new CASSY devices supported by this driver
   a1e8aa2176d2 usb: dwc3: ep0: Reset TRB counter for ep0 IN
   49e18b2ba887 usb: dwc3: gadget: Set maxpacket size for ep0 IN
   1075f6078692 usb: host: ehci: use correct device pointer for dma ops
   3b5061ec6fca drm/edid: Add 6 bpc quirk for CPT panel in Asus UX303LA
   f74ddc2e6152 Add delay-init quirk for Corsair K70 RGB keyboards
   21aadb063e70 arm64: cpufeature: Fix CTR_EL0 field definitions
   6842a512ad16 arm64: Disable unhandled signal log messages by default
   96e99291728f arm64: Remove unimplemented syscall log message
   7e8407d1462d usb: ohci: Proper handling of ed_rm_list to handle race condition between usb_kill_urb() and finish_unlinks()
   85c3d26bd754 ohci-hcd: Fix race condition caused by ohci_urb_enqueue() and io_watchdog_func()
   50f80b646a2b PCI/cxgb4: Extend T3 PCI quirk to T4+ devices
   4a665d628f93 irqchip/mips-gic: Avoid spuriously handling masked interrupts
   bc4704f507cd irqchip/gic-v3: Use wmb() instead of smb_wmb() in gic_raise_softirq()
   62160e348e89 mm, swap, frontswap: fix THP swap if frontswap enabled
   7a14562d6e2c x86/oprofile: Fix bogus GCC-8 warning in nmi_setup()
   0b82d316fa5b Kbuild: always define endianess in kconfig.h
   6315213f0a78 iio: adis_lib: Initialize trigger before requesting interrupt
   9dc4030c87b7 iio: buffer: check if a buffer has been set up when poll is called
   1b985a6e8d4d iio: srf08: fix link error "devm_iio_triggered_buffer_setup" undefined
   f4f94e9baeba iio: adc: stm32: fix stm32h7_adc_enable error handling
   2492eca0a05b RDMA/uverbs: Sanitize user entered port numbers prior to access it
   84205f964bcc RDMA/uverbs: Fix circular locking dependency
   aaa1915e3d2c RDMA/uverbs: Fix bad unlock balance in ib_uverbs_close_xrcd
   f3d66d43500c RDMA/uverbs: Protect from command mask overflow
   da768ed845a5 RDMA/uverbs: Protect from races between lookup and destroy of uobjects
   606f74e3d01b extcon: int3496: process id-pin first so that we start with the right status
   29e76b211e92 PKCS#7: fix certificate blacklisting
   1a1f7f726bd8 PKCS#7: fix certificate chain verification
   99b2095ac71e X.509: fix NULL dereference when restricting key with unsupported_sig
   dcb04cc79483 X.509: fix BUG_ON() when hash algorithm is unsupported
   fa465cd56813 i2c: bcm2835: Set up the rising/falling edge delays
   3e1d63cc7a5f i2c: designware: must wait for enable
   ebaefbdaf552 cfg80211: fix cfg80211_beacon_dup
   2f9eed6e3772 MIPS: Drop spurious __unused in struct compat_flock
   4fc16629e9bc scsi: ibmvfc: fix misdefined reserved field in ibmvfc_fcp_rsp_info
   53c86c2d90c6 xtensa: fix high memory/reserved memory collision
   9428e622eca7 MIPS: boot: Define __ASSEMBLY__ for its.S build
   b3aff5c3b2a1 kconfig.h: Include compiler types to avoid missed struct attributes
   35d75b7bfc67 arm64: mm: don't write garbage into TTBR1_EL1 register
   485595768d89 netfilter: drop outermost socket lock in getsockopt()
   55b195735142 Linux 4.14.22
   c902ff1e4b25 vmalloc: fix __GFP_HIGHMEM usage for vmalloc_32 on 32b systems
   eff339b5d250 mei: me: add cannon point device ids for 4th device
   06320148eecd mei: me: add cannon point device ids
   95c085388397 crypto: s5p-sss - Fix kernel Oops in AES-ECB mode
   fc4cb30f2cd5 drm/i915: fix intel_backlight_device_register declaration
   68a2a5204760 crypto: talitos - fix Kernel Oops on hashing an empty file
   e94fc847bd6e hippi: Fix a Fix a possible sleep-in-atomic bug in rr_close
   385aeea71289 powerpc/perf/imc: Fix nest-imc cpuhotplug callback failure
   473900cd523a PCI: rcar: Fix use-after-free in probe error path
   73974676f802 xen: XEN_ACPI_PROCESSOR is Dom0-only
   8babb5320885 platform/x86: dell-laptop: Fix keyboard max lighting for Dell Latitude E6410
   721d4b02495c x86/mm/kmmio: Fix mmiotrace for page unaligned addresses
   d91c3f2e540f mm/early_ioremap: Fix boot hang with earlyprintk=efi,keep
   abe8e59ab2f2 usb: dwc3: of-simple: fix missing clk_disable_unprepare
   98b35258b394 usb: dwc3: gadget: Wait longer for controller to end command processing
   58d3cc9687f5 dmaengine: jz4740: disable/unprepare clk if probe fails
   4826773306b5 drm/vc4: Release fence after signalling
   645ad410dcbd ASoC: rsnd: ssi: fix race condition in rsnd_ssi_pointer_update
   06078bd640c3 drm/armada: fix leak of crtc structure
   20db5b3e3da3 xfrm: Fix stack-out-of-bounds with misconfigured transport mode policies.
   1840744a7f2e IB/mlx4: Fix RSS hash fields restrictions
   8edeefab9ef2 spi: sun4i: disable clocks in the remove function
   e8e50037b6de ASoC: rockchip: disable clock on error
   5be88596c7b0 staging: ccree: Uninitialized return in ssi_ahash_import()
   30fe9f094c17 clk: fix a panic error caused by accessing NULL pointer
   03e82f2b2157 netfilter: xt_bpf: add overflow checks
   c232fd3d7034 xfrm: Fix xfrm_input() to verify state is valid when (encap_type < 0)
   05fc2b8ba00a dmaengine: at_hdmac: fix potential NULL pointer dereference in atc_prep_dma_interleaved
   27e2830b3115 dmaengine: ioat: Fix error handling path
   249d9f3ef5e9 scsi: bfa: fix type conversion warning
   e748a5ea4ff2 scsi: bfa: fix access to bfad_im_port_s
   dd079e26a0e4 scsi: lpfc: Use after free in lpfc_rq_buf_free()
   9b8ffbead22d gianfar: Disable EEE autoneg by default
   f2f12ea19fae 509: fix printing uninitialized stack memory when OID is empty
   9c65a55722ac net: dsa: mv88e6xxx: Unregister MDIO bus on error path
   0ef99ba03888 net: dsa: mv88e6xxx: Fix interrupt masking on removal
   74875198a68e net: ethernet: arc: fix error handling in emac_rockchip_probe
   f04764307af8 virtio_net: fix return value check in receive_mergeable()
   64313a130c3d brcmfmac: Avoid build error with make W=1
   90b0805d6085 btrfs: Fix possible off-by-one in btrfs_search_path_in_tree
   27b0dc31686b Btrfs: disable FUA if mounted with nobarrier
   8edc5b9772d0 btrfs: Fix quota reservation leak on preallocated files
   a59eb84df2b7 locking/lockdep: Fix possible NULL deref
   0aeed5daaf62 net: qualcomm: rmnet: Fix leak on transmit failure
   8172a467adae KVM: VMX: fix page leak in hardware_setup()
   034ddb54c33e VSOCK: fix outdated sk_state value in hvs_release()
   8001a37b83c4 net_sched: red: Avoid illegal values
   e428e8ce3a00 net_sched: red: Avoid devision by zero
   6e95c4f92177 gianfar: fix a flooded alignment reports because of padding issue.
   4bbd45c38ed6 nfp: fix port stats for mac representors
   45f9e44667c1 ARM: dts: Fix elm interrupt compiler warning
   29c9acbc7463 s390/dasd: prevent prefix I/O error
   dfb48332d602 s390/virtio: add BSD license to virtio-ccw
   0b028b06afc9 PM / runtime: Fix handling of suppliers with disabled runtime PM
   8b9d371a8c01 powerpc/perf: Fix oops when grouping different pmu events
   30791140de21 m68k: add missing SOFTIRQENTRY_TEXT linker section
   ae5a0acea273 ipvlan: Add the skb->mark as flow4's member to lookup route
   b35e7321347a bnxt_en: Need to unconditionally shut down RoCE in bnxt_shutdown
   9537ff76fa06 scripts/kernel-doc: Don't fail with status != 0 if error encountered with -none
   b0d049e91314 iio: fix kernel-doc build errors
   4c5ae538b3da iio: proximity: sx9500: Assign interrupt from GpioIo()
   567c1f767ef4 md/raid1/10: add missed blk plug
   86659fbb32a5 phylink: ensure we take the link down when phylink_stop() is called
   778e7124f71d sfp: fix RX_LOS signal handling
   7a7bcee6d73c sctp: only update outstanding_bytes for transmitted queue when doing prsctp_prune
   559be170a470 md/raid5: correct degraded calculation in raid5_error
   2ded534c9074 IB/core: Init subsys if compiled to vmlinuz-core
   1ffc1b361ac2 RDMA/cma: Make sure that PSN is not over max allowed
   f917b1c60e4a i40iw: Correct ARP index mask
   03f23424aa2b i40iw: Do not free sqbuf when event is I40IW_TIMER_TYPE_CLOSE
   f10f5b89c136 i40iw: Allocate a sdbuf per CQP WQE
   97ef3a5027b0 KVM: arm/arm64: Fix spinlock acquisition in vgic_set_owner
   2117bba3cfbb meson-gx-socinfo: Fix package id parsing
   844dfa1b4188 IB/hfi1: Initialize bth1 in 16B rc ack builder
   04521caaea96 pinctrl: sunxi: Fix A64 UART mux value
   b1f0445d07f3 pinctrl: sunxi: Fix A80 interrupt pin bank
   073cd31e2fd1 gpio: davinci: Assign first bank regs for unbanked case
   4c194e5b0d90 gpio: 74x164: Fix crash during .remove()
   d4ec37fab600 net: mvpp2: allocate zeroed tx descriptors
   801f3b0c40da media: ov13858: Select V4L2_FWNODE
   b8c033b1f4bf media: s5k6aa: describe some function parameters
   2dc548c0671d trace/xdp: fix compile warning: 'struct bpf_map' declared inside parameter list
   49a3efa81147 kvm: arm: don't treat unavailable HYP mode as an error
   c05bbe5dc862 pinctrl: denverton: Fix UART2 RTS pin mode
   6f8a0b09520b perf test: Fix test 21 for s390x
   8b6c6ab154b9 perf bench numa: Fixup discontiguous/sparse numa nodes
   7efaeefce5c9 perf top: Fix window dimensions change handling
   984d85a69da9 perf: Fix header.size for namespace events
   475e6b835d8c perf test shell: Fix check open filename arg using 'perf trace' on s390x
   863b61caaeb8 perf annotate: Do not truncate instruction names at 6 chars
   182d948c7ae9 perf help: Fix a bug during strstart() conversion
   bfb3906919d1 perf record: Fix -c/-F options for cpu event aliases
   761036954596 ARM: dts: am437x-cm-t43: Correct the dmas property of spi0
   a1fd303e1e41 ARM: dts: am4372: Correct the interrupts_properties of McASP
   c601b98e14df ARM: dts: logicpd-somlv: Fix wl127x pinmux
   90e4395ca72d ARM: dts: logicpd-som-lv: Fix gpmc addresses for NAND and enet
   104df4374d5d ARM: dts: Fix omap4 hang with GPS connected to USB by using wakeupgen
   17e712b1294a ARM: AM33xx: PRM: Remove am33xx_pwrdm_read_prev_pwrst function
   b59a1da647f1 ARM: OMAP2+: Fix SRAM virt to phys translation for save_secure_ram_context
   2ba11e4309b5 serdev: fix receive_buf return value when no callback
   371cf4043b29 usb: build drivers/usb/common/ when USB_SUPPORT is set
   c276379fa715 usbip: keep usbip_device sockfd state in sync with tcp_socket
   d74450a91a4a staging: iio: ad5933: switch buffer mode to software
   5ccf5138bd10 staging: iio: adc: ad7192: fix external frequency setting
   6648ab4f03c0 staging: fsl-mc: fix build testing on x86
   b46af094b82a binder: replace "%p" with "%pK"
   047ba51a55e3 binder: check for binder_thread allocation failure in binder_poll()
   95f9c2edcbae staging: android: ashmem: Fix a race condition in pin ioctls
   441b5d10e460 ANDROID: binder: synchronize_rcu() when using POLLFREE.
   129926c3756a ANDROID: binder: remove WARN() for redundant txn error
   f6b581e3db4a dn_getsockoptdecnet: move nf_{get/set}sockopt outside sock lock
   80b1c636a72b arm64: dts: add #cooling-cells to CPU nodes
   225fcdd0e33b ARM: 8743/1: bL_switcher: add MODULE_LICENSE tag
   52d4c1978cb4 video: fbdev/mmp: add MODULE_LICENSE
   1f4f5777e5fa ASoC: ux500: add MODULE_LICENSE tag
   14b2ad0bb2fa net_sched: gen_estimator: fix lockdep splat
   701ba0df9520 net: avoid skb_warn_bad_offload on IS_ERR
   83ee02de2c8d rds: tcp: atomically purge entries from rds_tcp_conn_list during netns delete
   c64534f82608 rds: tcp: correctly sequence cleanup on netns deletion.
   6e12516df136 netfilter: xt_RATEEST: acquire xt_rateest_mutex for hash insert
   be6c08bf9aea netfilter: xt_cgroup: initialize info->priv in cgroup_mt_check_v1()
   516c855cf514 netfilter: on sockopt() acquire sock lock only in the required scope
   2852a7dd15fe netfilter: ipt_CLUSTERIP: fix out-of-bounds accesses in clusterip_tg_check()
   f25f048d3bde netfilter: x_tables: avoid out-of-bounds reads in xt_request_find_{match|target}
   6609d112229f netfilter: x_tables: fix int overflow in xt_alloc_table_info()
   4249e8af8108 kcov: detect double association with a single task
   7b5ec5505945 KVM: x86: fix escape of guest dr6 to the host
   2cc50a1946e6 blk_rq_map_user_iov: fix error override
   2c565a9538a1 staging: android: ion: Switch from WARN to pr_warn
   747ad3d31592 staging: android: ion: Add __GFP_NOWARN for system contig heap
   392e03283a3d crypto: x86/twofish-3way - Fix %rbp usage
   9bae74042eb1 media: pvrusb2: properly check endpoint types
   ca181454e726 selinux: skip bounded transition processing if the policy isn't loaded
   116df867dbc1 selinux: ensure the context is NUL terminated in security_context_to_sid_core()
   b517942f5126 ptr_ring: try vmalloc() when kmalloc() fails
   6688494804d8 ptr_ring: fail early if queue occupies more than KMALLOC_MAX_SIZE
   73e6a383d150 ALSA: bcd2000: Add a sanity check for invalid EPs
   b43a3e21937c ALSA: caiaq: Add a sanity check for invalid EPs
   90bca3712acb ALSA: line6: Add a sanity check for invalid EPs
   8c666e6471ac drm: Require __GFP_NOFAIL for the legacy drm_modeset_lock_all
   3587188ad596 dnotify: Handle errors from fsnotify_add_mark_locked() in fcntl_dirnotify()
   90f9a1ff1e8e blktrace: fix unlocked registration of tracepoints
   2df0d6de5eff sctp: set frag_point in sctp_setsockopt_maxseg correctly
   4d4d55665f32 xfrm: check id proto in validate_tmpl()
   70c5e41f4734 xfrm: Fix stack-out-of-bounds read on socket policy lookup.
   d6b36a2616ab RDMA/netlink: Fix general protection fault
   846666fad8d7 KVM/x86: Check input paging mode when cs.l is set
   7880fc541566 mm,vmscan: Make unregister_shrinker() no-op if register_shrinker() failed.
   8e754b4ec589 xfrm: skip policies marked as dead while rehashing
   e8370258ca0b xfrm: fix rcu usage in xfrm_get_type_offload
   85c31887a20d xfrm: don't call xfrm_policy_cache_flush while holding spinlock
   201941360944 esp: Fix GRO when the headers not fully in the linear part of the skb.
   447f1170c23b mac80211_hwsim: validate number of different channels
   b9e441e2e634 cfg80211: check dev_set_name() return value
   ddf0936b9eef bpf: mark dst unknown on inconsistent {s, u}bounds adjustments
   6c0b71202f83 kcm: Only allow TCP sockets to be attached to a KCM mux
   44890e9ff771 kcm: Check if sk_user_data already set in kcm_attach
   ed25667f3303 vhost: use mutex_lock_nested() in vhost_dev_lock_vqs()
   ebf7d035c39a usb: core: Add a helper function to check the validity of EP type in URB
   58056a531e44 Linux 4.14.21
   e506ac1dab86 ovl: hash directory inodes for fsnotify
   f1a81c0eab38 ASoC: acpi: fix machine driver selection based on quirk
   9a2b3777bd53 mmc: sdhci-of-esdhc: fix the mmc error after sleep on ls1046ardb
   44e47693e3a6 mmc: sdhci-of-esdhc: fix eMMC couldn't work after kexec
   ffe075e233bb mmc: sdhci-of-esdhc: disable SD clock for clock value 0
   11785a9ece1b media: r820t: fix r820t_write_reg for KASAN
   bbd577fec485 ARM: dts: Delete bogus reference to the charlcd
   5782df0a58b6 arm: dts: mt2701: Add reset-cells
   011c19041424 arm: dts: mt7623: Update ethsys binding
   7367af9cf0e4 ARM: dts: s5pv210: add interrupt-parent for ohci
   34aac3426553 arm64: dts: msm8916: Add missing #phy-cells
   361bd5be7b84 ARM: pxa/tosa-bt: add MODULE_LICENSE tag
   f5eab7c3d100 ARM: dts: exynos: fix RTC interrupt for exynos5410
   dcdc01c2edd4 Bluetooth: BT_HCIUART now depends on SERIAL_DEV_BUS
   875758d79d8f scsi: core: check for device state in __scsi_remove_target()
   26f8c38bb466 x86/mm, mm/hwpoison: Don't unconditionally unmap kernel 1:1 pages
   e4ea7c12229c usb: Move USB_UHCI_BIG_ENDIAN_* out of USB_SUPPORT
   ac98d5a624fe mvpp2: fix multicast address filter
   7466294dad89 ALSA: seq: Fix racy pool initializations
   ec5a08abefe6 ALSA: usb: add more device quirks for USB DSD devices
   e1b13eb16c98 ALSA: usb-audio: add implicit fb quirk for Behringer UFX1204
   de3e81917564 ALSA: hda/realtek: PCI quirk for Fujitsu U7x7
   81ae4f7479f9 ALSA: hda/realtek - Enable Thinkpad Dock device for ALC298 platform
   5640397f06ad ALSA: hda/realtek - Add headset mode support for Dell laptop
   8f65cd77c97c ALSA: usb-audio: Fix UAC2 get_ctl request with a RANGE attribute
   c0cf529a8f4d ALSA: hda - Fix headset mic detection problem for two Dell machines
   bc74262f3a65 mtd: nand: vf610: set correct ooblayout
   8a8c9588c289 9p/trans_virtio: discard zero-length reply
   61c07810bf2e Btrfs: fix unexpected -EEXIST when creating new inode
   f30c7d95b4eb Btrfs: fix use-after-free on root->orphan_block_rsv
   1371798b92c8 Btrfs: fix btrfs_evict_inode to handle abnormal inodes correctly
   9a701c4fa563 Btrfs: fix extent state leak from tree log
   fda3bb933b33 Btrfs: fix crash due to not cleaning up tree log block's dirty bits
   c766cb48771b Btrfs: fix deadlock in run_delalloc_nocow
   f6318abd3a54 dm: correctly handle chained bios in dec_pending()
   c8d0f63c1585 iscsi-target: make sure to wake up sleeping login worker
   4cbb9fdf133c target/iscsi: avoid NULL dereference in CHAP auth error path
   0528a533f368 blk-wbt: account flush requests correctly
   67154fb80121 xprtrdma: Fix BUG after a device removal
   84b41e3708ac xprtrdma: Fix calculation of ri_max_send_sges
   848dd9bf5154 drm/qxl: reapply cursor after resetting primary
   dc0b764a7c1a qxl: alloc & use shadow for dumb buffers
   851e2ea82303 arm64: proc: Set PTE_NG for table entries to avoid traversing them twice
   ff59e379234b rtlwifi: rtl8821ae: Fix connection lost problem correctly
   753fc48e595a mpls, nospec: Sanitize array index in mpls_label_ok()
   294975841483 tracing: Fix parsing of globs with a wildcard at the beginning
   29b4af70409c seq_file: fix incomplete reset on read from zero offset
   0f0fd0073911 xenbus: track caller request id
   a2fd6c095033 xen: Fix {set,clear}_foreign_p2m_mapping on autotranslating guests
   0569dd9beef4 rbd: whitelist RBD_FEATURE_OPERATIONS feature bit
   3711b5c568cd console/dummy: leave .con_font_get set to NULL
   6e6fd5b4ea9d video: fbdev: atmel_lcdfb: fix display-timings lookup
   c77b38855036 PCI: keystone: Fix interrupt-controller-node lookup
   8c125f391333 PCI: iproc: Fix NULL pointer dereference for BCMA
   990bb6eb9ec2 PCI: Disable MSI for HiSilicon Hip06/Hip07 only in Root Port mode
   524a886aa8c9 MIPS: Fix incorrect mem=X@Y handling
   f4f261974c6b MIPS: Fix typo BIG_ENDIAN to CPU_BIG_ENDIAN
   1f21cd46caca mm: Fix memory size alignment in devm_memremap_pages_release()
   568c61facce6 mm: hide a #warning for COMPILE_TEST
   ef7fd28b1137 ext4: correct documentation for grpid mount option
   2e38988253c1 ext4: save error to disk in __ext4_grp_locked_error()
   4d4d103a1b7e ext4: fix a race in the ext4 shutdown path
   879bcbe0913f jbd2: fix sphinx kernel-doc build warnings
   598b21708ec0 Revert "apple-gmux: lock iGP IO to protect from vgaarb changes"
   e7cedb56ae9a mlx5: fix mlx5_get_vector_affinity to start from completion vector 0
   723cc3aeba9b Revert "mmc: meson-gx: include tx phase in the tuning process"
   e8012ff87793 mmc: bcm2835: Don't overwrite max frequency unconditionally
   a1341cac93fa mmc: sdhci: Implement an SDHCI-specific bounce buffer
   e96a21989974 mbcache: initialize entry->e_referenced in mb_cache_entry_create()
   c3bdd547042f rtc-opal: Fix handling of firmware error codes, prevent busy loops
   a29adc04cb6d drm/radeon: adjust tested variable
   808700475218 drm/radeon: Add dpm quirk for Jet PRO (v2)
   254d48c8cc3b arm64: Add missing Falkor part number for branch predictor hardening
   e4a6d687e5d9 drm/ast: Load lut in crtc_commit
   dc2b0e41fc5e drm/amd/powerplay: Fix smu_table_entry.handle type
   b51521c9a191 drm/qxl: unref cursor bo when finished with it
   15cdc016f109 drm/ttm: Fix 'buf' pointer update in ttm_bo_vm_access_kmap() (v2)
   f02c3f7f6d30 drm/ttm: Don't add swapped BOs to swap-LRU list
   6c0398cfebf5 x86/entry/64: Fix CR3 restore in paranoid_exit()
   231d0c70be74 x86/cpu: Change type of x86_cache_size variable to unsigned int
   7d7ebee6ce11 x86/spectre: Fix an error message
   325cbb04dc61 x86/cpu: Rename cpu_data.x86_mask to cpu_data.x86_stepping
   73f231c7ee69 selftests/x86/mpx: Fix incorrect bounds with old _sigfault
   208beef6d8f2 x86/mm: Rename flush_tlb_single() and flush_tlb_one() to __flush_tlb_one_[user|kernel]()
   d6d0c0a618a1 kmemcheck: rip it out for real
   f369f1486116 kmemcheck: rip it out
   b9870f85817e kmemcheck: remove whats left of NOTRACK flags
   ae63fd26b2d8 kmemcheck: stop using GFP_NOTRACK and SLAB_NOTRACK
   2abfcdf8e77d kmemcheck: remove annotations
   1fed58f610b5 x86/speculation: Add <asm/msr-index.h> dependency
   8b4cdbbb29d4 nospec: Move array_index_nospec() parameter checking into separate macro
   9d4cb4dc7a11 x86/speculation: Fix up array_index_nospec_mask() asm constraint
   41d315482500 x86/debug: Use UD2 for WARN()
   4e0067c22d6b x86/debug, objtool: Annotate WARN()-related UD2 as reachable
   842a0d95ef16 objtool: Fix segfault in ignore_unreachable_insn()
   410d273ecc8e selftests/x86: Disable tests requiring 32-bit support on pure 64-bit systems
   8520ea2a0438 selftests/x86: Do not rely on "int $0x80" in single_step_syscall.c
   cf4db6342da4 selftests/x86: Do not rely on "int $0x80" in test_mremap_vdso.c
   e6eced764e1a selftests/x86/pkeys: Remove unused functions
   3eb95d5187a3 selftests/x86: Clean up and document sscanf() usage
   301e6fe0915c selftests/x86: Fix vDSO selftest segfault for vsyscall=none
   5cf7b883bcba x86/entry/64: Remove the unused 'icebp' macro
   bdcf05c64a64 x86/entry/64: Fix paranoid_entry() frame pointer warning
   a816dd2fa2dc x86/entry/64: Indent PUSH_AND_CLEAR_REGS and POP_REGS properly
   de66c3a3b0a6 x86/entry/64: Get rid of the ALLOC_PT_GPREGS_ON_STACK and SAVE_AND_CLEAR_REGS macros
   bd25388691c0 x86/entry/64: Use PUSH_AND_CLEAN_REGS in more cases
   3ce4863a44ff x86/entry/64: Introduce the PUSH_AND_CLEAN_REGS macro
   47d9c905ae7a x86/entry/64: Interleave XOR register clearing with PUSH instructions
   bb6873552764 x86/entry/64: Merge the POP_C_REGS and POP_EXTRA_REGS macros into a single POP_REGS macro
   51209eec238f x86/entry/64: Merge SAVE_C_REGS and SAVE_EXTRA_REGS, remove unused extensions
   d10d0bb86d97 x86/entry/64: Clear registers for exceptions/interrupts, to reduce speculation attack surface
   e578fedba81e PM: cpuidle: Fix cpuidle_poll_state_init() prototype
   c59cce7943df PM / runtime: Update links_count also if !CONFIG_SRCU
   2efd067aa4ef x86/speculation: Clean up various Spectre related details
   a15bdf6579b2 KVM/nVMX: Set the CPU_BASED_USE_MSR_BITMAPS if we have a valid L02 MSR bitmap
   07a3a99ed7f9 X86/nVMX: Properly set spec_ctrl and pred_cmd before merging MSRs
   474bd0b82e24 KVM/x86: Reduce retpoline performance impact in slot_handle_level_range(), by always inlining iterator helper methods
   bdc69a2ffa01 Revert "x86/speculation: Simplify indirect_branch_prediction_barrier()"
   b7451cb6159a x86/speculation: Correct Speculation Control microcode blacklist again
   d5a1b559235a x86/speculation: Update Speculation Control microcode blacklist
   372ed448263d x86/mm/pti: Fix PTI comment in entry_SYSCALL_64()
   b973685e70c3 powerpc/mm/radix: Split linear mapping on hot-unplug
   14d87b710338 crypto: sun4i_ss_prng - convert lock to _bh in sun4i_ss_prng_generate
   b3d33c5f296b crypto: sun4i_ss_prng - fix return value of sun4i_ss_prng_generate
   fff8ad7c18a2 compiler-gcc.h: __nostackprotector needs gcc-4.4 and up
   045e5161abfc compiler-gcc.h: Introduce __optimize function attribute
   ec35f83de1c8 x86/entry/64/compat: Clear registers for compat syscalls, to reduce speculation attack surface
   2bc19b518cb2 x86/entry/64: Clear extra registers beyond syscall arguments, to reduce speculation attack surface
   43d38b079ca7 x86: PM: Make APM idle driver initialize polling state
   41fd295d90a7 x86/xen: init %gs very early to avoid page faults with stack protector
   04f048fad32e x86/kexec: Make kexec (mostly) work in 5-level paging mode
   0fe1e5ec1c27 x86/gpu: add CFL to early quirks
   ba86431b7b58 drm/i915/kbl: Change a KBL pci id to GT2 from GT1.5
   cc2759b7bb7c drm/i915: add GT number to intel_device_info
   ce6ec5b8dc5a arm: spear13xx: Fix spics gpio controller's warning
   349d03cb5378 arm: spear13xx: Fix dmas cells
   b1637c1236d0 arm: spear600: Add missing interrupt-parent of rtc
   cbcc2ff13af5 arm: dts: mt7623: fix card detection issue on bananapi-r2
   be1965486122 ARM: dts: nomadik: add interrupt-parent for clcd
   9be4b2f6d024 ARM: dts: STi: Add gpio polarity for "hdmi,hpd-gpio" property
   34d58f7ccb65 ARM: lpc3250: fix uda1380 gpio numbers
   bd4200936367 arm64: dts: msm8916: Correct ipc references for smsm
   27f97375fcb8 s390: fix handling of -1 in set{,fs}[gu]id16 syscalls
   f25dfc9359cc dma-buf: fix reservation_object_wait_timeout_rcu once more v2
   40be210c830e powerpc: Fix DABR match on hash based systems
   3b09911d3beb powerpc/xive: Use hw CPU ids when configuring the CPU queues
   892674b5058a powerpc/mm: Flush radix process translations when setting MMU type
   4386f223b418 powerpc/numa: Invalidate numa_cpu_lookup_table on cpu remove
   5b98d31481f9 powerpc/radix: Remove trace_tlbie call from radix__flush_tlb_all
   2e7e8bd8f195 ocfs2: try a blocking lock before return AOP_TRUNCATED_PAGE
   1ec4c78e3444 mwifiex: resolve reset vs. remove()/shutdown() deadlocks
   62def1d604a5 PM / devfreq: Propagate error from devfreq_add_device()
   37efa60e1670 swiotlb: suppress warning when __GFP_NOWARN is set
   8e56a935a4b7 cpufreq: powernv: Dont assume distinct pstate values for nominal and pmin
   75a3f11c7bad RDMA/rxe: Fix rxe_qp_cleanup()
   571cb36fac2f RDMA/rxe: Fix a race condition in rxe_requester()
   7b4e8a46d4cf RDMA/rxe: Fix a race condition related to the QP error state
   7dd2dbdd4606 kselftest: fix OOM in memory compaction test
   9c2e7a048d19 selftests: seccomp: fix compile error seccomp_bpf
   1d6eb826e65d IB/core: Avoid a potential OOPs for an unused optional parameter
   d40ad865704b IB/core: Fix ib_wc structure size to remain in 64 bytes boundary
   18c0ee900c8d IB/core: Fix two kernel warnings triggered by rxe registration
   ade57e9031fa IB/mlx4: Fix incorrectly releasing steerable UD QPs when have only ETH ports
   5a4255467cd8 IB/qib: Fix comparison error with qperf compare/swap test
   7a748f0bb2e4 IB/umad: Fix use of unprotected device pointer
   e99306bb4f67 scsi: smartpqi: allow static build ("built-in")
   b6f2efb86440 tracing: Prevent PROFILE_ALL_BRANCHES when FORTIFY_SOURCE=y
   7e83b2ff485c Linux 4.14.20
   1dbdcf117b22 scsi: cxlflash: Reset command ioasc
   5fc77964eaa9 scsi: lpfc: Fix crash after bad bar setup on driver attachment
   ce6faf10fd65 rcu: Export init_rcu_head() and destroy_rcu_head() to GPL modules
   c561093ed684 scsi: core: Ensure that the SCSI error handler gets woken up
   b470fb7b7910 ftrace: Remove incorrect setting of glob search field
   d9ef40037443 devpts: fix error handling in devpts_mntget()
   dff5406432ff mn10300/misalignment: Use SIGSEGV SEGV_MAPERR to report a failed user copy
   c7aee3941e1e ovl: take mnt_want_write() for removing impure xattr
   e822be750270 ovl: fix failure to fsync lower dir
   9fc03876355a acpi, nfit: fix register dimm error handling
   f232bfdcdd76 ACPI: sbshc: remove raw pointer from printk() message
   a51421b4cb09 drm/i915: Avoid PPS HW/SW state mismatch due to rounding
   812245b4dbf6 arm64: dts: marvell: add Ethernet aliases
   2a3d3015a73c objtool: Fix switch-table detection
   4063cd5683ce btrfs: Handle btrfs_set_extent_delalloc failure in fixup worker
   2617e62c2f12 lib/ubsan: add type mismatch handler for new GCC/Clang
   5a5df7771064 lib/ubsan.c: s/missaligned/misaligned/
   c87806a8e565 clocksource/drivers/stm32: Fix kernel panic with multiple timers
   392640fd18f8 blk-mq: quiesce queue before freeing queue
   c846868070d0 pktcdvd: Fix a recently introduced NULL pointer dereference
   030dcf7d1af3 pktcdvd: Fix pkt_setup_dev() error path
   f04fe1192e56 pinctrl: sx150x: Add a static gpio/pinctrl pin range mapping
   5219eedf2d5e pinctrl: sx150x: Register pinctrl before adding the gpiochip
   89cad3fa5491 pinctrl: sx150x: Unregister the pinctrl on release
   688d1b8c4721 pinctrl: mcp23s08: fix irq setup order
   05c9297f3405 pinctrl: intel: Initialize GPIO properly when used through irqchip
   bed938ba673c EDAC, octeon: Fix an uninitialized variable warning
   e68d638e4931 xtensa: fix futex_atomic_cmpxchg_inatomic
   12ab9e1e8d61 alpha: fix formating of stack content
   bef0563f39cd alpha: fix reboot on Avanti platform
   371c5ada2af7 alpha: Fix mixed up args in EXC macro in futex operations
   90d17505219a alpha: osf_sys.c: fix put_tv32 regression
   632a537b3c6b alpha: fix crash if pthread_create races with signal delivery
   16256f265880 signal/sh: Ensure si_signo is initialized in do_divide_error
   34ad59099ead signal/openrisc: Fix do_unaligned_access to send the proper signal
   765ae618ad9f ipmi: use dynamic memory for DMI driver override
   fed016a79b42 Bluetooth: btusb: Restore QCA Rome suspend/resume fix with a "rewritten" version
   2a2ee0c1fee7 Revert "Bluetooth: btusb: fix QCA Rome suspend/resume"
   ed72fcf64362 Bluetooth: btsdio: Do not bind to non-removable BCM43341
   0e4ac4aed9f9 HID: quirks: Fix keyboard + touchpad on Toshiba Click Mini not working
   703b37d84598 pipe: fix off-by-one error when checking buffer limits
   a125e9a42302 pipe: actually allow root to exceed the pipe buffer limits
   75526a9bd3f4 kernel/relay.c: revert "kernel/relay.c: fix potential memory leak"
   838f9cc948b0 kernel/async.c: revert "async: simplify lowest_in_progress()"
   7e54b58285e1 fs/proc/kcore.c: use probe_kernel_read() instead of memcpy()
   ebe2ba53851e media: cxusb, dib0700: ignore XC2028_I2C_FLUSH
   7a401e25f0a5 media: ts2020: avoid integer overflows on 32 bit machines
   ad91b2e392be media: dvb-frontends: fix i2c access helpers for KASAN
   062cd3463c17 kasan: rework Kconfig settings
   e186d8bfdabd kasan: don't emit builtin calls when sanitization is off
   d16919a3fe2d Btrfs: raid56: iterate raid56 internal bio with bio_for_each_segment_all
   e06f7b686daa watchdog: imx2_wdt: restore previous timeout after suspend+resume
   b897f1dc780e ASoC: skl: Fix kernel warning due to zero NHTL entry
   4562bfdeac87 ASoC: rockchip: i2s: fix playback after runtime resume
   e747a02d9fcf KVM: PPC: Book3S PR: Fix broken select due to misspelling
   985bf3991342 KVM: arm/arm64: Handle CPU_PM_ENTER_FAILED
   be54d79b43fd KVM: PPC: Book3S HV: Drop locks before reading guest memory
   88b64450cc0a KVM: PPC: Book3S HV: Make sure we don't re-enter guest without XIVE loaded
   fe90a3a6f881 KVM: nVMX: Fix bug of injecting L2 exception into L1
   6bad51166f87 KVM: nVMX: Fix races when sending nested PI while dest enters/leaves L2
   7dffdb31ad13 arm: KVM: Fix SMCCC handling of unimplemented SMC/HVC calls
   f37a798e7724 crypto: sha512-mb - initialize pending lengths correctly
   f428567e005f crypto: caam - fix endless loop when DECO acquire fails
   1a4834092539 media: v4l2-compat-ioctl32.c: make ctrl_is_pointer work for subdevs
   ad01b40bb9be media: v4l2-compat-ioctl32.c: refactor compat ioctl32 logic
   b3f69836c92b media: v4l2-compat-ioctl32.c: don't copy back the result for certain errors
   efabe94f8a0d media: v4l2-compat-ioctl32.c: drop pr_info for unknown buffer type
   a20ab4df701b media: v4l2-compat-ioctl32.c: copy clip list in put_v4l2_window32
   f1b572d34648 media: v4l2-compat-ioctl32.c: fix ctrl_is_pointer
   3df119772466 media: v4l2-compat-ioctl32.c: copy m.userptr in put_v4l2_plane32
   16c25072560f media: v4l2-compat-ioctl32.c: avoid sizeof(type)
   a38becb087b2 media: v4l2-compat-ioctl32.c: move 'helper' functions to __get/put_v4l2_format32
   0b7d6ac53606 media: v4l2-compat-ioctl32.c: fix the indentation
   2b991eeb5cfb media: v4l2-compat-ioctl32.c: add missing VIDIOC_PREPARE_BUF
   2d280dab382e media: v4l2-ioctl.c: don't copy back the result for -ENOTTY
   ea96d8f676dd media: v4l2-ioctl.c: use check_fmt for enum/g/s/try_fmt
   2f00eb279088 crypto: hash - prevent using keyed hashes without setting key
   8d906d183bce crypto: hash - annotate algorithms taking optional key
   b806c0cc4c73 crypto: poly1305 - remove ->setkey() method
   16210524c424 crypto: mcryptd - pass through absence of ->setkey()
   ed7b0af0ca02 crypto: cryptd - pass through absence of ->setkey()
   b8b32e2e68f0 crypto: hash - introduce crypto_hash_alg_has_setkey()
   449704d3ba6f ahci: Add Intel Cannon Lake PCH-H PCI ID
   53c5963da843 ahci: Add PCI ids for Intel Bay Trail, Cherry Trail and Apollo Lake AHCI
   e985f7c8ac38 ahci: Annotate PCI ids for mobile Intel chipsets as such
   650d3d8512c6 kernfs: fix regression in kernfs_fop_write caused by wrong type
   f1e31607e73d NFS: Fix a race between mmap() and O_DIRECT
   1c38ad2f26d8 NFS: reject request for id_legacy key without auxdata
   60017643c210 NFS: commit direct writes even if they fail partially
   6421f29eb8af NFS: Fix nfsstat breakage due to LOOKUPP
   3d03af006438 NFS: Add a cond_resched() to nfs_commit_release_pages()
   3ac2d17a6ed3 nfs41: do not return ENOMEM on LAYOUTUNAVAILABLE
   ace34428faa6 nfs/pnfs: fix nfs_direct_req ref leak when i/o falls back to the mds
   068e53f9b192 ubifs: free the encrypted symlink target
   e9a35f8b73f1 ubi: block: Fix locking for idr_alloc/idr_remove
   5793f39de7f6 ubi: fastmap: Erase outdated anchor PEBs during attach
   c94c39ac85f1 ubi: Fix race condition between ubi volume creation and udev
   7eb52a6889e9 mtd: nand: sunxi: Fix ECC strength choice
   16d11602c83b mtd: nand: Fix nand_do_read_oob() return value
   4527b0887bc5 mtd: nand: brcmnand: Disable prefetch by default
   0763f0418bb5 mtd: cfi: convert inline functions to macros
   c584c903bae9 arm64: Kill PSCI_GET_VERSION as a variant-2 workaround
   dbca45b99655 arm64: Add ARM_SMCCC_ARCH_WORKAROUND_1 BP hardening support
   ac63fdb4a2b2 arm/arm64: smccc: Implement SMCCC v1.1 inline primitive
   37dc3e6c117e arm/arm64: smccc: Make function identifiers an unsigned quantity
   908ad7a1484d firmware/psci: Expose SMCCC version through psci_ops
   906a9f396cc8 firmware/psci: Expose PSCI conduit
   6db26ad1dc46 arm64: KVM: Add SMCCC_ARCH_WORKAROUND_1 fast handling
   e47273d08623 arm64: KVM: Report SMCCC_ARCH_WORKAROUND_1 BP hardening support
   2cfe8929f624 arm/arm64: KVM: Turn kvm_psci_version into a static inline
   98be7165d9f7 arm64: KVM: Make PSCI_VERSION a fast path
   45e2061147c3 arm/arm64: KVM: Advertise SMCCC v1.1
   4ba100aa94a0 arm/arm64: KVM: Implement PSCI 1.0 support
   ce15f32d4884 arm/arm64: KVM: Add smccc accessors to PSCI code
   4efa1a863a12 arm/arm64: KVM: Add PSCI_VERSION helper
   591862b56000 arm/arm64: KVM: Consolidate the PSCI include files
   0b3512fa7b0a arm64: KVM: Increment PC after handling an SMC trap
   402aeac58753 arm64: Branch predictor hardening for Cavium ThunderX2
   9b26a45c34e4 arm64: Implement branch predictor hardening for Falkor
   48993dfa1af8 arm64: Implement branch predictor hardening for affected Cortex-A CPUs
   3317097b2b4a arm64: cputype: Add missing MIDR values for Cortex-A72 and Cortex-A75
   48c3538c3578 arm64: entry: Apply BP hardening for suspicious interrupts from EL0
   6b47a8256a56 arm64: entry: Apply BP hardening for high-priority synchronous exceptions
   aab3306701f1 arm64: KVM: Use per-CPU vector when BP hardening is enabled
   9107ac4ea3da arm64: Move BP hardening to check_and_switch_context
   5bee81c98029 arm64: Add skeleton to harden the branch predictor against aliasing attacks
   c10e4aa77814 arm64: Move post_ttbr_update_workaround to C code
   f91f190708b2 drivers/firmware: Expose psci_get_version through psci_ops structure
   be53742befea arm64: cpufeature: Pass capability structure to ->enable callback
   9da836a476fe arm64: Run enable method for errata work arounds on late CPUs
   da1f67921d2f arm64: cpufeature: __this_cpu_has_cap() shouldn't stop early
   d9ef050f2895 arm64: futex: Mask __user pointers prior to dereference
   ba32050d308a arm64: uaccess: Mask __user pointers for __arch_{clear, copy_*}_user
   28d8886d985c arm64: uaccess: Don't bother eliding access_ok checks in __{get, put}_user
   1ccaee9dea60 arm64: uaccess: Prevent speculative use of the current addr_limit
   7a51d7d2f7f7 arm64: entry: Ensure branch through syscall table is bounded under speculation
   2e985d2647a0 arm64: Use pointer masking to limit uaccess speculation
   535357c9d3e9 arm64: Make USER_DS an inclusive limit
   0a532ea3ef14 arm64: Implement array_index_mask_nospec()
   6afdaf109c34 arm64: barrier: Add CSDB macros to control data-value prediction
   1449a173a2ee arm64: idmap: Use "awx" flags for .idmap.text .pushsection directives
   8703f27d7c5d arm64: entry: Reword comment about post_ttbr_update_workaround
   e39247ca1714 arm64: Force KPTI to be disabled on Cavium ThunderX
   2feb36ebe450 arm64: kpti: Add ->enable callback to remap swapper using nG mappings
   ee28fed5ccc6 arm64: mm: Permit transitioning from Global to Non-Global without BBM
   69288201803a arm64: kpti: Make use of nG dependent on arm64_kernel_unmapped_at_el0()
   c98c8c235856 arm64: Turn on KPTI only on CPUs that need it
   7aca19ea5a45 arm64: cputype: Add MIDR values for Cavium ThunderX2 CPUs
   fedf5a743cf2 arm64: kpti: Fix the interaction between ASID switching and software PAN
   0b2995145ea4 arm64: mm: Introduce TTBR_ASID_MASK for getting at the ASID in the TTBR
   5385e5fe9724 arm64: capabilities: Handle duplicate entries for a capability
   83ae3355bdfb arm64: Take into account ID_AA64PFR0_EL1.CSV3
   5e319f4533bf arm64: Kconfig: Reword UNMAP_KERNEL_AT_EL0 kconfig entry
   332e0288200f arm64: Kconfig: Add CONFIG_UNMAP_KERNEL_AT_EL0
   68a65ce7039a arm64: use RET instruction for exiting the trampoline
   3882b5f63f3c arm64: kaslr: Put kernel vectors address in separate data page
   7fafcbb04f94 arm64: entry: Add fake CPU feature for unmapping the kernel at EL0
   2843ade2dad2 arm64: tls: Avoid unconditional zeroing of tpidrro_el0 for native tasks
   4e29f25b2bc1 arm64: cpu_errata: Add Kryo to Falkor 1003 errata
   15a511c0cbd1 arm64: erratum: Work around Falkor erratum #E1003 in trampoline code
   6472f1a3a54f arm64: entry: Hook up entry trampoline to exception vectors
   86200f218f98 arm64: entry: Explicitly pass exception level to kernel_ventry macro
   63d13760abd7 arm64: mm: Map entry trampoline into trampoline and kernel page tables
   78422a7b5160 arm64: entry: Add exception trampoline page for exceptions from EL0
   d6c414013bb4 arm64: mm: Invalidate both kernel and user ASIDs when performing TLBI
   53b13950886c arm64: mm: Add arm64_kernel_unmapped_at_el0 helper
   a8bad38cff23 arm64: mm: Allocate ASIDs in pairs
   00ff7de671f8 arm64: mm: Fix and re-enable ARM64_SW_TTBR0_PAN
   95ce0d51f9a8 arm64: mm: Rename post_ttbr0_update_workaround
   4445cb04410f arm64: mm: Remove pre_ttbr0_update_workaround for Falkor erratum #E1003
   d26f0a5dc6a6 arm64: mm: Move ASID from TTBR0 to TTBR1
   59f47f9dcdcd arm64: mm: Temporarily disable ARM64_SW_TTBR0_PAN
   78299fafcd78 arm64: mm: Use non-global mappings for kernel space
   63380839c575 arm64: move TASK_* definitions to <asm/processor.h>
   dd24d173b50a media: hdpvr: Fix an error handling path in hdpvr_probe()
   2bd6279a4a8c media: dvb-usb-v2: lmedm04: move ts2020 attach to dm04_lme2510_tuner
   fd31a38d268f media: dvb-usb-v2: lmedm04: Improve logic checking of warm start
   e5e1e153ecd4 dccp: CVE-2017-8824: use-after-free in DCCP code
   050b86b5bf20 drm/i915: Fix deadlock in i830_disable_pipe()
   50018d09843c drm/i915: Redo plane sanitation during readout
   19d8e5122fef drm/i915: Add .get_hw_state() method for planes
   d9c3131f2ab4 sched/rt: Up the root domain ref count when passing it around via IPIs
   9c41a8453c82 sched/rt: Use container_of() to get root domain in rto_push_irq_work_func()
   fea5349eb88b KVM MMU: check pending exception before injecting APF
   4c54eab372f8 arm64: Add software workaround for Falkor erratum 1041
   0b69ec336d3d arm64: Define cputype macros for Falkor CPU
   fd7467f82e58 watchdog: gpio_wdt: set WDOG_HW_RUNNING in gpio_wdt_stop
   e94a7de2a3d2 sched/wait: Fix add_wait_queue() behavioral change
   69373cdc4ae4 dmaengine: dmatest: fix container_of member in dmatest_callback
   7adf1d63ef65 cpufreq: mediatek: add mediatek related projects into blacklist
   4126cdb73193 CIFS: zero sensitive data when freeing
   be6874b4d480 cifs: Fix autonegotiate security settings mismatch
   061df7705a53 cifs: Fix missing put_xid in cifs_file_strict_mmap
   b4a9ffad9702 powerpc/pseries: include linux/types.h in asm/hvcall.h
   8caab9edccf5 watchdog: indydog: Add dependency on SGI_HAS_INDYDOG
   1722fe372784 Linux 4.14.19
   d2aeb4e2bd8d Revert "x86/alternative: Print unadorned pointers"
   22f16a74c474 scsi: storvsc: missing error code in storvsc_probe()
   f18046f7a50a kernel/exit.c: export abort() to modules
   c5c91d830507 arch: define weak abort()
   3a570cfe785a crypto: tcrypt - fix S/G table for test_aead_speed()
   68a9f19264fd media: soc_camera: soc_scale_crop: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   1bf81cff1bad media: mtk-vcodec: add missing MODULE_LICENSE/DESCRIPTION
   981f20bc7595 soreuseport: fix mem leak in reuseport_add_sock()
   456add4c9bd3 ipv6: Fix SO_REUSEPORT UDP socket with implicit sk_ipv6only
   c04818abad46 tcp_bbr: fix pacing_gain to always be unity when using lt_bw
   1da27118f419 rocker: fix possible null pointer dereference in rocker_router_fib_event_work
   07ca93e3176b net: ipv6: send unsolicited NA after DAD
   799a34d5b048 Revert "defer call to mem_cgroup_sk_alloc()"
   b9b70c876a7a vhost_net: stop device during reset owner
   6d35430fdaf4 tcp: release sk_frag.page in tcp_disconnect
   e8513f250d1b r8169: fix RTL8168EP take too long to complete driver initialization.
   a7c2cf702a40 qmi_wwan: Add support for Quectel EP06
   fcee7812ea05 qlcnic: fix deadlock bug
   166f27322f8c net: igmp: add a missing rcu locking section
   2726946dfcd2 ip6mr: fix stale iterator
   806d61d66900 kbuild: rpm-pkg: keep spec file until make mrproper
   abc5896b7785 .gitignore: move *.dtb and *.dtb.S patterns to the top-level .gitignore
   bafda5d37527 .gitignore: sort normal pattern rules alphabetically

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.14.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
index b181f2064f97..7d2812fafe8f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7d5b8bc3ba49d0ea78fbbb7c628ee56a08a60253"
-SRCREV_meta ?= "c5e05f3c61046bf6445adff30d5a03a82677d351"
+SRCREV_machine ?= "6c699ea6debe70c60d41d9df23f558ffea2de7cb"
+SRCREV_meta ?= "426c8aa4862f95e84ec163b942b92726d3ef978f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.19"
+LINUX_VERSION ?= "4.14.24"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
index dcf4ff4af6b4..ae9e7691367d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.14.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.14.19"
+LINUX_VERSION ?= "4.14.24"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "57ed1d816d318dfafd0339fade9c694b3c00998d"
-SRCREV_meta ?= "c5e05f3c61046bf6445adff30d5a03a82677d351"
+SRCREV_machine ?= "fccf7693fe5dd00d7b6d391b7405b5d58eb959f2"
+SRCREV_meta ?= "426c8aa4862f95e84ec163b942b92726d3ef978f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.14.bb b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
index bfae61d28905..df998ade6a4b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.14.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "v4.14/standard/base"
 KBRANCH_qemux86-64 ?= "v4.14/standard/base"
 KBRANCH_qemumips64 ?= "v4.14/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "481c15cd5198aa4de9faa1b0edcf69e08f45540b"
-SRCREV_machine_qemuarm64 ?= "57ed1d816d318dfafd0339fade9c694b3c00998d"
-SRCREV_machine_qemumips ?= "b1adde8239132a9e189acbfd0e1c27d1a4ae695f"
-SRCREV_machine_qemuppc ?= "57ed1d816d318dfafd0339fade9c694b3c00998d"
-SRCREV_machine_qemux86 ?= "57ed1d816d318dfafd0339fade9c694b3c00998d"
-SRCREV_machine_qemux86-64 ?= "57ed1d816d318dfafd0339fade9c694b3c00998d"
-SRCREV_machine_qemumips64 ?= "971d3f31a5caf6035dbff8cefea2323c196178a9"
-SRCREV_machine ?= "57ed1d816d318dfafd0339fade9c694b3c00998d"
-SRCREV_meta ?= "c5e05f3c61046bf6445adff30d5a03a82677d351"
+SRCREV_machine_qemuarm ?= "833523192da4c50dfbae5a06d9fcc578e091daf4"
+SRCREV_machine_qemuarm64 ?= "dda8175b9f7ba47d308dd80c2a53e3c7e996d2dd"
+SRCREV_machine_qemumips ?= "43e496c5172a6f1035ecc98e2fac9c5874cefcc1"
+SRCREV_machine_qemuppc ?= "4507887bfd1ba5b3a337e71315fb8cad3be6670f"
+SRCREV_machine_qemux86 ?= "e8410925ef1cdc57f4f367761e94863193014033"
+SRCREV_machine_qemux86-64 ?= "e8410925ef1cdc57f4f367761e94863193014033"
+SRCREV_machine_qemumips64 ?= "b2df75031185b81757c61e95142e0472314c8389"
+SRCREV_machine ?= "e8410925ef1cdc57f4f367761e94863193014033"
+SRCREV_meta ?= "426c8aa4862f95e84ec163b942b92726d3ef978f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.14.19"
+LINUX_VERSION ?= "4.14.24"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


