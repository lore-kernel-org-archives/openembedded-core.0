Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171F0C43219
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:17:55 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.6483.1640013473852741753
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=m1xu+a64;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id g28so9609292qkk.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/zqKyPFbpqVJI9Kx64Gv/D5D91ZQAmHxW7kp71tgn6Q=;
        b=m1xu+a64WjiTCqMQC/ClRq1qRxKDq9hZuNx3A2tJciD8Pq6UtE+wuUJwEdwKIjW9Iu
         7noREkov9ME47vzxAGhx1hE/lU/SmFYdUjEL72cnmduL/ckhxNoSS6vRIwQ9WRbKp5Gs
         Oe1ihhcYHyA5mSnlUF/kIdnp5UcShtojfQN540wIR0EiGYBiAvPRQeE2aYH/tvAUSNnX
         /SmAurVuBM7LCJVefrTScG6a0NtsxkqQWfksaMAqWSEF4xG7mlIqdyWWOlbxw0FxgvxM
         8ByiXonZBUnDSLozPDIR5qXlyyvBIpHGNb5bURbkBxjaZRNTTsPIw9NExzFWGC13iccl
         I7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/zqKyPFbpqVJI9Kx64Gv/D5D91ZQAmHxW7kp71tgn6Q=;
        b=gISgFQ4cLOXLR4RNJCHR44M7QJM6es0aIslOXAGzQ7qomUEIbzcNnDzS0/59jvg2yQ
         YMTt3UCf39z1LjQnNK0Qktu0pal3lM3L6AvWNCemaI10J7BppprfrEyGAx4oY8kBd7OQ
         kK3MlRKHVHOHKbO97fMeyNhbDkUvn6aeKs8OMi4xW0ebr/rR5mCfFa0BBF4CVfEO6BHY
         isFo3oxLnBt7ArwR3OwHFl7oaKT6BUcBuDwWy1VTZoiHKDT3DOo+0zzRx3uEgpdR/5Zu
         eS/zclf3hu203trbKHUfoRC7cqPo0xnfdBzjq9M4Q+mKooMpyblTLS5XAi6nKKaXuEdf
         +7yg==
X-Gm-Message-State: AOAM533iotoVJPq5ZNI26ltF38Qf1tL05FQNETABDf9vFpqECAzNOY/5
	h7wt7J3GwsAsbM91fWJKeNWCXAVY0rk=
X-Google-Smtp-Source: 
 ABdhPJyWZXjux4gPSTckqd5/Wv5Qky/n93u/MC7DdCy5Eln/gWWTwiruc9zc+V5+HksM/x3wrq5YYg==
X-Received: by 2002:a05:620a:24cf:: with SMTP id
 m15mr407826qkn.623.1640013472868;
        Mon, 20 Dec 2021 07:17:52 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 i7sm11338634qkn.0.2021.12.20.07.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 07:17:52 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/5.15: update to v5.15.10
Date: Mon, 20 Dec 2021 10:17:45 -0500
Message-Id: 
 <df41073ecbc80bbb6fe6e99c9fbc746ba57b8870.1640013267.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1640013267.git.bruce.ashfield@gmail.com>
References: <cover.1640013267.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 15:17:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159888

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

