Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.11073.1625238833212130445
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 08:13:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nKS2CSuB;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id q16so9640460qke.10
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Jul 2021 08:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7AMY3dEgCvSVB/HvW0DD6ytGsb0j0RuZ0A6jN7fbXMo=;
        b=nKS2CSuBq7T8J3q6sT3R30jqO9Sp2mHyF77ZtdSW+iUJltPPFmuEv5twWthHvp0iuy
         ui/ydYbPHejwd6ckBElkmR1W/wIaoHl+zt3Vh2Hw6PtyDEGlWbNdjpkFQY/vuJcZRsvg
         U2PvNXlaxUS8lTjdtIKv+BqStzfL55Vjz8Ccr5Jj6K5gh1J+tQaqX0z+8kk1OBfXyU15
         z1/DgISVdfZNsHi3jsbCz1HxjFzG1P7jL1E4WUvpYjtJBwAcuGpGbeA3ikLKpTz5HT80
         079YJg3+pgxJI6SPHb3SL0bG4XPPVAy+nnMugWO3WpoiIbLi7uD2L6CEPJLCy3BH9cws
         S7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7AMY3dEgCvSVB/HvW0DD6ytGsb0j0RuZ0A6jN7fbXMo=;
        b=QNSh61YIyu7yUVrFfBKPe1ungiv8j3rAkHohvWeKv+4iruhFOJJ1tv86TSBQ1POSan
         LRSBsJtoLOJlRP7hcfWT/Zql7Mw2xhh6eZ4l6WrPIZmbmOio4PWLyc/7XkJ6hJJzLNH5
         e/WyAsUyWRUpKm+BK/RSgRXNiOWf1pEBeWG7E1mmusApcjz2a7dKN5sXgWAyhSShL3OT
         AP9G9bLoLkOKu38v4dAUSQH8y7ZgQ4SiTbCYH5HuT+pfd7zIFKyHRDy3Lrlm+u33oHhY
         nto11TWxOdPkqcp6pwZsS+/w8qBVOn1qGqwDQySgSqkgYLYt0MCNONb0L7Vog2nuu1cs
         acPg==
X-Gm-Message-State: AOAM532yQNR5hNmGkEbYuvMIBrSUkACZMhgyU9fD4jkale4d3nuNXIs7
	jJwssrYnt+7+JldF729d118=
X-Google-Smtp-Source: ABdhPJzVgrLJMBjN9uUuY1Bb6kTYbbX46F79cLXLvtIBiI3trVMv+oDjeMstwv7Ub+g1P25r34dBjQ==
X-Received: by 2002:a05:620a:69b:: with SMTP id f27mr309457qkh.25.1625238832248;
        Fri, 02 Jul 2021 08:13:52 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id o200sm1466800qke.105.2021.07.02.08.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 08:13:51 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] linux-yocto/5.10: update to v5.10.47
