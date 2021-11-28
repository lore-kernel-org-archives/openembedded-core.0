Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BDDC433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:58:27 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web08.53348.1638136706630256732
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=JgSlAEJt;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id u80so14642611pfc.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=KXKepiPZda529YkjV9vwdnQ8ia4J6XDPANSrofiymdk=;
        b=JgSlAEJt7I7ylsNUP+760HJHMDePq77hqF+OJLqsHRQvUoBy+r8ASlPEECe7njkY5b
         TruSICjpkTkGT18SXsDg0DeYHVaQYeKQPq2AO5DBmoNjfQUAQzM3WARUVrPTx92K7Yt5
         qurj+D1f1X5suzMMEbPxHAii9EKt2EtugLk92SeGyrcw3POcQOjHlyfAM7scXLIi1r71
         HSkLXcTDd461o80Lk0cMVeP4X2LYRojGO9w2S59XZvHXFTqkxkV5396KN66JN/fC6CdL
         AOxgHBb47KIbYuDlYCxc0JyC33QlxdkgjojFImlRcFZcImidulAJ08fV3psGU9lQK+Dy
         l9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KXKepiPZda529YkjV9vwdnQ8ia4J6XDPANSrofiymdk=;
        b=gG4TBOWKY3yEZxy2j5b1ZYHD2PF7w6j+yj1ZY+BQzChZd8OQwThuPehKuxpFVq7gba
         QNQmBFLuVbb2XQtD37aqJMR70TTKu68egFOX4T7Nd8v2R6gcoRw9qChYbWpuU/hrsCwK
         FqEQN1TzQHwD09L6+iwN8MWzInF1D8shRQ1gj9iW3Pfuo0mEe8ZtaDwM/XRcC/p68Njn
         EmNGHJ1eMN5p3qMBfGX+yCUBHNDo+3j403MNkzKzhAaxK+BqQlNl1bPQXRMzf1sUbLWb
         7jxV33hS/i0sZhw8wXI62kePFxNwWlwrf4gq09IKzcwF00zcDeAH+TfVHJUAE6Wvl/PJ
         Epqw==
X-Gm-Message-State: AOAM533cefzw4UuSsVH1cXdWLwqZ/tiCcQPpVRtwlporj/QTE61P0rpI
	DmCuMNJm/yTc3VuThN3HAdJMC1d7oNGv0RUhR8Q=
X-Google-Smtp-Source: 
 ABdhPJyJk9jONvBKtEGIU+JTXr6RjP9N1T35mPKPeeBVvbMu4IQc9MtWCdsQ2EEXeI53Kl2KnEJ2UA==
X-Received: by 2002:a05:6a00:228f:b0:49f:d8ac:2f1c with SMTP id
 f15-20020a056a00228f00b0049fd8ac2f1cmr34952465pfe.35.1638136705377;
        Sun, 28 Nov 2021 13:58:25 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.58.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:58:23 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/42] linux-yocto/5.4: update to v5.4.158
