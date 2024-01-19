Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBE4C47DB7
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 21:14:26 +0000 (UTC)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web11.5982.1705698863494152813
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jan 2024 13:14:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GYp8Pwl/;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4674ca1a2dbso407497137.0
        for <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 13:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705698862; x=1706303662; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1jKqvXbBHpg2smRQ5G3ZXh2TwDIoPFz1pVkHS7bing=;
        b=GYp8Pwl/GIpQ4v2M1c9kHNHujs63XOLgOJULz4CTCBFaecf5Met6w8JClM05/Tfkh3
         kxp5tQmTYWcbOCoSyA1aKxQ/CZOhqcADQk0VlGM/tjsGSPsF87FtPnvOA/5RUIRBdwf6
         7iz4jFA9rp8wPOudAu3x7yGYFvEMyyqKn7+FIBJMt1gQODfpXhDbQEzf9MaZzN98xOEx
         zqGe5wezp6+rMhaMsfOLFSoXaqqU5giDO+dOLIx6lZlm0xfhaS6pWrDu5xh1LII+R0WF
         NadIyJeQS45O5xj9ezJK1TXG8ECfTMJsfqDafaWJkeVQTVGjIKAEzjo5stc+MZksLQyq
         nKHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705698862; x=1706303662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1jKqvXbBHpg2smRQ5G3ZXh2TwDIoPFz1pVkHS7bing=;
        b=PdSyZV7PtWA2My399R9r3dX48smBz/YWdMyhqN2vhMqv/Kt8k91L9a6+ZxbOnsNpVN
         Q6spe12/SpfvhyyXFjtwGtVrxvUsNHNUO4tjbL2tF6xcjlhLjCYQ/uU+cMdFvXf7sp+Z
         +lLdb3v9PTEFpTnCTvLDWky9BSN6RhyruOnJPLaIXS+tPP1yOUu6GD+NbCUZRc2guXLi
         fU37RXvdSY6KnFM64ZRR2r9diCMiFQA8UzgCFag+4Imb2S47Kpqb98Cg+bxm7J4Hac9/
         JnfRFuIB+RuMDq0yjYPi7oAq5wY5y166qjXEc4h0V46g5VyHoJR7DGF1OYQGwl2lmN3M
         mLZw==
X-Gm-Message-State: AOJu0YynhsG1zdUYsFMpKARDyyQg92FSoqtgbeLWRAWnRXINyij1WM7y
	K/w0Vcf2PeQd1ajVnN4hBzwVeMA55tKS6D6SCuswMAMMvKBNvHdYKx2Xr/hByGk=
X-Google-Smtp-Source: AGHT+IGr2eUgMfvcHAkiT+YQoFVeJXaLBH9DTCWcfk/2jwuJpA8kLUYbW3h+myCKfDjGbmV4gzmU3w==
X-Received: by 2002:a05:6102:549e:b0:468:1c37:39fd with SMTP id bk30-20020a056102549e00b004681c3739fdmr471392vsb.3.1705698862306;
        Fri, 19 Jan 2024 13:14:22 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id mk13-20020a056214580d00b0068178f50102sm33552qvb.25.2024.01.19.13.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 13:14:21 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/11] linux-yocto/6.6: update to v6.6.11
