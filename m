Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7470DC64E65
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web09.9925.1650471891242422300
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EG80RCWY;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id bz24so1345892qtb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rt/lBADH3ROUM0tMPl9dNtRWbOfTfOh72pSXwVC85qA=;
        b=EG80RCWYqW3hn3yeWyExqTDxQz/r13TUNPHKD7oLiBrCqb6gfpmYbGtT86FWGXEZys
         SKFsC1tTuTNpNUEbcm8K9cp4tOFt0XYr5LqBRu7S/1zT547NNBR2osE8CW2Fgdu8GEiJ
         WY40yTlezolJ/RoosecJb8hySkikJLgIj3yyt33dpCAnnSsSy/mnZM9TVjm/VGI5uko1
         /JpMS7exqFNoP2N5wsJ2vP9+ucbmg7J01dqwsg/5HmTCHgwtgq2QvtNRVWqq85Ou4YXs
         2OttjGhKh9irFYP8un2o5cAg1Z7YhZ44HhoRFKWIJ3Tedx3n3yBtDkqRyDaM7trRGIpg
         TH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rt/lBADH3ROUM0tMPl9dNtRWbOfTfOh72pSXwVC85qA=;
        b=Glrf2xChXrN0VgUycJI+3i9PKionRSUr6+uGda1kcCbLmzMnk8g/dQh7x9oGHHR0wd
         ybBvPss7lVG25vFln0gcZgtAzKl4hWB3sXgRtgybsktPhzdtZLITwdeuXI80Mb6K0FfD
         qaEgXwMQ6By9IVyCj2e3eEYD4fUn+YF2LLIxVqMLe8gfFEC77lOJdFB5AXiB+oun2/af
         y2ZTazMs6aiZzwuHzH9AxmtQLuw0rgzA45YfBRsxlQeDLNXqcFZpDqXg+IBlrTv2AKtu
         L26wbHM0XUYtqhqoD0L6WiyrhoLsx5F1oROPgmenKyulxnwhJ8OWZK3E9EhZYyPgB2ZS
         x4BA==
X-Gm-Message-State: AOAM533GhaO9F7waJ7FiV6/0CN38Y4gbMAByMFevY4UIjLTW8lQDY3uJ
	8JKccAILXgMH8ZZ5aPNkTS8=
X-Google-Smtp-Source: 
 ABdhPJyqnkCIn6UghTVbGvQ+sgGCXne1LQCQZfvAAUVmuOkEzZAaX7f0t92TXW9Q/qIIj5wu6igClg==
X-Received: by 2002:a05:622a:34d:b0:2f3:44d9:41a8 with SMTP id
 r13-20020a05622a034d00b002f344d941a8mr1407076qtw.217.1650471890258;
        Wed, 20 Apr 2022 09:24:50 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 l19-20020a37f513000000b0069c5807ff10sm1657236qkk.27.2022.04.20.09.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 09:24:49 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com,
	richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5][dunfell] linux-yocto/5.4: update to v5.4.186
