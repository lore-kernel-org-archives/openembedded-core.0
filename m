Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2616BC433FE
	for <webhook@archiver.kernel.org>; Sun, 13 Feb 2022 01:23:50 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web09.16394.1644715429020691371
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 17:23:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qqNNMppf;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id o3so12439419qtm.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 17:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O249TwIdDKqr6w+hMCfkEfLTs48ovvbHE/kGr0ypZkg=;
        b=qqNNMppfUH2pzhQfaIicqNuNAh2QZpxGDXur10NuBow4PfZNfuKnA8MxkKIQNH5G3M
         4MO/7/DMt90h6ocyYgq/205oXlfxT8Y4oQYXQRqfckS0kD1oxVJQYrSLa8KSdrPelF79
         B42qPlCW5ux1sgQTEoOkmRAR4pxNj+QuoNblh2gltFhNSUZrQf3qYIYWX2J4zqACWghT
         SF5ESQ5ATpLtpMrAli9MdHIkoAb335KaCqTPDDTyk0cpfH/yGUn1bSmGCvPKojcidhaY
         CAKOa0iJJ64K5ceVzsoXpyH+3BdWu2xLHLB1NIUBRcBzyZ+1ONlqkKwZyiECrWyD9HBu
         UogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O249TwIdDKqr6w+hMCfkEfLTs48ovvbHE/kGr0ypZkg=;
        b=gGqx8wcvXOa5cTFDLjzwYyDidYIIrjfSoU1ufyUQJks1Ry47htOf8lbUQMyAnyGwfU
         Lz5P3sNUy5uOTndOifxNZLAWqhEoY5OWwb+qhINAYcA/Gp2GPfk5bSsCA/V01I456cHT
         +VWauOsSbhKhAb5+TEjbYwy55VQ2RSkRh8dJ5Ty/Nc/PgrHeUpFgURQaDIilESAKHk0e
         1qdgr0KlaMCdwQrrAabRGv2fLiy5CVJyH0w2EtQ33KCT8p6cy5OpiSWNCndyWWi3z4up
         WMkS+zd7tlRB5MLmTd8e1u531MMkVHY5kmWPp6y/AFs8HOvyewOhyU+tPdvsYzfA9Lsa
         t9tw==
X-Gm-Message-State: AOAM531k+38/TImzKNkllhLQY8Kq70/bK6S+AynE/d8UxN5stFcMwfA2
	S8IKfWHAfpcKek2wylpCrra6yUKRS1SBtg==
X-Google-Smtp-Source: 
 ABdhPJzX5okK1Ps037ULYF3skKsvA0yhE6NMVGY8lLujdvwIh3e6HBP1n73U4UOT21giw5H9vEIfVA==
X-Received: by 2002:a05:622a:607:: with SMTP id
 z7mr5534733qta.281.1644715428080;
        Sat, 12 Feb 2022 17:23:48 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 w13sm13016556qkb.106.2022.02.12.17.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 17:23:47 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/5.10: update to v5.10.99
Date: Sat, 12 Feb 2022 20:23:42 -0500
Message-Id: 
 <1ab886a4f73f5d9a7b6a10a4d240b5fc9b409669.1644715271.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1644715271.git.bruce.ashfield@gmail.com>
