Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DA1C001E0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 02:33:58 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.39767.1690166028704735984
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 19:33:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=r26bj1fk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-68336d06620so3726791b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 19:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690166027; x=1690770827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7W+1z3X8OXyH5KcHz+QPkpFmP8CwgzfIJlgzl7p81Q=;
        b=r26bj1fk8WQhqW8JTjQtwv+8C4noC0OkHMSIhmAT/zgcxDxMxW5FYm1AYZmZv6qfVi
         66WLaiKjiigEE0PmbAZNcBmF5I6yMeQBHF4fsbYKYbOJL4MStDw/DdapDTYqSfOZWQqI
         vT9CU/LcI8lvqiu3pwV625A805cX0aJvxrJiLsKRdeSpz7r7qa7xtxxVQ+fqzPLacBkE
         50TBVikZ095H6nw642PGmlKgk1WBY0Tr5uEsIBL/gOf6G0eby1XY2kwLA9XIH5vCIiAh
         NaadG8dUOGI/AW6jT1wL1dibD23VUe1GwEM09Jwfyk/2ZrPnxKl2SQIfH4rhfgaw12pl
         vioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690166027; x=1690770827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7W+1z3X8OXyH5KcHz+QPkpFmP8CwgzfIJlgzl7p81Q=;
        b=eDJhoTbYN6zPuyRN78RFSlyRVQQy+cahmyKuTALCvF5nWZtt2ntavnrY9b2M+0EXw4
         uNcYvcYd2Qe/rRJHzIj+w8Skg7UZOK4MlkbBHHBKjBautf2e/w11OXhn+ZruNYSa7Mxw
         Uw52AwgKoGnWEJ2KxMNKSaFZ1D3f0VRFvNrH50UGVMno5AJiCtg/DtRovQUo60ZBaxT5
         JmbGMAwPp+cJ4TCHNCa34LFJpf7y90MW4JM6zr7KeAJrbbLDLuKd3Zk8nzNcjXIGUuzw
         Ghna4rSi3izuthOG2I/V538wX4/4/UT3UaenC4xnCVFvs5iuhHUQiT2FB7nuYg2fBxkd
         cU2Q==
X-Gm-Message-State: ABy/qLYdpYZ4bKtAR9S+E1jx67X/csSAe5swtyufSsG5OeYpm4ygtyLg
	7FuIuUObGT4tTUt5+brlQdTHSNUtrvE8Qw669bka8g==
X-Google-Smtp-Source: APBJJlGFrjDfoUZXOUvo9M3CwRjJ0dSuYlFCTelx09h3LotfbJAC+XYpc1Rvqnp58IgkKl+3A1ymaQ==
X-Received: by 2002:a05:6a00:3911:b0:681:142f:e8e3 with SMTP id fh17-20020a056a00391100b00681142fe8e3mr9005480pfb.14.1690166027100;
        Sun, 23 Jul 2023 19:33:47 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j1-20020aa783c1000000b0063f00898245sm1024174pfn.146.2023.07.23.19.33.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 19:33:46 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/8] linux-yocto/5.15: update to v5.15.119
