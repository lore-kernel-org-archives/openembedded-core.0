Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC0DEB64DD
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:00 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.26499.1688656017170818109
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=xLkEqLau;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1b89114266dso5063585ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656016; x=1691248016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESnLLU2qbGgQMprCuUTWA+BF46tU5B1xoxr1aQUvotk=;
        b=xLkEqLaukHzC1zJqg10XEyixkaWoKDhXel/3EUVohxp5TORQG9jKdAwApgN5gtbdAk
         4BD4GwwwRSSHYdLv1kOkiT3/2dubrK3rKMYeyvhSFemedTvWq4oQDbePVtMW4s9YFIQC
         S59dhseX300/3WrkxRh2Sjqh9+yEsexcywTiJ3olXvsDNCZWZmPibbxOlTnpey0JECmc
         y9k9x5O6xpRk88eD5XBHANsOXPjTjNk5vvSy/8XBzbXBWB9fecETTyJMapMuWBxMRliS
         y21IU3rOxnV8zaxHWT1fvqCnW0kESepxBKupmhR42kMGqNIbgtB8A57H1oOYBua4uvML
         yIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656016; x=1691248016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESnLLU2qbGgQMprCuUTWA+BF46tU5B1xoxr1aQUvotk=;
        b=B8xjXDEflRKKYL8zCs2SI7CZIupmCC7nf6JN9oKVDq7BgPNngytcHndLLoae1kzkZO
         GwwuGVEN0/eTMHz51Yd94j6fEAUwYD75ZGRs3PYdIprFU51xdSFhhQFbBGV6boQCMhn2
         jmwoHHF4mI8uiHBrV/FfiiA4H+pPSZ34ol+W5zq6BmFXs/2lz7HNFOHzlxnGf1Sg4Y1r
         pal/sBPC6wPt0eKJ6W975pOzttQ+ubHutOPnw+6lY+5uVlgCpAxMK+0yz1dvofhRgFaZ
         6e+QLoRb4XPVuKE5TUA4UFVkKiO4cOk5/6Po9DiDMtmpUXv07+xmXUC6JRi/v2gGBkBa
         hAvg==
X-Gm-Message-State: ABy/qLaZoZl4qISDLw4KUuvUg7qZFy7TUUjcAJbPAb2liOiuZnMNQkqk
	bJn2yn9uqVuL++m4+phsSaGt01S6z+oayFP1jX0=
X-Google-Smtp-Source: APBJJlG7Q7FWqtJwPf2w02p4KDi4ScY0Twqp9O7nQd4enLvRwZtFUuWaLx+rhE+ir9ySzXN3T0SPTw==
X-Received: by 2002:a17:902:d4d1:b0:1b8:a234:7617 with SMTP id o17-20020a170902d4d100b001b8a2347617mr2799737plg.5.1688656016072;
        Thu, 06 Jul 2023 08:06:56 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.06.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:06:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/28] linux-yocto/5.15: update to v5.15.115
