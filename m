Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D2BB72F28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 12:51:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4FCphHD002008
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 15 May 2017 05:51:43 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 15 May 2017 05:51:42 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 15 May 2017 08:51:38 -0400
Message-ID: <50c2d14e2b176bd8ad076989036f31335fcc170e.1494851172.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1494851172.git.bruce.ashfield@windriver.com>
References: <cover.1494851172.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/4.10: update to v4.10.15
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
X-List-Received-Date: Mon, 15 May 2017 12:51:44 -0000
Content-Type: text/plain

Merging the korg stable releases 4.10.10 -> 4.10.15 with the following
shortlog summary:

    b1cff0b2ed20 Linux 4.10.15
    de7b7a35c99e dm ioctl: prevent stack leak in dm ioctl call
    8dee04de5def hwmon: (it87) Avoid registering the same chip on both SIO addresses
    ad66b968a0e5 scsi: storvsc: Workaround for virtual DVD SCSI version
    fc08ba650a2b Handle mismatched open calls
    43c1696e5e91 timerfd: Protect the might cancel mechanism proper
    d08276658dee Linux 4.10.14
    3adeab312a65 ftrace/x86: Fix triple fault with graph tracing and suspend-to-ram
    13d970940217 cpu/hotplug: Serialize callback invocations proper
    bd7c4f5e1d25 net: can: usb: gs_usb: Fix buffer on stack
    43a35e671f8f macsec: avoid heap overflow in skb_to_sgvec
    e4720b009def ceph: fix recursion between ceph_set_acl() and __ceph_setattr()
    43e360377b09 nfsd: stricter decoding of write-like NFSv2/v3 ops
    144180dc4736 nfsd4: minor NFSv2/v3 write decoding cleanup
    86eb1d0aab0d nfsd: check for oversized NFSv2/v3 arguments
    b98d12a15ed1 Input: i8042 - add Clevo P650RS to the i8042 reset list
    2f680d46a0b5 ASoC: intel: Fix PM and non-atomic crash in bytcr drivers
    bec0749254e7 p9_client_readdir() fix
    67355b67b41c MIPS: Avoid BUG warning in arch_check_elf
    7cb5877dc20e MIPS: cevt-r4k: Fix out-of-bounds array access
    09c953f73ff0 MIPS: KGDB: Use kernel context for sleeping threads
    4a71345ea6f8 ARC: [plat-eznps] Fix build error
    47dbabb85ef7 scsi: return correct blkprep status code in case scsi_init_io() fails.
    dcb730f79d33 ALSA: seq: Don't break snd_use_lock_sync() loop by timeout
    7b2b791c65d2 ALSA: firewire-lib: fix inappropriate assignment between signed/unsigned type
    a33e886d3f19 ALSA: oxfw: fix regression to handle Stanton SCS.1m/1d
    f62c45868079 ipv6: check raw payload size correctly in ioctl
    466dfcd1d81a tcp: memset ca_priv data to 0 properly
    04630e2ed834 ipv6: check skb->protocol before lookup for nexthop
    683f8d60761c net: phy: fix auto-negotiation stall due to unavailable interrupt
    f9a8970e9eee net: ipv6: regenerate host route if moved to gc list
    e2ae71739253 macvlan: Fix device ref leak when purging bc_queue
    b073c2c3d40c tcp: mark skbs with SCM_TIMESTAMPING_OPT_STATS
    cdaf15b43bd3 tcp: fix SCM_TIMESTAMPING_OPT_STATS for normal skbs
    df4c4820a0b0 net/mlx5e: Fix ETHTOOL_GRXCLSRLALL handling
    cce19108367e net/mlx5e: Fix small packet threshold
    3faae16bf93e net/mlx5: E-Switch, Correctly deal with inline mode on ConnectX-5
    82aa6b2c1f19 net/mlx5: Fix driver load bad flow when having fw initializing timeout
    ff247bdf248a ip6mr: fix notification device destruction
    9db670f71b6a netpoll: Check for skb->queue_mapping
    5e54291edfb9 net: ipv6: RTF_PCPU should not be settable from userspace
    ee1f368e99ba gso: Validate assumption of frag_list segementation
    03940f08b972 ipv6: fix source routing
    c52ac0687247 ipv6: sr: fix double free of skb after handling invalid SRH
    3b600a30d126 dp83640: don't recieve time stamps twice
    a024074740e7 ipv6: sr: fix out-of-bounds access in SRH validation
    7e793ce3b3e1 sh_eth: unmap DMA buffers when freeing rings
    c526d0869a3a net: vrf: Fix setting NLM_F_EXCL flag when adding l3mdev rule
    9ca5d7e426dd net-timestamp: avoid use-after-free in ip_recv_error
    0d8ef98cefae ipv6: Fix idev->addr_list corruption
    29dc163a721e tcp: clear saved_syn in tcp_disconnect()
    1ebfe5cf3727 sctp: listen on the sock only when it's state is listening or closed
    280a7e34a987 net: ipv4: fix multipath RTM_GETROUTE behavior when iif is given
    c747d66b6c6f l2tp: fix PPP pseudo-wire auto-loading
    2ba7cfd4f6a9 l2tp: take reference on sessions being dumped
    0fbdeb789013 openvswitch: Fix ovs_flow_key_update()
    f9bd6b937de6 net/packet: fix overflow in check for tp_reserve
    57a88382a969 net/packet: fix overflow in check for tp_frame_nr
    5894337297ad l2tp: purge socket queues in the .destruct() callback
    7d5eb39c0d8c l2tp: hold tunnel socket when handling control frames in l2tp_ip and l2tp_ip6
    63ae30d5caa7 net/mlx5: Avoid dereferencing uninitialized pointer
    4f45e887a632 bpf: improve verifier packet range checks
    443fac9f2618 secure_seq: downgrade to per-host timestamp offsets
    a35c14672325 kcm: return immediately after copy_from_user() failure
    c79db30fd1b0 net: phy: handle state correctly in phy_stop_machine
    693d7da388c2 net: neigh: guard against NULL solicit() method
    2ec8024c5672 sparc64: Fix kernel panic due to erroneous #ifdef surrounding pmd_write()
    1797e172bf10 sparc64: kern_addr_valid regression
    7cf480444103 ping: implement proper locking
    b957be36d793 Linux 4.10.13
    9254ada03382 device-dax: switch to srcu, fix rcu_read_lock() vs pte allocation
    7d1c1be6c8d3 x86/mce/AMD: Give a name to MCA bank 3 when accessed with legacy MSRs
    1136723a6cf0 powerpc/kprobe: Fix oops when kprobed on 'stdu' instruction
    a6db433483db ubi/upd: Always flush after prepared for an update
    a32ff3f07f9b x86/mce: Make the MCE notifier a blocking one
    c77e7d37ac50 mac80211: fix MU-MIMO follow-MAC mode
    ee9b489925a0 mac80211: reject ToDS broadcast data frames
    71a3e3679e30 ubifs: Fix O_TMPFILE corner case in ubifs_link()
    c1cadf6af8b7 ubifs: Fix RENAME_WHITEOUT support
    2745665258c3 mmc: sdhci-esdhc-imx: increase the pad I/O drive strength for DDR50 card
    b478c19f3de4 mmc: dw_mmc: Don't allow Runtime PM for SDIO cards
    9b02ecd10cff ACPI / power: Avoid maybe-uninitialized warning
    7010e15d1d22 Input: elantech - add Fujitsu Lifebook E547 to force crc_enabled
    0cb760dfc75b s390/mm: fix CMMA vs KSM vs others
    71766b913996 mmc: dw_mmc: silent verbose log when calling from PM context
    9f8296778b61 CIFS: remove bad_network_name flag
    5cd77ebf2254 cifs: Do not send echoes before Negotiate is complete
    63ad4051e89c mm: prevent NR_ISOLATE_* stats from going negative
    64d253367ae0 ring-buffer: Have ring_buffer_iter_empty() return true when empty
    eff248618a59 HID: wacom: Treat HID_DG_TOOLSERIALNUMBER as unsigned
    838a281c4a17 tracing: Allocate the snapshot buffer before enabling probe
    523ae2e9e39a KEYS: fix keyctl_set_reqkey_keyring() to not leak thread keyrings
    cc4f98410688 KEYS: Change the name of the dead type to ".dead" to prevent user access
    4cbbfd6aafe1 KEYS: Disallow keyrings beginning with '.' to be joined as session keyrings
    055c0a94117c Linux 4.10.12
    e5349c13c7a8 virtio-console: avoid DMA from stack
    e0116f4d9a9a cxusb: Use a dma capable buffer also for reading
    b1bfb5083bfa mm: Tighten x86 /dev/mem with zeroing reads
    2c4d8f20cc29 rtc: tegra: Implement clock handling
    a16534a33305 ACPI / EC: Use busy polling mode when GPE is not enabled
    8a73a223fb70 x86/xen: Fix APIC id mismatch warning on Intel
    e765ef79fdf3 platform/x86: acer-wmi: setup accelerometer when machine has appropriate notify event
    35549ee08285 ASoC: Intel: select DW_DMAC_CORE since it's mandatory
    765c74b9cc27 dvb-usb-v2: avoid use-after-free
    ce5fe5a547d8 parisc: Fix get_user() for 64-bit value on 32-bit kernel
    aa7ca04fb26c crypto: lrw - Fix use-after-free on EINPROGRESS
    cb0567fc5114 crypto: ahash - Fix EINPROGRESS notification callback
    102da3a73f9a crypto: xts - Fix use-after-free on EINPROGRESS
    25308983eda6 crypto: algif_aead - Fix bogus request dereference in completion function
    a0a1e90f5057 ftrace: Fix function pid filter on instances
    58bc856c41fb zram: do not use copy_page with non-page aligned address
    9bf69094c2ad Revert "MIPS: Lantiq: Fix cascaded IRQ setup"
    1cb293ab0236 char: lack of bool string made CONFIG_DEVPORT always on
    ebe4deab5c80 drm/i915/gvt: set the correct default value of CTX STATUS PTR
    4bf7df7b3bd7 ftrace: Fix removing of second function probe
    9b35ab51a0b4 irqchip/irq-imx-gpcv2: Fix spinlock initialization
    b648679070a9 cpufreq: Bring CPUs up even if cpufreq_online() failed
    26052e29d6a2 pwm: rockchip: State of PWM clock should synchronize with PWM enabled state
    96b121b50683 can: ifi: use correct register to read rx status
    5b750d3c56e3 libnvdimm: band aid btt vs clear poison locking
    f0f306710e24 libnvdimm: fix reconfig_mutex, mmap_sem, and jbd2_handle lockdep splat
    e0d47228949e libnvdimm: fix blk free space accounting
    66481ca0750d make skb_copy_datagram_msg() et.al. preserve ->msg_iter on error
    a99a9ff2374a new privimitive: iov_iter_revert()
    939707c50352 xen, fbfront: fix connecting to backend
    22113847cd11 target: Avoid mappedlun symlink creation during lun shutdown
    53204334cca0 scsi: sd: Fix capacity calculation with 32-bit sector_t
    24c01b369765 scsi: qla2xxx: Add fix to read correct register value for ISP82xx.
    8b30ed56fa89 scsi: sd: Consider max_xfer_blocks if opt_xfer_blocks is unusable
    01fb9440938a scsi: sr: Sanity check returned mode data
    c8270f29214c iscsi-target: Drop work-around for legacy GlobalSAN initiator
    510152205d41 iscsi-target: Fix TMR reference leak during session shutdown
    c100de410c1e efi/fb: Avoid reconfiguration of BAR that covers the framebuffer
    6b8a0080915d efi/libstub: Skip GOP with PIXEL_BLT_ONLY format
    ca3e0b6d6b25 parisc: fix bugs in pa_memcpy
    87ad80ecdb5c ACPI / scan: Set the visited flag for all enumerated devices
    122c16ccc71b acpi, nfit, libnvdimm: fix interleave set cookie calculation (64-bit comparison)
    083d30d61a1a x86/vdso: Plug race between mapping and ELF header setup
    90dc1120444f x86/vdso: Ensure vdso32_enabled gets set to valid values only
    b8cb11e01a7f x86, pmem: fix broken __copy_user_nocache cache-bypass assumptions
    1a99658f083d x86/intel_rdt: Fix locking in rdtgroup_schemata_write()
    565194a42052 x86/signals: Fix lower/upper bound reporting in compat siginfo
    c6be568a2f24 x86/efi: Don't try to reserve runtime regions
    4ff9e6c2d86b perf/x86: Avoid exposing wrong/stale data in intel_pmu_lbr_read_32()
    535adf24d1a7 perf annotate s390: Fix perf annotate error -95 (4.10 regression)
    7869b4078ba9 Input: xpad - add support for Razer Wildcat gamepad
    3f17ee38a808 CIFS: store results of cifs_reopen_file to avoid infinite wait
    6e9b6937a923 CIFS: reconnect thread reschedule itself
    d38b12ab7b05 drm/fb-helper: Allow var->x/yres(_virtual) < fb->width/height again
    e97e515b7448 drm/etnaviv: fix missing unlock on error in etnaviv_gpu_submit()
    3287a46c7829 drm/nouveau: initial support (display-only) for GP107
    2efa4bd3b644 drm/nouveau/kms/nv50: fix double dma_fence_put() when destroying plane state
    b6b2448efe64 drm/nouveau/kms/nv50: fix setting of HeadSetRasterVertBlankDmi method
    8418bb809e55 drm/nouveau/mmu/nv4a: use nv04 mmu rather than the nv44 one
    cc3c096855c6 drm/nouveau/mpeg: mthd returns true on success now
    5de87d225e08 orangefs: free superblock when mount fails
    5f8cde206712 zsmalloc: expand class bit
    5c7de4610825 thp: fix MADV_DONTNEED vs clear soft dirty race
    d7847a2203a1 thp: fix MADV_DONTNEED vs. MADV_FREE race
    e2083153996d tcmu: Skip Data-Out blocks before gathering Data-In buffer for BIDI case
    acbb93eb7447 tcmu: Fix wrongly calculating of the base_command_size
    1486f834e887 tcmu: Fix possible overwrite of t_data_sg's last iov[]
    e8339b9ddfe6 audit: make sure we don't let the retry queue grow without bounds
    668e2d892499 cgroup, kthread: close race window where new kthreads can be migrated to non-root cgroups
    4c031101dc08 Linux 4.10.11
    2ef9c8dd6ecd dma-buf: add support for compat ioctl
    10e13823b0a9 net/packet: fix overflow in check for priv area size
    50d60091d294 crypto: caam - fix invalid dereference in caam_rsa_init_tfm()
    41889ca0002a crypto: caam - fix RNG deinstantiation error checking
    8e94a6f43dff MIPS: IRQ Stack: Fix erroneous jal to plat_irq_dispatch
    4a1fe14b16c9 MIPS: Select HAVE_IRQ_EXIT_ON_IRQ_STACK
    2c7235dbdd51 MIPS: Switch to the irq_stack in interrupts
    b21e28eafd17 MIPS: Only change $28 to thread_info if coming from user mode
    ece65a60793c MIPS: Stack unwinding while on IRQ stack
    6b720ff376fd MIPS: Introduce irq_stack
    612973c55404 rt2x00usb: do not anchor rx and tx urb's
    244ff096a321 rt2x00usb: fix anchor initialization
    df741f77edfa nfs: flexfiles: fix kernel OOPS if MDS returns unsupported DS type
    f536c2058420 orangefs: fix buffer size mis-match between kernel space and user space.
    f20e76a469c1 orangefs: Dan Carpenter influenced cleanups...
    b01252079ec7 drm/i915: Do .init_clock_gating() earlier to avoid it clobbering watermarks
    d5b5a4d3f77f drm/i915: Avoid rcu_barrier() from reclaim paths (shrinker)
    de3571619eeb drm/i915: Stop using RP_DOWN_EI on Baytrail
    29abfd4ee598 drm/i915: Drop support for I915_EXEC_CONSTANTS_* execbuf parameters.
    b364cf79fc37 drm/i915: Only enable hotplug interrupts if the display interrupts are enabled
    56613bca0578 drm/i915: Reject HDMI 12bpc if the sink doesn't indicate support
    dba29c1139fc drm/i915: Avoid tweaking evaluation thresholds on Baytrail v3
    fccb5940cc17 drm/i915: Nuke debug messages from the pipe update critical section
    29a9a6a329d1 drm/i915: Store a permanent error in obj->mm.pages
    432ae45238b8 drm/i915/gen9: Increase PCODE request timeout to 50ms
    b93cb4cc2eab drm/i915: Squelch any ktime/jiffie rounding errors for wait-ioctl
    ec417098e18f drm/i915/fbdev: Stop repeating tile configuration on stagnation
    4f985d41bc5f drm/i915: Move updating color management to before vblank evasion
    a8a20aecc9c1 drm/i915: Fix forcewake active domain tracking
    e6925852d5b8 Linux 4.10.10
    e6c5fe2374cd x86/reboot/quirks: Fix typo in ASUS EeeBook X205TA reboot quirk
    a148ee8f7156 usb-storage: Add ignore-residue quirk for Initio INIC-3619
    118b1ef49a33 x86/reboot/quirks: Add ASUS EeeBook X205TA/W reboot quirk
    2b0766deb008 x86/reboot/quirks: Add ASUS EeeBook X205TA reboot quirk
    3db435d09bc3 platform/x86: asus-wmi: Detect quirk_no_rfkill from the DSDT
    d0331c21a1a6 watchdog: s3c2410: Fix infinite interrupt in soft mode
    07371cd9ef21 PCI: Add ACS quirk for Qualcomm QDF2400 and QDF2432
    e90d491bcf00 PCI: Sort the list of devices with D3 delay quirk by ID
    9fd0dee94856 mmc: sdhci-of-esdhc: remove default broken-cd for ARM
    8f24ffc2f9a0 PCI: Disable MSI for HiSilicon Hip06/Hip07 Root Ports
    f2d9c08fc9b2 PCI: Add Broadcom Northstar2 PAXC quirk for device class and MPSS
    0755d2b5fe92 ARM: smccc: Update HVC comment to describe new quirk parameter
    7dd05d366148 firmware: qcom: scm: Fix interrupted SCM calls
    cc9b9deb6197 arm: kernel: Add SMC structure parameter
    2dca786b85e2 HID: wacom: don't apply generic settings to old devices
    6ac0617424d4 ASoC: sun4i-i2s: Add quirks to handle a31 compatible
    ab0b1f481fa9 ACPI: save NVS memory for Lenovo G50-45
    36426b3a31dc ASoC: Intel: cht_bsw_rt5645: add Baytrail MCLK support
    bdbe9135ead6 ASoC: Intel: cht_bsw_rt5645: harden ACPI device detection
    88f1372e28b2 ASoC: Intel: Baytrail: add quirk for Lenovo Thinkpad 10
    770049fddd84 ASoC: codecs: rt5670: add quirk for Lenovo Thinkpad 10
    8d5dd97f5556 ACPI / button: Change default behavior to lid_init_state=open
    53a898c2dc3b sata: ahci-da850: implement a workaround for the softreset quirk
    fcfd2ac4abfb PCI: xgene: Fix double free on init error
    c259b9b74ebc PCI: Add ACS quirk for Intel Union Point
    8a4b2d4ba49c drm/mga: remove device_is_agp callback
    f08ae685954e usb: dwc3: host: pass quirk-broken-port-ped property for known broken revisions
    41d6d9750ba3 usb: host: xhci-plat: enable BROKEN_PED quirk if platform requested
    9763fee4c38d usb: xhci: add quirk flag for broken PED bits
    afdb6b99f54e serial: 8250_omap: Add OMAP_DMA_TX_KICK quirk for AM437x
    99b4f57bffe5 usb: chipidea: msm: Rely on core to override AHBBURST
    f576c28172a3 ASoC: Intel: bytcr_rt5640: quirks for Insyde devices
    24fdd3f90f4c drm/i915: actually drive the BDW reserved IDs
    0325b5e1b637 drm/i915: more .is_mobile cleanups for BDW
    bb4c89250bcc drm/i915: fix INTEL_BDW_IDS definition
    d7f19357fe65 drm/edid: constify edid quirk list
    b04940e26f10 kvm: fix page struct leak in handle_vmon
    af7291601501 random: use chacha20 for get_random_int/long
    d57c764a703b mm/mempolicy.c: fix error handling in set_mempolicy and mbind.
    596c2d180a96 Documentation: stable-kernel-rules: fix stable-tag format
    813e1ac7259b usb: dwc3: gadget: delay unmap of bounced requests
    5e87a005ff57 drm/i915/kvmgt: fix suspicious rcu dereference usage
    cccf8321af1c drm/i915/gvt: Fix gvt scheduler interval time
    fba7cfc66b25 MIPS: c-r4k: Fix Loongson-3's vcache/scache waysize calculation
    42ce8ecfd141 MIPS: Flush wrong invalid FTLB entry for huge page
    a854a7975ce0 MIPS: Add MIPS_CPU_FTLB for Loongson-3A R2
    5dc665924208 MIPS: Check TLB before handle_ri_rdhwr() for Loongson-3
    464d88e8a0ad MIPS: Lantiq: fix missing xbar kernel panic
    187b957634f0 MIPS: End spinlocks with .insn
    0c4b9fe70343 MIPS: ralink: Fix typos in rt3883 pinctrl
    e09e410969ef MIPS: Force o32 fp64 support on 32bit MIPS64r6 kernels
    94f3dd6b140a s390/uaccess: get_user() should zero on failure (again)
    5d4d57697aa1 s390/decompressor: fix initrd corruption caused by bss clear
    a66f5106e710 xtensa: make __pa work with uncached KSEG addresses
    36463a76abeb nios2: reserve boot memory for device tree
    be9fe9d48988 x86/mce: Don't print MCEs when mcelog is active
    fe96b265778a dm raid: fix NULL pointer dereference for raid1 without bitmap
    5c67d5410bbb powerpc/crypto/crc32c-vpmsum: Fix missing preempt_disable()
    d625e1a1530d powerpc: Don't try to fix up misaligned load-with-reservation instructions
    b129e418406b powerpc/64: Fix flush_(d|i)cache_range() called from modules
    12502ae4c9a1 powerpc/mm: Add missing global TLB invalidate if cxl is active
    2a3134e106d4 powerpc: Disable HFSCR[TM] if TM is not supported
    be5569719b5c drm/msm: adreno: fix build error without debugfs
    169b36bef88f metag/usercopy: Add missing fixups
    191e4c735549 metag/usercopy: Fix src fixup in from user rapf loops
    e6ca39ac0c0d metag/usercopy: Set flags before ADDZ
    b03dd10e4c58 metag/usercopy: Zero rest of buffer from copy_from_user
    60a0b56ea119 metag/usercopy: Add early abort to copy_to_user
    e61ffb12b6ac metag/usercopy: Fix alignment error checking
    804453ff0993 metag/usercopy: Drop unused macros
    6d855e027553 brcmfmac: use local iftype avoiding use-after-free of virtual interface
    96499191fe6d mac80211: unconditionally start new netdev queues with iTXQ support
    ab23a82a0176 ring-buffer: Fix return value check in test_ringbuffer()
    24d108e4dfec xfs: Honor FALLOC_FL_KEEP_SIZE when punching ends of files
    1d656a4d8e87 orangefs: move features validation to fix filesystem hang
    b92a638e002b jump label: fix passing kbuild_cflags when checking for asm goto support
    7b73b72fbf82 Kbuild: use cc-disable-warning consistently for maybe-uninitialized
    52b38ad09a6c ACPI / scan: Prefer devices without _HID for _ADR matching
    e56bb92202f7 ACPI / gpio: do not fall back to parsing _CRS when we get a deferral
    1c9925e63abb dm verity fec: fix bufio leaks
    88c358b1f453 dm verity fec: limit error correction recursion
    523a19324267 dax: fix radix tree insertion race
    8bdc69ccb9f8 ptrace: fix PTRACE_LISTEN race corrupting task->state
    0666cf6c9c18 mm/page_alloc.c: fix print order in show_free_areas()
    674850494e19 Reset TreeId to zero on SMB2 TREE_CONNECT
    c793e3374981 cfg80211: check rdev resume callback only for registered wiphy
    b48b63d5f583 arm64: mm: unaligned access by user-land should be received as SIGBUS
    3d44ecc1206e iio: bmg160: reset chip when probing
    2501a0af1734 iio: st_pressure: initialize lps22hb bootime
    a16d8c4e8f77 iio: core: Fix IIO_VAL_FRACTIONAL_LOG2 for negative values
    0d50669ca41f kvm: arm/arm64: Fix locking for kvm_free_stage2_pgd
    e8c3d6542edb arm/arm64: KVM: Take mmap_sem in kvm_arch_prepare_memory_region
    fc29073a15e8 arm/arm64: KVM: Take mmap_sem in stage2_unmap_vm
    fb3ce7a85213 staging: android: ashmem: lseek failed due to no FMODE_LSEEK.
    38b4b8a0969d sysfs: be careful of error returns from ops->show()
    a709613559d6 PCI: thunder-pem: Fix legacy firmware PEM-specific resources
    f8709a9ec8ae PCI: thunder-pem: Add legacy firmware support for Cavium ThunderX host controller
    44eed6f02491 drm/vmwgfx: fix integer overflow in vmw_surface_define_ioctl()
    a2d474ab560c drm/vmwgfx: Remove getparam error message
    009eb75f7fb0 drm/ttm, drm/vmwgfx: Relax permission checking when opening surfaces
    7a392c9a4563 drm/vmwgfx: avoid calling vzalloc with a 0 size in vmw_get_cap_3d_ioctl()
    0570c0cd987f drm/vmwgfx: NULL pointer dereference in vmw_surface_define_ioctl()
    3622a033c419 drm/vmwgfx: Type-check lookups of fence objects

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index ed811fb21e1e..56362efb528c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "fe0fb8da3d633d802776081e7ff2df73ff2983f2"
-SRCREV_meta ?= "ad2e885015c5bf8adeef5cb789b535fc3c0dd396"
+SRCREV_machine ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
+SRCREV_meta ?= "4d929fac3411d03f021c04b8e45d4067e433ca26"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.10.9"
+LINUX_VERSION ?= "4.10.15"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
index 61e680a11123..52084d874598 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.10.9"
+LINUX_VERSION ?= "4.10.15"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "fe0fb8da3d633d802776081e7ff2df73ff2983f2"
-SRCREV_meta ?= "ad2e885015c5bf8adeef5cb789b535fc3c0dd396"
+SRCREV_machine ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
+SRCREV_meta ?= "4d929fac3411d03f021c04b8e45d4067e433ca26"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
index 2ef6a317cb92..e8cfb5384219 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "718b0a546417a51a186179d5277713f301e1d7c9"
-SRCREV_machine_qemuarm64 ?= "fe0fb8da3d633d802776081e7ff2df73ff2983f2"
-SRCREV_machine_qemumips ?= "a803c18e328080eb9acc71510df3b7567bd87578"
-SRCREV_machine_qemuppc ?= "fe0fb8da3d633d802776081e7ff2df73ff2983f2"
-SRCREV_machine_qemux86 ?= "fe0fb8da3d633d802776081e7ff2df73ff2983f2"
-SRCREV_machine_qemux86-64 ?= "fe0fb8da3d633d802776081e7ff2df73ff2983f2"
-SRCREV_machine_qemumips64 ?= "97b912becdd8322f4e7f45dfe79e37fc5ea35f88"
-SRCREV_machine ?= "fe0fb8da3d633d802776081e7ff2df73ff2983f2"
-SRCREV_meta ?= "ad2e885015c5bf8adeef5cb789b535fc3c0dd396"
+SRCREV_machine_qemuarm ?= "ebb58e37143db15fe1b6712487f66b0d2ccb54e1"
+SRCREV_machine_qemuarm64 ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
+SRCREV_machine_qemumips ?= "c79214a4c66138478d88f9955fae35a56390f8c9"
+SRCREV_machine_qemuppc ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
+SRCREV_machine_qemux86 ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
+SRCREV_machine_qemux86-64 ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
+SRCREV_machine_qemumips64 ?= "229abf6f63652058db1308a0c07e59652d3e6a23"
+SRCREV_machine ?= "d2c1ed3c0cbc0d8dcf429346f7ab2e96d470b504"
+SRCREV_meta ?= "4d929fac3411d03f021c04b8e45d4067e433ca26"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.10.9"
+LINUX_VERSION ?= "4.10.15"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


