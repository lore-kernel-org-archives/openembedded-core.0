Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 479BFC4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:22 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web10.2932.1702391296273699666
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iuJ0BhB1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ce939ecfc2so4997215b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391295; x=1702996095; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkxVyYOkbT3P/OEmp3/Ko8oPQL9DWWQudtH+ozh/jFI=;
        b=iuJ0BhB1iveH7f965jm1sIk+hFrbkgcvunQdN4PhoCAyfEbvY2tMJ2IPkroLgJlrCx
         62RCCtAObAZzaOyinACyaNqgDGSN4silJ7oJE46FzC2FEJ5dHAsvmJqEKH2VqK1hsdkn
         b+nB5huv09efeFeb1UqLBa6MDVhy/rk5AtwfAl/yu1AlTObErWI62QLivEflCZ5STCnF
         5RzD43rWIU7ZEr53JrrwZ2MYaV8vO5+moUgPaxrCkvE+Cje+XxBIeXU5QLH6gDsa8d+/
         +ic9RBAQBHZjOo9q9q9AzNOPCdksc6JhgrbVF280vqfKrsIcSjQdSNkvKhKo/eABc5zI
         5eFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391295; x=1702996095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gkxVyYOkbT3P/OEmp3/Ko8oPQL9DWWQudtH+ozh/jFI=;
        b=xEPQgtidIC6bn76vC7EulMtcQKk5zpIRBa6YYDQ3ODYHWEQ961RNHfqhsVDLLx25YT
         3oQSCldOvJttk28fqv8f34Fk97deDgM30jMJY5FaKwseXzAz70mac/Q2zk6YvWYOzNnp
         XRXk8oc5qLQ67YeiiX3P2GXOoKVQQ0tFgCFEOs4c3L0zHDJlP7Y7VXhivI0yCoZHFTs0
         dDuyHg1wBmSDVWrUH93ObzbKMNNVXy7oqsr0n4FpXlhYDxtxtXESWwYHiobxN3LjvSRC
         hrH/gIasjTsmfsEJoVMPVjm8GBQep+pSw1kMb6mc/FRgh4FZAbd0P/anZh19YRsqekWX
         gcwA==
X-Gm-Message-State: AOJu0Yz3FYs9O6DbvfPJHROJO/cDOFiOltBSmixGwiK4nnMlIeeA2kLV
	FsETlO3WSH8eyT39ltYsZS+TzMyDdTQL0/6Jaag=
X-Google-Smtp-Source: AGHT+IEPq3BVw1VoiaNCD5m78TUHOYV9QZkRHc962CefK3Xl7KWyJK3Jt1ZrsisM/22ouM60nK20GQ==
X-Received: by 2002:aa7:8884:0:b0:6ce:2731:a079 with SMTP id z4-20020aa78884000000b006ce2731a079mr7808793pfe.40.1702391294723;
        Tue, 12 Dec 2023 06:28:14 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.28.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:28:14 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 17/29] linux-yocto/6.1: update to v6.1.62
