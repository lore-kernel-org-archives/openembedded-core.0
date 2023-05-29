Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456BCC7EE2C
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 16:49:45 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.53989.1685378979237509603
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 09:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=P1PAwVHj;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6237faa8677so18006656d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 09:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685378980; x=1687970980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vqRF4WVdUxMFByHpEsgjm3QNi4fvo9WObVHQ5GGNVM=;
        b=P1PAwVHj3KdmKOuko6toBCaMA3Q8cmt93/P2XDMcLhMZaPsvxBYJKeRRt5jSV2gRFR
         C7TiSadiP+hx2RigGYnJWRKskC62Dr0UStcv3u4UBNcyUl6unRlvNFv/TZfS6iL3eDHl
         nYy4TjV3NCOrTDYAqu4OPgO5cobDw8dhT5vDcNahcYXX/xgKhf3I0cdMnqxlRE0HQjOc
         Nwtdve9FtWhzRcoi9fbYVT9nLY+P7KjhpR46cK7jnB1kDOwbrcLTdzWg3dQbJX/spKZz
         KyAfvJnSw5twA/rfv0blYtx3QXedSrDzI1NJqDEpjJ9scNN0uo28SaezBpURc5Ez0RoW
         yqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685378980; x=1687970980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+vqRF4WVdUxMFByHpEsgjm3QNi4fvo9WObVHQ5GGNVM=;
        b=bV9BjUVxzdU2G+sHQypGa8H38JBfkYuHaGMlMxFI2FfBhRG+wyiBVhIvRe3/3zHzGP
         uLEpU24uGpRywqoU9iq3Hcf4hqQThyyPvEu8gDAJCdx3aJL5U4cXtIirz0obSqRPD+x9
         hA63J6tsOGl+SLYB7LFnntNYdlODZUjPzcizeT+lMQw5RPHvuqLGtRyv9kfUyQ4hV/bb
         FIZSh4qYjVZIafj5HYAMegc+vpM8qSrQvQhbS+Id2mZpedg8rVzN8BJGr8wj836+VNJe
         /AKgLAWebDOoT2vvKN9QwkaTmZSIDASGrB4KUrY0uKVj8eouygwcaSV94Qgi70NP7jQ7
         v/zA==
X-Gm-Message-State: AC+VfDwpNWZPbDhFN+YDq1VlYXVKFIkBieXz87Pu0p7vK2wbIZ28vJaY
	ikBC+nHUwRgBHLR4tbN4NwVmY5mD3ei4Sg==
X-Google-Smtp-Source: ACHHUZ5NBqurd8PloW/Mey+B+zzJcQGYwdqtZLln6DDCyTLFWbB/JYREMt/cQfGALxfjeZtmZ6FkJw==
X-Received: by 2002:a05:6214:408:b0:620:a1be:c74d with SMTP id z8-20020a056214040800b00620a1bec74dmr13017268qvx.37.1685378980464;
        Mon, 29 May 2023 09:49:40 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id qf2-20020a0562144b8200b0062621e3b511sm1159219qvb.74.2023.05.29.09.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 09:49:39 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [kirkstone 4/5] linux-yocto/5.10: update to v5.10.179