Date: Sun, 28 Nov 2021 11:57:16 -1000
Message-Id: 
 <dfb12f1571a6d7581a07f2573abbf928365fa850.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:58:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158886

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    c65356f0f726 Linux 5.4.158
    e31d51f8a41f ARM: 9120/1: Revert "amba: make use of -1 IRQs warn"
    960b1fdfc39a Revert "drm/ttm: fix memleak in ttm_transfered_destroy"
    a73ebe514a60 sfc: Fix reading non-legacy supported link modes
    6789e4b7593b Revert "usb: core: hcd: Add support for deferring roothub registration"
    049849492b77 Revert "xhci: Set HCD flag to defer primary roothub registration"
    2461f38384d5 media: firewire: firedtv-avc: fix a buffer overflow in avc_ca_pmt()
    21fc2bb836e5 net: ethernet: microchip: lan743x: Fix skb allocation failure
    e02fdd7db471 vrf: Revert "Reset skb conntrack connection..."
    1ce287eff9f2 scsi: core: Put LLD module refcnt after SCSI device is released
    e6de9a8b5b30 Linux 5.4.157
    39fb393e2102 perf script: Check session->header.env.arch before using it
    472d9354a9ce KVM: s390: preserve deliverable_mask in __airqs_kick_single_vcpu
    07e9a4e1abfe KVM: s390: clear kicked_mask before sleeping again
    5919a07d71b1 cfg80211: correct bridge/4addr mode check
    dba9e632eda0 net: use netif_is_bridge_port() to check for IFF_BRIDGE_PORT
    0f5b4c57dc85 sctp: add vtag check in sctp_sf_ootb
    df527764072c sctp: add vtag check in sctp_sf_do_8_5_1_E_sa
    0aa322b5fe70 sctp: add vtag check in sctp_sf_violation
    d6470c220025 sctp: fix the processing for COOKIE_ECHO chunk
    5fe74d5e4d58 sctp: fix the processing for INIT_ACK chunk
    5953ee99bab1 sctp: use init_tag from inithdr for ABORT chunk
    5395650d154c phy: phy_start_aneg: Add an unlocked version
    c85b696270db phy: phy_ethtool_ksettings_get: Lock the phy for consistency
    0dea6379e273 net/tls: Fix flipped sign in async_wait.err assignment
    e12b8f3c2b73 net: nxp: lpc_eth.c: avoid hang when bringing interface down
    b232898c1d4b net: ethernet: microchip: lan743x: Fix dma allocation failure by using dma_set_mask_and_coherent
    92507dc1efac net: ethernet: microchip: lan743x: Fix driver crash when lan743x_pm_resume fails
    3708aa267d67 nios2: Make NIOS2_DTB_SOURCE_BOOL depend on !COMPILE_TEST
    b1c76f97ad2c RDMA/sa_query: Use strscpy_pad instead of memcpy to copy a string
    18a012869fa7 net: Prevent infinite while loop in skb_tx_hash()
    6422e8471890 net: batman-adv: fix error handling
    1cead23c1c0b regmap: Fix possible double-free in regcache_rbtree_exit()
    207e6e93e7d6 arm64: dts: allwinner: h5: NanoPI Neo 2: Fix ethernet node
    c29c3295e0e5 RDMA/mlx5: Set user priority for DCT
    13ad93a42ce3 nvme-tcp: fix data digest pointer calculation
    b597b0e2e80b nvmet-tcp: fix data digest pointer calculation
    d997d4e4365f IB/hfi1: Fix abba locking issue with sc_disable()
    0f8cdfff0682 IB/qib: Protect from buffer overflow in struct qib_user_sdma_pkt fields
    5f0bfe21c853 tcp_bpf: Fix one concurrency problem in the tcp_bpf_send_verdict function
    bd99782f3ca4 drm/ttm: fix memleak in ttm_transfered_destroy
    d2c64ebcc76a net: lan78xx: fix division by zero in send path
    a37c5e70ac24 cfg80211: scan: fix RCU in cfg80211_add_nontrans_list()
    590abe5becf5 mmc: sdhci-esdhc-imx: clear the buffer_read_ready to reset standard tuning circuit
    07da44b08641 mmc: sdhci: Map more voltage level to SDHCI_POWER_330
    0821c5608d80 mmc: dw_mmc: exynos: fix the finding clock sample value
    08328d65cb78 mmc: cqhci: clear HALT state after CQE enable
    55a3870f4a26 mmc: vub300: fix control-message timeouts
    e0cfd5159f31 net/tls: Fix flipped sign in tls_err_abort() calls
    6a18d155d5b3 Revert "net: mdiobus: Fix memory leak in __mdiobus_register"
    9fdcf66ee413 nfc: port100: fix using -ERRNO as command type mask
    853f22623dd5 ata: sata_mv: Fix the error handling of mv_chip_id()
    6d0b30784fcd Revert "pinctrl: bcm: ns: support updated DT binding as syscon subnode"
    b7dfc536db87 usbnet: fix error return code in usbnet_probe()
    492140e45d2b usbnet: sanity check for maxpacket
    4ba6c163fe64 ipv4: use siphash instead of Jenkins in fnhe_hashfun()
    3f439c231a03 ipv6: use siphash in rt6_exception_hash()
    1cad781ecf37 powerpc/bpf: Fix BPF_MOD when imm == 1
    ca10ddbbabd0 ARM: 9141/1: only warn about XIP address when not compile testing
    40cd32945552 ARM: 9139/1: kprobes: fix arch_init_kprobes() prototype
    2f7647cc13be ARM: 9134/1: remove duplicate memcpy() definition
    9f44f66396f3 ARM: 9133/1: mm: proc-macros: ensure *_tlb_fns are 4B aligned

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 5de4f59f02..4f278273cb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9ad54377b929c3646bc8c76b1087810948425fda"
-SRCREV_meta ?= "2f0c77d118926b6666062a752a8c9d9a7c07320d"
+SRCREV_machine ?= "1a91fd560dcf8fa9e49fc2f17cb37483201a2b89"
+SRCREV_meta ?= "db8bfc3a107db2a059fb8efa442f7daa17e8d55c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.156"
+LINUX_VERSION ?= "5.4.158"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 907fc31211..836ea62d8f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.156"
+LINUX_VERSION ?= "5.4.158"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "204fb292d2a413e6b9118cbcdc5109781180f603"
-SRCREV_machine ?= "d97030bff131365e3ee7073ce14320206e6fb5d3"
-SRCREV_meta ?= "2f0c77d118926b6666062a752a8c9d9a7c07320d"
+SRCREV_machine_qemuarm ?= "9b7cd001c33ea463bbb23fda6a79900ffc88c484"
+SRCREV_machine ?= "80849cd7ef3a77895f8651cec85648578bef9135"
+SRCREV_meta ?= "db8bfc3a107db2a059fb8efa442f7daa17e8d55c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 6716ad0443..0fbfda8f15 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c22c6be0814013c3c3f8f1173b2e8ab323db7661"
-SRCREV_machine_qemuarm64 ?= "63ee4c9651f167d55ee38f6ec31542f498a29d7b"
-SRCREV_machine_qemumips ?= "43d6560683e8e02bef6070c6ada08d9cc9c6058d"
-SRCREV_machine_qemuppc ?= "4f7df1e46cb36f85c3bd08d05ac5d4a4e2157790"
-SRCREV_machine_qemuriscv64 ?= "9d3037272eba80cd9a033faa0d294b96ce844fb5"
-SRCREV_machine_qemux86 ?= "9d3037272eba80cd9a033faa0d294b96ce844fb5"
-SRCREV_machine_qemux86-64 ?= "9d3037272eba80cd9a033faa0d294b96ce844fb5"
-SRCREV_machine_qemumips64 ?= "c9610166a2e23065edc2930b722d4a02b6b31ae3"
-SRCREV_machine ?= "9d3037272eba80cd9a033faa0d294b96ce844fb5"
-SRCREV_meta ?= "2f0c77d118926b6666062a752a8c9d9a7c07320d"
+SRCREV_machine_qemuarm ?= "414c50525aea1ec953cca6d050d5c23db04de269"
+SRCREV_machine_qemuarm64 ?= "ba5e3380aa8a3789907c031beac2ce81d1eb5d50"
+SRCREV_machine_qemumips ?= "177841cfef0bd71b7b4f0e2e8e2ea3100ee4ea7a"
+SRCREV_machine_qemuppc ?= "c3b4b69caef59344d4a59a2327f9f0130db9ccbe"
+SRCREV_machine_qemuriscv64 ?= "76404f1ae59698b6a446dba29c885ca78c69c330"
+SRCREV_machine_qemux86 ?= "76404f1ae59698b6a446dba29c885ca78c69c330"
+SRCREV_machine_qemux86-64 ?= "76404f1ae59698b6a446dba29c885ca78c69c330"
+SRCREV_machine_qemumips64 ?= "75a3c9aeedd5a8070079d96d0301a303ca3351a8"
+SRCREV_machine ?= "76404f1ae59698b6a446dba29c885ca78c69c330"
+SRCREV_meta ?= "db8bfc3a107db2a059fb8efa442f7daa17e8d55c"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.156"
+LINUX_VERSION ?= "5.4.158"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