Date: Thu,  6 Jul 2023 05:06:11 -1000
Message-Id: <44262f31928a20a25b4c4a54c3b76a788cc20216.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183961

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    d7af3e5ba454 Linux 5.15.115
    e226893c935f netfilter: ctnetlink: Support offloaded conntrack entry deletion
    395d846c61c5 ipv{4,6}/raw: fix output xfrm lookup wrt protocol
    1bb8a65190d4 binder: fix UAF of alloc->vma in race with munmap()
    1cae0d51368e binder: add lockless binder_alloc_(set|get)_vma()
    dd7aff43d005 Revert "android: binder: stop saving a pointer to the VMA"
    6802c700902c Revert "binder_alloc: add missing mmap_lock calls when using the VMA"
    09411f1b8672 bluetooth: Add cmd validity checks at the start of hci_sock_ioctl()
    0f21b8621756 xdp: xdp_mem_allocator can be NULL in trace_mem_connect().
    b6c4afcbd625 irqchip/mips-gic: Don't touch vl_map if a local interrupt is not routable
    13b290f02094 page_pool: fix inconsistency for page_pool_ring_[un]lock()
    3af319d51474 net: page_pool: use in_softirq() instead
    1c097b9db173 xdp: Allow registering memory model without rxq reference
    623d965c2dee net/mlx5e: Fix SQ wake logic in ptp napi_poll context
    9085886c04d9 irqchip/mips-gic: Use raw spinlock for gic_lock
    4517730b4c1e irqchip/mips-gic: Get rid of the reliance on irq_cpu_online()
    5fd7c1e36b0a binder: fix UAF caused by faulty buffer cleanup
    c88d21c0ae32 bonding: fix send_peer_notif overflow
    7ee611fc85ad Bonding: add arp_missed_max option
    5b925b48bebc net: dsa: mt7530: fix network connectivity with multiple CPU ports
    5a7266feaa6d net: dsa: mt7530: split-off common parts from mt7531_setup
    0753c1ef2419 net: dsa: mt7530: rework mt753[01]_setup
    9902f91cf666 net: dsa: introduce helpers for iterating through ports using dp
    d84b42b72526 net: phy: mscc: enable VSC8501/2 RGMII RX clock
    3dce2f3d8359 platform/x86: ISST: Remove 8 socket limit
    017a634f9f38 platform/x86: ISST: PUNIT device mapping with Sub-NUMA clustering
    ff455f7fbce7 net/mlx5: Devcom, serialize devcom registration
    69966bce28da net/mlx5e: Fix deadlock in tc route query code
    1c4e3cf8944f net/mlx5: devcom only supports 2 ports
    79ea1a12fb9a bpf: fix a memory leak in the LRU and LRU_PERCPU hash maps
    1f06b2a60445 power: supply: bq24190: Call power_supply_changed() after updating input current
    8c6f881dc13b power: supply: core: Refactor power_supply_set_input_current_limit_from_supplier()
    1f9367a890ac power: supply: bq27xxx: After charger plug in/out wait 0.5s for things to stabilize
    75a7e9de60a2 power: supply: bq27xxx: Ensure power_supply_changed() is called on current sign changes
    e4c708a9bbde power: supply: bq27xxx: Move bq27xxx_battery_update() down
    2288fa1ae9b1 power: supply: bq27xxx: expose battery data when CI=1

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit acb7f13dd673b15706f56a6b12ab4637a54e89f8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index fb92ac9527..eee248dba9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "85bc9c4be5d0be6f26d120ee466ea456d4b72adc"
-SRCREV_meta ?= "ba0876ac0b787294ecb502d82c057ac71fd3fe3d"
+SRCREV_machine ?= "649674a0e78bb0454571f2b8cb3cded4e0bb2b6a"
+SRCREV_meta ?= "5f6249ab6fc0f2ac02d745c815adfbf2ad2f92fa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.114"
+LINUX_VERSION ?= "5.15.115"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 1bf912cd17..67c0ae51a4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.114"
+LINUX_VERSION ?= "5.15.115"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "91a679c72403cfb28c8a03991c8ab7fd05bae24e"
-SRCREV_meta ?= "ba0876ac0b787294ecb502d82c057ac71fd3fe3d"
+SRCREV_machine ?= "1475d97fc568cd18aee2ffc9e2327df42ab11dbc"
+SRCREV_meta ?= "5f6249ab6fc0f2ac02d745c815adfbf2ad2f92fa"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 600296a788..766995dbed 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "cc8e6ff343cc0c0ca4e81bd9c8246cf26a1386d2"
-SRCREV_machine:qemuarm64 ?= "144e8b0887515060993c55aa6390953facdc5985"
-SRCREV_machine:qemumips ?= "875ca95dfbdc54834a761eca4ace8ea8464553e0"
-SRCREV_machine:qemuppc ?= "4dd882535e9f7b24974b070a33e132ee783cae12"
-SRCREV_machine:qemuriscv64 ?= "08ba9badec4caaec9caa61bab1651716ba2a0eaf"
-SRCREV_machine:qemuriscv32 ?= "08ba9badec4caaec9caa61bab1651716ba2a0eaf"
-SRCREV_machine:qemux86 ?= "08ba9badec4caaec9caa61bab1651716ba2a0eaf"
-SRCREV_machine:qemux86-64 ?= "08ba9badec4caaec9caa61bab1651716ba2a0eaf"
-SRCREV_machine:qemumips64 ?= "788a1a85fd93d1d5b115fbbc6370fe26fae6dea4"
-SRCREV_machine ?= "08ba9badec4caaec9caa61bab1651716ba2a0eaf"
-SRCREV_meta ?= "ba0876ac0b787294ecb502d82c057ac71fd3fe3d"
+SRCREV_machine:qemuarm ?= "c4eda8f51adfce3ce4a7ec38945138db06d10847"
+SRCREV_machine:qemuarm64 ?= "644dc3e054fde0403f2e211e0d33fdcc65b86eb9"
+SRCREV_machine:qemumips ?= "9b1d37b6e5f0cc9c0397d6665b7457ebccedf20a"
+SRCREV_machine:qemuppc ?= "6fa7818e5625448e3ce9a08a7a9ec2cfadbea50e"
+SRCREV_machine:qemuriscv64 ?= "ad4f0f4baf291e68300bffe88ef0c6e98f5c9882"
+SRCREV_machine:qemuriscv32 ?= "ad4f0f4baf291e68300bffe88ef0c6e98f5c9882"
+SRCREV_machine:qemux86 ?= "ad4f0f4baf291e68300bffe88ef0c6e98f5c9882"
+SRCREV_machine:qemux86-64 ?= "ad4f0f4baf291e68300bffe88ef0c6e98f5c9882"
+SRCREV_machine:qemumips64 ?= "d13909f10dbd2affda5ac77d8d7ac0c0dbd9fe9c"
+SRCREV_machine ?= "ad4f0f4baf291e68300bffe88ef0c6e98f5c9882"
+SRCREV_meta ?= "5f6249ab6fc0f2ac02d745c815adfbf2ad2f92fa"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "0ab06468cbd149aac0d7f216ec00452ff8c74e0b"
+SRCREV_machine:class-devupstream ?= "d7af3e5ba454d007b4939f858739cf1cecdeab46"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.114"
+LINUX_VERSION ?= "5.15.115"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