Date: Fri, 19 Jan 2024 16:14:09 -0500
Message-Id: <4953e0f4131f65afc67e406d4c1eea2a90661771.1705698717.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1705698717.git.bruce.ashfield@gmail.com>
References: <cover.1705698717.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Jan 2024 21:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194067

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    22852eaf43ec Linux 6.6.11
    e53b78e3cfb1 media: qcom: camss: Comment CSID dt_id field
    c897fb3da8a7 cxl/memdev: Hold region_rwsem during inject and clear poison ops
    0a460481df43 cxl/hdm: Fix a benign lockdep splat
    c56f610fe947 cxl: Add cxl_num_decoders_committed() usage to cxl_test
    2e22a9095fe3 mmc: sdhci-sprd: Fix eMMC init failure after hw reset
    73432eb655a8 mmc: core: Cancel delayed work before releasing host
    882ab492767a mmc: rpmb: fixes pause retune on all RPMB partitions.
    1f1e1d8006ba mmc: meson-mx-sdhc: Fix initialization frozen issue
    ceb3af686015 drm/amd/display: Fix sending VSC (+ colorimetry) packets for DP/eDP displays without PSR
    fd3247512698 drm/amd/display: add nv12 bounding box
    039c4551438e drm/amdgpu: skip gpu_info fw loading on navi12
    2247df454c7b mm: fix unmap_mapping_range high bits shift bug
    b240a3ef3d91 i2c: core: Fix atomic xfer check for non-preempt config
    dfb8a426e030 x86/kprobes: fix incorrect return address calculation in kprobe_emulate_call_indirect
    d44bd49abe3d firewire: ohci: suppress unexpected system reboot in AMD Ryzen machines and ASM108x/VT630x PCIe cards
    e73022d60017 mm/mglru: skip special VMAs in lru_gen_look_around()
    22c8e0b87bcb net: constify sk_dst_get() and __sk_dst_get() argument
    f797a2f74a8e net: libwx: fix memory leak on free page
    51079378514d cxl/pmu: Ensure put_device on pmu devices
    95b3904a261a net: prevent mss overflow in skb_segment()
    e1b45baa2e38 powerpc/pseries/vas: Migration suspend waits for no in-progress open windows
    24f855a88c95 RISCV: KVM: update external interrupt atomically for IMSIC swfile
    443860676828 dmaengine: fsl-edma: fix wrong pointer check in fsl_edma3_attach_pd()
    7734bb38104a dmaengine: idxd: Protect int_handle field in hw descriptor
    1695423c9630 drm/amd/display: Increase frame warning limit with KASAN or KCSAN in dml
    e4a5b2f60e06 kernel/resource: Increment by align value in get_free_mem_region()
    4c269350e3c6 cxl/core: Always hold region_rwsem while reading poison lists
    07f9a20b899a cxl: Add cxl_decoders_committed() helper
    9826255cdec6 drm/amd/display: Increase num voltage states to 40
    93d67b62c768 drm/i915: Call intel_pre_plane_updates() also for pipes getting enabled
    c33fc69553b2 clk: rockchip: rk3128: Fix SCLK_SDMMC's clock name
    b58d2fc1f94d clk: rockchip: rk3128: Fix aclk_peri_src's parent
    09aa95c0e714 phy: sunplus: return negative error code in sp_usb_phy_probe
    c7573ba35562 phy: mediatek: mipi: mt8183: fix minimal supported frequency
    9cdfbfc652ac iommu/vt-d: Support enforce_cache_coherency only for empty domains
    41294f9d1782 iio: imu: adis16475: use bit numbers in assign_bit()
    634d43a2dafa dmaengine: fsl-edma: Add judgment on enabling round robin arbitration
    df9e5371221f dmaengine: fsl-edma: Do not suspend and resume the masked dma channel when the system is sleeping
    2bd6f2164821 dmaengine: ti: k3-psil-am62a: Fix SPI PDMA data
    6c9e7caeb29a dmaengine: ti: k3-psil-am62: Fix SPI PDMA data
    a7ccc9d9001b phy: ti: gmii-sel: Fix register offset when parent is not a syscon node
    42db0099eca3 KVM: s390: vsie: fix wrong VIR 37 when MSO is used
    b649a7fe9a8b riscv: don't probe unaligned access speed if already done
    5d1e4e5fd1e9 rcu/tasks-trace: Handle new PF_IDLE semantics
    b3ffc1167584 rcu/tasks: Handle new PF_IDLE semantics
    547c59c83abf rcu: Introduce rcu_cpu_online()
    39d04e558882 rcu: Break rcu_node_0 --> &rq->__lock order
    17f449600a98 ACPI: thermal: Fix acpi_thermal_unregister_thermal_zone() cleanup
    04ebb29dc9aa RDMA/mlx5: Fix mkey cache WQ flush
    eaab31dceb11 clk: si521xx: Increase stack based print buffer size in probe
    94eacb45d816 vfio/mtty: Overhaul mtty interrupt handling
    6feb483ab744 crypto: hisilicon/qm - fix EQ/AEQ interrupt issue
    bcf6fe34a314 crypto: qat - fix double free during reset
    64170e83ae89 crypto: xts - use 'spawn' for underlying single-block cipher
    3f1800cade99 bpftool: Align output skeleton ELF code
    0b39339f8afa bpftool: Fix -Wcast-qual warning
    030346df8cc4 tcp: derive delack_max from rto_min
    88a884dec104 media: qcom: camss: Fix genpd cleanup
    3c97918a8a65 media: qcom: camss: Fix V4L2 async notifier error path
    f302f37f1630 xsk: add multi-buffer support for sockets sharing umem
    bf07fda050c8 mm/memory-failure: pass the folio and the page to collect_procs()
    393155f9b265 mm: convert DAX lock/unlock page to lock/unlock folio
    200bc3661325 net: Implement missing SO_TIMESTAMPING_NEW cmsg support
    ea37c4b61107 bnxt_en: Remove mis-applied code from bnxt_cfg_ntp_filters()
    428ae1b99fce net: ravb: Wait for operating mode to be applied
    ba75a06fa273 asix: Add check for usbnet_get_endpoints
    67a4a2589db0 octeontx2-af: Re-enable MAC TX in otx2_stop processing
    f725e894b123 octeontx2-af: Always configure NIX TX link credits based on max frame size
    511e4a579624 net/smc: fix invalid link access in dumping SMC-R connections
    ed192246db75 net/qla3xxx: fix potential memleak in ql_alloc_buffer_queues
    3ffd05c2cccd virtio_net: fix missing dma unmap for resize
    e2e5c2a3f90f virtio_net: avoid data-races on dev->stats fields
    6d2e4e56576f apparmor: Fix move_mount mediation by detecting if source is detached
    1d95d871f907 igc: Fix hicredit calculation
    17f5cfeb15d6 i40e: Restore VF MSI-X state during PCI reset
    1ee4eb8024ee ASoC: meson: g12a-tohdmitx: Fix event generation for S/PDIF mux
    3d5a6ed6aa43 ASoC: meson: g12a-toacodec: Fix event generation
    28fdf45be31f ASoC: meson: g12a-tohdmitx: Validate written enum values
    97ee19ff4914 ASoC: meson: g12a-toacodec: Validate written enum values
    d715f2949a9c i40e: fix use-after-free in i40e_aqc_add_filters()
    d5e0bb03d99c net: Save and restore msg_namelen in sock_sendmsg
    9824064683a7 netfilter: nft_immediate: drop chain reference counter on error
    97cbb828482a netfilter: nf_nat: fix action not being set for all ct states
    d4969c264d91 net: bcmgenet: Fix FCS generation for fragmented skbuffs
    9f2e244bfc9e sfc: fix a double-free bug in efx_probe_filters
    015414fdc068 ARM: sun9i: smp: Fix array-index-out-of-bounds read in sunxi_mc_smp_init
    4d9b792986dd selftests: bonding: do not set port down when adding to bond
    742e4af3d7d7 net: Implement missing getsockopt(SO_TIMESTAMPING_NEW)
    d090faafd954 r8169: Fix PCI error on system resume
    4083c9bc3809 net: sched: em_text: fix possible memory leak in em_text_destroy()
    463fe6953f3b mlxbf_gige: fix receive packet race condition
    ad0ea7a29031 ASoC: mediatek: mt8186: fix AUD_PAD_TOP register and offset
    4deed2c6027b ASoC: fsl_rpmsg: Fix error handler with pm_runtime_enable
    38036a739ef1 igc: Check VLAN EtherType mask
    08144bac8d23 igc: Check VLAN TCI mask
    4109b21e785c igc: Report VLAN EtherType matching back to user
    0ec87fc8be95 i40e: Fix filter input checks to prevent config with invalid values
    a659ce14c776 ice: Shut down VSI with "link-down-on-close" enabled
    49b1e2aa233c ice: Fix link_down_on_close message
    03ed388f9bb8 drm/i915/perf: Update handling of MMIO triggered reports
    c3d24a3d380b drm/i915/dp: Fix passing the correct DPCD_REV for drm_dp_set_phy_test_pattern
    029d4ab2b772 octeontx2-af: Fix marking couple of structure as __packed
    fb195df90544 nfc: llcp_core: Hold a ref to llcp_local->dev when holding a ref to llcp_local
    d27e2798e3ea netfilter: nf_tables: set transport offset from mac header for netdev/egress
    8b410abf1729 drm/bridge: ps8640: Fix size mismatch warning w/ len
    1688af7d86ed drm/bridge: ti-sn65dsi86: Never store more than msg->size bytes in AUX xfer
    ce5b06e2a7bb drm/bridge: parade-ps8640: Never store more than msg->size bytes in AUX xfer
    ad1220bb4bcf wifi: iwlwifi: pcie: don't synchronize IRQs from IRQ
    f8d0c6d1992c accel/qaic: Implement quirk for SOC_HW_VERSION
    efcedd56998b accel/qaic: Fix GEM import path code
    30912a7f64de KVM: x86/pmu: fix masking logic for MSR_CORE_PERF_GLOBAL_CTRL
    30aae98b75b4 cifs: do not depend on release_iface for maintaining iface_list
    40fc7dfd17ec cifs: cifs_chan_is_iface_active should be called with chan_lock held
    feef4dc27da0 drm/mgag200: Fix gamma lut not initialized for G200ER, G200EV, G200SE
    8cc22ba3f77c Revert "PCI/ASPM: Remove pcie_aspm_pm_state_change()"
    c25546cac381 mptcp: prevent tcp diag from closing listener subflows
    67df4c4a4854 drm/amd/display: pbn_div need be updated for hotplug event
    0c0192321762 ALSA: hda/realtek: Fix mute and mic-mute LEDs for HP ProBook 440 G6
    855c75f35020 ALSA: hda/realtek: fix mute/micmute LEDs for a HP ZBook
    0fc0d040f430 ALSA: hda/realtek: enable SND_PCI_QUIRK for hp pavilion 14-ec1xxx series
    0ccbd44d7d72 ALSA: hda/tas2781: remove sound controls in unbind
    cb7a397dbb7e ALSA: hda/tas2781: move set_drv_data outside tasdevice_init
    aee67bbe969d ALSA: hda/tas2781: do not use regcache
    da89365158f6 keys, dns: Fix missing size check of V1 server-list header
    c9a51ebb4bac Linux 6.6.10
    9b603077e29c Revert "platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe"
    b7f1c01b55ad netfilter: nf_tables: skip set commit for deleted/destroyed sets
    e904e81fd3c2 wifi: nl80211: fix deadlock in nl80211_set_cqm_rssi (6.6.x)
    d673099085dd wifi: cfg80211: fix CQM for non-range use
    ccd48707d511 tracing: Fix blocked reader of snapshot buffer
    a12754a8f5ac ftrace: Fix modification of direct_function hash while in use
    baa88944038b ring-buffer: Fix wake ups when buffer_percent is set to 100
    c62b9a2daf28 Revert "nvme-fc: fix race between error recovery and creating association"
    d16c5d215b53 mm/memory-failure: check the mapcount of the precise page
    8c7da70d9ae4 mm/memory-failure: cast index to loff_t before shifting it
    07550b1461d4 mm: migrate high-order folios in swap cache correctly
    d16eb52c176c mm/filemap: avoid buffered read/write race to read inconsistent data
    09141f08fdf6 selftests: secretmem: floor the memory size to the multiple of page_size
    2c30b8b105d6 maple_tree: do not preallocate nodes for slot stores
    11d41d01c088 platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe
    7d5f219f1ef6 ksmbd: fix slab-out-of-bounds in smb_strndup_from_utf16()
    33fd5fb1258b platform/x86/intel/pmc: Move GBE LTR ignore to suspend callback
    91dcd5ee1e11 platform/x86/intel/pmc: Allow reenabling LTRs
    8663b99c38a6 platform/x86/intel/pmc: Add suspend callback
    b5f63f5e8a68 block: renumber QUEUE_FLAG_HW_WC
    cf742d095585 mptcp: fix inconsistent state on fastopen race
    44ee4764c60a mptcp: fix possible NULL pointer dereference on close
    34c7757aa561 mptcp: refactor sndbuf auto-tuning
    183c8972b6a6 linux/export: Ensure natural alignment of kcrctab array
    466e9af15507 linux/export: Fix alignment for 64-bit ksymtab entries
    7844d7d8d8af kexec: select CRYPTO from KEXEC_FILE instead of depending on it
    78422b744ad9 kexec: fix KEXEC_FILE dependencies
    28d6cde17f21 virtio_ring: fix syncs DMA memory with different direction
    9a4987444330 fs: cifs: Fix atime update check
    23171df51f60 client: convert to new timestamp accessors
    5b5599a7eee5 fs: new accessor methods for atime and mtime
    861eaba7ca6c ksmbd: avoid duplicate opinfo_put() call on error of smb21_lease_break_ack()
    ab5a0a1c40be ksmbd: lazy v2 lease break on smb2_write()
    3c1e602a34e1 ksmbd: send v2 lease break notification for directory
    572388ff429a ksmbd: downgrade RWH lease caching state to RH for directory
    d7af4e499c30 ksmbd: set v2 lease capability
    bc025d49c507 ksmbd: set epoch in create context v2 lease
    3da84670973b ksmbd: don't update ->op_state as OPLOCK_STATE_NONE on error
    b06c96373179 ksmbd: move setting SMB2_FLAGS_ASYNC_COMMAND and AsyncId
    fa86141f357f ksmbd: release interim response after sending status pending response
    e4ae19537558 ksmbd: move oplock handling after unlock parent dir
    f263652dc6c9 ksmbd: separately allocate ci per dentry
    8d69547b94e0 ksmbd: prevent memory leak on error return
    cdb93ef9cfcc ksmbd: fix kernel-doc comment of ksmbd_vfs_kern_path_locked()
    b48bb8c2ecdb ksmbd: no need to wait for binded connection termination at logoff
    0bd595cb8e8b ksmbd: add support for surrogate pair conversion
    dca63bad3950 ksmbd: fix missing RDMA-capable flag for IPoIB device in ksmbd_rdma_capable_netdev()
    31c453b3743f ksmbd: fix kernel-doc comment of ksmbd_vfs_setxattr()
    d73737884ea4 ksmbd: reorganize ksmbd_iov_pin_rsp()
    3ba08c420d05 ksmbd: Remove unused field in ksmbd_user struct

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 90e5ead1f4..2094613aa0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7e43b4538ce1a9084c4a5f1b22372c98aa888958"
-SRCREV_meta ?= "11390e802ca72f3549b9356f036b17e54afd7a34"
+SRCREV_machine ?= "3e67e7e050ae8af74f9158dc71f952539f1516e5"
+SRCREV_meta ?= "25ae36cd00a816ba8aab368a443cab1c166e3c2f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.9"
+LINUX_VERSION ?= "6.6.11"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 5d87855a27..842e9c7693 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.9"
+LINUX_VERSION ?= "6.6.11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ff7ae7b32324226330214197e9b849d1aa35accd"
-SRCREV_meta ?= "11390e802ca72f3549b9356f036b17e54afd7a34"
+SRCREV_machine ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
+SRCREV_meta ?= "25ae36cd00a816ba8aab368a443cab1c166e3c2f"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index dbe4db9514..9dae76e9a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b0567ccb83b03434efe6bc00d7d672a59d50b82a"
-SRCREV_machine:qemuarm64 ?= "ff7ae7b32324226330214197e9b849d1aa35accd"
-SRCREV_machine:qemuloongarch64 ?= "ff7ae7b32324226330214197e9b849d1aa35accd"
-SRCREV_machine:qemumips ?= "df19050d1276ce9418652a39c31b77925b18fb17"
-SRCREV_machine:qemuppc ?= "ff7ae7b32324226330214197e9b849d1aa35accd"
-SRCREV_machine:qemuriscv64 ?= "ff7ae7b32324226330214197e9b849d1aa35accd"
-SRCREV_machine:qemuriscv32 ?= "ff7ae7b32324226330214197e9b849d1aa35accd"
-SRCREV_machine:qemux86 ?= "ff7ae7b32324226330214197e9b849d1aa35accd"
-SRCREV_machine:qemux86-64 ?= "ff7ae7b32324226330214197e9b849d1aa35accd"
-SRCREV_machine:qemumips64 ?= "2cab83c3f46765b9390918a91c4fc64a873a3443"
-SRCREV_machine ?= "ff7ae7b32324226330214197e9b849d1aa35accd"
-SRCREV_meta ?= "11390e802ca72f3549b9356f036b17e54afd7a34"
+SRCREV_machine:qemuarm ?= "53699f09df655724152c7c82ce94ebbe8a0a4fd4"
+SRCREV_machine:qemuarm64 ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
+SRCREV_machine:qemuloongarch64 ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
+SRCREV_machine:qemumips ?= "cc1dc06263a8d1c9d78dadc4045fbd47469b791c"
+SRCREV_machine:qemuppc ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
+SRCREV_machine:qemuriscv64 ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
+SRCREV_machine:qemuriscv32 ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
+SRCREV_machine:qemux86 ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
+SRCREV_machine:qemux86-64 ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
+SRCREV_machine:qemumips64 ?= "cbf59cfe385657b0ee385264be2fcf785f6f1959"
+SRCREV_machine ?= "1c28ec6773065e82643c9ec1cb7dd2bd8ab1f929"
+SRCREV_meta ?= "25ae36cd00a816ba8aab368a443cab1c166e3c2f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "5e9df83a705290c4d974693097df1da9cbe25854"
+SRCREV_machine:class-devupstream ?= "22852eaf43ec64b7dc0aa72687b22237b65a88f9"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.9"
+LINUX_VERSION ?= "6.6.11"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


