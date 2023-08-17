Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72734C2FC14
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 02:50:16 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.178867.1692240613343842162
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 19:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=zTpGRJrv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1bda9207132so58102675ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 19:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692240612; x=1692845412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJ9VdrsQt0qYJHOkpKocyt8OrLI4aRw4OvMqAnS5ebU=;
        b=zTpGRJrvfw9x9PObE49Ws4Fzj0owXuzfb3XP61Zt+6ekeOK5PxHqsSt1XcCDA4GORb
         mQBB/+Tb5QgPMNrgu+kFE7Kq5UFBSp/73IRvV4WHm7qw4ySLPqXoiyy9UCYeTC3E4W80
         snJkA071s733FHFrH1YrNKowForGlrZzMXqJ1IAIyVLUh9ePlNDcJz0TQqG6ijtPSSY9
         ifM/Sxz4AcyIXvcOQRsB/esb3o4a4VMUNo17HHlgr05yJixv/HDUDvxxByQNbtoosRZn
         ff996vBqB10zRszewwd7qD4r4xBNb3dxB8RaCPIlD6DyMkaEn8Ok3YueL+4mUYkvDVLv
         48LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692240612; x=1692845412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iJ9VdrsQt0qYJHOkpKocyt8OrLI4aRw4OvMqAnS5ebU=;
        b=LEJzn94wfUrne5zE4BKyn28wXPVK5H4lk6Q8RQDCG72mu3t+8FjFLrJAg9J9oQ0UdB
         pjiHd12vxvhG7c34DRceem2qJEBHdDHLOPtTQSFa63VkWd8ZESFsITW3Bs2MllY8eF6g
         iCPO6MWDALRraU+TRD1DeD80GBKsgqcnktri5lzEWdiHiPONgNEHVpcrMZNlqWNiZD8A
         rD6E6JhErOpLCVCJl/lQgRAV0AZT65h4zq2wOuGI00El/WEtaiU2bYJMJxS1Exa8Ii8x
         nnso2F0upVla9XvrMdnGxKe94jJdJWOir5WWdAfhh6WGgkvhGlqajGyrjvW94ZjVkHKZ
         R8aw==
X-Gm-Message-State: AOJu0YyK5wmj6wWugBoERIIdrTNVddcg7+pI699SrHngACFufPUKlVMo
	vBIcPmdZ6S7txwIBQ5jXD98k56g6FO1tMr+5Tjg=
X-Google-Smtp-Source: AGHT+IFhPAxUnvK9TaNJnbjhrSfhw7iaMeAFUGcebtvIxZUl8Dd7ALXMXnKLcgHhE/CAiI0tHds9wQ==
X-Received: by 2002:a17:903:2796:b0:1b8:8223:8bdd with SMTP id jw22-20020a170903279600b001b882238bddmr3826166plb.59.1692240612322;
        Wed, 16 Aug 2023 19:50:12 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o5-20020a170902d4c500b001bb9bc8d232sm13827594plg.61.2023.08.16.19.50.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:50:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/16] linux-yocto/5.10: update to v5.10.186
