Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.1007.1629822370707707263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:26:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360298"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360298"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:56 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455658987"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:54 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 15/28] linux-yocto/5.4: update to v5.4.137
Date: Wed, 25 Aug 2021 00:25:17 +0800
Message-Id: <a27c038ed28d825aeb549368543a839c89a9a965.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    5b1de8e15f0f Linux 5.4.137
    ebb1b38be0c9 ipv6: ip6_finish_output2: set sk into newly allocated nskb
    6c04123962f0 ARM: dts: versatile: Fix up interrupt controller node names
    befa900533a9 iomap: remove the length variable in iomap_seek_hole
    83fb41b2f6e4 iomap: remove the length variable in iomap_seek_data
    302e1acd4c26 cifs: fix the out of range assignment to bit fields in parse_server_interfaces
    02a470e3c64a firmware: arm_scmi: Fix range check for the maximum number of pending messages
    289dd584319f firmware: arm_scmi: Fix possible scmi_linux_errmap buffer overflow
    e3acb292f092 hfs: add lock nesting notation to hfs_find_init
    af1178296d77 hfs: fix high memory mapping in hfs_bnode_read
    89136a47e2e7 hfs: add missing clean-up in hfs_fill_super
    ded37d03440d ipv6: allocate enough headroom in ip6_finish_output2()
    f65b7f377cca sctp: move 198 addresses from unusable to private scope
    c8d32973ee6a net: annotate data race around sk_ll_usec
    c23b9a5610f9 net/802/garp: fix memleak in garp_request_join()
    88c4cae3ed25 net/802/mrp: fix memleak in mrp_request_join()
    eef99860c677 cgroup1: fix leaked context root causing sporadic NULL deref in LTP
    7f0365b4daaa workqueue: fix UAF in pwq_unbound_release_workfn()
    85abe0d47fe6 af_unix: fix garbage collect vs MSG_PEEK
    af45f3527aa0 KVM: x86: determine if an exception has an error code only when injecting it.
    828cab3c8c23 tools: Allow proper CC/CXX/... override with LLVM=1 in Makefile.include
    525c5513b60d selftest: fix build error in tools/testing/selftests/vm/userfaultfd.c
    253dccefb5cb Linux 5.4.136
    587f86b7a2a0 xhci: add xhci_get_virt_ep() helper
    f9d0c35556cd perf inject: Close inject.output on exit
    a9c103fa91e4 PCI: Mark AMD Navi14 GPU ATS as broken
    11561d2f7b9d btrfs: compression: don't try to compress if we don't have enough pages
    4980301e1c1f iio: accel: bma180: Fix BMA25x bandwidth register values
    d04f2582c47e iio: accel: bma180: Use explicit member assignment
    4e0afa88954b net: bcmgenet: ensure EXT_ENERGY_DET_MASK is clear
    2a4865d1547e net: dsa: mv88e6xxx: use correct .stats_set_histogram() on Topaz
    7d8c06b8d2d2 drm: Return -ENOTTY for non-drm ioctls
    b5d7bebd96a3 nds32: fix up stack guard gap
    ba378b796088 rbd: always kick acquire on "acquired" and "released" notifications
    13066d6628f0 rbd: don't hold lock_rwsem while running_list is being drained
    b12ead825f6c hugetlbfs: fix mount mode command line processing
    60dbbd76f110 userfaultfd: do not untag user pointers
    540eee8cbb3d selftest: use mmap instead of posix_memalign to allocate memory
    e706ac3fc82e ixgbe: Fix packet corruption due to missing DMA sync
    e617fa62f6cf media: ngene: Fix out-of-bounds bug in ngene_command_config_free_buf()
    77713fb336ca btrfs: check for missing device in btrfs_trim_fs
    f899f24d34d9 tracing: Fix bug in rb_per_cpu_empty() that might cause deadloop.
    59a9f75fb2b6 tracing/histogram: Rename "cpu" to "common_cpu"
    379d8da3353e firmware/efi: Tell memblock about EFI iomem reservations
    281a94362bbe usb: dwc2: gadget: Fix sending zero length packet in DDMA mode.
    167079fbfaa7 USB: serial: cp210x: add ID for CEL EM3588 USB ZigBee stick
    811c4cdf2917 USB: serial: cp210x: fix comments for GE CS1000
    f54ee7e16d0d USB: serial: option: add support for u-blox LARA-R6 family
    e28d28eb9be6 usb: renesas_usbhs: Fix superfluous irqs happen after usb_pkt_pop()
    863d071dbcd5 usb: max-3421: Prevent corruption of freed memory
    e4077a90e600 USB: usb-storage: Add LaCie Rugged USB3-FW to IGNORE_UAS
    da6f6769ee0f usb: hub: Fix link power management max exit latency (MEL) calculations
    fea6b53e631a usb: hub: Disable USB 3 device initiated lpm if exit latency is too high
    962ce043ef92 KVM: PPC: Book3S HV Nested: Sanitise H_ENTER_NESTED TM state
    2b9ffddd70b4 KVM: PPC: Book3S: Fix H_RTAS rets buffer overflow
    c968f563ccde xhci: Fix lost USB 2 remote wake
    a660ecde5c55 ALSA: hdmi: Expose all pins on MSI MS-7C94 board
    f73696354d59 ALSA: sb: Fix potential ABBA deadlock in CSP driver
    7aa2dfbc6bd0 ALSA: usb-audio: Add registration quirk for JBL Quantum headsets
    46d62c3fe2ab ALSA: usb-audio: Add missing proc text entry for BESPOKEN type
    f1754f96ab41 s390/boot: fix use of expolines in the DMA code
    8eb521d19248 s390/ftrace: fix ftrace_update_ftrace_func implementation
    268132b070d9 Revert "MIPS: add PMD table accounting into MIPS'pmd_alloc_one"
    f323809e3108 proc: Avoid mixing integer types in mem_rw()
    b71a75209f6a drm/panel: raspberrypi-touchscreen: Prevent double-free
    2e6ab87f8e63 net: sched: cls_api: Fix the the wrong parameter
    b60461696a0b sctp: update active_key for asoc when old key is being replaced
    9fa89c2caee2 nvme: set the PRACT bit when using Write Zeroes with T10 PI
    c50141b3d769 r8169: Avoid duplicate sysfs entry creation error
    f726817d6b42 afs: Fix tracepoint string placement with built-in AFS
    b22c9e433bb7 Revert "USB: quirks: ignore remote wake-up on Fibocom L850-GL LTE modem"
    69a49e7b5baf nvme-pci: don't WARN_ON in nvme_reset_work if ctrl.state is not RESETTING
    830251361425 ipv6: fix another slab-out-of-bounds in fib6_nh_flush_exceptions
    a88414fb1117 net/sched: act_skbmod: Skip non-Ethernet packets
    c278b954ccc7 net: hns3: fix rx VLAN offload state inconsistent issue
    006ed6f4d00b net/tcp_fastopen: fix data races around tfo_active_disable_stamp
    3942ba235693 net: hisilicon: rename CACHE_LINE_MASK to avoid redefinition
    f11f12decd55 bnxt_en: Check abort error state in bnxt_half_open_nic()
    16ce6cb78690 bnxt_en: Add missing check for BNXT_STATE_ABORT_ERR in bnxt_fw_rset_task()
    c993e7aadc50 bnxt_en: Refresh RoCE capabilities in bnxt_ulp_probe()
    6ee8e6be3067 bnxt_en: Improve bnxt_ulp_stop()/bnxt_ulp_start() call sequence.
    35637acc9810 spi: cadence: Correct initialisation of runtime PM again
    2f2150bf41c1 scsi: target: Fix protect handling in WRITE SAME(32)
    a6cb717f8534 scsi: iscsi: Fix iface sysfs attr detection
    25df44e90ff5 netrom: Decrease sock refcount when sock timers expire
    8d7924ce85ba net: sched: fix memory leak in tcindex_partial_destroy_work
    f38527f18905 KVM: PPC: Fix kvm_arch_vcpu_ioctl vcpu_load leak
    b85dadd4347b KVM: PPC: Book3S: Fix CONFIG_TRANSACTIONAL_MEM=n crash
    b3224bd31861 net: decnet: Fix sleeping inside in af_decnet
    bd2b3b13aa2a efi/tpm: Differentiate missing and invalid final event log table.
    9413c0abb57f net: fix uninit-value in caif_seqpkt_sendmsg
    6d56299ff911 bpftool: Check malloc return value in mount_bpffs_for_pin
    edec10098675 bpf, sockmap, tcp: sk_prot needs inuse_idx set for proc stats
    58259e8b6e85 s390/bpf: Perform r1 range checking before accessing jit->seen_reg[r1]
    cc876a5618bc liquidio: Fix unintentional sign extension issue on left shift of u16
    42fe8f433b31 ASoC: rt5631: Fix regcache sync errors on resume
    d99aaf07365f spi: mediatek: fix fifo rx mode
    08cdda8d8972 regulator: hi6421: Fix getting wrong drvdata
    b25be6bf6419 regulator: hi6421: Use correct variable type for regmap api val argument
    a1ade24cccb5 spi: stm32: fixes pm_runtime calls in probe/remove
    40e203ce74eb spi: stm32: Use dma_request_chan() instead dma_request_slave_channel()
    24b78097a837 spi: imx: add a check for speed_hz before calculating the clock
    52cff6123aa0 perf data: Close all files in close_dir()
    0f63857d1099 perf probe-file: Delete namelist in del_events() on the error path
    8b92ea243bbf perf lzma: Close lzma stream on exit
    51351c6d5a18 perf script: Fix memory 'threads' and 'cpus' leaks on exit
    d2bfc3eda914 perf dso: Fix memory leak in dso__new_map()
    05804a7d223d perf test event_update: Fix memory leak of evlist
    d257f3abdc71 perf test session_topology: Delete session->evlist
    89d1762a4a21 perf env: Fix sibling_dies memory leak
    fd335143befb perf probe: Fix dso->nsinfo refcounting
    6513dee46f80 perf map: Fix dso->nsinfo refcounting
    ff9fc81fa884 nvme-pci: do not call nvme_dev_remove_admin from nvme_remove
    d029df83c61a cxgb4: fix IRQ free race during driver unload
    ae9b64434441 pwm: sprd: Ensure configuring period and duty_cycle isn't wrongly skipped
    a37ca2a076ec selftests: icmp_redirect: IPv6 PMTU info should be cleared after redirect
    05364a2794fb selftests: icmp_redirect: remove from checking for IPv6 route get
    7f4848229e91 ipv6: fix 'disable_policy' for fwd packets
    c67fb96f5431 gve: Fix an error handling path in 'gve_probe()'
    e33da4eeaa35 igb: Fix position of assignment to *ring
    7dd897773618 igb: Check if num of q_vectors is smaller than max before array access
    d3d7cceee841 iavf: Fix an error handling path in 'iavf_probe()'
    7a13a8a8a5fb e1000e: Fix an error handling path in 'e1000_probe()'
    9fc381db7583 fm10k: Fix an error handling path in 'fm10k_probe()'
    5d6a04927b08 igb: Fix an error handling path in 'igb_probe()'
    cddd53237de8 igc: Fix an error handling path in 'igc_probe()'
    47f69d8828e7 igc: Prefer to use the pci_release_mem_regions method
    83b2d55a512a ixgbe: Fix an error handling path in 'ixgbe_probe()'
    ba4fbb68fcfe igc: change default return of igc_read_phy_reg()
    88e0720133d4 igb: Fix use-after-free error during reset
    a9508e0edfe3 igc: Fix use-after-free error during reset

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d308f120891e23c34fa8ae38a7e87aa3810518ae)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 0b5afd83cf..d8a02f567f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f4e30367bf1e579ff497fc9e7a16010c879048dc"
-SRCREV_meta ?= "231d3a07e10680c7c89ea101cd803b0684482b11"
+SRCREV_machine ?= "c2634e34da0641aafe30fd3fb924386dd62f4941"
+SRCREV_meta ?= "cfd547115bc4d65c29f0f4313bd950976f41ebd8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.135"
+LINUX_VERSION ?= "5.4.137"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index d7911cd54e..dd2a9cbcc0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.135"
+LINUX_VERSION ?= "5.4.137"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "fa414639057bbad7acd21a1a70a3847f9be469c0"
-SRCREV_machine ?= "c81f0e376b1fce7a1198eec7b286966d98eae44d"
-SRCREV_meta ?= "231d3a07e10680c7c89ea101cd803b0684482b11"
+SRCREV_machine_qemuarm ?= "a51fc55766d4ae07f7b67adc4c9d3b07a1d1d475"
+SRCREV_machine ?= "4c6ef497d892e3b5846a60fdd6f2a6df7177f570"
+SRCREV_meta ?= "cfd547115bc4d65c29f0f4313bd950976f41ebd8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 4ac84e8ca3..841c2ae811 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "f367cbe6d0c21c65257c66a4c9b1845fd43285f8"
-SRCREV_machine_qemuarm64 ?= "8dcb7ee83e58da8bf51ed8b72165e1ed35beb928"
-SRCREV_machine_qemumips ?= "3d4c6263bfdf95960894b75c76aa450d240e3e8e"
-SRCREV_machine_qemuppc ?= "125a824c8d14c49b640bc0d6e040d495177caa10"
-SRCREV_machine_qemuriscv64 ?= "997c04e7a40084a53bc3d45490949584364697bd"
-SRCREV_machine_qemux86 ?= "997c04e7a40084a53bc3d45490949584364697bd"
-SRCREV_machine_qemux86-64 ?= "997c04e7a40084a53bc3d45490949584364697bd"
-SRCREV_machine_qemumips64 ?= "7082f58984404a5aad90bca1dac4e27773fff26e"
-SRCREV_machine ?= "997c04e7a40084a53bc3d45490949584364697bd"
-SRCREV_meta ?= "231d3a07e10680c7c89ea101cd803b0684482b11"
+SRCREV_machine_qemuarm ?= "88d3d4ec2c23ed165ee11dd9fc48ac77fee480ba"
+SRCREV_machine_qemuarm64 ?= "7cad0ac3beb6fc0a1f84dc079d0e6a68fedb3df4"
+SRCREV_machine_qemumips ?= "d8b1cb081cbfa6a7157561d61ce383bc661208d8"
+SRCREV_machine_qemuppc ?= "528a4de381c0a22e9eeebe899e159ed8d4fccff3"
+SRCREV_machine_qemuriscv64 ?= "90d297d951740cd13553072fb00afbf39045d38a"
+SRCREV_machine_qemux86 ?= "90d297d951740cd13553072fb00afbf39045d38a"
+SRCREV_machine_qemux86-64 ?= "90d297d951740cd13553072fb00afbf39045d38a"
+SRCREV_machine_qemumips64 ?= "29b36c7b1c51b5322cba165dd11b435ad9439adf"
+SRCREV_machine ?= "90d297d951740cd13553072fb00afbf39045d38a"
+SRCREV_meta ?= "cfd547115bc4d65c29f0f4313bd950976f41ebd8"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.135"
+LINUX_VERSION ?= "5.4.137"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1

