Received: from mga05.intel.com (mga05.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.3123.1619415959561459793
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 22:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: YJI/9TDEouaZT18vkza4t4zNaU43sJ6SNjucgwsFYplDbEE7Vh2mldKi+sPWY3lZvH2w4KzU9t
 xYJdmY21Qa1A==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="281613563"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="281613563"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 22:46:00 -0700
IronPort-SDR: sOSgUvA0k8Hvr+KOIjjl7q2i5okYGbiZZt9jAVWz0fyX2dC3Pe4lOd+QLVlnFDOlM1zpjhCEmD
 dmBD+fuHWV5g==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="385670678"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 22:45:58 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 3/8] linux-yocto/5.4: update to v5.4.111
Date: Mon, 26 Apr 2021 13:45:41 +0800
Message-Id: <806dc81c86d459687917e2ec2836c2adf565424b.1619409036.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619409036.git.anuj.mittal@intel.com>
References: <cover.1619409036.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    a49e5ea5e045 Linux 5.4.111
    45f540622d5b init/Kconfig: make COMPILE_TEST depend on HAS_IOMEM
    43dd03f08819 init/Kconfig: make COMPILE_TEST depend on !S390
    f5eb7e12a75d nvme-mpath: replace direct_make_request with generic_make_request
    6cce30548058 bpf, x86: Validate computation of branch displacements for x86-32
    a0b3927a07be bpf, x86: Validate computation of branch displacements for x86-64
    20c60bbc1c54 cifs: Silently ignore unknown oplock break handle
    754c82a6bf48 cifs: revalidate mapping when we open files for SMB1 POSIX
    e5991b4fcedb ia64: fix format strings for err_inject
    3e9292b39862 ia64: mca: allocate early mca with GFP_ATOMIC
    9b872bac1923 scsi: target: pscsi: Clean up after failure in pscsi_map_sg()
    e2db0e66139a x86/build: Turn off -fcf-protection for realmode targets
    0465098898ef platform/x86: thinkpad_acpi: Allow the FnLock LED to change state
    5a8c30e8acad netfilter: conntrack: Fix gre tunneling over ipv6
    e84a795b8a0b drm/msm: Ratelimit invalid-fence message
    daf5aaa8e6e0 drm/msm/adreno: a5xx_power: Don't apply A540 lm_setup to other GPUs
    6abe3dad0afe mac80211: choose first enabled channel for monitor
    37b51460b25a mISDN: fix crash in fritzpci
    901d39f7b2ce net: pxa168_eth: Fix a potential data race in pxa168_eth_remove
    dc7c4d30d6e0 net/mlx5e: Enforce minimum value check for ICOSQ size
    b0e2b3271236 bpf, x86: Use kvmalloc_array instead kmalloc_array in bpf_jit_comp
    e5868baa1e3c platform/x86: intel-hid: Support Lenovo ThinkPad X1 Tablet Gen 2
    422c68101110 bus: ti-sysc: Fix warning on unbind if reset is not deasserted
    bec7103b04a9 ARM: dts: am33xx: add aliases for mmc interfaces
    59c8e3329268 Linux 5.4.110
    cde4e338c2b2 drivers: video: fbcon: fix NULL dereference in fbcon_cursor()
    0ca13611d33f staging: rtl8192e: Change state information from u16 to u8
    f9974f189c67 staging: rtl8192e: Fix incorrect source in memcpy()
    fd5ce87aee48 usb: dwc2: Prevent core suspend when port connection flag is 0
    85e1752ae0ed usb: dwc2: Fix HPRT0.PrtSusp bit setting for HiKey 960 board.
    26d2284a0580 usb: gadget: udc: amd5536udc_pci fix null-ptr-dereference
    25c13ca8302f USB: cdc-acm: fix use-after-free after probe failure
    b5aedddb621e USB: cdc-acm: fix double free on probe failure
    7220bba3066e USB: cdc-acm: downgrade message to debug
    62da51d0e7b7 USB: cdc-acm: untangle a circular dependency between callback and softint
    7443350af8cb cdc-acm: fix BREAK rx code path adding necessary calls
    58cace45f84b usb: xhci-mtk: fix broken streams issue on 0.96 xHCI
    a22e35f7b4fb usb: musb: Fix suspend with devices connected for a64
    e94dec2765b5 USB: quirks: ignore remote wake-up on Fibocom L850-GL LTE modem
    2ecf5803557b usbip: vhci_hcd fix shift out-of-bounds in vhci_hub_control()
    5ecfad1efbc3 firewire: nosy: Fix a use-after-free bug in nosy_ioctl()
    58073dc536a6 extcon: Fix error handling in extcon_dev_register
    e3a3d5005e63 extcon: Add stubs for extcon_register_notifier_all() functions
    67ff75be1ab1 pinctrl: rockchip: fix restore error in resume
    c92e8a8ecb9d vfio/nvlink: Add missing SPAPR_TCE_IOMMU depends
    7f93d47677dd reiserfs: update reiserfs_xattrs_initialized() condition
    4dc52ce56d63 drm/amdgpu: check alignment on CPU page for bo map
    f9b3b70fd468 drm/amdgpu: fix offset calculation in amdgpu_vm_bo_clear_mappings()
    00bd9c22409e mm: fix race by making init_zero_pfn() early_initcall
    558ab52776c0 tracing: Fix stack trace event size
    07b19a118d2f PM: runtime: Fix ordering in pm_runtime_get_suppliers()
    72a667681cc4 PM: runtime: Fix race getting/putting suppliers at probe
    b6e7dbf0ed9c xtensa: move coprocessor_flush to the .text section
    c3715f06f9ad ALSA: hda/realtek: call alc_update_headset_mode() in hp_automute_hook
    09a08fd89996 ALSA: hda/realtek: fix a determine_headset_type issue for a Dell AIO
    3acbf473a885 ALSA: hda: Add missing sanity checks in PM prepare/complete callbacks
    65f92e40cc6d ALSA: hda: Re-add dropped snd_poewr_change_state() calls
    05dd1a4223c5 ALSA: usb-audio: Apply sample rate quirk to Logitech Connect
    42c83e3bca43 bpf: Remove MTU check in __bpf_skb_max_len
    aca623d79cb7 net: wan/lmc: unregister device when no matching device is found
    f22854911523 appletalk: Fix skb allocation size in loopback case
    4ff476b88135 net: ethernet: aquantia: Handle error cleanup of start on open
    ee898d95f446 ath10k: hold RCU lock when calling ieee80211_find_sta_by_ifaddr()
    0b8dfb61f29a brcmfmac: clear EAP/association status bits on linkdown events
    2d0e594c1316 can: tcan4x5x: fix max register value
    4ac1feff6ea6 net: introduce CAN specific pointer in the struct net_device
    23394679aa56 can: dev: move driver related infrastructure into separate subdir
    7ca4feb37e9e flow_dissector: fix TTL and TOS dissection on IPv4 fragments
    ee5055593d0e net: mvpp2: fix interrupt mask/unmask skip condition
    aa9345d10f0a ext4: do not iput inode under running transaction in ext4_rename()
    5e39a73e47ef locking/ww_mutex: Simplify use_ww_ctx & ww_ctx handling
    84bd602c14b7 thermal/core: Add NULL pointer check before using cooling device stats
    50c38f76b51d ASoC: rt5659: Update MCLK rate in set_sysclk()
    b6408fd7eb89 staging: comedi: cb_pcidas64: fix request_irq() warn
    b9fe8673b874 staging: comedi: cb_pcidas: fix request_irq() warn
    7390a1cdf304 scsi: qla2xxx: Fix broken #endif placement
    6e79f829e791 scsi: st: Fix a use after free in st_open()
    98052c40e3ac vhost: Fix vhost_vq_reset()
    57aa4f30911a powerpc: Force inlining of cpu_has_feature() to avoid build failure
    dcf4b6e710c7 NFSD: fix error handling in NFSv4.0 callbacks
    990a0fa1ccbb ASoC: cs42l42: Always wait at least 3ms after reset
    6d197691a1c5 ASoC: cs42l42: Fix mixer volume control
    aa74bf73937c ASoC: cs42l42: Fix channel width support
    47ae33d5b32b ASoC: cs42l42: Fix Bitclock polarity inversion
    5952cf385ceb ASoC: es8316: Simplify adc_pga_gain_tlv table
    381679aec216 ASoC: sgtl5000: set DAP_AVC_CTRL register to correct default value on probe
    57b8a192872a ASoC: rt5651: Fix dac- and adc- vol-tlv values being off by a factor of 10
    b75073a37c65 ASoC: rt5640: Fix dac- and adc- vol-tlv values being off by a factor of 10
    ca3f8dcd6d94 iomap: Fix negative assignment to unsigned sis->pages in iomap_swapfile_activate
    c899b8391a54 rpc: fix NULL dereference on kmalloc failure
    0e71c59b2450 fs: nfsd: fix kconfig dependency warning for NFSD_V4
    9b68d3ed8aa8 ext4: fix bh ref count on error paths
    721a6f64c0bc ext4: shrink race window in ext4_should_retry_alloc()
    05d891e76dde module: harden ELF info handling
    6a8df0821f67 module: avoid *goto*s in module_sig_check()
    d9b98ccdfed0 module: merge repetitive strings in module_sig_check()
    1a8c5fbe2f1d modsign: print module name along with error message
    120589bb0970 ipv6: weaken the v4mapped source check
    1225bb45c87b selinux: vsock: Set SID for socket returned by accept()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 199566a40671ac273028cb44d0bb4494be22c4aa)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 2300ac23c2..18def17905 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "918e7836663cbad861b254f181d3545977d4492f"