Date: Tue, 12 Dec 2023 04:27:23 -1000
Message-Id: <b249fcda04a9f6ccf3d2f798c5a860ba024a9368.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192221

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    fb2635ac69ab Linux 6.1.62
    585da49ad62c ASoC: SOF: sof-pci-dev: Fix community key quirk detection
    c1c15b09f456 ALSA: hda: intel-dsp-config: Fix JSL Chromebook quirk detection
    5c59879031ea misc: pci_endpoint_test: Add deviceID for J721S2 PCIe EP device support
    6bebd303ad7e tty: 8250: Add Brainboxes Oxford Semiconductor-based quirks
    3017a17ad6b9 tty: 8250: Add support for Intashield IX cards
    c3444894e855 tty: 8250: Add support for additional Brainboxes PX cards
    31ebf431ed02 tty: 8250: Fix up PX-803/PX-857
    bfe9bde05fcd tty: 8250: Fix port count of PX-257
    b75ee2d9d792 tty: 8250: Add support for Intashield IS-100
    cdd260b220d9 tty: 8250: Add support for Brainboxes UP cards
    8af676c69815 tty: 8250: Add support for additional Brainboxes UC cards
    abcb12f3192d tty: 8250: Remove UC-257 and UC-431
    df6cfab66ff2 tty: n_gsm: fix race condition in status line change on dead connections
    23107989be8e usb: raw-gadget: properly handle interrupted requests
    e7a802447c49 usb: typec: tcpm: Fix NULL pointer dereference in tcpm_pd_svdm()
    6f17be270003 usb: storage: set 1.50 as the lower bcdDevice for older "Super Top" compatibility
    b25a2f247083 PCI: Prevent xHCI driver from claiming AMD VanGogh USB3 DRD device
    977ae4dbe231 ALSA: usb-audio: add quirk flag to enable native DSD for McIntosh devices
    9411dbe2c66c mmap: fix error paths with dup_anon_vma()
    21ca008c53a5 mm/mempolicy: fix set_mempolicy_home_node() previous VMA pointer
    7ab62e3415fb x86: KVM: SVM: always update the x2avic msr interception
    e83359126567 perf evlist: Avoid frequency mode for the dummy event
    b3eed1111048 power: supply: core: Use blocking_notifier_call_chain to avoid RCU complaint
    803cc77a3acc ceph_wait_on_conflict_unlink(): grab reference before dropping ->d_lock
    9eab5008db6c io_uring: kiocb_done() should *not* trust ->ki_pos if ->{read,write}_iter() failed
    ed0ba37e7b9b powerpc/mm: Fix boot crash with FLATMEM
    31ae7876da36 r8152: Check for unplug in r8153b_ups_en() / r8153c_ups_en()
    f90656fbf618 r8152: Check for unplug in rtl_phy_patch_request()
    98567c9d849b net: chelsio: cxgb4: add an error code check in t4_load_phy_fw
    ff86d69b2e50 drm/amdgpu: Reserve fences for VM update
    8e4a77ba25ec platform/mellanox: mlxbf-tmfifo: Fix a warning message
    0f2840dabfea netfilter: nf_tables: audit log object reset once per table
    ec80ad4585d7 LoongArch: Replace kmap_atomic() with kmap_local_page() in copy_user_highpage()
    afe80b58eea3 LoongArch: Export symbol invalid_pud_table for modules building
    9f9b2ec53aca gpu/drm: Eliminate DRM_SCHED_PRIORITY_UNSET
    cafa191b27dd drm/amdgpu: Unset context priority is now invalid
    0eb733b53ebf scsi: mpt3sas: Fix in error path
    4e000daf394a fbdev: uvesafb: Call cn_del_callback() at the end of uvesafb_exit()
    50736464a75a fbdev: omapfb: fix some error codes
    6a87b333ba47 drm/ttm: Reorder sys manager cleanup step
    9951b2309ea7 ASoC: codecs: tas2780: Fix log of failed reset via I2C.
    b7ed4aa0c2e6 ASoC: rt5650: fix the wrong result of key button
    8e1a6594d782 efi: fix memory leak in krealloc failure handling
    678edd2dfd55 netfilter: nfnetlink_log: silence bogus compiler warning
    c6f6a505277f spi: npcm-fiu: Fix UMA reads when dummy.nbytes == 0
    6a7a2d5a0864 fs/ntfs3: Avoid possible memory leak
    84aabd18c8d7 fs/ntfs3: Fix directory element type detection
    3bff4bb7f9c7 fs/ntfs3: Fix NULL pointer dereference on error in attr_allocate_frame()
    c8cbae3cbbc4 fs/ntfs3: Fix possible NULL-ptr-deref in ni_readpage_cmpr()
    6fe32f79abea fs/ntfs3: Use kvmalloc instead of kmalloc(... __GFP_NOWARN)
    92f9c7c7ddbf fs/ntfs3: Write immediately updated ntfs state
    fc91bb3e1b2b fs/ntfs3: Add ckeck in ni_update_parent()
    768e857ac3e0 fbdev: atyfb: only use ioremap_uc() on i386 and ia64
    dd6d75eb00ee Input: synaptics-rmi4 - handle reset delay when using SMBus trsnsport
    c64c237275b4 powerpc/85xx: Fix math emulation exception
    96c7aac8d804 dmaengine: ste_dma40: Fix PM disable depth imbalance in d40_probe
    9ef4697548c2 irqchip/stm32-exti: add missing DT IRQ flag translation
    7378415da048 irqchip/riscv-intc: Mark all INTC nodes as initialized
    d3204c0fdd33 net: sched: cls_u32: Fix allocation size in u32_init()
    f15dbcda2ce8 ASoC: tlv320adc3xxx: BUG: Correct micbias setting
    30ed99860437 coresight: tmc-etr: Disable warnings for allocation failures
    6618e7a740de ASoC: simple-card: fixup asoc_simple_probe() error handling

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 611da3dcd87a595be77f72bea3d2637d5d869ae5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 6a92171f12..a9e335a79d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f9bb1e96b7dcb1ba3649e84ca3ab9880509cee1b"
-SRCREV_meta ?= "29ec3dc6f4f59b731badcc864b212767023cc40c"
+SRCREV_machine ?= "2ebf9ed52d958208ec758b9bd8eb74e9c8f473d0"
+SRCREV_meta ?= "d26f4f3307216e06ee0b74fa9b57b17fba72a988"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.61"
+LINUX_VERSION ?= "6.1.62"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index fb48b8e043..601b66322a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.61"
+LINUX_VERSION ?= "6.1.62"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9e8c3b51334d4ca02a5ccdb5b4a1268b2f3174b9"
-SRCREV_meta ?= "29ec3dc6f4f59b731badcc864b212767023cc40c"
+SRCREV_machine ?= "9b52a4e842fde2fc6d7bfc163c90ffe0b4af9cc9"
+SRCREV_meta ?= "d26f4f3307216e06ee0b74fa9b57b17fba72a988"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 038c6dae71..1e8271b5e8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ed4795c1e353e6a1fa57b5ba01c42f5b3f436a0c"
-SRCREV_machine:qemuarm64 ?= "9e8c3b51334d4ca02a5ccdb5b4a1268b2f3174b9"
-SRCREV_machine:qemuloongarch64 ?= "9e8c3b51334d4ca02a5ccdb5b4a1268b2f3174b9"
-SRCREV_machine:qemumips ?= "7c06c2693959032740dd1fdea4dedc9491845951"
-SRCREV_machine:qemuppc ?= "9e8c3b51334d4ca02a5ccdb5b4a1268b2f3174b9"
-SRCREV_machine:qemuriscv64 ?= "9e8c3b51334d4ca02a5ccdb5b4a1268b2f3174b9"
-SRCREV_machine:qemuriscv32 ?= "9e8c3b51334d4ca02a5ccdb5b4a1268b2f3174b9"
-SRCREV_machine:qemux86 ?= "9e8c3b51334d4ca02a5ccdb5b4a1268b2f3174b9"
-SRCREV_machine:qemux86-64 ?= "9e8c3b51334d4ca02a5ccdb5b4a1268b2f3174b9"
-SRCREV_machine:qemumips64 ?= "b05d04ae43806e87bf9f77484c72260350f6defe"
-SRCREV_machine ?= "9e8c3b51334d4ca02a5ccdb5b4a1268b2f3174b9"
-SRCREV_meta ?= "29ec3dc6f4f59b731badcc864b212767023cc40c"
+SRCREV_machine:qemuarm ?= "553807cc4b2abe45fcecad38ad424da1af792cb6"
+SRCREV_machine:qemuarm64 ?= "9b52a4e842fde2fc6d7bfc163c90ffe0b4af9cc9"
+SRCREV_machine:qemuloongarch64 ?= "9b52a4e842fde2fc6d7bfc163c90ffe0b4af9cc9"
+SRCREV_machine:qemumips ?= "ab6cbfee4ca2e65c01f4241dd47ca39d602f6d6c"
+SRCREV_machine:qemuppc ?= "9b52a4e842fde2fc6d7bfc163c90ffe0b4af9cc9"
+SRCREV_machine:qemuriscv64 ?= "9b52a4e842fde2fc6d7bfc163c90ffe0b4af9cc9"
+SRCREV_machine:qemuriscv32 ?= "9b52a4e842fde2fc6d7bfc163c90ffe0b4af9cc9"
+SRCREV_machine:qemux86 ?= "9b52a4e842fde2fc6d7bfc163c90ffe0b4af9cc9"
+SRCREV_machine:qemux86-64 ?= "9b52a4e842fde2fc6d7bfc163c90ffe0b4af9cc9"
+SRCREV_machine:qemumips64 ?= "2908340b73bf0421d1bfdf5102deb03bfcfde62e"
+SRCREV_machine ?= "9b52a4e842fde2fc6d7bfc163c90ffe0b4af9cc9"
+SRCREV_meta ?= "d26f4f3307216e06ee0b74fa9b57b17fba72a988"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4a61839152cc3e9e00ac059d73a28d148d622b30"
+SRCREV_machine:class-devupstream ?= "fb2635ac69abac0060cc2be2873dc4f524f12e66"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.61"
+LINUX_VERSION ?= "6.1.62"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


