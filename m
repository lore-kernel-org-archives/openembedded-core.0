Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93469786FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 14:22:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vAGEMQOI009632
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Nov 2017 06:22:26 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 16 Nov 2017 06:22:26 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <akuster808@gmail.com>
Date: Thu, 16 Nov 2017 09:22:25 -0500
Message-ID: <1510842145-6067-1-git-send-email-bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][morty] linux-yocto/4.8: update to v4.8.26
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
X-List-Received-Date: Thu, 16 Nov 2017 14:22:26 -0000
Content-Type: text/plain

Integrating the stable commits from Paul Gortmaker for 4.8.26:

   72fd9e50372d Linux 4.8.26
   bca975f9d61e pstore: Shut down worker when unregistering
   831528f6d369 libnvdimm, pfn: fix 'npfns' vs section alignment
   24e6cea34654 libnvdimm, pmem: fix a NULL pointer BUG in nd_pmem_notify
   6585d5899c12 libnvdimm, region: fix flush hint detection crash
   5679bab89552 ipmi: Fix kernel panic at ipmi_ssif_thread()
   a0edda9d006a Bluetooth: hci_intel: add missing tty-device sanity check
   bdfa99dcaf41 Bluetooth: hci_bcm: add missing tty-device sanity check
   3a197a20503b Bluetooth: Fix user channel for 32bit userspace on 64bit kernel
   2dd96e6a56f6 tty: pty: Fix ldisc flush after userspace become aware of the data already
   bcb0e0973a3f serial: omap: suspend device on probe errors
   e689fc4ccff0 serial: omap: fix runtime-pm handling on unbind
   f1a81a255788 serial: samsung: Use right device for DMA-mapping calls
   a437a5323381 padata: free correct variable
   a05f144a9d3b CIFS: add misssing SFM mapping for doublequote
   349eb07c3118 cifs: fix CIFS_IOC_GET_MNT_INFO oops
   4ca4593289e4 CIFS: fix oplock break deadlocks
   dfc44a5e2f72 CIFS: fix mapping of SFM_SPACE and SFM_PERIOD
   53c2f66294a5 SMB3: Work around mount failure when using SMB3 dialect to Macs
   f39f85a9ec9c Set unicode flag on cifs echo request to avoid Mac error
   ab4bab94e003 Fix match_prepath()
   853849a70bbb mm: prevent potential recursive reclaim due to clearing PF_MEMALLOC
   2a5e703230d8 fs/block_dev: always invalidate cleancache in invalidate_bdev()
   70a6a7422b35 ceph: fix memory leak in __ceph_setxattr()
   1eeca04d2091 fs/xattr.c: zero out memory copied to userspace in getxattr
   6fba0c4d3153 orangefs: do not check possibly stale size on truncate
   aef961cbc788 orangefs: do not set getattr_time on orangefs_lookup
   ad35f4485072 orangefs: clean up oversize xattr validation
   decc9664a7e4 orangefs: fix bounds check for listxattr
   d62cac98eeb2 ext4: evict inline data when writing to memory map
   ae88e436f00e IB/hfi1: Prevent kernel QP post send hard lockups
   5512f0343e1c IB/mlx4: Reduce SRIOV multicast cleanup warning message to debug level
   c831cf234702 IB/mlx4: Fix ib device initialization error flow
   a2f97e715839 IB/IPoIB: ibX: failed to create mcg debug file
   4bb65c977cec IB/core: For multicast functions, verify that LIDs are multicast LIDs
   20ad33c71d4d IB/core: Fix sysfs registration error flow
   0c4446e4d65c dm thin: fix a memory leak when passing discard bio down
   8d5feb420e3b dm rq: check blk_mq_register_dev() return value in dm_mq_init_request_queue()
   c7c19f2ba5db dm era: save spacemap metadata root after the pre-commit
   820b3860065f crypto: algif_aead - Require setkey before accept(2)
   f0757bc95106 block: fix blk_integrity_register to use template's interval_exp if not 0
   491700e5904b KVM: arm/arm64: fix races in kvm_psci_vcpu_on
   2146d0cf63d9 KVM: x86: fix user triggerable warning in kvm_apic_accept_events()
   42f69a5e282f perf/x86: Fix Broadwell-EP DRAM RAPL events
   b07a3600b881 um: Fix PTRACE_POKEUSER on x86_64
   583a0e218a99 x86, pmem: Fix cache flushing for iovec write < 8 bytes
   57760637e50b selftests/x86/ldt_gdt_32: Work around a glibc sigaction() bug
   60ca4f96555f x86/boot: Fix BSS corruption/overwrite bug in early x86 kernel startup
   7fbd5421d5be usb: hub: Do not attempt to autosuspend disconnected devices
   812c5f577e13 usb: hub: Fix error loop seen after hub communication errors
   41c09b5e0036 usb: Make sure usb/phy/of gets built-in
   2a164b1e1a37 usb: misc: add missing continue in switch
   f184320880ec staging: comedi: jr3_pci: cope with jiffies wraparound
   c38aa7ed4029 staging: comedi: jr3_pci: fix possible null pointer dereference
   452fd7a68826 staging: gdm724x: gdm_mux: fix use-after-free on module unload
   1ad9126ccbcb USB: Proper handling of Race Condition when two USB class drivers try to call init_usb_class simultaneously
   ea0e314f4b99 USB: serial: ftdi_sio: add device ID for Microsemi/Arrow SF2PLUS Dev Kit
   4e9575b41329 usb: host: xhci: print correct command ring address
   fe51d203bf26 usb: xhci: bInterval quirk for TI TUSB73x0
   cb3c76399e7d iscsi-target: Set session_fall_back_to_erl0 when forcing reinstatement
   82d4c0daad4d target/fileio: Fix zero-length READ and WRITE handling
   1fb92530ac51 target: Fix compare_and_write_callback handling for non GOOD status
   82c59b4dee19 block: get rid of blk_integrity_revalidate()
   bb25c9749298 drm/ttm: fix use-after-free races in vm fault handling
   04b96345d77c f2fs: sanity check segment count
   8004022099cb net: mdio-mux: bcm-iproc: call mdiobus_free() in error path
   9974c98f5155 bpf: don't let ldimm64 leak map addresses on unprivileged
   8ed935b2461f bnxt_en: allocate enough space for ->ntp_fltr_bmap
   547e949b6556 ipv6: reorder ip6_route_dev_notifier after ipv6_dev_notf
   41c79abb8e54 ipv6: initialize route null entry in addrconf_init()
   60b4e1ac1bcd rtnetlink: NUL-terminate IFLA_PHYS_PORT_NAME string
   3c76ecbb68fc ipv4, ipv6: ensure raw socket message is big enough to hold an IP header
   51f0c06655d7 tcp: do not inherit fastopen_req from parent
   4f4ef66f8a54 net: usb: qmi_wwan: add Telit ME910 support
   9190457be81e net: ipv6: Do not duplicate DAD on link up
   fdbd8c9606d4 tcp: fix wraparound issue in tcp_lp
   402219c947aa bpf, arm64: fix jit branch offset related to ldimm64
   d1d3b5fac542 tcp: do not underestimate skb->truesize in tcp_trim_head()
   b74a9f53923e macsec: dynamically allocate space for sglist
   49e7abb4251d sparc64: fix fault handling in NGbzero.S and GENbzero.S
   6ed64cb9e610 ALSA: hda - Fix deadlock of controller device lock at unbinding
   8b5e31398ade staging: emxx_udc: remove incorrect __init annotations
   19c278eaeef5 staging: wlan-ng: add missing byte order conversion
   d923e0bc0605 brcmfmac: Make skb header writable before use
   ba43849f60c0 brcmfmac: Ensure pointer correctly set if skb data location changes
   a092754fb592 MIPS: R2-on-R6 MULTU/MADDU/MSUBU emulation bugfix
   f316b49a6127 scsi: mac_scsi: Fix MAC_SCSI=m option when SCSI=m
   276ac4dbab2f serial: 8250_omap: Fix probe and remove for PM runtime
   6525e9e63036 clk: rockchip: add "," to mux_pll_src_apll_dpll_gpll_usb480m_p on rk3036
   9d393de73c66 USB: serial: io_edgeport: fix descriptor error handling
   f66d82e82938 USB: serial: mct_u232: fix modem-status error handling
   f8de7e87ed68 USB: serial: quatech2: fix control-message error handling
   7070f0b5094f USB: serial: ftdi_sio: fix latency-timer error handling
   47f6ccfb10df USB: serial: ark3116: fix open error handling
   53aef8f0af7d USB: serial: ti_usb_3410_5052: fix control-message error handling
   2f54a3328f7a USB: serial: io_edgeport: fix epic-descriptor handling
   5f5f5ba0c0d7 USB: serial: ssu100: fix control-message error handling
   4b1da19109b9 USB: serial: digi_acceleport: fix incomplete rx sanity check
   c88342441acb USB: serial: keyspan_pda: fix receive sanity checks
   b3b834c7459c usb: chipidea: Handle extcon events properly
   0ff8c355d1fd usb: chipidea: Only read/write OTGSC from one place
   f5dc93d23c27 usb: host: ohci-exynos: Decrese node refcount on exynos_ehci_get_phy() error paths
   f42b266cb8e0 usb: host: ehci-exynos: Decrese node refcount on exynos_ehci_get_phy() error paths
   c350ac01f4f5 KVM: nVMX: do not leak PML full vmexit to L1
   3a1e3fa213cf KVM: nVMX: initialize PML fields in vmcs02
   2c44b9685a55 Revert "KVM: nested VMX: disable perf cpuid reporting"
   48d8e6283bc9 x86/platform/intel-mid: Correct MSI IRQ line for watchdog device
   bafa78c1a65e kprobes/x86: Fix kernel panic when certain exception-handling addresses are probed
   cf63da5d56fd clk: Make x86/ conditional on CONFIG_COMMON_CLK
   7b34882df641 x86/pci-calgary: Fix iommu_free() comparison of unsigned expression >= 0
   270dd7dbbf77 x86/ioapic: Restore IO-APIC irq_chip retrigger callback
   6a44ffd4dbc8 iwlwifi: mvm: writing zero bytes to debugfs causes a crash
   301082e9c9b7 iwlwifi: mvm: synchronize firmware DMA paging memory
   ee4cac606ac1 iwlwifi: mvm: fix references to first_agg_queue in DQA mode
   97d3c48bd7d4 iwlwifi: mvm: Use aux queue for offchannel frames in dqa
   8fffec6fff0b iwlwifi: mvm: fix reorder timer re-arming
   46913adaacf1 iwlwifi: pcie: don't increment / decrement a bool
   52368ddf6050 iwlwifi: mvm: overwrite skb info later
   83a12256b172 iwlwifi: fix MODULE_FIRMWARE for 6030
   86c87e0daa7f mwifiex: Avoid skipping WEP key deletion for AP
   748491d99d68 mwifiex: remove redundant dma padding in AMSDU
   1569633df83e mwifiex: debugfs: Fix (sometimes) off-by-1 SSID print
   ad4e8ed421e3 ARM: dts: sun7i: lamobo-r1: Fix CPU port RGMII settings
   c60416688ca4 ARM: OMAP5 / DRA7: Fix HYP mode boot for thumb2 build
   dd58846a5358 leds: ktd2692: avoid harmless maybe-uninitialized warning
   381a374688d0 arm: dts: qcom: Fix ipq board clock rates
   a109c21045cf arm64: dts: r8a7795: Mark EthernetAVB device node disabled
   23f7727a1514 powerpc/ftrace: Fix confusing help text for DISABLE_MPROFILE_KERNEL
   8a35dd72827b powerpc/powernv: Fix opal_exit tracepoint opcode
   492d4c504275 powerpc/mm: Fixup wrong LPCR_VRMASD value
   73ae00c24a34 cpupower: Fix turbo frequency reporting for pre-Sandy Bridge cores
   f348742efaa7 tmp: use pdev for parent device in tpm_chip_alloc
   024f822c0f84 tpm: fix RC value check in tpm2_seal_trusted
   bb61249ebc26 hwmon: (it87) Fix pwm4 detection for IT8620 and IT8628
   2484c067e875 drm/sti: fix GDP size to support up to UHD resolution
   e90276910177 9p: fix a potential acl leak
   b1bde1d61aad dm ioctl: prevent stack leak in dm ioctl call
   19952586021f ceph: try getting buffer capability for readahead/fadvise
   2afa5529d98e hwmon: (it87) Avoid registering the same chip on both SIO addresses
   20f5706414a4 scsi: storvsc: Workaround for virtual DVD SCSI version
   bfd008363cd2 timerfd: Protect the might cancel mechanism proper
   c5eb2c3f266f ftrace/x86: Fix triple fault with graph tracing and suspend-to-ram
   79a67346f310 ARCv2: save r30 on kernel entry as gcc uses it for code-gen
   d3b2ff49ba72 net: can: usb: gs_usb: Fix buffer on stack
   a0b23de216d0 macsec: avoid heap overflow in skb_to_sgvec
   93f3107c481a nfsd: stricter decoding of write-like NFSv2/v3 ops
   0b02144efadc nfsd4: minor NFSv2/v3 write decoding cleanup
   cf2b8df2aeea nfsd: check for oversized NFSv2/v3 arguments
   25673437d3fa Input: i8042 - add Clevo P650RS to the i8042 reset list
   328bc25d3525 ASoC: intel: Fix PM and non-atomic crash in bytcr drivers
   fe671099fe8d p9_client_readdir() fix
   29e8f9612740 MIPS: Avoid BUG warning in arch_check_elf
   a10a315719a5 MIPS: cevt-r4k: Fix out-of-bounds array access
   da135df655bf MIPS: KGDB: Use kernel context for sleeping threads
   741f4ca5cc4a ALSA: seq: Don't break snd_use_lock_sync() loop by timeout
   f379be22874a ALSA: firewire-lib: fix inappropriate assignment between signed/unsigned type
   44b8f005e518 ALSA: oxfw: fix regression to handle Stanton SCS.1m/1d
   52b55c9a73a4 ipv6: check raw payload size correctly in ioctl
   2d55be6b35f3 tcp: memset ca_priv data to 0 properly
   3571e0a934e0 ipv6: check skb->protocol before lookup for nexthop
   47a52f3af5b3 net: ipv6: regenerate host route if moved to gc list
   0719e904a617 macvlan: Fix device ref leak when purging bc_queue
   974c18f8cebc net/mlx5e: Fix ETHTOOL_GRXCLSRLALL handling
   ef68966cafe2 net/mlx5e: Fix small packet threshold
   1a3947d78b89 ip6mr: fix notification device destruction
   8907cd376e97 netpoll: Check for skb->queue_mapping
   58fb2345c82e net: ipv6: RTF_PCPU should not be settable from userspace
   92cfda6d6c88 dp83640: don't recieve time stamps twice
   efe73421873e sh_eth: unmap DMA buffers when freeing rings
   aa146f0df8e6 net: vrf: Fix setting NLM_F_EXCL flag when adding l3mdev rule
   193a114497ae net-timestamp: avoid use-after-free in ip_recv_error
   11d565eec8c8 ipv6: Fix idev->addr_list corruption
   aa1985f1aff7 tcp: clear saved_syn in tcp_disconnect()
   b5323dffe1b4 sctp: listen on the sock only when it's state is listening or closed
   eed6013d5c23 net: ipv4: fix multipath RTM_GETROUTE behavior when iif is given
   12add9d91a53 l2tp: fix PPP pseudo-wire auto-loading
   a3fa03ac269b l2tp: take reference on sessions being dumped
   9921b663da3b net/packet: fix overflow in check for tp_reserve
   fb125e7739e8 net/packet: fix overflow in check for tp_frame_nr
   d4380e099256 l2tp: purge socket queues in the .destruct() callback
   5ea6fbde7c3a kcm: return immediately after copy_from_user() failure
   b7c5f5e113a5 net: phy: handle state correctly in phy_stop_machine
   853ff758b593 net: neigh: guard against NULL solicit() method
   cc2ac542fad4 sparc64: Fix kernel panic due to erroneous #ifdef surrounding pmd_write()
   875b971b846a sparc64: kern_addr_valid regression
   1e33ff438412 ping: implement proper locking
   fc5b4dcef3f8 Revert "mmc: sdhci-msm: Enable few quirks"
   cb66cad28324 x86/mce/AMD: Give a name to MCA bank 3 when accessed with legacy MSRs
   c15018165b38 powerpc/kprobe: Fix oops when kprobed on 'stdu' instruction
   19aea564a24f ubi/upd: Always flush after prepared for an update
   a4f1bff6eb6e mac80211: reject ToDS broadcast data frames
   6e9b4ada4075 mmc: sdhci-esdhc-imx: increase the pad I/O drive strength for DDR50 card
   d7f182088aab Input: elantech - add Fujitsu Lifebook E547 to force crc_enabled
   1edb7d9791b8 s390/mm: fix CMMA vs KSM vs others
   302dc30d4442 CIFS: remove bad_network_name flag
   08f16bf5c9ba cifs: Do not send echoes before Negotiate is complete
   07c9b2816029 ring-buffer: Have ring_buffer_iter_empty() return true when empty
   c2bd41c8a061 tracing: Allocate the snapshot buffer before enabling probe
   9ec3d1139f9b KEYS: fix keyctl_set_reqkey_keyring() to not leak thread keyrings
   46756acd3faf KEYS: Change the name of the dead type to ".dead" to prevent user access
   fd9a944708bd KEYS: Disallow keyrings beginning with '.' to be joined as session keyrings
   970e219ec7e1 Linux 4.8.25
   3f6b8912e69f Allow stack to grow up to address space limit
   19a363d4402a mm: fix new crash in unmapped_area_topdown()
   c8955c83e743 mm: larger stack guard gap, between vmas
   a82d21362f92 net: ipv6: check route protocol when deleting routes
   e359556b299b virtio-console: avoid DMA from stack
   528b66933f17 [media] dvb-usb-firmware: don't do DMA on stack
   5655955e2035 [media] dvb-usb: don't use stack for firmware load
   b86699b34fa2 mm: Tighten x86 /dev/mem with zeroing reads
   d5b2bb5bd980 rtc: tegra: Implement clock handling
   ac2ac7ec1681 x86/xen: Fix APIC id mismatch warning on Intel
   a831c1987779 platform/x86: acer-wmi: setup accelerometer when machine has appropriate notify event
   84170de6d3e2 nbd: fix 64-bit division
   c429ae72cf29 nbd: use loff_t for blocksize and nbd_set_size args
   1b141a09624f drm/nouveau/disp/mcp7x: disable dptmds workaround
   76b43ba43287 mm: memcontrol: use special workqueue for creating per-memcg caches
   72728f399c48 ext4: fix inode checksum calculation problem if i_extra_size is small
   33046ab810d1 [media] dvb-usb-v2: avoid use-after-free
   9ec073c459f4 ath9k: fix NULL pointer dereference
   fcbe53258784 crypto: ahash - Fix EINPROGRESS notification callback
   137b0eb0f463 crypto: algif_aead - Fix bogus request dereference in completion function
   1ff725fc2f3a ftrace: Fix function pid filter on instances
   de250a35cfc4 zram: do not use copy_page with non-page aligned address
   6285713e76c7 char: lack of bool string made CONFIG_DEVPORT always on
   d201330068bb ftrace: Fix removing of second function probe
   1c89c5b0ae04 irqchip/irq-imx-gpcv2: Fix spinlock initialization
   0f7c92a68fee pwm: rockchip: State of PWM clock should synchronize with PWM enabled state
   3618cee7ddb0 can: ifi: use correct register to read rx status
   e9561d080af6 libnvdimm: fix reconfig_mutex, mmap_sem, and jbd2_handle lockdep splat
   f65e33661a10 xen, fbfront: fix connecting to backend
   f582e5052686 target: Avoid mappedlun symlink creation during lun shutdown
   be322b49b2c8 scsi: sd: Fix capacity calculation with 32-bit sector_t
   c5958346d28c scsi: qla2xxx: Add fix to read correct register value for ISP82xx.
   303fe475c738 scsi: sd: Consider max_xfer_blocks if opt_xfer_blocks is unusable
   86efd3fc929b scsi: sr: Sanity check returned mode data
   edadf1178d73 iscsi-target: Drop work-around for legacy GlobalSAN initiator
   1f501b60dde5 iscsi-target: Fix TMR reference leak during session shutdown
   2cb216efc35f efi/fb: Avoid reconfiguration of BAR that covers the framebuffer
   57765d387d5f efi/libstub: Skip GOP with PIXEL_BLT_ONLY format
   d90cac84a86b ACPI / scan: Set the visited flag for all enumerated devices
   5abbbaefcd3e x86/vdso: Plug race between mapping and ELF header setup
   920f423183ee x86/vdso: Ensure vdso32_enabled gets set to valid values only
   f4426d1f0c68 x86, pmem: fix broken __copy_user_nocache cache-bypass assumptions
   0624cecc272a x86/signals: Fix lower/upper bound reporting in compat siginfo
   9dcf17398d35 perf/x86: Avoid exposing wrong/stale data in intel_pmu_lbr_read_32()
   774eb28fa29d Input: xpad - add support for Razer Wildcat gamepad
   da3214318021 CIFS: store results of cifs_reopen_file to avoid infinite wait
   4c8f2f3e96f7 drm/nouveau/mmu/nv4a: use nv04 mmu rather than the nv44 one
   fe2c5a1cab29 drm/nouveau/mpeg: mthd returns true on success now
   4f0d2ae5a754 zsmalloc: expand class bit
   14826db7e76f thp: fix MADV_DONTNEED vs clear soft dirty race
   307ea67867f7 thp: fix MADV_DONTNEED vs. MADV_FREE race
   84fcd4c616b3 tcmu: Skip Data-Out blocks before gathering Data-In buffer for BIDI case
   50a18a2c13e7 tcmu: Fix wrongly calculating of the base_command_size
   04129b9eac53 tcmu: Fix possible overwrite of t_data_sg's last iov[]
   1a96c4236345 cgroup, kthread: close race window where new kthreads can be migrated to non-root cgroups
   5af2034c5fa7 dma-buf: add support for compat ioctl
   47dc33b02d9f net/mlx4_core: Fix when to save some qp context flags for dynamic VST to VGT transitions
   ca1cf7fa5e89 net/mlx4_core: Fix racy CQ (Completion Queue) free
   c5d6272b48da net/mlx4_en: Fix bad WQE issue
   0cbe1ba52ac8 usb: hub: Wait for connection to be reestablished after port reset
   7e3909e459be blk-mq: Avoid memory reclaim when remapping queues
   e53675310932 net/packet: fix overflow in check for priv area size
   9f81b537bdcd crypto: caam - fix invalid dereference in caam_rsa_init_tfm()
   685e2f71d3d7 crypto: caam - fix RNG deinstantiation error checking
   4b8d172d131a MIPS: Select HAVE_IRQ_EXIT_ON_IRQ_STACK
   06f41eff1758 MIPS: Switch to the irq_stack in interrupts
   c48b1c1a49a2 MIPS: Only change $28 to thread_info if coming from user mode
   43862dab7d91 MIPS: Stack unwinding while on IRQ stack
   7f8386a79663 MIPS: Introduce irq_stack
   0f13c368b848 mtd: bcm47xxpart: fix parsing first block after aligned TRX
   009b4b307221 rt2x00: Fix incorrect usage of CONFIG_RT2X00_LIB_USB
   f436af7dd007 rt2x00usb: do not anchor rx and tx urb's
   ee88a8be30c3 rt2x00usb: fix anchor initialization
   ff61181a39f4 i2c: bcm2835: Fix hang for writing messages larger than 16 bytes
   eb4750b18bbf orangefs: fix buffer size mis-match between kernel space and user space.
   72b953eed0ad drm/i915: Stop using RP_DOWN_EI on Baytrail
   1701d71fc709 drm/i915: Avoid tweaking evaluation thresholds on Baytrail v3
   a8a385efec43 drm/i915: Nuke debug messages from the pipe update critical section
   d6e319631aec drm/i915/gen9: Increase PCODE request timeout to 50ms
   440e2c3517e5 usb-storage: Add ignore-residue quirk for Initio INIC-3619
   dd3716075af6 x86/reboot/quirks: Add ASUS EeeBook X205TA/W reboot quirk
   99219a2e9f79 x86/reboot/quirks: Add ASUS EeeBook X205TA reboot quirk
   4c3ef6907d0d platform/x86: asus-wmi: Detect quirk_no_rfkill from the DSDT
   95315644bbf7 platform/x86: asus-wmi: Set specified XUSB2PR value for X550LB
   b590aade4894 watchdog: s3c2410: Fix infinite interrupt in soft mode
   6fdc067c889b PCI: Add ACS quirk for Qualcomm QDF2400 and QDF2432
   2141fdc4e698 PCI: Sort the list of devices with D3 delay quirk by ID
   0ccdd4e7d8fe mmc: sdhci-of-esdhc: remove default broken-cd for ARM
   eb6e770ac347 PCI: Disable MSI for HiSilicon Hip06/Hip07 Root Ports
   1b87711b21ed PCI: Add Broadcom Northstar2 PAXC quirk for device class and MPSS
   59b53425ef16 ARM: smccc: Update HVC comment to describe new quirk parameter
   8d0029108932 drm/msm/adreno: move function declarations to header file
   d327e7b178fe firmware: qcom: scm: Fix interrupted SCM calls
   71ea9cad84ef arm: kernel: Add SMC structure parameter
   ebb1ca9607ad ASoC: sun4i-i2s: Add quirks to handle a31 compatible
   72f6e982940a ACPI: save NVS memory for Lenovo G50-45
   e362b1d5bfe9 ASoC: Intel: cht_bsw_rt5645: add Baytrail MCLK support
   535fcee36f5b ASoC: Intel: cht_bsw_rt5645: harden ACPI device detection
   b1ed3fbd993c ASoC: Intel: Baytrail: add quirk for Lenovo Thinkpad 10
   eee473322818 ASoC: codecs: rt5670: add quirk for Lenovo Thinkpad 10
   beca997c156f ASoC: rt5670: Add missing 10EC5072 ACPI ID
   1c8321c341da ACPI / button: Change default behavior to lid_init_state=open
   2b02ab5f7391 sata: ahci-da850: implement a workaround for the softreset quirk
   11f02d8d7fe6 PCI: Add ACS quirk for Intel Union Point
   9acd4d7d243a ARM: dts: STiH407-family: set snps,dis_u3_susphy_quirk
   61df7a67273c drm/mga: remove device_is_agp callback
   0a834595f470 usb: dwc3: host: pass quirk-broken-port-ped property for known broken revisions
   d0f8f71e4164 usb: dwc3: Add revision numbers for the USB 3.0 IP
   51ea9fa290a8 usb: host: xhci-plat: enable BROKEN_PED quirk if platform requested
   65e185bbe4d0 usb: xhci: add quirk flag for broken PED bits
   12757d3bd930 ARM: davinci: PM: support da8xx DT platforms
   cbb4822bc2c5 Input: gpio_keys - add support for GPIO descriptors
   36a721bb8fac serial: 8250_omap: Add OMAP_DMA_TX_KICK quirk for AM437x
   5fc8dd1fcaf5 usb: chipidea: msm: Rely on core to override AHBBURST
   9a07b4bc1627 scsi: ufs: issue link starup 2 times if device isn't active
   1afa312a5792 scsi: ufs: introduce a new ufshcd_statea UFSHCD_STATE_EH_SCHEDULED
   10c3c4d5694e drm/i915: actually drive the BDW reserved IDs
   b1451c6b586c drm/i915: more .is_mobile cleanups for BDW
   3afb3167148c drm/i915: fix INTEL_BDW_IDS definition
   955982e63676 drm/i915: Remove .is_mobile field from platform struct
   bc30de19926a drm/edid: constify edid quirk list
   4942997e5413 HID: usbhid: Add quirk for Mayflash/Dragonrise DolphinBar.
   07a85162b9b8 HID: usbhid: Add quirk for the Futaba TOSD-5711BB VFD
   62dce069c3e7 nvme: simplify stripe quirk
   38bbd1f16854 platform/x86: acer-wmi: Only supports AMW0_GUID1 on acer family
   2135d9cd273b ALSA: usb-audio: Add native DSD support for TEAC 501/503 DAC
   1fc78f3d70c3 PCI: Expand "VPD access disabled" quirk message
   508e2ef86c69 ALSA: usb-audio: add implicit fb quirk for Axe-Fx II
   0c79032c962a scsi: ufs: add quirk to increase host PA_SaveConfigTime
   a3cc3396dc8f PCI: thunder-pem: Factor out resource lookup
   6f35e25c8609 arm64: PCI: Add local struct device pointers
   d529876b02ee arm64: PCI: Manage controller-specific data on per-controller basis
   30c5d2cf21f2 x86/intel_idle: Add CPU model 0x4a (Atom Z34xx series)
   fade24327d61 svcauth_gss: Close connection when dropping an incoming message
   cc8fc2110982 scsi: ufs: ensure that host pa_tactivate is higher than device
   ae98a7756e77 mmc: sdhci-msm: Enable few quirks
   b1a90b94df54 HID: multitouch: do not retrieve all reports for all devices
   3d6c18b57d87 HID: multitouch: enable the Surface 3 Type Cover to report multitouch data
   76cc100d5055 HID: microsoft: Add Surface 4 type cover pro 4 (JP)
   56974903bdfc HID: sensor-hub: add quirk for Microchip MM7150
   3aa2d02479fb HID: sensor-hub add quirk for Microsoft Surface 3
   dad6aeb660e1 scsi: ufs: introduce UFSHCD_QUIRK_PRDT_BYTE_GRAN quirk
   e1ce839b3c12 scsi: ufs: Enable no vccq quirk for skhynix device
   61ebc76124e1 clocksource/drivers/arm_arch_timer: Don't assume clock runs in suspend
   7d0017bedd43 net/mlx4_core: Use device ID defines
   5f376717da59 HID: i2c-hid: add a simple quirk to fix device defects
   b50df0349088 HID: usbhid: Add quirks for Mayflash/Dragonrise GameCube and PS3 adapters
   377bf00a97dd clk: lpc32xx: add a quirk for PWM and MS clock dividers
   28b80486dd11 random: use chacha20 for get_random_int/long
   5c14ae6c7827 mm/mempolicy.c: fix error handling in set_mempolicy and mbind.
   c47efb0b87cf Documentation: stable-kernel-rules: fix stable-tag format
   fa71007c6e60 MIPS: c-r4k: Fix Loongson-3's vcache/scache waysize calculation
   d28f0f2ce69a MIPS: Flush wrong invalid FTLB entry for huge page
   2d39761a305e MIPS: Add MIPS_CPU_FTLB for Loongson-3A R2
   f4546c48295c MIPS: Check TLB before handle_ri_rdhwr() for Loongson-3
   0f0cb6322f50 MIPS: Lantiq: fix missing xbar kernel panic
   01b1e6e66f38 MIPS: End spinlocks with .insn
   aa476702873f MIPS: ralink: Fix typos in rt3883 pinctrl
   003987fb012a MIPS: Force o32 fp64 support on 32bit MIPS64r6 kernels
   3788f4d19762 s390/uaccess: get_user() should zero on failure (again)
   a18a3a40ad5d s390/decompressor: fix initrd corruption caused by bss clear
   cf251fc84ece nios2: reserve boot memory for device tree
   c9c6823c8113 dm raid: fix NULL pointer dereference for raid1 without bitmap
   c51b530047c4 powerpc/crypto/crc32c-vpmsum: Fix missing preempt_disable()
   38494d50d37a powerpc: Don't try to fix up misaligned load-with-reservation instructions
   e00fe427b686 powerpc/64: Fix flush_(d|i)cache_range() called from modules
   7fd934338c40 powerpc/kernel: Use kprobe blacklist for asm functions
   c2517a0fb5c0 powerpc/mm: Add missing global TLB invalidate if cxl is active
   d29bfd4a2a5c powerpc: Disable HFSCR[TM] if TM is not supported
   9413b2816e7d metag/usercopy: Add missing fixups
   60e688fa135c metag/usercopy: Fix src fixup in from user rapf loops
   3bd77f9b75ff metag/usercopy: Set flags before ADDZ
   78ba0a0bc796 metag/usercopy: Zero rest of buffer from copy_from_user
   23fe537faf0a metag/usercopy: Add early abort to copy_to_user
   f93708a2faf5 metag/usercopy: Fix alignment error checking
   8a27f50ba14b metag/usercopy: Drop unused macros
   d3226caf07b4 brcmfmac: use local iftype avoiding use-after-free of virtual interface
   b4b6d1cb7013 ring-buffer: Fix return value check in test_ringbuffer()
   d06668b5c696 xfs: Honor FALLOC_FL_KEEP_SIZE when punching ends of files
   f135506f5ce4 dm verity fec: fix bufio leaks
   d10b19745ca0 dm verity fec: limit error correction recursion
   9536055f1ec5 ptrace: fix PTRACE_LISTEN race corrupting task->state
   bf895e98cfcb mm/page_alloc.c: fix print order in show_free_areas()
   93fb8a316b99 Reset TreeId to zero on SMB2 TREE_CONNECT
   00a743bf7f88 cfg80211: check rdev resume callback only for registered wiphy
   75479ff29b44 arm64: mm: unaligned access by user-land should be received as SIGBUS
   4e28a700651d iio: bmg160: reset chip when probing
   89d631362aab kvm: arm/arm64: Fix locking for kvm_free_stage2_pgd
   d52401c31a5f arm/arm64: KVM: Take mmap_sem in kvm_arch_prepare_memory_region
   73ba7e664274 arm/arm64: KVM: Take mmap_sem in stage2_unmap_vm
   6f5c6ce2d9e9 staging: android: ashmem: lseek failed due to no FMODE_LSEEK.
   a9edcc5125e7 sysfs: be careful of error returns from ops->show()
   f9b7f08dea27 drm/vmwgfx: fix integer overflow in vmw_surface_define_ioctl()
   b2e8f39a707a drm/vmwgfx: Remove getparam error message
   a339fb1acddf drm/ttm, drm/vmwgfx: Relax permission checking when opening surfaces
   7394c14ce409 drm/vmwgfx: avoid calling vzalloc with a 0 size in vmw_get_cap_3d_ioctl()
   2ba060df6cd2 drm/vmwgfx: NULL pointer dereference in vmw_surface_define_ioctl()
   f752c3934126 drm/vmwgfx: Type-check lookups of fence objects

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.8.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
index e7c57b89f293..63600db45a1b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "65ace0d407702823312d50633d8079794d85c30d"
-SRCREV_meta ?= "76db2c6ca67b9b3597257684a027344d11b1bc81"
+SRCREV_machine ?= "83d09b09398c3103d0d157420909d290090d415a"
+SRCREV_meta ?= "1c60e003c70292e04f18d5123c7f3f26ffae5c3f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8.25"
+LINUX_VERSION ?= "4.8.26"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
index 8a855598a2cb..5e8eb315b5ff 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.8.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.8.25"
+LINUX_VERSION ?= "4.8.26"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "39c746a1aef2c1a5072ca1ea6742b697478fa465"
-SRCREV_meta ?= "76db2c6ca67b9b3597257684a027344d11b1bc81"
+SRCREV_machine ?= "d584d545c3ba5bd5560bdf781016e3804657778c"
+SRCREV_meta ?= "1c60e003c70292e04f18d5123c7f3f26ffae5c3f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.8.bb b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
index c792fe78a7d0..3c097f94a22a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.8.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "6d64d98ab2bfa4dabfb6028f99cdc02ae248d746"
-SRCREV_machine_qemuarm64 ?= "744d778aeb472124f51371c55073788863d6ba2b"
-SRCREV_machine_qemumips ?= "d0f1efc4940a0a35d4b54cbc5933f39f0213dabb"
-SRCREV_machine_qemuppc ?= "2acced5ac2d1769e45f417f8905c10a385679b0e"
-SRCREV_machine_qemux86 ?= "72d0c1a637e260c25a4299c230910dd1210cd0cf"
-SRCREV_machine_qemux86-64 ?= "72d0c1a637e260c25a4299c230910dd1210cd0cf"
-SRCREV_machine_qemumips64 ?= "4202750d69c880a21b3e38e58b270486ad7d2786"
-SRCREV_machine ?= "72d0c1a637e260c25a4299c230910dd1210cd0cf"
-SRCREV_meta ?= "76db2c6ca67b9b3597257684a027344d11b1bc81"
+SRCREV_machine_qemuarm ?= "d0a2f088f24c67fc2677df9c285dfedf9311be0c"
+SRCREV_machine_qemuarm64 ?= "2ba5f01e49d92febf8413992f44d17d53d78ec15"
+SRCREV_machine_qemumips ?= "4f0218a05972db39ca645670954346f5b0f9ff10"
+SRCREV_machine_qemuppc ?= "b32a9d28b427588e3f15292cfda7d2207acf80ce"
+SRCREV_machine_qemux86 ?= "27efc3ba684a65413ed295140ea070508aac9def"
+SRCREV_machine_qemux86-64 ?= "27efc3ba684a65413ed295140ea070508aac9def"
+SRCREV_machine_qemumips64 ?= "50985b5d1574aad8fac520487aa7901b593db730"
+SRCREV_machine ?= "27efc3ba684a65413ed295140ea070508aac9def"
+SRCREV_meta ?= "1c60e003c70292e04f18d5123c7f3f26ffae5c3f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.8.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.8.25"
+LINUX_VERSION ?= "4.8.26"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


