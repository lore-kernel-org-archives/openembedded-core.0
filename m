Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CE5E728E5
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:12:16 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.27867.1696018327598835909
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZIZANgAE;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-77428510fe7so49345785a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696018326; x=1696623126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGufao0tCrt2lkgYhaVrx0aAJKUKD/u4c7OgXRiZ18c=;
        b=ZIZANgAExn55udxnu2rDYj32qQW512c5Wudb+NNEGiyQR0hJTP0R+gqINPW4lWiQYq
         3XmrTcowLmEDPhBxcpTB/a2io7+JqYcoP8CHvawZyCcTjeVff/kNFEo2VnDPgC+xQZag
         GOFY5Ievh0WFK8SECz98j/xsIvjR96vt65QuWiDsLNsuF6Zu90fFQIKtSL/v2ujgwlcD
         hKmaCYp0j02ZraGE9bTIbNZRz6YLMUCRdFea8uhM7nlW1v8av/39vnuOga2lZp/R4+28
         niGmptCakoZo1inVfIoMX+GhglwkjSmzOLApXeGYzBaztyingNWHt6Ru+vpCf30yZYrA
         4VDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696018326; x=1696623126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGufao0tCrt2lkgYhaVrx0aAJKUKD/u4c7OgXRiZ18c=;
        b=namdQvUNnm98k0kuJZKpGTKa8TvL9vtTbHRvEV7YnC3WnJ34af6cJemM5y+GmO7aUt
         TynqHM4/bSe5ZG13tbaTokUp5H+UfDaVE47pxBBi9c5+KyR+7bgMCKV3UfRA+ZqsFgWK
         sbfd8xoXtgHj//gS5p0hCokh7m/eUjIzws5jMxZdTFa/NQKL5dSsi+9LZqg+szV19HPZ
         H8UwbXgpfFTHOn5X8vtGTVLsXcvhQ1mVLV8I1VUxuJukRlf7sKZz0TED2Q7GNI02metw
         4Nx8lgc+Jrl84uXlHwuSHfBH/oRlq15IZkO05OPQBMQ7pzIy2wJ0kn917Oou2cDsegZE
         14VQ==
X-Gm-Message-State: AOJu0YxsMdeYBIRyxOOBKslbSKZn8k1KobGunzVviWU0bDZx5sxVHn7k
	zLJh9rPDwRmxlRmiBGp3fN03ZoKUFnts7A==
X-Google-Smtp-Source: AGHT+IHrFDPksmlU0Z+Ef0+fVxcaECKAVwBFyXsG2PJKvPZ09kJKt0WTqnfcig5vOT0GN9SK3WHYtw==
X-Received: by 2002:a05:620a:2ae3:b0:76c:a952:c70f with SMTP id bn35-20020a05620a2ae300b0076ca952c70fmr5050977qkb.35.1696018326607;
        Fri, 29 Sep 2023 13:12:06 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id r25-20020a05620a03d900b00767e2668536sm7202583qkm.17.2023.09.29.13.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:12:05 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] linux-yocto/5.15: update to v5.15.126
