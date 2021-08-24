Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.1007.1629822370707707263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Aug 2021 09:26:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="278360281"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="278360281"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:54 -0700
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="455658981"
Received: from asmawa1x-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.13])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:25:52 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 14/28] linux-yocto/5.10: update to v5.10.55
Date: Wed, 25 Aug 2021 00:25:16 +0800
Message-Id: <90bd29b266d4816b765352f841103d1a1bb36adf.1629821028.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629821028.git.anuj.mittal@intel.com>
References: <cover.1629821028.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    11fe69a17195 Linux 5.10.55
    984e93b8e207 ipv6: ip6_finish_output2: set sk into newly allocated nskb
    a74054ca7553 ARM: dts: versatile: Fix up interrupt controller node names
    3510b9b41c70 iomap: remove the length variable in iomap_seek_hole
    8659186e72d0 iomap: remove the length variable in iomap_seek_data
    65039407489c cifs: fix the out of range assignment to bit fields in parse_server_interfaces
    fe5fe0b1c8b9 firmware: arm_scmi: Fix range check for the maximum number of pending messages
    8f8e5475a369 firmware: arm_scmi: Fix possible scmi_linux_errmap buffer overflow
    d01328fef6af hfs: add lock nesting notation to hfs_find_init
    06b3d9923fa0 hfs: fix high memory mapping in hfs_bnode_read
    680b2917e60e hfs: add missing clean-up in hfs_fill_super
    5c3d753b872a drm/ttm: add a check against null pointer dereference
    2323690eb058 ipv6: allocate enough headroom in ip6_finish_output2()
    86cb49e7314e rcu-tasks: Don't delete holdouts within trc_wait_for_one_reader()
    55ddab2bfd70 rcu-tasks: Don't delete holdouts within trc_inspect_reader()
    4d972881f8d8 sctp: move 198 addresses from unusable to private scope
    915226f31fd4 net: annotate data race around sk_ll_usec
    92289f58f01d net/802/garp: fix memleak in garp_request_join()
    5d93810761b4 net/802/mrp: fix memleak in mrp_request_join()
    df34f888628e cgroup1: fix leaked context root causing sporadic NULL deref in LTP
    dcd00801f3d9 workqueue: fix UAF in pwq_unbound_release_workfn()
    93c5951e0ce1 af_unix: fix garbage collect vs MSG_PEEK
    dee8119eaa9e KVM: x86: determine if an exception has an error code only when injecting it.
    6f5d7a45f58d io_uring: fix link timeout refs
    475312897ea6 tools: Allow proper CC/CXX/... override with LLVM=1 in Makefile.include
    08277b9dde63 Linux 5.10.54
    c9f8e17990e0 skbuff: Fix build with SKB extensions disabled
    ba28765d338a xhci: add xhci_get_virt_ep() helper
    624290f368af sfc: ensure correct number of XDP queues
    1df4fe5a8871 drm/i915/gvt: Clear d3_entered on elsp cmd submission.
    c938e65768e0 usb: ehci: Prevent missed ehci interrupts with edge-triggered MSI
    25af91a806d2 perf inject: Close inject.output on exit
    fb35426d123e Documentation: Fix intiramfs script name
    570341f10ecc skbuff: Release nfct refcount on napi stolen or re-used skbs
    31828ffdab19 bonding: fix build issue
    c9d97b7bb897 PCI: Mark AMD Navi14 GPU ATS as broken
    f7ee361182e0 net: dsa: mv88e6xxx: enable SerDes PCS register dump via ethtool -d on Topaz
    30f1d4d03641 net: dsa: mv88e6xxx: enable SerDes RX stats for Topaz
    fc31b5be1383 drm/amdgpu: update golden setting for sienna_cichlid
    69a603aa170e drm: Return -ENOTTY for non-drm ioctls
    2831eeb7bc3d driver core: Prevent warning when removing a device link from unregistered consumer
    0e759383236a nds32: fix up stack guard gap
    7497f4c91da3 misc: eeprom: at24: Always append device id even if label property is set.
    8571daace5a6 rbd: always kick acquire on "acquired" and "released" notifications
    2f3731de5e69 rbd: don't hold lock_rwsem while running_list is being drained
    92291fa2d144 hugetlbfs: fix mount mode command line processing
    1a25c5738d0c memblock: make for_each_mem_range() traverse MEMBLOCK_HOTPLUG regions
    0b591c020d28 userfaultfd: do not untag user pointers
    fca5343b4892 io_uring: remove double poll entry on arm failure
    9eef9029151c io_uring: explicitly count entries for poll reqs
    1077e2b15283 selftest: use mmap instead of posix_memalign to allocate memory
    6e81e2c38a38 posix-cpu-timers: Fix rearm racing against process tick
    3efec3b4b16f bus: mhi: core: Validate channel ID when processing command completions
    b3f3a58a86c4 ixgbe: Fix packet corruption due to missing DMA sync
    e991457afdcb media: ngene: Fix out-of-bounds bug in ngene_command_config_free_buf()
    755971dc7ee8 btrfs: check for missing device in btrfs_trim_fs
    552b053f1a53 tracing: Synthetic event field_pos is an index not a boolean
    757bdba8026b tracing: Fix bug in rb_per_cpu_empty() that might cause deadloop.
    a5e1aff58943 tracing/histogram: Rename "cpu" to "common_cpu"
    0edad8b9f65d tracepoints: Update static_call before tp_funcs when adding a tracepoint
    4ed4074c6c6c firmware/efi: Tell memblock about EFI iomem reservations
    647e26b03ee9 usb: typec: stusb160x: register role switch before interrupt registration
    a206167bd638 usb: dwc2: gadget: Fix sending zero length packet in DDMA mode.
    f2c04f6b21ef usb: dwc2: gadget: Fix GOUTNAK flow for Slave mode.
    7073acb51a3b usb: gadget: Fix Unbalanced pm_runtime_enable in tegra_xudc_probe
    1bf7371b9004 USB: serial: cp210x: add ID for CEL EM3588 USB ZigBee stick
    45c87a94336f USB: serial: cp210x: fix comments for GE CS1000
    f528521c1574 USB: serial: option: add support for u-blox LARA-R6 family
    311fd7f7f186 usb: renesas_usbhs: Fix superfluous irqs happen after usb_pkt_pop()
    7af54a4e221e usb: max-3421: Prevent corruption of freed memory
    69da81a96442 USB: usb-storage: Add LaCie Rugged USB3-FW to IGNORE_UAS
    e6343aab3ee7 usb: hub: Fix link power management max exit latency (MEL) calculations
    8f087b4cf1a3 usb: hub: Disable USB 3 device initiated lpm if exit latency is too high
    709137c85327 KVM: PPC: Book3S HV Nested: Sanitise H_ENTER_NESTED TM state
    c1fbdf0f3c26 KVM: PPC: Book3S: Fix H_RTAS rets buffer overflow
    e3eb672c169d xhci: Fix lost USB 2 remote wake
    02e2e96ba56c usb: xhci: avoid renesas_usb_fw.mem when it's unusable
    9e9cf23b77d4 Revert "usb: renesas-xhci: Fix handling of unknown ROM state"
    ebaa67086fae ALSA: pcm: Fix mmap capability check
    431e31105579 ALSA: pcm: Call substream ack() method upon compat mmap commit
    3c9afa23f3fc ALSA: hdmi: Expose all pins on MSI MS-7C94 board
    253759df8082 ALSA: hda/realtek: Fix pop noise and 2 Front Mic issues on a machine
    2b3cdf581993 ALSA: sb: Fix potential ABBA deadlock in CSP driver
    5858c8a46421 ALSA: usb-audio: Add registration quirk for JBL Quantum headsets
    2de518548de1 ALSA: usb-audio: Add missing proc text entry for BESPOKEN type
    37a88b41dc29 s390/boot: fix use of expolines in the DMA code
    d1ab96288061 s390/ftrace: fix ftrace_update_ftrace_func implementation
    3b4009b49634 mmc: core: Don't allocate IDA for OF aliases
    fc6ac92cfcab proc: Avoid mixing integer types in mem_rw()
    76f7eae7ec80 cifs: fix fallocate when trying to allocate a hole.
    c26372b8a8c3 cifs: only write 64kb at a time when fallocating a small region of a file
    b91e5b63470d drm/panel: raspberrypi-touchscreen: Prevent double-free
    9e0373945ed6 net: sched: cls_api: Fix the the wrong parameter
    c8ebf135c199 net: dsa: sja1105: make VID 4095 a bridge VLAN too
    164294d09c47 tcp: disable TFO blackhole logic by default
    8eb225873246 sctp: update active_key for asoc when old key is being replaced
    ef799bd8ff5a nvme: set the PRACT bit when using Write Zeroes with T10 PI
    7850f03ed814 r8169: Avoid duplicate sysfs entry creation error
    0f5dc3971473 afs: Fix tracepoint string placement with built-in AFS
    711057846aa7 Revert "USB: quirks: ignore remote wake-up on Fibocom L850-GL LTE modem"
    8985dc2cabd6 nvme-pci: don't WARN_ON in nvme_reset_work if ctrl.state is not RESETTING
    fb28b1592098 ceph: don't WARN if we're still opening a session to an MDS
    ce8fafb68051 ipv6: fix another slab-out-of-bounds in fib6_nh_flush_exceptions
    071729150be9 net/sched: act_skbmod: Skip non-Ethernet packets
    ee36bb471389 spi: spi-bcm2835: Fix deadlock
    432738c9740c net: hns3: fix rx VLAN offload state inconsistent issue
    3e903e0b578b net: hns3: fix possible mismatches resp of mailbox
    f4305375f031 ALSA: hda: intel-dsp-cfg: add missing ElkhartLake PCI ID
    41a839437a07 net/tcp_fastopen: fix data races around tfo_active_disable_stamp
    ba3336397677 net: hisilicon: rename CACHE_LINE_MASK to avoid redefinition
    320dcbdec4c6 bnxt_en: Check abort error state in bnxt_half_open_nic()
    134a0536f0a4 bnxt_en: Validate vlan protocol ID on RX packets
    4f7da0f97beb bnxt_en: Add missing check for BNXT_STATE_ABORT_ERR in bnxt_fw_rset_task()
    927370485e98 bnxt_en: Refresh RoCE capabilities in bnxt_ulp_probe()
    ab830c3bae19 bnxt_en: don't disable an already disabled PCI device
    26463689445d ACPI: Kconfig: Fix table override from built-in initrd
    113ce8c5043a spi: cadence: Correct initialisation of runtime PM again
    3ea448b62b49 scsi: target: Fix protect handling in WRITE SAME(32)
    b82a1a26aaee scsi: iscsi: Fix iface sysfs attr detection
    6811744bd0ef netrom: Decrease sock refcount when sock timers expire
    096a8dca8ca5 sctp: trim optlen when it's a huge value in sctp_setsockopt
    8e9662fde6d6 net: sched: fix memory leak in tcindex_partial_destroy_work
    e14ef1095387 KVM: PPC: Fix kvm_arch_vcpu_ioctl vcpu_load leak
    fcbad8e18d31 KVM: PPC: Book3S: Fix CONFIG_TRANSACTIONAL_MEM=n crash
    30b830215158 net: decnet: Fix sleeping inside in af_decnet
    d402c60da0fd efi/tpm: Differentiate missing and invalid final event log table.
    898376690310 dma-mapping: handle vmalloc addresses in dma_common_{mmap,get_sgtable}
    115e4f5b64ae usb: hso: fix error handling code of hso_create_net_device
    1582a02fecff net: fix uninit-value in caif_seqpkt_sendmsg
    2fc8048265ce bpftool: Check malloc return value in mount_bpffs_for_pin
    3b5b0afd8d97 bpf, sockmap, udp: sk_prot needs inuse_idx set for proc stats
    c260442431b4 bpf, sockmap, tcp: sk_prot needs inuse_idx set for proc stats
    715f378f4290 bpf, sockmap: Fix potential memory leak on unlikely error case
    e3a9548ae538 s390/bpf: Perform r1 range checking before accessing jit->seen_reg[r1]
    9264bebe9ef9 liquidio: Fix unintentional sign extension issue on left shift of u16
    0ff2ea9d8fa3 timers: Fix get_next_timer_interrupt() with no timers pending
    ca9ba1de8f09 xdp, net: Fix use-after-free in bpf_xdp_link_release
    39f1735c8107 bpf: Fix tail_call_reachable rejection for interpreter when jit failed
    2b4046e64f7d bpf, test: fix NULL pointer dereference on invalid expected_attach_type
    3dba72d1fc01 ASoC: rt5631: Fix regcache sync errors on resume
    2435dcfd16ac spi: mediatek: fix fifo rx mode
    a9a85bfedd83 regulator: hi6421: Fix getting wrong drvdata
    5cdc986aad95 regulator: hi6421: Use correct variable type for regmap api val argument
    23811b75fdb8 spi: stm32: fixes pm_runtime calls in probe/remove
    844ab04b62a5 spi: imx: add a check for speed_hz before calculating the clock
    3b6c430d1248 ASoC: wm_adsp: Correct wm_coeff_tlv_get handling
    57efe4f82a76 perf sched: Fix record failure when CONFIG_SCHEDSTATS is not set
    61f2e1e79578 perf data: Close all files in close_dir()
    7c91e0ce2601 perf probe-file: Delete namelist in del_events() on the error path
    a6c32317cd3d perf lzma: Close lzma stream on exit
    2ae8f40a8fdf perf script: Fix memory 'threads' and 'cpus' leaks on exit
    51077d315a46 perf report: Free generated help strings for sort option
    2bfa3c53ea8a perf env: Fix memory leak of cpu_pmu_caps
    a2f0da3af614 perf test maps__merge_in: Fix memory leak of maps
    b7bfd8aeb956 perf dso: Fix memory leak in dso__new_map()
    c9c101da3e83 perf test event_update: Fix memory leak of evlist
    b768db7f8070 perf test session_topology: Delete session->evlist
    b8892d16a928 perf env: Fix sibling_dies memory leak
    306411a8bf75 perf probe: Fix dso->nsinfo refcounting
    f21987d7bb58 perf map: Fix dso->nsinfo refcounting
    7337ff2093e0 perf inject: Fix dso->nsinfo refcounting
    a87d42ae7f5d KVM: x86/pmu: Clear anythread deprecated bit when 0xa leaf is unsupported on the SVM
    b990585f9b7a nvme-pci: do not call nvme_dev_remove_admin from nvme_remove
    0fa11e1a20c7 mptcp: fix warning in __skb_flow_dissect() when do syn cookie for subflow join
    3714e0bb0dcf cxgb4: fix IRQ free race during driver unload
    d92337bf54f2 pwm: sprd: Ensure configuring period and duty_cycle isn't wrongly skipped
    f1edbcc47f46 selftests: icmp_redirect: IPv6 PMTU info should be cleared after redirect
    906bbb18db78 selftests: icmp_redirect: remove from checking for IPv6 route get
    bb737eceb9a4 stmmac: platform: Fix signedness bug in stmmac_probe_config_dt()
    79ec7b5b2f4f ipv6: fix 'disable_policy' for fwd packets
    35eaefb44ed7 bonding: fix incorrect return value of bond_ipsec_offload_ok()
    13626bad63e8 bonding: fix suspicious RCU usage in bond_ipsec_offload_ok()
    56ccdf868ab6 bonding: Add struct bond_ipesc to manage SA
    b3bd1f5e5037 bonding: disallow setting nested bonding + ipsec offload
    43511a6a164a bonding: fix suspicious RCU usage in bond_ipsec_del_sa()
    6ca0e55a1310 ixgbevf: use xso.real_dev instead of xso.dev in callback functions of struct xfrmdev_ops
    ba7bfcdff1ad bonding: fix null dereference in bond_ipsec_add_sa()
    3ae639af3626 bonding: fix suspicious RCU usage in bond_ipsec_add_sa()
    4a31baf55f6a net: add kcov handle to skb extensions
    78e4baff950d gve: Fix an error handling path in 'gve_probe()'
    813449fb85f6 igb: Fix position of assignment to *ring
    44171801d39c igb: Check if num of q_vectors is smaller than max before array access
    cb9292445d23 iavf: Fix an error handling path in 'iavf_probe()'
    a6756d637b40 e1000e: Fix an error handling path in 'e1000_probe()'
    dea695a2ee23 fm10k: Fix an error handling path in 'fm10k_probe()'
    a099192fe7e1 igb: Fix an error handling path in 'igb_probe()'
    db4c32c1b926 igc: Fix an error handling path in 'igc_probe()'
    7bc9fb1f8019 ixgbe: Fix an error handling path in 'ixgbe_probe()'
    02d1af0bee65 igc: change default return of igc_read_phy_reg()
    f153664d8e70 igb: Fix use-after-free error during reset
    e15f629036ba igc: Fix use-after-free error during reset

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9a56f6566208517e458e5279992abe9664c4ae67)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index d365d91ce3..a06b9f717f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "969fef49cbbc8639e9622e6a0655337fbfcc7627"
-SRCREV_meta ?= "3f38ad49cf38519dc4492a3f802b743fde7b467e"
+SRCREV_machine ?= "a40806f61a2749b78c03eb0e0c9394246e632a99"
+SRCREV_meta ?= "0c461183d295a8e45096b9af71e07e06da7da13c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.53"
+LINUX_VERSION ?= "5.10.55"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 580d71d2ac..615c3b0f00 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.53"
+LINUX_VERSION ?= "5.10.55"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "d5a79da206965b27043f558739b28a434efca75c"
-SRCREV_machine ?= "f44b5bb716fdb6f804383fa087c9fdb54584cd5b"
-SRCREV_meta ?= "3f38ad49cf38519dc4492a3f802b743fde7b467e"
+SRCREV_machine_qemuarm ?= "ecb67002c7688875f76a424c87308eea5b2709f5"
+SRCREV_machine ?= "be59a3f77944fe82deaab2c3d61e76292cf04afb"
+SRCREV_meta ?= "0c461183d295a8e45096b9af71e07e06da7da13c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 362b3ac2cb..c5b60e0242 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c74da440f36f7073b1e99f42cb363031bb0c38ca"
-SRCREV_machine_qemuarm64 ?= "e4e52d0a19fba26538218d78c70e54319ae00ca3"
-SRCREV_machine_qemumips ?= "60118f08d49cd825d17f11b078d5848eb5bb7e6d"
-SRCREV_machine_qemuppc ?= "eb3d2abf3d5aab1814d53767193770c282552774"
-SRCREV_machine_qemuriscv64 ?= "0b44b705c4f7d5c83e562dd7036cb5188d622285"
-SRCREV_machine_qemuriscv32 ?= "0b44b705c4f7d5c83e562dd7036cb5188d622285"
-SRCREV_machine_qemux86 ?= "0b44b705c4f7d5c83e562dd7036cb5188d622285"
-SRCREV_machine_qemux86-64 ?= "0b44b705c4f7d5c83e562dd7036cb5188d622285"
-SRCREV_machine_qemumips64 ?= "643c332e487cfa1557d14050d6e1148d1c5d75da"
-SRCREV_machine ?= "0b44b705c4f7d5c83e562dd7036cb5188d622285"
-SRCREV_meta ?= "3f38ad49cf38519dc4492a3f802b743fde7b467e"
+SRCREV_machine_qemuarm ?= "159ecaed431c9b022eaa42e164603a998f458831"
+SRCREV_machine_qemuarm64 ?= "374000778a234761cdf27d9c5822efdd97626e6f"
+SRCREV_machine_qemumips ?= "b0216d371845ea01c5b6255f4a9eb6518f26a2cb"
+SRCREV_machine_qemuppc ?= "007217c338a8e496c110f86004b8268d10e94cdd"
+SRCREV_machine_qemuriscv64 ?= "9d31ee7f08cb276fbc4473a2279cb614ec4735be"
+SRCREV_machine_qemuriscv32 ?= "9d31ee7f08cb276fbc4473a2279cb614ec4735be"
+SRCREV_machine_qemux86 ?= "9d31ee7f08cb276fbc4473a2279cb614ec4735be"
+SRCREV_machine_qemux86-64 ?= "9d31ee7f08cb276fbc4473a2279cb614ec4735be"
+SRCREV_machine_qemumips64 ?= "a7f0d6ea0ddad123475e25725dadba0ed7888623"
+SRCREV_machine ?= "9d31ee7f08cb276fbc4473a2279cb614ec4735be"
+SRCREV_meta ?= "0c461183d295a8e45096b9af71e07e06da7da13c"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.53"
+LINUX_VERSION ?= "5.10.55"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1