-SRCREV_meta ?= "0fdc53770a263755ea5e995d5b74dd9a8cd06d8b"
+SRCREV_machine ?= "cccae402fe6c1892e4395e25bd482d6bc8f00826"
+SRCREV_meta ?= "5973c11656b6d5221a764be1b2f1622c7e905e6c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.109"
+LINUX_VERSION ?= "5.4.111"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 5a392742ca..059a7196fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.109"
+LINUX_VERSION ?= "5.4.111"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "1dd2723e9895767d459c7c60c0074b3bce5c0d52"
-SRCREV_machine ?= "08d98ec7a622f02cd6584ec93ad9c135cf0ea538"
-SRCREV_meta ?= "0fdc53770a263755ea5e995d5b74dd9a8cd06d8b"
+SRCREV_machine_qemuarm ?= "519d4d331aad2c1302530c5af0b4356b6f362be9"
+SRCREV_machine ?= "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
+SRCREV_meta ?= "5973c11656b6d5221a764be1b2f1622c7e905e6c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index f981f4b500..2341c2a541 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "f4d1abedbb7a850f9ccb058c2c63f1dffc46e485"
-SRCREV_machine_qemuarm64 ?= "08d98ec7a622f02cd6584ec93ad9c135cf0ea538"
-SRCREV_machine_qemumips ?= "7f54002c5db332f2a8a9c842f1d6aa56e3946cb8"
-SRCREV_machine_qemuppc ?= "08d98ec7a622f02cd6584ec93ad9c135cf0ea538"
-SRCREV_machine_qemuriscv64 ?= "08d98ec7a622f02cd6584ec93ad9c135cf0ea538"
-SRCREV_machine_qemux86 ?= "08d98ec7a622f02cd6584ec93ad9c135cf0ea538"
-SRCREV_machine_qemux86-64 ?= "08d98ec7a622f02cd6584ec93ad9c135cf0ea538"
-SRCREV_machine_qemumips64 ?= "0addc7475d8fc1e8ca6f33ec90bf4b78085c0975"
-SRCREV_machine ?= "08d98ec7a622f02cd6584ec93ad9c135cf0ea538"
-SRCREV_meta ?= "0fdc53770a263755ea5e995d5b74dd9a8cd06d8b"
+SRCREV_machine_qemuarm ?= "eee89fab3a932bbd8a54995a5da2ac15af2d929f"
+SRCREV_machine_qemuarm64 ?= "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
+SRCREV_machine_qemumips ?= "7cafd60186c08ce6d941ad1bcfc539950534a178"
+SRCREV_machine_qemuppc ?= "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
+SRCREV_machine_qemuriscv64 ?= "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
+SRCREV_machine_qemux86 ?= "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
+SRCREV_machine_qemux86-64 ?= "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
+SRCREV_machine_qemumips64 ?= "e7d9c5457ce29ae61c37580888743951f2bf65b9"
+SRCREV_machine ?= "5dba555ee7d5317a9720d33403e1e1f8e560b3fc"
+SRCREV_meta ?= "5973c11656b6d5221a764be1b2f1622c7e905e6c"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.109"
+LINUX_VERSION ?= "5.4.111"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.30.2

