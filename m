Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1229BC433EF
	for <webhook@archiver.kernel.org>; Sun, 13 Feb 2022 01:23:49 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web08.16303.1644715428070556611
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 17:23:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DL60/fHw;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id o10so11560797qkg.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 17:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p3PcsRjfWYN98VeH4EyP3ouJQYPG82KancFbAEMze/8=;
        b=DL60/fHwsQqa65LiYJambFpohNIXFPj6KwNh0+us2EkCcM/VhlD1COYHk4GTmvBuBV
         0tkmK4dhzJFXwqDI2jYydqSsIkWENgAoVNcl+UJWnE1tnhTuhZQICn4KG7EJwLikDrM2
         SpwGRXjLY+amGNq+E0HRy8pQ8VrJNbE9UsRpMaM/tg3ckR6nxlzgwWq5wLsjt9ElQtEt
         BbvLQFT53jnmYUz59IKK3YdtVjIU1eOoseTlyv+siTS2fGl5XPltOFFYEwI4BCNRGZM1
         H7Wju5MK/7GgfwaHfbCCf3DQa/fncLyFUW01Pz2P0s+v1U03otdxh92VzyociEUnhRho
         vJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p3PcsRjfWYN98VeH4EyP3ouJQYPG82KancFbAEMze/8=;
        b=ei2f82oUiS+LT4QEV8DIFc/lQW39GeHuY6ESdxDhjioC+riRlgXrF44S6jZpH8IrXQ
         UznO3JYdRpteXFsBi6IFc5yAC5xepL7V+NrZlFyi2Fe2meZczzKnH20mjWmpSI6NXTx4
         6XiQZG17maypgGYou7WYFpqZwsX4J6DMo/mtvqlXN79khxBlYmiC8J/Rlpw3Byzhc4Cj
         1fgXdtWHHnfpSjDrztV/oEU65jXrwCbAAf2IAaC7ZJDf/B4t5NxdYgDB+3ObX2ANCyD6
         qLKG/6l7NjBFwgI9y+gHJDXjAPFbf5tRbrXWmR999UgY7wEkOpMRqLQdLdBI8QOFA06U
         dabQ==
X-Gm-Message-State: AOAM531qQ/LvzDz031nLHY7ziuR62FKvoFvaFfBtoLRliI0bZoTscJZd
	IEYc8SX5q4PR5qyWx2/k27UYRRZek6Uj0g==
X-Google-Smtp-Source: 
 ABdhPJxVLV9pPg/854prU9i+7ba1xqcVii3oQRmPlITKrxUAdir6yUKO1AkdeWlIc9UK8QP4WhSllQ==
X-Received: by 2002:ae9:e609:: with SMTP id z9mr4151360qkf.195.1644715427014;
        Sat, 12 Feb 2022 17:23:47 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 w13sm13016556qkb.106.2022.02.12.17.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 17:23:46 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/5.15: update to v5.15.22
Date: Sat, 12 Feb 2022 20:23:41 -0500
Message-Id: 
 <e54ed06bc73819da414ba3e2aa256f0b5dfa0883.1644715271.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1644715271.git.bruce.ashfield@gmail.com>
