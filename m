Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CAEAC25B5C
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:52:55 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web10.4005.1714704763275244536
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:52:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZFF61xfc;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-47eef876f2aso436382137.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704762; x=1715309562; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DaxHmgP4/uaZbZVklT0kLeWjnzK5ppRvpmXStBbw20s=;
        b=ZFF61xfc/HdSTYRewXj6z2w+oYvQS+WL5CsT4K/nLMLjDBwYi66EjumOjCVARO/zMh
         yxBu2KSuVUSireTEYYwDlonX3QGigq6wk8a86IC82TDs0JcQX4T7SZc79RAQ8w+CS/79
         6QKFHEGfoUK9bYuPnuIAvZu6xZKXGQOYTAVrXBXlF4wOKKWxcofhpFhZYPEiptNm3dPj
         SHpy+7SHNbWDDD6IUkuWDuV6MWNBcgo2tCBQ5qK4WwWw5BF6wE5/shng7Wncq1kFUgXX
         feYgK7knpRVP+r/80qYfGtBIwgSaJdphKlUGHrrf3QnpUc68Z6Py+9WXg20eSkLjmCiz
         gWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704762; x=1715309562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DaxHmgP4/uaZbZVklT0kLeWjnzK5ppRvpmXStBbw20s=;
        b=fI9BZGwm5hTfUxorHr0DEXDPXCxQdobw6CrYqwivnehLqYfS8M9Gu9dkaNtwfDHIGy
         KIM8bIq5VVgFCzeuvFnHUXpwjdSOO0VNsYjStqWWrN/9I5UTHSy9N1QKv/vDRFZrGDnG
         QvHOaLNvU7R/FhoafzVRM+VDW7cTkg6THg+kpLSjdC3ZTbX6tnvy6vYrAWSDer37Mbcu
         TN1v8UvXo51nhzoOLTXgKHwGvtIyIUduwiLOE1ZrBwkTCVTp+3kOyfp+tCKFHZJdUJhE
         My/6xb91e0H6eUaJjEduZyNJKegaCuvYx7hlgZ2KHlD1PHCu81aOvr/gWnSsHOcegWfg
         vW5A==
X-Gm-Message-State: AOJu0Yy04F2FzsbwSxIdNuVs+JbPlOkQW/PCy1mfR4PlQmMWmR98vGHo
	e4823YU7FfqqoineZAYVVAkSBxITAhXy1LZGA5jYRTq/iHfFoNrFqu+GGg==
X-Google-Smtp-Source: AGHT+IHbhAasv2+9bKY/kXsqKtkslBeEEKwJkLILpR1icz0JJI4W18hgyJX6C60rclN+D0fnYqOAtA==
X-Received: by 2002:a05:6102:1801:b0:47e:ee4d:8431 with SMTP id jg1-20020a056102180100b0047eee4d8431mr1601714vsb.3.1714704761994;
        Thu, 02 May 2024 19:52:41 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id ml17-20020a056214585100b006a0ee113c94sm837369qvb.30.2024.05.02.19.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:52:41 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/12] linux-yocto/5.15: update to v5.15.151
