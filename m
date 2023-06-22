Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D846C0015E
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 23:15:11 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.25708.1687475701592842312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 16:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=dLjfNIoZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-3ff2615a6bcso1119731cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 16:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687475700; x=1690067700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmbFdid8ocDtf60J8yetfvtrqwWnM63ZxK+nEpmcNso=;
        b=dLjfNIoZqDLWJZs0tnLa7cex6m6p4J0e4b8xCU8In7Fbqc/OWl2VVw2GambFnTWpc7
         OLtvsxL4HzCNj5xdKDX3PgiAg9DQJ+zJgzg3D8LCqBlTnmMGsisqUEoY81DTRJDvPjRv
         xGabzv0rX1MIzjq+l74NJgZ53olCC0RSKmL/Cw+eWaaay+yv+qqchqKf21ezKVMSZmyw
         GfM3xnOWH1mOA4tbJ4D20xdS+b7GKj8arL432WTE9xb8EkGmSS2M58qwjoeqOeXpbV/S
         cGOc57XoFm2m/aA7mxLcCTf7tqAQEORkkAqeooO6WBidZpI4m5RXQRwSTACqFk6EtyFi
         aV+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687475700; x=1690067700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmbFdid8ocDtf60J8yetfvtrqwWnM63ZxK+nEpmcNso=;
        b=johw1CVAlnYYy7Fly02PawGOrNNoh2Le5lxZ4wc8caaenns/eD+mnxOD1OQKJuvWV/
         wPq/d8DL/Bqssw1KmK2n35P4oLTXZFWziC0D96inDsCv+5YDiAurOA0eD86cszp6lcdX
         EEiTBi5lb05czPiU7bItqIXVbUKlcPhh3joNBjYyQa/OwyTIPb3rRI5HFLb2aN+JfqaW
         Qg4CVAxPdVEcDt4GKtNokmYbWpIuKBO0uIeXLwzCcmJ1Cnkbb520kOBgDwpLM3dsVIah
         /FBwZVKUuDmVjTHYSIhPPWirjYLBbgx+AUx4uTFJsKOYw/dz1CBXoOTbQ+D+IryRJaoU
         66wA==
X-Gm-Message-State: AC+VfDxqlW2U9Xkatlrk2Vs53JJtvFNwo9Wq5NxpXjoSwJUVW0+6V/ln
	9NT1rF4eyUNpwijg36VcDRLkKUBq61N8aw==
X-Google-Smtp-Source: ACHHUZ4zrC9gM23mw0HdUgOxNWpkhYjXGua2qjEUWTbqItVy1CAIs+LKQhxBBVLMAHnn9rkG/K0d3g==
X-Received: by 2002:ac8:5acf:0:b0:3f7:f9c6:d33a with SMTP id d15-20020ac85acf000000b003f7f9c6d33amr24417701qtd.51.1687475700556;
        Thu, 22 Jun 2023 16:15:00 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id e6-20020ac84906000000b003f9bccc3182sm4164961qtq.32.2023.06.22.16.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 16:14:59 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 2/5] linux-yocto/5.15: update to v5.15.115
Date: Thu, 22 Jun 2023 19:14:54 -0400
Message-Id: <20230622231457.928082-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622231457.928082-1-bruce.ashfield@gmail.com>
References: <20230622231457.928082-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 23:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183293

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
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index e59146cd25..f3c3472ad8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "85bc9c4be5d0be6f26d120ee466ea456d4b72adc"
-SRCREV_meta ?= "ba0876ac0b787294ecb502d82c057ac71fd3fe3d"
+SRCREV_machine ?= "649674a0e78bb0454571f2b8cb3cded4e0bb2b6a"
+SRCREV_meta ?= "5f6249ab6fc0f2ac02d745c815adfbf2ad2f92fa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "5.15.114"
+LINUX_VERSION ?= "5.15.115"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index d8b0ea9a6b..0179cf5d1e 100644
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
index 910a9ad2cc..7ba084c752 100644
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
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.114"
+LINUX_VERSION ?= "5.15.115"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


