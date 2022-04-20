Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AAB2C4167D
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:11 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.13952.1650491509189569220
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 14:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=TTyWiaCZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id md4so3161908pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 14:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=M7/pf0ujk9vSmrarpbHI/29llXaDw7lEPTHvXkfslE0=;
        b=TTyWiaCZydeDagwk9xyo0+Z2Z7cgWwIaTZWtDeKDBes7BUPhAnEthQVNPygd5YtzUF
         Q5ryOcT+J1YjKCcHRmAHrtXloEoBZiItoUWl1sYBnX5iU4jbSWpLQ2ldONiJf5iRt/yQ
         TJNCYrksyR5vySxrap1dlMXqcXQwVNVaxLlNBEpRwCBxAo6B14Vtse5839t9UVw01vML
         bhU3b2W+YC4NYpoyXEyRrG83677BWIszN/7bxaAlxjppBRCPo4JQs4naCwfMsnH1s5AC
         dfIrKGmx6KLTpzzMzchbZ/SQM0+3tYg4MJI75xz6fL9X5rp1DlOgyLM2PPaXNzg9q80T
         pf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M7/pf0ujk9vSmrarpbHI/29llXaDw7lEPTHvXkfslE0=;
        b=Y5d6/IzsuZV8b8TjLlBJYKPknNE1VkQuCvfaOzJLAa3A7bxqh9+o92O8Y9w+inBCyt
         VWPK6VT0Q8JJe9Z7gqGA4vm1JlbByFusSwbYQa0bp1K+wznCeCaUecNzT+LJpsJTymMC
         O2jWoZ2g7yX5ehhERZdyVaITNNHRu5Vz19FuAraeJfb4LROJ7Y6G0yrKCZPCQNizPDMm
         16DzVoqcvS9Z5U/SCM7Z2T5jml6n/l/rJnExGNl9Na2h6l0t97lEegijo2XpQBdDmL4N
         Kt8OXmWTB9VEw7k6wTVj3xbJPa1fP1TFCsFtF6bC9D1dnVeIlBcJOhAKKzwND2eZQjzG
         gC2A==
X-Gm-Message-State: AOAM531qtQCCzAjO3vgrkWrPoNsN++ZcczugohsTvn9YV0ItcoMJcNI1
	2JwsKDbJBShCEZxnKjYqcTU+0PDW518OZ9jqRL4=
X-Google-Smtp-Source: 
 ABdhPJy7OfjhAEX5I6M25FHliQD3YuNADM+r3qKQtx88VJATNbG6A9PVDeQxKd5qTyqSsXa2rroHOg==
X-Received: by 2002:a17:90b:1c8f:b0:1b8:c6dc:ca61 with SMTP id
 oo15-20020a17090b1c8f00b001b8c6dcca61mr6665852pjb.13.1650491508289;
        Wed, 20 Apr 2022 14:51:48 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 e126-20020a621e84000000b0050567191161sm21102153pfe.210.2022.04.20.14.51.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 14:51:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 8/9] linux-yocto/5.4: update to v5.4.188
Date: Wed, 20 Apr 2022 11:51:15 -1000
Message-Id: 
 <6a445ac241b2f4885416daacf2068ee58f177e4a.1650491190.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650491190.git.steve@sakoman.com>
