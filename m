Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web12.1657.1618790800489660305
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Apr 2021 17:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iqQvE06A;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id h7so24944011qtx.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Apr 2021 17:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ukg6C7G+L+kygFAP50naF2GCKQ9PQHmyP/pIXuVn5/M=;
        b=iqQvE06ABHamwy3aPKmErRA/7ayr9gtbtvgU0uk3omC/YutHJ8wePnNga01JgL+Hhj
         44svjdfeRpq0CDMWoS5Q+9Aqhw+G00Atd+9eYOMWd9F0oQIaWQTUSeRjSUazPrLRytVS
         Y5IKd1vMUceUeaIfFyOPT9xvcCaNDPGLNs9ulEoDQZ3Yuis0iQyikS8s4oahmZxpwUqt
         qXQXs3LpiZa3xsTjDcizpjyXyP2E1k1JNkUvGpQ5mRCatcHDRAZtwvuK9FZIzfDqQUzA
         GGrhVO67KS9MFQwvG2R/CAsoe0tAAktH46u7ET/qSCLcxNnCTasfJjPFkGD+kX2LOkTg
         8/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ukg6C7G+L+kygFAP50naF2GCKQ9PQHmyP/pIXuVn5/M=;
        b=TY/+SeI3uHiOzIyaNKHaQtPxmcFExJswmHMPjCvUHktoodI1EiuVy8BnSe0jL9sUjr
         +ZT7XLeNohL2r/2E532J/ld17aYLKHvt0/VWDf3kXKKvsMGf0mURkBzl4gRi6zuB449p
         rjjzTDD7ygpCM7z4J0Ck6U2ItDofdVCoOr7u93khsOIYTeTrDsWy/5cBitg/tFaYPYsy
         vrJqB3TusVpKuGCNAI4IPEJWL8QwQJ0Q42AX+wstZWl7k9MqD0QJ5BnGV+/YvLSEw86/
         /CtNeLvwygXUw4UaqHf1qNYcISfVJTSH/dLeXMu9uYOfLjfK6TQNGKFaANVg3pZVPz6w
         TGcA==
X-Gm-Message-State: AOAM533ysPAjLPXDaD9EiAk15mVhFcyHJnQqCPWoZnzKat8Aw3f7GV62
	ZhE8DBvJ0mPJopqCOVt5dbc=
X-Google-Smtp-Source: ABdhPJyoyaGp9PS7XAigMMT5NMRpRnv6KrRxCqaKuhYt7JwXECKE1hjIKYGPz1UTEqZ5vb9sJMDXzw==
X-Received: by 2002:ac8:b45:: with SMTP id m5mr9250457qti.56.1618790799575;
        Sun, 18 Apr 2021 17:06:39 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id n136sm8641759qka.133.2021.04.18.17.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Apr 2021 17:06:39 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/10] linux-yocto/5.10: update to v5.10.29
