Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E4FE71D33
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:17:26 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.28144.1696018645825286192
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:17:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JDEhxJ1e;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7741bffd123so912119085a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696018645; x=1696623445; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gv6uggtVGAx8O0Y0kHZD3uAf7jPIDHw0Ai88WLOdkWg=;
        b=JDEhxJ1epqVN5H4HZp+QX4olp7Ner2eVTVydKqP22LpQs4jFewEFtIylQB3f0RTbEe
         ZSo0tMvfryRIxHJW1qUAj1/pOSCrRMaz06W51dzuc1yM+uEhIFgymRYTLmyaGACKXGCz
         trbO9fJX1ohls2fHQW9sx3KTVBzN9Gw3xFGoReuXlOd6tsMMxLnyv11hgN0xnyrefijq
         EilP1sPPg/q58f61Es8SWgPKyiHp9+Ew890x/63NmWTWCKmBJnIlNj1c5781bPi0DA7T
         ccN85lulVUDeBJUKtUY6inx5YvLaRJtPxmDfRftm8WgnR8j42zD3H7UXoh623XSb89P0
         HrkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696018645; x=1696623445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gv6uggtVGAx8O0Y0kHZD3uAf7jPIDHw0Ai88WLOdkWg=;
        b=hssjRqekw0+yCCZ1Gjs6l1FOMrv+t5ZSS/YdMesmQnCfQsRTcYyGOh4HjUY06Q8y/P
         mQE5cQUFssQLIB/3AKjauJSwygpgPaqjbsNyPuhXm6IZ0jzMXcuam2yp1fi0ZtTsijEy
         kESnVXbQdlEitmLVkr2+lVWv0qp3QrIa18R8J+Yel5MdCXE5eJpF9BWsMHvdrwYlEiB3
         vp1DkmnCdMGw4PZiKLvrKpdL3SXsw4ymd0NZeUM+GdEoEeIUHXLV759cXoUHl8TrKoXY
         vBKS3f6ONg8I3lQNaA02o32feJ60bHSfyvHkmCKyYJE943b4oNi1Nj4qAydNVV1H0yIf
         H4aQ==
X-Gm-Message-State: AOJu0Yxv5XGMhVwjLkw+Ur7DjsJaV45+AlagcYm+ldnW4mP7Dr4UdW/s
	hcuQOau5YeZ+2A/aODGgJw9rMMeQah3gCA==
X-Google-Smtp-Source: AGHT+IEwJW//U6KyaO4FgJchbc7yEyWg0HyKBZiLiVGCtF9QYLkPJDamnn8iPgN4dPfVmrtaLZYbhA==
X-Received: by 2002:a05:620a:2883:b0:760:6b8e:eba with SMTP id j3-20020a05620a288300b007606b8e0ebamr5464391qkp.12.1696018644742;
        Fri, 29 Sep 2023 13:17:24 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id i17-20020ae9ee11000000b00767d8e12ce3sm7199262qkg.49.2023.09.29.13.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:17:23 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/4] linux-yocto/5.4: update to v5.4.256
