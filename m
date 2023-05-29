Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30544C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 16:47:25 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.53983.1685378841761096639
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 09:47:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=T7EwZCtQ;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-75b1219506fso204767085a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 09:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685378841; x=1687970841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=74HCollTNxDRP9CXw5RqCJztqwZqNSiaHfHqqJ5KmO4=;
        b=T7EwZCtQNd0amIY2vKet2jCOW77eRkKXOGE8JOAIrteis5h7St+EEEtfKtfMBcsZ2s
         HDXKqGnlMQV9VOQv21ZVCDX0QoxmV1zDYNjH+TKBIapke4JGKJF/9q1lRgvT8htjUn/C
         Bpxk/ytit+i/Vdgobh0Mx3+u/MQQr3vERB/B2dMfMh/KX09+3+TSsv8D8YHRcnhCuJyU
         oBrQaBu2rnEz2/siXnTntThULisINCIQpQdPcLfg8FMQMI+Xd1oznXMWIkA33R4HcesB
         SNRRuu975j6NnglwmvRrIQ8JOIFtPEObrPbDB7edMEtzRUV7lH5MO2+pULSM0wv44uXj
         icKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685378841; x=1687970841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74HCollTNxDRP9CXw5RqCJztqwZqNSiaHfHqqJ5KmO4=;
        b=IQFYurcHOUcLHsvEr5hDqY63UsgqRKUIepU/UMQESv0RG814NvT/A6f+4gBjUmNj40
         73i0uPb+ZKnkvOdmPZdpP4Ff4DFB49jWapMswgZLR0zaiDRfoJIVTKA070nvLRzFoM6N
         h5dNH+2Ih+cJdXVVmIhCHDipuF9E7HSiQ7mOk3D2MWiLW6Js05arwrZhcQ9Vg13EDWOd
         A/ek2rZn+evk/klcrhN4aYVj2NwNbzlaAprLn/gJbcK03e5Xpzwye11B5z+yPe8IAiVI
         86+IHh0asgD8hiIjIQ0y8bL4c8dvnz1H49cpPFCtPXh2sbW2GAmMycMIHLzcxR57jYYU
         uzpQ==
X-Gm-Message-State: AC+VfDypzQLsFzRNijePCQ7b9rnLHL6NJ5FkdkE7+zEynjkJTISEVeb4
	SANU2Kb3Br3LAa75OqJaCdBxbGO4wD+KBQ==
X-Google-Smtp-Source: ACHHUZ6PZpwzu2TF5K+mcL71HH0XXM3oyUnCxgr+3aB0RkyTkzvBbVHWM19OksN5ByBH6O3LTVmcaA==
X-Received: by 2002:a05:620a:6590:b0:75b:23a1:8e51 with SMTP id qd16-20020a05620a659000b0075b23a18e51mr6454567qkn.34.1685378840657;
        Mon, 29 May 2023 09:47:20 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id o15-20020ae9f50f000000b0074a6c29df4dsm3461394qkg.119.2023.05.29.09.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 09:47:19 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [dunfell 4/5] linux-yocto/5.4: update to v5.4.242