Date: Sun, 23 Jul 2023 16:33:28 -1000
Message-Id: <c76f1027756cc83d81b43522a1601b5fda972f86.1690165924.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690165924.git.steve@sakoman.com>
References: <cover.1690165924.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 02:33:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184772

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    4af60700a60c Linux 5.15.119
    10fbd2e04e40 act_mirred: remove unneded merge conflict markers
    2230b3f874d9 i2c: imx-lpi2c: fix type char overflow issue when calculating the clock cycle
    907a069ec38f x86/apic: Fix kernel panic when booting with intremap=off and x2apic_phys
    7949f83f7ecc vhost_net: revert upend_idx only on retriable error
    fdac0aa4a175 drm/radeon: fix race condition UAF in radeon_gem_set_domain_ioctl
    f012d3037c15 drm/exynos: fix race condition UAF in exynos_g2d_exec_ioctl
    a44b4230d2ba drm/exynos: vidi: fix a wrong error return
    79b4125bce96 ARM: dts: Fix erroneous ADS touchscreen polarities
    9684c4fdeeca s390/purgatory: disable branch profiling
    3c4d87e9fa8a ASoC: nau8824: Add quirk to active-high jack-detect
    d77eac1b14e0 soundwire: dmi-quirks: add new mapping for HP Spectre x360
    53ad4af4ec90 ASoC: simple-card: Add missing of_node_put() in case of error
    bb45dc7b67c5 spi: lpspi: disable lpspi module irq in DMA mode
    f8d9d8f1727d s390/cio: unregister device when the only path is gone
    e10d15fdfced Input: soc_button_array - add invalid acpi_index DMI quirk handling
    26bde09a1512 nvme: double KA polling frequency to avoid KATO with TBKAS on
    e3bbc148377d usb: gadget: udc: fix NULL dereference in remove()
    cce681383d34 nfcsim.c: Fix error checking for debugfs_create_dir
    8a5ddd1430d4 media: cec: core: don't set last_initiator if tx in progress
    01cf989090da arm64: Add missing Set/Way CMO encodings
    f97b16c0a538 HID: wacom: Add error check to wacom_parse_and_register()
    e8bdb1f88699 scsi: target: iscsi: Prevent login threads from racing between each other
    1cc379d53b66 gpio: sifive: add missing check for platform_get_irq
    497d40140865 gpiolib: Fix GPIO chip IRQ initialization restriction
    7973c4b3b97d gpio: Allow per-parent interrupt data
    c1a2b52d999e sch_netem: acquire qdisc lock in netem_change()
    3138c85031e8 selftests: forwarding: Fix race condition in mirror installation
    b7db41a86541 bpf/btf: Accept function names that contain dots
    0f8d81254fd6 Revert "net: phy: dp83867: perform soft reset and retain established link"
    57130334da4e netfilter: nfnetlink_osf: fix module autoload
    53defc6ecff4 netfilter: nf_tables: disallow updates of anonymous sets
    2f2f9eaa6da1 netfilter: nf_tables: reject unbound chain set before commit phase
    2938e7d582d7 netfilter: nf_tables: reject unbound anonymous set before commit phase
    baa3ec1b31f5 netfilter: nf_tables: disallow element updates of bound anonymous sets
    45eb6944d0f5 netfilter: nft_set_pipapo: .walk does not deal with generations
    4004f12aaca8 netfilter: nf_tables: add NFT_TRANS_PREPARE_ERROR to deal with bound set/chain
    314a8697d080 netfilter: nf_tables: fix chain binding transaction logic
    1328e8d4c3ee be2net: Extend xmit workaround to BE3 chip
    768f94c5f639 net: dsa: mt7530: fix handling of BPDUs on MT7530 switch
    aa528e7d379f net: dsa: mt7530: fix trapping frames on non-MT7621 SoC MT7530 switch
    efea112a87b6 ipvs: align inner_mac_header for encapsulation
    24d7d9aee03d mmc: usdhi60rol0: fix deferred probing
    d1e08bed0307 mmc: sh_mmcif: fix deferred probing
    34c4906b9a06 mmc: sdhci-acpi: fix deferred probing
    41f1e8dab08d mmc: owl: fix deferred probing
    b86ca9e08ca9 mmc: omap_hsmmc: fix deferred probing
    445a9568dec1 mmc: omap: fix deferred probing
    840deb8d1418 mmc: mvsdio: fix deferred probing
    92f73c4f927c mmc: mtk-sd: fix deferred probing
    aedecd013d2c net: qca_spi: Avoid high load if QCA7000 is not available
    156dd06fb337 xfrm: Linearize the skb after offloading if needed.
    d967bd7ea6cc selftests: net: fcnal-test: check if FIPS mode is enabled
    964cfdfd4b4f xfrm: fix inbound ipv4/udp/esp packets to UDPv6 dualstack sockets
    25e89fa7b5a8 bpf: Fix verifier id tracking of scalars on spill
    0b180495f6b0 bpf: track immediate values written to stack by BPF_ST instruction
    3229a29e95f5 xfrm: Ensure policies always checked on XFRM-I input path
    d055ee18cab8 xfrm: interface: rename xfrm_interface.c to xfrm_interface_core.c
    491ce3c1d98a xfrm: Treat already-verified secpath entries as optional
    0ce3d0c068d9 ieee802154: hwsim: Fix possible memory leaks
    29672dc47d99 mmc: meson-gx: fix deferred probing
    9bac4a2b7326 memfd: check for non-NULL file_seals in memfd_create() syscall
    103734b429b9 x86/mm: Avoid using set_pgd() outside of real PGD pages
    793d0224bb60 nilfs2: prevent general protection fault in nilfs_clear_dirty_page()
    96987c383c2b io_uring/net: disable partial retries for recvmsg with cmsg
    25a543ca3005 io_uring/net: clear msg_controllen on partial sendmsg retry
    34a7e5021a43 io_uring/net: save msghdr->msg_control for retries
    b07bb2914ada writeback: fix dereferencing NULL mapping->host on writeback_page_template
    3c46a240ddba regmap: spi-avmm: Fix regmap_bus max_raw_write
    4796d9b06917 regulator: pca9450: Fix LDO3OUT and LDO4OUT MASK
    ba9952e2f50b ip_tunnels: allow VXLAN/GENEVE to inherit TOS/TTL from VLAN
    acee272283f4 mmc: mmci: stm32: fix max busy timeout calculation
    999173f295cc mmc: meson-gx: remove redundant mmc_request_done() call from irq context
    00010b52c705 mmc: sdhci-msm: Disable broken 64-bit DMA on MSM8916
    4a557910bbed cgroup: Do not corrupt task iteration when rebinding subsystem
    815b24401165 PCI: hv: Add a per-bus mutex state_lock
    34e21b8ff3e6 PCI: hv: Fix a race condition in hv_irq_unmask() that can cause panic
    7d852ca7af37 PCI: hv: Remove the useless hv_pcichild_state from struct hv_pci_dev
    5e0d33cc7813 Revert "PCI: hv: Fix a timing issue which causes kdump to fail occasionally"
    ac0df91c7d98 PCI: hv: Fix a race condition bug in hv_pci_query_relations()
    80c5d97b4aa1 Drivers: hv: vmbus: Fix vmbus_wait_for_unload() to scan present CPUs
    4d31eb2e266c Drivers: hv: vmbus: Call hv_synic_free() if hv_synic_alloc() fails
    953dd7e2df81 KVM: Avoid illegal stage2 mapping on invalid memory slot
    1d6c93206839 ACPI: sleep: Avoid breaking S3 wakeup due to might_sleep()
    b12011cea56b nilfs2: fix buffer corruption due to concurrent device reads
    485f6be2549c selftests: mptcp: join: skip check if MIB counter not supported
    64cb73ea77ab selftests: mptcp: join: use 'iptables-legacy' if available
    979a941d7ed3 selftests: mptcp: pm nl: remove hardcoded default limits
    ac65930751c4 selftests/mount_setattr: fix redefine struct mount_attr build error
    726d033133e7 selftests: mptcp: lib: skip if not below kernel version
    b28fc26683b4 selftests: mptcp: lib: skip if missing symbol
    024a24e5d4dd tick/common: Align tick period during sched_timer setup
    3c1aa91b37f9 drm/amd/display: Add wrapper to call planes and stream update
    eea850c025b5 drm/amd/display: Use dc_update_planes_and_stream
    fb7c68bbccad drm/amd/display: Add minimal pipe split transition state
    b5f0e898f674 tpm, tpm_tis: Claim locality in interrupt handler
    39e787253720 tracing: Add tracing_reset_all_online_cpus_unlocked() function
    5a24be76af79 drm/amd/display: fix the system hang while disable PSR

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 8ecf81b1960ab1001efe41cb3d132accf985e3dc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 8e5ff78790..5507690d74 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b2a7dbd4edac7627c091c2ab14fec83726a4c79b"
-SRCREV_meta ?= "b647d9611cb4936536e60a438292fc22df2fe000"
+SRCREV_machine ?= "482797bf5730cf22143afe28d489363ca4bf44a2"
+SRCREV_meta ?= "58ef8845366aea0e1719d00618444be34a765c15"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.118"
+LINUX_VERSION ?= "5.15.119"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 77e11c100b..2641fe60f8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.118"
+LINUX_VERSION ?= "5.15.119"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b79e89ab973aeb8ec48e2cd987436ab52678e795"
-SRCREV_meta ?= "b647d9611cb4936536e60a438292fc22df2fe000"
+SRCREV_machine ?= "ded230a888ef81ccedf0044bd8c2236f3b809599"
+SRCREV_meta ?= "58ef8845366aea0e1719d00618444be34a765c15"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index c4266c6f30..9ee7a350d3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "2290ac7e8d7fbb8e13a34468b85066c398c7d1f3"
-SRCREV_machine:qemuarm64 ?= "3f3f2067c3ee4d9dffaed9b757583d013671cf25"
-SRCREV_machine:qemumips ?= "f61a3b045bdfc9aa7da440852e0a79fd8d9b4d69"
-SRCREV_machine:qemuppc ?= "7a2773ad8fb4ae4eb0183ccda8ec133098d13ec9"
-SRCREV_machine:qemuriscv64 ?= "079c88490578df99b38570c8968b836b8347ed44"
-SRCREV_machine:qemuriscv32 ?= "079c88490578df99b38570c8968b836b8347ed44"
-SRCREV_machine:qemux86 ?= "079c88490578df99b38570c8968b836b8347ed44"
-SRCREV_machine:qemux86-64 ?= "079c88490578df99b38570c8968b836b8347ed44"
-SRCREV_machine:qemumips64 ?= "47d334232ab28f0f8d5316e07e11f8f14c6aaecc"
-SRCREV_machine ?= "079c88490578df99b38570c8968b836b8347ed44"
-SRCREV_meta ?= "b647d9611cb4936536e60a438292fc22df2fe000"
+SRCREV_machine:qemuarm ?= "9ae4c8018039201ce683ff26bde47a3e3e6664ef"
+SRCREV_machine:qemuarm64 ?= "58394274da1b4fdf69ca780001bf25eebfd1950f"
+SRCREV_machine:qemumips ?= "bacfb28c9349b36afe3041e57d98551aa723bbc2"
+SRCREV_machine:qemuppc ?= "d9efae0cb3731ab62cb81778c2fa5689594d34b1"
+SRCREV_machine:qemuriscv64 ?= "a05c1b953b7b7dbd195b7f826e8879d79587a4a3"
+SRCREV_machine:qemuriscv32 ?= "a05c1b953b7b7dbd195b7f826e8879d79587a4a3"
+SRCREV_machine:qemux86 ?= "a05c1b953b7b7dbd195b7f826e8879d79587a4a3"
+SRCREV_machine:qemux86-64 ?= "a05c1b953b7b7dbd195b7f826e8879d79587a4a3"
+SRCREV_machine:qemumips64 ?= "2ae09c410d8a5a0ec66d50368579dd3d3616072b"
+SRCREV_machine ?= "a05c1b953b7b7dbd195b7f826e8879d79587a4a3"
+SRCREV_meta ?= "58ef8845366aea0e1719d00618444be34a765c15"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "f67653019430833d5003f16817d7fa85272a6a76"
+SRCREV_machine:class-devupstream ?= "4af60700a60cc45ee4fb6d579cccf1b7bca20c34"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.118"
+LINUX_VERSION ?= "5.15.119"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


