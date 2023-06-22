Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B799EB64DC
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 23:22:21 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.25851.1687476134347885855
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 16:22:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=J91edxMw;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-3ff27d3d2f8so1307011cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 16:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687476133; x=1690068133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6u1cgnvnfSUWDgiNxbpDZ4O4896lBT3rXQXgmpkbfjA=;
        b=J91edxMwMxweLo6LsOqeIAqLaIlmcquL6Z6spkwwTCQ7uP34u74vJwRe97yeEuUY7s
         CkD6LstxakWBEaq+oaLl7GiU20jts9/HBgjihzDrlfANknFnSDRcIiP/lrSDoMLqt3as
         Flw4oldHouOmAc8oIxoMgIIUPAQY0bL5OlARQdni7s7ZmmSnUAGh4UitQEj3iw1YhMnN
         cnma4amGRvIBMq0dUV0B1zMM2fjbYk8tS+Aq5HggF8K9wCGgNYW7UJqx4w/VVAOITEa4
         UEkrwKbtJXPCu9khiNlAjKa8qX7eS4YmaOje5q9VVBG4jvCkJIRbpfjzGQB55ZZlxRGd
         VEhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687476133; x=1690068133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6u1cgnvnfSUWDgiNxbpDZ4O4896lBT3rXQXgmpkbfjA=;
        b=X4VX3eJRu47VF5GYh0P6+w8Juw0Hy5Xz6Et2QsEHbQY7HpJU7TQ7JymgYkoyt0darJ
         BSx9yPEU82BrWZURpz75ZQtjTXqH50TIOsGpT3RNRDWVZejABFg17qgyWJTeeJYxIxsw
         Bh91FvEIy3r3XlRk7Tfhz0BWFqXoWw1EXjmwzTKu0BStBDl2QJcJQzDXWjuinLVZQjaO
         R0amiNbjfKXtXlb2O+OqAwEuUQn1nqqCshNQikiDSfLWbYLMdY8sprylcB46g4XlvKZh
         Jmsd+GVzwuzBh2qNsi/QIKSN/L2a/aLTxCzYwFIySw+hFCDQy2tYQrYekdN1N7pEYUWw
         dV8g==
X-Gm-Message-State: AC+VfDwsH8/2PK9s22snOPAIIcRTndbNlUrrvFsPohVCtBKpR9uGh/+E
	9a+1YUyi1ibtKYPztEU8r79de3bQ9WAyXw==
X-Google-Smtp-Source: ACHHUZ6mLRPs/qPvdqBCEOIjgNNAd1OKxqP8dEAFnm1xPhu3B9rqlDX4fKu/rhivELZ1hv2sxMkCFg==
X-Received: by 2002:a05:6214:ccb:b0:621:231d:8a37 with SMTP id 11-20020a0562140ccb00b00621231d8a37mr23640185qvx.15.1687476133360;
        Thu, 22 Jun 2023 16:22:13 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id a17-20020a0ce391000000b0062df95d7ef6sm4291625qvl.115.2023.06.22.16.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 16:22:13 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/3] linux-yocto/5.4: update to v5.4.247
