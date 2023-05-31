Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE09C7EE29
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 18:49:08 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web10.2591.1685558946959645779
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 11:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KAYv2H+z;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3985f70cf1bso3726324b6e.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 11:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685558946; x=1688150946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FHZZVIaBZTGQTrGSrxr5jBOKl6+lTunOSNJbRc7ONYA=;
        b=KAYv2H+zq096nU9qw6g+qfo9o4WgJ4mwK9avlo0+BTVelGK6A1zHR2UCYOQuttiDdW
         DvE1lCILBCZ3827UO2q+ddBn/gi8gaGGzspHU6lqzAOt1Jm/NtKwpx6aznU6uF7kgnEh
         HDEP6BtnJFljXLgGwAFyRfZCgtuKu0y9/8aOUC944CWOh4X6YPdtgX91Q4A/q6U7F7df
         m7aMxg4Do4xrwriMfSlQv5kuGtpaYUs2WGsZYjeD2jLnPfkhY4J/rkTO+21YGFnpRcX2
         /smi3IyZpt3Hx4PZwIa71b1Ud8XjS+RElRGc01CIDg/5g0SsjLYSCQcpQX2PcPjzrbbk
         n9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685558946; x=1688150946;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FHZZVIaBZTGQTrGSrxr5jBOKl6+lTunOSNJbRc7ONYA=;
        b=RcOeDYnGd30gCzquVv3v5j0qAfySzAmILsNC+LQgM7eImyqB0ckFoU6FRjoForjcBf
         HQb5F9ypfT79xH9Wj0Z5534Y/I3RWaF0AY2ueMraJ53t/RiXRtIyWNFfltlCkWUdp/2m
         BgVxdvwfYhPlu0/dRqkiCtLjHMaf1Y3B8gKaeKzAEc7r8A/HNY1LI6Tx0y+n5iMPrLEg
         T3x0FX3jf107ceftrIcIWapDmuP6nUd4F7sFwPfmzKwLgSAbcab8Ye0D5QZffov273J/
         ik7kRQBSHuWFw2FdjYtxMHiEn5flZPLxNjH+Hq+INZNKYrwj3ew3YfQEbHk+yWOTndZY
         1FAA==
X-Gm-Message-State: AC+VfDywgMaO08iMfKI9QwP+V6AiGcSDMKTKv9SigTH2LE2G1WdTs1Fk
	Cq1EWaErAio5MLdI8eIssjlCpDgCxxDx/Q==
X-Google-Smtp-Source: ACHHUZ4TQumw24RyjFwg85zwfAp4vAdM5ieGTwtQsWBW7WkAFUFoyuMHCTPmx11e6T2Jf+dFHvXP1w==
X-Received: by 2002:a05:6808:1301:b0:394:670f:9ecb with SMTP id y1-20020a056808130100b00394670f9ecbmr5002927oiv.1.1685558946031;
        Wed, 31 May 2023 11:49:06 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id e16-20020a0cf750000000b006257e64474asm3926645qvo.113.2023.05.31.11.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 11:49:05 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] linux-yocto/6.1: update to v6.1.26
