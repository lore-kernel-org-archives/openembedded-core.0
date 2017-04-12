Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8E58F77C8F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 03:46:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3C3kXte006718
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 11 Apr 2017 20:46:34 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 11 Apr 2017 20:46:33 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Tue, 11 Apr 2017 23:46:28 -0400
Message-ID: <05ea16c1429ac63611f9c19bbeb3104b9aebcfa6.1491968220.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1491968220.git.bruce.ashfield@windriver.com>
References: <cover.1491968220.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/4.9: update to v4.9.21
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
X-List-Received-Date: Wed, 12 Apr 2017 03:46:34 -0000
Content-Type: text/plain

Updating to the korg -stable release, with the following shortlog
summary:

   37feaf8095d3 Linux 4.9.21
   02b23e059a9d nvme/pci: Disable on removal when disconnected
   a5e39a7f2985 nvme/core: Fix race kicking freed request_queue
   eb8c62a3848e padata: avoid race in reordering
   5959cded91e3 blk: Ensure users for current->bio_list can see the full list.
   d5986e0078f2 blk: improve order of bio handling in generic_make_request()
   e3a55294fc20 mm: workingset: fix premature shadow node shrinking with cgroups
   362721c4957d MIPS: Lantiq: Fix cascaded IRQ setup
   1b442f9bdf9a ARM: dts: BCM5301X: Correct GIC_PPI interrupt flags
   c1716f0c35cc qla2xxx: Allow vref count to timeout on vport delete.
   5ed56ca86f96 ARM: BCM5301X: Add back handler ignoring external imprecise aborts
   40c5b99f8ace mm, hugetlb: use pte_present() instead of pmd_present() in follow_huge_pmd()
   b5707920e4d8 mm: rmap: fix huge file mmap accounting in the memcg stats
   673dfb6d1bb4 lib/syscall: Clear return values when no stack
   af5ef6dafea0 x86/mce: Fix copy/paste error in exception table entries
   2211d19ac6dd x86/mm/KASLR: Exclude EFI region from KASLR VA space randomization
   4366c7e346ce drm/etnaviv: (re-)protect fence allocation with GPU mutex
   6acf52070857 drm/vc4: Allocate the right amount of space for boot-time CRTC state.
   fa68e1d3cecc drm/radeon: Override fpfn for all VRAM placements in radeon_evict_flags
   1563625c717c KVM: kvm_io_bus_unregister_dev() should never fail
   ef46a13b9c4e KVM: x86: clear bus pointer when destroyed
   5289f1ce39a7 serial: mxs-auart: Fix baudrate calculation
   67e41b1368b1 USB: fix linked-list corruption in rh_call_control()
   1f1c9e29651d tty/serial: atmel: fix TX path in atmel_console_write()
   e087ae68e87b tty/serial: atmel: fix race condition (TX+DMA)
   b3641939b1ae ACPI: Do not create a platform_device for IOAPIC/IOxAPIC
   000d2bb6c059 ACPI: Fix incompatibility with mcount-based function graph tracing
   76343bfbcafa parisc: Fix access fault handling in pa_memcpy()
   99e354a59ac5 parisc: Avoid stalled CPU warnings after system shutdown
   09b931fcb87c parisc: Clean up fixup routines for get_user()/put_user()
   3967cf7e6a91 nfsd: map the ENOKEY to nfserr_perm for avoiding warning
   461bbb90942a NFSv4.1 fix infinite loop on IO BAD_STATEID error
   80df2b3e185e mmc: sdhci-of-at91: fix MMC_DDR_52 timing selection
   fa3b4f4f574a mmc: sdhci: Disable runtime pm when the sdio_irq is enabled
   8d6c33224261 HID: wacom: Don't add ghost interface as shared data
   e5a134739151 ASoC: Intel: Skylake: fix invalid memory access due to wrong reference of pointer
   7a042a4eeb8d ASoC: atmel-classd: fix audio clock rate
   8aabccdc9d4f ALSA: hda - fix a problem for lineout on a Dell AIO machine
   74a2c1ff88a4 ALSA: seq: Fix race during FIFO resize
   0dd5b335ed69 PCI: iproc: Save host bridge window resource in struct iproc_pcie
   8f9155989f12 scsi: scsi_dh_alua: Ensure that alua_activate() calls the completion function
   68b275b7cbf0 scsi: scsi_dh_alua: Check scsi_device_get() return value
   cf31d6d21559 scsi: libsas: fix ata xfer length
   c2a869527865 scsi: sg: check length passed to SG_NEXT_CMD_LEN
   d5dbd1c95920 xfs: try any AG when allocating the first btree block when reflinking
   da617af8f0c6 xfs: use iomap new flag for newly allocated delalloc blocks
   77aedb0cbe6a xfs: Use xfs_icluster_size_fsb() to calculate inode alignment mask
   d07b5855ab7f xfs: fix and streamline error handling in xfs_end_io
   3b83a02af271 xfs: only reclaim unwritten COW extents periodically
   a24029369433 xfs: tune down agno asserts in the bmap code
   9559c48c1a7d xfs: Use xfs_icluster_size_fsb() to calculate inode chunk alignment
   5db7b41b607d xfs: don't reserve blocks for right shift transactions
   e5e2e56fd4dd xfs: fix uninitialized variable in _reflink_convert_cow
   c251c6c2dec9 xfs: split indlen reservations fairly when under reserved
   2d7c1c7ffafd xfs: handle indlen shortage on delalloc extent merge
   47d7d1ea6c5f xfs: don't fail xfs_extent_busy allocation
   5bbf5ba693ac xfs: reject all unaligned direct writes to reflinked files
   67eb7bf836af xfs: update ctime and mtime on clone destinatation inodes
   e060f4884c93 xfs: reset b_first_retry_time when clear the retry status of xfs_buf_t
   e02f0ff252f2 xfs: mark speculative prealloc CoW fork extents unwritten
   8370826f7d32 xfs: allow unwritten extents in the CoW fork
   3d2bd2fd5cba xfs: verify free block header fields
   4056a74aafba xfs: check for obviously bad level values in the bmbt root
   efab3ae29c15 xfs: filter out obviously bad btree pointers
   7e2dd1fb7102 xfs: fail _dir_open when readahead fails
   0a6844abacc1 xfs: fix toctou race when locking an inode to access the data map
   4127a5d9fb89 xfs: fix eofblocks race with file extending async dio writes
   4d725d7474df xfs: sync eofblocks scans under iolock are livelock prone
   798b1dc5cbdf xfs: pull up iolock from xfs_free_eofblocks()
   08a2a2681682 xfs: use per-AG reservations for the finobt
   9be1c33d4a99 xfs: only update mount/resv fields on success in __xfs_ag_resv_init
   8b08aec62c24 xen/setup: Don't relocate p2m over existing one
   860153772461 libceph: force GFP_NOIO for socket allocations
   f67677274670 Linux 4.9.20
   1dc3a068cc11 usb: musb: fix possible spinlock deadlock
   916c5cfeab40 sched/rt: Add a missing rescheduling point
   2984e52c75c6 fscrypt: remove broken support for detecting keyring key revocation
   21c95eca627b metag/ptrace: Reject partial NT_METAG_RPIPE writes
   2d6532ceb45b metag/ptrace: Provide default TXSTATUS for short NT_PRSTATUS
   2739b4874165 metag/ptrace: Preserve previous registers for short regset write
   84b94c4356c6 sparc/ptrace: Preserve previous registers for short regset write
   0ba34c87f7ce mips/ptrace: Preserve previous registers for short regset write
   616fe993f410 h8300/ptrace: Fix incorrect register transfer count
   d77bd2d6a478 c6x/ptrace: Remove useless PTRACE_SETREGSET implementation
   dd6054234bd8 pinctrl: qcom: Don't clear status bit on irq_unmask
   b82b2f930c2b virtio_balloon: init 1st buffer in stats vq
   3e8c6bd9dbc4 KVM: x86: cleanup the page tracking SRCU instance
   79191ea36dc9 xfrm_user: validate XFRM_MSG_NEWAE incoming ESN size harder
   64a5465799ee xfrm_user: validate XFRM_MSG_NEWAE XFRMA_REPLAY_ESN_VAL replay_window
   f68a09c7944e xfrm: policy: init locks early
   c8e131605de2 Linux 4.9.19
   bc959a402d1e crypto: algif_hash - avoid zero-sized array
   3fd37725c4e0 fbcon: Fix vc attr at deinit
   c75fe7899538 drm: reference count event->completion
   56769e7a0526 nl80211: fix dumpit error path RTNL deadlocks
   7b3c8b2a2e63 drm/bridge: analogix dp: Fix runtime PM state on driver bind
   eae72468c45d device-dax: fix pmd/pte fault fallback handling
   81ec3dc1de0a libceph: don't set weight to IN when OSD is destroyed
   df1fe6c9ad48 Drivers: hv: vmbus: Don't leak memory when a channel is rescinded
   b1f6b0a5a066 Drivers: hv: vmbus: Don't leak channel ids
   3076066bb507 intel_th: Don't leak module refcount on failure to activate
   b176a6eed370 jbd2: don't leak memory if setting up journal fails
   90f39ad2ce94 auxdisplay: img-ascii-lcd: add missing sentinel entry in img_ascii_lcd_matches
   9740abe0fd18 drm/amdgpu: reinstate oland workaround for sclk
   21d17f1b53ce blk-mq: don't complete un-started request in timeout handler
   62f6341c858b cgroup, net_cls: iterate the fds of only the tasks which are being migrated
   f565084692d6 cpufreq: Restore policy min/max limits on CPU online
   b9ed800f7188 arm64: kaslr: Fix up the kernel image alignment
   2ab97521ce11 ARM: at91: pm: cpu_idle: switch DDR to power-down mode
   ca5477ad190b Revert "ARM: at91/dt: sama5d2: Use new compatible for ohci node"
   352c0214b7f2 iommu/vt-d: Fix NULL pointer dereference in device_to_iommu
   bc63212d2271 xen/acpi: upload PM state from init-domain to Xen
   b1ef9daa50cc crypto: ccp - Assign DMA commands to the channel's CCP
   cb6e07ba5878 mwifiex: pcie: don't leak DMA buffers when removing
   35ef543eb372 clk: sunxi-ng: mp: Adjust parent rate for pre-dividers
   867f7804ce65 clk: sunxi-ng: sun6i: Fix enable bit offset for hdmi-ddc module clock
   c445f9969641 hwrng: geode - Revert managed API changes
   5d6f7b36111d hwrng: amd - Revert managed API changes
   0d69a8804134 mmc: sdhci-pci: Do not disable interrupts in sdhci_intel_set_power
   b43ba21b3523 mmc: sdhci: Do not disable interrupts while waiting for clock
   2ab2e879110b mmc: sdhci-of-arasan: fix incorrect timeout clock
   ace22e6fdb4f mmc: sdhci-of-at91: Support external regulators
   1e360905f61f powerpc/64s: Fix idle wakeup potential to clobber registers
   9a9dc3ec7ce1 ext4: lock the xattr block before checksuming it
   f572ba9a7138 ext4: mark inode dirty after converting inline directory
   0f29bcfdcf68 parport: fix attempt to write duplicate procfiles
   1e6b50335012 iio: magnetometer: ak8974: remove incorrect __exit markups
   9808ff151781 iio: hid-sensor-trigger: Change get poll value function order to avoid sensor properties losing after resume from S3
   cf43d679ccc5 iio: sw-device: Fix config group initialization
   ec271b0e05b2 iio: adc: ti_am335x_adc: fix fifo overrun recovery
   dfcacd07bf06 mmc: ushc: fix NULL-deref at probe
   2e7486a05b81 uwb: hwa-rc: fix NULL-deref at probe
   f01c54fe0a8f uwb: i1480-dfu: fix NULL-deref at probe
   5e50afb2273c USB: usbtmc: fix probe error path
   73c4e2ede5a9 USB: usbtmc: add missing endpoint sanity check
   4e615886770a usb: hub: Fix crash after failure to read BOS descriptor
   51a3f3ec531a usb: musb: cppi41: don't check early-TX-interrupt for Isoch transfer
   46aeeb2ac18a USB: wusbcore: fix NULL-deref at probe
   a4887ea588e9 USB: idmouse: fix NULL-deref at probe
   21e0621e3cd7 USB: lvtest: fix NULL-deref at probe
   e4942716bb78 USB: uss720: fix NULL-deref at probe
   222ccd4f837b usb-core: Add LINEAR_FRAME_INTR_BINTERVAL USB quirk
   d8ec35ad8b36 usb: gadget: f_uvc: Fix SuperSpeed companion descriptor's wBytesPerInterval
   ff8d97a822c6 ACM gadget: fix endianness in notifications
   381420a46ae5 USB: serial: qcserial: add Dell DW5811e
   21586e4dcc9b USB: serial: option: add Quectel UC15, UC20, EC21, and EC25 modems
   0fe8771373c2 ALSA: hda - Adding a group of pin definition to fix headset problem
   e800ff1fade6 ALSA: ctxfi: Fix the incorrect check of dma_set_mask() call
   ca79952dfc63 ALSA: seq: Fix racy cell insertions during snd_seq_pool_done()
   425823646eae Input: sur40 - validate number of endpoints before using them
   b1feb4e5aab4 Input: kbtab - validate number of endpoints before using them
   83d920e464fa Input: cm109 - validate number of endpoints before using them
   9f6a8dca9874 Input: yealink - validate number of endpoints before using them
   d9a3e6424e61 Input: hanwang - validate number of endpoints before using them
   1f5a512844a8 Input: ims-pcu - validate number of endpoints before using them
   0afac79f6696 Input: iforce - validate number of endpoints before using them
   de2ba8081e6d Input: i8042 - add noloop quirk for Dell Embedded Box PC 3000
   3c9da7cfb7cf Input: elan_i2c - add ASUS EeeBook X205TA special touchpad fw
   4ccef6bd3a02 Input: ALPS - fix trackstick button handling on V8 devices
   81643d000315 Input: ALPS - fix V8+ protocol handling (73 03 28)
   9e13bcef2469 tcp: initialize icsk_ack.lrcvtime at session start time
   a53ea6051c7f socket, bpf: fix sk_filter use after free in sk_clone_lock
   62e85fe59072 ipv4: provide stronger user input validation in nl_fib_input()
   2f94dd54cfe6 net: bcmgenet: remove bcmgenet_internal_phy_setup()
   d80caeb9b86d ipv6: make sure to initialize sockc.tsflags before first use
   c87ef8734d25 net/mlx5e: Count LRO packets correctly
   36bb24fadbaa net/mlx5e: Count GSO packets correctly
   0ceb7181e876 net/mlx5: Increase number of max QPs in default profile
   38d23e13ba07 net/mlx5e: Use the proper UAPI values when offloading TC vlan actions
   f375f73c720b net/mlx5: Add missing entries for set/query rate limit commands
   4e7c821b6862 net: vrf: Reset rt6i_idev in local dst after put
   4b9b7f17bab1 qmi_wwan: add Dell DW5811e
   91ad0c0885c8 net: unix: properly re-increment inflight counter of GC discarded candidates
   ef7c1e297d44 openvswitch: Add missing case OVS_TUNNEL_KEY_ATTR_PAD
   fafc9555d87a amd-xgbe: Fix jumbo MTU processing on newer hardware
   e9c1b1ab1225 net: properly release sk_frag.page
   4d5bc781eb2c net: bcmgenet: Do not suspend PHY if Wake-on-LAN is enabled
   03e9554ac48f net/openvswitch: Set the ipv6 source tunnel key address attribute correctly
   2a486264b736 Linux 4.9.18
   c2eeabe94145 ext4: fix fencepost in s_first_meta_bg validation
   dea2f1e0c5e9 drm/amdgpu/si: add dpm quirk for Oland
   228514bf2430 cgroup/pids: remove spurious suspicious RCU usage warning
   3f406ecddf8a percpu: acquire pcpu_lock when updating pcpu_nr_empty_pop_pages
   a33e71c5f0cb gfs2: Avoid alignment hole in struct lm_lockname
   c795d8780cc8 isdn/gigaset: fix NULL-deref at probe
   033850b95300 target: Fix VERIFY_16 handling in sbc_parse_cdb
   de1ff848c74f scsi: libiscsi: add lock around task lists to fix list corruption regression
   42ba2c265b08 scsi: lpfc: Add shutdown method for kexec
   f8e24eab9bcd target/pscsi: Fix TYPE_TAPE + TYPE_MEDIMUM_CHANGER export
   ad5166415ff3 md/raid1/10: fix potential deadlock
   4265e0b487da powerpc/boot: Fix zImage TOC alignment
   bb8c61ad784d cpufreq: Fix and clean up show_cpuinfo_cur_freq()
   b76d4fb2d944 NFS prevent double free in async nfs4_exchange_id
   87144ec25091 xprtrdma: Squelch kbuild sparse complaint
   69efd8e21246 perf/core: Fix event inheritance on fork()
   c04a938229e7 perf/core: Fix use-after-free in perf_release()
   13695ce5b102 parisc: Fix system shutdown halt
   a690a42ae7b9 parisc: Optimize flush_kernel_vmap_range and invalidate_kernel_vmap_range
   66e70bdca599 qla2xxx: Fix request queue corruption.
   c5ad350d6144 qla2xxx: Fix memory leak for abts processing
   85f687708c81 give up on gcc ilog2() constant optimizations
   2bbcbc24474e drm/vc4: Use runtime autosuspend to avoid thrashing V3D power state.
   dd0b0e22a588 drm/vc4: Fix termination of the initial scan for branch targets.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 63a8a3412d80..4ca7883122f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "95acaf7dbc800201295e6eb9f9a37ac24c53001b"
