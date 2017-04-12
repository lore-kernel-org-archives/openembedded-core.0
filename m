Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 21EE177C99
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 03:46:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3C3kXqA013990
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Apr 2017 20:46:33 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 11 Apr 2017 20:46:32 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 11 Apr 2017 23:46:27 -0400
Message-ID: <ecebc04768e9fda5983fbc058ae3941dfbe4a49d.1491968220.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1491968220.git.bruce.ashfield@windriver.com>
References: <cover.1491968220.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/4.10: update to v4.10.9
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
X-List-Received-Date: Wed, 12 Apr 2017 03:46:33 -0000
Content-Type: text/plain

Updating to the korg stable release, with the following changes:

   f6392b77fb91 Linux 4.10.9
   59529be9c99e drm/i915: A hotfix for making aliasing PPGTT work for GVT-g
   0efab45f7092 drm/i915: Let execlist_update_context() cover !FULL_PPGTT mode.
   e47bc4fb5db4 drm/i915: Move the release of PT page to the upper caller
   e33cb9747fdf nvme/pci: Disable on removal when disconnected
   2bfe1b12a496 nvme/core: Fix race kicking freed request_queue
   311cd5ae37e7 padata: avoid race in reordering
   a591a05f1d0a blk: Ensure users for current->bio_list can see the full list.
   75a778ed4f3d blk: improve order of bio handling in generic_make_request()
   b576c5833134 MIPS: Lantiq: Fix cascaded IRQ setup
   77149f08767e ARM: dts: BCM5301X: Correct GIC_PPI interrupt flags
   1229cd2fa5e0 drm/armada: Fix compile fail
   847f0ffc12ae mm, hugetlb: use pte_present() instead of pmd_present() in follow_huge_pmd()
   61b76d7af8e4 mm: workingset: fix premature shadow node shrinking with cgroups
   9f424db185a2 mm: rmap: fix huge file mmap accounting in the memcg stats
   fb29fe35575a lib/syscall: Clear return values when no stack
   be6647667608 x86/mce: Fix copy/paste error in exception table entries
   4ea2e307c7cf x86/mm/KASLR: Exclude EFI region from KASLR VA space randomization
   d0a9dba54764 drm/i915/kvmgt: Hold struct kvm reference
   65e5e864aad9 drm/etnaviv: (re-)protect fence allocation with GPU mutex
   4a1b7b6c82dc drm/vc4: Allocate the right amount of space for boot-time CRTC state.
   7a8453634601 drm/radeon: Override fpfn for all VRAM placements in radeon_evict_flags
   5b79ca06a51d KVM: kvm_io_bus_unregister_dev() should never fail
   00a3ca394871 KVM: x86: clear bus pointer when destroyed
   b3ff1bac80ab serial: mxs-auart: Fix baudrate calculation
   782cb86b0155 USB: fix linked-list corruption in rh_call_control()
   6f168275df2e xhci: Set URB actual length for stopped control transfers
   3cacfce024b1 tty/serial: atmel: fix TX path in atmel_console_write()
   3eadc2dccb51 tty/serial: atmel: fix race condition (TX+DMA)
   4f6116cf520c ACPI: Do not create a platform_device for IOAPIC/IOxAPIC
   af7550a70dad ACPI: Fix incompatibility with mcount-based function graph tracing
   92bca7fa882f parisc: Fix access fault handling in pa_memcpy()
   fc12a50f7742 parisc: Avoid stalled CPU warnings after system shutdown
   37e623429737 parisc: Clean up fixup routines for get_user()/put_user()
   4bcd2ca3c361 dt-bindings: rng: clocks property on omap_rng not always mandatory
   be14ea08d26f nfsd: map the ENOKEY to nfserr_perm for avoiding warning
   8f5cfd1af067 NFSv4.1 fix infinite loop on IO BAD_STATEID error
   61e6e72e9f9c ARCv2: SLC: Make sure busy bit is set properly on SLC flushing
   9fef1e65279d crypto: xts,lrw - fix out-of-bounds write after kmalloc failure
   5a16448c2132 crypto: ccp - Make some CCP DMA channels private
   79105a2f8146 mmc: sdhci-of-at91: fix MMC_DDR_52 timing selection
   41ece35ef4b4 mmc: sdhci: Disable runtime pm when the sdio_irq is enabled
   d4dd65ff6716 HID: wacom: Don't add ghost interface as shared data
   617c6850480b ASoC: rt5665: fix getting wrong work handler container
   29f675437ceb ASoC: Intel: Skylake: fix invalid memory access due to wrong reference of pointer
   48a5a47a050c ASoC: atmel-classd: fix audio clock rate
   e12a232e9b64 ALSA: hda - fix a problem for lineout on a Dell AIO machine
   c36ef6467420 ALSA: seq: Fix race during FIFO resize
   d2e79b56ba2e PCI: thunder-pem: Use Cavium assigned hardware ID for ThunderX host controller
   d9c6a97b3fae PCI: iproc: Save host bridge window resource in struct iproc_pcie
   ef97d9485efa scsi: scsi_dh_alua: Ensure that alua_activate() calls the completion function
   2b1725d1df36 scsi: scsi_dh_alua: Check scsi_device_get() return value
   905385ad1309 scsi: libsas: fix ata xfer length
   f7019040f6d7 scsi: sg: check length passed to SG_NEXT_CMD_LEN
   f031e4f54f98 xfs: try any AG when allocating the first btree block when reflinking
   83d33266c371 xfs: use iomap new flag for newly allocated delalloc blocks
   ee74519c0876 xfs: Use xfs_icluster_size_fsb() to calculate inode alignment mask
   87cdf91a6bf4 xfs: fix and streamline error handling in xfs_end_io
   1c0d974bea21 xfs: only reclaim unwritten COW extents periodically
   5d834e1adcb0 xfs: tune down agno asserts in the bmap code
   854a9bf0acb1 xfs: Use xfs_icluster_size_fsb() to calculate inode chunk alignment
   8c1e9cfd5b67 xfs: don't reserve blocks for right shift transactions
   a3aca9b42d6f xfs: fix uninitialized variable in _reflink_convert_cow
   1d7babf19237 xfs: split indlen reservations fairly when under reserved
   177227735045 xfs: handle indlen shortage on delalloc extent merge
   0b20c0afbb84 xfs: don't fail xfs_extent_busy allocation
   e8eb2c060902 xfs: correct null checks and error processing in xfs_initialize_perag
   304ec448ee8b xfs: update ctime and mtime on clone destinatation inodes
   900c499df454 xfs: reject all unaligned direct writes to reflinked files
   17c17805b76e xfs: reset b_first_retry_time when clear the retry status of xfs_buf_t
   b0f88f0deb50 xfs: mark speculative prealloc CoW fork extents unwritten
   a0c46fae264a xfs: allow unwritten extents in the CoW fork
   1dc0e72c13e7 xfs: verify free block header fields
   58565508b2b3 xfs: check for obviously bad level values in the bmbt root
   2b9dcb947e73 xfs: filter out obviously bad btree pointers
   cb308466d6dc xfs: fail _dir_open when readahead fails
   8059f06199f0 xfs: fix toctou race when locking an inode to access the data map
   025770917bcb xfs: fix eofblocks race with file extending async dio writes
   696bfc8ec85c xfs: sync eofblocks scans under iolock are livelock prone
   ff4ea420698d xfs: pull up iolock from xfs_free_eofblocks()
   3eb243290edf KVM: nVMX: fix nested EPT detection
   8a7eb087a5a4 libceph: force GFP_NOIO for socket allocations
   3fdae700a361 Linux 4.10.8
   d6854f591c22 usb: musb: fix possible spinlock deadlock
   ca908a9a57e7 sched/rt: Add a missing rescheduling point
   15eea140d991 qla2xxx: Allow vref count to timeout on vport delete.
   f7c1a6ec45d6 metag/ptrace: Reject partial NT_METAG_RPIPE writes
   400763ea4357 metag/ptrace: Provide default TXSTATUS for short NT_PRSTATUS
   3e0a29e1b6c6 metag/ptrace: Preserve previous registers for short regset write
   fc1ff8342c66 sparc/ptrace: Preserve previous registers for short regset write
   d1b2aeaa4bcd mips/ptrace: Preserve previous registers for short regset write
   53adbfdf3133 h8300/ptrace: Fix incorrect register transfer count
   ff7ff50d9c07 c6x/ptrace: Remove useless PTRACE_SETREGSET implementation
   90a1cbf54eb6 pinctrl: qcom: Don't clear status bit on irq_unmask
   d4a3eba0eb0f virtio_balloon: init 1st buffer in stats vq
   71a434f7c9b8 KVM: x86: cleanup the page tracking SRCU instance
   737f7378c7e9 KVM: nVMX: Fix nested VPID vmx exec control
   843e5b6c801a xfrm_user: validate XFRM_MSG_NEWAE incoming ESN size harder
   ffcf5de81520 xfrm_user: validate XFRM_MSG_NEWAE XFRMA_REPLAY_ESN_VAL replay_window
   58333eaf3123 xfrm: policy: init locks early
   55db23d3a51e Linux 4.10.7
   0dad3de86825 crypto: algif_hash - avoid zero-sized array
   f9955dcaceae fbcon: Fix vc attr at deinit
   2a3241044b1c drm: reference count event->completion
   597584832d0c xen: do not re-use pirq number cached in pci device msi msg data
   535693055d2a cpuidle: Validate cpu_dev in cpuidle_add_sysfs()
   a27142e6d0eb scsi: sd: Check for unaligned partial completion
   66c0812889de device-dax: fix pmd/pte fault fallback handling
   96aa12df2410 libceph: don't set weight to IN when OSD is destroyed
   8b38e3191816 mmc: block: Fix is_waiting_last_req set incorrectly
   f2a9bf4d93df Drivers: hv: vmbus: Don't leak memory when a channel is rescinded
   840065777b4d Drivers: hv: vmbus: Don't leak channel ids
   f8dd767b84e2 intel_th: Don't leak module refcount on failure to activate
   7bf105ac9277 jbd2: don't leak memory if setting up journal fails
   8668c61ba509 auxdisplay: img-ascii-lcd: add missing sentinel entry in img_ascii_lcd_matches
   67dfc0850f71 drm/amd/amdgpu: add POLARIS12 PCI ID
   a7a14362e278 drm/amdgpu: reinstate oland workaround for sclk
   51d3848c10b3 cpsw/netcp: cpts depends on posix_timers
   16379a79ee45 blk-mq: don't complete un-started request in timeout handler
   fee328fee946 cgroup, net_cls: iterate the fds of only the tasks which are being migrated
   3742b9a08682 cpufreq: Restore policy min/max limits on CPU online
   fc0af2511915 arm64: kaslr: Fix up the kernel image alignment
   f464f86d8b8d ARM: at91: pm: cpu_idle: switch DDR to power-down mode
   166fdccc86a5 Revert "ARM: at91/dt: sama5d2: Use new compatible for ohci node"
   514e122cf8d0 iommu/exynos: Workaround FLPD cache flush issues for SYSMMU v5
   03d92bd5b426 iommu/exynos: Block SYSMMU while invalidating FLPD cache
   b7d02d90d03a iommu/vt-d: Fix NULL pointer dereference in device_to_iommu
   fa477d804fd3 xen/acpi: upload PM state from init-domain to Xen
   8b0219e35b43 vfio: Rework group release notifier warning
   0d05871e5e43 fscrypt: remove broken support for detecting keyring key revocation
   f115bf08b7d2 crypto: ccp - Assign DMA commands to the channel's CCP
   c62625b6b383 ath10k: fix incorrect wlan_mac_base in qca6174_regs
   2f69745c309c mwifiex: pcie: don't leak DMA buffers when removing
   ad3b48d36e0d clk: sunxi-ng: mp: Adjust parent rate for pre-dividers
   9300e322b68d clk: sunxi-ng: sun6i: Fix enable bit offset for hdmi-ddc module clock
   76b5eb51114a hwrng: geode - Revert managed API changes
   9b35f163f7fe hwrng: amd - Revert managed API changes
   ce6c155ada08 mmc: sdhci-pci: Do not disable interrupts in sdhci_intel_set_power
   f89c8a5007b2 mmc: sdhci: Do not disable interrupts while waiting for clock
   b821a0a5fde9 mmc: sdhci-of-arasan: fix incorrect timeout clock
   116418547216 mmc: sdhci-of-at91: Support external regulators
   a0c48115cd23 audit: fix auditd/kernel connection state tracking
   72c89fa6106a powerpc/64s: Fix idle wakeup potential to clobber registers
   35637b59f675 ext4: lock the xattr block before checksuming it
   26512e52106d ext4: mark inode dirty after converting inline directory
   762602796be6 ppdev: fix registering same device name
   f8155f4e6368 parport: fix attempt to write duplicate procfiles
   c3a22b5f4339 mei: don't wait for os version message reply
   0dc119af06a5 mei: fix deadlock on mei reset
   bf1aedff42b2 iio: magnetometer: ak8974: remove incorrect __exit markups
   6c2aab07d124 iio: hid-sensor-trigger: Change get poll value function order to avoid sensor properties losing after resume from S3
   9323d92a280b iio: sw-device: Fix config group initialization
   a12d1eadd0d1 iio: adc: ti_am335x_adc: fix fifo overrun recovery
   f4004c87c8c6 mmc: core: Fix access to HS400-ES devices
   a56eba20b447 nl80211: fix dumpit error path RTNL deadlocks
   f876c1039440 mmc: ushc: fix NULL-deref at probe
   90c2bb66e98e uwb: hwa-rc: fix NULL-deref at probe
   05393ccea6e3 uwb: i1480-dfu: fix NULL-deref at probe
   bb486e80a13f USB: usbtmc: fix probe error path
   ad1bbccdf018 USB: usbtmc: add missing endpoint sanity check
   9ec0027442cb usb: hub: Fix crash after failure to read BOS descriptor
   9eae384ab967 usb: musb: cppi41: don't check early-TX-interrupt for Isoch transfer
   a769fe27a7cf USB: wusbcore: fix NULL-deref at probe
   bcf394acf736 USB: idmouse: fix NULL-deref at probe
   f615aa74026f USB: lvtest: fix NULL-deref at probe
   0918c32f09dd USB: uss720: fix NULL-deref at probe
   dfdd59a3ec07 usb-core: Add LINEAR_FRAME_INTR_BINTERVAL USB quirk
   aacb73b7ae2f dvb-usb-firmware: don't do DMA on stack
   f1b221121b16 usb: gadget: f_uvc: Fix SuperSpeed companion descriptor's wBytesPerInterval
   c37fcc17bf36 ACM gadget: fix endianness in notifications
   7cdfdddb2e61 USB: serial: qcserial: add Dell DW5811e
   b1849b029cc1 USB: serial: option: add Quectel UC15, UC20, EC21, and EC25 modems
   37e91f5d0105 ALSA: hda - Adding a group of pin definition to fix headset problem
   0b7e15f1a165 ALSA: ctxfi: Fix the incorrect check of dma_set_mask() call
   4c381c7affcb ALSA: seq: Fix racy cell insertions during snd_seq_pool_done()
   9ccad2dfe28c Input: sur40 - validate number of endpoints before using them
   fb50058c7970 Input: kbtab - validate number of endpoints before using them
   865b020ff2a1 Input: cm109 - validate number of endpoints before using them
   69cbb678881a Input: yealink - validate number of endpoints before using them
   e8861cb37faf Input: hanwang - validate number of endpoints before using them
   9318ae922a52 Input: ims-pcu - validate number of endpoints before using them
   ed6a66dc2f7a Input: iforce - validate number of endpoints before using them
   b5157d07935b Input: i8042 - add noloop quirk for Dell Embedded Box PC 3000
   f1d4be3d754c Input: elan_i2c - add ASUS EeeBook X205TA special touchpad fw
   b87dd1d7dacc Input: ALPS - fix trackstick button handling on V8 devices
   0186e6a4e501 Input: ALPS - fix V8+ protocol handling (73 03 28)
   00ca1a71292c HID: sony: Fix input device leak when connecting a DS4 twice using USB/BT
   de93e41f7734 net: solve a NAPI race
   a1fd7338b43e amd-xgbe: Fix the ECC-related bit position definitions
   d3add547afd3 tcp: initialize icsk_ack.lrcvtime at session start time
   a3639645a94b genetlink: fix counting regression on ctrl_dumpfamily()
   aaa31c62f737 socket, bpf: fix sk_filter use after free in sk_clone_lock
   1880e1308e9d ipv4: provide stronger user input validation in nl_fib_input()
   212508f709ab net: bcmgenet: remove bcmgenet_internal_phy_setup()
   30b72691dbca ipv6: make sure to initialize sockc.tsflags before first use
   4162e85c7134 net/mlx5e: Count LRO packets correctly
   4ec387a74cdc net/mlx5e: Count GSO packets correctly
   345aad1f4602 net/mlx5: Increase number of max QPs in default profile
   458034b72f35 net/mlx5e: Avoid supporting udp tunnel port ndo for VF reps
   daa6e01308ad net/mlx5e: Use the proper UAPI values when offloading TC vlan actions
   b709b83ea5ec net/mlx5: E-Switch, Don't allow changing inline mode when flows are configured
   402073e7e39a net/mlx5e: Change the TC offload rule add/del code path to be per NIC or E-Switch
   5e96d44bbdd4 net/mlx5: Add missing entries for set/query rate limit commands
   eccc68710eff net: vrf: Reset rt6i_idev in local dst after put
   29323e2def48 qmi_wwan: add Dell DW5811e
   4f320b855b8a net: unix: properly re-increment inflight counter of GC discarded candidates
   d965848569f9 openvswitch: Add missing case OVS_TUNNEL_KEY_ATTR_PAD
   ae9d577f3dbb amd-xgbe: Fix jumbo MTU processing on newer hardware
   5dd697af3014 net: properly release sk_frag.page
   200caa0be5d2 net: bcmgenet: Do not suspend PHY if Wake-on-LAN is enabled
   3c9f2c656aca net/openvswitch: Set the ipv6 source tunnel key address attribute correctly
   df6ed56f4352 Linux 4.10.6
   dcb196787cd9 drm/amdgpu/si: add dpm quirk for Oland
   9ec87191ecee cgroup/pids: remove spurious suspicious RCU usage warning
   db79c1978953 percpu: acquire pcpu_lock when updating pcpu_nr_empty_pop_pages
   a69813714424 gfs2: Avoid alignment hole in struct lm_lockname
   d369c16ffb46 isdn/gigaset: fix NULL-deref at probe
   169c4019c7be target: Fix VERIFY_16 handling in sbc_parse_cdb
   4a657746c52a scsi: mpt3sas: Avoid sleeping in interrupt context
   d4700e2050df scsi: libiscsi: add lock around task lists to fix list corruption regression
   5b769ee1ff5f scsi: lpfc: Add shutdown method for kexec
   a62438951a61 target/pscsi: Fix TYPE_TAPE + TYPE_MEDIMUM_CHANGER export
   11de2d238d6f md/raid1/10: fix potential deadlock
   a42f27d91de7 hwrng: omap - Do not access INTMASK_REG on EIP76
   65eb69be1999 hwrng: omap - use devm_clk_get() instead of of_clk_get()
   48207bda7d79 hwrng: omap - write registers after enabling the clock
   fd6fb9243d56 powerpc/boot: Fix zImage TOC alignment
   602ef5c5b0c5 cpufreq: Fix and clean up show_cpuinfo_cur_freq()
   84f16bb39c77 NFS prevent double free in async nfs4_exchange_id
   a3c7894422c9 xprtrdma: Squelch kbuild sparse complaint
   3e037a0fe0b6 md/r5cache: fix set_syndrome_sources() for data in cache
   2fe91a8e5fd3 perf/core: Fix event inheritance on fork()
   b1769d8402f2 perf/core: Fix use-after-free in perf_release()
   f194549ebe65 parisc: Fix system shutdown halt
   f81a9940e5ad parisc: support R_PARISC_SECREL32 relocation in modules
   13ad0be78574 parisc: Optimize flush_kernel_vmap_range and invalidate_kernel_vmap_range
   13b178142b19 qla2xxx: Fix request queue corruption.
   b7306a2e2f62 qla2xxx: Fix memory leak for abts processing
   afd4fdd0da49 give up on gcc ilog2() constant optimizations

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.10.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
index e562e0e92813..ed811fb21e1e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "53be19cad65e798c14be6d0365eb8f41ff38e540"
-SRCREV_meta ?= "01f18cba44d688687cb20c6fe548743fff7f2756"
+SRCREV_machine ?= "fe0fb8da3d633d802776081e7ff2df73ff2983f2"
+SRCREV_meta ?= "ad2e885015c5bf8adeef5cb789b535fc3c0dd396"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.10.5"
+LINUX_VERSION ?= "4.10.9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
index e03c3cc0fc5c..61e680a11123 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.10.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.10.5"
+LINUX_VERSION ?= "4.10.9"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "53be19cad65e798c14be6d0365eb8f41ff38e540"
-SRCREV_meta ?= "01f18cba44d688687cb20c6fe548743fff7f2756"
+SRCREV_machine ?= "fe0fb8da3d633d802776081e7ff2df73ff2983f2"
+SRCREV_meta ?= "ad2e885015c5bf8adeef5cb789b535fc3c0dd396"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.10.bb b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
index a6b57a107161..2ef6a317cb92 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.10.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b97dcd4f063c3d8c1d7fac555c0a189fe44b1eec"
-SRCREV_machine_qemuarm64 ?= "53be19cad65e798c14be6d0365eb8f41ff38e540"
-SRCREV_machine_qemumips ?= "6bebfa141f0e378673c810aaf3427168848a0b02"
-SRCREV_machine_qemuppc ?= "53be19cad65e798c14be6d0365eb8f41ff38e540"
-SRCREV_machine_qemux86 ?= "53be19cad65e798c14be6d0365eb8f41ff38e540"
-SRCREV_machine_qemux86-64 ?= "53be19cad65e798c14be6d0365eb8f41ff38e540"
-SRCREV_machine_qemumips64 ?= "0602a7509bac454c4ca4efd6fc26de4badc3d938"
-SRCREV_machine ?= "53be19cad65e798c14be6d0365eb8f41ff38e540"
-SRCREV_meta ?= "01f18cba44d688687cb20c6fe548743fff7f2756"
+SRCREV_machine_qemuarm ?= "718b0a546417a51a186179d5277713f301e1d7c9"
+SRCREV_machine_qemuarm64 ?= "fe0fb8da3d633d802776081e7ff2df73ff2983f2"
+SRCREV_machine_qemumips ?= "a803c18e328080eb9acc71510df3b7567bd87578"
+SRCREV_machine_qemuppc ?= "fe0fb8da3d633d802776081e7ff2df73ff2983f2"
+SRCREV_machine_qemux86 ?= "fe0fb8da3d633d802776081e7ff2df73ff2983f2"
+SRCREV_machine_qemux86-64 ?= "fe0fb8da3d633d802776081e7ff2df73ff2983f2"
+SRCREV_machine_qemumips64 ?= "97b912becdd8322f4e7f45dfe79e37fc5ea35f88"
+SRCREV_machine ?= "fe0fb8da3d633d802776081e7ff2df73ff2983f2"
+SRCREV_meta ?= "ad2e885015c5bf8adeef5cb789b535fc3c0dd396"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.10.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.10.5"
+LINUX_VERSION ?= "4.10.9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


