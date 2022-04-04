Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FCCCC3527D
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:41 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.37060.1649085561116535338
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 08:19:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OztuQYar;
 spf=pass (domain: gmail.com, ip: 209.85.219.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id a5so7714606qvx.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Apr 2022 08:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3LE/cid44bojuvUER6xcXb+kTujpMewZKYgbIrNu99M=;
        b=OztuQYar2tazjP2SQ1JRtxFWGAeSmWFC0wao+vH3VBpLfXKPXB3hU7/MkkN79pqeEc
         r5430h/kGNz/hx9xn4+c/cpmxIVVsr3XOdnU/chjxqBvccxiOllAR+P2DIHBCXXx29BW
         xkbFPOgo/DmM8T7lm69oGIMA0SpytY+okLYmGnwVDoBL430N0tg7egalYo1oF+aEooCF
         84UE27yoPKHQs9tIGxCyjq3+KzayCzJdqHLKK7I2vFjtMOIC+mDYbofJ4GC+OBm4lUtc
         9gaVmJFxgE/kp7AYlxSqOoJeKFzy+JEaFD3HwNWnb7jBH4sD5eBKNLMVGgidmh6mo6Z5
         1qrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3LE/cid44bojuvUER6xcXb+kTujpMewZKYgbIrNu99M=;
        b=CEwFzViSQ+s0gbOfX1K6wH2iCvsY1Uklo7Vj1mdGVOhB1pj7WPIUspD487H46gGiD+
         wyuEScf+S2lieorlSH0EDLNYPORnFOuMsIIZy+c15JUiQgW+3ObDrEbZLMPTs3c2CnHg
         aoxZ6rmMQakuZh8e1+pFPd2fXDBaQk+DAhKr00jLvqcdnR+dzysSLdzTQ5ixMiLbTmsJ
         fjh3F4RFqKUb6WktupHEfhZNn2gAlmbkDupX1/B8xgIBi8X52BGNCrE/Z+t0yoQRDrCl
         xMrSNvNAXJVojZv1RnN5lFVR9fpkUceLbvG600N7TjBaTaT8Ukcz22U52Gs0cCbySlX2
         pjIg==
X-Gm-Message-State: AOAM533k5ilefQIn7Cuu6cpdfebx+Y9mu6D5zd72smbyh4q/QUCbO3hE
	4cwfDRyZ9ArBAO3xUAEbBTRLH8OWgUCpvw==
X-Google-Smtp-Source: 
 ABdhPJxyghNO2u+fiyodRVGcncywHRAm2Qtb4wDn8LeoENdbX/aSQdhMHTmE9zL8Bwu7PieP5YFA3Q==
X-Received: by 2002:ad4:5bc1:0:b0:42c:37be:6ac3 with SMTP id
 t1-20020ad45bc1000000b0042c37be6ac3mr536255qvt.18.1649085559973;
        Mon, 04 Apr 2022 08:19:19 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c3-20020ac87d83000000b002e1d1b3df15sm8969772qtd.44.2022.04.04.08.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 08:19:19 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto/5.15: update to v5.15.32
Date: Mon,  4 Apr 2022 11:19:11 -0400
Message-Id: 
 <3fa3c7a88beb783e2cd59d28d12248f8652cdc78.1649085436.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1649085436.git.bruce.ashfield@gmail.com>
References: <cover.1649085436.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163996

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    e29be6724adb Linux 5.15.32
    60981bb5ce18 llc: only change llc->dev when bind() succeeds
    22ac37c53065 nds32: fix access_ok() checks in get/put_user
    110dea31d48f m68k: fix access_ok for coldfire
    cdb96445297b wcn36xx: Differentiate wcn3660 from wcn3620
    476ddd23f818 tpm: use try_get_ops() in tpm-space.c
    12e407a8ef17 mac80211: fix potential double free on mesh join
    e65d28d4e9bf uaccess: fix integer overflow on access_ok()
    058d62a03e7d rcu: Don't deboost before reporting expedited quiescent state
    b094fece3810 drm/virtio: Ensure that objs is not NULL in virtio_gpu_array_put_free()
    5023652cc6e4 Revert "ath: add support for special 0x0 regulatory domain"
    4b6a48f87d03 Bluetooth: btusb: Add one more Bluetooth part for the Realtek RTL8852AE
    cb807cb52a8e crypto: qat - disable registration of algorithms
    57a2b3f8bf1c ACPI: video: Force backlight native for Clevo NL5xRU and NL5xNU
    a01ac2411489 ACPI: battery: Add device HID and quirk for Microsoft Surface Go 3
    8942aac69016 ACPI / x86: Work around broken XSDT on Advantech DAC-BJ01 board
    1bd57dea4561 netfilter: nf_tables: validate registers coming from userspace.
    fafb904156fb netfilter: nf_tables: initialize registers in nft_do_chain()
    3e27eafac659 drivers: net: xgene: Fix regression in CRC stripping
    c2052ad0c74f ALSA: pci: fix reading of swapped values from pcmreg in AC97 codec
    9abaacd6491e ALSA: cmipci: Restore aux vol on suspend/resume
    099a1cc21b16 ALSA: usb-audio: Add mute TLV for playback volumes on RODE NT-USB
    f4827c62b649 ALSA: pcm: Add stream lock during PCM reset ioctl operations
    51fce708ab89 ALSA: pcm: Fix races among concurrent prealloc proc writes
    cb6a39c5ebd0 ALSA: pcm: Fix races among concurrent prepare and hw_params/hw_free calls
    47711ff10c7e ALSA: pcm: Fix races among concurrent read/write and buffer changes
    33061d0fba51 ALSA: pcm: Fix races among concurrent hw_params and hw_free calls
    3b1bacd00ac3 ALSA: hda/realtek: Add quirk for ASUS GA402
    0e7cdc8059a0 ALSA: hda/realtek - Fix headset mic problem for a HP machine with alc671
    8e6ea2176222 ALSA: hda/realtek: Add quirk for Clevo NP50PNJ
    85060f4868db ALSA: hda/realtek: Add quirk for Clevo NP70PNJ
    10cdffd4854a ALSA: usb-audio: add mapping for new Corsair Virtuoso SE
    7a40cbf3579a ALSA: oss: Fix PCM OSS buffer allocation overflow
    5e431799c35b ASoC: sti: Fix deadlock via snd_pcm_stop_xrun() call
    e90729961083 llc: fix netdevice reference leaks in llc_ui_bind()
    5b2ca3b8213a Bluetooth: btusb: Add another Realtek 8761BU
    42b9f6d19faa tpm: Fix error handling in async work
    2317fd3b126c net: ipv6: fix skb_over_panic in __ip6_append_data
    a34c47b1ab07 nfc: st21nfca: Fix potential buffer overflows in EVT_TRANSACTION
    96e48ac9a685 Linux 5.15.31
    4c5d94990fa2 btrfs: skip reserved bytes warning on unmount after log cleanup failure
    23775775b9a6 perf symbols: Fix symbol size calculation condition
    e762f57ff255 Input: aiptek - properly check endpoint type
    0cd2dd4bcf4a scsi: mpt3sas: Page fault in reply q processing
    c69aef9db878 usb: usbtmc: Fix bug in pipe direction for control transfers
    2015c23610cd usb: gadget: Fix use-after-free bug by not setting udc->dev.driver
    56b38e3ca406 usb: gadget: rndis: prevent integer overflow in rndis_set_response()
    222f5e2d7f20 arm64: fix clang warning about TRAMP_VALIAS
    80974bb73027 iavf: Fix hang during reboot/shutdown
    800a17adb531 net: mscc: ocelot: fix backwards compatibility with single-chain tc-flower offload
    2d7cff7e1fee net: bcmgenet: skip invalid partial checksums
    6840fdeab423 bnx2x: fix built-in kernel driver load failure
    f07e0b020f7a net: phy: mscc: Add MODULE_FIRMWARE macros
    e396fda10ddf net: dsa: Add missing of_node_put() in dsa_port_parse_of
    11dab4a800a4 drm: Don't make DRM_PANEL_BRIDGE dependent on DRM_KMS_HELPERS
    a1adf00e1728 net: handle ARPHRD_PIMREG in dev_is_mac_header_xmit()
    8ee52c302191 drm/panel: simple: Fix Innolux G070Y2-L01 BPP settings
    43dcd410809e drm/imx: parallel-display: Remove bus flags check in imx_pd_bridge_atomic_check()
    ab0ab1761831 hv_netvsc: Add check for kvmalloc_array
    735f918cc2c8 iavf: Fix double free in iavf_reset_task
    b2bc45327e8c atm: eni: Add check for dma_map_single
    a055f5f2841f net/packet: fix slab-out-of-bounds access in packet_recvmsg()
    a296f3ae8009 net: phy: marvell: Fix invalid comparison in the resume and suspend functions
    b9820bf09f59 esp6: fix check on ipv6_skip_exthdr's return value
    093f11b49609 vsock: each transport cycles only on its own sockets
    1dcc1b888223 alx: acquire mutex for alx_reinit in alx_change_mtu
    4b49ba22a253 efi: fix return value of __setup handlers
    16ac5dca1e13 drm/mgag200: Fix PLL setup for g200wb and g200ew
    d4ad8736ac98 block: release rq qos structures for queue without disk
    6829aa17ca55 mm: swap: get rid of livelock in swapin readahead
    b786b64dcb31 ocfs2: fix crash when initialize filecheck kobj fails
    ab9337c7cb6f crypto: qcom-rng - ensure buffer for generate is completely filled

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 8edafbcc4e..d28bfaa62e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "593f500eff5997a184c8d3836e1e26b199af994f"
-SRCREV_meta ?= "fee71fc34f2e551ebfd7bf0996d82f3447787e7a"
+SRCREV_machine ?= "3b3fed8f3b6d6d691ed4ebc270ed13fc4f24a0b7"
+SRCREV_meta ?= "7dd85143b4ed77bdcb6628ac8ea69917e1cd29e5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.30"
+LINUX_VERSION ?= "5.15.32"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 01c59a1ffc..7b42986357 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.30"
+LINUX_VERSION ?= "5.15.32"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "0c05aecb4a6a902d8b44b69f887dd991e091b234"
-SRCREV_machine ?= "94c4403d43f8d4a4fa330d9342350b02426696d4"
-SRCREV_meta ?= "fee71fc34f2e551ebfd7bf0996d82f3447787e7a"
+SRCREV_machine:qemuarm ?= "6a4187344f4b0c1a0e372124a55d164c4db1c1fc"
+SRCREV_machine ?= "38eee29b552caba70723f16b5b7e6c47237baea7"
+SRCREV_meta ?= "7dd85143b4ed77bdcb6628ac8ea69917e1cd29e5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index de71d1fe13..29448ec237 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4632211e5b019b6337536305bfce0a5ffd3b570b"
-SRCREV_machine:qemuarm64 ?= "c88fcdb0b3ca81f0149309ed7025cb28f709ed3d"
-SRCREV_machine:qemumips ?= "ad268b2a1d6d1d6f1c9e9103cf4b1519477feb39"
-SRCREV_machine:qemuppc ?= "688bb26b6f83a60ec39a0f20f31ec2bc37b49c6f"
-SRCREV_machine:qemuriscv64 ?= "70cf8dde55448a804da825139fa12daf5a855047"
-SRCREV_machine:qemuriscv32 ?= "70cf8dde55448a804da825139fa12daf5a855047"
-SRCREV_machine:qemux86 ?= "70cf8dde55448a804da825139fa12daf5a855047"
-SRCREV_machine:qemux86-64 ?= "70cf8dde55448a804da825139fa12daf5a855047"
-SRCREV_machine:qemumips64 ?= "5e7bcff3dccd4749783b87d69ffd405ba71c9fda"
-SRCREV_machine ?= "70cf8dde55448a804da825139fa12daf5a855047"
-SRCREV_meta ?= "fee71fc34f2e551ebfd7bf0996d82f3447787e7a"
+SRCREV_machine:qemuarm ?= "f6561f66ec8485b0f55fa5c09e3614d85e65da77"
+SRCREV_machine:qemuarm64 ?= "182d2a0dfea7f5a869b8938b5c50fd46153047ff"
+SRCREV_machine:qemumips ?= "5954e50bf90b3e22361b335b3fab47fcbd14a88e"
+SRCREV_machine:qemuppc ?= "114761d623636cafa01bb60b3e0e9262f21d2d56"
+SRCREV_machine:qemuriscv64 ?= "ee43e792dbdecc18d6d72c360712659fc78b997f"
+SRCREV_machine:qemuriscv32 ?= "ee43e792dbdecc18d6d72c360712659fc78b997f"
+SRCREV_machine:qemux86 ?= "ee43e792dbdecc18d6d72c360712659fc78b997f"
+SRCREV_machine:qemux86-64 ?= "ee43e792dbdecc18d6d72c360712659fc78b997f"
+SRCREV_machine:qemumips64 ?= "f57326efb3ee9cba3f867b65b7535d3819da7933"
+SRCREV_machine ?= "ee43e792dbdecc18d6d72c360712659fc78b997f"
+SRCREV_meta ?= "7dd85143b4ed77bdcb6628ac8ea69917e1cd29e5"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "0464ab17184b8fdec6676fabe76059b90e54e74f"
+SRCREV_machine:class-devupstream ?= "e29be6724adbc9c3126d2a9550ec21f927f22f6d"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -41,7 +41,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.30"
+LINUX_VERSION ?= "5.15.32"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