References: <cover.1644715271.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Feb 2022 01:23:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161677

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    fb063a6465f9 Linux 5.10.99
    4889d6ee9e48 selftests: nft_concat_range: add test for reload with no element add/del
    557727313534 cgroup/cpuset: Fix "suspicious RCU usage" lockdep warning
    f1f7d1a22fd7 net: dsa: mt7530: make NET_DSA_MT7530 select MEDIATEK_GE_PHY
    84b76a509cc3 ext4: fix incorrect type issue during replay_del_range
    62e46e0ffc02 ext4: fix error handling in ext4_fc_record_modified_inode()
    764793b4a5d0 ext4: fix error handling in ext4_restore_inline_data()
    6c5bd55e36d3 ext4: modify the logic of ext4_mb_new_blocks_simple
    8d71fc23fcb8 ext4: prevent used blocks from being allocated during fast commit replay
    ef2053afd71e EDAC/xgene: Fix deferred probing
    2a12faf55bae EDAC/altera: Fix deferred probing
    dd274cf85269 x86/perf: Default set FREEZE_ON_SMI for all
    456f041e0359 perf/x86/intel/pt: Fix crash with stop filters in single-range mode
    8c0e6a8a630e perf stat: Fix display of grouped aliased events
    57e8859acc60 fbcon: Add option to enable legacy hardware acceleration
    460f6b1a238d Revert "fbcon: Disable accelerated scrolling"
    460aa9d87340 rtc: cmos: Evaluate century appropriate
    2324f5fcdf9d tools/resolve_btfids: Do not print any commands when building silently
    1536fafa23ac selftests: futex: Use variable MAKE instead of make
    8f0fff8b5968 selftests/exec: Remove pipe from TEST_GEN_FILES
    6304a613a97d bpf: Use VM_MAP instead of VM_ALLOC for ringbuf
    f744a064041c gve: fix the wrong AdminQ buffer queue index check
    51e88e892273 nfsd: nfsd4_setclientid_confirm mistakenly expires confirmed client.
    ec4334152dae scsi: bnx2fc: Make bnx2fc_recv_frame() mp safe
    fd482f2d63db pinctrl: bcm2835: Fix a few error paths
    752d9eafc64e pinctrl: intel: fix unexpected interrupt
    14bc9978b486 pinctrl: intel: Fix a glitch when updating IRQ flags on a preconfigured line
    5a45448ac95b ASoC: max9759: fix underflow in speaker_gain_control_put()
    02f459719832 ASoC: cpcap: Check for NULL pointer after calling of_get_child_by_name
    cb5f1fbd1f22 ASoC: xilinx: xlnx_formatter_pcm: Make buffer bytes multiple of period bytes
    56e0747d59ac ASoC: fsl: Add missing error handling in pcm030_fabric_probe
    3e698375517d drm/i915/overlay: Prevent divide by zero bugs in scaling
    9ea018536111 net: stmmac: ensure PTP time register reads are consistent
    41df2da2c1f3 net: stmmac: dump gmac4 DMA registers correctly
    114bf9350413 net: macsec: Verify that send_sci is on when setting Tx sci explicitly
    2e7f5b6ee1a7 net: macsec: Fix offload support for NETDEV_UNREGISTER event
    87b1c9fab6fe net: ieee802154: Return meaningful error codes from the netlink helpers
    78b3f20c17cb net: ieee802154: ca8210: Stop leaking skb's
    0bfe50dc5d91 net: ieee802154: mcr20a: Fix lifs/sifs periods
    75bbda318987 net: ieee802154: hwsim: Ensure proper channel selection at probe time
    e895e067d73e spi: uniphier: fix reference count leak in uniphier_spi_probe()
    ec942d08e070 spi: meson-spicc: add IRQ check in meson_spicc_probe
    c2cf65e1008b spi: mediatek: Avoid NULL pointer crash in interrupt
    30e05c98b99d spi: bcm-qspi: check for valid cs before applying chip select
    6d226e8afe88 iommu/amd: Fix loop timeout issue in iommu_ga_log_enable()
    9d9995b0371e iommu/vt-d: Fix potential memory leak in intel_setup_irq_remapping()
    b3958d315163 RDMA/mlx4: Don't continue event handler after memory allocation failure
    d3f8b927df2f RDMA/siw: Fix broken RDMA Read Fence/Resume logic.
    c7db20f5be73 IB/rdmavt: Validate remote_addr during loopback atomic tests
    75c610212b9f RDMA/ucma: Protect mc during concurrent multicast leaves
    371979069a57 RDMA/cma: Use correct address when leaving multicast group
    aa4ecd995f59 memcg: charge fs_context and legacy_fs_context
    080f371d984e Revert "ASoC: mediatek: Check for error clk pointer"
    4a9bd1e6780f IB/hfi1: Fix AIP early init panic
    5d40f1bdad3d dma-buf: heaps: Fix potential spectre v1 gadget
    30de3bc09978 block: bio-integrity: Advance seed correctly for larger interval sizes
    352715593e81 mm/kmemleak: avoid scanning potential huge holes
    7053188ddba3 mm/pgtable: define pte_index so that preprocessor could recognize it
    bce7f5d74d74 mm/debug_vm_pgtable: remove pte entry from the page table
    2d83a7463d75 nvme-fabrics: fix state check in nvmf_ctlr_matches_baseopts()
    a0c73dbdd197 drm/amd/display: Force link_rate as LINK_RATE_RBR2 for 2018 15" Apple Retina panels
    f071d9fa8575 drm/nouveau: fix off by one in BIOS boundary checking
    32747e01436a btrfs: fix deadlock between quota disable and qgroup rescan worker
    aa5d406153c5 ALSA: hda/realtek: Fix silent output on Gigabyte X570 Aorus Xtreme after reboot from Windows
    d4aa3a98596f ALSA: hda/realtek: Fix silent output on Gigabyte X570S Aorus Master (newer chipset)
    3a8a8072e32b ALSA: hda/realtek: Add missing fixup-model entry for Gigabyte X570 ALC1220 quirks
    532cde962f5f ALSA: hda/realtek: Add quirk for ASUS GU603
    410f231fd70c ALSA: hda: realtek: Fix race at concurrent COEF updates
    a7de1002135c ALSA: hda: Fix UAF of leds class devs at unbinding
    470bbb9cbd8f ALSA: usb-audio: Correct quirk for VF0770
    6877f87579ed ASoC: ops: Reject out of bounds values in snd_soc_put_xr_sx()
    038f8b7caa74 ASoC: ops: Reject out of bounds values in snd_soc_put_volsw_sx()
    a9394f21fba0 ASoC: ops: Reject out of bounds values in snd_soc_put_volsw()
    0ff6b8050695 audit: improve audit queue handling when "audit=1" on cmdline
    f446089a268c selinux: fix double free of cond_list on error paths
    12a0a56cbae3 Linux 5.10.98
    97a47e25559e Revert "drm/vc4: hdmi: Make sure the device is powered with CEC" again
    e27042060f81 Revert "drm/vc4: hdmi: Make sure the device is powered with CEC"
    c8ed22bd97d4 Linux 5.10.97
    176356550ced tcp: add missing tcp_skb_can_collapse() test in tcp_shift_skb_data()
    32e179971085 af_packet: fix data-race in packet_setsockopt / packet_setsockopt
    aa9e96db3121 cpuset: Fix the bug that subpart_cpus updated wrongly in update_cpumask()
    3bbe2019dd12 rtnetlink: make sure to refresh master_dev/m_ops in __rtnl_newlink()
    e7be56926397 net: sched: fix use-after-free in tc_new_tfilter()
    7b4741644cf7 fanotify: Fix stale file descriptor in copy_event_to_user()
    4d3fcfe84648 net: amd-xgbe: Fix skb data length underflow
    cadfa7dce526 net: amd-xgbe: ensure to reset the tx_timer_active flag
    77534b114f24 ipheth: fix EOVERFLOW in ipheth_rcvbulk_callback
    b4ced7a46d9f net/mlx5: E-Switch, Fix uninitialized variable modact
    502c37b033fa net/mlx5: Use del_timer_sync in fw reset flow of halting poll
    a01ee1b8165f net/mlx5e: Fix handling of wrong devices during bond netevent
    1fc3444cda9a cgroup-v1: Require capabilities to set release_agent
    ac4ba79bb028 drm/vc4: hdmi: Make sure the device is powered with CEC
    46f919c6bdc5 x86/cpu: Add Xeon Icelake-D to list of CPUs that support PPIN
    fbdbf6743f77 x86/mce: Add Xeon Sapphire Rapids to list of CPUs that support PPIN
    d4e4e61d4a5b psi: Fix uaf issue when psi trigger is destroyed while being polled
    080dbe7e9b86 KVM: x86: Forcibly leave nested virt when SMM state is toggled
    063029a8820e Revert "drivers: bus: simple-pm-bus: Add support for probing simple bus only devices"
    42fdbf8b7dab net: ipa: prevent concurrent replenish
    ad81380d3a48 net: ipa: use a bitmap for endpoint replenish_enabled
    2ed912e3e057 net: ipa: fix atomic update in ipa_endpoint_replenish()
    3b4c966fb156 PCI: pciehp: Fix infinite loop in IRQ handler upon power fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index eb357917fc..f353a0610c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8aebbbd41d16fc564ff99709d4f01a116d07e7a4"