Date: Fri, 29 Sep 2023 16:17:18 -0400
Message-Id: <20230929201719.3517611-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929201719.3517611-1-bruce.ashfield@gmail.com>
References: <20230929201719.3517611-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 20:17:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188444

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    0c2544add9fc Linux 5.4.256
    1ba96e65ef4c Revert "MIPS: Alchemy: fix dbdma2"
    94aef0fe5a82 powerpc/pmac/smp: Drop unnecessary volatile qualifier
    b29a10fd0734 powerpc/pmac/smp: Avoid unused-variable warnings
    5eb967dd50a5 Linux 5.4.255
    e171795856a6 dma-buf/sw_sync: Avoid recursive lock during fence signal
    f49cac7634da pinctrl: renesas: rza2: Add lock around pinctrl_generic{{add,remove}_group,{add,remove}_function}
    197c546a598a clk: Fix undefined reference to `clk_rate_exclusive_{get,put}'
    7fd9cded5646 scsi: core: raid_class: Remove raid_component_add()
    56428d89a0da scsi: snic: Fix double free in snic_tgt_create()
    b6db4ef5ea41 irqchip/mips-gic: Don't touch vl_map if a local interrupt is not routable
    61b5d77169e1 Documentation/sysctl: document page_lock_unfairness
    b2421a196cb0 ALSA: pcm: Check for null pointer of pointer substream before dereferencing it
    e8bf830efa8a interconnect: Do not skip aggregation for disabled paths
    456a7a73404c Revert "ALSA: pcm: Use SG-buffer only when direct DMA is available"
    52a7c86e63d2 ALSA: pcm: Fix build error on m68k and others
    a1ef12540ebd rtnetlink: Reject negative ifindexes in RTM_NEWLINK
    c404e1e19780 mm: allow a controlled amount of unfairness in the page lock
    97640d8e2cee x86/fpu: Set X86_FEATURE_OSXSAVE feature after enabling OSXSAVE in CR4
    b156ce3b3b61 drm/display/dp: Fix the DP DSC Receiver cap size
    9e5fe282f9e2 PCI: acpiphp: Use pci_assign_unassigned_bridge_resources() only for non-root bus
    ac0e0df5180c media: vcodec: Fix potential array out-of-bounds in encoder queue_setup
    79a05ca73637 radix tree: remove unused variable
    32639f13441b lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for 32-bit kernels
    c5f261825ff6 batman-adv: Hold rtnl lock during MTU update via netlink
    61b71562beb3 batman-adv: Fix batadv_v_ogm_aggr_send memory leak
    5fb1a2133707 batman-adv: Fix TT global entry leak when client roamed back
    e6e9d7808179 batman-adv: Do not get eth header before batadv_check_management_packet
    c97442e09884 batman-adv: Don't increase MTU when set by user
    22288ea6beba batman-adv: Trigger events for auto adjusted MTU
    3b83759fd46c nfsd: Fix race to FREE_STATEID and cl_revoked
    c0284760f470 clk: Fix slab-out-of-bounds error in devm_clk_release()
    a0bc5cf2e7f4 NFSv4: Fix dropped lock for racing OPEN and delegation return
    815fb2531a48 ibmveth: Use dcbf rather than dcbfl
    35e31aff6160 bonding: fix macvlan over alb bond support
    faf3f988cc63 net: remove bond_slave_has_mac_rcu()
    eebd074af272 net/sched: fix a qdisc modification with ambiguous command request
    62383d9fa1af igb: Avoid starting unnecessary workqueues
    adef04cc4819 net: validate veth and vxcan peer ifindexes
    52ddda8d218b net: bcmgenet: Fix return value check for fixed_phy_register()
    189ad377d1ca net: bgmac: Fix return value check for fixed_phy_register()
    dcbfcb54a28f ipvlan: Fix a reference count leak warning in ipvlan_ns_exit()
    8e6433fecb2b dccp: annotate data-races in dccp_poll()
    7d6cc6919952 sock: annotate data-races around prot->memory_pressure
    d28ea7acfae7 octeontx2-af: SDP: fix receive link config
    05319d707732 tracing: Fix memleak due to race between current_tracer and trace
    c8920972d086 drm/amd/display: check TG is non-null before checking if enabled
    7d4174a99b1d drm/amd/display: do not wait for mpc idle if tg is disabled
    94239d1830a1 ASoC: fsl_sai: Disable bit clock with transmitter
    ef9cae4a6c8d ASoC: fsl_sai: Add new added registers and new bit definition
    1b3d75104542 ASoC: fsl_sai: Refine enable/disable TE/RE sequence in trigger()
    f9afb326b7ba regmap: Account for register length in SMBus I/O limits
    7e1d1456c8db ALSA: pcm: Fix potential data race at PCM memory allocation helpers
    140797d0a46e ALSA: pcm: Use SG-buffer only when direct DMA is available
    95b30a431254 ALSA: pcm: Set per-card upper limit of PCM buffer allocations
    d0ef103e192c dm integrity: reduce vmalloc space footprint on 32-bit architectures
    072d247d7a62 dm integrity: increase RECALC_SECTORS to improve recalculate speed
    4e96ee117500 fbdev: fix potential OOB read in fast_imageblit()
    ebf84320a587 fbdev: Fix sys_imageblit() for arbitrary image widths
    96f8e80656ec fbdev: Improve performance of sys_imageblit()
    7e5b7360df81 MIPS: cpu-features: Use boot_cpu_type for CPU type based features
    302a8fbf8cab MIPS: cpu-features: Enable octeon_cache by cpu_type
    7b57fc3f4c49 fs: dlm: fix mismatch of plock results from userspace
    721d5b514dfc fs: dlm: use dlm_plock_info for do_unlock_close
    da794f6dd549 fs: dlm: change plock interrupted message to debug again
    f03726ef19e1 fs: dlm: add pid to debug log
    8b73497e50ef dlm: replace usage of found with dedicated list iterator variable
    526cc04d718b dlm: improve plock logging if interrupted
    7abd6dce29f6 PCI: acpiphp: Reassign resources on bridge if necessary
    fce081555293 net: phy: broadcom: stub c45 read/write for 54810
    e91d5ace7051 mmc: f-sdh30: fix order of function calls in sdhci_f_sdh30_remove
    a0e20e267aec net: xfrm: Amend XFRMA_SEC_CTX nla_policy structure
    f0c10a4497af net: fix the RTO timer retransmitting skb every 1ms if linear option is enabled
    b1be2cfcf6cf virtio-net: set queues after driver_ok
    4821df2ffe38 af_unix: Fix null-ptr-deref in unix_stream_sendpage().
    0afc186aba1e netfilter: set default timeout to 3 secs for sctp shutdown send and recv state
    6875690b0eea mmc: block: Fix in_flight[issue_type] value error
    54deee3fab1b mmc: wbsd: fix double mmc_free_host() in wbsd_init()
    4259dd534245 cifs: Release folio lock on fscache read hit.
    03373410247b ALSA: usb-audio: Add support for Mythware XA001AU capture and playback interfaces.
    b653289ca646 serial: 8250: Fix oops for port->pm on uart_change_pm()
    7b4e6bff03e2 ASoC: meson: axg-tdm-formatter: fix channel slot allocation
    29d862ee5fef ASoC: rt5665: add missed regulator_bulk_disable
    f21fa1892d42 ARM: dts: imx: Set default tuning step for imx6sx usdhc
    aadee0ae0a5f ARM: dts: imx: Set default tuning step for imx7d usdhc
    a23e10dafd77 ARM: dts: imx: Adjust dma-apbh node name
    536c1bbedd5d ARM: dts: imx7s: Drop dma-apb interrupt-names
    37cfbf847c2d bus: ti-sysc: Flush posted write on enable before reset
    4637b2fa6541 bus: ti-sysc: Improve reset to work with modules with no sysconfig
    210ff31342ad net: do not allow gso_size to be set to GSO_BY_FRAGS
    1c7db7abd4ba sock: Fix misuse of sk_under_memory_pressure()
    aa670bdefc0c net: dsa: mv88e6xxx: Wait for EEPROM done before HW reset
    702c58a05eb5 i40e: fix misleading debug logs
    ac16de2d02eb team: Fix incorrect deletion of ETH_P_8021AD protocol vid from slaves
    81da9e2c4255 netfilter: nft_dynset: disallow object maps
    bdd7c2ff4143 ipvs: fix racy memcpy in proc_do_sync_threshold
    38e5c37bfab1 selftests: mirror_gre_changes: Tighten up the TTL test match
    8046beb890eb xfrm: add NULL check in xfrm_update_ae_params
    d34c30442d5e ip_vti: fix potential slab-use-after-free in decode_session6
    eb47e612e59c ip6_vti: fix slab-use-after-free in decode_session6
    db0e50741f03 xfrm: fix slab-use-after-free in decode_session6
    64c6df80d35a xfrm: interface: rename xfrm_interface.c to xfrm_interface_core.c
    32cc777c0a53 net: af_key: fix sadb_x_filter validation
    373848d51fde net: xfrm: Fix xfrm_address_filter OOB read
    a0a462a0f209 btrfs: fix BUG_ON condition in btrfs_cancel_balance
    cc423a972cfd tty: serial: fsl_lpuart: Clear the error flags by writing 1 for lpuart32 platforms
    1d29e21ed09f powerpc/rtas_flash: allow user copy to flash block cache objects
    97ddf1c2105a fbdev: mmp: fix value check in mmphw_probe()
    3259e2d8781f i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
    b788ad3b2468 virtio-mmio: don't break lifecycle of vm_dev
    e22a4b77b69d virtio-mmio: Use to_virtio_mmio_device() to simply code
    432429d1b25f virtio-mmio: convert to devm_platform_ioremap_resource
    12c4c227891e nfsd: Remove incorrect check in nfsd4_validate_stateid
    a4e3c4cd02f5 nfsd4: kill warnings on testing stateids with mismatched clientids
    ff652b0150a4 net/ncsi: Fix gma flag setting after response
    b66a1defb205 tracing/probes: Fix to update dynamic data counter if fetcharg uses it
    bdc309d89b32 tracing/probes: Have process_fetch_insn() take a void * instead of pt_regs
    cc93a372e03e leds: trigger: netdev: Recheck NETDEV_LED_MODE_LINKUP on dev rename
    939b8b312adc mmc: sunxi: fix deferred probing
    c6d1a281ae83 mmc: bcm2835: fix deferred probing
    b48b4b1885f7 USB: dwc3: qcom: fix NULL-deref on suspend
    6da1f9fd9c8e usb: dwc3: qcom: Add helper functions to enable,disable wake irqs
    5335bb0cefde interconnect: Add helpers for enabling/disabling a path
    e062fb979410 interconnect: Move internal structs into a separate file
    abc25a18a64c irqchip/mips-gic: Use raw spinlock for gic_lock
    05de6069b52c irqchip/mips-gic: Get rid of the reliance on irq_cpu_online()
    1224e5a9787c ALSA: hda: Fix unhandled register update during auto-suspend period
    a55d55a30781 PM: runtime: Add pm_runtime_get_if_active()
    e5d98d42bca5 PM-runtime: add tracepoints for usage_count changes
    59aba9d5cd36 iommu/amd: Fix "Guest Virtual APIC Table Root Pointer" configuration in IRTE
    8f302378c704 iio: addac: stx104: Fix race condition when converting analog-to-digital
    7251b2915d33 iio: addac: stx104: Fix race condition for stx104_write_raw()
    70d135e7de08 iio: stx104: Move to addac subdirectory
    8ba99f7fc7eb iio: adc: stx104: Implement and utilize register structures
    4edf338adee7 iio: adc: stx104: Utilize iomap interface
    e13b26d0dd10 iio: add addac subdirectory
    e6f66a0ad755 IMA: allow/fix UML builds
    635278e97a94 powerpc/kasan: Disable KCOV in KASAN code
    109f0aaa0b88 ALSA: hda: fix a possible null-pointer dereference due to data race in snd_hdac_regmap_sync()
    97ed58437705 ALSA: hda/realtek: Add quirks for Unis H3C Desktop B760 & Q760
    c6059af6bf5e drm/amdgpu: Fix potential fence use-after-free v2
    fe49aa73cca6 Bluetooth: L2CAP: Fix use-after-free
    22100df1d57f pcmcia: rsrc_nonstatic: Fix memory leak in nonstatic_release_resource_db()
    b4a7ab57effb gfs2: Fix possible data races in gfs2_show_options()
    c4d5c945b69a usb: chipidea: imx: don't request QoS for imx8ulp
    c1c5826223ae media: platform: mediatek: vpu: fix NULL ptr dereference
    ef009fe2010e media: v4l2-mem2mem: add lock to protect parameter num_rdy
    2a8807f9f511 FS: JFS: Check for read-only mounted filesystem in txBegin
    a7d17d6bd7cd FS: JFS: Fix null-ptr-deref Read in txBegin
    2225000d62c1 MIPS: dec: prom: Address -Warray-bounds warning
    6e7d9d76e565 fs: jfs: Fix UBSAN: array-index-out-of-bounds in dbAllocDmapLev
    3f1368af47ac udf: Fix uninitialized array access for some pathnames
    8f203dd401e8 ovl: check type and offset of struct vfsmount in ovl_entry
    8abed186aabd HID: add quirk for 03f0:464a HP Elite Presenter Mouse
    3f378783c47b quota: fix warning in dqgrab()
    c3a1f5ba11c5 quota: Properly disable quotas when add_dquot_ref() fails
    dd445ebbee88 ALSA: emu10k1: roll up loops in DSP setup code for Audigy
    b8fab6aebdf2 drm/radeon: Fix integer overflow in radeon_cs_parser_init
    3a3bb438dae3 macsec: use DEV_STATS_INC()
    b5e20a3ddea4 macsec: Fix traffic counters/statistics
    4b854879f82d selftests: forwarding: tc_flower: Relax success criterion
    e5883ffdd0a8 mmc: sdhci-f-sdh30: Replace with sdhci_pltfm
    e7bd70c3bc62 mmc: sdhci_f_sdh30: convert to devm_platform_ioremap_resource

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 38ffa5cce8..fefbb63209 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f2579170aa90e502fb972bdb87c150c909735056"
-SRCREV_meta ?= "b05cf0166411efabc3704035e61c93d8a299d702"
+SRCREV_machine ?= "ccbf907f43d15ffd113a58e77986ece2b9cd0b53"
+SRCREV_meta ?= "139494ae6aa521d549ad94aa51ace747d37ee4e4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.254"
+LINUX_VERSION ?= "5.4.256"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index ce8f4ddfea..febbf1cb7e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.254"
+LINUX_VERSION ?= "5.4.256"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "cb6922c0bf40c0171473ffad3e3c734af7535f9e"
-SRCREV_machine ?= "7121dcf1e4579162b3c5586cbdef005b155f2d00"
-SRCREV_meta ?= "b05cf0166411efabc3704035e61c93d8a299d702"
+SRCREV_machine_qemuarm ?= "b3176395ae2665d4d417c7b78dfb43dcf49462a9"
+SRCREV_machine ?= "88509f87ebd23e35482a3e7acd6f88a1ca209f9a"
+SRCREV_meta ?= "139494ae6aa521d549ad94aa51ace747d37ee4e4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index fc2a34dbcf..b5e85bd3ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -13,16 +13,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b48a097e3afc2c3cb75439a138ad62aac1f611de"
-SRCREV_machine_qemuarm64 ?= "30e9b327db697ba836406fd892dd2461dcc52978"
-SRCREV_machine_qemumips ?= "1404c8a0c15cd302e99cb766cf117f53ec9d12d4"
-SRCREV_machine_qemuppc ?= "8ddc9d98289ff9e0dd92a5ac4a1ab9395286c426"
-SRCREV_machine_qemuriscv64 ?= "b8f66b4961995b49af6b392be1a28132afe0f9a6"
-SRCREV_machine_qemux86 ?= "b8f66b4961995b49af6b392be1a28132afe0f9a6"
-SRCREV_machine_qemux86-64 ?= "b8f66b4961995b49af6b392be1a28132afe0f9a6"
-SRCREV_machine_qemumips64 ?= "c64d8a92d051687aaf05990475254ad795d5105d"
-SRCREV_machine ?= "b8f66b4961995b49af6b392be1a28132afe0f9a6"
-SRCREV_meta ?= "b05cf0166411efabc3704035e61c93d8a299d702"
+SRCREV_machine_qemuarm ?= "80d0730537aad4de79fc587a65ed7819790dcc6f"
+SRCREV_machine_qemuarm64 ?= "d569fe3e1a114ddcac5c4af67814405a614147ad"
+SRCREV_machine_qemumips ?= "0a41991fe10d34d22e87c276911142d2f1a67a93"
+SRCREV_machine_qemuppc ?= "1034463b20b1154014d1d6ffe87d018842ad094b"
+SRCREV_machine_qemuriscv64 ?= "c6ed5a124febbc8b22f95f9c8866188d290206ca"
+SRCREV_machine_qemux86 ?= "c6ed5a124febbc8b22f95f9c8866188d290206ca"
+SRCREV_machine_qemux86-64 ?= "c6ed5a124febbc8b22f95f9c8866188d290206ca"
+SRCREV_machine_qemumips64 ?= "60ddf305567af22536ec5c85d1af614a3b5bbfad"
+SRCREV_machine ?= "c6ed5a124febbc8b22f95f9c8866188d290206ca"
+SRCREV_meta ?= "139494ae6aa521d549ad94aa51ace747d37ee4e4"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -31,7 +31,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.254"
+LINUX_VERSION ?= "5.4.256"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