Date: Thu,  2 May 2024 22:52:29 -0400
Message-Id: <20240503025240.373184-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:52:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198944

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    574362648507 Linux 5.15.151
    4a4eeb691253 mptcp: fix double-free on socket dismantle
    cc5e34bc5b20 Revert "tls: rx: move counting TlsDecryptErrors for sync"
    9d5932275b3b net: tls: fix async vs NIC crypto offload
    68dbe92d677c bpf: Derive source IP addr via bpf_*_fib_lookup()
    39b4ee40d204 bpf: Add table ID to bpf_fib_lookup BPF helper
    75ca92271da5 bpf: Add BPF_FIB_LOOKUP_SKIP_NEIGH for bpf_fib_lookup
    20f5aafe521c Revert "interconnect: Teach lockdep about icc_bw_lock order"
    fe549d8e9763 Revert "interconnect: Fix locking for runpm vs reclaim"
    ead68522455b gpio: fix resource unwinding order in error path
    ea514ac5f1be gpiolib: Fix the error path order in gpiochip_add_data_with_key()
    c21b5ad4e79d gpio: 74x164: Enable output pins after registers are reset
    6c480d0f1318 af_unix: Drop oob_skb ref before purging queue in GC.
    2f3ae0905a7e Revert "drm/bridge: lt8912b: Register and attach our DSI device at probe"
    22850c9950a4 fs,hugetlb: fix NULL pointer dereference in hugetlbs_fill_super
    94965be37add cachefiles: fix memory leak in cachefiles_add_cache()
    cc32ba2fdf3f mptcp: fix possible deadlock in subflow diag
    af46c8a0d8db mptcp: push at DSS boundaries
    5101e9f11a87 mptcp: add needs_id for netlink appending addr
    4ba8702b23e3 mptcp: clean up harmless false expressions
    f431a58cb933 selftests: mptcp: add missing kconfig for NF Filter in v6
    5d7f2e7d213f selftests: mptcp: add missing kconfig for NF Filter
    55366b9ae937 mptcp: rename timer related helper to less confusing names
    833d068e776a mptcp: process pending subflow error on close
    305078c2741f mptcp: move __mptcp_error_report in protocol.c
    fbd16a1e4b14 x86/cpu/intel: Detect TME keyid bits before setting MTRR mask registers
    077952157636 pmdomain: qcom: rpmhpd: Fix enabled_corner aggregation
    5f6e8930ca96 mmc: sdhci-xenon: fix PHY init clock stability
    f4fae0a76ee2 mmc: sdhci-xenon: add timeout for PHY init complete
    52af4f26c02f mmc: core: Fix eMMC initialization with 1-bit bus connection
    4529c084a320 dmaengine: fsl-qdma: init irq after reg initialization
    2dee8895a25e dmaengine: ptdma: use consistent DMA masks
    106c1ac953a6 dmaengine: fsl-qdma: fix SoC may hang on 16 byte unaligned read
    ab2d68655d0f btrfs: dev-replace: properly validate device names
    063715c33b4c wifi: nl80211: reject iftype change with mesh ID change
    9376d059a705 gtp: fix use-after-free and null-ptr-deref in gtp_newlink()
    cbf67001d647 ALSA: firewire-lib: fix to check cycle continuity
    7d930a4da179 tomoyo: fix UAF write bug in tomoyo_write_control()
    5941a90c55d3 riscv: Sparse-Memory/vmemmap out-of-bounds fix
    80b15346492b afs: Fix endless loop in directory parsing
    20a4b5214f7b fbcon: always restore the old font data in fbcon_do_set_font()
    5eac17127e85 ALSA: Drop leftover snd-rtctimer stuff from Makefile
    e601ae81910c power: supply: bq27xxx-i2c: Do not free non existing IRQ
    4b73473c050a efi/capsule-loader: fix incorrect allocation size
    5bc8810b788a tls: decrement decrypt_pending if no async completion will be called
    9ae48288fc8b tls: rx: use async as an in-out argument
    bdb7fb29236a tls: rx: assume crypto always calls our callback
    2ec59e165549 tls: rx: move counting TlsDecryptErrors for sync
    b61dbb5ef449 tls: rx: don't track the async count
    4fd23a600be9 tls: rx: factor out writing ContentType to cmsg
    9876554897b3 tls: rx: wrap decryption arguments in a structure
    d6c9c2a66c91 tls: rx: don't report text length from the bowels of decrypt
    ffc8a2b82141 tls: rx: drop unnecessary arguments from tls_setup_from_iter()
    1abd49fa1ffb tls: hw: rx: use return value of tls_device_decrypted() to carry status
    432d40036f17 tls: rx: refactor decrypt_skb_update()
    17d8bda2a6fd tls: rx: don't issue wake ups when data is decrypted
    de0970d258ef tls: rx: don't store the decryption status in socket context
    4c68bf84d162 tls: rx: don't store the record type in socket context
    f1e71909373e igb: extend PTP timestamp adjustments to i211
    a1227b27fccc rtnetlink: fix error logic of IFLA_BRIDGE_FLAGS writing back
    7c3f28599652 netfilter: bridge: confirm multicast packets before passing them up the stack
    3e9cd8913635 netfilter: let reset rules clean out conntrack entries
    c3a84f83d9e5 netfilter: make function op structures const
    2cb39bea7085 netfilter: core: move ip_ct_attach indirection to struct nf_ct_hook
    84d3baab4b89 netfilter: nfnetlink_queue: silence bogus compiler warning
    4225152bfb77 netfilter: nf_tables: allow NFPROTO_INET in nft_(match/target)_validate()
    af1a9a925e46 Bluetooth: Enforce validation on max value of connection interval
    c3df637266df Bluetooth: hci_event: Fix handling of HCI_EV_IO_CAPA_REQUEST
    4cd28dae8210 Bluetooth: hci_event: Fix wrongly recorded wakeup BD_ADDR
    da4569d450b1 Bluetooth: Avoid potential use-after-free in hci_error_reset
    8e9955630117 stmmac: Clear variable when destroying workqueue
    28bbdb4e1993 uapi: in6: replace temporary label with rfc9486
    1e2cbdbdfa76 net: usb: dm9601: fix wrong return value in dm9601_mdio_read
    9b1f5c003284 veth: try harder when allocating queue memory
    914c73e7872d net: enable memcg accounting for veth queues
    8d4d26f51ef0 lan78xx: enable auto speed configuration for LAN7850 if no EEPROM is detected
    8a54834c03c3 ipv6: fix potential "struct net" leak in inet6_rtm_getaddr()
    f011c103e654 net: veth: clear GRO when clearing XDP even when down
    bf3f0c4169be cpufreq: intel_pstate: fix pstate limits enforcement for adjust_perf call back
    cbfd27689b5e tun: Fix xdp_rxq_info's queue_index when detaching
    afec0c5cd2ed net: ip_tunnel: prevent perpetual headroom growth
    c71ed29d15b1 netlink: Fix kernel-infoleak-after-free in __skb_datagram_iter
    386bb2537e9b mtd: spinand: gigadevice: Fix the get ecc status issue
    00b19ee0dcc1 netfilter: nf_tables: disallow timeout for anonymous sets

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.15.bb            |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 24 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 00c03411b1..ba093b7450 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "da32201bc41d994b0300c6b4738505f4875dc190"
+SRCREV_machine ?= "b4217af54500ea854ec4c6112747546fd17ffbd1"
 SRCREV_meta ?= "bef59dc5a78b4d101d1be23d4b36a73fd849241a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.150"