Date: Wed, 31 May 2023 14:48:54 -0400
Message-Id: <e001999fd3627eda849eab3f120d6c0ba59e7c0d.1685558432.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685558432.git.bruce.ashfield@gmail.com>
References: <cover.1685558432.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 18:49:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182025

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    ca1c9012c941 Linux 6.1.26
    ab91b09f399f ASN.1: Fix check for strdup() success
    1831d8cbaea8 ASoC: fsl_sai: Fix pins setting for i.MX8QM platform
    6cb818ed5f08 ASoC: fsl_asrc_dma: fix potential null-ptr-deref
    7a6593b5d7ad ASoC: SOF: pm: Tear down pipelines only if DSP was active
    b528537d131f mm/page_alloc: fix potential deadlock on zonelist_update_seq seqlock
    71b6df69f17e fpga: bridge: properly initialize bridge device before populating children
    f8c3eb751a9b iio: adc: at91-sama5d2_adc: fix an error code in at91_adc_allocate_trigger()
    342c1db4fa8c Input: pegasus-notetaker - check pipe type when probing
    a93c20f58322 gcc: disable '-Warray-bounds' for gcc-13 too
    a09b9383b749 sctp: Call inet6_destroy_sock() via sk->sk_destruct().
    a530b33fe986 dccp: Call inet6_destroy_sock() via sk->sk_destruct().
    a8cf1141057a inet6: Remove inet6_destroy_sock() in sk->sk_prot->destroy().
    588d682251e6 purgatory: fix disabling debug info
    7ca973d830c0 fuse: always revalidate rename target dentry
    f9a20ef5e83c MIPS: Define RUNTIME_DISCARD_EXIT in LD script
    8d6a870a428f KVM: arm64: Fix buffer overflow in kvm_arm_set_fw_reg()
    9e7976c0cd63 KVM: arm64: Make vcpu flag updates non-preemptible
    d362a03d920e sched/fair: Fixes for capacity inversion detection
    799c7301ded6 sched/fair: Consider capacity inversion in util_fits_cpu()
    fe1c982958c5 sched/fair: Detect capacity inversion
    7e6631f782a1 mm/mmap: regression fix for unmapped_area{_topdown}
    059f24aff65c mm: page_alloc: skip regions with hugetlbfs pages when allocating 1G pages
    bd6f3421a586 mm: kmsan: handle alloc failures in kmsan_vmap_pages_range_noflush()
    433a7ecaed4b mm: kmsan: handle alloc failures in kmsan_ioremap_page_range()
    e8a7bdb6f76c mm/huge_memory.c: warn with pr_warn_ratelimited instead of VM_WARN_ON_ONCE_FOLIO
    519dbe737f0d mm/khugepaged: check again on anon uffd-wp during isolation
    cc647e05db67 mm/userfaultfd: fix uffd-wp handling for THP migration entries
    b1644a0031cf drm/rockchip: vop2: Use regcache_sync() to fix suspend/resume
    904e1b66854b drm/rockchip: vop2: fix suspend/resume
    4ac57c3fe2c0 drm/amd/display: set dcn315 lb bpp to 48
    bef774effb27 drm/amdgpu: Fix desktop freezed after gpu-reset
    66eb772be27e drm/i915: Fix fast wake AUX sync len
    d9caa028d7ad mmc: sdhci_am654: Set HIGH_SPEED_ENA for SDR12 and SDR25
    3e6bd2653ff8 writeback, cgroup: fix null-ptr-deref write in bdi_split_work_to_wbs
    ec90129b91b6 kernel/sys.c: fix and improve control flow in __sys_setres[ug]id()
    a3a93b46833f memstick: fix memory leak if card device is never registered
    f6a5f61200ff tools/mm/page_owner_sort.c: fix TGID output when cull=tg is used
    a0aa4827f791 nilfs2: initialize unused bytes in segment summary blocks
    a1176791ab74 maple_tree: fix a potential memory leak, OOB access, or other unpredictable bug
    66f13a1acf0a maple_tree: fix mas_empty_area() search
    c51b9ef3f521 maple_tree: make maple state reusable after mas_empty_area_rev()
    be100a8460e3 LoongArch: Mark 3 symbol exports as non-GPL
    e82caab68951 LoongArch: Fix probing of the CRC32 feature
    55fba69fbfd0 rust: kernel: Mark rust_fmt_argument as extern "C"
    e19ebc5f9a71 btrfs: get the next extent map during fiemap/lseek more efficiently
    b28def6ed970 ALSA: hda/realtek: fix mute/micmute LEDs for a HP ProBook
    31f7c99e3685 iio: light: tsl2772: fix reading proximity-diodes from device tree
    b263f81bd16e iio: dac: ad5755: Add missing fwnode_handle_put()
    9ad34ea8d2d6 drm/amdgpu/vcn: Disable indirect SRAM on Vangogh broken BIOSes
    9bdbd0099262 Revert "userfaultfd: don't fail on unrecognized features"
    8e610b699385 mtd: spi-nor: fix memory leak when using debugfs_lookup()
    f4d1bbb97728 platform/x86: asus-nb-wmi: Add quirk_asus_tablet_mode to other ROG Flow X13 models
    25e2413c9374 platform/x86: gigabyte-wmi: add support for X570S AORUS ELITE
    bbf4d72be001 xen/netback: use same error messages for same errors
    79d22faeba7b nvme-tcp: fix a possible UAF when failing to allocate an io queue
    0cc5da7990ff drm: test: Fix 32-bit issue in drm_buddy_test
    fb766acce3cf drm: buddy_allocator: Fix buddy allocator init on 32-bit systems
    3059a67e02dc s390/ptrace: fix PTRACE_GET_LAST_BREAK error handling
    ba6486192268 platform/x86: gigabyte-wmi: add support for B650 AORUS ELITE AX
    fbc72b63520a net: dsa: b53: mmap: add phy ops
    480df96832f4 scsi: core: Improve scsi_vpd_inquiry() checks
    83760e74ed14 scsi: megaraid_sas: Fix fw_crash_buffer_show()
    e0ac735ee4e2 selftests: sigaltstack: fix -Wuninitialized
    8563ab97a870 platform/x86 (gigabyte-wmi): Add support for A320M-S2H V2
    c4043891a10f platform/x86/intel: vsec: Fix a memory leak in intel_vsec_add_aux
    23f18f35bf1f f2fs: Fix f2fs_truncate_partial_nodes ftrace event
    b2bfa742b871 net: bridge: switchdev: don't notify FDB entries with "master dynamic"
    b91798017c3e e1000e: Disable TSO on i219-LM card to increase speed
    89603f4c9154 bpf: Fix incorrect verifier pruning due to missing register precision taints
    39eeb724c4d9 spi: spi-rockchip: Fix missing unwind goto in rockchip_sfc_probe()
    ef018e12b1ed mlxsw: pci: Fix possible crash during initialization
    9a0b96d03c59 net: rpl: fix rpl header size calculation
    64489c22d085 bonding: Fix memory leak when changing bond type to Ethernet
    68b0f2843173 mlxfw: fix null-ptr-deref in mlxfw_mfa2_tlv_next()
    fa82a725e8cb bnxt_en: Do not initialize PTP on older P3/P4 chips
    8e1f40e8f707 netfilter: nf_tables: tighten netlink attribute requirements for catch-all elements
    ef87cd81321b netfilter: nf_tables: validate catch-all set elements
    8a5dad80bd83 i40e: fix i40e_setup_misc_vector() error handling
    0ec73187f026 i40e: fix accessing vsi->active_filters without holding lock
    9387a515cbc3 netfilter: nf_tables: fix ifdef to also consider nf_tables=m
    6a4029f4f91f sfc: Fix use-after-free due to selftest_work
    d43f024e8c2a virtio_net: bugfix overflow inside xdp_linearize_page()
    ce729b06dc33 net: sched: sch_qfq: prevent slab-out-of-bounds in qfq_activate_agg
    519c96885eae regulator: fan53555: Fix wrong TCS_SLEW_MASK
    49b9758d44d4 regulator: fan53555: Explicitly include bits header
    8acb00f377f9 rust: str: fix requierments->requirements typo
    1c4dbb001fd3 netfilter: nf_tables: Modify nla_memdup's flag to GFP_KERNEL_ACCOUNT
    ea854a25c832 netfilter: br_netfilter: fix recent physdev match breakage
    6369276efa7a arm64: dts: imx8mp-verdin: correct off-on-delay
    e09602ba40b6 arm64: dts: imx8mm-verdin: correct off-on-delay
    94e05ccaf335 arm64: dts: imx8mm-evk: correct pmic clock source
    ed26418b2dff arm64: dts: qcom: sc8280xp-pmics: fix pon compatible and registers
    8fe3333f7229 arm64: dts: meson-g12-common: specify full DMC range
    4ba06237c4a2 arm64: dts: qcom: ipq8074-hk10: enable QMP device, not the PHY node
    ecff49fd3758 arm64: dts: qcom: hk10: use "okay" instead of "ok"
    fb42f8abdebd arm64: dts: qcom: ipq8074-hk01: enable QMP device, not the PHY node
    80cc8410af29 arm64: dts: rockchip: Lower sd speed on rk3566-soquartz
    8f33e7c677a9 ARM: dts: rockchip: fix a typo error for rk3288 spdif node

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 20d2729371..d2dc7e60f1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f974a72071f8b481fc4e38517219bc5c503e14f6"
-SRCREV_meta ?= "36901b5b298e601fe73dd79aaff8b615a7762013"
+SRCREV_machine ?= "128a73d5e1339475618b41383121a0eef4bb29de"
+SRCREV_meta ?= "1bb0236be7c49344bd411c71f21769153ecd9695"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.25"
+LINUX_VERSION ?= "6.1.26"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 47d77404d0..b2f6266018 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.25"
+LINUX_VERSION ?= "6.1.26"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
-SRCREV_meta ?= "36901b5b298e601fe73dd79aaff8b615a7762013"
+SRCREV_machine ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
+SRCREV_meta ?= "1bb0236be7c49344bd411c71f21769153ecd9695"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index bf172eb38e..eebce559b7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0b80e90b38ae1735c7dab701ca3d0b2447376ccc"
-SRCREV_machine:qemuarm64 ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
-SRCREV_machine:qemuloongarch64 ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
-SRCREV_machine:qemumips ?= "db61d7fe3540904fbe77b532ce3e37aeb737524a"
-SRCREV_machine:qemuppc ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
-SRCREV_machine:qemuriscv64 ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
-SRCREV_machine:qemuriscv32 ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
-SRCREV_machine:qemux86 ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
-SRCREV_machine:qemux86-64 ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
-SRCREV_machine:qemumips64 ?= "aacc52b6216955723cebb5bc493a4210357b23b2"
-SRCREV_machine ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
-SRCREV_meta ?= "36901b5b298e601fe73dd79aaff8b615a7762013"
+SRCREV_machine:qemuarm ?= "171d448bfb9e531c7395deae260edf96305eab9c"
+SRCREV_machine:qemuarm64 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
+SRCREV_machine:qemuloongarch64 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
+SRCREV_machine:qemumips ?= "d637594e7e9c9037d7c609f9dfeef13a57a5aec4"
+SRCREV_machine:qemuppc ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
+SRCREV_machine:qemuriscv64 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
+SRCREV_machine:qemuriscv32 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
+SRCREV_machine:qemux86 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
+SRCREV_machine:qemux86-64 ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
+SRCREV_machine:qemumips64 ?= "52e3ff0902681ac3d9128bcf037033e14ae20d68"
+SRCREV_machine ?= "c35e45ea5f134aad3ef0ccd3f1b7b672c801e402"
+SRCREV_meta ?= "1bb0236be7c49344bd411c71f21769153ecd9695"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "f17b0ab65d17988d5e6d6fe22f708ef3721080bf"
+SRCREV_machine:class-devupstream ?= "ca1c9012c941ab1520851938d5f695f5a4d23634"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.25"
+LINUX_VERSION ?= "6.1.26"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


