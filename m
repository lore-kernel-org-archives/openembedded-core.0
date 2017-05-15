Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D0EF971D86
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 12:51:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4FCpjNO023522
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 15 May 2017 05:51:45 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 15 May 2017 05:51:45 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 15 May 2017 08:51:40 -0400
Message-ID: <ea3a755f952e36e81d6a5ebcfe7b1a8d3853423c.1494851172.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1494851172.git.bruce.ashfield@windriver.com>
References: <cover.1494851172.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/4.9: update to v4.9.27
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
X-List-Received-Date: Mon, 15 May 2017 12:51:45 -0000
Content-Type: text/plain

Integrating the korg v4.9.22 -> .27 releases with the following shortlog
summary:

   89f3b8d5f264 Linux 4.9.27
   a0d50c80a29e dm ioctl: prevent stack leak in dm ioctl call
   7ad6de43deda cpu/hotplug: Serialize callback invocations proper
   e99b0ea39354 ceph: try getting buffer capability for readahead/fadvise
   1bf9bc481338 8250_pci: Fix potential use-after-free in error path
   3fbd2ba1da3f hwmon: (it87) Avoid registering the same chip on both SIO addresses
   d24261e567e1 scsi: storvsc: Workaround for virtual DVD SCSI version
   1b7f385e049c tpm_tis: use default timeout value if chip reports it as zero
   d8fd99d4721d Handle mismatched open calls
   00cca9768ebe timerfd: Protect the might cancel mechanism proper
   d071951e08ee Linux 4.9.26
   6d10a6cfe85e ftrace/x86: Fix triple fault with graph tracing and suspend-to-ram
   9cbf4337a51d ARCv2: save r30 on kernel entry as gcc uses it for code-gen
   4684be169a67 net: can: usb: gs_usb: Fix buffer on stack
   07389a140f48 macsec: avoid heap overflow in skb_to_sgvec
   36e0be3187c2 ceph: fix recursion between ceph_set_acl() and __ceph_setattr()
   d7809b9e99bb nfsd: stricter decoding of write-like NFSv2/v3 ops
   8ed0797966fd nfsd4: minor NFSv2/v3 write decoding cleanup
   fc6445df466f nfsd: check for oversized NFSv2/v3 arguments
   b88e4113250d Input: i8042 - add Clevo P650RS to the i8042 reset list
   990afef90e08 ASoC: intel: Fix PM and non-atomic crash in bytcr drivers
   b2b93bbeec2d p9_client_readdir() fix
   92f0ddece7da MIPS: Avoid BUG warning in arch_check_elf
   6fbb6c02df30 MIPS: cevt-r4k: Fix out-of-bounds array access
   4805f8a8a2f6 MIPS: KGDB: Use kernel context for sleeping threads
   563300b9ff7f ARC: [plat-eznps] Fix build error
   59f83369d44c ALSA: seq: Don't break snd_use_lock_sync() loop by timeout
   26b9b1565baf ALSA: firewire-lib: fix inappropriate assignment between signed/unsigned type
   827faa2e4ef7 ALSA: oxfw: fix regression to handle Stanton SCS.1m/1d
   b1fc1b057b8e ipv6: check raw payload size correctly in ioctl
   1dc1b7b50866 tcp: memset ca_priv data to 0 properly
   df1926123f0c ipv6: check skb->protocol before lookup for nexthop
   ae6a762dcdf0 net: phy: fix auto-negotiation stall due to unavailable interrupt
   62817c314af3 net: ipv6: regenerate host route if moved to gc list
   ae88c43c019f macvlan: Fix device ref leak when purging bc_queue
   7bf657201c21 net/mlx5e: Fix ETHTOOL_GRXCLSRLALL handling
   c3215c31ef5c net/mlx5e: Fix small packet threshold
   03641c4ded85 net/mlx5: Fix driver load bad flow when having fw initializing timeout
   b2440a5d3e25 ip6mr: fix notification device destruction
   291e60458ddf netpoll: Check for skb->queue_mapping
   94e5670c933d net: ipv6: RTF_PCPU should not be settable from userspace
   7ab89b176b7a gso: Validate assumption of frag_list segementation
   fcbf5a71a646 dp83640: don't recieve time stamps twice
   e344e97fb359 sh_eth: unmap DMA buffers when freeing rings
   b4580d6f10a3 net: vrf: Fix setting NLM_F_EXCL flag when adding l3mdev rule
   8c04e2acd537 net-timestamp: avoid use-after-free in ip_recv_error
   c86872a43400 ipv6: Fix idev->addr_list corruption
   479beb4c6554 tcp: clear saved_syn in tcp_disconnect()
   02f04309673e sctp: listen on the sock only when it's state is listening or closed
   dbaaa5890df7 net: ipv4: fix multipath RTM_GETROUTE behavior when iif is given
   425cc775d18a l2tp: fix PPP pseudo-wire auto-loading
   b7902607693f l2tp: take reference on sessions being dumped
   1f49c8cd2c9a net/packet: fix overflow in check for tp_reserve
   10452124bac3 net/packet: fix overflow in check for tp_frame_nr
   3ae0fc950603 l2tp: purge socket queues in the .destruct() callback
   59bc404b3829 l2tp: hold tunnel socket when handling control frames in l2tp_ip and l2tp_ip6
   501299e64381 net/mlx5: Avoid dereferencing uninitialized pointer
   0ea3c235779a bpf: improve verifier packet range checks
   d60d4e8c1b73 kcm: return immediately after copy_from_user() failure
   c63d6180076b net: phy: handle state correctly in phy_stop_machine
   4f99161f2ec5 net: neigh: guard against NULL solicit() method
   512d211207df sparc64: Fix kernel panic due to erroneous #ifdef surrounding pmd_write()
   24870a79dad6 sparc64: kern_addr_valid regression
   e88a8e0a23c2 ping: implement proper locking
   7c80a91b8877 Revert "mmc: sdhci-msm: Enable few quirks"
   a8c90ef62281 Linux 4.9.25
   c36eaa6ca346 device-dax: switch to srcu, fix rcu_read_lock() vs pte allocation
   f8bc0881fe95 x86/mce: Make the MCE notifier a blocking one
   6966a6579e1b x86/mce/AMD: Give a name to MCA bank 3 when accessed with legacy MSRs
   1bd55ab13039 powerpc/kprobe: Fix oops when kprobed on 'stdu' instruction
   790b2b5a01ce ubi/upd: Always flush after prepared for an update
   87cfeaa5e5a1 mac80211: fix MU-MIMO follow-MAC mode
   e0411f1eb549 mac80211: reject ToDS broadcast data frames
   b93858556fd1 ubifs: Fix O_TMPFILE corner case in ubifs_link()
   a260ff509b4d ubifs: Fix RENAME_WHITEOUT support
   9fc131428536 mmc: sdhci-esdhc-imx: increase the pad I/O drive strength for DDR50 card
   4420e5f323c4 ACPI / power: Avoid maybe-uninitialized warning
   11ba522d7929 Input: elantech - add Fujitsu Lifebook E547 to force crc_enabled
   3d42ca46f47a s390/mm: fix CMMA vs KSM vs others
   f79ef57911ee CIFS: remove bad_network_name flag
   0b7c97066341 cifs: Do not send echoes before Negotiate is complete
   c0a602ad31ee mm: prevent NR_ISOLATE_* stats from going negative
   d80e90712a50 ring-buffer: Have ring_buffer_iter_empty() return true when empty
   d4decac1edaa tracing: Allocate the snapshot buffer before enabling probe
   174a74dbca2d KEYS: fix keyctl_set_reqkey_keyring() to not leak thread keyrings
   b2dd90e812f3 KEYS: Change the name of the dead type to ".dead" to prevent user access
   a5c6e0a76817 KEYS: Disallow keyrings beginning with '.' to be joined as session keyrings
   2f5e58ec793f Linux 4.9.24
   35b9d61ea910 sctp: deny peeloff operation on asocs with threads sleeping on it
   c67c2be735b1 net: ipv6: check route protocol when deleting routes
   86c6667f6a5f virtio-console: avoid DMA from stack
   fb00319317c1 cxusb: Use a dma capable buffer also for reading
   28d1e8b7ef81 dvb-usb-firmware: don't do DMA on stack
   36b62c08e72b dvb-usb: don't use stack for firmware load
   2c0ad235ac77 mm: Tighten x86 /dev/mem with zeroing reads
   ef793e6e1134 rtc: tegra: Implement clock handling
   0dd962118a20 ACPI / EC: Use busy polling mode when GPE is not enabled
   c07479f4b10a x86/xen: Fix APIC id mismatch warning on Intel
   03470ba96a96 platform/x86: acer-wmi: setup accelerometer when machine has appropriate notify event
   a6ca4946676b ASoC: Intel: select DW_DMAC_CORE since it's mandatory
   25640e792f1a nbd: fix 64-bit division
   7599166d7855 nbd: use loff_t for blocksize and nbd_set_size args
   9c0c43527263 drm/nouveau/disp/mcp7x: disable dptmds workaround
   754ae7efb383 mm: memcontrol: use special workqueue for creating per-memcg caches
   b1574caf9664 ext4: fix inode checksum calculation problem if i_extra_size is small
   1992564156b5 dvb-usb-v2: avoid use-after-free
   de75264ee112 ath9k: fix NULL pointer dereference
   a28acecbaf25 parisc: Fix get_user() for 64-bit value on 32-bit kernel
   c10479591869 crypto: ahash - Fix EINPROGRESS notification callback
   64ba06dc8a1d crypto: algif_aead - Fix bogus request dereference in completion function
   7da0f8e547c2 ftrace: Fix function pid filter on instances
   e3c7258bb4fe zram: do not use copy_page with non-page aligned address
   75465e71ec31 kvm: fix page struct leak in handle_vmon
   5a4c0738998a Revert "MIPS: Lantiq: Fix cascaded IRQ setup"
   a9da1ac37ccf char: lack of bool string made CONFIG_DEVPORT always on
   666452ffdbf7 ftrace: Fix removing of second function probe
   fdaa36c75c5a irqchip/irq-imx-gpcv2: Fix spinlock initialization
   5dda157006bc cpufreq: Bring CPUs up even if cpufreq_online() failed
   5f48cacaa72c pwm: rockchip: State of PWM clock should synchronize with PWM enabled state
   088e5800500e can: ifi: use correct register to read rx status
   5ac50e714f60 libnvdimm: fix reconfig_mutex, mmap_sem, and jbd2_handle lockdep splat
   5f377c4ad271 libnvdimm: fix blk free space accounting
   0c6172ccbb59 make skb_copy_datagram_msg() et.al. preserve ->msg_iter on error
   ff76ab9e03a5 new privimitive: iov_iter_revert()
   e485875dff38 xen, fbfront: fix connecting to backend
   92f8aa7bb825 target: Avoid mappedlun symlink creation during lun shutdown
   08383b004426 scsi: sd: Fix capacity calculation with 32-bit sector_t
   64e746983c4c scsi: qla2xxx: Add fix to read correct register value for ISP82xx.
   82d181d7540f scsi: sd: Consider max_xfer_blocks if opt_xfer_blocks is unusable
   c80c158bfe61 scsi: sr: Sanity check returned mode data
   281e36cbaf43 iscsi-target: Drop work-around for legacy GlobalSAN initiator
   0ae3c95e3a31 iscsi-target: Fix TMR reference leak during session shutdown
   eff58f9084a0 efi/fb: Avoid reconfiguration of BAR that covers the framebuffer
   60174fb3eaa6 efi/libstub: Skip GOP with PIXEL_BLT_ONLY format
   1681bab7c450 parisc: fix bugs in pa_memcpy
   6ef2f0178649 ACPI / scan: Set the visited flag for all enumerated devices
   0b914aa8cdc6 acpi, nfit, libnvdimm: fix interleave set cookie calculation (64-bit comparison)
   5e29a45f1ef0 x86/vdso: Plug race between mapping and ELF header setup
   ec980b6f7dcc x86/vdso: Ensure vdso32_enabled gets set to valid values only
   a9826aa4860a x86, pmem: fix broken __copy_user_nocache cache-bypass assumptions
   59bf23088953 x86/signals: Fix lower/upper bound reporting in compat siginfo
   41d8b02f6448 x86/efi: Don't try to reserve runtime regions
   085656dad4b0 perf/x86: Avoid exposing wrong/stale data in intel_pmu_lbr_read_32()
   0ea2dcf1f9e6 Input: xpad - add support for Razer Wildcat gamepad
   730fecb3401f CIFS: store results of cifs_reopen_file to avoid infinite wait
   3d8d2f234476 CIFS: reconnect thread reschedule itself
   fd3be7eaff14 drm/etnaviv: fix missing unlock on error in etnaviv_gpu_submit()
   e6bcbdc59356 drm/nouveau/mmu/nv4a: use nv04 mmu rather than the nv44 one
   b29a17524bc1 drm/nouveau/mpeg: mthd returns true on success now
   975a7ea950c6 orangefs: free superblock when mount fails
   d19f745ea3a9 zsmalloc: expand class bit
   5c9d08320229 thp: fix MADV_DONTNEED vs clear soft dirty race
   f584803c4942 thp: fix MADV_DONTNEED vs. MADV_FREE race
   5ef6f4dec559 tcmu: Skip Data-Out blocks before gathering Data-In buffer for BIDI case
   890aec8eae09 tcmu: Fix wrongly calculating of the base_command_size
   ef599fa52429 tcmu: Fix possible overwrite of t_data_sg's last iov[]
   f44236a1b05b cgroup, kthread: close race window where new kthreads can be migrated to non-root cgroups
   c3582cc56eac Linux 4.9.23
   0ade21a2ed74 dma-buf: add support for compat ioctl
   27dedde6895c net/mlx4_core: Fix when to save some qp context flags for dynamic VST to VGT transitions
   48b2f1dd5787 net/mlx4_core: Fix racy CQ (Completion Queue) free
   cee26997a604 net/mlx4_en: Fix bad WQE issue
   ec0c5f06dba4 usb: hub: Wait for connection to be reestablished after port reset
   d7045cbf4a06 blk-mq: Avoid memory reclaim when remapping queues
   16fc98c2479f net/packet: fix overflow in check for priv area size
   0ee72d8f9b8e Revert "drm/i915/execlists: Reset RING registers upon resume"
   69fbc505c87b crypto: caam - fix invalid dereference in caam_rsa_init_tfm()
   75964d0f1914 crypto: caam - fix RNG deinstantiation error checking
   91f9f51b1836 MIPS: IRQ Stack: Fix erroneous jal to plat_irq_dispatch
   aa05503149b3 MIPS: Select HAVE_IRQ_EXIT_ON_IRQ_STACK
   e8fa51d31aee MIPS: Switch to the irq_stack in interrupts
   aa6b1dac465e MIPS: Only change $28 to thread_info if coming from user mode
   86b54e48c468 MIPS: Stack unwinding while on IRQ stack
   742817bb77f9 MIPS: Introduce irq_stack
   760327cb080b mtd: bcm47xxpart: fix parsing first block after aligned TRX
   31c576a5fe50 rt2x00: Fix incorrect usage of CONFIG_RT2X00_LIB_USB
   f0df317b2bb3 rt2x00usb: do not anchor rx and tx urb's
   cb794d57931b rt2x00usb: fix anchor initialization
   938f8e856064 i2c: bcm2835: Fix hang for writing messages larger than 16 bytes
   f7513c9165bf orangefs: fix buffer size mis-match between kernel space and user space.
   1b9921866dc5 orangefs: Dan Carpenter influenced cleanups...
   dcac0d18e7e1 orangefs: fix memory leak of string 'new' on exit path
   17fda94d181c drm/i915: Avoid rcu_barrier() from reclaim paths (shrinker)
   82dafcb93b0f drm/i915: Stop using RP_DOWN_EI on Baytrail
   954ce087072c drm/i915: Drop support for I915_EXEC_CONSTANTS_* execbuf parameters.
   1cbf6296fb35 drm/i915: Only enable hotplug interrupts if the display interrupts are enabled
   1435e12e4af9 drm/i915: Avoid tweaking evaluation thresholds on Baytrail v3
   988028e55b88 drm/i915: Nuke debug messages from the pipe update critical section
   8ac9915c3f86 drm/i915/gen9: Increase PCODE request timeout to 50ms
   cf2586e60ede Linux 4.9.22
   7eae64f9195c x86/reboot/quirks: Fix typo in ASUS EeeBook X205TA reboot quirk
   af11789a0548 usb-storage: Add ignore-residue quirk for Initio INIC-3619
   e5525c7419f1 x86/reboot/quirks: Add ASUS EeeBook X205TA/W reboot quirk
   0605fff95d33 x86/reboot/quirks: Add ASUS EeeBook X205TA reboot quirk
   7c6b1ad9deb5 platform/x86: asus-wmi: Detect quirk_no_rfkill from the DSDT
   71f38c11cdb8 platform/x86: asus-wmi: Set specified XUSB2PR value for X550LB
   4dc1eb47fbea watchdog: s3c2410: Fix infinite interrupt in soft mode
   b18877ff66cf PCI: Add ACS quirk for Qualcomm QDF2400 and QDF2432
   5feac34f670c PCI: Sort the list of devices with D3 delay quirk by ID
   6b69d1f64499 mmc: sdhci-of-esdhc: remove default broken-cd for ARM
   0ddf07d2a130 PCI: Disable MSI for HiSilicon Hip06/Hip07 Root Ports
   28dd2313a6e4 PCI: Add Broadcom Northstar2 PAXC quirk for device class and MPSS
   35b366d584da ARM: smccc: Update HVC comment to describe new quirk parameter
   25bdb190ade0 drm/msm/adreno: move function declarations to header file
   bec9918bb4da firmware: qcom: scm: Fix interrupted SCM calls
   007f0a2f2c0f arm: kernel: Add SMC structure parameter
   703f48a1c302 HID: wacom: don't apply generic settings to old devices
   abb640893830 ASoC: sun4i-i2s: Add quirks to handle a31 compatible
   3d2f06d8d180 ACPI: save NVS memory for Lenovo G50-45
   09f78f116c03 ASoC: Intel: cht_bsw_rt5645: add Baytrail MCLK support
   584f4318f923 ASoC: Intel: cht_bsw_rt5645: harden ACPI device detection
   4060a32e9d24 ASoC: Intel: Baytrail: add quirk for Lenovo Thinkpad 10
   d572cfb66264 ASoC: codecs: rt5670: add quirk for Lenovo Thinkpad 10
   58153cca226f ASoC: rt5670: Add missing 10EC5072 ACPI ID
   e4ae51e44b89 ACPI / button: Change default behavior to lid_init_state=open
   b369fd719fa4 sata: ahci-da850: implement a workaround for the softreset quirk
   f36d3f1fe79e PCI: Add ACS quirk for Intel Union Point
   a452e4eb6ee2 ARM: dts: STiH407-family: set snps,dis_u3_susphy_quirk
   9ec57c921b9d drm/mga: remove device_is_agp callback
   ae3a3e209ef1 usb: dwc3: host: pass quirk-broken-port-ped property for known broken revisions
   7bdf7bebbbed usb: host: xhci-plat: enable BROKEN_PED quirk if platform requested
   15159247d25b usb: xhci: add quirk flag for broken PED bits
   660b38eab885 ARM: davinci: PM: support da8xx DT platforms
   db7c1706fa6d Input: gpio_keys - add support for GPIO descriptors
   80b0d7e623d1 serial: 8250_omap: Add OMAP_DMA_TX_KICK quirk for AM437x
   6b8deb108273 usb: chipidea: msm: Rely on core to override AHBBURST
   c5fc946a15dc scsi: ufs: issue link starup 2 times if device isn't active
   a17bddc4a781 scsi: ufs: introduce a new ufshcd_statea UFSHCD_STATE_EH_SCHEDULED
   e94ed347105d ASoC: Intel: bytcr_rt5640: quirks for Insyde devices
   0ed0810b8b02 drm/i915: actually drive the BDW reserved IDs
   70797929ee36 drm/i915: more .is_mobile cleanups for BDW
   0b348464eea0 drm/i915: fix INTEL_BDW_IDS definition
   14ec1cf414cf drm/edid: constify edid quirk list
   f188ee38d4cb HID: usbhid: Add quirk for Mayflash/Dragonrise DolphinBar.
   7fd75759ba07 HID: usbhid: Add quirk for the Futaba TOSD-5711BB VFD
   c1e94148f93c ACPI / sysfs: Provide quirk mechanism to prevent GPE flooding
   43cfff65c989 nvme: simplify stripe quirk
   8d620dff40ba platform/x86: acer-wmi: Only supports AMW0_GUID1 on acer family
   2bd6cc1cce47 ALSA: usb-audio: Add native DSD support for TEAC 501/503 DAC
   8ae7242fea54 PCI: Expand "VPD access disabled" quirk message
   c0aac1bbb5d8 ALSA: usb-audio: add implicit fb quirk for Axe-Fx II
   bedc629494cd scsi: ufs: add quirk to increase host PA_SaveConfigTime
   5c6b8ad1ab25 PCI: thunder-pem: Factor out resource lookup
   5582c1980eac arm64: PCI: Add local struct device pointers
   cc49b39f3f2d arm64: PCI: Manage controller-specific data on per-controller basis
   625fd9d1af70 x86/intel_idle: Add CPU model 0x4a (Atom Z34xx series)
   607ca1dccbbd svcauth_gss: Close connection when dropping an incoming message
   3a87bcdebf6e scsi: ufs: ensure that host pa_tactivate is higher than device
   d84be51d1c1d mmc: sdhci-msm: Enable few quirks
   c6e3c6628dfb HID: multitouch: do not retrieve all reports for all devices
   68a83be38135 HID: multitouch: enable the Surface 3 Type Cover to report multitouch data
   c5fcc6332ddb HID: sensor-hub: add quirk for Microchip MM7150
   39f3c9291d69 HID: sensor-hub add quirk for Microsoft Surface 3
   9b41ed79ec78 scsi: ufs: introduce UFSHCD_QUIRK_PRDT_BYTE_GRAN quirk
   26cbe162df3d clocksource/drivers/arm_arch_timer: Don't assume clock runs in suspend
   d2f1000c3ae3 net/mlx4_core: Use device ID defines
   dcc4c6758100 arm64: dts: hisi: fix hip06 sas am-max-trans quirk
   b340c9648c2f ASoC: Intel: bytct_rt5640: change default capture settings
   d9a97dcdf5c2 usb: dwc3: gadget: delay unmap of bounced requests
   ee670af5feed HID: i2c-hid: add a simple quirk to fix device defects
   d640c41bced6 HID: usbhid: Add quirks for Mayflash/Dragonrise GameCube and PS3 adapters
   e02a5d1d5a05 clk: lpc32xx: add a quirk for PWM and MS clock dividers
   666d5f34d897 drm/sun4i: Add compatible string for A31/A31s TCON (timing controller)
   6af7e1cae445 drm/sun4i: Add compatible strings for A31/A31s display pipelines
   06a2bb472f71 drm/sun4i: tcon: Move SoC specific quirks to a DT matched data structure
   7c0361334466 random: use chacha20 for get_random_int/long
   cddab768d134 mm/mempolicy.c: fix error handling in set_mempolicy and mbind.
   24317cb6b400 Documentation: stable-kernel-rules: fix stable-tag format
   be56f92cc0a9 MIPS: c-r4k: Fix Loongson-3's vcache/scache waysize calculation
   59b8725f2b1e MIPS: Flush wrong invalid FTLB entry for huge page
   186fb3c52e39 MIPS: Add MIPS_CPU_FTLB for Loongson-3A R2
   3d5e13d891b0 MIPS: Check TLB before handle_ri_rdhwr() for Loongson-3
   c7f6633f7657 MIPS: Lantiq: fix missing xbar kernel panic
   1e7deb9da033 MIPS: End spinlocks with .insn
   19aa26f5be49 MIPS: ralink: Fix typos in rt3883 pinctrl
   9dcb21e63b2e MIPS: Force o32 fp64 support on 32bit MIPS64r6 kernels
   7b68273f79e8 s390/uaccess: get_user() should zero on failure (again)
   f4938792af38 s390/decompressor: fix initrd corruption caused by bss clear
   6a776f6ae3f8 xtensa: make __pa work with uncached KSEG addresses
   c1dcea123655 nios2: reserve boot memory for device tree
   27d382fb6afe dm raid: fix NULL pointer dereference for raid1 without bitmap
   abbf0fd436a9 powerpc/crypto/crc32c-vpmsum: Fix missing preempt_disable()
   45c2ed941c08 powerpc: Don't try to fix up misaligned load-with-reservation instructions
   fba7546bbe65 powerpc/64: Fix flush_(d|i)cache_range() called from modules
   24d945d4791f powerpc/mm: Add missing global TLB invalidate if cxl is active
   6fbf84b5da23 powerpc: Disable HFSCR[TM] if TM is not supported
   a1db9b2c1b12 metag/usercopy: Add missing fixups
   ce154d517ae4 metag/usercopy: Fix src fixup in from user rapf loops
   4f3f0dd2a75b metag/usercopy: Set flags before ADDZ
   3dc0fe517a9f metag/usercopy: Zero rest of buffer from copy_from_user
   4a93ac814ddc metag/usercopy: Add early abort to copy_to_user
   49a292dcd86b metag/usercopy: Fix alignment error checking
   2bb52b47e7f4 metag/usercopy: Drop unused macros
   9afc076d2812 brcmfmac: use local iftype avoiding use-after-free of virtual interface
   c0321505df2e mac80211: unconditionally start new netdev queues with iTXQ support
   703cebf6e978 ring-buffer: Fix return value check in test_ringbuffer()
   f7db18998e9c xfs: Honor FALLOC_FL_KEEP_SIZE when punching ends of files
   dc62935ce0fb orangefs: move features validation to fix filesystem hang
   c4fe79a44a5d Kbuild: use cc-disable-warning consistently for maybe-uninitialized
   e4a62348935e ACPI / gpio: do not fall back to parsing _CRS when we get a deferral
   ab83597b9d40 dm verity fec: fix bufio leaks
   2ff087642643 dm verity fec: limit error correction recursion
   d9fa4351037b ptrace: fix PTRACE_LISTEN race corrupting task->state
   e3b08ebe4773 mm/page_alloc.c: fix print order in show_free_areas()
   8446cb1adf95 Reset TreeId to zero on SMB2 TREE_CONNECT
   57e1e90dda74 cfg80211: check rdev resume callback only for registered wiphy
   3715dbf77f3b arm64: mm: unaligned access by user-land should be received as SIGBUS
   71b44ef83d2a iio: bmg160: reset chip when probing
   ac303c64cdb8 kvm: arm/arm64: Fix locking for kvm_free_stage2_pgd
   a1ea31893684 arm/arm64: KVM: Take mmap_sem in kvm_arch_prepare_memory_region
   48f2825abc65 arm/arm64: KVM: Take mmap_sem in stage2_unmap_vm
   8f8de8d2bf6c staging: android: ashmem: lseek failed due to no FMODE_LSEEK.
   d9eedab38395 sysfs: be careful of error returns from ops->show()
   4ddd24d54fed drm/vmwgfx: fix integer overflow in vmw_surface_define_ioctl()
   28c84df739e3 drm/vmwgfx: Remove getparam error message
   b116797b81e5 drm/ttm, drm/vmwgfx: Relax permission checking when opening surfaces
   604d2eac67cb drm/vmwgfx: avoid calling vzalloc with a 0 size in vmw_get_cap_3d_ioctl()
   73ab72517b61 drm/vmwgfx: NULL pointer dereference in vmw_surface_define_ioctl()
   92cc48166e49 drm/vmwgfx: Type-check lookups of fence objects
   9c2b46e720d5 ppdev: fix registering same device name
   bf5202b58f61 ppdev: check before attaching port

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 4ca7883122f1..b309447b4726 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b6f5c933ce66e4a00412bb5c5691a2ab4187c979"
-SRCREV_meta ?= "803b8d600e45afa0375459bf599fe365571a3866"
+SRCREV_machine ?= "095698fd99b452d95188ff6f2cce3df5127beb5c"
+SRCREV_meta ?= "8b40e0ad3acba22a19c2505584044df115d02e90"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.21"
+LINUX_VERSION ?= "4.9.27"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 62aedb37de36..4103c48f1431 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.21"
+LINUX_VERSION ?= "4.9.27"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "81055b89bd32414ecaf95156ce9a5fa6643e530a"
-SRCREV_meta ?= "803b8d600e45afa0375459bf599fe365571a3866"
+SRCREV_machine ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
+SRCREV_meta ?= "8b40e0ad3acba22a19c2505584044df115d02e90"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index d6b96ed873d6..309d4a7a4fd1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "bb5856d9b25d13c63a757a408cc8793d6f6302fa"
-SRCREV_machine_qemuarm64 ?= "81055b89bd32414ecaf95156ce9a5fa6643e530a"
-SRCREV_machine_qemumips ?= "4b150e5ceca8b2c4fb01f74b1f7a57cdeae63762"
-SRCREV_machine_qemuppc ?= "81055b89bd32414ecaf95156ce9a5fa6643e530a"
-SRCREV_machine_qemux86 ?= "81055b89bd32414ecaf95156ce9a5fa6643e530a"
-SRCREV_machine_qemux86-64 ?= "81055b89bd32414ecaf95156ce9a5fa6643e530a"
-SRCREV_machine_qemumips64 ?= "b300b94b77ed9fbb1c80a2d2441403ad2b7694a9"
-SRCREV_machine ?= "81055b89bd32414ecaf95156ce9a5fa6643e530a"
-SRCREV_meta ?= "803b8d600e45afa0375459bf599fe365571a3866"
+SRCREV_machine_qemuarm ?= "60c70a5e9f07f1485491dd44c6049e7da908656a"
+SRCREV_machine_qemuarm64 ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
+SRCREV_machine_qemumips ?= "f922c64ba89ca137ba2d5f75be79311dd6c5e229"
+SRCREV_machine_qemuppc ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
+SRCREV_machine_qemux86 ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
+SRCREV_machine_qemux86-64 ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
+SRCREV_machine_qemumips64 ?= "bfdb9d2cf36f5ded1cd8d03e58465d9f6250bba8"
+SRCREV_machine ?= "2c31d7a45ae75159a7d991abdeb7002a4493af7f"
+SRCREV_meta ?= "8b40e0ad3acba22a19c2505584044df115d02e90"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.21"
+LINUX_VERSION ?= "4.9.27"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


