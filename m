Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52792C77B6E
	for <webhook@archiver.kernel.org>; Sun,  2 Apr 2023 16:42:49 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.48710.1680453762952523408
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Apr 2023 09:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=1PBfIxfS;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id qe8-20020a17090b4f8800b0023f07253a2cso28165573pjb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 09:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680453762; x=1683045762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqBzzN+fevT8nl1Sq50haOYgOx5UWX57Je7mXLfQAP4=;
        b=1PBfIxfS3Gk1c3gnogYU8FXj+J2MqoPat5LyGHIsgbBMeI4sjAJaT89Of5bbgFGHJ/
         gapq/JD/YaZmv5k0d7YWlX3QBXjkfF6QugGEfAbvArtKbW+4NnMAw15Gl9RvhslgXqTP
         ZlTOJnkmOCLQxYHnMllbKNE5LwBiQMMBHVKSlbmisacv9/Q6SrjZeCpqKfsLE8zE3TaG
         oDfscvg/omBxeaNPQuJELublYFWuDgJ+yY3vcmy+5xzU7ZgLNjNf/bTLiyT+Csshjk+z
         TRVN0fg1znaeqx4JeIcuc37WY36o8KODRWUqeEByfCDPsxwRfRqnd5xM78Ernn/cwcC1
         YGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680453762; x=1683045762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NqBzzN+fevT8nl1Sq50haOYgOx5UWX57Je7mXLfQAP4=;
        b=56LK1ofGlbSf5r93gJtVIyxCZaL53rHHV082Q8il0+qVAV50EDoACZypxqGOWS90x2
         tx9h0ATVLHdLDUbXtskgrfoHAsXS3dhG2ISR8OkF/SeZ0I6NZOQslXg9CeDh6da3LfnB
         oydOr7KTdBMPRwOxS0oJ3wYRB8wa9iJq1C1fHB8of+dZMveE9glwNCj4oUsl+gdjwtA3
         OGlyEPH4jieKcaM/EqvX+NVBaWdBRNuIkboS0bAC950mZPnRIDEsuRrPE72iuMOsLUXJ
         afML+yeoB7h4vFBuninQaSZMjezmTMIFyTBtYrgCvGtaesQc+uKz6WMgbxQ8VbmBUZqO
         Mmqw==
X-Gm-Message-State: AAQBX9c1Wfrwd6h+xQEOZ+9oj1fpycTgOIJ9MJBFBk9l8gD5jnXDrpsE
	KEgJl8IH0BXyHtyIj/QZXoPXwILuDUZ1vSCG+kU=
X-Google-Smtp-Source: AKy350Y8ux4OrTh3ajIiLUBt2zs8rcUStPqhsVOyM0t2Kj7BVgiDqgGAyNMAqOY0x2g24v2QFALlLQ==
X-Received: by 2002:a17:902:ea08:b0:1a1:9666:7a30 with SMTP id s8-20020a170902ea0800b001a196667a30mr39516732plg.54.1680453761950;
        Sun, 02 Apr 2023 09:42:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ja7-20020a170902efc700b001a1ddd224desm5042079plb.89.2023.04.02.09.42.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 09:42:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/21] linux-yocto/5.10: update to v5.10.170
