Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AB1C6377E
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:09 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web12.9894.1650471890333157033
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:24:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HiGkHw0h;
 spf=pass (domain: gmail.com, ip: 209.85.219.46,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id d9so1694074qvm.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 09:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OFlsqmI2/u6S/cTslpTAmw8tnkO/+ZnpRgwQet4JtDY=;
        b=HiGkHw0htQ6nu1lJzGj8SlUboMUpvTowEwK4951fq1OKR6jJKOXw11/QO6ZVApjcWI
         K0HuQ9x/va4hXMWwf31ScOGX5UsqkfolVa7FZelKxwZHf4xbZMvLebjiLUcwhRWz/8/I
         S6AB168cJ7CgTRfo0TNO3tCQh54bjjDEtOTvH5egq7vXNv27DLDmnBaMx6YypkjhLvUI
         VYTWdpb6xsScTovEQrggzjND+jY8x0MG80jHvKmpTwYchcbdvmV408rzw0BfUm630BcV
         Jyg5+/4q2sErVvTijzdNOsIBIPkbXtzg+jxxTGEOQxRgMsFLdDcNCpIhRUr/tyRUS7d7
         8haw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OFlsqmI2/u6S/cTslpTAmw8tnkO/+ZnpRgwQet4JtDY=;
        b=MbfFkHuzIuu+MsliGx+PN6scMDHNocN4z7xDpW/fvxuVD2oTHzRAW+VtytbIcEQje5
         QqbspBHujnf8aFolAALuyeE31QTv7KOAkosQrMoClenGUsrrr5KS7lR1AIK/EA3YN2x1
         tyePzcbtLAeTPkx43wVaIeXpmOCS97hDcMP9/Ir6kfuQ55hBgqiLCOsdu3xMX4Eap0Uv
         5VPrZ8ED1qsTEIjqWmpV1g3IyAfP4CRDVpS5kyX3Ey8Xe+wiZ6wn7YfmNDwBtIXHKx78
         8e1GqzETli69Oi8AKIA8asGfEPLCog7cTLiSTh/GFSNSDFBuxPZV6zQ7MELo91RQvh2i
         zRLg==
X-Gm-Message-State: AOAM531YskkyJR+cst+ES1nmF4AlbFVjgKvPdqCMGYqtM/gxELIyWJSG
	oOajtsGqlMxcvk3910S2n4zR34vzzYMTCA==
X-Google-Smtp-Source: 
 ABdhPJy8/8m1Ehp0VfZr1sS5bmP0ANyqhACvM5yWEYU64SU3czlvlAcU0j6ueOlLIcYlBYQRRKF75w==
X-Received: by 2002:a05:6214:258e:b0:44b:76d7:b10c with SMTP id
 fq14-20020a056214258e00b0044b76d7b10cmr1872807qvb.8.1650471889242;
        Wed, 20 Apr 2022 09:24:49 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 l19-20020a37f513000000b0069c5807ff10sm1657236qkk.27.2022.04.20.09.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 09:24:48 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com,
	richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5][dunfell] linux-yocto/5.4: update to v5.4.183