Date: Mon, 29 May 2023 12:47:13 -0400
Message-Id: <20230529164715.3511175-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230529164715.3511175-1-bruce.ashfield@gmail.com>
References: <20230529164715.3511175-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 16:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181879

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    ea7862c507ec Linux 5.4.242
    d54a9f999ea7 ASN.1: Fix check for strdup() success
    2500d7edebfb iio: adc: at91-sama5d2_adc: fix an error code in at91_adc_allocate_trigger()
    760c2e6dee32 pwm: meson: Explicitly set .polarity in .get_state()
    7f2b8046da83 xfs: fix forkoff miscalculation related to XFS_LITINO(mp)
    c27a6bb1788f sctp: Call inet6_destroy_sock() via sk->sk_destruct().
    97ce6cde1f51 dccp: Call inet6_destroy_sock() via sk->sk_destruct().
    a01b75620e1a inet6: Remove inet6_destroy_sock() in sk->sk_prot->destroy().
    9374db5bd1e3 tcp/udp: Call inet6_destroy_sock() in IPv6 sk->sk_destruct().
    2ac4697b7779 udp: Call inet6_destroy_sock() in setsockopt(IPV6_ADDRFORM).
    5a62248c5855 ext4: fix use-after-free in ext4_xattr_set_entry
    3b0044cb28f7 ext4: remove duplicate definition of ext4_xattr_ibody_inline_set()
    3c4fdbf368ba Revert "ext4: fix use-after-free in ext4_xattr_set_entry"
    ef2aab86c34c x86/purgatory: Don't generate debug info for purgatory.ro
    c22aefaef8ae MIPS: Define RUNTIME_DISCARD_EXIT in LD script
    a5167e902b64 mmc: sdhci_am654: Set HIGH_SPEED_ENA for SDR12 and SDR25
    1b8b54fc55a4 memstick: fix memory leak if card device is never registered
    5ad61a5268de nilfs2: initialize unused bytes in segment summary blocks
    988766b9d124 iio: light: tsl2772: fix reading proximity-diodes from device tree
    5cb867f1ecb4 xen/netback: use same error messages for same errors
    903f82b1a6b2 nvme-tcp: fix a possible UAF when failing to allocate an io queue
    34b74c32ff4f s390/ptrace: fix PTRACE_GET_LAST_BREAK error handling
    64cd99da25c1 net: dsa: b53: mmap: add phy ops
    89dcf0dd7aae scsi: core: Improve scsi_vpd_inquiry() checks
    f729b74bb489 scsi: megaraid_sas: Fix fw_crash_buffer_show()
    4f4ef354f95d selftests: sigaltstack: fix -Wuninitialized
    a725dddf2139 Input: i8042 - add quirk for Fujitsu Lifebook A574/H
    9df3f502e33d f2fs: Fix f2fs_truncate_partial_nodes ftrace event
    2f3730f182fc e1000e: Disable TSO on i219-LM card to increase speed
    0f0a291cc520 bpf: Fix incorrect verifier pruning due to missing register precision taints
    ba610df83b04 mlxfw: fix null-ptr-deref in mlxfw_mfa2_tlv_next()
    d8e120057cee i40e: fix i40e_setup_misc_vector() error handling
    59fba01b6c72 i40e: fix accessing vsi->active_filters without holding lock
    01125379e2dc netfilter: nf_tables: fix ifdef to also consider nf_tables=m
    7c1019391bd6 virtio_net: bugfix overflow inside xdp_linearize_page()
    35dceaeab97c net: sched: sch_qfq: prevent slab-out-of-bounds in qfq_activate_agg
    d61f24a45410 regulator: fan53555: Explicitly include bits header
    36f098e1e4d1 netfilter: br_netfilter: fix recent physdev match breakage
    375e445b1022 arm64: dts: meson-g12-common: specify full DMC range
    cb1f89fe934b ARM: dts: rockchip: fix a typo error for rk3288 spdif node

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 5d77bc3ae3..8ad2207dd2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bf0fd4b1c757c39b99fb742f7023718fca6477de"
-SRCREV_meta ?= "6f28deea807165327b46a5b2613bb220e36e3ef1"
+SRCREV_machine ?= "b2e35e842864b87c1b081e27327799f9e0d2ac97"
+SRCREV_meta ?= "12e1d8d16de51659eddf0411d67d4eae4b4ac767"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.241"
+LINUX_VERSION ?= "5.4.242"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 245e049b60..31a1ee783b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.241"
+LINUX_VERSION ?= "5.4.242"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "8ccc251148dca811482b01afe95b24f02e9c0b8b"
-SRCREV_machine ?= "e0fc5fe58eac8f2a552a3fe5b3da0f18c8fd5a52"
-SRCREV_meta ?= "6f28deea807165327b46a5b2613bb220e36e3ef1"
+SRCREV_machine_qemuarm ?= "1091132f5b9b1f56bbd6b408a2d3652aeb1b5405"
+SRCREV_machine ?= "98224933ef9fd6b6f600c27037d7c59c3af2aab2"
+SRCREV_meta ?= "12e1d8d16de51659eddf0411d67d4eae4b4ac767"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 60b4c44ec9..e606bb4c73 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a38fd554c6a9d49f33b4097a7300f5a2d134cb83"
-SRCREV_machine_qemuarm64 ?= "99b6ecddbf3cf1909e8208a46842c81cce09d02c"
-SRCREV_machine_qemumips ?= "55f3e8be5f53e522210db32f6bf60c9d153fe5d6"
-SRCREV_machine_qemuppc ?= "536eee19189590e19bdcb5baf5b6c752abd14455"
-SRCREV_machine_qemuriscv64 ?= "2dc29af86649e3006eb05972e1e175989d64d537"
-SRCREV_machine_qemux86 ?= "2dc29af86649e3006eb05972e1e175989d64d537"
-SRCREV_machine_qemux86-64 ?= "2dc29af86649e3006eb05972e1e175989d64d537"
-SRCREV_machine_qemumips64 ?= "60b346865774d6d320f8b5b3ef35661fdaa6dffb"
-SRCREV_machine ?= "2dc29af86649e3006eb05972e1e175989d64d537"
-SRCREV_meta ?= "6f28deea807165327b46a5b2613bb220e36e3ef1"
+SRCREV_machine_qemuarm ?= "210301f79471a6b8bbd8ce7da56f19f34beacf1d"
+SRCREV_machine_qemuarm64 ?= "78a9e72b8046e89a23e44e8f3ad79ded96484237"
+SRCREV_machine_qemumips ?= "d71f42f88b7b8fb09b722d269e140edf465af454"
+SRCREV_machine_qemuppc ?= "2144b992dd135ca0ffe168d112d99d48a2896b98"
+SRCREV_machine_qemuriscv64 ?= "37cd360d09d440f38d15efcd9f2a57ab9d3a10b7"
+SRCREV_machine_qemux86 ?= "37cd360d09d440f38d15efcd9f2a57ab9d3a10b7"
+SRCREV_machine_qemux86-64 ?= "37cd360d09d440f38d15efcd9f2a57ab9d3a10b7"
+SRCREV_machine_qemumips64 ?= "8e77596aadf62832d1a8bc307dab9598ce6a85d1"
+SRCREV_machine ?= "37cd360d09d440f38d15efcd9f2a57ab9d3a10b7"
+SRCREV_meta ?= "12e1d8d16de51659eddf0411d67d4eae4b4ac767"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.241"
+LINUX_VERSION ?= "5.4.242"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


