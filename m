Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC15EB64DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 02:56:10 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.34.1687143363119427660
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jun 2023 19:56:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ihE18oZ0;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-666eec46206so1787565b3a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 18 Jun 2023 19:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687143362; x=1689735362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JK3U98cW5mwVvuwohPWCs0DUPzR5uitzsPmWTUlW3sg=;
        b=ihE18oZ0JcX/lEvkK0Pi24VDhxaRvuPRaYMkXFm8KRL/yCDYuecGm3xxhDo0W59O9A
         X2SrOjaOh107GPQNNI/zsCb7igfwdQKTkcy/YT9W2H2giXKpvHiq5kmbTe+hqNfZy80R
         W3VhKhmBi+biY4BZKIKW4FS8UbLAt++SqQvLfDWzomU6JCsAKUgKIfQsuR5oVDAMH/o1
         rNTCzucHfs6JwT0BxiI6/xhXtaoQn6PTY0uQ4N4ducA+H6UMmSNgkbxf05OaW1xrwZwP
         W3DAZh6anAFgPz+MWahmYSb0700GctqlU8hpBoMk25efohJ3fiVUYwjvut+t8pONIcjp
         oaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687143362; x=1689735362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JK3U98cW5mwVvuwohPWCs0DUPzR5uitzsPmWTUlW3sg=;
        b=KUW2X63ky60zvqVJdXDEvEqAbtPF4QfRB2BhEAe86I4G6O7YHuOK34GzdX7gbW7h+E
         xa9B94MovmQ3Kvcpm/gR1xY/O0ny+6UqmkjG4TWWCNyccLucTkNhspHnmYF6J3f6o//x
         BDUR9G/pxGvULX3J8rQkaXxYdxJkPp83KZw9IFE0T7ba3S3encMhOO4e5JZQKwJYzJg9
         FUqblcnmEM6Toa7Kqo2pb5szLITtOTbNgKDGC8MsaFXd7k+okjH2qrp9IH103W2u1B3A
         tcYIlzOp6CCXpQ/dGWa/eUysstc+74WNEses7gHCc7dmf5/eysJQZh/S1D9CdCuDbkw2
         7RAA==
X-Gm-Message-State: AC+VfDwhp/PDH9yisXu0JjfkUYy2oJRbTJvUL+cngwe678aNz2y5c7bF
	JChiX5UihHV+RKuCN4usOh/YCUj/M0DA4Clwsq4=
X-Google-Smtp-Source: ACHHUZ6fSfQcID/ErWfsdFa/0FMuPHMnuykCYdMpAzujjA6jf3y5jK1HDIL+cY5P8LZ6begpM0BH6w==
X-Received: by 2002:a05:6a00:21ce:b0:666:64fb:b129 with SMTP id t14-20020a056a0021ce00b0066664fbb129mr12727167pfj.27.1687143362086;
        Sun, 18 Jun 2023 19:56:02 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id k12-20020aa7820c000000b0062dba4e4706sm16611481pfi.191.2023.06.18.19.56.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 19:56:01 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/18] linux-yocto/5.15: update to v5.15.109
