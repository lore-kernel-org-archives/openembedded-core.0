Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71C66C7EE33
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 02:34:49 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.4591.1685500483978534755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 19:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=XzoeqPax;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6af6b6837acso3795613a34.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 19:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685500483; x=1688092483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=76Xo5sUL+FwHgV4I0JGCS9FLFzdQDWJnzuipmNc/lfM=;
        b=XzoeqPax6C1UZmcBxfz63UvXX34i6enD9p0sltMwXKbUy9YZ9ToEYyqpwql8r2kXvq
         YkPrAtFxmXNVp+QG4Jwi52+MQPIdUgCLukj4vd9yWE8TH4vCtqj33xu0IicA98X6qtuc
         6A2xtKaC4hTqWTOfKcFSbe8XyBht7u3nNTqHMpvat/eCgcS0n+VCKY3MdOhRtpOeOzQG
         Da4c7Rgg6DLtejw18bqj1X4XAIFGljbH59TJcT8NomjwR/EYlAuVT/Fbzvx21gT0HDfG
         py8Vu9M/LVnwlvZdLlwYOuffV/x6R7htlMo31ZDhuIK7/yQ8t45YeJjcOfquIxHnoaAj
         kGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685500483; x=1688092483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76Xo5sUL+FwHgV4I0JGCS9FLFzdQDWJnzuipmNc/lfM=;
        b=S1A3pI8HTGup0Wi4p67K+qlA5iTzZf2Z7pzyxsdl3Rh39ewRnEzfIqhcJ95eWoBzRr
         rjf9GdVEdaRJaFUAT/YDJ1IInDcOg3267zjI05fT2J9C85tz8UcJU69YOnm7D4Q6ckA1
         qvDgz8sQYhskePCbzcU4n+v6xyhpb54f6WOrfr6cniyTfAf4lr8XlKR9fSkfxr8a9N1Z
         hwvqawolFKUC7+kyTmMwKLFatZ4YM3O1E59bANL5eySyf96mJjKXU2rGo9zqQ/jDsfN5
         FpPXvOdZ9nfqxKqCNHO7JwjTYUoowCgLRR5WXbWKLcLlCHfIKuE//ODt02TLi69cu08D
         Kd5A==
X-Gm-Message-State: AC+VfDwTNl4RkN+lp4C+n0Z4RO98jCfwEvDxZZE/PVaz+TsHRZb8gfFA
	rEHZQLvjuDaRB/Ab2GgWAwJSCOmaJVMrkAf+lcw=
X-Google-Smtp-Source: ACHHUZ7xUY7WOGcoGFspJpMZ6YFQxQMUufup7IqShPiyCWzzCQxTV4jySZARzNRLbYw2vPb4In8jLA==
X-Received: by 2002:a05:6358:c08:b0:123:3812:7c99 with SMTP id f8-20020a0563580c0800b0012338127c99mr98210rwj.30.1685500482680;
        Tue, 30 May 2023 19:34:42 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k91-20020a17090a3ee400b0023a9564763bsm92877pjc.29.2023.05.30.19.34.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 19:34:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 08/13] linux-yocto/5.10: update to v5.10.179
Date: Tue, 30 May 2023 16:34:15 -1000
Message-Id: <168b245456602d3d08cd2278e6ac97933dcbff6d.1685500244.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685500244.git.steve@sakoman.com>
References: <cover.1685500244.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 02:34:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181977

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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