57dcae4a8b93 Linux 5.15.10
dbcda209899a perf inject: Fix itrace space allowed for new attributes
5b4a8fbe4b0b fuse: make sure reclaim doesn't write the inode
18fc0ba9b10e staging: most: dim2: use device release method
9985d29c4755 tracing: Fix a kmemleak false positive in tracing_map
43b145f3a20a drm/amdkfd: process_info lock not needed for svm
c21cff0ea6b2 drm/amd/display: add connector type check for CRC source set
d9e63f180fc8 drm/amdkfd: fix double free mem structure
00a3f7fb7ae3 drm/amd/display: Fix for the no Audio bug with Tiled Displays
62477b3a86d6 drm/amdgpu: check atomic flag to differeniate with legacy path
796ddc81437b drm/amdgpu: cancel the correct hrtimer on exit
4c986072a8c9 net: netlink: af_netlink: Prevent empty skb by adding a check on len.
2d5ba2f40e73 i2c: rk3x: Handle a spurious start completion interrupt flag
a5a0cc7c7b84 parisc/agp: Annotate parisc agp init functions with __init
f66f84309623 ALSA: hda/hdmi: fix HDA codec entry table order for ADL-P
5eceb6a60a53 ALSA: hda: Add Intel DG2 PCI ID and HDMI codec vid
ced9b762f2d6 loop: Use pr_warn_once() for loop_control_remove() warning
095a04e0b320 net/mlx4_en: Update reported link modes for 1/10G
8605743472c5 Revert "tty: serial: fsl_lpuart: drop earlycon entry for i.MX8QXP"
0700eab4df5b s390/test_unwind: use raw opcode instead of invalid instruction
2b12c89527ae KVM: arm64: Save PSTATE early on exit
906f7797a38f drm/msm/dp: Avoid unpowered AUX xfers that caused crashes
dc6c1eddfc74 drm/msm/dsi: set default num_data_lanes
d2db21103d84 drm/msm/a6xx: Fix uinitialized use of gpu_scid
f6db3d98f876 drm/msm: Fix null ptr access msm_ioctl_gem_submit()
9cbb957441ed i2c: virtio: fix completion handling
304aa6a73189 vmxnet3: fix minimum vectors alloc issue
569670a02e21 ice: fix FDIR init missing when reset VF
76db15314582 RDMA/irdma: Don't arm the CQ more than two times if no CE for this CQ
918e62519834 RDMA/irdma: Report correct WC errors
b260dfed222b RDMA/irdma: Fix a potential memory allocation issue in 'irdma_prm_add_pble_mem()'
11eebcf63e98 RDMA/irdma: Fix a user-after-free in add_pble_prm
1ac287b7b615 netfs: Fix lockdep warning from taking sb_writers whilst holding mmap_lock
cff728217a2b perf bpf_skel: Do not use typedef to avoid error on old clang
134151c3b11d clk: qcom: sm6125-gcc: Swap ops of ice and apps on sdcc1
439250c09785 dt-bindings: media: nxp,imx7-mipi-csi2: Drop bad if/then schema
d17a8d12a6da inet: use #ifdef CONFIG_SOCK_RX_QUEUE_MAPPING consistently
c6aa8873468c mtd: rawnand: Fix nand_choose_best_timings() on unsupported interface
0c7b48887c34 mtd: rawnand: Fix nand_erase_op delay
e3bc4d4b50ca RDMA/mlx5: Fix releasing unallocated memory in dereg MR flow
acb53e47db1f RDMA: Fix use-after-free in rxe_queue_cleanup
c0d44c58afdd hwmon: (corsair-psu) fix plain integer used as NULL pointer
d89e4211b517 nfc: fix segfault in nfc_genl_dump_devices_done
14655b6d4204 Linux 5.15.9
3be0c72f5153 netfilter: selftest: conntrack_vrf.sh: fix file permission

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 9f5b70b6f0..2c83ffabf4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5f2c8fb6daa2fe1767e122da9edff3d8357ff426"
-SRCREV_meta ?= "22f3af23297303c8f884a89b603729eb6fb07eda"
+SRCREV_machine ?= "689069f890d6c3c472b45b5073f80723bd188160"
+SRCREV_meta ?= "eeb5d0c9dd5e2928835c633644426ee357fbce12"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.8"
+LINUX_VERSION ?= "5.15.10"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 68157066a4..8915df774a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.8"
+LINUX_VERSION ?= "5.15.10"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "a58830deb1794e589f486dea29685284e6fc5eae"
-SRCREV_machine ?= "4f73a85f62b6eea738417a1d86697ca9fb512a9e"
-SRCREV_meta ?= "22f3af23297303c8f884a89b603729eb6fb07eda"
+SRCREV_machine:qemuarm ?= "b43bd6284bd9ab63deded777807b4f9c1026ff02"
+SRCREV_machine ?= "81abcbb980529f94d9630358ecffbabd6a21e149"
+SRCREV_meta ?= "eeb5d0c9dd5e2928835c633644426ee357fbce12"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 00c0b69cd4..e87e446664 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1888cd436f8d611d40eda420857ada862d3c2ad1"
-SRCREV_machine:qemuarm64 ?= "4f73a85f62b6eea738417a1d86697ca9fb512a9e"
-SRCREV_machine:qemumips ?= "9611887d3cc04f5e6f5e6bb27dfef053ea31e9d4"
-SRCREV_machine:qemuppc ?= "4f73a85f62b6eea738417a1d86697ca9fb512a9e"
-SRCREV_machine:qemuriscv64 ?= "4f73a85f62b6eea738417a1d86697ca9fb512a9e"
-SRCREV_machine:qemuriscv32 ?= "4f73a85f62b6eea738417a1d86697ca9fb512a9e"
-SRCREV_machine:qemux86 ?= "4f73a85f62b6eea738417a1d86697ca9fb512a9e"
-SRCREV_machine:qemux86-64 ?= "4f73a85f62b6eea738417a1d86697ca9fb512a9e"
-SRCREV_machine:qemumips64 ?= "fcfeb52a0bd9255b6be241dc0370767dec8e2df1"
-SRCREV_machine ?= "4f73a85f62b6eea738417a1d86697ca9fb512a9e"
-SRCREV_meta ?= "22f3af23297303c8f884a89b603729eb6fb07eda"
+SRCREV_machine:qemuarm ?= "6ef10661ed1b3f14bd424f5a533f431c3121ae1f"
+SRCREV_machine:qemuarm64 ?= "81abcbb980529f94d9630358ecffbabd6a21e149"
+SRCREV_machine:qemumips ?= "c2d607d67a1c0231b63bbbbd7eb490342fd48ade"
+SRCREV_machine:qemuppc ?= "81abcbb980529f94d9630358ecffbabd6a21e149"
+SRCREV_machine:qemuriscv64 ?= "81abcbb980529f94d9630358ecffbabd6a21e149"
+SRCREV_machine:qemuriscv32 ?= "81abcbb980529f94d9630358ecffbabd6a21e149"
+SRCREV_machine:qemux86 ?= "81abcbb980529f94d9630358ecffbabd6a21e149"
+SRCREV_machine:qemux86-64 ?= "81abcbb980529f94d9630358ecffbabd6a21e149"
+SRCREV_machine:qemumips64 ?= "31c1532611489b9fdc807d9cec8ff3b727d5f9fe"
+SRCREV_machine ?= "81abcbb980529f94d9630358ecffbabd6a21e149"
+SRCREV_meta ?= "eeb5d0c9dd5e2928835c633644426ee357fbce12"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "22f3af23297303c8f884a89b603729eb6fb07eda"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "43e577d7a2cb60ad478387155c9de352f152101e"
+SRCREV_machine:class-devupstream ?= "57dcae4a8b93271c4e370920ea0dbb94a0215d30"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.8"
+LINUX_VERSION ?= "5.15.10"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