Date: Sun, 18 Jun 2023 16:55:30 -1000
Message-Id: <fe55be7f4a543c576181af208551a9134d2b45fc.1687143192.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687143192.git.steve@sakoman.com>
References: <cover.1687143192.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 02:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183077

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    f48aeeaaa64c Linux 5.15.109
    4aed6b5809bb soc: sifive: l2_cache: fix missing of_node_put() in sifive_l2_init()
    71e7ed6e3aa9 soc: sifive: l2_cache: fix missing free_irq() in error path in sifive_l2_init()
    48c5fd373345 soc: sifive: l2_cache: fix missing iounmap() in error path in sifive_l2_init()
    2a2a502af466 ASN.1: Fix check for strdup() success
    9fc2e7f2cf47 ASoC: fsl_asrc_dma: fix potential null-ptr-deref
    0431e1323f42 mm/page_alloc: fix potential deadlock on zonelist_update_seq seqlock
    144ff55623e2 iio: adc: at91-sama5d2_adc: fix an error code in at91_adc_allocate_trigger()
    e589986ef037 counter: 104-quad-8: Fix race condition between FLAG and CNTR reads
    78559037632b pwm: hibvt: Explicitly set .polarity in .get_state()
    2147e7c2d26f pwm: iqs620a: Explicitly set .polarity in .get_state()
    a2ab4924f0c8 pwm: meson: Explicitly set .polarity in .get_state()
    dbc7a6d1ec8e sctp: Call inet6_destroy_sock() via sk->sk_destruct().
    4f66b180a622 dccp: Call inet6_destroy_sock() via sk->sk_destruct().
    b60d534d1e70 inet6: Remove inet6_destroy_sock() in sk->sk_prot->destroy().
    dd042131386f tcp/udp: Call inet6_destroy_sock() in IPv6 sk->sk_destruct().
    dabbe97f369b udp: Call inet6_destroy_sock() in setsockopt(IPV6_ADDRFORM).
    d58366aab868 fuse: fix deadlock between atomic O_TRUNC and page invalidation
    e21d9c606839 fuse: always revalidate rename target dentry
    c10a5b340681 fuse: fix attr version comparison in fuse_read_update_size()
    1e5c686087dc purgatory: fix disabling debug info
    a134b2ac4127 docs: futex: Fix kernel-doc references after code split-up preparation
    66dd55279174 MIPS: Define RUNTIME_DISCARD_EXIT in LD script
    e779884c713f sched/fair: Fixes for capacity inversion detection
    4ee882e0e1ed sched/uclamp: Fix a uninitialized variable warnings
    98762616db0b sched/fair: Consider capacity inversion in util_fits_cpu()
    99b704ae7a17 sched/fair: Detect capacity inversion
    1de6ee9d812c sched/uclamp: Cater for uclamp in find_energy_efficient_cpu()'s early exit condition
    a77e3c0e067d sched/uclamp: Make cpu_overutilized() use util_fits_cpu()
    ac407e5102e9 sched/uclamp: Fix fits_capacity() check in feec()
    46c631fe5a94 mm: page_alloc: skip regions with hugetlbfs pages when allocating 1G pages
    981e276dd965 mm/khugepaged: check again on anon uffd-wp during isolation
    29562319cba0 drm/i915: Fix fast wake AUX sync len
    afbfd70cb1a0 mmc: sdhci_am654: Set HIGH_SPEED_ENA for SDR12 and SDR25
    1aaa1e0a9a0f kernel/sys.c: fix and improve control flow in __sys_setres[ug]id()
    ebab1a86ca3e memstick: fix memory leak if card device is never registered
    8c168553abce nilfs2: initialize unused bytes in segment summary blocks
    e513fb5cadc4 iio: light: tsl2772: fix reading proximity-diodes from device tree
    c15737965434 rtmutex: Add acquire semantics for rtmutex lock acquisition slow path
    a8466e335f58 platform/x86: gigabyte-wmi: add support for X570S AORUS ELITE
    4a2a34a75f3e xen/netback: use same error messages for same errors
    08e774db2ef1 nvme-tcp: fix a possible UAF when failing to allocate an io queue
    1b91bfae3ee1 s390/ptrace: fix PTRACE_GET_LAST_BREAK error handling
    357fa038d93d net: dsa: b53: mmap: add phy ops
    583d2abf1374 scsi: core: Improve scsi_vpd_inquiry() checks
    139bea1d3aa1 scsi: megaraid_sas: Fix fw_crash_buffer_show()
    73890c48849d selftests: sigaltstack: fix -Wuninitialized
    c2680efa1507 platform/x86 (gigabyte-wmi): Add support for A320M-S2H V2
    fd3e899340e1 Input: i8042 - add quirk for Fujitsu Lifebook A574/H
    14bb1fb893db f2fs: Fix f2fs_truncate_partial_nodes ftrace event
    0ebc93afdaf6 e1000e: Disable TSO on i219-LM card to increase speed
    e722ea6dae2c bpf: Fix incorrect verifier pruning due to missing register precision taints
    25e50cdf9f63 spi: spi-rockchip: Fix missing unwind goto in rockchip_sfc_probe()
    cbce626dcd23 mlxsw: pci: Fix possible crash during initialization
    4eee0d9d3c11 net: rpl: fix rpl header size calculation
    92e0bc5e34ad bonding: Fix memory leak when changing bond type to Ethernet
    b24026f1409c mlxfw: fix null-ptr-deref in mlxfw_mfa2_tlv_next()
    5610d81d0214 bnxt_en: Do not initialize PTP on older P3/P4 chips
    7ff875ee15bc netfilter: nf_tables: tighten netlink attribute requirements for catch-all elements
    0a397535d189 netfilter: nf_tables: validate catch-all set elements
    25f1b40cf9b2 i40e: fix i40e_setup_misc_vector() error handling
    536ed39cbec8 i40e: fix accessing vsi->active_filters without holding lock
    8089d724dd7a netfilter: nf_tables: fix ifdef to also consider nf_tables=m
    69ea11769b8d sfc: Fix use-after-free due to selftest_work
    aa16f7b99d23 sfc: Split STATE_READY in to STATE_NET_DOWN and STATE_NET_UP.
    b36d82ddc74e virtio_net: bugfix overflow inside xdp_linearize_page()
    1ffc0e810551 net: sched: sch_qfq: prevent slab-out-of-bounds in qfq_activate_agg
    fe0d832ea0e6 regulator: fan53555: Fix wrong TCS_SLEW_MASK
    976f8482e459 regulator: fan53555: Explicitly include bits header
    cb9b96c154a1 netfilter: br_netfilter: fix recent physdev match breakage
    beb1c8576c23 arm64: dts: imx8mm-evk: correct pmic clock source
    863473055d1d arm64: dts: meson-g12-common: specify full DMC range
    dd6bd054a92c arm64: dts: qcom: ipq8074-hk01: enable QMP device, not the PHY node
    bd129e4c9e34 ARM: dts: rockchip: fix a typo error for rk3288 spdif node

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 3411b2b442c44fa932e3d6065a95078a6f541dd9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 29379791f4..71c2c4042b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8e0611e36c848a07f9cdd778903c9e51bb90b319"
-SRCREV_meta ?= "e4b95ec17228274acb38bf10061448224df3a312"
+SRCREV_machine ?= "63a865cbbc8ab351f44582a4fcf2999c7681cfd8"
+SRCREV_meta ?= "8ce5ee0184fb213962a82ca5ee8c74851452e260"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.108"
+LINUX_VERSION ?= "5.15.109"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index c19c289b97..620e85091d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.108"
+LINUX_VERSION ?= "5.15.109"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "3d762b85647844790979dd1e17a762003aaa7476"
-SRCREV_meta ?= "e4b95ec17228274acb38bf10061448224df3a312"
+SRCREV_machine ?= "7d734295a38a5fc03fb29fb90bb64e38708e2308"
+SRCREV_meta ?= "8ce5ee0184fb213962a82ca5ee8c74851452e260"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 785944c3cf..41e7c27850 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "80421c525a12141d31bf1592b0d8c176defe3010"
-SRCREV_machine:qemuarm64 ?= "9d140dbc3171bf272f51b524edeeb2f22783aca5"
-SRCREV_machine:qemumips ?= "b29a8fa62d88db512f1fa5d60e430a851d7e3aaf"
-SRCREV_machine:qemuppc ?= "7ee6b7fc4b57933114376cf012218c2ae3d23558"
-SRCREV_machine:qemuriscv64 ?= "e8c818cce43dd720c366d831aeb102c20c237652"
-SRCREV_machine:qemuriscv32 ?= "e8c818cce43dd720c366d831aeb102c20c237652"
-SRCREV_machine:qemux86 ?= "e8c818cce43dd720c366d831aeb102c20c237652"
-SRCREV_machine:qemux86-64 ?= "e8c818cce43dd720c366d831aeb102c20c237652"
-SRCREV_machine:qemumips64 ?= "5c900befc90365f6daa80989e8de0ccc546ff0f5"
-SRCREV_machine ?= "e8c818cce43dd720c366d831aeb102c20c237652"
-SRCREV_meta ?= "e4b95ec17228274acb38bf10061448224df3a312"
+SRCREV_machine:qemuarm ?= "8ac50c616d30bffb2540f2dd7bfe8ea66d737bfe"
+SRCREV_machine:qemuarm64 ?= "470798ad34773e9e60e08ba80a8b7e6c4cf65c94"
+SRCREV_machine:qemumips ?= "9dcb3aaf2e30172cfb33b13d50bae621cd449f5b"
+SRCREV_machine:qemuppc ?= "faaa6b1dd4c1bf3550efa07e788f6849729e9d7b"
+SRCREV_machine:qemuriscv64 ?= "b8a4501ad3a651d576df481df20bf20fd3e969df"
+SRCREV_machine:qemuriscv32 ?= "b8a4501ad3a651d576df481df20bf20fd3e969df"
+SRCREV_machine:qemux86 ?= "b8a4501ad3a651d576df481df20bf20fd3e969df"
+SRCREV_machine:qemux86-64 ?= "b8a4501ad3a651d576df481df20bf20fd3e969df"
+SRCREV_machine:qemumips64 ?= "a41a7b13730b656588ac38cf0f1af6f9f255e112"
+SRCREV_machine ?= "b8a4501ad3a651d576df481df20bf20fd3e969df"
+SRCREV_meta ?= "8ce5ee0184fb213962a82ca5ee8c74851452e260"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "3299fb36854fdc288bddc2c4d265f8a2e5105944"
+SRCREV_machine:class-devupstream ?= "f48aeeaaa64c628519273f6007a745cf55b68d95"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.108"
+LINUX_VERSION ?= "5.15.109"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