Date: Fri,  2 Jul 2021 11:13:41 -0400
Message-Id: <161ee33620727668c355db01e058413b3c0690d5.1625238537.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1625238537.git.bruce.ashfield@gmail.com>
References: <cover.1625238537.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    4357ae26d4cd Linux 5.10.47
    1573d595e239 integrity: Load mokx variables into the blacklist keyring
    c6ae6f89fc4f certs: Add ability to preload revocation certs
    72d6f5d982f0 certs: Move load_system_certificate_list to a common function
    45109066f686 certs: Add EFI_CERT_X509_GUID support for dbx entries
    0ba128fa68a4 Revert "drm: add a locked version of drm_is_current_master"
    0463b49e0239 netfs: fix test for whether we can skip read when writing beyond EOF
    e6108147dd91 swiotlb: manipulate orig_addr when tlb_addr has offset
    7570a8b5dd49 KVM: SVM: Call SEV Guest Decommission if ASID binding fails
    377a796e7a71 mm, futex: fix shared futex pgoff on shmem huge page
    ab9d178167ea mm/thp: another PVMW_SYNC fix in page_vma_mapped_walk()
    915c3a262c49 mm/thp: fix page_vma_mapped_walk() if THP mapped by ptes
    90073aecc3cc mm: page_vma_mapped_walk(): get vma_address_end() earlier
    bf60fc2314b9 mm: page_vma_mapped_walk(): use goto instead of while (1)
    9f85dcaf1533 mm: page_vma_mapped_walk(): add a level of indentation
    e56bdb397663 mm: page_vma_mapped_walk(): crossing page table boundary
    8dc191ed9c5f mm: page_vma_mapped_walk(): prettify PVMW_MIGRATION block
    7b55a4bcfccf mm: page_vma_mapped_walk(): use pmde for *pvmw->pmd
    1cb0b9059f9e mm: page_vma_mapped_walk(): settle PageHuge on entry
    65febb41b4d6 mm: page_vma_mapped_walk(): use page for pvmw->page
    825c28052b4d mm: thp: replace DEBUG_VM BUG with VM_WARN when unmap fails for split
    0010275ca243 mm/thp: unmap_mapping_page() to fix THP truncate_cleanup_page()
    38cda6b5ab83 mm/thp: fix page_address_in_vma() on file THP tails
    37ffe9f4d7ff mm/thp: fix vma_address() if virtual address below file offset
    66be14a92609 mm/thp: try_to_unmap() use TTU_SYNC for safe splitting
    6527d8ef68c3 mm/thp: make is_huge_zero_pmd() safe and quicker
    a8f4ea1d38ac mm/thp: fix __split_huge_pmd_locked() on shmem migration entry
    32f954e961ca mm, thp: use head page in __migration_entry_wait()
    bfd90b56d7f6 mm/rmap: use page_not_mapped in try_to_unmap()
    ff81af8259bb mm/rmap: remove unneeded semicolon in page_not_mapped()
    a0ad7ea018e7 mm: add VM_WARN_ON_ONCE_PAGE() macro
    130a1d76ee0b x86/fpu: Make init_fpstate correct with optimized XSAVE
    51d8011782ed x86/fpu: Preserve supervisor states in sanitize_restored_user_xstate()
    2b35a4eaaaae kthread: prevent deadlock when kthread_mod_delayed_work() races with kthread_cancel_delayed_work_sync()
    bfe28af78a20 kthread_worker: split code for canceling the delayed work timer
    02c303f3b9fb ceph: must hold snap_rwsem when filling inode for async create
    de0af2651daa i2c: robotfuzz-osif: fix control-request directions
    dd8ed6c9bc22 KVM: do not allow mapping valid but non-reference-counted pages
    5fd0c2cf7b11 s390/stack: fix possible register corruption with stack switch helper
    ab5bef978038 nilfs2: fix memory leak in nilfs_sysfs_delete_device_group
    ace31c91fd59 scsi: sd: Call sd_revalidate_disk() for ioctl(BLKRRPART)
    b9e6c20d4c9d gpiolib: cdev: zero padding during conversion to gpioline_info_changed
    0221a5a4db46 i2c: i801: Ensure that SMBHSTSTS_INUSE_STS is cleared when leaving i801_access
    018d03fcf77a pinctrl: stm32: fix the reported number of GPIO lines per bank
    df654cd3d300 perf/x86: Track pmu in per-CPU cpu_hw_events
    f9e73b2967f6 net: ll_temac: Avoid ndo_start_xmit returning NETDEV_TX_BUSY
    1c9cf96f5652 net: ll_temac: Add memory-barriers for TX BD access
    bafb6cdd4f70 PCI: Add AMD RS690 quirk to enable 64-bit DMA
    d91c50e6a678 recordmcount: Correct st_shndx handling
    fb71d81ccd69 mac80211: handle various extensible elements correctly
    676a7cb1a96b mac80211: reset profile_periodicity/ema_ap
    ca0e1fefbb53 net: qed: Fix memcpy() overflow of qed_dcbx_params()
    4658a8d30791 KVM: selftests: Fix kvm_check_cap() assertion
    e83e3c5d85a7 r8169: Avoid memcpy() over-reading of ETH_SS_STATS
    992b105abf57 sh_eth: Avoid memcpy() over-reading of ETH_SS_STATS
    a10856ea6066 r8152: Avoid memcpy() over-reading of ETH_SS_STATS
    196b22ef6cd1 net/packet: annotate accesses to po->ifindex
    da8b3aeff4ad net/packet: annotate accesses to po->bind
    18ed1789bbce net: caif: fix memory leak in ldisc_open
    edcd7594ada9 riscv32: Use medany C model for modules
    47c07f919fab net: phy: dp83867: perform soft reset and retain established link
    f57132a887ea net/packet: annotate data race in packet_sendmsg()
    9707960ecfdc inet: annotate date races around sk->sk_txhash
    7293f63b7b62 net: annotate data race in sock_error()
    61b132f67c0d ping: Check return value of function 'ping_queue_rcv_skb'
    08c389de6d53 inet: annotate data race in inet_send_prepare() and inet_dgram_connect()
    c2311fd6de78 net: ethtool: clear heap allocations for ethtool function
    c2813d1966ba mac80211: drop multicast fragments
    fedc4d4f548c net: ipv4: Remove unneed BUG() function
    93c2aac13b08 dmaengine: mediatek: use GFP_NOWAIT instead of GFP_ATOMIC in prep_dma
    0f48f9277182 dmaengine: mediatek: do not issue a new desc if one is still current
    63fa5b2d4b55 dmaengine: mediatek: free the proper desc in desc_free handler
    78fa0f707d73 dmaengine: rcar-dmac: Fix PM reference leak in rcar_dmac_probe()
    6a07cf36064a cfg80211: call cfg80211_leave_ocb when switching away from OCB
    a9028333001f mac80211_hwsim: drop pending frames on stop
    8cfe765afd5a mac80211: remove warning in ieee80211_get_sband()
    b671b9816982 dmaengine: xilinx: dpdma: Limit descriptor IDs to 16 bits
    524f70b30ef8 dmaengine: xilinx: dpdma: Add missing dependencies to Kconfig
    13b245a7bd59 dmaengine: stm32-mdma: fix PM reference leak in stm32_mdma_alloc_chan_resourc()
    86f3e72dcb72 dmaengine: zynqmp_dma: Fix PM reference leak in zynqmp_dma_alloc_chan_resourc()
    4df9ed0edb9f perf/x86/intel/lbr: Zero the xstate buffer on allocation
    56bc20e5fc64 perf/x86/lbr: Remove cpuc->lbr_xsave allocation from atomic context
    ca2acbd5483f locking/lockdep: Improve noinstr vs errors
    59aa5c91f863 x86/xen: Fix noinstr fail in exc_xen_unknown_trap()
    cb83c99cf675 x86/entry: Fix noinstr fail in __do_fast_syscall_32()
    cf5935487594 drm/vc4: hdmi: Make sure the controller is powered in detect
    f73aca83fd83 drm/vc4: hdmi: Move the HSM clock enable to runtime_pm
    f11f9ff8a7c9 Revert "PCI: PM: Do not read power state in pci_enable_device_flags()"
    4b06ebab4a82 spi: spi-nxp-fspi: move the register operation after the clock enable
    50a1312a29d1 arm64: Force NO_BLOCK_MAPPINGS if crashkernel reservation is required
    bd5d4df4dcc1 arm64: Ignore any DMA offsets in the max_zone_phys() calculation
    3bbdf5a6fcd2 MIPS: generic: Update node names to avoid unit addresses
    03096a46019e mmc: meson-gx: use memcpy_to/fromio for dram-access-quirk
    b8fd230ae085 ARM: 9081/1: fix gcc-10 thumb2-kernel regression
    3d6c4f78ec61 drm/amdgpu: wait for moving fence after pinning
    694bb36aa75d drm/radeon: wait for moving fence after pinning
    bcfea2412f4b drm/nouveau: wait for moving fence after pinning v2
    3ef0ca0ec995 drm: add a locked version of drm_is_current_master
    fea853aca321 Revert "drm/amdgpu/gfx10: enlarge CP_MEC_DOORBELL_RANGE_UPPER to cover full doorbell."
    1bd81429d53d Revert "drm/amdgpu/gfx9: fix the doorbell missing when in CGPG issue."
    3051f230f19f module: limit enabling module.sig_enforce

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index f511f233b6..1c5bb9753c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4a59bc57b2be77da9394b10eb37067da7d63b7a4"
-SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
+SRCREV_machine ?= "42032770803ba26765376967cef09945f48abe04"
+SRCREV_meta ?= "c96c799ca3e63c0ca17e05843d3f8e7e0d6dfb31"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.46"
+LINUX_VERSION ?= "5.10.47"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index f5ade2992c..bdc49fb9e2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.46"
+LINUX_VERSION ?= "5.10.47"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "dd1f9602f3e4e9dc177421ba12ce073ad2099a58"
-SRCREV_machine ?= "139fe7d68413054f850e206ab749f97a968867a8"
-SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
+SRCREV_machine_qemuarm ?= "eaad1adbc817d996edf44fdd520da4810e57e66d"
+SRCREV_machine ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
+SRCREV_meta ?= "c96c799ca3e63c0ca17e05843d3f8e7e0d6dfb31"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index dd4aef7f89..abe837c2f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "17e89ca08f67fdcbaf0a3ae4c429602f76463923"
-SRCREV_machine_qemuarm64 ?= "139fe7d68413054f850e206ab749f97a968867a8"
-SRCREV_machine_qemumips ?= "bdcaaee7b7ce0e865670a2cee55b1974eb67357b"
-SRCREV_machine_qemuppc ?= "139fe7d68413054f850e206ab749f97a968867a8"
-SRCREV_machine_qemuriscv64 ?= "139fe7d68413054f850e206ab749f97a968867a8"
-SRCREV_machine_qemuriscv32 ?= "139fe7d68413054f850e206ab749f97a968867a8"
-SRCREV_machine_qemux86 ?= "139fe7d68413054f850e206ab749f97a968867a8"
-SRCREV_machine_qemux86-64 ?= "139fe7d68413054f850e206ab749f97a968867a8"
-SRCREV_machine_qemumips64 ?= "2f11a726a60ad9e8a48de6bc2101a993b461e8d1"
-SRCREV_machine ?= "139fe7d68413054f850e206ab749f97a968867a8"
-SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
+SRCREV_machine_qemuarm ?= "8950bba5dc5b6139af3711cf82b6c35ea3ef873f"
+SRCREV_machine_qemuarm64 ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
+SRCREV_machine_qemumips ?= "271e6f3b206246da2937788d83c3b4e57cb33da0"
+SRCREV_machine_qemuppc ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
+SRCREV_machine_qemuriscv64 ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
+SRCREV_machine_qemuriscv32 ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
+SRCREV_machine_qemux86 ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
+SRCREV_machine_qemux86-64 ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
+SRCREV_machine_qemumips64 ?= "1112c8f8594df02dd6f2bd1cf13848536ca3f536"
+SRCREV_machine ?= "52bcc5b2342739bbfc8fc385d151616883c4425c"
+SRCREV_meta ?= "c96c799ca3e63c0ca17e05843d3f8e7e0d6dfb31"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.46"
+LINUX_VERSION ?= "5.10.47"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