+LINUX_VERSION ?= "5.15.151"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 2051d1c0a1..3a19e17d80 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.150"
+LINUX_VERSION ?= "5.15.151"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,7 +14,7 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "540fc92dd7359025bb09962431565b5a9627536b"
+SRCREV_machine ?= "3046b9945907c6b02e6d9aff62d287872dc6e775"
 SRCREV_meta ?= "bef59dc5a78b4d101d1be23d4b36a73fd849241a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 101aceb3dc..f7db6becd1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,16 +14,16 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f7ce03f6b5de6a323b165e8adbaa3caae8646c20"
-SRCREV_machine:qemuarm64 ?= "db39986a84e0bcfe5a488ab8dca114ed27e469ce"
-SRCREV_machine:qemumips ?= "695cf3a24eaedc1e40393947afc22f8dc8324b47"
-SRCREV_machine:qemuppc ?= "3dfb435f3fb9ec38c60d1eeeeebf63b6a88308d3"
-SRCREV_machine:qemuriscv64 ?= "7c82dac028864e8a608e70d3ac2dbc05b3cd1e14"
-SRCREV_machine:qemuriscv32 ?= "7c82dac028864e8a608e70d3ac2dbc05b3cd1e14"
-SRCREV_machine:qemux86 ?= "7c82dac028864e8a608e70d3ac2dbc05b3cd1e14"
-SRCREV_machine:qemux86-64 ?= "7c82dac028864e8a608e70d3ac2dbc05b3cd1e14"
-SRCREV_machine:qemumips64 ?= "2f830b0a13ad4dbe738960d9e7d255ac411064b4"
-SRCREV_machine ?= "7c82dac028864e8a608e70d3ac2dbc05b3cd1e14"
+SRCREV_machine:qemuarm ?= "4c3c9263f2df0559228f1edf79f1cfdbc17eb78e"
+SRCREV_machine:qemuarm64 ?= "4f4714e7a37c1803e55d3dfba63b0b3c79f3f13e"
+SRCREV_machine:qemumips ?= "8e9c4c18b99dc2a9607ab7aff55fbeb24e80a4fc"
+SRCREV_machine:qemuppc ?= "c21a9cc085e59393e0969fa8f4b29b7eb4d2f8d5"
+SRCREV_machine:qemuriscv64 ?= "c38d1c100bbd13b4d4e72d8ac4b08a2d51ca6433"
+SRCREV_machine:qemuriscv32 ?= "c38d1c100bbd13b4d4e72d8ac4b08a2d51ca6433"
+SRCREV_machine:qemux86 ?= "c38d1c100bbd13b4d4e72d8ac4b08a2d51ca6433"
+SRCREV_machine:qemux86-64 ?= "c38d1c100bbd13b4d4e72d8ac4b08a2d51ca6433"
+SRCREV_machine:qemumips64 ?= "fd55ed7972e2000134a014374c4c1d7ab4d9c6ff"
+SRCREV_machine ?= "c38d1c100bbd13b4d4e72d8ac4b08a2d51ca6433"
 SRCREV_meta ?= "bef59dc5a78b4d101d1be23d4b36a73fd849241a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
@@ -31,7 +31,7 @@ SRCREV_meta ?= "bef59dc5a78b4d101d1be23d4b36a73fd849241a"
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "80efc6265290d34b75921bf7294e0d9c5a8749dc"
+SRCREV_machine:class-devupstream ?= "57436264850706f50887bbb2148ee2cc797c9485"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.150"
+LINUX_VERSION ?= "5.15.151"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