Date: Wed, 20 Apr 2022 12:24:43 -0400
Message-Id: <20220420162445.56096-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20220420162445.56096-1-bruce.ashfield@gmail.com>
References: <20220420162445.56096-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164713

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    8e24ff11b5d2 Linux 5.4.186
    fcbdaa6a3c92 fixup for "arm64 entry: Add macro for reading symbol address from the trampoline"
    b8bc0718baed kselftest/vm: fix tests build with old libc
    2643ca24f511 sfc: extend the locking on mcdi->seqno
    46fd0a07409b tcp: make tcp_read_sock() more robust
    16a2e50fe934 nl80211: Update bss channel on channel switch for P2P_CLIENT
    941e8bcd2b2b drm/vrr: Set VRR capable prop only if it is attached to connector
    6becb057247e iwlwifi: don't advertise TWT support
    51969ebe7f97 atm: firestream: check the return value of ioremap() in fs_init()
    23352749f0b2 can: rcar_canfd: rcar_canfd_channel_probe(): register the CAN device when fully ready
    4006447f558c ARM: 9178/1: fix unmet dependency on BITREVERSE for HAVE_ARCH_BITREVERSE
    c2420bc33331 MIPS: smp: fill in sibling and core maps earlier
    d1df59e3124c mac80211: refuse aggregations sessions before authorized
    fb35b0cfbaf8 ARM: dts: rockchip: fix a typo on rk3288 crypto-controller
    4857a9b291db ARM: dts: rockchip: reorder rk322x hmdi clocks
    ba14ba2d4c63 arm64: dts: agilex: use the compatible "intel,socfpga-agilex-hsotg"
    aca8fdddeee0 arm64: dts: rockchip: reorder rk3399 hdmi clocks
    e49ebea3f536 arm64: dts: rockchip: fix rk3399-puma eMMC HS400 signal integrity
    bd33f9b864ec xfrm: Fix xfrm migrate issues when address family changes
    3c21ece77549 xfrm: Check if_id in xfrm_migrate
    970a21404ebc arm64: Use the clearbhb instruction in mitigations
    fb65675f6620 KVM: arm64: Allow SMCCC_ARCH_WORKAROUND_3 to be discovered and migrated
    9013fd4bc958 arm64: Mitigate spectre style branch history side channels
    26129ea2953b KVM: arm64: Add templates for BHB mitigation sequences
    1b735c8dc1fb arm64: proton-pack: Report Spectre-BHB vulnerabilities as part of Spectre-v2
    c45d885c5a77 arm64: Add percpu vectors for EL1
    1bb1944970a9 arm64: entry: Add macro for reading symbol addresses from the trampoline
    3abf6e8a7aa0 arm64: entry: Add vectors that have the bhb mitigation sequences
    2933ca8c816f arm64: entry: Add non-kpti __bp_harden_el1_vectors for mitigations
    9232867e4fc2 arm64: entry: Allow the trampoline text to occupy multiple pages
    ad8800443b69 arm64: entry: Make the kpti trampoline's kpti sequence optional
    4b91f35c8739 arm64: entry: Move trampoline macros out of ifdef'd section
    0bfdd7334882 arm64: entry: Don't assume tramp_vectors is the start of the vectors
    fb117a27c64e arm64: entry: Allow tramp_alias to access symbols after the 4K boundary
    788fbb5fe290 arm64: entry: Move the trampoline data page before the text page
    33397322d4c3 arm64: entry: Free up another register on kpti's tramp_exit path
    3f95cc642c3f arm64: entry: Make the trampoline cleanup optional
    8aa1257128a1 arm64: entry.S: Add ventry overflow sanity checks
    503fdc244aee arm64: Add Cortex-X2 CPU part definition
    7103651c98c8 arm64: add ID_AA64ISAR2_EL1 sys register
    f5f94aa5004a arm64: Add Neoverse-N2, Cortex-A710 CPU part definition
    ed5bf8a5075b arm64: Add part number for Arm Cortex-A77
    0b84cfaefea6 sctp: fix the processing for INIT chunk
    57e401a53c9f Revert "xfrm: state and policy should fail if XFRMA_IF_ID 0"
    70f77a2cb528 Linux 5.4.185
    afb684cb976a KVM: SVM: Don't flush cache if hardware enforces cache coherency across encryption domains
    690909c6d971 x86/mm/pat: Don't flush cache if hardware enforces cache coherency across encryption domnains
    6b13a188609f x86/cpu: Add hardware-enforced cache coherency as a CPUID feature
    9dd71ec10658 x86/cpufeatures: Mark two free bits in word 3
    a4eef9e76934 ext4: add check to prevent attempting to resize an fs with sparse_super2
    269db254c3b7 ARM: fix Thumb2 regression with Spectre BHB
    635959a82154 virtio: acknowledge all features before access
    ffeb42e05d7d virtio: unexport virtio_finalize_features
    19d57cfbf8c0 arm64: dts: marvell: armada-37xx: Remap IO space to bus address 0x0
    978e4f2648c1 riscv: Fix auipc+jalr relocation range checks
    d6948de3b630 mmc: meson: Fix usage of meson_mmc_post_req()
    ba0d7beec2c2 net: macb: Fix lost RX packet wakeup race in NAPI receive
    403e3afe241b staging: gdm724x: fix use after free in gdm_lte_rx()
    a9174077febf fuse: fix pipe buffer lifetime for direct_io
    d72c79b60d6a ARM: Spectre-BHB: provide empty stub for non-config
    ad66df9064f4 selftests/memfd: clean up mapping in mfd_fail_write
    849c78024e65 selftest/vm: fix map_fixed_noreplace test failure
    500158df8757 tracing: Ensure trace buffer is at least 4096 bytes large
    090e73fb9cce ipv6: prevent a possible race condition with lifetimes
    1d4bdaaa8d23 Revert "xen-netback: Check for hotplug-status existence before watching"
    60e4e3198ce8 Revert "xen-netback: remove 'hotplug-status' once it has served its purpose"
    8879b5313e9f net-sysfs: add check for netdevice being present to speed_show
    dcf55b071de9 selftests/bpf: Add test for bpf_timer overwriting crash
    e0eca9285cf4 net: bcmgenet: Don't claim WOL when its not available
    bbf59d7ae558 sctp: fix kernel-infoleak for SCTP sockets
    e93437197131 net: phy: DP83822: clear MISR2 register to disable interrupts
    f7b3b5203491 gianfar: ethtool: Fix refcount leak in gfar_get_ts_info
    54fd6b2eb1d7 gpio: ts4900: Do not set DAT and OE together
    82b298e0142d selftests: pmtu.sh: Kill tcpdump processes launched by subshell.
    cd2a5c0da0d1 NFC: port100: fix use-after-free in port100_send_complete
    1a4017926eee net/mlx5: Fix a race on command flush flow
    6102e2e5c62d net/mlx5: Fix size field in bufferx_reg struct
    0a64aea5fe02 ax25: Fix NULL pointer dereference in ax25_kill_by_device
    45bfd0a937ba net: ethernet: lpc_eth: Handle error for clk_enable
    e84d37af40a9 net: ethernet: ti: cpts: Handle error for clk_enable
    8ee065a7a9b6 ethernet: Fix error handling in xemaclite_of_probe
    4c0b769d9571 ARM: dts: aspeed: Fix AST2600 quad spi group
    7db2bc08619f drm/sun4i: mixer: Fix P010 and P210 format numbers
    7f8f5641417e qed: return status of qed_iov_get_link
    f59e78609075 net: qlogic: check the return value of dma_alloc_coherent() in qed_vf_hw_prepare()
    45d470e4f808 virtio-blk: Don't use MAX_DISCARD_SEGMENTS if max_discard_seg is zero
    278b2c7d9fe5 arm64: dts: armada-3720-turris-mox: Add missing ethernet0 alias
    f62922b601c5 clk: qcom: gdsc: Add support to update GDSC transition delay
    1346e17653a5 Linux 5.4.184
    f7fc9c348790 Revert "ACPI: PM: s2idle: Cancel wakeup before dispatching EC GPE"
    0e35f3ab69bc xen/netfront: react properly to failing gnttab_end_foreign_access_ref()
    782e5ebcc888 xen/gnttab: fix gnttab_end_foreign_access() without page specified
    051c4cc7bdb7 xen/pvcalls: use alloc/free_pages_exact()
    be63ea883e56 xen/9p: use alloc/free_pages_exact()
    8efaf0c862c7 xen: remove gnttab_query_foreign_access()
    d193785a4bc9 xen/gntalloc: don't use gnttab_query_foreign_access()
    089a8e491d6d xen/scsifront: don't use gnttab_query_foreign_access() for mapped status
    b507879c1e2d xen/netfront: don't use gnttab_query_foreign_access() for mapped status
    a83400456f9c xen/blkfront: don't use gnttab_query_foreign_access() for mapped status
    44d86dccd2a5 xen/grant-table: add gnttab_try_end_foreign_access()
    95ff82383266 xen/xenbus: don't let xenbus_grant_ring() remove grants in error case
    56f1b3c5c82a ARM: fix build warning in proc-v7-bugs.c
    40da947ba076 ARM: Do not use NOCROSSREFS directive with ld.lld
    583662bfd8df ARM: fix co-processor register typo
    21a466c32f3e ARM: fix build error when BPF_SYSCALL is disabled
    d1cfdd50778c ARM: include unprivileged BPF status in Spectre V2 reporting
    920f7970cf0d ARM: Spectre-BHB workaround
    dcf33beb492a ARM: use LOADADDR() to get load address of sections
    31814db6e478 ARM: early traps initialisation
    fdfc0baf829d ARM: report Spectre v2 status through sysfs
    26171b016b40 arm/arm64: smccc/psci: add arm_smccc_1_1_get_conduit()
    baaaba74e014 arm/arm64: Provide a wrapper for SMCCC 1.1 calls
    6c1599fd1bf8 x86/speculation: Warn about eIBRS + LFENCE + Unprivileged eBPF + SMT
    7c7702569422 x86/speculation: Warn about Spectre v2 LFENCE mitigation
    865da3868b56 x86/speculation: Update link to AMD speculation whitepaper
    b1bacf22a847 x86/speculation: Use generic retpoline by default on AMD
    1e47ab3df908 x86/speculation: Include unprivileged eBPF status in Spectre v2 mitigation reporting
    327a4da9b0ef Documentation/hw-vuln: Update spectre doc
    96b3d45aeae0 x86/speculation: Add eIBRS + Retpoline options
    41b50510e593 x86/speculation: Rename RETPOLINE_AMD to RETPOLINE_LFENCE
    b70bc2e3552a x86,bugs: Unconditionally allow spectre_v2=retpoline,amd
    22aed240891c x86/speculation: Merge one test in spectre_v2_user_select_mitigation()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 3c2290dbd3..bfc9299824 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5e561c53ce51b502405e93b3f35aa7764da89036"
