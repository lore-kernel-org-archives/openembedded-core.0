Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF279C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 16:47:15 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.505.1635871635257964071
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 09:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="218509700"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="218509700"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:30 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800";
   d="scan'208";a="599575122"
Received: from myap-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.233.82])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 09:44:29 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 06/24] linux-yocto/5.10: update to v5.10.73
Date: Wed,  3 Nov 2021 00:43:54 +0800
Message-Id: 
 <51ec225dcef75eb3e75e3bd3d143c2a6bb8e83ce.1635871270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635871270.git.anuj.mittal@intel.com>
References: <cover.1635871270.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 16:47:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157792

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    0268aa579b1f Linux 5.10.73
    825c00c2ee14 x86/hpet: Use another crystalball to evaluate HPET usability
    f2447f6587b8 x86/entry: Clear X86_FEATURE_SMAP when CONFIG_X86_SMAP=n
    6bfe1f6fc876 x86/entry: Correct reference to intended CONFIG_64_BIT
    5d637bc6f98a x86/sev: Return an error on a returned non-zero SW_EXITINFO1[31:0]
    df121cf55003 x86/Kconfig: Correct reference to MWINCHIP3D
    d7c36115fb81 x86/platform/olpc: Correct ifdef symbol to intended CONFIG_OLPC_XO15_SCI
    f73ca4961d51 pseries/eeh: Fix the kdump kernel crash during eeh_pseries_init
    411b38fe68ba powerpc/64s: fix program check interrupt emergency stack path
    18a2a2cafcf9 powerpc/bpf: Fix BPF_SUB when imm == 0x80000000
    a4037dded56b RISC-V: Include clone3() on rv32
    29fdb11ca88d bpf, s390: Fix potential memory leak about jit_data
    2c152d9da8fe riscv/vdso: make arch_setup_additional_pages wait for mmap_sem for write killable
    de834e12b96d i2c: mediatek: Add OFFSET_EXT_CONF setting back
    f86de018fd7a i2c: acpi: fix resource leak in reconfiguration device addition
    87990a60b45f powerpc/iommu: Report the correct most efficient DMA mask for PCI devices
    985cca1ad11e net: prefer socket bound to interface when not in VRF
    97aeed72af4f i40e: Fix freeing of uninitialized misc IRQ vector
    2dc768a98c9b i40e: fix endless loop under rtnl
    d3a07ca78ace gve: report 64bit tx_bytes counter from gve_handle_report_stats()
    35f6ddd934e6 gve: fix gve_get_stats()
    9a043022522e rtnetlink: fix if_nlmsg_stats_size() under estimation
    72c2a68f1d83 gve: Avoid freeing NULL pointer
    5d903a694b08 gve: Correct available tx qpl check
    f69556a42043 drm/nouveau/debugfs: fix file release memory leak
    65fff0a8efcd drm/nouveau/kms/nv50-: fix file release memory leak
    f86e19d918a8 drm/nouveau: avoid a use-after-free when BO init fails
    008224cdc126 video: fbdev: gbefb: Only instantiate device when built for IP32
    d2ccbaaa6615 drm/sun4i: dw-hdmi: Fix HDMI PHY clock setup
    18d2568cc7ff bus: ti-sysc: Use CLKDM_NOAUTO for dra7 dcan1 for errata i893
    40a84fcae2bf perf jevents: Tidy error handling
    628b31d96711 netlink: annotate data races around nlk->bound
    144715fbab1b net: sfp: Fix typo in state machine debug string
    3ec73ffeef54 net/sched: sch_taprio: properly cancel timer from taprio_destroy()
    60955b65bd6a net: bridge: fix under estimation in br_get_linkxstats_size()
    c480d15190eb net: bridge: use nla_total_size_64bit() in br_get_linkxstats_size()
    cb8880680bdf ARM: imx6: disable the GIC CPU interface before calling stby-poweroff sequence
    2b0035d1058a dt-bindings: drm/bridge: ti-sn65dsi86: Fix reg value
    10afd1597263 arm64: dts: ls1028a: add missing CAN nodes
    95ba03fb4cb1 ptp_pch: Load module automatically if ID matches
    442ea65d0ccb powerpc/fsl/dts: Fix phy-connection-type for fm1mac3
    acff2d182c07 net_sched: fix NULL deref in fifo_set_limit()
    0d2dd40a7be6 phy: mdio: fix memory leak
    6e6f79e39830 net/mlx5: E-Switch, Fix double allocation of acl flow counter
    d70cb6c77ad9 net/mlx5e: IPSEC RX, enable checksum complete
    064faa8e8a9b bpf: Fix integer overflow in prealloc_elems_and_freelist()
    d5f4b27c3cfc soc: ti: omap-prm: Fix external abort for am335x pruss
    1d8f4447e8c4 bpf, arm: Fix register clobbering in div/mod implementation
    29a19eaeb29d iwlwifi: pcie: add configuration of a Wi-Fi adapter on Dell XPS 15
    6b0132f73094 xtensa: call irqchip_init only when CONFIG_USE_OF is selected
    3d288ed98314 xtensa: use CONFIG_USE_OF instead of CONFIG_OF
    997bec509a83 arm64: dts: qcom: pm8150: use qcom,pm8998-pon binding
    fbca14abc111 ath5k: fix building with LEDS=m
    8aef3824e946 PCI: hv: Fix sleep while in non-sleep context when removing child devices from the bus
    d9b838ae390e ARM: dts: imx6qdl-pico: Fix Ethernet support
    9e99ad4194a5 ARM: dts: imx: Fix USB host power regulator polarity on M53Menlo
    2ba34cf0c16c ARM: dts: imx: Add missing pinctrl-names for panel on M53Menlo
    8f977e97b2b9 soc: qcom: mdt_loader: Drop PT_LOAD check on hash segment
    14f52004bda5 ARM: at91: pm: do not panic if ram controllers are not enabled
    d89a313a5739 ARM: dts: qcom: apq8064: Use 27MHz PXO clock as DSI PLL reference
    25ac88e601eb soc: qcom: socinfo: Fixed argument passed to platform_set_data()
    ab8073794be3 bus: ti-sysc: Add break in switch statement in sysc_init_soc()
    427faa29e06f riscv: Flush current cpu icache before other cpus
    05287407dedf ARM: dts: qcom: apq8064: use compatible which contains chipid
    ac06fe40e889 ARM: dts: imx6dl-yapp4: Fix lp5562 LED driver probe
    71d3ce62ac88 ARM: dts: omap3430-sdp: Fix NAND device node
    f9a855d1bcb2 xen/balloon: fix cancelled balloon action
    9aac782ab0ab SUNRPC: fix sign error causing rpcsec_gss drops
    8f174a208c4c nfsd4: Handle the NFSv4 READDIR 'dircount' hint being zero
    12d4b179022a nfsd: fix error handling of register_pernet_subsys() in init_nfsd()
    1bc2f315a215 ovl: fix IOCB_DIRECT if underlying fs doesn't support direct IO
    9763ffd4da21 ovl: fix missing negative dentry check in ovl_rename()
    1500f0c83670 mmc: sdhci-of-at91: replace while loop with read_poll_timeout
    3a0feae5f642 mmc: sdhci-of-at91: wait for calibration done before proceed
    e5cb3680b958 mmc: meson-gx: do not use memcpy_to/fromio for dram-access-quirk
    13d17cc717d5 xen/privcmd: fix error handling in mmap-resource processing
    de1e8bd36ab4 drm/nouveau/kms/tu102-: delay enabling cursor until after assign_windows
    1d4e9f27d20d usb: typec: tcpm: handle SRC_STARTUP state if cc changes
    feb3fe702a58 USB: cdc-acm: fix break reporting
    fc8b3e838bdf USB: cdc-acm: fix racy tty buffer accesses
    b3265b88e83b usb: chipidea: ci_hdrc_imx: Also search for 'phys' phandle
    16d728110bd7 Partially revert "usb: Kconfig: using select for USB_COMMON dependency"
    5aa003b38148 Linux 5.10.72
    387aecdab7fa libata: Add ATA_HORKAGE_NO_NCQ_ON_ATI for Samsung 860 and 870 SSD.
    02bf504bc32b perf/x86: Reset destroy callback on event init failure
    b56475c29bd8 KVM: x86: nSVM: restore int_vector in svm_clear_vintr
    ae34f26d4a84 kvm: x86: Add AMD PMU MSRs to msrs_to_save_all[]
    6d0ff9205999 KVM: do not shrink halt_poll_ns below grow_start
    b8add3f47ae7 selftests: KVM: Align SMCCC call with the spec in steal_time
    352b02562a3e tools/vm/page-types: remove dependency on opt_file for idle page tracking
    84778fd66d3d smb3: correct smb3 ACL security descriptor
    a7be240d1703 irqchip/gic: Work around broken Renesas integration
    8724a2a0e6d9 scsi: ses: Retry failed Send/Receive Diagnostic commands
    2e28f7dd3743 thermal/drivers/tsens: Fix wrong check for tzd in irq handlers
    7a670cfb0f4c nvme-fc: avoid race between time out and tear down
    c251d023ed22 nvme-fc: update hardware queues before using them
    c4506403e1f3 selftests:kvm: fix get_warnings_count() ignoring fscanf() return warn
    bcc4b4de63a4 selftests: be sure to make khdr before other targets
    6a4aaf1d84f7 habanalabs/gaudi: fix LBW RR configuration
    2754fa3b73df usb: dwc2: check return value after calling platform_get_resource()
    ed6574d48469 usb: testusb: Fix for showing the connection speed
    60df9f55562a scsi: sd: Free scsi_disk device via put_device()
    76c7063c7405 ext2: fix sleeping in atomic bugs on error
    b114f2d18e0f sparc64: fix pci_iounmap() when CONFIG_PCI is not set
    fdfb3bc87381 xen-netback: correct success/error reporting for the SKB-with-fraglist case
    a41938d07201 net: mdio: introduce a shutdown method to mdio device drivers
    63c89930d4b5 btrfs: fix mount failure due to past and transient device flush error
    50628b06e604 btrfs: replace BUG_ON() in btrfs_csum_one_bio() with proper error handling
    83050cc23909 nfsd: back channel stuck in SEQ4_STATUS_CB_PATH_DOWN
    f986cf270284 platform/x86: touchscreen_dmi: Update info for the Chuwi Hi10 Plus (CWI527) tablet
    e5611503249f platform/x86: touchscreen_dmi: Add info for the Chuwi HiBook (CWI514) tablet
    2ababcd8c2ab spi: rockchip: handle zero length transfers without timing out
    5cd40b137cba Linux 5.10.71
    96f439a7eda6 netfilter: nf_tables: Fix oversized kvmalloc() calls
    e2d192301a0d netfilter: conntrack: serialize hash resizes and cleanups
    deb294941767 KVM: x86: Handle SRCU initialization failure during page track init
    f7ac4d24e161 HID: usbhid: free raw_report buffers in usbhid_stop
    57a269a1b12a mm: don't allow oversized kvmalloc() calls
    da5b8b9319f0 netfilter: ipset: Fix oversized kvmalloc() calls
    dedfc35a2de2 HID: betop: fix slab-out-of-bounds Write in betop_probe
    17ccc64e4fa5 crypto: ccp - fix resource leaks in ccp_run_aes_gcm_cmd()
    28f0fdbac0f5 usb: hso: remove the bailout parameter
    4ad4852b9adf ASoC: dapm: use component prefix when checking widget names
    5c3a90b6ff75 net: udp: annotate data race around udp_sk(sk)->corkflag
    a7f4c633ae12 HID: u2fzero: ignore incomplete packets without data
    3770e21f60fc ext4: fix potential infinite loop in ext4_dx_readdir()
    a63474dbf692 ext4: add error checking to ext4_ext_replay_set_iblocks()
    9ccf35492b08 ext4: fix reserved space counter leakage
    dc0942168ab3 ext4: limit the number of blocks in one ADD_RANGE TLV
    d11502fa2691 ext4: fix loff_t overflow in ext4_max_bitmap_size()
    7cea84867847 ipack: ipoctal: fix module reference leak
    843efca98e6a ipack: ipoctal: fix missing allocation-failure check
    67d1df661088 ipack: ipoctal: fix tty-registration error handling
    f46e5db92fa2 ipack: ipoctal: fix tty registration race
    5f6a309a6996 ipack: ipoctal: fix stack information leak
    3bef1b7242e0 debugfs: debugfs_create_file_size(): use IS_ERR to check for error
    15fd3954bca7 elf: don't use MAP_FIXED_NOREPLACE for elf interpreter mappings
    011b4de950d8 nvme: add command id quirk for apple controllers
    44c600a57d57 hwmon: (pmbus/mp2975) Add missed POUT attribute for page 1 mp2975 controller
    7fc5f60a01bb perf/x86/intel: Update event constraints for ICX
    3db53827a0e9 af_unix: fix races in sk_peer_pid and sk_peer_cred accesses
    d0d520c19e7e net: sched: flower: protect fl_walk() with rcu
    e63f6d8fe74a net: phy: bcm7xxx: Fixed indirect MMD operations
    071febc37e06 net: hns3: fix always enable rx vlan filter problem after selftest
    85e4f5d28d25 net: hns3: reconstruct function hns3_self_test
    8e89876c84b2 net: hns3: fix prototype warning
    d4a14faf7919 net: hns3: fix show wrong state when add existing uc mac address
    64dae9551f8a net: hns3: fix mixed flag HCLGE_FLAG_MQPRIO_ENABLE and HCLGE_FLAG_DCB_ENABLE
    8d3d27664ef4 net: hns3: keep MAC pause mode when multiple TCs are enabled
    f8ba689cb695 net: hns3: do not allow call hns3_nic_net_open repeatedly
    20f6c4a31a52 ixgbe: Fix NULL pointer dereference in ixgbe_xdp_setup
    16138cf938dc scsi: csiostor: Add module softdep on cxgb4
    0306a2c7df7e Revert "block, bfq: honor already-setup queue merges"
    1f2ca30fbde6 net: ks8851: fix link error
    f1dd6e10f077 selftests, bpf: test_lwt_ip_encap: Really disable rp_filter
    4967ae9ab44b selftests, bpf: Fix makefile dependencies on libbpf
    59efda5073ab bpf: Exempt CAP_BPF from checks against bpf_jit_limit
    f908072391a6 RDMA/hns: Fix inaccurate prints
    7e3eda32b881 e100: fix buffer overrun in e100_get_regs
    f2edf80cdd03 e100: fix length calculation in e100_get_regs_len
    c20a0ad7b6a0 dsa: mv88e6xxx: Include tagger overhead when setting MTU for DSA and CPU ports
    7b771b12229e dsa: mv88e6xxx: Fix MTU definition
    ee4d0495a65e dsa: mv88e6xxx: 6161: Use chip wide MAX MTU
    d35d95e8b9da drm/i915/request: fix early tracepoints
    8321738c6e5a smsc95xx: fix stalled rx after link change
    8de12ad9162c net: ipv4: Fix rtnexthop len when RTA_FLOW is present
    b22c5e2c8e03 net: enetc: fix the incorrect clearing of IF_MODE bits
    5ee40530b0a6 hwmon: (tmp421) fix rounding for negative values
    89d96f147d82 hwmon: (tmp421) report /PVLD condition as fault
    560271d09f78 mptcp: don't return sockets in foreign netns
    9c6591ae8e63 sctp: break out if skb_header_pointer returns NULL in sctp_rcv_ootb
    2c204cf594df mac80211-hwsim: fix late beacon hrtimer handling
    8576e72ac5d6 mac80211: mesh: fix potentially unaligned access
    1282bb00835f mac80211: limit injected vht mcs/nss in ieee80211_parse_tx_radiotap
    3748871e1215 mac80211: Fix ieee80211_amsdu_aggregate frag_tail bug
    76bbb482d33b hwmon: (mlxreg-fan) Return non-zero value when fan current state is enforced from sysfs
    c61736a994fe bpf, mips: Validate conditional branch offsets
    3f4e68902d2e RDMA/cma: Fix listener leak in rdma_cma_listen_on_all() failure
    62ba3c50104b IB/cma: Do not send IGMP leaves for sendonly Multicast groups
    d93f65586c59 bpf: Handle return value of BPF_PROG_TYPE_STRUCT_OPS prog
    12cbdaeeb5d4 ipvs: check that ip_vs_conn_tab_bits is between 8 and 20
    9f382e1edf90 drm/amdgpu: correct initial cp_hqd_quantum for gfx9
    c331fad63b6d drm/amd/display: Pass PCI deviceid into DC
    0a16c9751e0f RDMA/cma: Do not change route.addr.src_addr.ss_family
    31a13f039e15 media: ir_toy: prevent device from hanging during transmit
    249e5e5a501e KVM: rseq: Update rseq when processing NOTIFY_RESUME on xfer to KVM guest
    3778511dfc59 KVM: nVMX: Filter out all unsupported controls when eVMCS was activated
    4ed671e6bc62 KVM: x86: nSVM: don't copy virt_ext from vmcb12
    bebabb76ad9a KVM: x86: Fix stack-out-of-bounds memory access from ioapic_write_indirect()
    782122ae7db0 x86/kvmclock: Move this_cpu_pvti into kvmclock.h
    57de2dcb1874 mac80211: fix use-after-free in CCMP/GCMP RX
    201ba843fef5 scsi: ufs: Fix illegal offset in UPIU event trace
    bd4e446a6947 gpio: pca953x: do not ignore i2c errors
    516d90550390 hwmon: (w83791d) Fix NULL pointer dereference by removing unnecessary structure field
    1499bb2c3a87 hwmon: (w83792d) Fix NULL pointer dereference by removing unnecessary structure field
    7c4fd5de39f2 hwmon: (w83793) Fix NULL pointer dereference by removing unnecessary structure field
    196dabd96bbf hwmon: (tmp421) handle I2C errors
    23a6dfa10f03 fs-verity: fix signed integer overflow with i_size near S64_MAX
    d1d0016e4a7d ACPI: NFIT: Use fallback node id when numa info in NFIT table is incorrect
    e9edc7bc611a ALSA: hda/realtek: Quirks to enable speaker output for Lenovo Legion 7i 15IMHG05, Yoga 7i 14ITL5/15ITL5, and 13s Gen2 laptops.
    23115ca7d227 usb: cdns3: fix race condition before setting doorbell
    3945c481360c cpufreq: schedutil: Destroy mutex before kobject_put() frees the memory
    2193cf76f43a scsi: qla2xxx: Changes to support kdump kernel for NVMe BFS
    a7d4fc84404d cpufreq: schedutil: Use kobject release() method to free sugov_tunables
    d570c48dd37d tty: Fix out-of-bound vmalloc access in imageblit

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c9697cc081208a91d21b0c41219dc1b30d772f13)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index e35a91d254..415b3aae1b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "42d1c4e85643d634bddd98e5c4d8a9bcc61b3e18"
-SRCREV_meta ?= "f8afd84b117f336477846b9e22178ebefb26c08d"
+SRCREV_machine ?= "752916079819b4b927698e9b78fad4ebd1da9552"
+SRCREV_meta ?= "661aeb3be3206fc7fccdae35b221aa3750c615a7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.70"
+LINUX_VERSION ?= "5.10.73"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index c92a149d85..58026e50bb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.70"
+LINUX_VERSION ?= "5.10.73"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "71ff272be9e9436f27088fbd494da2de613121ea"
-SRCREV_machine ?= "4d1eeccd06dd8d310b238d6350cb0f7d937f4427"
-SRCREV_meta ?= "f8afd84b117f336477846b9e22178ebefb26c08d"
+SRCREV_machine:qemuarm ?= "9a44d3d70a39e75019eb41ebfdf9160ef1526b39"
+SRCREV_machine ?= "a9f78c623e84c13ac7ea5543a2acf61c2c9305d4"
+SRCREV_meta ?= "661aeb3be3206fc7fccdae35b221aa3750c615a7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index b4ccdb26dc..9079a1d063 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "011882741f10bd0c725139baa383eb5a4d833bca"
-SRCREV_machine:qemuarm64 ?= "098464b7c0c3d6f2a5b9226aab3245c3fcfb4797"
-SRCREV_machine:qemumips ?= "88494c005ab76864e706097056557b5616da65c6"
-SRCREV_machine:qemuppc ?= "a2b9c27f431a20ebfcd4146971c9422f4216aa90"
-SRCREV_machine:qemuriscv64 ?= "7dda2a9f69de7f80e572d38236896e97be79f39d"
-SRCREV_machine:qemuriscv32 ?= "7dda2a9f69de7f80e572d38236896e97be79f39d"
-SRCREV_machine:qemux86 ?= "7dda2a9f69de7f80e572d38236896e97be79f39d"
-SRCREV_machine:qemux86-64 ?= "7dda2a9f69de7f80e572d38236896e97be79f39d"
-SRCREV_machine:qemumips64 ?= "80da62cff32617711767cd6b01f64f1dc14f94d8"
-SRCREV_machine ?= "7dda2a9f69de7f80e572d38236896e97be79f39d"
-SRCREV_meta ?= "f8afd84b117f336477846b9e22178ebefb26c08d"
+SRCREV_machine:qemuarm ?= "8ccb3082c292a47758878414fd8ee338ca504842"
+SRCREV_machine:qemuarm64 ?= "c297d04cab775cdc684197fff6b1d6e012508898"
+SRCREV_machine:qemumips ?= "b184a88315097655916305d07acb55ee5dba55c2"
+SRCREV_machine:qemuppc ?= "a335585297e61e06eec5aef16858f033d4694027"
+SRCREV_machine:qemuriscv64 ?= "41bb5a43d466af4cb71fea2fcc2cbb18f450f03e"
+SRCREV_machine:qemuriscv32 ?= "41bb5a43d466af4cb71fea2fcc2cbb18f450f03e"
+SRCREV_machine:qemux86 ?= "41bb5a43d466af4cb71fea2fcc2cbb18f450f03e"
+SRCREV_machine:qemux86-64 ?= "41bb5a43d466af4cb71fea2fcc2cbb18f450f03e"
+SRCREV_machine:qemumips64 ?= "edefdb4bbcfe38521b1ac16eb5a6dcda1564e853"
+SRCREV_machine ?= "41bb5a43d466af4cb71fea2fcc2cbb18f450f03e"
+SRCREV_meta ?= "661aeb3be3206fc7fccdae35b221aa3750c615a7"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.70"
+LINUX_VERSION ?= "5.10.73"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1