Date: Wed, 16 Aug 2023 16:49:41 -1000
Message-Id: <591afa6b33a409df5fcd92d66069f39495bc526f.1692239433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692239433.git.steve@sakoman.com>
References: <cover.1692239433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 02:50:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186274

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    381518b4a916 Linux 5.10.186
    29917a20be43 bpf/btf: Accept function names that contain dots
    8b7454dd984a netfilter: nf_tables: hold mutex on netns pre_exit path
    9e8d927cfa56 netfilter: nf_tables: validate registers coming from userspace.
    f19a4818a92a netfilter: nftables: statify nft_parse_register()
    42997367cb67 i2c: imx-lpi2c: fix type char overflow issue when calculating the clock cycle
    5a257f355366 x86/apic: Fix kernel panic when booting with intremap=off and x2apic_phys
    d8efc77f23c8 drm/radeon: fix race condition UAF in radeon_gem_set_domain_ioctl
    485fe165084b drm/exynos: fix race condition UAF in exynos_g2d_exec_ioctl
    0b0fdc43b2ab drm/exynos: vidi: fix a wrong error return
    32134e7a0f21 ARM: dts: Fix erroneous ADS touchscreen polarities
    79cf5657be38 s390/purgatory: disable branch profiling
    a819de62ec2b ASoC: nau8824: Add quirk to active-high jack-detect
    fa08753c2d04 ASoC: simple-card: Add missing of_node_put() in case of error
    9138ed7e2b43 spi: lpspi: disable lpspi module irq in DMA mode
    97b6c4c1d1a8 s390/cio: unregister device when the only path is gone
    fe949c1662c9 Input: soc_button_array - add invalid acpi_index DMI quirk handling
    eaf1fa945206 usb: gadget: udc: fix NULL dereference in remove()
    7d1a0733a55e nfcsim.c: Fix error checking for debugfs_create_dir
    dc357c0787e8 media: cec: core: don't set last_initiator if tx in progress
    c13573032b7b arm64: Add missing Set/Way CMO encodings
    49a2b18f4972 HID: wacom: Add error check to wacom_parse_and_register()
    2b43198de03f scsi: target: iscsi: Prevent login threads from racing between each other
    75aa3f255c88 gpiolib: Fix GPIO chip IRQ initialization restriction
    304802e5b038 gpio: Allow per-parent interrupt data
    bc75968b494a sch_netem: acquire qdisc lock in netem_change()
    caddeadd0d03 Revert "net: phy: dp83867: perform soft reset and retain established link"
    5702afa2c331 netfilter: nfnetlink_osf: fix module autoload
    3d5c09c782a3 netfilter: nf_tables: disallow element updates of bound anonymous sets
    2a90da8e0dd5 netfilter: nft_set_pipapo: .walk does not deal with generations
    792bfe26a655 be2net: Extend xmit workaround to BE3 chip
    cebb5cee0984 net: dsa: mt7530: fix trapping frames on non-MT7621 SoC MT7530 switch
    7a1ae0000509 ipvs: align inner_mac_header for encapsulation
    f2547bc71663 mmc: usdhi60rol0: fix deferred probing
    4a99e35c5a62 mmc: sh_mmcif: fix deferred probing
    c2278de1382b mmc: sdhci-acpi: fix deferred probing
    f6e176ef894a mmc: owl: fix deferred probing
    f29d0ab0e6bd mmc: omap_hsmmc: fix deferred probing
    65d9318e3d56 mmc: omap: fix deferred probing
    9ad3c21fb66d mmc: mvsdio: fix deferred probing
    9b0417fd402f mmc: mtk-sd: fix deferred probing
    ced13bc50ef0 net: qca_spi: Avoid high load if QCA7000 is not available
    b1b9c81e29d2 xfrm: Linearize the skb after offloading if needed.
    31cd0d4a4470 selftests: net: fcnal-test: check if FIPS mode is enabled
    2af75a36af8d selftests: net: vrf-xfrm-tests: change authentication and encryption algos
    07fbbddae5af xfrm: fix inbound ipv4/udp/esp packets to UDPv6 dualstack sockets
    562800447f8b bpf: Fix verifier id tracking of scalars on spill
    3b0a96db670b bpf: track immediate values written to stack by BPF_ST instruction
    bff7824db681 xfrm: Ensure policies always checked on XFRM-I input path
    01af67ed83d0 xfrm: interface: rename xfrm_interface.c to xfrm_interface_core.c
    cdaa6e1105c0 xfrm: Treat already-verified secpath entries as optional
    47be2931c4e5 ieee802154: hwsim: Fix possible memory leaks
    051d6421337b memfd: check for non-NULL file_seals in memfd_create() syscall
    1ac6e9ee8428 sysctl: move some boundary constants from sysctl.c to sysctl_vals
    e1aa3fe3e282 mm/pagealloc: sysctl: change watermark_scale_factor max limit to 30%
    ad10dd211370 x86/mm: Avoid using set_pgd() outside of real PGD pages
    4de2093674f2 nilfs2: prevent general protection fault in nilfs_clear_dirty_page()
    3845c38417bd io_uring/net: disable partial retries for recvmsg with cmsg
    826ee9fa3647 io_uring/net: clear msg_controllen on partial sendmsg retry
    5fdea4468f57 io_uring/net: save msghdr->msg_control for retries
    5a7101d8faab writeback: fix dereferencing NULL mapping->host on writeback_page_template
    f00cd687c2cd regmap: spi-avmm: Fix regmap_bus max_raw_write
    bc35f93e4bd7 regulator: pca9450: Fix LDO3OUT and LDO4OUT MASK
    5938470f9c80 ip_tunnels: allow VXLAN/GENEVE to inherit TOS/TTL from VLAN
    2e454015ca27 mmc: mmci: stm32: fix max busy timeout calculation
    1be288fd3b0d mmc: meson-gx: remove redundant mmc_request_done() call from irq context
    1b97630cd9a9 mmc: sdhci-msm: Disable broken 64-bit DMA on MSM8916
    63608437a83d cgroup: Do not corrupt task iteration when rebinding subsystem
    988d06f5eb32 PCI: hv: Fix a race condition in hv_irq_unmask() that can cause panic
    8f2d5ebdfef7 PCI: hv: Remove the useless hv_pcichild_state from struct hv_pci_dev
    8b7484676994 Revert "PCI: hv: Fix a timing issue which causes kdump to fail occasionally"
    79ceb758e3db PCI: hv: Fix a race condition bug in hv_pci_query_relations()
    8b8c9812c048 Drivers: hv: vmbus: Fix vmbus_wait_for_unload() to scan present CPUs
    b435298349ab nilfs2: fix buffer corruption due to concurrent device reads
    524a2c0bcf99 selftests: mptcp: join: skip check if MIB counter not supported
    e508d9cef887 selftests: mptcp: pm nl: remove hardcoded default limits
    4c4ca42418a5 selftests: mptcp: lib: skip if not below kernel version
    6d20cfbc578d selftests: mptcp: lib: skip if missing symbol
    3cc7935d3221 tick/common: Align tick period during sched_timer setup
    db4ab0c97a4d tracing: Add tracing_reset_all_online_cpus_unlocked() function
    9ced73049016 net/sched: Refactor qdisc_graft() for ingress and clsact Qdiscs
    b1b42fff8ae1 drm/amd/display: fix the system hang while disable PSR

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 7976b96a61..6d8effd6e2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "46fb028ad9413cfa8d47a6dc8bf9a57d9d5edf8b"
-SRCREV_meta ?= "c1168e10ecf30b123a341ca500966eebf3fe2cc2"
+SRCREV_machine ?= "4a1803ede76bf613f627954d55abc14bc3ce33a2"
+SRCREV_meta ?= "2edebf2a655a6ee6f23846cf9af1f81352fc5cd1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.185"
+LINUX_VERSION ?= "5.10.186"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 85dac1d874..8a013a3862 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.185"
+LINUX_VERSION ?= "5.10.186"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "6e0299be775387485e22edcd57ac6099c08f4356"
-SRCREV_machine ?= "772cf990473f73ebf34c1a1ef4f06eb3e297c4db"
-SRCREV_meta ?= "c1168e10ecf30b123a341ca500966eebf3fe2cc2"
+SRCREV_machine:qemuarm ?= "be5fe90e1270855b9cc67ae6312fe04fa4d19693"
+SRCREV_machine ?= "1d287024a6dd075a6dc4027679fea5df640cebd6"
+SRCREV_meta ?= "2edebf2a655a6ee6f23846cf9af1f81352fc5cd1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 2c7a3e2597..2ccedd8c45 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "08e7e91e009a1d738962de06f48f9704075d3a56"
-SRCREV_machine:qemuarm64 ?= "f23a4523287d5199b67a135e5d1cf3680fe58a3a"
-SRCREV_machine:qemumips ?= "82bae5b9d4316474df162ca7e5a2dff35c4ede39"
-SRCREV_machine:qemuppc ?= "8b5027212160436c9d466b80e0c385f265acfbdb"
-SRCREV_machine:qemuriscv64 ?= "dafc025b033585311d1693255c80b60b690b0e54"
-SRCREV_machine:qemuriscv32 ?= "dafc025b033585311d1693255c80b60b690b0e54"
-SRCREV_machine:qemux86 ?= "dafc025b033585311d1693255c80b60b690b0e54"
-SRCREV_machine:qemux86-64 ?= "dafc025b033585311d1693255c80b60b690b0e54"
-SRCREV_machine:qemumips64 ?= "ee18c4343db52d5846a0f332cd6df26a6f72dd45"
-SRCREV_machine ?= "dafc025b033585311d1693255c80b60b690b0e54"
-SRCREV_meta ?= "c1168e10ecf30b123a341ca500966eebf3fe2cc2"
+SRCREV_machine:qemuarm ?= "f9df75cf799c8ac43b932476c7ad6b4b4fba33de"
+SRCREV_machine:qemuarm64 ?= "404cf5c05b3fc82b4d8395fcc5abe4b26407665a"
+SRCREV_machine:qemumips ?= "9d39a0ab63dfaa32be0ddd02b61acd2fe1a2b156"
+SRCREV_machine:qemuppc ?= "e55cd861f7167730eb17a5c82891fad17c515b64"
+SRCREV_machine:qemuriscv64 ?= "cfcf13659ada4eee41e11484404de999ce571196"
+SRCREV_machine:qemuriscv32 ?= "cfcf13659ada4eee41e11484404de999ce571196"
+SRCREV_machine:qemux86 ?= "cfcf13659ada4eee41e11484404de999ce571196"
+SRCREV_machine:qemux86-64 ?= "cfcf13659ada4eee41e11484404de999ce571196"
+SRCREV_machine:qemumips64 ?= "7d139a5b0b4abc1a7104845c5c9f2523dce0d589"
+SRCREV_machine ?= "cfcf13659ada4eee41e11484404de999ce571196"
+SRCREV_meta ?= "2edebf2a655a6ee6f23846cf9af1f81352fc5cd1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.185"
+LINUX_VERSION ?= "5.10.186"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


