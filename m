Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F74EB64DA
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 14:13:27 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.17580.1687961605986229731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 07:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=1aBCLGp7;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b809354a15so20300495ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 07:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687961605; x=1690553605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEblLt5snV5JLz0TGZUwupmgRxgoFTRU1xFLJPY0d88=;
        b=1aBCLGp7TktSEVcZkj+4j+DnE/3/EScxQO9ha1cKIoodV9pkE1R2ENaCMq0mw6eYzf
         hNnN68Aeh4i1mFNsfJYG5+jjAcuM782etQbJ/NXATPTMsRWfHVaICKvMXB0Mt/hhoRgq
         2MoXrZvZtWG5lB/ZpVNQiz30I1HSkaWbZUwOGdqC2J73L8QWXHLEG4rRTA19OXEstGRl
         MlrPLgmbPejmpUUkh7DTsNYwfu1ivO303+y2rT2KXzoFqtrzSjTep/VLWY7KwBTFh8Va
         slg/Y6xSLmtDfQRzDtBKxKUUSpAMCZuhSPK9Vi9TH1wvdRAuHRNcgw/wHLMKgP5o+xRu
         45hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687961605; x=1690553605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEblLt5snV5JLz0TGZUwupmgRxgoFTRU1xFLJPY0d88=;
        b=KwloSmU/Jy1zO4OMdNcGDp6CGknWwBGoXefViC94v9U6ZajGpD/i530ha9RykJnN4v
         YgO8HFNBLsAlBLXA81tby2MZ3gDL1Pjd4SBVRp3DPppdSwpdhCgAcszDtIcDKe+rgFLU
         rqDaWmUKyuwqcec5xioygMeWO8k6sCVTY+62sdNYqBJzeMh+k1p8/xdxTwjFl26H/qIH
         OwzcYdbnbmDrXbWoc30ai1NkIS8B7JxYa/RpjgiLtpsis4yKhEeEGfd2elAM+jjNaeyG
         a2D2y7l0d55iv08Z03xcm3pUwjgQUvOKaxYY5WKS95jklK3jE+OcEtoVstyNvt4uIcfs
         zW2g==
X-Gm-Message-State: AC+VfDy8fWvoSAz6kp7hSQZNAQMWirbY1wV3QCy8RVCUbsrgUkJ+eqe+
	5t6SfqNb6/QnzYBxPy6/qDKvRHaMpn61+I4ztb3sWw==
X-Google-Smtp-Source: ACHHUZ65VHiUaVdXU2/KFqgTrwBe5b/epIK9jKwdFlaFJ9H5QJoveZe68jltgWZm5Xgb3ahLonsnqQ==
X-Received: by 2002:a17:902:da87:b0:1b0:75ef:ce3e with SMTP id j7-20020a170902da8700b001b075efce3emr10558659plx.25.1687961604800;
        Wed, 28 Jun 2023 07:13:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id b19-20020a170902d89300b001b3ce619e2esm7792092plz.179.2023.06.28.07.13.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:13:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/29] linux-yocto/5.10: update to v5.10.184