Date: Mon, 29 May 2023 12:49:34 -0400
Message-Id: <20230529164935.3511435-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230529164935.3511435-1-bruce.ashfield@gmail.com>
References: <20230529164935.3511435-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 16:49:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181884

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    f1b32fda06d2 Linux 5.10.179
    0367bf3f4a4e ASN.1: Fix check for strdup() success
    4ab5f8f9d026 ASoC: fsl_asrc_dma: fix potential null-ptr-deref
    42604b4ad5f3 iio: adc: at91-sama5d2_adc: fix an error code in at91_adc_allocate_trigger()
    155b2586de3f pwm: hibvt: Explicitly set .polarity in .get_state()
    1c3a1211370d pwm: iqs620a: Explicitly set .polarity in .get_state()
    b28079807de2 pwm: meson: Explicitly set .polarity in .get_state()
    f69112de70a0 sctp: Call inet6_destroy_sock() via sk->sk_destruct().
    7da54ddc04e6 dccp: Call inet6_destroy_sock() via sk->sk_destruct().
    04d393c4bbf5 inet6: Remove inet6_destroy_sock() in sk->sk_prot->destroy().
    b1f06ab985ef tcp/udp: Call inet6_destroy_sock() in IPv6 sk->sk_destruct().
    0e7b5e1020aa udp: Call inet6_destroy_sock() in setsockopt(IPV6_ADDRFORM).
    05cf34a2b641 ext4: fix use-after-free in ext4_xattr_set_entry
    c75711396c04 ext4: remove duplicate definition of ext4_xattr_ibody_inline_set()
    9400206d9d5e Revert "ext4: fix use-after-free in ext4_xattr_set_entry"
    81775ab858b4 fuse: fix deadlock between atomic O_TRUNC and page invalidation
    03cefde986f1 fuse: always revalidate rename target dentry
    42dfdbd4dcfa fuse: fix attr version comparison in fuse_read_update_size()
    0078a1667cbf fuse: check s_root when destroying sb
    6d0d67b05f7b virtiofs: split requests that exceed virtqueue size
    cf08dc79168a virtiofs: clean up error handling in virtio_fs_get_tree()
    e220438d1e33 purgatory: fix disabling debug info
    37df709706ae docs: futex: Fix kernel-doc references after code split-up preparation
    77748b0a047e MIPS: Define RUNTIME_DISCARD_EXIT in LD script
    4735b6f74f25 sched/fair: Fixes for capacity inversion detection
    89ad8a672f57 sched/uclamp: Fix a uninitialized variable warnings
    09129798a608 sched/fair: Consider capacity inversion in util_fits_cpu()
    30f04dd56dfd sched/fair: Detect capacity inversion
    b18cbd359d72 sched/uclamp: Cater for uclamp in find_energy_efficient_cpu()'s early exit condition
    41a880740c9f sched/uclamp: Make cpu_overutilized() use util_fits_cpu()
    07750955e9a2 sched/uclamp: Make asym_fits_capacity() use util_fits_cpu()
    2fd1c194e688 sched/uclamp: Make select_idle_capacity() use util_fits_cpu()
    8ca2bf63d946 sched/uclamp: Fix fits_capacity() check in feec()
    5cb1a56ced30 sched/uclamp: Make task_fits_capacity() use util_fits_cpu()
    2523d9d7bb5c mm/khugepaged: check again on anon uffd-wp during isolation
    651b0bf43d67 mmc: sdhci_am654: Set HIGH_SPEED_ENA for SDR12 and SDR25
    c61928fcca27 kernel/sys.c: fix and improve control flow in __sys_setres[ug]id()
    e10a6d88ae9b memstick: fix memory leak if card device is never registered
    2c90ef37151f nilfs2: initialize unused bytes in segment summary blocks
    09daff9c3cd7 iio: light: tsl2772: fix reading proximity-diodes from device tree
    77ac8f2ad4ad xfs: drop submit side trans alloc for append ioends
    a4e800a7bd67 powerpc/doc: Fix htmldocs errors
    c215c636819c xen/netback: use same error messages for same errors
    0c9cbfc951c4 nvme-tcp: fix a possible UAF when failing to allocate an io queue
    8c746b665089 s390/ptrace: fix PTRACE_GET_LAST_BREAK error handling
    a36246a7480d net: dsa: b53: mmap: add phy ops
    b33f28ea45e9 scsi: core: Improve scsi_vpd_inquiry() checks
    24ddcc6a635b scsi: megaraid_sas: Fix fw_crash_buffer_show()
    01bd481b1b94 selftests: sigaltstack: fix -Wuninitialized
    8b44a83a1680 Input: i8042 - add quirk for Fujitsu Lifebook A574/H
    37882b203a2d f2fs: Fix f2fs_truncate_partial_nodes ftrace event
    9a8dbfd7f3e5 e1000e: Disable TSO on i219-LM card to increase speed
    b1281d008845 bpf: Fix incorrect verifier pruning due to missing register precision taints
    b085b5787b4a mlxsw: pci: Fix possible crash during initialization
    c972851d3848 net: rpl: fix rpl header size calculation
    b6b06c5ee333 mlxfw: fix null-ptr-deref in mlxfw_mfa2_tlv_next()
    880c09bc2f0b i40e: fix i40e_setup_misc_vector() error handling
    72df55d3dc96 i40e: fix accessing vsi->active_filters without holding lock
    381110d06192 netfilter: nf_tables: fix ifdef to also consider nf_tables=m
    6758a51ef36a sfc: Fix use-after-free due to selftest_work
    06a72bbf0d98 sfc: Split STATE_READY in to STATE_NET_DOWN and STATE_NET_UP.
    b6dd232f6350 virtio_net: bugfix overflow inside xdp_linearize_page()
    ddcf35deb8f2 net: sched: sch_qfq: prevent slab-out-of-bounds in qfq_activate_agg
    8e73952957a3 regulator: fan53555: Explicitly include bits header
    3224458030a2 netfilter: br_netfilter: fix recent physdev match breakage
    08b78037c4f1 arm64: dts: imx8mm-evk: correct pmic clock source
    2c06e904c2b7 arm64: dts: meson-g12-common: specify full DMC range
    b33dbd06ac5f arm64: dts: qcom: ipq8074-hk01: enable QMP device, not the PHY node
    e662521ec739 ARM: dts: rockchip: fix a typo error for rk3288 spdif node

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index ccc123d036..f39b28c5fb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c3918acd783cc421a852e580a8430d00d5e4cd5a"
-SRCREV_meta ?= "290ffeb6d028a31fe9c6e146b9ef618d50e36a04"
+SRCREV_machine ?= "42be00a6acf8aa69c1816ed0022af788eda02635"
+SRCREV_meta ?= "4ffe48fc9d3491d0123ea5698759f2010f22372d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.178"
+LINUX_VERSION ?= "5.10.179"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 41389e4fb9..c77162c9f9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.178"
+LINUX_VERSION ?= "5.10.179"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "4b892f65338376fcd1e18df926c06f190b539bd2"
-SRCREV_machine ?= "dc18514b51d27ae5446c8a5d068b3f996a42338a"
-SRCREV_meta ?= "290ffeb6d028a31fe9c6e146b9ef618d50e36a04"
+SRCREV_machine:qemuarm ?= "c368271929a4b4b419575966578abb32cab23b5d"
+SRCREV_machine ?= "f1b49ee7456e402d93961861e611b9ca829da753"
+SRCREV_meta ?= "4ffe48fc9d3491d0123ea5698759f2010f22372d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index a20381c7fb..46b9fdf870 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8f307a1c5b41dda1afe514cdd5427bb3320489a9"
-SRCREV_machine:qemuarm64 ?= "3539c6a469c2cd6e2beffcdbbbbc94603e00b048"
-SRCREV_machine:qemumips ?= "c501f357b5e8ccb10b25377c1a0c0ddd0f75c5e2"
-SRCREV_machine:qemuppc ?= "86717b18bbfa608b68bec3f8d5b463ea0dfd4802"
-SRCREV_machine:qemuriscv64 ?= "6f03475538a6d4f1f762ea6e1652499eeb2fb347"
-SRCREV_machine:qemuriscv32 ?= "6f03475538a6d4f1f762ea6e1652499eeb2fb347"
-SRCREV_machine:qemux86 ?= "6f03475538a6d4f1f762ea6e1652499eeb2fb347"
-SRCREV_machine:qemux86-64 ?= "6f03475538a6d4f1f762ea6e1652499eeb2fb347"
-SRCREV_machine:qemumips64 ?= "56b2142b8f2f4697145676de1a98230c74e82b41"
-SRCREV_machine ?= "6f03475538a6d4f1f762ea6e1652499eeb2fb347"
-SRCREV_meta ?= "290ffeb6d028a31fe9c6e146b9ef618d50e36a04"
+SRCREV_machine:qemuarm ?= "7b27b209bb9a594edeb3b4f4b919e8900aade179"
+SRCREV_machine:qemuarm64 ?= "17427c04e8d8c55004e817279ea99e977097787f"
+SRCREV_machine:qemumips ?= "0bd9e4cdcd99d0d4576a1198bba063ba2500ab16"
+SRCREV_machine:qemuppc ?= "123f9fe3b1ce8c60a4b55c0030a8a7428c18a516"
+SRCREV_machine:qemuriscv64 ?= "15c1b808c9f87a794a15ceaf104514e0a2bc21c1"
+SRCREV_machine:qemuriscv32 ?= "15c1b808c9f87a794a15ceaf104514e0a2bc21c1"
+SRCREV_machine:qemux86 ?= "15c1b808c9f87a794a15ceaf104514e0a2bc21c1"
+SRCREV_machine:qemux86-64 ?= "15c1b808c9f87a794a15ceaf104514e0a2bc21c1"
+SRCREV_machine:qemumips64 ?= "55e025dc1b9a8847f0307b87e07e175c929528a0"
+SRCREV_machine ?= "15c1b808c9f87a794a15ceaf104514e0a2bc21c1"
+SRCREV_meta ?= "4ffe48fc9d3491d0123ea5698759f2010f22372d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.178"
+LINUX_VERSION ?= "5.10.179"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