Date: Sun,  2 Apr 2023 06:42:04 -1000
Message-Id: <5ea52e8cbb054de807caee8f7d82840af181f8a5.1680453201.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680453201.git.steve@sakoman.com>
References: <cover.1680453201.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 02 Apr 2023 16:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179590

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    22d269bb30db Linux 5.10.170
    12e3119a8762 bpf: add missing header file include
    c44e96d6c31a Revert "net/sched: taprio: make qdisc_leaf() see the per-netdev-queue pfifo child qdiscs"
    1ba10d3640e9 ext4: Fix function prototype mismatch for ext4_feat_ktype
    01e652f03a86 audit: update the mailing list in MAINTAINERS
    e1dc3f102a81 wifi: mwifiex: Add missing compatible string for SD8787
    4311ad1e7654 nbd: fix possible overflow on 'first_minor' in nbd_dev_add()
    2e0c3e43ebb9 nbd: fix possible overflow for 'first_minor' in nbd_dev_add()
    fd8107206a67 nbd: fix max value for 'first_minor'
    f3f6b33b77ba Revert "Revert "block: nbd: add sanity check for first_minor""
    3b6ce54cfa2c uaccess: Add speculation barrier to copy_from_user()
    267f62b7f3ee mac80211: mesh: embedd mesh_paths and mpp_paths into ieee80211_if_mesh
    3d743415c6fb drm/i915/gvt: fix double free bug in split_2MB_gtt_entry
    b50f6fc9d79f powerpc: dts: t208x: Disable 10G on MAC1 and MAC2
    6a3fb887da7d can: kvaser_usb: hydra: help gcc-13 to figure out cmd_len
    1b0cafaae888 KVM: VMX: Execute IBPB on emulated VM-exit when guest has IBRS
    c41d856b7064 KVM: SVM: Skip WRMSR fastpath on VM-Exit if next RIP isn't valid
    a7ef904b68f0 KVM: x86: Fail emulation during EMULTYPE_SKIP on any exception
    119e75d8fe4d random: always mix cycle counter in add_latent_entropy()
    2da1f9508579 clk: mxl: syscon_node_to_regmap() returns error pointers
    1423d88753ed powerpc: dts: t208x: Mark MAC1 and MAC2 as 10G
    caa47d91738f clk: mxl: Fix a clk entry by adding relevant flags
    9dcf2ca5d301 clk: mxl: Add option to override gate clks
    3789e905f488 clk: mxl: Remove redundant spinlocks
    072eb5fbd69c clk: mxl: Switch from direct readl/writel based IO to regmap based IO
    051d73eb9ab4 wifi: rtl8xxxu: gen2: Turn on the rate control
    eb9236d74c8c drm/etnaviv: don't truncate physical page address
    2ae73796985b Linux 5.10.169
    e95381034519 nvmem: core: fix return value
    c00867afe4ef net: sched: sch: Fix off by one in htb_activate_prios()
    31167df7c21f ASoC: SOF: Intel: hda-dai: fix possible stream_tag leak
    6af2872cc625 alarmtimer: Prevent starvation by small intervals and SIG_IGN
    6416c2108ba5 kvm: initialize all of the kvm_debugregs structure before sending it to userspace
    4fe9950815e1 net/sched: tcindex: search key must be 16 bits
    b452e20b95d7 i40e: Add checking for null for nlmsg_find_attr()
    5dfa51dbfc12 net/sched: act_ctinfo: use percpu stats
    015ea70d72c3 flow_offload: fill flags to action structure
    1d76a8444874 drm/i915/gen11: Wa_1408615072/Wa_1407596294 should be on GT list
    210e6011806a drm/i915/gen11: Moving WAs to icl_gt_workarounds_init()
    0ee5ed0126a2 nilfs2: fix underflow in second superblock position calculations
    7546fb3554df ipv6: Fix tcp socket connection with DSCP.
    5337bb508ba2 ipv6: Fix datagram socket connection with DSCP.
    1a4a5fd652dd ixgbe: add double of VLAN header when computing the max MTU
    7ff0fdba8229 net: mpls: fix stale pointer if allocation fails during device rename
    2dd914105a1e net: stmmac: Restrict warning on disabling DMA store and fwd mode
    7eb8ebb5e83f bnxt_en: Fix mqprio and XDP ring checking logic
    cc7ca4871a92 net: stmmac: fix order of dwmac5 FlexPPS parametrization sequence
    c0f65ee0a332 net: openvswitch: fix possible memory leak in ovs_meter_cmd_set()
    525bdcb0838d net/usb: kalmia: Don't pass act_len in usb_bulk_msg error path
    9d68bfa2205d dccp/tcp: Avoid negative sk_forward_alloc by ipv6_pinfo.pktoptions.
    eb8e9d8572d1 net/sched: tcindex: update imperfect hash filters respecting rcu
    747a17e25aec sctp: sctp_sock_filter(): avoid list_entry() on possibly empty list
    a5c51e0c3202 net: bgmac: fix BCM5358 support by setting correct flags
    23974088fd6a i40e: add double of VLAN header when computing the max MTU
    152a5f32ac9e ixgbe: allow to increase MTU to 3K with XDP enabled
    3a63392c19e9 revert "squashfs: harden sanity check in squashfs_read_xattr_id_table"
    e2bf52ff159d net: Fix unwanted sign extension in netdev_stats_to_stats64()
    1933be146c96 Revert "mm: Always release pages to the buddy allocator in memblock_free_late()."
    9662320238b9 hugetlb: check for undefined shift on 32 bit architectures
    ec9c7aa08819 sched/psi: Fix use-after-free in ep_remove_wait_queue()
    7ed5c147220f ALSA: hda/realtek - fixed wrong gpio assigned
    59d5c80ce538 ALSA: hda/conexant: add a new hda codec SN6180
    0b3edcb24bd8 mmc: mmc_spi: fix error handling in mmc_spi_probe()
    30716d9f0fa1 mmc: sdio: fix possible resource leaks in some error paths
    73ad25c50d3c mmc: jz4740: Work around bug on JZ4760(B)
    eaba3f9b672c netfilter: nft_tproxy: restrict to prerouting hook
    6618b0dcf265 ovl: remove privs in ovl_fallocate()
    f6f94837d92f ovl: remove privs in ovl_copyfile()
    645df4047bd6 s390/signal: fix endless loop in do_signal
    c261f798f7ba aio: fix mremap after fork null-deref
    2dcb474af1d5 nvmem: core: fix registration vs use race
    23676ecd2eb3 nvmem: core: fix cleanup after dev_set_name()
    89991ededcb5 nvmem: core: remove nvmem_config wp_gpio
    a19a0f67dbb8 nvmem: core: add error handling for dev_set_name
    25f65c83f5f7 platform/x86: touchscreen_dmi: Add Chuwi Vi8 (CWI501) DMI match
    ecf5b49df38f nvme-fc: fix a missing queue put in nvmet_fc_ls_create_association
    55dbd6f4ea95 s390/decompressor: specify __decompress() buf len to avoid overflow
    90fcf55d83b2 net: sched: sch: Bounds check priority
    614a58e00d7b net: stmmac: do not stop RX_CLK in Rx LPI state for qcs404 SoC
    aa84a8cc1b53 net/rose: Fix to not accept on connected socket
    37bb61763d9f tools/virtio: fix the vringh test for virtio ring changes
    3ec44268e29c ASoC: cs42l56: fix DT probe
    7fc4e7191eae ALSA: hda: Do not unset preset when cleaning up codec
    490fcbc7b5f6 selftests/bpf: Verify copy_register_state() preserves parent/live fields
    7d3a5ec57975 ASoC: Intel: sof_rt5682: always set dpcm_capture for amplifiers

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 58fd484ecc..b79503a713 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "62d5b741cdf7394d82331270ca386c713c473c7b"
-SRCREV_meta ?= "73c714d1d9614f95140e23c772716b9bc9842aaf"
+SRCREV_machine ?= "96696fd86a146b4caf2ace4aa35a05173cf4e4f0"
+SRCREV_meta ?= "5ff3d3c9cac6c7151a8667ce0b829815b4a10fe9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.168"
+LINUX_VERSION ?= "5.10.170"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 52b42651c5..3340ea9490 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.168"
+LINUX_VERSION ?= "5.10.170"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "4bdfe7cb960b9f9639ceaf8b38a4a02069ce179a"
-SRCREV_machine ?= "67a4594e5db4befb4319a75c636d9ace72d9ffc2"
-SRCREV_meta ?= "73c714d1d9614f95140e23c772716b9bc9842aaf"
+SRCREV_machine:qemuarm ?= "0458c56e80d109be74ac798badf708238d23c0be"
+SRCREV_machine ?= "b67f14a9f17371acee4d322bd97936ac4724677a"
+SRCREV_meta ?= "5ff3d3c9cac6c7151a8667ce0b829815b4a10fe9"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 6db6c33af0..ad37ef0f90 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "27f3c2b7708c689f300da07d7c0ff14d0b478794"
-SRCREV_machine:qemuarm64 ?= "15efbe00f3913b4a83e563c322d69f67bee533f5"
-SRCREV_machine:qemumips ?= "e0cf57b8168c2c8db7606691ccfcc3b215f9352a"
-SRCREV_machine:qemuppc ?= "46db782b8dc68f0151279b1dc0e6ac3241ea90a8"
-SRCREV_machine:qemuriscv64 ?= "5db7446df39448a190fb0e1aa5bd5d2592594fa0"
-SRCREV_machine:qemuriscv32 ?= "5db7446df39448a190fb0e1aa5bd5d2592594fa0"
-SRCREV_machine:qemux86 ?= "5db7446df39448a190fb0e1aa5bd5d2592594fa0"
-SRCREV_machine:qemux86-64 ?= "5db7446df39448a190fb0e1aa5bd5d2592594fa0"
-SRCREV_machine:qemumips64 ?= "eecdfa122352c7955d602935e0a6940074438f71"
-SRCREV_machine ?= "5db7446df39448a190fb0e1aa5bd5d2592594fa0"
-SRCREV_meta ?= "73c714d1d9614f95140e23c772716b9bc9842aaf"
+SRCREV_machine:qemuarm ?= "5f89e91aaac8b66f595bc859572912d034e2c0a4"
+SRCREV_machine:qemuarm64 ?= "3c27ba92e77d51651dcaeffa871c6d75e1838b28"
+SRCREV_machine:qemumips ?= "230e54a73d22fa82e09c120d2d7f01f5472250fe"
+SRCREV_machine:qemuppc ?= "b9836fd66f2036814cb73aca7fa33f12616c3d53"
+SRCREV_machine:qemuriscv64 ?= "2865a8c85a10428c17144aa5d21c5c5f73f991e8"
+SRCREV_machine:qemuriscv32 ?= "2865a8c85a10428c17144aa5d21c5c5f73f991e8"
+SRCREV_machine:qemux86 ?= "2865a8c85a10428c17144aa5d21c5c5f73f991e8"
+SRCREV_machine:qemux86-64 ?= "2865a8c85a10428c17144aa5d21c5c5f73f991e8"
+SRCREV_machine:qemumips64 ?= "2fc6dfde53ddca6e3c59c15cdad8c1f59d9bee9d"
+SRCREV_machine ?= "2865a8c85a10428c17144aa5d21c5c5f73f991e8"
+SRCREV_meta ?= "5ff3d3c9cac6c7151a8667ce0b829815b4a10fe9"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.168"
+LINUX_VERSION ?= "5.10.170"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