References: <cover.1650491190.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164735

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    2845ff3fd344 Linux 5.4.188
    993c23880bce llc: only change llc->dev when bind() succeeds
    bb4878b39d6d nds32: fix access_ok() checks in get/put_user
    5b1d2561a03e tpm: use try_get_ops() in tpm-space.c
    3bbd0000d012 mac80211: fix potential double free on mesh join
    cda27a2c6d54 rcu: Don't deboost before reporting expedited quiescent state
    edcc12ae3249 crypto: qat - disable registration of algorithms
    b0222e222d77 ACPI: video: Force backlight native for Clevo NL5xRU and NL5xNU
    d7f29f397b74 ACPI: battery: Add device HID and quirk for Microsoft Surface Go 3
    2374007850c5 ACPI / x86: Work around broken XSDT on Advantech DAC-BJ01 board
    06f0ff82c702 netfilter: nf_tables: initialize registers in nft_do_chain()
    5061bf0f79d5 ALSA: hda/realtek: Add quirk for ASUS GA402
    f7a7cd530a9e ALSA: hda/realtek - Fix headset mic problem for a HP machine with alc671
    0c4190b41a69 ALSA: oss: Fix PCM OSS buffer allocation overflow
    ab49515f7db3 ASoC: sti: Fix deadlock via snd_pcm_stop_xrun() call
    d5c7e1987ce3 drivers: net: xgene: Fix regression in CRC stripping
    7870321eaf41 ALSA: pci: fix reading of swapped values from pcmreg in AC97 codec
    1f4eefc585a7 ALSA: cmipci: Restore aux vol on suspend/resume
    d86bf7e0732e ALSA: usb-audio: Add mute TLV for playback volumes on RODE NT-USB
    0f27a350f8b8 ALSA: pcm: Add stream lock during PCM reset ioctl operations
    572f9a0d3f3f llc: fix netdevice reference leaks in llc_ui_bind()
    2e798814e018 thermal: int340x: fix memory leak in int3400_notify()
    5ff048f4ab5c staging: fbtft: fb_st7789v: reset display before initialization
    637d12f9dc67 tpm: Fix error handling in async work
    fee4dfbda68b esp: Fix possible buffer overflow in ESP transformation
    2774edd43ab1 net: ipv6: fix skb_over_panic in __ip6_append_data
    0aef7184630b nfc: st21nfca: Fix potential buffer overflows in EVT_TRANSACTION
    628adfa21815 nfsd: Containerise filecache laundrette
    c32f1041382a nfsd: cleanup nfsd_file_lru_dispose()
    055c4cf7e6da Linux 5.4.187
    1771bc0d04d6 Revert "selftests/bpf: Add test for bpf_timer overwriting crash"
    0dd366cfdfe0 perf symbols: Fix symbol size calculation condition
    e732b0412f8c Input: aiptek - properly check endpoint type
    700a0715854c usb: usbtmc: Fix bug in pipe direction for control transfers
    2282a6eb6d4e usb: gadget: Fix use-after-free bug by not setting udc->dev.driver
    218293762683 usb: gadget: rndis: prevent integer overflow in rndis_set_response()
    58ee8e2cb30a arm64: fix clang warning about TRAMP_VALIAS
    d7b929637527 net: dsa: Add missing of_node_put() in dsa_port_parse_of
    f96aa063ffd5 net: handle ARPHRD_PIMREG in dev_is_mac_header_xmit()
    3fd96bc64c95 drm/panel: simple: Fix Innolux G070Y2-L01 BPP settings
    b01e2df5fbf6 hv_netvsc: Add check for kvmalloc_array
    97ccef56e53c atm: eni: Add check for dma_map_single
    268dcf1f7b31 net/packet: fix slab-out-of-bounds access in packet_recvmsg()
    93697483660a net: phy: marvell: Fix invalid comparison in the resume and suspend functions
    d0f3c2d1d85a efi: fix return value of __setup handlers
    e61655430d29 ocfs2: fix crash when initialize filecheck kobj fails
    184f7bd08ce5 crypto: qcom-rng - ensure buffer for generate is completely filled

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index bfc9299824..7a446830b4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "934ce7677ca0db0a76355a0ebf52c4e73a549a1f"
-SRCREV_meta ?= "bd44c211eb3fd32dd9dcd38ed301e5aeb79c4fcd"
+SRCREV_machine ?= "670b48317a932c46ef12c470cfbcb13d1c6c8665"
+SRCREV_meta ?= "649c66422555d396ba322d260418691ff40243cd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.186"
+LINUX_VERSION ?= "5.4.188"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index fa6fc2b2b4..aeaaafface 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.186"
+LINUX_VERSION ?= "5.4.188"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "d966f6ba017108bef5b9c71a8bf216d1e7a9b000"
-SRCREV_machine ?= "a82777d966fa136c717ff93ff962e0e52309c6ab"
-SRCREV_meta ?= "bd44c211eb3fd32dd9dcd38ed301e5aeb79c4fcd"
+SRCREV_machine_qemuarm ?= "57715fdff2a2f4ed0e6a62ebea57b154773659b8"
+SRCREV_machine ?= "793f9b84d0d31e370719bdb15572de0cd09db67c"
+SRCREV_meta ?= "649c66422555d396ba322d260418691ff40243cd"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index a8d129777a..c590ef0108 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "268b67fc1601a941bc6b6dcaaefeb97a5bfaccc2"
-SRCREV_machine_qemuarm64 ?= "276219af94078862810fa987cf4e6e8646f94a27"
-SRCREV_machine_qemumips ?= "7f69ecf69c0cde672ce07ed82e268224316338d2"
-SRCREV_machine_qemuppc ?= "98c71fc316ac6e8e0dcdb95b8ea82559035a8a18"
-SRCREV_machine_qemuriscv64 ?= "9a1c3b5fbdd1adc30469a0e87ce80e65380d539f"
-SRCREV_machine_qemux86 ?= "9a1c3b5fbdd1adc30469a0e87ce80e65380d539f"
-SRCREV_machine_qemux86-64 ?= "9a1c3b5fbdd1adc30469a0e87ce80e65380d539f"
-SRCREV_machine_qemumips64 ?= "a3026ca71cfeac3a81f4b9ee95d2cb369aacc3c6"
-SRCREV_machine ?= "9a1c3b5fbdd1adc30469a0e87ce80e65380d539f"
-SRCREV_meta ?= "bd44c211eb3fd32dd9dcd38ed301e5aeb79c4fcd"
+SRCREV_machine_qemuarm ?= "883e57c5912406d47b5b6ca1c11338656014b37c"
+SRCREV_machine_qemuarm64 ?= "59d9b7fabfec76f02a45f5e0e066a4e01bc8933a"
+SRCREV_machine_qemumips ?= "27beb64f8b5e8e3ff55912e0f1bfdade981fcf8b"
+SRCREV_machine_qemuppc ?= "0625f7dbae45fec70f37afae4b1eb6a23f2c9ed3"
+SRCREV_machine_qemuriscv64 ?= "d47303abd67e589778c28f3ccc688a0e12ba5692"
+SRCREV_machine_qemux86 ?= "d47303abd67e589778c28f3ccc688a0e12ba5692"
+SRCREV_machine_qemux86-64 ?= "d47303abd67e589778c28f3ccc688a0e12ba5692"
+SRCREV_machine_qemumips64 ?= "263f292c32e84da67fe48d92013b8a97eafff310"
+SRCREV_machine ?= "d47303abd67e589778c28f3ccc688a0e12ba5692"
+SRCREV_meta ?= "649c66422555d396ba322d260418691ff40243cd"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.186"
+LINUX_VERSION ?= "5.4.188"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