-SRCREV_meta ?= "63746f1a36196425c38a1bc45dfddbcd6f979850"
+SRCREV_machine ?= "934ce7677ca0db0a76355a0ebf52c4e73a549a1f"
+SRCREV_meta ?= "bd44c211eb3fd32dd9dcd38ed301e5aeb79c4fcd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.183"
+LINUX_VERSION ?= "5.4.186"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 7c2c474f0a..fa6fc2b2b4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.183"
+LINUX_VERSION ?= "5.4.186"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "a14450f445a2c1804cfdea5a34767e0eabb20ee5"
-SRCREV_machine ?= "d8b3767fa12775de390f40170b53c2facfdc33b9"
-SRCREV_meta ?= "63746f1a36196425c38a1bc45dfddbcd6f979850"
+SRCREV_machine_qemuarm ?= "d966f6ba017108bef5b9c71a8bf216d1e7a9b000"
+SRCREV_machine ?= "a82777d966fa136c717ff93ff962e0e52309c6ab"
+SRCREV_meta ?= "bd44c211eb3fd32dd9dcd38ed301e5aeb79c4fcd"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 6c82d83c1c..a8d129777a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "17abcde23788c1b8b529119e9bb97a274018ab40"
-SRCREV_machine_qemuarm64 ?= "2ac838b819ef56b9682e64b260abaf4756264f61"
-SRCREV_machine_qemumips ?= "f96b51a2ce7a199824da6dffb56648ff06b7d755"
-SRCREV_machine_qemuppc ?= "7c4de9e3b87a0f846afe297a1b70125f9f6bc084"
-SRCREV_machine_qemuriscv64 ?= "f840db108606f987e174f1658dc120795798e808"
-SRCREV_machine_qemux86 ?= "f840db108606f987e174f1658dc120795798e808"
-SRCREV_machine_qemux86-64 ?= "f840db108606f987e174f1658dc120795798e808"
-SRCREV_machine_qemumips64 ?= "b03b2ba13d3ee9c5d2a401a8702d428f9580f158"
-SRCREV_machine ?= "f840db108606f987e174f1658dc120795798e808"
-SRCREV_meta ?= "63746f1a36196425c38a1bc45dfddbcd6f979850"
+SRCREV_machine_qemuarm ?= "268b67fc1601a941bc6b6dcaaefeb97a5bfaccc2"
+SRCREV_machine_qemuarm64 ?= "276219af94078862810fa987cf4e6e8646f94a27"
+SRCREV_machine_qemumips ?= "7f69ecf69c0cde672ce07ed82e268224316338d2"
+SRCREV_machine_qemuppc ?= "98c71fc316ac6e8e0dcdb95b8ea82559035a8a18"
+SRCREV_machine_qemuriscv64 ?= "9a1c3b5fbdd1adc30469a0e87ce80e65380d539f"
+SRCREV_machine_qemux86 ?= "9a1c3b5fbdd1adc30469a0e87ce80e65380d539f"
+SRCREV_machine_qemux86-64 ?= "9a1c3b5fbdd1adc30469a0e87ce80e65380d539f"
+SRCREV_machine_qemumips64 ?= "a3026ca71cfeac3a81f4b9ee95d2cb369aacc3c6"
+SRCREV_machine ?= "9a1c3b5fbdd1adc30469a0e87ce80e65380d539f"
+SRCREV_meta ?= "bd44c211eb3fd32dd9dcd38ed301e5aeb79c4fcd"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.183"
+LINUX_VERSION ?= "5.4.186"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