Date: Wed, 28 Jun 2023 04:12:39 -1000
Message-Id: <1588c4ebc21543a6a0a0d254339505f2c4ceb8c1.1687961326.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687961326.git.steve@sakoman.com>
References: <cover.1687961326.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 14:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183569

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    a1f0beb13d9b Linux 5.10.184
    7f896130eff7 Revert "staging: rtl8192e: Replace macro RTL_PCI_DEVICE with PCI_DEVICE"
    b60e862e133f btrfs: unset reloc control if transaction commit fails in prepare_to_relocate()
    6f371623f315 btrfs: check return value of btrfs_commit_transaction in relocation
    ea0d413094e0 drm/atomic: Don't pollute crtc_state->mode_blob with error pointers
    1659268d1ab4 MIPS: locking/atomic: Fix atomic{_64,}_sub_if_positive
    0e98a97f772f xfs: verify buffer contents when we skip log replay
    58e8cf94de12 tcp: fix tcp_min_tso_segs sysctl
    1b4b3350969e ext4: only check dquot_initialize_needed() when debugging
    fd6cb5171903 Revert "ext4: don't clear SB_RDONLY when remounting r/w until quota is re-enabled"
    cfa91c0573a5 vhost: support PACKED when setting-getting vring_base
    461c88caa889 riscv: fix kprobe __user string arg print fault issue
    c6b905087428 eeprom: at24: also select REGMAP
    10e376a7c387 i2c: sprd: Delete i2c adapter in .remove's error path
    c4aeef56022e ASoC: codecs: wsa881x: do not set can_multi_write flag
    b6f309e9d24e staging: vc04_services: fix gcc-13 build warning
    0d3c75a69344 usb: usbfs: Use consistent mmap functions
    143f40572174 usb: usbfs: Enforce page requirements for mmap
    bcd474d1838e pinctrl: meson-axg: add missing GPIOA_18 gpio group
    1981d37b1d76 rbd: get snapshot context after exclusive lock is ensured to be held
    76ae4a7bc999 rbd: move RBD_OBJ_FLAG_COPYUP_ENABLED flag setting
    841d3b5a8446 tee: amdtee: Add return_origin to 'struct tee_cmd_load_ta'
    a94024991d82 Bluetooth: hci_qca: fix debugfs registration
    2270e32bd199 Bluetooth: Fix use-after-free in hci_remove_ltk/hci_remove_irk
    76b40319a1ea s390/dasd: Use correct lock while counting channel queue length
    e715c86e92fd ceph: fix use-after-free bug for inodes when flushing capsnaps
    67148731582d can: j1939: avoid possible use-after-free when j1939_can_rx_register fails
    cc834f4d9762 can: j1939: change j1939_netdev_lock type to mutex
    026800507640 can: j1939: j1939_sk_send_loop_abort(): improved error queue handling in J1939 Socket
    00380551353b drm/amdgpu: fix xclk freq on CHIP_STONEY
    ef95f987bea8 ALSA: hda/realtek: Add Lenovo P3 Tower platform
    95520b3fba92 ALSA: hda/realtek: Add a quirk for HP Slim Desktop S01
    ca26d00828d3 Input: psmouse - fix OOB access in Elantech protocol
    86efc409f29d Input: xpad - delete a Razer DeathAdder mouse VID/PID entry
    9ece26ff0815 batman-adv: Broken sync while rescheduling delayed work
    3f6dfff5fe41 bnxt_en: Implement .set_port / .unset_port UDP tunnel callbacks
    deead0d8729f bnxt_en: Query default VLAN before VNIC setup on a VF
    84dbd27ad5da bnxt_en: Don't issue AP reset during ethtool's reset operation
    dedd47977ae5 lib: cpu_rmap: Fix potential use-after-free in irq_cpu_rmap_release()
    27b8d6931f3f bpf: Add extra path pointer check to d_path helper
    36d07046c2d9 net: sched: fix possible refcount leak in tc_chain_tmplt_add()
    54acac57fe39 net: sched: move rtm_tca_policy declaration to include file
    dad7417db765 rfs: annotate lockless accesses to RFS sock flow table
    c62ca9d03777 rfs: annotate lockless accesses to sk->sk_rxhash
    86e3981ff1bc ipv6: rpl: Fix Route of Death.
    b4be099c5fb5 netfilter: ipset: Add schedule point in call_ad().
    35c89cfcac05 netfilter: conntrack: fix NULL pointer dereference in nf_confirm_cthelper
    c4ba90ae3578 qed/qede: Fix scheduling while atomic
    0fee54fa330b Bluetooth: L2CAP: Add missing checks for invalid DCID
    00665980128c Bluetooth: Fix l2cap_disconnect_req deadlock
    83cfac5851c2 net/sched: fq_pie: ensure reasonable TCA_FQ_PIE_QUANTUM values
    8ab2bec9e165 net/smc: Avoid to access invalid RMBs' MRs in SMCRv1 ADD LINK CONT
    47ef881f1cbe net: dsa: lan9303: allow vid != 0 in port_fdb_{add|del} methods
    9fcc3c3d26a0 neighbour: fix unaligned access to pneigh_entry
    99883d4a0be2 wifi: mt76: mt7615: fix possible race in mt7615_mac_sta_poll
    2d3e4c5b3e05 afs: Fix setting of mtime when creating a file/dir/symlink
    1ed651e234fd spi: qup: Request DMA before enabling clocks
    e7c61c39d6d1 staging: vchiq_core: drop vchiq_status from vchiq_initialise
    fa303270602d i40e: fix build warning in ice_fltr_add_mac_to_list()
    15ca8d584c1a i40e: fix build warnings in i40e_alloc.h
    f7e208d1c549 i40iw: fix build warning in i40iw_manage_apbvt()
    318e2c18da7c block/blk-iocost (gcc13): keep large values in a new enum
    b6d652f7fbdc blk-iocost: avoid 64-bit division in ioc_timer_fn
    9214a5484e33 f2fs: fix iostat lock protection
    d3b74c288d84 bonding (gcc13): synchronize bond_{a,t}lb_xmit() types
    f122e5517401 remove the sx8 block driver
    9236470a1dd4 sfc (gcc13): synchronize ef100_enqueue_skb()'s return type
    02ce3cf22291 gcc-plugins: Reorganize gimple includes for GCC 13
    4c3ddc06cedb ata: ahci: fix enum constants for gcc-13

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 883aabc9de..af4fede4e9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ca3e1d1a096f6f832182cc922164eb80f9c34b42"
-SRCREV_meta ?= "bdf41f170f57425ff7ec651a88d787d8554b6f86"
+SRCREV_machine ?= "2b0a7b0262d2a775fad7d9ca87de32dc88015b74"
+SRCREV_meta ?= "e269c86d186e2727bdceab40e3a71ec45e0252d1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.183"
+LINUX_VERSION ?= "5.10.184"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 39a42ebd52..f85fea070b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.183"
+LINUX_VERSION ?= "5.10.184"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "b8866faacf5938d92449ff29b1a70f3678814787"
-SRCREV_machine ?= "a2e1f5ef6d74a4c9f5656032e969d1238020071e"
-SRCREV_meta ?= "bdf41f170f57425ff7ec651a88d787d8554b6f86"
+SRCREV_machine:qemuarm ?= "8cec679b919f74822063e03f38e5a1b5df6248bc"
+SRCREV_machine ?= "962077eea8f30dbc431d66ea7a2cee33659854e2"
+SRCREV_meta ?= "e269c86d186e2727bdceab40e3a71ec45e0252d1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 1e99e24284..91ab6ea9b3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4b707a62625e8fe23b5b0c0a09edf6e585bbcac5"
-SRCREV_machine:qemuarm64 ?= "c397c6206489ac3461c6aba4f8d2e7b86f1e87af"
-SRCREV_machine:qemumips ?= "6e80c5bec3588a72fb128353c6ff56585abd869b"
-SRCREV_machine:qemuppc ?= "b7064086e1737cec9f9810a2825c0a6e691e3cba"
-SRCREV_machine:qemuriscv64 ?= "4fad5e082ddeadeb2a55042d151e3a3b519e2f53"
-SRCREV_machine:qemuriscv32 ?= "4fad5e082ddeadeb2a55042d151e3a3b519e2f53"
-SRCREV_machine:qemux86 ?= "4fad5e082ddeadeb2a55042d151e3a3b519e2f53"
-SRCREV_machine:qemux86-64 ?= "4fad5e082ddeadeb2a55042d151e3a3b519e2f53"
-SRCREV_machine:qemumips64 ?= "ef16c1d288827d14ae68defeb1b446aeae8b4141"
-SRCREV_machine ?= "4fad5e082ddeadeb2a55042d151e3a3b519e2f53"
-SRCREV_meta ?= "bdf41f170f57425ff7ec651a88d787d8554b6f86"
+SRCREV_machine:qemuarm ?= "85c2e636ff0c1dc431de60f0113b1f5f89967ca4"
+SRCREV_machine:qemuarm64 ?= "4afca6da69d97af944983918087728d5741df052"
+SRCREV_machine:qemumips ?= "483a2f5f0bf0048b3e864b2a6a9cc1399d27bd1e"
+SRCREV_machine:qemuppc ?= "9f99a56eda87f9de191f14668b488b3b24132c7a"
+SRCREV_machine:qemuriscv64 ?= "e715b8acadb88331f3fc8c820e54e4d27b8c67db"
+SRCREV_machine:qemuriscv32 ?= "e715b8acadb88331f3fc8c820e54e4d27b8c67db"
+SRCREV_machine:qemux86 ?= "e715b8acadb88331f3fc8c820e54e4d27b8c67db"
+SRCREV_machine:qemux86-64 ?= "e715b8acadb88331f3fc8c820e54e4d27b8c67db"
+SRCREV_machine:qemumips64 ?= "6bddecdb7271f2cbede46ade8701ce9d0c2bd0f2"
+SRCREV_machine ?= "e715b8acadb88331f3fc8c820e54e4d27b8c67db"
+SRCREV_meta ?= "e269c86d186e2727bdceab40e3a71ec45e0252d1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.183"
+LINUX_VERSION ?= "5.10.184"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


