Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD7FC7EE23
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 16:47:25 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.53940.1685378838665975402
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 09:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=NgVHJ7j/;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-75b0b5c9eb8so189342485a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 09:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685378838; x=1687970838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jf1fcpDGYMlPecP359596sHkXjRahVMrZd0T3SYLa/s=;
        b=NgVHJ7j/z1DVMUvGPcddMkjlWK8pIeWt7lTolaLNyZUaIdgLcEZqgIrr/NzZ0CT0Yg
         PtsfHU+hx1h5VeVHKi3QjExV8CkH03p36DbuXQw5P2n4+reGC7HO+0rP12ysl30p55/w
         5mEHKUKV7aiAk3S3DoavTT7Qgpbbjv/4xlH4X5UPi4JCCmG/E50ykT7Kr/6U4FSaUvt5
         AXc7ceIwW16wweObxzgMAmDTqRFwbaY5OdpOH+C6iGy6sYJMOoDq2RgSvdZmUUBlqoto
         xN2QNpSQfZEZKJtyc1kSXeyv/oQ2DH4vL+Wy0J7njoLS8E2QFCMmnJ5knr6AJr9BY4yO
         qS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685378838; x=1687970838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jf1fcpDGYMlPecP359596sHkXjRahVMrZd0T3SYLa/s=;
        b=f+LRLu6wTLPM2HVZJRET+C8G6DBu+QvQIJqVr4/5Fa/d6r+tG54ZOWitj/mLLvArvF
         CoxmBjqSHTGZynf+FllL16Apon6h0aq8I4zPvNzglORmwpTFZN1K0+oJ3dcAC7uXPtkU
         6HxnNbBXA9udUhMRIlDpyY5IaedhESRFA9w+ku+SKcCUf1d/SUNdqwldHGNDgPlX8yd2
         P5D11gq9j0JIjs0weFOeDkySF+xmJAG5A62RHGQw0rgU/VosfHsqjW3a+SRGPBnWXJaZ
         SZiq9wrlWAs70Te86KhbXDpj2FrYBFAA4B1Q3UHDO4qzsXjBOfA92BqXZL97t2rHStMJ
         1YgQ==
X-Gm-Message-State: AC+VfDzuePGEVL1T2ItYptubBFaSmxgxiVpxZnOZJzLAP7dQ9eaQJ6Ii
	+jdQ/CnS3eq/5R2QHOyMWdVZbM8QZ62a1g==
X-Google-Smtp-Source: ACHHUZ7uYpTMqmnbdABCWcEVwT1sKsDMv+TzbuKDFH5iPVQudhfTlLG8mS3OWQbdGx/0QrNO/3/RkA==
X-Received: by 2002:a37:ea16:0:b0:75b:23a0:e7cb with SMTP id t22-20020a37ea16000000b0075b23a0e7cbmr7468682qkj.44.1685378837506;
        Mon, 29 May 2023 09:47:17 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id o15-20020ae9f50f000000b0074a6c29df4dsm3461394qkg.119.2023.05.29.09.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 09:47:17 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [dunfell 1/5] linux-yocto/5.4: update to v5.4.238