-SRCREV_meta ?= "0db3f511b2a553a5ea31ac45249a42f084fc287c"
+SRCREV_machine ?= "53a27dc510c8d9152ffa4d2d95b888db7d3d97b6"
+SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.96"
+LINUX_VERSION ?= "5.10.99"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index b2cd6887ee..e9c20c6c79 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.96"
+LINUX_VERSION ?= "5.10.99"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "ca361e2633ab577333303359eb2f7b0040647e5e"
-SRCREV_machine ?= "36f032fc87112de000ca01b6e8a41313d418dcd9"
-SRCREV_meta ?= "0db3f511b2a553a5ea31ac45249a42f084fc287c"
+SRCREV_machine:qemuarm ?= "b7823b6ac25671f8dc5ee2c4cf74af3be88207cf"
+SRCREV_machine ?= "7558a33fc5b60d4327b683c3376c5352cba11ed1"
+SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 649d712fda..a7b3d08d9e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "7ad48434f8e0e848f7fe4891ee7ba670700c36fc"
-SRCREV_machine:qemuarm64 ?= "932cd0e7a66273eba2da54b4ac67e3c6e384e614"
-SRCREV_machine:qemumips ?= "27d7f99a1211d8eca210a84c88a9058772a751a5"
-SRCREV_machine:qemuppc ?= "914396443522268b332c8efe83b3b0306befd1cb"
-SRCREV_machine:qemuriscv64 ?= "74244dd30b3a2415a785d2228ab5abdef4536f03"
-SRCREV_machine:qemuriscv32 ?= "74244dd30b3a2415a785d2228ab5abdef4536f03"
-SRCREV_machine:qemux86 ?= "74244dd30b3a2415a785d2228ab5abdef4536f03"
-SRCREV_machine:qemux86-64 ?= "74244dd30b3a2415a785d2228ab5abdef4536f03"
-SRCREV_machine:qemumips64 ?= "ba30b538c1750a9fe5db275260862c99a5ed356a"
-SRCREV_machine ?= "74244dd30b3a2415a785d2228ab5abdef4536f03"
-SRCREV_meta ?= "0db3f511b2a553a5ea31ac45249a42f084fc287c"
+SRCREV_machine:qemuarm ?= "c3a59bad41cefbe15d6bcde0ec2fe5c7ea28ba2b"
+SRCREV_machine:qemuarm64 ?= "07ca3e3c85445f2c31bd081b27741c9680536168"
+SRCREV_machine:qemumips ?= "10ae40d47f14b3c05dd6506c70576383c5474670"
+SRCREV_machine:qemuppc ?= "bc2a7c884103143e0a4360518247fe01bf2c13d3"
+SRCREV_machine:qemuriscv64 ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
+SRCREV_machine:qemuriscv32 ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
+SRCREV_machine:qemux86 ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
+SRCREV_machine:qemux86-64 ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
+SRCREV_machine:qemumips64 ?= "13998bd0244737548a21a17d1969ca65af0712b1"
+SRCREV_machine ?= "84f6a75f64961e59d61bf3d70ab17e8bb430386b"
+SRCREV_meta ?= "a58f4e7cca3973e04d3f9a40356ef9c2c0bb10a5"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.96"
+LINUX_VERSION ?= "5.10.99"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


