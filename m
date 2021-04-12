Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web09.29432.1618218515903981471
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Apr 2021 02:08:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ZBjsiv9JtF60iNnGbjccs2e8C5p4zsDAQKCJN4ZKmY2sPgUsbtKQoajWXQAfA4+XgeA//5VrPp
 MGj50PgKZ3sQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="255467896"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="255467896"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:43 -0700
IronPort-SDR: CY5RflcE2YIXGI5xeQ1mFHDEQk0mlwoxLZKfD5Iuvy7yp161kxIzad4BzU+tgRZKB7yqLiB17R
 q+A7DAk8G1+A==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="531809074"
Received: from pchuang-mobl3.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.174.143])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:08:42 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 06/18] linux-yocto/5.4: update to v5.4.107
Date: Mon, 12 Apr 2021 17:08:14 +0800
Message-Id: <c28f771cdca01e419d869a797fe4d7520f2d810a.1618210563.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618210563.git.anuj.mittal@intel.com>
References: <cover.1618210563.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    a65e78863443 Linux 5.4.107
    5161cc4350de net: dsa: b53: Support setting learning on port
    ebeefdc3d8ee net: dsa: tag_mtk: fix 802.1ad VLAN egress
    6c3d86e6ffde crypto: x86/aes-ni-xts - use direct calls to and 4-way stride
    ae69c97bb76e crypto: aesni - Use TEST %reg,%reg instead of CMP $0,%reg
    eeb0899e0073 crypto: x86 - Regularize glue function prototypes
    187ae0463653 fuse: fix live lock in fuse_iget()
    28e53acd3065 drm/i915/gvt: Fix vfio_edid issue for BXT/APL
    5a7c72ffb412 drm/i915/gvt: Fix port number for BDW on EDID region setup
    4ab29329668d drm/i915/gvt: Fix virtual display setup for BXT/APL
    e46f72e1f27c drm/i915/gvt: Fix mmio handler break on BXT/APL.
    8cd68991b836 drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL to workaround GPU BB hang
    50f83ffc58ab btrfs: scrub: Don't check free space before marking a block group RO
    591ea83fd2ce bpf, selftests: Fix up some test_verifier cases for unprivileged
    4e4c85404a23 bpf: Add sanity check for upper ptr_limit
    524471df8fa9 bpf: Simplify alu_limit masking for pointer arithmetic
    2da0540739e4 bpf: Fix off-by-one for area size in creating mask to left
    ea8fb45eaac1 bpf: Prohibit alu ops for pointer types not defining ptr_limit
    010c5bee66bd KVM: arm64: nvhe: Save the SPE context early
    0437de26e28d Linux 5.4.106
    b802b6ef28d6 xen/events: avoid handling the same event on two cpus at the same time
    92aefc62f483 xen/events: don't unmask an event channel when an eoi is pending
    43d0b82bb45c xen/events: reset affinity of 2-level event when tearing it down
    38563c1ff081 KVM: arm64: Reject VM creation when the default IPA size is unsupported
    da2e37b55d4c KVM: arm64: Ensure I-cache isolation between vcpus of a same VM
    4e2156c0d37b nvme: release namespace head reference on error
    eb565f052b3e nvme: unlink head after removing last namespace
    4535fb9ec5fd KVM: arm64: Fix exclusive limit for IPA size
    e28b19ca2aeb x86/unwind/orc: Disable KASAN checking in the ORC unwinder, part 2
    c0e0ab60d0b1 binfmt_misc: fix possible deadlock in bm_register_write
    106fea9ad246 powerpc/64s: Fix instruction encoding for lis in ppc_function_entry()
    907f7f2cf0ff sched/membarrier: fix missing local execution of ipi_sync_rq_state()
    2306580a95b7 zram: fix return value on writeback_store
    29e28a134a49 include/linux/sched/mm.h: use rcu_dereference in in_vfork()
    99f1960cae4f stop_machine: mark helpers __always_inline
    aaf92d0538d2 hrtimer: Update softirq_expires_next correctly after __hrtimer_get_next_event()
    88c79851b82d arm64: mm: use a 48-bit ID map when possible on 52-bit VA builds
    73aa6f93e1e9 configfs: fix a use-after-free in __configfs_open_file
    babd55002dd4 block: rsxx: fix error return code of rsxx_pci_probe()
    41deefab452a NFSv4.2: fix return value of _nfs4_get_security_label()
    86954a52d829 NFS: Don't gratuitously clear the inode cache when lookup failed
    d29f9aa6a8b2 NFS: Don't revalidate the directory permissions on a lookup failure
    d5a69ed75931 SUNRPC: Set memalloc_nofs_save() for sync tasks
    9c9ea7ac18b2 arm64/mm: Fix pfn_valid() for ZONE_DEVICE based memory
    19bb2a20710d sh_eth: fix TRSCER mask for R7S72100
    c3c1defad2dd staging: comedi: pcl818: Fix endian problem for AI command data
    c5916897a6e1 staging: comedi: pcl711: Fix endian problem for AI command data
    7d8ec7bef320 staging: comedi: me4000: Fix endian problem for AI command data
    e70294943c89 staging: comedi: dmm32at: Fix endian problem for AI command data
    47a2af64eea3 staging: comedi: das800: Fix endian problem for AI command data
    0f2522ec71b6 staging: comedi: das6402: Fix endian problem for AI command data
    e91490b9edb9 staging: comedi: adv_pci1710: Fix endian problem for AI command data
    4d6505edee5a staging: comedi: addi_apci_1500: Fix endian problem for command sample
    f258c1c26f64 staging: comedi: addi_apci_1032: Fix endian problem for COS sample
    e644fc4ab7bb staging: rtl8192e: Fix possible buffer overflow in _rtl92e_wx_set_scan
    8f586a59829b staging: rtl8712: Fix possible buffer overflow in r8712_sitesurvey_cmd
    9fe42273b2c6 staging: ks7010: prevent buffer overflow in ks_wlan_set_scan()
    ab42f28d5f34 staging: rtl8188eu: fix potential memory corruption in rtw_check_beacon_data()
    1a866057e970 staging: rtl8712: unterminated string leads to read overflow
    da5abe369b03 staging: rtl8188eu: prevent ->ssid overflow in rtw_wx_set_scan()
    a311b6a7f099 staging: rtl8192u: fix ->ssid overflow in r8192_wx_set_scan()
    e4b52c7cbaaf misc: fastrpc: restrict user apps from sending kernel RPC messages
    9009b59dfd5f misc/pvpanic: Export module FDT device table
    0a58a400a93b usbip: fix vudc usbip_sockfd_store races leading to gpf
    8a50dda5243e usbip: fix vhci_hcd attach_store() races leading to gpf
    8698133003cf usbip: fix stub_dev usbip_sockfd_store() races leading to gpf
    7b76c7a91bf6 usbip: fix vudc to check for stream socket
    2e24c093e264 usbip: fix vhci_hcd to check for stream socket
    da1be8e07852 usbip: fix stub_dev to check for stream socket
    ec7fb77a37af USB: serial: cp210x: add some more GE USB IDs
    b05ac5bcf623 USB: serial: cp210x: add ID for Acuity Brands nLight Air Adapter
    0b7034401f0c USB: serial: ch341: add new Product ID
    5287c3d62e91 USB: serial: io_edgeport: fix memory leak in edge_startup
    c1b20c6fac05 xhci: Fix repeated xhci wake after suspend due to uncleared internal wake state
    3573dea8c17a usb: xhci: Fix ASMedia ASM1042A and ASM3242 DMA addressing
    57ab089c09d5 xhci: Improve detection of device initiated wake signal.
    f4f02f9feb4e usb: xhci: do not perform Soft Retry for some xHCI hosts
    45bc1c34b54e usb: renesas_usbhs: Clear PIPECFG for re-enabling pipe with other EPNUM
    c9e346234698 USB: usblp: fix a hang in poll() if disconnected
    cc495be17466 usb: dwc3: qcom: Honor wakeup enabled/disabled state
    f030e3c67791 usb: dwc3: qcom: Add missing DWC3 OF node refcount decrement
    014e4b616313 usb: gadget: f_uac1: stop playback on function disable
    117aadfc0616 usb: gadget: f_uac2: always increase endpoint max_packet_size by one audio slot
    ec7b0ac66539 USB: gadget: u_ether: Fix a configfs return code
    0ae3101f5cf0 Goodix Fingerprint device is not a modem
    b0ea155fa4f7 mmc: cqhci: Fix random crash when remove mmc module/card
    61fadd5f1e4e mmc: core: Fix partition switch time for eMMC
    1cb73c82622c software node: Fix node registration
    3bc266631a9e s390/dasd: fix hanging IO request during DASD driver unbind
    87adc240df30 s390/dasd: fix hanging DASD driver unbind
    12002aa2e7af arm64: kasan: fix page_alloc tagging with DEBUG_VIRTUAL
    47a5d1b63f21 Revert 95ebabde382c ("capabilities: Don't allow writing ambiguous v3 file capabilities")
    ac85e7d4abb1 ALSA: usb-audio: Apply the control quirk to Plantronics headsets
    b1fe755e51df ALSA: usb-audio: Fix "cannot get freq eq" errors on Dell AE515 sound bar
    2b7615c97b0e ALSA: hda: Avoid spurious unsol event handling during S3/S4
    bb060148e29f ALSA: hda: Flush pending unsolicited events before suspend
    09cb42025a46 ALSA: hda: Drop the BATCH workaround for AMD controllers
    e1a92ad57b2c ALSA: hda/ca0132: Add Sound BlasterX AE-5 Plus support
    ff2152beb22c ALSA: hda/hdmi: Cancel pending works before suspend
    dd6d483104bf ALSA: usb: Add Plantronics C320-M USB ctrl msg delay quirk
    300fba2b4e11 scsi: target: core: Prevent underflow for service actions
    de2cdbcb4f38 scsi: target: core: Add cmd length set before cmd complete
    050e1900d617 scsi: libiscsi: Fix iscsi_prep_scsi_cmd_pdu() error handling
    acf0e7b15f87 sysctl.c: fix underflow value setting risk in vm_table
    508d56e2c5c3 s390/smp: __smp_rescan_cpus() - move cpumask away from stack
    54fc6a56f72a i40e: Fix memory leak in i40e_probe
    f95403013744 PCI: Fix pci_register_io_range() memory leak
    e9be5518af2c kbuild: clamp SUBLEVEL to 255
    e622e01d44e4 PCI: mediatek: Add missing of_node_put() to fix reference leak
    d54c77959ece PCI: xgene-msi: Fix race in installing chained irq handler
    395f24b37fe8 Input: applespi - don't wait for responses to commands indefinitely.
    ad93777a59c7 sparc64: Use arch_validate_flags() to validate ADI flag
    dec0ab3bc3a2 sparc32: Limit memblock allocation to low memory
    f8788ee8544c iommu/amd: Fix performance counter initialization
    d92afe30a665 powerpc/64: Fix stack trace not displaying final frame
    61654b5d079d HID: logitech-dj: add support for the new lightspeed connection iteration
    49e38713faaf powerpc/perf: Record counter overflow always if SAMPLE_IP is unset
    a54c278fcf8b powerpc: improve handling of unrecoverable system reset
    7765b5c2c192 spi: stm32: make spurious and overrun interrupts visible
    507b9bce2113 powerpc/pci: Add ppc_md.discover_phbs()
    26d60799d99b Platform: OLPC: Fix probe error handling
    ccad3c70fcd0 mmc: mediatek: fix race condition between msdc_request_timeout and irq
    edf05afc9be3 mmc: mxs-mmc: Fix a resource leak in an error handling path in 'mxs_mmc_probe()'
    c44d966e9020 udf: fix silent AED tagLocation corruption
    5f04f970d579 i2c: rcar: optimize cacheline to minimize HW race condition
    1e1aace4a395 i2c: rcar: faster irq code to minimize HW race condition
    2e24fd30c6f0 net: phy: fix save wrong speed and duplex problem if autoneg is on
    aea71e92b9a0 net: enetc: initialize RFS/RSS memories for unused ports too
    d1f308174a60 net: hns3: fix error mask definition of flow director
    cb36bf447a0c media: rc: compile rc-cec.c into rc-core
    4c0c31572b67 media: v4l: vsp1: Fix bru null pointer access
    f56a82844c1f media: v4l: vsp1: Fix uif null pointer access
    8cdc0900fc80 media: usbtv: Fix deadlock on suspend
    56b9b2c25905 sh_eth: fix TRSCER mask for R7S9210
    bdec0dd95cc8 qxl: Fix uninitialised struct field head.surface_id
    d5fc9c5d64ca s390/crypto: return -EFAULT if copy_to_user() fails
    72ba965bf10d s390/cio: return -EFAULT if copy_to_user() fails
    d2100ef32a8c drm: meson_drv add shutdown function
    72c541cc4552 drm/shmem-helper: Don't remove the offset in vm_area_struct pgoff
    0d574fc463c7 drm/shmem-helper: Check for purged buffers in fault handler
    3b08ea3a548f drm/compat: Clear bounce structures
    cabbd263c8e8 bnxt_en: reliably allocate IRQ table on reset to avoid crash
    dfa176f374ba s390/cio: return -EFAULT if copy_to_user() fails again
    05d11eb7bd9d net: hns3: fix bug when calculating the TCAM table info
    8bbc59bb0556 net: hns3: fix query vlan mask value error for flow director
    4d0273ab0a79 perf traceevent: Ensure read cmdlines are null terminated.
    ef663d149f8e selftests: forwarding: Fix race condition in mirror installation
    fcce3cb62c09 net: stmmac: fix watchdog timeout during suspend/resume stress test
    d31ae9ec5a03 net: stmmac: stop each tx channel independently
    86ea605518d7 ixgbe: fail to create xfrm offload of IPsec tunnel mode SA
    e8b6c1d7ced2 net: qrtr: fix error return code of qrtr_sendmsg()
    d28e783c2003 net: davicom: Fix regulator not turned off on driver removal
    05517de4188b net: davicom: Fix regulator not turned off on failed probe
    11a589205119 net: lapbether: Remove netif_start_queue / netif_stop_queue
    b4800e7a1c9f cipso,calipso: resolve a number of problems with the DOI refcounts
    6d599697e9a8 netdevsim: init u64 stats for 32bit hardware
    8e365b61bda7 net: usb: qmi_wwan: allow qmimux add/del with master up
    392f34cce2b0 net: sched: avoid duplicates in classes dump
    3e66c16388f5 nexthop: Do not flush blackhole nexthops when loopback goes down
    7f101d035deb net: stmmac: fix incorrect DMA channel intr enable setting of EQoS v4.10
    0fbbcf797e9c net/mlx4_en: update moderation when config reset
    78cbd0a4749d net: enetc: don't overwrite the RSS indirection table when initializing
    6547ec428619 Revert "mm, slub: consider rest of partial list if acquire_slab() fails"
    55e6ede3b935 cifs: return proper error code in statfs(2)
    a1ff418d3eda mount: fix mounting of detached mounts onto targets that reside on shared mounts
    59a057a89155 powerpc/603: Fix protection of user pages mapped with PROT_NONE
    da9f2219f66c mt76: dma: do not report truncated frames to mac80211
    95b0a3b09094 ibmvnic: always store valid MAC address
    3e8ab75f3301 samples, bpf: Add missing munmap in xdpsock
    c2c3a85ab01f selftests/bpf: Mask bpf_csum_diff() return value to 16 bits in test_verifier
    57b9f13e8aaa selftests/bpf: No need to drop the packet when there is no geneve opt
    82e85c0e7f34 netfilter: x_tables: gpf inside xt_find_revision()
    f66b8e738140 netfilter: nf_nat: undo erroneous tcp edemux lookup
    3bf899438c12 tcp: add sanity tests to TCP_QUEUE_SEQ
    b7049b6156ce can: tcan4x5x: tcan4x5x_init(): fix initialization - clear MRAM before entering Normal Mode
    a7e187a87e8e can: flexcan: invoke flexcan_chip_freeze() to enter freeze mode
    e0eccdfc5c0e can: flexcan: enable RX FIFO after FRZ/HALT valid
    ca483b872d20 can: flexcan: assert FRZ bit in flexcan_chip_freeze()
    6676e510d1a9 can: skb: can_skb_set_owner(): fix ref counting if socket was closed before setting skb ownership
    718769eb1bbe sh_eth: fix TRSCER mask for SH771x
    8baa52f26b3e net: avoid infinite loop in mpls_gso_segment when mpls_hlen == 0
    ca278267d6cd net: check if protocol extracted by virtio_net_hdr_set_proto is correct
    f2d78bbbca42 net: Fix gro aggregation for udp encaps with zero csum
    9be769161192 ath9k: fix transmitting to stations in dynamic SMPS mode
    5555ee33b6cc ethernet: alx: fix order of calls on resume
    dcb95790821b powerpc/pseries: Don't enforce MSI affinity with kdump
    fd1824bf963a uapi: nfnetlink_cthelper.h: fix userspace compilation error

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 59ab12f804dda59ecf8954df6ef8024646bcbde7)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 49e9cf4cbc..7629229601 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "08b34e26f97c0549961710c3b14258910979aff4"
-SRCREV_meta ?= "f67ab86441a7ebe38b5a25126d6eebc2ef6fee99"
+SRCREV_machine ?= "65bbe689d98a007848008be2c8edeb5fa8066829"
+SRCREV_meta ?= "19738ca97b999a3b150e2d34232bb44b6537348f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.105"
+LINUX_VERSION ?= "5.4.107"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 2bdaac0f50..2b6e35a69c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.105"
+LINUX_VERSION ?= "5.4.107"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "889b072e7b492ce96a80384f9d3e5412ff8ff839"
-SRCREV_machine ?= "96c96e27c3e9f2cdfb957ade03f10070286fff72"
-SRCREV_meta ?= "f67ab86441a7ebe38b5a25126d6eebc2ef6fee99"
+SRCREV_machine_qemuarm ?= "ac3cbab1d6692d4a032dfffe0a604f39a634d18a"
+SRCREV_machine ?= "cf76c5c0dc0edd51ae4a75a1f8701a2675e87c72"
+SRCREV_meta ?= "19738ca97b999a3b150e2d34232bb44b6537348f"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 0c41556566..04e64c028b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "65543d1e3cd5140ac0384179e46d881b728b4013"
-SRCREV_machine_qemuarm64 ?= "96c96e27c3e9f2cdfb957ade03f10070286fff72"
-SRCREV_machine_qemumips ?= "182eacc3bb0ee860380decb664e05e6ec94fe003"
-SRCREV_machine_qemuppc ?= "96c96e27c3e9f2cdfb957ade03f10070286fff72"
-SRCREV_machine_qemuriscv64 ?= "96c96e27c3e9f2cdfb957ade03f10070286fff72"
-SRCREV_machine_qemux86 ?= "96c96e27c3e9f2cdfb957ade03f10070286fff72"
-SRCREV_machine_qemux86-64 ?= "96c96e27c3e9f2cdfb957ade03f10070286fff72"
-SRCREV_machine_qemumips64 ?= "bc21e93c3154523e0f490fed699feb79ab60536b"
-SRCREV_machine ?= "96c96e27c3e9f2cdfb957ade03f10070286fff72"
-SRCREV_meta ?= "f67ab86441a7ebe38b5a25126d6eebc2ef6fee99"
+SRCREV_machine_qemuarm ?= "ea4097dbff5a148265018e1a998e02b5a05e3d27"
+SRCREV_machine_qemuarm64 ?= "cf76c5c0dc0edd51ae4a75a1f8701a2675e87c72"
+SRCREV_machine_qemumips ?= "230ca33504faef6f40c5d3b24901aaacb901c9a6"
+SRCREV_machine_qemuppc ?= "cf76c5c0dc0edd51ae4a75a1f8701a2675e87c72"
+SRCREV_machine_qemuriscv64 ?= "cf76c5c0dc0edd51ae4a75a1f8701a2675e87c72"
+SRCREV_machine_qemux86 ?= "cf76c5c0dc0edd51ae4a75a1f8701a2675e87c72"
+SRCREV_machine_qemux86-64 ?= "cf76c5c0dc0edd51ae4a75a1f8701a2675e87c72"
+SRCREV_machine_qemumips64 ?= "84e071a893ef9cea8a8ffbcd233b47a2bc9056b5"
+SRCREV_machine ?= "cf76c5c0dc0edd51ae4a75a1f8701a2675e87c72"
+SRCREV_meta ?= "19738ca97b999a3b150e2d34232bb44b6537348f"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.105"
+LINUX_VERSION ?= "5.4.107"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.30.2