Date: Fri, 29 Sep 2023 16:11:59 -0400
Message-Id: <20230929201203.3516768-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929201203.3516768-1-bruce.ashfield@gmail.com>
References: <20230929201203.3516768-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 20:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188431

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    24c4de4069cb Linux 5.15.126
    aeb4db8ab7f1 PM: sleep: wakeirq: fix wake irq arming
    b5d3a4251bd2 PM / wakeirq: support enabling wake-up irq after runtime_suspend called
    a36b522767f3 soundwire: fix enumeration completion
    7996facaf0ee soundwire: bus: pm_runtime_request_resume on peripheral attachment
    c91c07ae0849 selftests/rseq: Play nice with binaries statically linked against glibc 2.35+
    1cdb50faf7f7 selftests/rseq: check if libc rseq support is registered
    0f1f471b91f4 drm/imx/ipuv3: Fix front porch adjustment upon hactive aligning
    5058c1444040 powerpc/mm/altmap: Fix altmap boundary check
    eb7a5e4d14c8 mtd: rawnand: fsl_upm: Fix an off-by one test in fun_exec_op()
    70643e98cbc3 mtd: rawnand: rockchip: Align hwecc vs. raw page helper layouts
    1796b492f8cc mtd: rawnand: rockchip: fix oobfree offset and description
    f6807b62fb0e mtd: rawnand: omap_elm: Fix incorrect type in assignment
    596be6716bc5 ext2: Drop fragment support
    0ccfe21949bc fs: Protect reconfiguration of sb read-write from racing writes
    27d0f755d649 net: usbnet: Fix WARNING in usbnet_start_xmit/usb_submit_urb
    fbe5a2fed815 Bluetooth: L2CAP: Fix use-after-free in l2cap_sock_ready_cb
    afd9a31b5aa4 fs/sysv: Null check to prevent null-ptr-deref bug
    80ec112c1996 fs/ntfs3: Use __GFP_NOWARN allocation at ntfs_load_attr_list()
    0d6f639f1dcd file: reinstate f_pos locking optimization for regular files
    b44d28b98f18 bpf, cpumap: Make sure kthread is running before map update returns
    8089eb93d678 drm/ttm: check null pointer before accessing when swapping
    ef0d07c66843 open: make RESOLVE_CACHED correctly test for O_TMPFILE
    c81bdf8f9f2b bpf: Disable preemption in bpf_event_output
    ae07cfe2b099 rbd: prevent busy loop when requesting exclusive lock
    7978bcca4c1f wifi: mt76: mt7615: do not advertise 5 GHz on first phy of MT7615D (DBDC)
    32ca6a55e10e net: tap_open(): set sk_uid from current_fsuid()
    4ed3eed99ee6 net: tun_chr_open(): set sk_uid from current_fsuid()
    adacc3a954fa arm64: dts: stratix10: fix incorrect I2C property for SCL signal
    b92c88009da1 mtd: rawnand: meson: fix OOB available bytes for ECC
    b0875c583e41 mtd: spinand: toshiba: Fix ecc_get_status
    1c33ca1e1974 exfat: release s_lock before calling dir_emit()
    8a34a242cf03 exfat: use kvmalloc_array/kvfree instead of kmalloc_array/kfree
    a74878207b02 x86/CPU/AMD: Do not leak quotient data after a division by 0
    b8f029fc4075 firmware: arm_scmi: Drop OF node reference in the transport channel setup
    287c2c8677ed ceph: defer stopping mdsc delayed_work
    98b521d10e73 USB: zaurus: Add ID for A-300/B-500/C-700
    cd6872f2cf56 libceph: fix potential hang in ceph_osdc_notify()
    e5f5b4a89809 scsi: storvsc: Limit max_sectors for virtual Fibre Channel devices
    212a9a3c67be scsi: zfcp: Defer fc_rport blocking until after ADISC response
    dac382725394 tcp_metrics: fix data-race in tcpm_suck_dst() vs fastopen
    4517782e1bc3 tcp_metrics: annotate data-races around tm->tcpm_net
    e842a68667d4 tcp_metrics: annotate data-races around tm->tcpm_vals[]
    d3184bea4ace tcp_metrics: annotate data-races around tm->tcpm_lock
    9a7367cbe33d tcp_metrics: annotate data-races around tm->tcpm_stamp
    6f6bd67f4894 tcp_metrics: fix addr_same() helper
    b0acbcf1e7a1 prestera: fix fallback to previous version on same major version
    d6d9d0f5a5e0 net/mlx5: fs_core: Skip the FTs in the same FS_TYPE_PRIO_CHAINS fs_prio
    c999fb1039dd net/mlx5: fs_core: Make find_closest_ft more generic
    32ef2c0c6cf1 vxlan: Fix nexthop hash size
    1bb54a21f4d9 ip6mr: Fix skb_under_panic in ip6mr_cache_report()
    64e3affee288 s390/qeth: Don't call dev_close/dev_open (DOWN/UP)
    a0da2684db18 net: dcb: choose correct policy to parse DCB_ATTR_BCN
    193333229aac net: netsec: Ignore 'phy-mode' on SynQuacer in DT mode
    766c9dd00c5f net: korina: handle clk prepare error in korina_probe()
    6cecfdf65053 net: ll_temac: fix error checking of irq_of_parse_and_map()
    3761ff4f8670 net: ll_temac: Switch to use dev_err_probe() helper
    5c534640a7da bpf: sockmap: Remove preempt_disable in sock_map_sk_acquire
    79c3d81c9ad1 net/sched: cls_route: No longer copy tcf_result on update to avoid use-after-free
    9edf7955025a net/sched: cls_fw: No longer copy tcf_result on update to avoid use-after-free
    262430dfc618 net/sched: cls_u32: No longer copy tcf_result on update to avoid use-after-free
    b58d34068fd9 bpf, cpumap: Handle skb as well when clean up ptr_ring
    f04f6d9b3b06 net/sched: taprio: Limit TCA_TAPRIO_ATTR_SCHED_CYCLE_TIME to INT_MAX.
    2c55d4941518 net: add missing data-race annotation for sk_ll_usec
    e934c50c48e2 net: add missing data-race annotations around sk->sk_peek_off
    fdd8d8d54d6a net: add missing READ_ONCE(sk->sk_rcvbuf) annotation
    98f0d1db3a27 net: add missing READ_ONCE(sk->sk_sndbuf) annotation
    0d1047b77b23 net: add missing READ_ONCE(sk->sk_rcvlowat) annotation
    6c058a1f67f0 net: annotate data-races around sk->sk_max_pacing_rate
    2950c5ac65b3 qed: Fix scheduling in a tasklet while getting stats
    a19952dbb5b6 qed: Fix kernel-doc warnings
    6d8c259f4827 mISDN: hfcpci: Fix potential deadlock on &hc->lock
    8dedcc6af341 net: sched: cls_u32: Fix match key mis-addressing
    675d29de69c7 perf test uprobe_from_different_cu: Skip if there is no gcc
    0f6e3d8d7f91 net: dsa: fix value check in bcm_sf2_sw_probe()
    047508edd602 rtnetlink: let rtnl_bridge_setlink checks IFLA_BRIDGE_MODE length
    cc9ebceaa6d0 bpf: Add length check for SK_DIAG_BPF_STORAGE_REQ_MAP_FD parsing
    8f9a04c742e1 net/mlx5e: fix return value check in mlx5e_ipsec_remove_trailer()
    00cecb0a8f9e net/mlx5: DR, fix memory leak in mlx5dr_cmd_create_reformat_ctx
    4c224ea31bed wifi: cfg80211: Fix return value in scan logic
    8e72db3ffa5d KVM: s390: fix sthyi error handling
    809edb4262f0 word-at-a-time: use the same return type for has_zero regardless of endianness
    b7880809d75d arm64: dts: imx8mn-var-som: add missing pull-up for onboard PHY reset pinmux
    804e72062be4 iommu/arm-smmu-v3: Document nesting-related errata
    744e6b80b830 iommu/arm-smmu-v3: Add explicit feature for nesting
    fd86b5944215 iommu/arm-smmu-v3: Document MMU-700 erratum 2812531
    2de9f3dcfe63 iommu/arm-smmu-v3: Work around MMU-600 erratum 1076982
    a850fa85d477 arm64: errata: Add detection for TRBE write to out-of-range
    073699df4a09 arm64: errata: Add workaround for TSB flush failures
    44b45e8161a5 net/mlx5: Free irqs only on shutdown callback
    40601542c43c perf: Fix function pointer case
    c12fa4ac8997 io_uring: gate iowait schedule on having pending requests

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index f09dbe0b5f..a883fe090c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "897961fcc3a4126a9d86096b4c3f0de174eb51e7"
-SRCREV_meta ?= "9d45e4358eec5d4585e6e26d7f2f6f03ad909ea7"
+SRCREV_machine ?= "7f5083ab7cf0b34b46a1e08716163438cfe113fa"
+SRCREV_meta ?= "d63dc98bfc78b2d086cc3565c5a12da1ed2c033a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "5.15.125"
+LINUX_VERSION ?= "5.15.126"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 2f0e232fe6..f7970e9281 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.125"
+LINUX_VERSION ?= "5.15.126"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "673a7d93e8c401525183fd793cd1fbc5d688761f"
-SRCREV_meta ?= "9d45e4358eec5d4585e6e26d7f2f6f03ad909ea7"
+SRCREV_machine ?= "f949bdbc869e8d89cc338a74a014f6a5d3962da4"
+SRCREV_meta ?= "d63dc98bfc78b2d086cc3565c5a12da1ed2c033a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index f3c6733656..9926cb8f73 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f1655130f428a06fd10df1401cf4a97c2c9e98fe"
-SRCREV_machine:qemuarm64 ?= "3562a213e44daf360d873c1c1773d64c7b1bdb90"
-SRCREV_machine:qemumips ?= "bff8d6b2771b531f996b41ab89d742b21d6d1a5f"
-SRCREV_machine:qemuppc ?= "9ccbf6add86b58f8446ba2b439ccdaaa1646c20b"
-SRCREV_machine:qemuriscv64 ?= "50ad222fc4256538597cc943ddb328692041424d"
-SRCREV_machine:qemuriscv32 ?= "50ad222fc4256538597cc943ddb328692041424d"
-SRCREV_machine:qemux86 ?= "50ad222fc4256538597cc943ddb328692041424d"
-SRCREV_machine:qemux86-64 ?= "50ad222fc4256538597cc943ddb328692041424d"
-SRCREV_machine:qemumips64 ?= "05401de4dd847384e7592e2d729e2d8ff4a1e1bd"
-SRCREV_machine ?= "50ad222fc4256538597cc943ddb328692041424d"
-SRCREV_meta ?= "9d45e4358eec5d4585e6e26d7f2f6f03ad909ea7"
+SRCREV_machine:qemuarm ?= "63f9c653ac8bca862d71352211d0d191813936ae"
+SRCREV_machine:qemuarm64 ?= "97eddfe9caf2200f3d964bbea7c472b46418e61b"
+SRCREV_machine:qemumips ?= "8c0497f3d412b7a1b40254eae9628e810d365dc9"
+SRCREV_machine:qemuppc ?= "722612ff2e5ce49c89874a8b5d8fd5e80e15ede2"
+SRCREV_machine:qemuriscv64 ?= "027401d57727e10a0eaf0c0aec9e6451acf3b397"
+SRCREV_machine:qemuriscv32 ?= "027401d57727e10a0eaf0c0aec9e6451acf3b397"
+SRCREV_machine:qemux86 ?= "027401d57727e10a0eaf0c0aec9e6451acf3b397"
+SRCREV_machine:qemux86-64 ?= "027401d57727e10a0eaf0c0aec9e6451acf3b397"
+SRCREV_machine:qemumips64 ?= "907f084725f90e192f2a30045f12b49fc12be95e"
+SRCREV_machine ?= "027401d57727e10a0eaf0c0aec9e6451acf3b397"
+SRCREV_meta ?= "d63dc98bfc78b2d086cc3565c5a12da1ed2c033a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "c275eaaaa34260e6c907bc5e7ee07c096bc45064"
+SRCREV_machine:class-devupstream ?= "24c4de4069cbce796a1c71166240807d617cd652"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.125"
+LINUX_VERSION ?= "5.15.126"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