References: <cover.1644715271.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Feb 2022 01:23:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161676

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    0bf5b7cc9848 Linux 5.15.22
    3853c4e27149 selftests: netfilter: check stateless nat udp checksum fixup
    b84753200e79 selftests: nft_concat_range: add test for reload with no element add/del
    7c0ee51fe998 gpio: mpc8xxx: Fix an ignored error return from platform_get_irq()
    3d631a1af0d7 gpio: idt3243x: Fix an ignored error return from platform_get_irq()
    ff43b75eea32 tools include UAPI: Sync sound/asound.h copy with the kernel sources
    f5afdefe188e cgroup/cpuset: Fix "suspicious RCU usage" lockdep warning
    e4a7e1418ab7 net: dsa: mt7530: make NET_DSA_MT7530 select MEDIATEK_GE_PHY
    f187daed64e1 ext4: fix incorrect type issue during replay_del_range
    1b6762ecdf3c ext4: fix error handling in ext4_fc_record_modified_inode()
    ce38bb98cec7 ext4: fix error handling in ext4_restore_inline_data()
    869cb287d893 ext4: modify the logic of ext4_mb_new_blocks_simple
    0cb4480bc4f4 ext4: prevent used blocks from being allocated during fast commit replay
    d583cb17ee50 EDAC/xgene: Fix deferred probing
    c6c04bb32b73 EDAC/altera: Fix deferred probing
    587dadb43c9a x86/perf: Default set FREEZE_ON_SMI for all
    e83d941fd344 perf/x86/intel/pt: Fix crash with stop filters in single-range mode
    0f4dcaeaf6ae perf stat: Fix display of grouped aliased events
    64e133ce280b perf: Copy perf_event_attr::sig_data on modification
    9a60e92b76d6 kvm/arm64: rework guest entry logic
    83071e2dad68 kvm: add guest_state_{enter,exit}_irqoff()
    aba976f96bbc rtc: cmos: Evaluate century appropriate
    3b5fcdfab628 e1000e: Separate ADP board type from TGP
    b3a4d501e91c tools/resolve_btfids: Do not print any commands when building silently
    7620887a7779 selftests: futex: Use variable MAKE instead of make
    c5610494fd45 selftests/exec: Remove pipe from TEST_GEN_FILES
    5e457aeab52a bpf: Use VM_MAP instead of VM_ALLOC for ringbuf
    62ab929a8f6b gve: fix the wrong AdminQ buffer queue index check
    3611f4f91e11 nfsd: nfsd4_setclientid_confirm mistakenly expires confirmed client.
    2f5a1ac68bdf scsi: bnx2fc: Make bnx2fc_recv_frame() mp safe
    0bb4c6b9ecff pinctrl: bcm2835: Fix a few error paths
    3cdcfa3c526e pinctrl: intel: fix unexpected interrupt
    ca63438dc5c4 pinctrl: intel: Fix a glitch when updating IRQ flags on a preconfigured line
    d4036172ca3b pinctrl: sunxi: Fix H616 I2S3 pin data
    f00012885e70 ASoC: codecs: wcd938x: fix return value of mixer put function
    b54ff87a1567 ASoC: codecs: lpass-rx-macro: fix sidetone register offsets
    aa7152f9f117 ASoC: codecs: wcd938x: fix incorrect used of portid
    baead410e5db ASoC: max9759: fix underflow in speaker_gain_control_put()
    263b947aa4c1 ASoC: cpcap: Check for NULL pointer after calling of_get_child_by_name
    841e6a6b831b ASoC: simple-card: fix probe failure on platform component
    c6cf5b5078db ASoC: xilinx: xlnx_formatter_pcm: Make buffer bytes multiple of period bytes
    9d44f73df070 ASoC: fsl: Add missing error handling in pcm030_fabric_probe
    8a15ac1786c9 drm/amd: avoid suspend on dGPUs w/ s2idle support when runtime PM enabled
    5cba71707f0a drm/i915/overlay: Prevent divide by zero bugs in scaling
    b2c91bee7970 drm/kmb: Fix for build errors with Warray-bounds
    a84854bc230a net: stmmac: ensure PTP time register reads are consistent
    27ea34ead54a net: stmmac: dump gmac4 DMA registers correctly
    0ced878998f2 net: macsec: Verify that send_sci is on when setting Tx sci explicitly
    e7a0b3a0806d net: macsec: Fix offload support for NETDEV_UNREGISTER event
    2967b08119d5 net: stmmac: properly handle with runtime pm in stmmac_dvr_remove()
    6358e093547c net: stmmac: dwmac-visconti: No change to ETHER_CLOCK_SEL for unexpected speed request.
    0ef6049f6649 net/smc: Forward wakeup to smc socket waitqueue after fallback
    ea8ecd2d65b4 net: ieee802154: Return meaningful error codes from the netlink helpers
    566bf0e1c761 netfilter: nft_reject_bridge: Fix for missing reply from prerouting
    94cd597e20ed net: ieee802154: ca8210: Stop leaking skb's
    6c6b19a99131 net: ieee802154: mcr20a: Fix lifs/sifs periods
    29e60b77a449 net: ieee802154: hwsim: Ensure proper channel selection at probe time
    bb7a226780e2 IB/cm: Release previously acquired reference counter in the cm_id_priv
    40e20ba90390 IB/hfi1: Fix tstats alloc and dealloc
    dd00b4f8f768 spi: uniphier: fix reference count leak in uniphier_spi_probe()
    66606d329d61 spi: meson-spicc: add IRQ check in meson_spicc_probe
    7352f2c26482 spi: mediatek: Avoid NULL pointer crash in interrupt
    101a1cf8af55 spi: bcm-qspi: check for valid cs before applying chip select
    ca1f48c30e5b iommu/amd: Fix loop timeout issue in iommu_ga_log_enable()
    336d096b62bd iommu/vt-d: Fix potential memory leak in intel_setup_irq_remapping()
    e4b74b89862c ALSA: hda: Skip codec shutdown in case the codec is not registered
    0c5c64335657 ALSA: hda: Fix signedness of sscanf() arguments
    c2a91f1ef38a ALSA: usb-audio: initialize variables that could ignore errors
    63c69c93d978 RDMA/mlx4: Don't continue event handler after memory allocation failure
    035ea99c537d RDMA/siw: Fix broken RDMA Read Fence/Resume logic.
    7d9ad6f9f38f IB/rdmavt: Validate remote_addr during loopback atomic tests
    2989ba9532ba RDMA/siw: Fix refcounting leak in siw_create_qp()
    2923948ffe08 RDMA/ucma: Protect mc during concurrent multicast leaves
    7715682f357d RDMA/cma: Use correct address when leaving multicast group
    0452c3dc851b KVM: arm64: Stop handle_exit() from handling HVC twice when an SError occurs
    e1e852746997 KVM: arm64: Avoid consuming a stale esr value when SError occur
    aff6657f5243 Revert "ASoC: mediatek: Check for error clk pointer"
    9908c759a17e mptcp: fix msk traversal in mptcp_nl_cmd_set_flags()
    778283dc2840 fbcon: Add option to enable legacy hardware acceleration
    2a2629db4248 Revert "fbcon: Disable accelerated scrolling"
    a3dd4d2682f2 IB/hfi1: Fix AIP early init panic
    24f8e12d965b dma-buf: heaps: Fix potential spectre v1 gadget
    f576721152fd block: bio-integrity: Advance seed correctly for larger interval sizes
    a5389c80992f mm/kmemleak: avoid scanning potential huge holes
    65a4863a4ed5 mm/pgtable: define pte_index so that preprocessor could recognize it
    120973e64db9 mm/debug_vm_pgtable: remove pte entry from the page table
    90391ac6888e nvme-fabrics: fix state check in nvmf_ctlr_matches_baseopts()
    2093ecf557e7 drm/amd/display: Force link_rate as LINK_RATE_RBR2 for 2018 15" Apple Retina panels
    7ff0ed88e4eb drm/amd/display: watermark latencies is not enough on DCN31
    4f4c77ad5a13 drm/amd/pm: correct the MGpuFanBoost support for Beige Goby
    39ac3945d966 drm/i915/adlp: Fix TypeC PHY-ready status readout
    d877e814a62b drm/nouveau: fix off by one in BIOS boundary checking
    b9e9f848c82b Revert "fs/9p: search open fids first"
    a7b717fa1516 btrfs: fix use-after-free after failure to create a snapshot
    89d4cca583fc btrfs: fix deadlock between quota disable and qgroup rescan worker
    f4b2736eeb62 btrfs: don't start transaction for scrub if the fs is mounted read-only
    7ccf5849bef7 ALSA: hda/realtek: Fix silent output on Gigabyte X570 Aorus Xtreme after reboot from Windows
    9fc509f806a5 ALSA: hda/realtek: Fix silent output on Gigabyte X570S Aorus Master (newer chipset)
    b3625b0017a4 ALSA: hda/realtek: Add missing fixup-model entry for Gigabyte X570 ALC1220 quirks
    730f823e3c68 ALSA: hda/realtek: Add quirk for ASUS GU603
    586d71ddee6c ALSA: hda: realtek: Fix race at concurrent COEF updates
    0e629052f013 ALSA: hda: Fix UAF of leds class devs at unbinding
    303e89f94b66 ALSA: usb-audio: Correct quirk for VF0770
    b0a7836ecf13 ASoC: ops: Reject out of bounds values in snd_soc_put_xr_sx()
    e8e07c5e25a2 ASoC: ops: Reject out of bounds values in snd_soc_put_volsw_sx()
    9e8895f1b3d4 ASoC: ops: Reject out of bounds values in snd_soc_put_volsw()
    10007bd96b6c ASoC: hdmi-codec: Fix OOB memory accesses
    0b8b02903173 spi: stm32-qspi: Update spi registering
    45ba0a5fa0a6 ipc/sem: do not sleep with a spin lock held
    b8d9e0aec158 audit: improve audit queue handling when "audit=1" on cmdline
    70caa32e6d81 selinux: fix double free of cond_list on error paths
    d63d077fc446 drm/i915: Disable DSB usage for now
    f01ed5defb04 Linux 5.15.21
    2b2f53331b3a Revert "drm/vc4: hdmi: Make sure the device is powered with CEC" again
    a03d2f9f82bd Revert "drm/vc4: hdmi: Make sure the device is powered with CEC"
    8deae2f4172c Linux 5.15.20
    e6b678c1a367 ovl: fix NULL pointer dereference in copy up warning
    c3d81231ab84 tcp: add missing tcp_skb_can_collapse() test in tcp_shift_skb_data()
    34321180b94d af_packet: fix data-race in packet_setsockopt / packet_setsockopt
    03f42c8ef64a e1000e: Handshake with CSME starts from ADL platforms
    6be234917788 cpuset: Fix the bug that subpart_cpus updated wrongly in update_cpumask()
    def5e7070079 rtnetlink: make sure to refresh master_dev/m_ops in __rtnl_newlink()
    f36cacd6c933 net: sched: fix use-after-free in tc_new_tfilter()
    60765e43e40f fanotify: Fix stale file descriptor in copy_event_to_user()
    db6fd92316a2 net: amd-xgbe: Fix skb data length underflow
    8cb5afa71033 net: amd-xgbe: ensure to reset the tx_timer_active flag
    b82364abc54b i40e: Fix reset path while removing the driver
    047fc3396cc6 i40e: Fix reset bw limit when DCB enabled with 1 TC
    86186352e36d ipheth: fix EOVERFLOW in ipheth_rcvbulk_callback
    5ca77e0c5080 net/mlx5: E-Switch, Fix uninitialized variable modact
    0ca746e2996b net/mlx5: Bridge, Fix devlink deadlock on net namespace deletion
    5d575586c4b3 net/mlx5e: Don't treat small ceil values as unlimited in HTB offload
    f232acbb786f net/mlx5: Fix offloading with ESWITCH_IPV4_TTL_MODIFY_ENABLE
    60c48abf62ca net/mlx5e: Fix module EEPROM query
    f895ebeb44d0 net/mlx5: Use del_timer_sync in fw reset flow of halting poll
    fe70126da606 net/mlx5e: Fix handling of wrong devices during bond netevent
    e882123e6e64 net/mlx5: Bridge, ensure dev_name is null-terminated
    c4e3cf1a8e48 net/mlx5: Bridge, take rtnl lock in init error handler
    490292d08946 net/mlx5e: IPsec: Fix tunnel mode crypto offload for non TCP/UDP traffic
    6dfc954efb98 lockd: fix failure to cleanup client locks
    cb5864bf93b2 lockd: fix server crash on reboot of client holding lock
    559bc6ec873a ovl: don't fail copy up if no fileattr support on upper
    9341457fdd0d Revert "mm/gup: small refactoring: simplify try_grab_page()"
    4b1c32bfaa02 cgroup-v1: Require capabilities to set release_agent
    d5e81e3a3e0b drm/vc4: hdmi: Make sure the device is powered with CEC
    dffeeca9268b net: ipa: prevent concurrent replenish
    5f4ed9829617 net: ipa: use a bitmap for endpoint replenish_enabled
    ee782b802ee0 selftests: mptcp: fix ipv6 routing setup
    1db58c6584a7 PCI: pciehp: Fix infinite loop in IRQ handler upon power fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index e686770248..de11f9c229 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8cee5455f1da9a04453db35f13497067fcc1da86"