Date: Wed, 20 Apr 2022 12:24:42 -0400
Message-Id: <20220420162445.56096-2-bruce.ashfield@gmail.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/164712

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    e7d1268f5671 Linux 5.4.183
    5817c13cd6dc hamradio: fix macro redefine warning
    3c7d63cfa150 net: dcb: disable softirqs in dcbnl_flush_dev()
    5f53a6a8ae0f Revert "xfrm: xfrm_state_mtu should return at least 1280 for ipv6"
    f73eb7342bb0 btrfs: add missing run of delayed items after unlink during log replay
    f8d4a8eebb22 btrfs: qgroup: fix deadlock between rescan worker and remove qgroup
    39403d72b4c1 btrfs: fix lost prealloc extents beyond eof after full fsync
    4dd5d3310c75 tracing: Fix return value of __setup handlers
    c0f7253376c8 tracing/histogram: Fix sorting on old "cpu" value
    35fa6f2a31d3 HID: add mapping for KEY_ALL_APPLICATIONS
    ecefb8cc0f8b HID: add mapping for KEY_DICTATE
    52b984b17df9 Input: elan_i2c - fix regulator enable count imbalance after suspend/resume
    16eb602eaddf Input: elan_i2c - move regulator_[en|dis]able() out of elan_[en|dis]able_power()
    3f123c305e4a nl80211: Handle nla_memdup failures in handle_nan_filter
    ec89b276464c net: chelsio: cxgb3: check the return value of pci_find_capability()
    6650fa5f3bcf soc: fsl: qe: Check of ioremap return value
    e89c53fcd28c memfd: fix F_SEAL_WRITE after shmem huge page allocated
    58b07100c20e ibmvnic: free reset-work-item when flushing
    2e7abe2efc31 igc: igc_write_phy_reg_gpy: drop premature return
    5c215ea574a0 ARM: 9182/1: mmu: fix returns from early_param() and __setup() functions
    89b881f339ce ARM: Fix kgdb breakpoint for Thumb2
    87765309bf59 igc: igc_read_phy_reg_gpy: drop premature return
    44ff6c29b2ea arm64: dts: rockchip: Switch RK3399-Gru DP to SPDIF output
    d59120a48997 can: gs_usb: change active_channels's type from atomic_t to u8
    bc653724929c ASoC: cs4265: Fix the duplicated control name
    cff3987e097d firmware: arm_scmi: Remove space in MODULE_ALIAS name
    461a26ebf0dd efivars: Respect "block" flag in efivar_entry_set_safe()
    b4f46598431f ixgbe: xsk: change !netif_carrier_ok() handling in ixgbe_xmit_zc()
    e50c589678e5 net: arcnet: com20020: Fix null-ptr-deref in com20020pci_probe()
    044e209c72cc net: sxgbe: fix return value of __setup handler
    a54dedf620d2 iavf: Fix missing check for running netdev
    150b8a05d005 net: stmmac: fix return value of __setup handler
    e9fa4009032d mac80211: fix forwarded mesh frames AC & queue selection
    f17b27f3d4bc ia64: ensure proper NUMA distance and possible map initialization
    80998dbde14d sched/topology: Fix sched_domain_topology_level alloc in sched_init_numa()
    407ec382ba67 sched/topology: Make sched_init_numa() use a set for the deduplicating sort
    b40c91262477 xen/netfront: destroy queues before real_num_tx_queues is zeroed
    fa84d44df437 block: Fix fsync always failed if once failed
    849339fd72ff net/smc: fix unexpected SMC_CLC_DECL_ERR_REGRMB error cause by server
    8e306a76b9b0 net/smc: fix unexpected SMC_CLC_DECL_ERR_REGRMB error generated by client
    1f5abd671dbd net: dcb: flush lingering app table entries for unregistered devices
    ed05368024a9 batman-adv: Don't expect inter-netns unique iflink indices
    863953227106 batman-adv: Request iflink once in batadv_get_real_netdevice
    a1ccea6183eb batman-adv: Request iflink once in batadv-on-batadv check
    43c25da41e30 netfilter: nf_queue: fix possible use-after-free
    3c934f1087ff netfilter: nf_queue: don't assume sk is full socket
    d2c96b19305f xfrm: enforce validity of offload input flags
    019b4b9d5977 xfrm: fix the if_id check in changelink
    49c24579cec4 netfilter: fix use-after-free in __nf_register_net_hook()
    ac858e4462bd xfrm: fix MTU regression
    f3537f1b2bfd ASoC: ops: Shift tested values in snd_soc_put_volsw() by +min
    75a471401b10 ALSA: intel_hdmi: Fix reference to PCM buffer address
    e28372b295d8 ata: pata_hpt37x: fix PCI clock detection
    58b419d16e87 usb: gadget: clear related members when goto fail
    ba6fdd55b166 usb: gadget: don't release an existing dev->buf
    0babb778ff75 net: usb: cdc_mbim: avoid altsetting toggling for Telit FN990
    a7ef01d25a31 i2c: qup: allow COMPILE_TEST
    da9bf89344a6 i2c: cadence: allow COMPILE_TEST
    bb07c8bb77d0 dmaengine: shdma: Fix runtime PM imbalance on error
    e208668ef7ba cifs: fix double free race when mount fails in cifs_get_root()
    2ed93e3e3f82 Input: clear BTN_RIGHT/MIDDLE on buttonpads
    7b6d98f86905 ASoC: rt5682: do not block workqueue if card is unbound
    e2106e429f05 ASoC: rt5668: do not block workqueue if card is unbound
    7b7c65abeb10 i2c: bcm2835: Avoid clock stretching timeouts
    964f155c382f mac80211_hwsim: initialize ieee80211_tx_info at hw_scan_work
    1a7d2fccd8f6 mac80211_hwsim: report NOACK frames in tx_status

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index b8bd5cbd59..3c2290dbd3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ca1275f9e3d6f98df59045cdbbbcea68a4919009"
-SRCREV_meta ?= "337c38059f2fd562199b0e5133b71410240004e9"
+SRCREV_machine ?= "5e561c53ce51b502405e93b3f35aa7764da89036"
+SRCREV_meta ?= "63746f1a36196425c38a1bc45dfddbcd6f979850"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.182"
+LINUX_VERSION ?= "5.4.183"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 9f57b8a52a..7c2c474f0a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.182"
+LINUX_VERSION ?= "5.4.183"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "bf64274799c0c40e46d9b838d4811556e4dd4c99"
-SRCREV_machine ?= "1018938d65e434be727182856c4a18bfa7013906"
-SRCREV_meta ?= "337c38059f2fd562199b0e5133b71410240004e9"
+SRCREV_machine_qemuarm ?= "a14450f445a2c1804cfdea5a34767e0eabb20ee5"
+SRCREV_machine ?= "d8b3767fa12775de390f40170b53c2facfdc33b9"
+SRCREV_meta ?= "63746f1a36196425c38a1bc45dfddbcd6f979850"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 5a6949ee1d..6c82d83c1c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c9a67a307feed6f22008fbd5e661d73542b93672"
-SRCREV_machine_qemuarm64 ?= "beb8ea86967232e0594184153d2d6bfaf208ae4d"
-SRCREV_machine_qemumips ?= "30f488f7e446f074aa7925584e3a4653d062e5b6"
-SRCREV_machine_qemuppc ?= "73d9421c2d9075b03fe02d5777f1ef15845a6f60"
-SRCREV_machine_qemuriscv64 ?= "48697d18f5be53257744a371d24e7c0a7bdf3760"
-SRCREV_machine_qemux86 ?= "48697d18f5be53257744a371d24e7c0a7bdf3760"
-SRCREV_machine_qemux86-64 ?= "48697d18f5be53257744a371d24e7c0a7bdf3760"
-SRCREV_machine_qemumips64 ?= "b47369b2a3dda9358cfc06ce7fe3bc9647b67872"
-SRCREV_machine ?= "48697d18f5be53257744a371d24e7c0a7bdf3760"
-SRCREV_meta ?= "337c38059f2fd562199b0e5133b71410240004e9"
+SRCREV_machine_qemuarm ?= "17abcde23788c1b8b529119e9bb97a274018ab40"
+SRCREV_machine_qemuarm64 ?= "2ac838b819ef56b9682e64b260abaf4756264f61"
+SRCREV_machine_qemumips ?= "f96b51a2ce7a199824da6dffb56648ff06b7d755"
+SRCREV_machine_qemuppc ?= "7c4de9e3b87a0f846afe297a1b70125f9f6bc084"
+SRCREV_machine_qemuriscv64 ?= "f840db108606f987e174f1658dc120795798e808"
+SRCREV_machine_qemux86 ?= "f840db108606f987e174f1658dc120795798e808"
+SRCREV_machine_qemux86-64 ?= "f840db108606f987e174f1658dc120795798e808"
+SRCREV_machine_qemumips64 ?= "b03b2ba13d3ee9c5d2a401a8702d428f9580f158"
+SRCREV_machine ?= "f840db108606f987e174f1658dc120795798e808"
+SRCREV_meta ?= "63746f1a36196425c38a1bc45dfddbcd6f979850"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.182"
+LINUX_VERSION ?= "5.4.183"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