Date: Thu, 22 Jun 2023 19:22:10 -0400
Message-Id: <20230622232211.928913-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622232211.928913-1-bruce.ashfield@gmail.com>
References: <20230622232211.928913-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 23:22:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183303

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    61a2f83e4762 Linux 5.4.247
    4b0199bc8189 Revert "staging: rtl8192e: Replace macro RTL_PCI_DEVICE with PCI_DEVICE"
    85258ae30708 mtd: spinand: macronix: Add support for MX35LFxGE4AD
    8e546674031f btrfs: unset reloc control if transaction commit fails in prepare_to_relocate()
    4223d91ca1b5 btrfs: check return value of btrfs_commit_transaction in relocation
    a35d89d3605b rbd: get snapshot context after exclusive lock is ensured to be held
    52a40eaa55d6 drm/atomic: Don't pollute crtc_state->mode_blob with error pointers
    2cc5d40e4d49 cifs: handle empty list of targets in cifs_reconnect()
    307ffb716282 cifs: get rid of unused parameter in reconn_setup_dfs_targets()
    73ed7996bbec ext4: only check dquot_initialize_needed() when debugging
    7d0a29c74a31 eeprom: at24: also select REGMAP
    0360652bf6ab i2c: sprd: Delete i2c adapter in .remove's error path
    c73f1c2f6816 bonding (gcc13): synchronize bond_{a,t}lb_xmit() types
    ec946898039a usb: usbfs: Use consistent mmap functions
    0147952d158b usb: usbfs: Enforce page requirements for mmap
    090878903dd3 pinctrl: meson-axg: add missing GPIOA_18 gpio group
    c6e842555050 rbd: move RBD_OBJ_FLAG_COPYUP_ENABLED flag setting
    69653f941619 Bluetooth: Fix use-after-free in hci_remove_ltk/hci_remove_irk
    953335a377b6 ceph: fix use-after-free bug for inodes when flushing capsnaps
    2416bac0e7b2 can: j1939: avoid possible use-after-free when j1939_can_rx_register fails
    bf0245bd44c0 can: j1939: change j1939_netdev_lock type to mutex
    9eed68d62e2a can: j1939: j1939_sk_send_loop_abort(): improved error queue handling in J1939 Socket
    2fc62d51d3e4 drm/amdgpu: fix xclk freq on CHIP_STONEY
    e752bb1c039f ALSA: hda/realtek: Add Lenovo P3 Tower platform
    ca599db7a5e0 ALSA: hda/realtek: Add a quirk for HP Slim Desktop S01
    d5ca4799e6d3 Input: psmouse - fix OOB access in Elantech protocol
    282a96e3f88f Input: xpad - delete a Razer DeathAdder mouse VID/PID entry
    a3a99a069eb9 batman-adv: Broken sync while rescheduling delayed work
    df7044fc099b bnxt_en: Query default VLAN before VNIC setup on a VF
    a6ca81297392 lib: cpu_rmap: Fix potential use-after-free in irq_cpu_rmap_release()
    198da74a4e8d net: sched: fix possible refcount leak in tc_chain_tmplt_add()
    8f7cbd6d5e39 net: sched: move rtm_tca_policy declaration to include file
    b8b90f92444b rfs: annotate lockless accesses to RFS sock flow table
    28ac3cf2ac21 rfs: annotate lockless accesses to sk->sk_rxhash
    a4c72805fda4 netfilter: ipset: Add schedule point in call_ad().
    0b705ed9d403 netfilter: conntrack: fix NULL pointer dereference in nf_confirm_cthelper
    c2c6133eebaf Bluetooth: L2CAP: Add missing checks for invalid DCID
    0f841f80390d Bluetooth: Fix l2cap_disconnect_req deadlock
    b0b1b97702a5 net: dsa: lan9303: allow vid != 0 in port_fdb_{add|del} methods
    7e0da73ce546 neighbour: fix unaligned access to pneigh_entry
    314713ff4c9b neighbour: Replace zero-length array with flexible-array member
    e96f52705a63 spi: qup: Request DMA before enabling clocks
    1cc6435cd704 i40e: fix build warnings in i40e_alloc.h
    fc75b8973de4 i40iw: fix build warning in i40iw_manage_apbvt()
    c425e71826e4 block/blk-iocost (gcc13): keep large values in a new enum
    ec97af8e8a36 blk-iocost: avoid 64-bit division in ioc_timer_fn

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index a604e08822..8e0f7ae217 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5cc4655a187a2c5a1a30c6c2295fefab9c8c986d"
-SRCREV_meta ?= "e454f2ec4c69cd5afd7d13df74dd124b856e8765"
+SRCREV_machine ?= "3ec10d880e38eb58af39c33094e455da59afd42b"
+SRCREV_meta ?= "b09511ad6dbb6f38303add48d2da78906bab1380"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.246"
+LINUX_VERSION ?= "5.4.247"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 0938c3d854..6a6787a091 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.246"
+LINUX_VERSION ?= "5.4.247"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ffc4cd8db8b2c495a04a9f28e2da3b4c91f30711"
-SRCREV_machine ?= "9a992a65fe0346b8a7a86ffb2c491dadecada05a"
-SRCREV_meta ?= "e454f2ec4c69cd5afd7d13df74dd124b856e8765"
+SRCREV_machine_qemuarm ?= "5780bc7b75d300e9b90b78c9297ff4717a78a893"
+SRCREV_machine ?= "45eaa635123abc1568c35d4abd0f31cc7c4f75a9"
+SRCREV_meta ?= "b09511ad6dbb6f38303add48d2da78906bab1380"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 28ef51f883..6c9cea6993 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "0682b6432f4fb3931fc5a32938ae2957e97ad3fd"
-SRCREV_machine_qemuarm64 ?= "736062be272094d22416e228b92560302298f9fd"
-SRCREV_machine_qemumips ?= "db77f08d3d5176d1b079195beefd558a32e18b69"
-SRCREV_machine_qemuppc ?= "1dbaf2ab5019f7d114b2c309eb7539828f93f10b"
-SRCREV_machine_qemuriscv64 ?= "31ef22a71bebca6fda5592e2dec249886c29cfbb"
-SRCREV_machine_qemux86 ?= "31ef22a71bebca6fda5592e2dec249886c29cfbb"
-SRCREV_machine_qemux86-64 ?= "31ef22a71bebca6fda5592e2dec249886c29cfbb"
-SRCREV_machine_qemumips64 ?= "19c1ba85d643f819cf3e62ee57d05eec2855e97e"
-SRCREV_machine ?= "31ef22a71bebca6fda5592e2dec249886c29cfbb"
-SRCREV_meta ?= "e454f2ec4c69cd5afd7d13df74dd124b856e8765"
+SRCREV_machine_qemuarm ?= "5f8520357626b4a63278e222fa32b322f9811f34"
+SRCREV_machine_qemuarm64 ?= "5aae64158e118c7c96b6b2db41aa0c565d733c47"
+SRCREV_machine_qemumips ?= "50721182f0802cab035f92538c9fe60fa32e27a6"
+SRCREV_machine_qemuppc ?= "032f6844ab616a7c3c96a27a9f7c19c56e4b37a5"
+SRCREV_machine_qemuriscv64 ?= "2ded7ddaca7d93e0df26c4392b713dd7b016a402"
+SRCREV_machine_qemux86 ?= "2ded7ddaca7d93e0df26c4392b713dd7b016a402"
+SRCREV_machine_qemux86-64 ?= "2ded7ddaca7d93e0df26c4392b713dd7b016a402"
+SRCREV_machine_qemumips64 ?= "77a6c71bda43b4d11767ea3946385f6a5d2d24b6"
+SRCREV_machine ?= "2ded7ddaca7d93e0df26c4392b713dd7b016a402"
+SRCREV_meta ?= "b09511ad6dbb6f38303add48d2da78906bab1380"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.246"
+LINUX_VERSION ?= "5.4.247"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


