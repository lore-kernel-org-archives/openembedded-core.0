Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.11921.1625242814841293130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 09:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="196043424"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="196043424"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:14 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="626776335"
Received: from ypoh4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.151.64])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:13 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/22] linux-yocto/5.10: update to v5.10.43
Date: Sat,  3 Jul 2021 00:19:44 +0800
Message-Id: <7066ec17ca1a2a8fa7aa95dc4a8c0a5509187bf4.1625242066.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625242066.git.anuj.mittal@intel.com>
References: <cover.1625242066.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    951358a824f9 Linux 5.10.43
    d17d47da59f7 neighbour: allow NUD_NOARP entries to be forced GCed
    6b53db8c4c14 xen-netback: take a reference to the RX task thread
    316de9a88c83 netfilter: nf_tables: missing error reporting for not selected expressions
    eddf2d9f76b0 i2c: qcom-geni: Suspend and resume the bus during SYSTEM_SLEEP_PM ops
    f20eef4d0686 lib/lz4: explicitly support in-place decompression
    334c59d58de5 x86/kvm: Disable all PV features on crash
    3b0becf8b1ec x86/kvm: Disable kvmclock on all CPUs on shutdown
    38b858da1c58 x86/kvm: Teardown PV features on boot CPU as well
    b327c9774759 KVM: arm64: Fix debug register indexing
    b3ee3f50ab1b KVM: SVM: Truncate GPR value for DR and CR accesses in !64-bit mode
    fe910d20e2d8 btrfs: fix unmountable seed device after fstrim
    05e41f6f1c4e drm/msm/dpu: always use mdp device to scale bandwidth
    2eb4ec9c2c35 mm, hugetlb: fix simple resv_huge_pages underflow on UFFDIO_COPY
    baa6763123e2 btrfs: fix deadlock when cloning inline extents and low on available space
    0df50d47d174 btrfs: abort in rename_exchange if we fail to insert the second ref
    48568f3944ee btrfs: fixup error handling in fixup_inode_link_counts
    466d83fdbbe3 btrfs: return errors from btrfs_del_csums in cleanup_ref_head
    5a89982fa2bb btrfs: fix error handling in btrfs_del_csums
    b547a16b2491 btrfs: mark ordered extent and inode with error if we fail to finish
    5e5e63bacbe8 powerpc/kprobes: Fix validation of prefixed instructions across page boundary
    42f75a4381a4 x86/apic: Mark _all_ legacy interrupts when IO/APIC is missing
    3a6b69221f96 drm/amdgpu: make sure we unpin the UVD BO
    58da0b509e4b drm/amdgpu: Don't query CE and UE errors
    48ee0db61c82 nfc: fix NULL ptr dereference in llcp_sock_getname() after failed connect
    445477e9274e x86/sev: Check SME/SEV support in CPUID first
    942c5864de85 x86/cpufeatures: Force disable X86_FEATURE_ENQCMD and remove update_pasid()
    68dcd32b326a mm/page_alloc: fix counting of free pages after take off from buddy
    5f2e1e818e9f mm/debug_vm_pgtable: fix alignment for pmd/pud_advanced_tests()
    c8d5faee4624 ocfs2: fix data corruption by fallocate
    7178be006d49 pid: take a reference when initializing `cad_pid`
    a4ed12f5edc4 usb: dwc2: Fix build in periphal-only mode
    3b713aafa7c9 ext4: fix accessing uninit percpu counter variable with fast_commit
    2050c6e5b161 ext4: fix memory leak in ext4_mb_init_backend on error path.
    fb86acc62369 ext4: fix fast commit alignment issues
    d3b668b96ad3 ext4: fix bug on in ext4_es_cache_extent as ext4_split_extent_at failed
    01d349a481f0 ext4: fix memory leak in ext4_fill_super
    b2057d138f1b ARM: dts: imx6q-dhcom: Add PU,VDD1P1,VDD2P5 regulators
    623603e255aa ARM: dts: imx6dl-yapp4: Fix RGMII connection to QCA8334 switch
    846848c0520f ALSA: hda: update the power_state during the direct-complete
    cfbb57fcb180 ALSA: hda: Fix for mute key LED for HP Pavilion 15-CK0xx
    029c06103e0a ALSA: timer: Fix master timer notification
    d11e5b96efde gfs2: fix scheduling while atomic bug in glocks
    127f25be2ff0 HID: multitouch: require Finger field to mark Win8 reports as MT
    b5d013c4c76b HID: magicmouse: fix NULL-deref on disconnect
    a5e554f78981 HID: i2c-hid: Skip ELAN power-on command after reset
    46403c1f80b0 net: caif: fix memory leak in cfusbl_device_notify
    af2806345a37 net: caif: fix memory leak in caif_device_notify
    d6db727457dd net: caif: add proper error handling
    dac53568c6ac net: caif: added cfserl_release function
    df3b45f6d1ce wireguard: allowedips: free empty intermediate nodes when removing single node
    c5155c741a48 wireguard: allowedips: allocate nodes in kmem_cache
    70a9a71ab3e5 wireguard: allowedips: remove nodes in O(1)
    42a667715b1e wireguard: allowedips: initialize list head in selftest
    842c21d6a042 wireguard: selftests: make sure rp_filter is disabled on vethc
    b8d72ac1f210 wireguard: selftests: remove old conntrack kconfig value
    f74da2c2546c wireguard: use synchronize_net rather than synchronize_rcu
    d4275889ac9c wireguard: peer: allocate in kmem_cache
    d64fdbaec09b wireguard: do not use -O3
    74caf718cc74 Bluetooth: use correct lock to prevent UAF of hdev object
    3795007c8dfc Bluetooth: fix the erroneous flush_work() order
    7fa8ee00b5fa drm/amdgpu/jpeg3: add cancel_delayed_work_sync before power gate
    c12946548001 drm/amdgpu/jpeg2.5: add cancel_delayed_work_sync before power gate
    58f4d45d8d4d drm/amdgpu/vcn3: add cancel_delayed_work_sync before power gate
    ec72cb50c1db io_uring: use better types for cflags
    0b2a990e5d2f io_uring: fix link timeout refs
    3c23e23c7ad9 riscv: vdso: fix and clean-up Makefile
    282c9eeda6c2 serial: stm32: fix threaded interrupt handling
    fdf1e5eec3ed tipc: fix unique bearer names sanity check
    e31ae45ed1d3 tipc: add extack messages for bearer/media failure
    0d83aec6e010 bus: ti-sysc: Fix flakey idling of uarts and stop using swsup_sidle_act
    5592731e13cc ARM: dts: imx: emcon-avari: Fix nxp,pca8574 #gpio-cells
    67ae12a57b34 ARM: dts: imx7d-pico: Fix the 'tuning-step' property
    a776ea1eca2b ARM: dts: imx7d-meerkat96: Fix the 'tuning-step' property
    8aa4700de52d arm64: dts: freescale: sl28: var4: fix RGMII clock and voltage
    4f323ce68e75 arm64: dts: zii-ultra: fix 12V_MAIN voltage
    a3716c19330d arm64: dts: ls1028a: fix memory node
    d551b8e85777 bus: ti-sysc: Fix am335x resume hang for usb otg module
    426ba49ec50b optee: use export_uuid() to copy client UUID
    d866a6e61a4d arm64: dts: ti: j7200-main: Mark Main NAVSS as dma-coherent
    a1bf16616d83 ixgbe: add correct exception tracing for XDP
    e369db6cde11 ixgbe: optimize for XDP_REDIRECT in xsk path
    ad505705bba6 ice: add correct exception tracing for XDP
    9e1eb428849f ice: optimize for XDP_REDIRECT in xsk path
    7bd82b73d589 ice: simplify ice_run_xdp
    274d6eeaafc7 i40e: add correct exception tracing for XDP
    fbae1a97ce34 i40e: optimize for XDP_REDIRECT in xsk path
    1958a31c035d cxgb4: avoid link re-train during TC-MQPRIO configuration
    21d494d4446b i2c: qcom-geni: Add shutdown callback for i2c
    c4b796f20c95 ice: Allow all LLDP packets from PF to Tx
    68db78345f73 ice: report supported and advertised autoneg using PHY capabilities
    8726b9e81be7 ice: handle the VF VSI rebuild failure
    a79883ce1e9f ice: Fix VFR issues for AVF drivers that expect ATQLEN cleared
    b94580b055b8 ice: Fix allowing VF to request more/less queues via virtchnl
    098702358274 ipv6: Fix KASAN: slab-out-of-bounds Read in fib6_nh_flush_exceptions
    1dcf3d435bf6 cxgb4: fix regression with HASH tc prio value update
    8067da904921 ixgbevf: add correct exception tracing for XDP
    e0b61cda5f07 igb: add correct exception tracing for XDP
    e513d889625b ieee802154: fix error return code in ieee802154_llsec_getparams()
    2a0ba0125c2c ieee802154: fix error return code in ieee802154_add_iface()
    ff5039ec75c8 bpf, lockdown, audit: Fix buggy SELinux lockdown permission checks
    cdf3f6db1a86 bpf: Simplify cases in bpf_base_func_proto
    4cf297ef595c drm/i915/selftests: Fix return value check in live_breadcrumbs_smoketest()
    8d614eebc003 netfilter: nfnetlink_cthelper: hit EBUSY on updates if size mismatches
    5f3429c05e40 netfilter: nft_ct: skip expectations for confirmed conntrack
    c440cd080761 nvmet: fix freeing unallocated p2pmem
    2a8cda3867cd net/mlx5: DR, Create multi-destination flow table with level less than 64
    c8972cf28ea1 net/mlx5e: Check for needed capability for cvlan matching
    730700337593 net/mlx5: Check firmware sync reset requested is set before trying to abort it
    c1ea8c0e71ea net/mlx5e: Fix incompatible casting
    f1d4184f128d net/tls: Fix use-after-free after the TLS device goes down and up
    874ece252ed2 net/tls: Replace TLS_RX_SYNC_RUNNING with RCU
    a5de17bb916a net: sock: fix in-kernel mark setting
    09fdb6747b7e net: dsa: tag_8021q: fix the VLAN IDs used for encoding sub-VLANs
    091283e3d5eb perf probe: Fix NULL pointer dereference in convert_variable_location()
    100c872c7511 ACPICA: Clean up context mutex during object deletion
    df7c913f90c3 nvme-rdma: fix in-casule data send for chained sgls
    b198f77a3613 mptcp: always parse mptcp options for MPC reqsk
    be0d85072686 net/sched: act_ct: Fix ct template allocation for zone 0
    f07c54831477 net/sched: act_ct: Offload connections with commit action
    4f00f9c169d9 devlink: Correct VIRTUAL port to not have phys_port attributes
    56c45ab00aba HID: i2c-hid: fix format string mismatch
    744db828d6f9 HID: pidff: fix error return code in hid_pidff_init()
    39b92726a380 HID: logitech-hidpp: initialize level variable
    4b1aba653642 ipvs: ignore IP_VS_SVC_F_HASHED flag when adding service
    46ae882bb19a vfio/platform: fix module_put call in error flow
    2adb0313b132 samples: vfio-mdev: fix error handing in mdpy_fb_probe()
    c25454a4f4cb vfio/pci: zap_vma_ptes() needs MMU
    c303db1211a7 vfio/pci: Fix error return code in vfio_ecap_init()
    8d27efbb0ee4 efi: cper: fix snprintf() use in cper_dimm_err_location()
    951f8ef71d69 efi/libstub: prevent read overflow in find_file_option()
    b828601c752b efi: Allow EFI_MEMORY_XP and EFI_MEMORY_RO both to be cleared
    5148066edbdc efi/fdt: fix panic when no valid fdt found
    39a909a9720d netfilter: conntrack: unregister ipv4 sockopts on error unwind
    46e650617934 hwmon: (pmbus/isl68137) remove READ_TEMPERATURE_3 for RAA228228
    0d0df2e53223 hwmon: (dell-smm-hwmon) Fix index values
    70df000fb880 net: usb: cdc_ncm: don't spew notifications
    1d62b7ac83e0 btrfs: tree-checker: do not error out if extent ref hash doesn't match

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 939d312bf3fac617394f3f96d8b1c7a525b3e26e)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 9fb881c6c8..d1ff473e3c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1a53b60abc0aebb4e7be89b3d17c755fc127c2ec"
-SRCREV_meta ?= "38475332ee6749bc15f39cf0c22cd5aa2c0fddd0"
+SRCREV_machine ?= "f458a6a097da0e7c535361dd30037499a48699f7"
+SRCREV_meta ?= "7fab6536c164fd743f17c52bc56a65867e30903a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.42"
+LINUX_VERSION ?= "5.10.43"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 5b567b98bc..19aa7ab7d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.42"
+LINUX_VERSION ?= "5.10.43"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "4ca63892af0a3fefae7c283e9b7bcca0e47fea91"
-SRCREV_machine ?= "f09a5c524d12166be99bf465e3c0431d3aec80f2"
-SRCREV_meta ?= "38475332ee6749bc15f39cf0c22cd5aa2c0fddd0"
+SRCREV_machine_qemuarm ?= "e2c5237e9be3f4c69e86d7b990347454e2b8dff2"
+SRCREV_machine ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
+SRCREV_meta ?= "7fab6536c164fd743f17c52bc56a65867e30903a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 583abdb5ad..7205df2a61 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ce15f50ef5cf0d81f8539b2b7c728a5045f09161"
-SRCREV_machine_qemuarm64 ?= "f09a5c524d12166be99bf465e3c0431d3aec80f2"
-SRCREV_machine_qemumips ?= "f1a8f73dd8680fc57aab5d8618a14b4e3a28587d"
-SRCREV_machine_qemuppc ?= "f09a5c524d12166be99bf465e3c0431d3aec80f2"
-SRCREV_machine_qemuriscv64 ?= "f09a5c524d12166be99bf465e3c0431d3aec80f2"
-SRCREV_machine_qemuriscv32 ?= "f09a5c524d12166be99bf465e3c0431d3aec80f2"
-SRCREV_machine_qemux86 ?= "f09a5c524d12166be99bf465e3c0431d3aec80f2"
-SRCREV_machine_qemux86-64 ?= "f09a5c524d12166be99bf465e3c0431d3aec80f2"
-SRCREV_machine_qemumips64 ?= "d8c0cf01dfa28b3271606f942df69a12c8d23a95"
-SRCREV_machine ?= "f09a5c524d12166be99bf465e3c0431d3aec80f2"
-SRCREV_meta ?= "38475332ee6749bc15f39cf0c22cd5aa2c0fddd0"
+SRCREV_machine_qemuarm ?= "592f67240407a1f071d1b90e0af74df07deac519"
+SRCREV_machine_qemuarm64 ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
+SRCREV_machine_qemumips ?= "0f474718e48ea5732875db2b71cf3f5dd3293e31"
+SRCREV_machine_qemuppc ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
+SRCREV_machine_qemuriscv64 ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
+SRCREV_machine_qemuriscv32 ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
+SRCREV_machine_qemux86 ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
+SRCREV_machine_qemux86-64 ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
+SRCREV_machine_qemumips64 ?= "a3c3c412a703def1f5c8f94f2c0fcc2cb908693a"
+SRCREV_machine ?= "a68fc0180ae168b5af017e9071e183e1a51e4569"
+SRCREV_meta ?= "7fab6536c164fd743f17c52bc56a65867e30903a"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.42"
+LINUX_VERSION ?= "5.10.43"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1