-SRCREV_meta ?= "287299fba9a8435f470eaf0fa218041b9a716a71"
+SRCREV_machine ?= "819b32d5ed52fe25c6aa965547c52f677c056dcd"
+SRCREV_meta ?= "2d38a472b21ae343707c8bd64ac68a9eaca066a0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.19"
+LINUX_VERSION ?= "5.15.22"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 9905bc1925..30d575b6ad 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.19"
+LINUX_VERSION ?= "5.15.22"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "35fb6c4d167cb1231aef234a06a66f577aa1391b"
-SRCREV_machine ?= "e5cd0b75a56725559a57e91a1e3139ed6618e181"
-SRCREV_meta ?= "287299fba9a8435f470eaf0fa218041b9a716a71"
+SRCREV_machine:qemuarm ?= "53bc9472e3b5abbbc14ba3b04b1e1f655775347a"
+SRCREV_machine ?= "a28c171f92ff9b77dd7aaacd2b7dc196102ff48e"
+SRCREV_meta ?= "2d38a472b21ae343707c8bd64ac68a9eaca066a0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 6b877ae7cf..5cca97c0ed 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4f846cfafc6eaeb7c0bdfc59aef1fb22163564b6"
-SRCREV_machine:qemuarm64 ?= "e5cd0b75a56725559a57e91a1e3139ed6618e181"
-SRCREV_machine:qemumips ?= "cfe801db227a60eda2090ffeafb472c7d1bd2b32"
-SRCREV_machine:qemuppc ?= "e5cd0b75a56725559a57e91a1e3139ed6618e181"
-SRCREV_machine:qemuriscv64 ?= "e5cd0b75a56725559a57e91a1e3139ed6618e181"
-SRCREV_machine:qemuriscv32 ?= "e5cd0b75a56725559a57e91a1e3139ed6618e181"
-SRCREV_machine:qemux86 ?= "e5cd0b75a56725559a57e91a1e3139ed6618e181"
-SRCREV_machine:qemux86-64 ?= "e5cd0b75a56725559a57e91a1e3139ed6618e181"
-SRCREV_machine:qemumips64 ?= "eca2bcfe39044e9d4611a98493f7e8135cb5fdcf"
-SRCREV_machine ?= "e5cd0b75a56725559a57e91a1e3139ed6618e181"
-SRCREV_meta ?= "287299fba9a8435f470eaf0fa218041b9a716a71"
+SRCREV_machine:qemuarm ?= "ab335fd99ecec145298a277015aea6208a4d3a72"
+SRCREV_machine:qemuarm64 ?= "a28c171f92ff9b77dd7aaacd2b7dc196102ff48e"
+SRCREV_machine:qemumips ?= "1548a3de7beb155f932d9828e4f1e22345e78147"
+SRCREV_machine:qemuppc ?= "a28c171f92ff9b77dd7aaacd2b7dc196102ff48e"
+SRCREV_machine:qemuriscv64 ?= "a28c171f92ff9b77dd7aaacd2b7dc196102ff48e"
+SRCREV_machine:qemuriscv32 ?= "a28c171f92ff9b77dd7aaacd2b7dc196102ff48e"
+SRCREV_machine:qemux86 ?= "a28c171f92ff9b77dd7aaacd2b7dc196102ff48e"
+SRCREV_machine:qemux86-64 ?= "a28c171f92ff9b77dd7aaacd2b7dc196102ff48e"
+SRCREV_machine:qemumips64 ?= "8cf3fd2c0e46f72f25df69868b0b0d60f5e1dce3"
+SRCREV_machine ?= "a28c171f92ff9b77dd7aaacd2b7dc196102ff48e"
+SRCREV_meta ?= "2d38a472b21ae343707c8bd64ac68a9eaca066a0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "287299fba9a8435f470eaf0fa218041b9a716a71"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "e8a2995c6076721d496d9458e13142caa7ba8753"
+SRCREV_machine:class-devupstream ?= "0bf5b7cc9848b5494b2ca4eb1ca6e05865e8cdf1"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.19"
+LINUX_VERSION ?= "5.15.22"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