Date: Sun, 18 Apr 2021 20:06:28 -0400
Message-Id: <14b285a1bb92cd176c75f046dc255ec21c8f2d2a.1618790681.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1618790681.git.bruce.ashfield@gmail.com>
References: <cover.1618790681.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    d8cf82b410b4 Linux 5.10.29
    cef13a04376b init/Kconfig: make COMPILE_TEST depend on HAS_IOMEM
    ba02635769f1 init/Kconfig: make COMPILE_TEST depend on !S390
    faa30969f66e bpf, x86: Validate computation of branch displacements for x86-32
    3edb8967d91e bpf, x86: Validate computation of branch displacements for x86-64
    f890246ae75c tools/resolve_btfids: Add /libbpf to .gitignore
    76983e244908 kbuild: Do not clean resolve_btfids if the output does not exist
    0945d67e5d43 kbuild: Add resolve_btfids clean to root clean target
    eff1e0465727 tools/resolve_btfids: Set srctree variable unconditionally
    f60c918b07b7 tools/resolve_btfids: Check objects before removing
    249719092447 tools/resolve_btfids: Build libbpf and libsubcmd in separate directories
    2934985086b9 math: Export mul_u64_u64_div_u64
    7345d4b2d421 io_uring: fix timeout cancel return code
    8f9049e70cd6 cifs: Silently ignore unknown oplock break handle
    fee111089cc9 cifs: revalidate mapping when we open files for SMB1 POSIX
    42498ee67296 ia64: fix format strings for err_inject
    bc30fdd598e3 ia64: mca: allocate early mca with GFP_ATOMIC
    b008489d8b86 selftests/vm: fix out-of-tree build
    47f8bc68ae95 scsi: target: pscsi: Clean up after failure in pscsi_map_sg()
    266d3106efbd ptp_qoriq: fix overflow in ptp_qoriq_adjfine() u64 calcalation
    f135b89e286b platform/x86: intel_pmc_core: Ignore GBE LTR on Tiger Lake platforms
    037950869be3 block: clear GD_NEED_PART_SCAN later in bdev_disk_changed
    7c73059bf849 x86/build: Turn off -fcf-protection for realmode targets
    6372aa9a78f8 drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume
    6deb9d9a84a2 kselftest/arm64: sve: Do not use non-canonical FFR register value
    bcd57b07fd90 platform/x86: thinkpad_acpi: Allow the FnLock LED to change state
    6304295c6190 net: ipa: fix init header command validation
    8a57256e0548 netfilter: nftables: skip hook overlap logic if flowtable is stale
    b0c795f4cc53 netfilter: conntrack: Fix gre tunneling over ipv6
    439c2c22fb85 drm/msm: Ratelimit invalid-fence message
    57e0546f01ca drm/msm/adreno: a5xx_power: Don't apply A540 lm_setup to other GPUs
    b9ec77ef36af drm/msm/dsi_pll_7nm: Fix variable usage for pll_lockdet_rate
    0a66bd60b1ce mac80211: choose first enabled channel for monitor
    7705c48b8695 mac80211: Check crypto_aead_encrypt for errors
    05878b681981 mISDN: fix crash in fritzpci
    4ca265610cc6 kunit: tool: Fix a python tuple typing error
    f0ed115feccc net: pxa168_eth: Fix a potential data race in pxa168_eth_remove
    4b4ce9895e64 net/mlx5e: Enforce minimum value check for ICOSQ size
    198afc3b0c01 bpf, x86: Use kvmalloc_array instead kmalloc_array in bpf_jit_comp
    107875a53868 platform/x86: intel-hid: Support Lenovo ThinkPad X1 Tablet Gen 2
    4c875e034dfb bus: ti-sysc: Fix warning on unbind if reset is not deasserted
    5c6f778e8f7d ARM: dts: am33xx: add aliases for mmc interfaces
    ecdfb9d70fb8 Linux 5.10.28
    7973a0dad073 bpf: Use NOP_ATOMIC5 instead of emit_nops(&prog, 5) for BPF_TRAMP_F_CALL_ORIG
    12b5f9dae410 Revert "kernel: freezer should treat PF_IO_WORKER like PF_KTHREAD for freezing"
    6ae5eaee1ea5 riscv: evaluate put_user() arg before enabling user access
    61f0c3e8098f drivers: video: fbcon: fix NULL dereference in fbcon_cursor()
    d06d0b3cf626 driver core: clear deferred probe reason on probe retry
    d29c38dd926d staging: rtl8192e: Change state information from u16 to u8
    538b96315375 staging: rtl8192e: Fix incorrect source in memcpy()
    84e5203fd277 soc: qcom-geni-se: Cleanup the code to remove proxy votes
    996a5782faef usb: dwc3: gadget: Clear DEP flags after stop transfers in ep disable
    1808ee421ce5 usb: dwc3: qcom: skip interconnect init for ACPI probe
    137dfed1552a usb: dwc2: Prevent core suspend when port connection flag is 0
    4e28aca96729 usb: dwc2: Fix HPRT0.PrtSusp bit setting for HiKey 960 board.
    77c0d6af858b usb: gadget: udc: amd5536udc_pci fix null-ptr-dereference
    6f86681691c2 USB: cdc-acm: fix use-after-free after probe failure
    64deff1f4e0f USB: cdc-acm: fix double free on probe failure
    439a27521112 USB: cdc-acm: downgrade message to debug
    511302531eb8 USB: cdc-acm: untangle a circular dependency between callback and softint
    e700e3aec303 cdc-acm: fix BREAK rx code path adding necessary calls
    9efa606a83e0 usb: xhci-mtk: fix broken streams issue on 0.96 xHCI
    1addcb1f77d6 usb: musb: Fix suspend with devices connected for a64
    15e61d9ae7ac USB: quirks: ignore remote wake-up on Fibocom L850-GL LTE modem
    4027d6e88fef usbip: vhci_hcd fix shift out-of-bounds in vhci_hub_control()
    c04adcc819d3 firewire: nosy: Fix a use-after-free bug in nosy_ioctl()
    2c7d85026324 video: hyperv_fb: Fix a double free in hvfb_probe
    a267a7e1c0ca usb: dwc3: pci: Enable dis_uX_susphy_quirk for Intel Merrifield
    bf4c643192b3 firmware: stratix10-svc: reset COMMAND_RECONFIG_FLAG_PARTIAL to 0
    3b681a1c43b6 extcon: Fix error handling in extcon_dev_register
    023d13952e9b extcon: Add stubs for extcon_register_notifier_all() functions
    0fe56e294cef pinctrl: rockchip: fix restore error in resume
    80ee9e02be3d vfio/nvlink: Add missing SPAPR_TCE_IOMMU depends
    d2308dd5119b drm/tegra: sor: Grab runtime PM reference across reset
    f552f95853f8 drm/tegra: dc: Restore coupling of display controllers
    77a8e6f792d5 drm/imx: fix memory leak when fails to init
    74612ecdf263 reiserfs: update reiserfs_xattrs_initialized() condition
    8c71f5b30955 drm/amdgpu: check alignment on CPU page for bo map
    78ceecd2ed45 drm/amdgpu: fix offset calculation in amdgpu_vm_bo_clear_mappings()
    28f901fe1634 drm/amdkfd: dqm fence memory corruption
    ec3e06e06f76 mm: fix race by making init_zero_pfn() early_initcall
    d88b557b9b73 s390/vdso: fix tod_steering_delta type
    b332265430c8 s390/vdso: copy tod_steering_delta value to vdso_data page
    f706acc9312b tracing: Fix stack trace event size
    cc038ab785a8 PM: runtime: Fix ordering in pm_runtime_get_suppliers()
    da2976cd711b PM: runtime: Fix race getting/putting suppliers at probe
    e6d8eb65532e KVM: SVM: ensure that EFER.SVME is set when running nested guest or on nested vmexit
    5f6625f5cd5c KVM: SVM: load control fields from VMCB12 before checking them
    6aaa3c2ebb4f xtensa: move coprocessor_flush to the .text section
    a3be911a5fee xtensa: fix uaccess-related livelock in do_page_fault
    bcd7999c03ed ALSA: hda/realtek: fix mute/micmute LEDs for HP 640 G8
    ee58eee4501f ALSA: hda/realtek: call alc_update_headset_mode() in hp_automute_hook
    f235ffa56b8e ALSA: hda/realtek: fix a determine_headset_type issue for a Dell AIO
    6d91f3afb632 ALSA: hda: Add missing sanity checks in PM prepare/complete callbacks
    b3116cda4e52 ALSA: hda: Re-add dropped snd_poewr_change_state() calls
    474d3d65784e ALSA: usb-audio: Apply sample rate quirk to Logitech Connect
    e525cd364c09 ACPI: processor: Fix CPU0 wakeup in acpi_idle_play_dead()
    cdd192a20b06 ACPI: tables: x86: Reserve memory occupied by ACPI tables
    fd38d4e6757b bpf: Remove MTU check in __bpf_skb_max_len
    ff64f33bc93b net: 9p: advance iov on empty read
    84877db1cdea net: wan/lmc: unregister device when no matching device is found
    33a6b3eea44b net: ipa: fix register write command validation
    44d76042c038 net: ipa: remove two unused register definitions
    c805f215e9c5 appletalk: Fix skb allocation size in loopback case
    f2294a707f63 net: ethernet: aquantia: Handle error cleanup of start on open
    7d3ffc0993fe ath10k: hold RCU lock when calling ieee80211_find_sta_by_ifaddr()
    221528c20e5e iwlwifi: pcie: don't disable interrupts for reg_lock
    f33d87047323 netdevsim: dev: Initialize FIB module after debugfs
    660bf76aec07 rtw88: coex: 8821c: correct antenna switch function
    b5777172cce2 ath11k: add ieee80211_unregister_hw to avoid kernel crash caused by NULL pointer
    731c4447e6db brcmfmac: clear EAP/association status bits on linkdown events
    4094194d103b can: tcan4x5x: fix max register value
    1a5751d58b14 net: introduce CAN specific pointer in the struct net_device
    9e35159c6e9a can: dev: move driver related infrastructure into separate subdir
    e3ccad57ac09 flow_dissector: fix TTL and TOS dissection on IPv4 fragments
    8fe47a33944f net: mvpp2: fix interrupt mask/unmask skip condition
    44c816c8b9ab io_uring: call req_set_fail_links() on short send[msg]()/recv[msg]() with MSG_WAITALL
    5038c1122e13 ext4: do not iput inode under running transaction in ext4_rename()
    eb8049d85a92 static_call: Align static_call_is_init() patching condition
    21c2bbc17b6b io_uring: imply MSG_NOSIGNAL for send[msg]()/recv[msg]() calls
    fa068ee3f37e nvmet-tcp: fix kmap leak when data digest in use
    3ac4aaff387b locking/ww_mutex: Fix acquire/release imbalance in ww_acquire_init()/ww_acquire_fini()
    905ef030bdf9 locking/ww_mutex: Simplify use_ww_ctx & ww_ctx handling
    1e2a75c24a48 thermal/core: Add NULL pointer check before using cooling device stats
    cf51b6145b9d ASoC: rt711: add snd_soc_component remove callback
    805645d89a20 ASoC: rt5659: Update MCLK rate in set_sysclk()
    7d4344fd3ee0 staging: comedi: cb_pcidas64: fix request_irq() warn
    e833d5716fbb staging: comedi: cb_pcidas: fix request_irq() warn
    4cd96a0de7a1 scsi: qla2xxx: Fix broken #endif placement
    3860814ef620 scsi: st: Fix a use after free in st_open()
    861fc287e036 io_uring: fix ->flags races by linked timeouts
    e1f8c95c1110 vhost: Fix vhost_vq_reset()
    7f6518ec6ee9 kernel: freezer should treat PF_IO_WORKER like PF_KTHREAD for freezing
    540a1ebf3c23 NFSD: fix error handling in NFSv4.0 callbacks
    73df108e3aec ASoC: cs42l42: Always wait at least 3ms after reset
    9b7b92c4b92d ASoC: cs42l42: Fix mixer volume control
    20b39eb99598 ASoC: cs42l42: Fix channel width support
    0d3753babfa7 ASoC: cs42l42: Fix Bitclock polarity inversion
    ed47acc0c888 ASoC: soc-core: Prevent warning if no DMI table is present
    294d4c2b4fda ASoC: es8316: Simplify adc_pga_gain_tlv table
    f134a436d766 ASoC: sgtl5000: set DAP_AVC_CTRL register to correct default value on probe
    b057d540ad2c ASoC: rt5651: Fix dac- and adc- vol-tlv values being off by a factor of 10
    ed4cdb772680 ASoC: rt5640: Fix dac- and adc- vol-tlv values being off by a factor of 10
    4bac395e0b8a ASoC: rt1015: fix i2c communication error
    4eff80b14014 iomap: Fix negative assignment to unsigned sis->pages in iomap_swapfile_activate
    5fb71b231c4e rpc: fix NULL dereference on kmalloc failure
    9e9aa1c03c33 fs: nfsd: fix kconfig dependency warning for NFSD_V4
    e178f362f095 ext4: fix bh ref count on error paths
    4b3139576a20 ext4: shrink race window in ext4_should_retry_alloc()
    1bfb046d29e3 virtiofs: Fail dax mount if device does not support it
    e21d2b92354b bpf: Fix fexit trampoline.
    68abc0115617 arm64: mm: correct the inside linear map range during hotplug check

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 1896b2f295..ce88554830 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "57f0dabaec5ad65d936350e9b1f69791c8ddf97e"
-SRCREV_meta ?= "fa039db710ceb054f8670e09e7e31142c1566253"
+SRCREV_machine ?= "a1cb83d2e69b4c895cefa0e8716c8e9021d757bf"
+SRCREV_meta ?= "6dbb20d3127b3380779a11b1552429c5d4a0417e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.27"
+LINUX_VERSION ?= "5.10.29"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index a7b93fce7a..3581f3b4b0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.27"
+LINUX_VERSION ?= "5.10.29"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ae643fde3bb3d99f194ec0b6b9662bdd1d508c2f"
-SRCREV_machine ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
-SRCREV_meta ?= "fa039db710ceb054f8670e09e7e31142c1566253"
+SRCREV_machine_qemuarm ?= "bbc9efbcc604d823555794878f966b2ad7e5f4ca"
+SRCREV_machine ?= "fd21e2d609ad3343f03d78bc0cbce8da7d7c2a57"
+SRCREV_meta ?= "6dbb20d3127b3380779a11b1552429c5d4a0417e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index d480fc27c7..278f8a67fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "036f0e96d68be58be2e97ea7cab11f9ca2fb8e1c"
-SRCREV_machine_qemuarm64 ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
-SRCREV_machine_qemumips ?= "46964fe445c229120a9733ed98dcd5ab8454c999"
-SRCREV_machine_qemuppc ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
-SRCREV_machine_qemuriscv64 ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
-SRCREV_machine_qemuriscv32 ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
-SRCREV_machine_qemux86 ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
-SRCREV_machine_qemux86-64 ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
-SRCREV_machine_qemumips64 ?= "efe9e0c23330929c92a364d2497b231d1325ef29"
-SRCREV_machine ?= "a60fe3fcf113a00eb3263294f192615da7c2af8c"
-SRCREV_meta ?= "fa039db710ceb054f8670e09e7e31142c1566253"
+SRCREV_machine_qemuarm ?= "13b4e1548d504dca91ff49abba5be4df728840e6"
+SRCREV_machine_qemuarm64 ?= "fd21e2d609ad3343f03d78bc0cbce8da7d7c2a57"
+SRCREV_machine_qemumips ?= "ba6c1c115792e0c80412a7e0b54d6003cfbed491"
+SRCREV_machine_qemuppc ?= "fd21e2d609ad3343f03d78bc0cbce8da7d7c2a57"
+SRCREV_machine_qemuriscv64 ?= "fd21e2d609ad3343f03d78bc0cbce8da7d7c2a57"
+SRCREV_machine_qemuriscv32 ?= "fd21e2d609ad3343f03d78bc0cbce8da7d7c2a57"
+SRCREV_machine_qemux86 ?= "fd21e2d609ad3343f03d78bc0cbce8da7d7c2a57"
+SRCREV_machine_qemux86-64 ?= "fd21e2d609ad3343f03d78bc0cbce8da7d7c2a57"
+SRCREV_machine_qemumips64 ?= "2e99735de1312c0403ff23cb0c50fa8153e80be7"
+SRCREV_machine ?= "fd21e2d609ad3343f03d78bc0cbce8da7d7c2a57"
+SRCREV_meta ?= "6dbb20d3127b3380779a11b1552429c5d4a0417e"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.27"
+LINUX_VERSION ?= "5.10.29"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