Date: Mon, 29 May 2023 12:47:10 -0400
Message-Id: <20230529164715.3511175-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 16:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181876

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    6849d8c4a61a Linux 5.4.238
    eb7716a054a6 HID: uhid: Over-ride the default maximum data buffer value with our own
    b687ac70e66a HID: core: Provide new max_buffer_size attribute to over-ride the default
    144019e81396 PCI: Unify delay handling for reset and resume
    d2130f37a4a0 s390/ipl: add missing intersection check to ipl_report handling
    3f5a833dca66 serial: 8250_em: Fix UART port type
    c5afb97d1b51 drm/i915: Don't use stolen memory for ring buffers with LLC
    8d26a4fecce5 x86/mm: Fix use of uninitialized buffer in sme_enable()
    a976ff743eb1 fbdev: stifb: Provide valid pixelclock and add fb_check_var() checks
    ac58b88ccbbb ftrace: Fix invalid address access in lookup_rec() when index is 0
    65e4c9a6d0c9 KVM: nVMX: add missing consistency checks for CR0 and CR4
    6fe55dce9dd6 tracing: Make tracepoint lockdep check actually test something
    780f69a2685b tracing: Check field value in hist_field_name()
    f1e3a20c6019 interconnect: fix mem leak when freeing nodes
    325608ab60fa tty: serial: fsl_lpuart: skip waiting for transmission complete when UARTCTRL_SBK is asserted
    c16cbd8233d6 ext4: fix possible double unlock when moving a directory
    6a1bd14d5e34 sh: intc: Avoid spurious sizeof-pointer-div warning
    bbf5eada4334 drm/amdkfd: Fix an illegal memory access
    2c96c52aeaa6 ext4: fix task hung in ext4_xattr_delete_inode
    20ba6f8a8073 ext4: fail ext4_iget if special inode unallocated
    ab519e29891d jffs2: correct logic when creating a hole in jffs2_write_begin
    00bfc67c65a1 mmc: atmel-mci: fix race between stop command and start of next command
    75f6faae2de6 media: m5mols: fix off-by-one loop termination error
    9eb394919c97 hwmon: (ina3221) return prober error code
    26c176ce9028 hwmon: (xgene) Fix use after free bug in xgene_hwmon_remove due to race condition
    13efd488d398 hwmon: (adt7475) Fix masking of hysteresis registers
    0d3095e958f0 hwmon: (adt7475) Display smoothing attributes in correct order
    674fce59d61d ethernet: sun: add check for the mdesc_grab()
    71da5991b643 net/iucv: Fix size of interrupt data
    e0d07a3203c3 net: usb: smsc75xx: Move packet length check to prevent kernel panic in skb_pull
    5c06bd3de134 ipv4: Fix incorrect table ID in IOCTL path
    c4fcfbf80c3c block: sunvdc: add check for mdesc_grab() returning NULL
    04c394208831 nvmet: avoid potential UAF in nvmet_req_complete()
    9fabdd79051a net: usb: smsc75xx: Limit packet length to skb->len
    b0c202a8dc63 nfc: st-nci: Fix use after free bug in ndlc_remove due to race condition
    668de67d4110 net: phy: smsc: bail out in lan87xx_read_status if genphy_read_status fails
    5aaab217c8f5 net: tunnels: annotate lockless accesses to dev->needed_headroom
    cba20ade78ef qed/qed_dev: guard against a possible division by zero
    6e18f66b704b i40e: Fix kernel crash during reboot when adapter is in recovery mode
    f0216046aeb8 ipvlan: Make skb->skb_iif track skb->dev for l3s mode
    0f9c1f26d434 nfc: pn533: initialize struct pn533_out_arg properly
    442aa78ed701 tcp: tcp_make_synack() can be called from process context
    88c3d3bb6469 scsi: core: Fix a procfs host directory removal regression
    4b4f5e34f08b scsi: core: Fix a comment in function scsi_host_dev_release()
    0d59732f2a5b netfilter: nft_redir: correct value of inet type `.maxattrs`
    90279211e96b ALSA: hda: Match only Intel devices with CONTROLLER_IN_GPU()
    0b7057c52377 ALSA: hda: Add Intel DG2 PCI ID and HDMI codec vid
    5bb9fcaadb8c ALSA: hda: Add Alderlake-S PCI ID and HDMI codec vid
    9efbdc743ded ALSA: hda - controller is in GPU on the DG1
    fc52e51c2c30 ALSA: hda - add Intel DG1 PCI and HDMI ids
    090305c36185 scsi: mpt3sas: Fix NULL pointer access in mpt3sas_transport_port_add()
    b8849e31a056 docs: Correct missing "d_" prefix for dentry_operations member d_weak_revalidate
    9e45e4571576 clk: HI655X: select REGMAP instead of depending on it
    dac08e46f0ad drm/meson: fix 1px pink line on GXM when scaling video overlay
    d7e48aa17a81 cifs: Move the in_send statistic to __smb_send_rqst()
    06c208002d0d drm/panfrost: Don't sync rpm suspension after mmu flushing
    c9900d1d86f0 xfrm: Allow transport-mode states with AF_UNSPEC selector
    4008fb9ad474 ext4: fix cgroup writeback accounting with fs-layer encryption

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index e0967223b9..46a1d77778 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f064f6017b7ce09ade0f365e1b7d776dc9e2e168"
-SRCREV_meta ?= "c7e2e528893abbebd14447510d38ded1ef98dcd2"
+SRCREV_machine ?= "bdf5848b4aedd93895b490c65b52edc488c383b2"
+SRCREV_meta ?= "8a7a83b45c543cd7b05fce9ff09abe21ea92f193"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.237"
+LINUX_VERSION ?= "5.4.238"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 6cdf00763b..64c81e7f4f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.237"
+LINUX_VERSION ?= "5.4.238"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "00c3a33c0f772ff1fa8902e8fe8856131c27a9b5"
-SRCREV_machine ?= "0693cbc007cf6a7b335edb5f78542d77b048d5dd"
-SRCREV_meta ?= "c7e2e528893abbebd14447510d38ded1ef98dcd2"
+SRCREV_machine_qemuarm ?= "63e8209e8066ca7d6b3075af199875d77c4596d0"
+SRCREV_machine ?= "2a1e69d2aa0fabdecb015972c5824590a70b8225"
+SRCREV_meta ?= "8a7a83b45c543cd7b05fce9ff09abe21ea92f193"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index e95a044099..42fc71f7b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "981be716d817e38d2d67269aab3caaa095bd2bdd"
-SRCREV_machine_qemuarm64 ?= "32083245f7eb993b85a33a8d30bd9f41128b6147"
-SRCREV_machine_qemumips ?= "4d002b5ac3b434b21ae58ac15cd73be3ae5ef5a8"
-SRCREV_machine_qemuppc ?= "82b4b51143a6beeb49efa548494bdb5c01f336b2"
-SRCREV_machine_qemuriscv64 ?= "936721bc390034d774b28393bf61808de8899718"
-SRCREV_machine_qemux86 ?= "936721bc390034d774b28393bf61808de8899718"
-SRCREV_machine_qemux86-64 ?= "936721bc390034d774b28393bf61808de8899718"
-SRCREV_machine_qemumips64 ?= "d662d749c441de5a09bfd8870cd10e41b1e27b6b"
-SRCREV_machine ?= "936721bc390034d774b28393bf61808de8899718"
-SRCREV_meta ?= "c7e2e528893abbebd14447510d38ded1ef98dcd2"
+SRCREV_machine_qemuarm ?= "db8e7ac090eb96b687edbb988c3fb7d9a9d83973"
+SRCREV_machine_qemuarm64 ?= "01fe45561dc40cc40b057ee40d722388174733ed"
+SRCREV_machine_qemumips ?= "9bf85e111f1a77b41b39fa1b45a8439fa66e8c4d"
+SRCREV_machine_qemuppc ?= "5743a4eef97e79e05c6780714ffc559fbedea0bb"
+SRCREV_machine_qemuriscv64 ?= "f2e879840d91250606ae3c2fd177c310df11fde0"
+SRCREV_machine_qemux86 ?= "f2e879840d91250606ae3c2fd177c310df11fde0"
+SRCREV_machine_qemux86-64 ?= "f2e879840d91250606ae3c2fd177c310df11fde0"
+SRCREV_machine_qemumips64 ?= "41ecd49609ac6164d8022065e5028984fa5c84ce"
+SRCREV_machine ?= "f2e879840d91250606ae3c2fd177c310df11fde0"
+SRCREV_meta ?= "8a7a83b45c543cd7b05fce9ff09abe21ea92f193"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.237"
+LINUX_VERSION ?= "5.4.238"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