-SRCREV_meta ?= "8b97a445fab217b545fff10c27be8f60853f29de"
+SRCREV_machine ?= "b6f5c933ce66e4a00412bb5c5691a2ab4187c979"
+SRCREV_meta ?= "803b8d600e45afa0375459bf599fe365571a3866"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.17"
+LINUX_VERSION ?= "4.9.21"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 2dc233e57d11..62aedb37de36 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.17"
+LINUX_VERSION ?= "4.9.21"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e675c4ecccb9dd9dd637f104e32b7808b4d56846"
-SRCREV_meta ?= "8b97a445fab217b545fff10c27be8f60853f29de"
+SRCREV_machine ?= "81055b89bd32414ecaf95156ce9a5fa6643e530a"
+SRCREV_meta ?= "803b8d600e45afa0375459bf599fe365571a3866"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index 54fafae66305..d6b96ed873d6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "3ff3760c2ac7cfd04904b3c9ac36567cf75594bf"
-SRCREV_machine_qemuarm64 ?= "e675c4ecccb9dd9dd637f104e32b7808b4d56846"
-SRCREV_machine_qemumips ?= "53bf87a63316d6355be679f0f10bdaf694a94424"
-SRCREV_machine_qemuppc ?= "e675c4ecccb9dd9dd637f104e32b7808b4d56846"
-SRCREV_machine_qemux86 ?= "e675c4ecccb9dd9dd637f104e32b7808b4d56846"
-SRCREV_machine_qemux86-64 ?= "e675c4ecccb9dd9dd637f104e32b7808b4d56846"
-SRCREV_machine_qemumips64 ?= "c7eee598e73eb4b6eb1e9d203e6e84e63a4a278a"
-SRCREV_machine ?= "e675c4ecccb9dd9dd637f104e32b7808b4d56846"
-SRCREV_meta ?= "8b97a445fab217b545fff10c27be8f60853f29de"
+SRCREV_machine_qemuarm ?= "bb5856d9b25d13c63a757a408cc8793d6f6302fa"
+SRCREV_machine_qemuarm64 ?= "81055b89bd32414ecaf95156ce9a5fa6643e530a"
+SRCREV_machine_qemumips ?= "4b150e5ceca8b2c4fb01f74b1f7a57cdeae63762"
+SRCREV_machine_qemuppc ?= "81055b89bd32414ecaf95156ce9a5fa6643e530a"
+SRCREV_machine_qemux86 ?= "81055b89bd32414ecaf95156ce9a5fa6643e530a"
+SRCREV_machine_qemux86-64 ?= "81055b89bd32414ecaf95156ce9a5fa6643e530a"
+SRCREV_machine_qemumips64 ?= "b300b94b77ed9fbb1c80a2d2441403ad2b7694a9"
+SRCREV_machine ?= "81055b89bd32414ecaf95156ce9a5fa6643e530a"
+SRCREV_meta ?= "803b8d600e45afa0375459bf599fe365571a3866"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.17"
+LINUX_VERSION ?= "4.9.21"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


