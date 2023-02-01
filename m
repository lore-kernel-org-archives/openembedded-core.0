Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDB8C64EC3
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 16:28:33 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.28233.1675268909766026764
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 08:28:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bqQjcgwS;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id bb40so10027498qtb.2
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 08:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcvzYkDYVZdlTIOxEu3lwUAETYT3XGANlrXYrOS5ry0=;
        b=bqQjcgwSc9HAdCKhhBK7vZBSW8AYORtOCfBgfUrHSNbyAuzR8oOw2gErqj4rhnbN6g
         a3YnxWjI22c0vwXts0GdYu+vKQgDQmN0UZ/eGPSupmW5nM65Ya0ldJi4YbqFirCsG7+I
         9HHfveS4zwJYcOZWoeHVo3455zdxzr/a4Mubzz4IH64xktGRWRP77GcsVeaZcRr5R/am
         Sd6R07cCEjgcDzK0RLaWogvSOuogZHAeKPImW+hrMYYHvpUKHaLkWnFh6rqVpAFa+yCC
         WAv6ttWuWzd8Udjn2oROeZHjnIDADTzkRWfs5aTbhrsOXVoAdnyH/D7n240rryjODfHp
         P53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcvzYkDYVZdlTIOxEu3lwUAETYT3XGANlrXYrOS5ry0=;
        b=KnZ/d2+bWLNIxhV/z/EfFcTzOiB+W1Wpr85OuPZcfAnnbCrcgS1oQK9UJM4z5Ik0GK
         scE3qoROKmreWato873q5SSsNLkkbv2ZVxBP9AjuK8z1oiDOAMoXsw11zM+nr5xNXwxq
         43LSSDQ0TfqdQPh5y6hAV6GZrom760ToC8Kn8ZYE7j3yk5lsp7kAbZkI8+9UiL9WRQkp
         WthROfcAFuZ3d1zMH60ydLCf++CtRxSbdkn9OYRtyalrkfCz5I++2sQJHrvVABDa3ca6
         jwzJFb86n9KhIVlw2FLEUGrcAxCXImbDTf7G/W9GR58iohrwfQsw3trhCxNVD4bCFjC8
         y4iA==
X-Gm-Message-State: AO0yUKV9VmeURC3wRaOT71hNvUZsHOa3PEjXSsh6pzIZ0yOBbaxMBbgN
	VAPSfv+fbFYjMpUSF1gD921SiruFMSfjng==
X-Google-Smtp-Source: AK7set/xqm0b3orSGGW7MIPeViecENBnOSs9Q90qUSWdp+FaP+BKKI+56/nsqEFqqfpoX07oCjZpzw==
X-Received: by 2002:a05:622a:4cd:b0:3b9:b66a:2569 with SMTP id q13-20020a05622a04cd00b003b9b66a2569mr5277294qtx.7.1675268908731;
        Wed, 01 Feb 2023 08:28:28 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id d29-20020ac8615d000000b003b856b73e8bsm7528157qtm.16.2023.02.01.08.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Feb 2023 08:28:27 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto/5.15: update to v5.15.89
Date: Wed,  1 Feb 2023 11:28:21 -0500
Message-Id: <91c76ab6e48e37ed95069bdcd58732ea7cdb3e84.1675268720.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1675268720.git.bruce.ashfield@gmail.com>
References: <cover.1675268720.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 16:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176561

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    3bcc86eb3ed9 Linux 5.15.89
    37c18ef49ec3 pinctrl: amd: Add dynamic debugging for active GPIOs
    a5841b81adfa Revert "usb: ulpi: defer ulpi_register on ulpi_read_id timeout"
    7ec9a45fc4ee block: handle bio_split_to_limits() NULL return
    ba86db02d408 io_uring/io-wq: only free worker if it was allocated for creation
    bb135bcc9499 io_uring/io-wq: free worker if task_work creation is canceled
    63c2fa09b856 scsi: mpt3sas: Remove scsi_dma_map() error messages
    e2ea55564229 efi: fix NULL-deref in init error path
    94b6cf84db42 arm64: cmpxchg_double*: hazard against entire exchange variable
    3891fa4982b9 arm64: atomics: remove LL/SC trampolines
    61e86339af2a arm64: atomics: format whitespace consistently
    ed4629d1e968 io_uring: lock overflowing for IOPOLL
    fbf501514182 KVM: x86: Do not return host topology information from KVM_GET_SUPPORTED_CPUID
    ee16841134be Documentation: KVM: add API issues section
    b8f3b3cffb4a mm: Always release pages to the buddy allocator in memblock_free_late().
    d2dc110deabe platform/surface: aggregator: Add missing call to ssam_request_sync_free()
    cfd5978411ed igc: Fix PPS delta between two synchronized end-points
    0bf52601ced1 perf build: Properly guard libbpf includes
    205f35eee7be net/mlx5e: Don't support encap rules with gbp option
    0526fc9330fe net/mlx5: Fix ptp max frequency adjustment range
    9e2c38827cdc net/sched: act_mpls: Fix warning during failed attribute validation
    e3bb44beafde tools/nolibc: fix the O_* fcntl/open macro definitions for riscv
    1e6ec75bb3b5 tools/nolibc: restore mips branch ordering in the _start block
    bd0431a66c39 tools/nolibc: Remove .global _start from the entry point code
    a77c54f5b50c tools/nolibc/arch: mark the _start symbol as weak
    da51e086d154 tools/nolibc/arch: split arch-specific code into individual files
    8591e788bea3 tools/nolibc/types: split syscall-specific definitions into their own files
    4fceecdeaa8a tools/nolibc/std: move the standard type definitions to std.h
    1792136f228e tools/nolibc: use pselect6 on RISCV
    487386a49e01 tools/nolibc: x86-64: Use `mov $60,%eax` instead of `mov $60,%rax`
    27af4f2260cd tools/nolibc: x86: Remove `r8`, `r9` and `r10` from the clobber list
    a60b24192b1f af_unix: selftest: Fix the size of the parameter to connect()
    39ae73e58111 nfc: pn533: Wait for out_urb's completion in pn533_usb_send_frame()
    f6003784b1f6 hvc/xen: lock console list traversal
    79c58b74244d octeontx2-af: Fix LMAC config in cgx_lmac_rx_tx_enable
    303d06288122 tipc: fix unexpected link reset due to discovery messages
    e79d0f97cc6e ALSA: usb-audio: Relax hw constraints for implicit fb sync
    c9557906bd3b ALSA: usb-audio: Make sure to stop endpoints before closing EPs
    83e758105bc8 ASoC: wm8904: fix wrong outputs volume after power reactivation
    7c26d218729b scsi: ufs: core: WLUN suspend SSU/enter hibern8 fail recovery
    513fdf0b8e20 scsi: ufs: Stop using the clock scaling lock in the error handler
    13259b60b71b scsi: mpi3mr: Refer CONFIG_SCSI_MPI3MR in Makefile
    470f6a9175f1 regulator: da9211: Use irq handler when ready
    24107ad469df x86/resctrl: Fix task CLOSID/RMID update race
    cd3da505fb35 EDAC/device: Fix period calculation in edac_device_reset_delay_period()
    ab0d02c53a60 x86/boot: Avoid using Intel mnemonics in AT&T syntax asm
    a90d339f1f66 powerpc/imc-pmu: Fix use of mutex in IRQs disabled section
    511cf17b2447 netfilter: ipset: Fix overflow before widen in the bitmap_ip_create() function.
    b22faa21b623 sched/core: Fix use-after-free bug in dup_user_cpus_ptr()
    d766ccadbe85 iommu/mediatek-v1: Fix an error handling path in mtk_iommu_v1_probe()
    c929a230c844 iommu/iova: Fix alloc iova overflows issue
    4b51aa263ae4 usb: ulpi: defer ulpi_register on ulpi_read_id timeout
    9a8bf443f6a2 bus: mhi: host: Fix race between channel preparation and M0 event
    456e3794e08a ipv6: raw: Deduct extension header length in rawv6_push_pending_frames
    4c93422a54cd ixgbe: fix pci device refcount leak
    e97da5d97a97 platform/x86: sony-laptop: Don't turn off 0x153 keyboard backlight during probe
    f3b1e04daf86 dt-bindings: msm/dsi: Don't require vcca-supply on 14nm PHY
    52a5f596c6cc dt-bindings: msm/dsi: Don't require vdds-supply on 10nm PHY
    984ad875db80 drm/msm/dp: do not complete dp_aux_cmd_fifo_tx() if irq is not for aux transfer
    92ae83665e9e platform/x86: ideapad-laptop: Add Legion 5 15ARH05 DMI id to set_fn_lock_led_list[]
    e38b5f81dfa8 dt-bindings: msm: dsi-phy-28nm: Add missing qcom, dsi-phy-regulator-ldo-mode
    bb32ab40cb7f dt-bindings: msm: dsi-controller-main: Fix description of core clock
    3fb8d10beef9 dt-bindings: msm: dsi-controller-main: Fix power-domain constraint
    dc5b651cad66 drm/msm/adreno: Make adreno quirks not overwrite each other
    757d665ee1fe dt-bindings: msm: dsi-controller-main: Fix operating-points-v2 constraint
    c90cf47d309a platform/x86: dell-privacy: Fix SW_CAMERA_LENS_COVER reporting
    25b5f693bc2d platform/surface: aggregator: Ignore command messages not intended for us
    ee7b8ce2cc28 platform/x86: dell-privacy: Only register SW_CAMERA_LENS_COVER if present
    e0072068adaf cifs: Fix uninitialized memory read for smb311 posix symlink create
    f3495b5e9e68 net/mlx5e: Set action fwd flag when parsing tc action goto
    1a8431cc202a drm/i915/gt: Reset twice
    011ecdbcd520 drm/virtio: Fix GEM handle creation UAF
    798dfeeae33d s390/percpu: add READ_ONCE() to arch_this_cpu_to_op_simple()
    a400593eb373 s390/cpum_sf: add READ_ONCE() semantics to compare and swap loops
    d4fa65960a9d ASoC: qcom: lpass-cpu: Fix fallback SD line index handling
    8400b91c11db s390/kexec: fix ipl report address for kdump
    c07e0babd1df perf auxtrace: Fix address filter duplicate symbol selection
    e81d82da619a net: stmmac: add aux timestamps fifo clearance wait
    44167b74a8a3 docs: Fix the docs build with Sphinx 6.0
    24176bf2a145 efi: tpm: Avoid READ_ONCE() for accessing the event log
    01b966b14c6e selftests: kvm: Fix a compile error in selftests/kvm/rseq_test.c
    c773ebe11c39 KVM: arm64: nvhe: Fix build with profile optimization
    c1d6a72fc810 KVM: arm64: Fix S1PTW handling on RO memslots
    e04e6cd8830f ALSA: hda/realtek: Enable mute/micmute LEDs on HP Spectre x360 13-aw0xxx
    b983c9a9714e ALSA: hda/realtek - Turn on power early
    9ab3696881ca ALSA: control-led: use strscpy in set_led_id()
    a8acfe2c6fb9 netfilter: nft_payload: incorrect arithmetics when fetching VLAN header bits
    90bb4f8f399f Linux 5.15.88
    cbd3e6d5e516 ALSA: hda - Enable headset mic on another Dell laptop with ALC3254
    b98dee474642 ALSA: hda/hdmi: Add a HP device 0x8715 to force connect list
    26350c21bc5e ALSA: pcm: Move rwsem lock inside snd_ctl_elem_read to prevent UAF
    dadd0dcaa67d net/ulp: prevent ULP without clone op from entering the LISTEN status
    04941c1d5bb5 net: sched: disallow noqueue for qdisc classes
    068b51219362 serial: fixup backport of "serial: Deassert Transmit Enable on probe in driver-specific way"
    46aa1557581f selftests/vm/pkeys: Add a regression test for setting PKRU through ptrace
    3c1940c54922 x86/fpu: Emulate XRSTOR's behavior if the xfeatures PKRU bit is not set
    3f1c81426a9f x86/fpu: Allow PKRU to be (once again) written by ptrace.
    b29773d6b0bb x86/fpu: Add a pkru argument to copy_uabi_to_xstate()
    9813c5fc22bc x86/fpu: Add a pkru argument to copy_uabi_from_kernel_to_xstate().
    fea26e83a196 x86/fpu: Take task_struct* in copy_sigframe_from_user_to_xstate()
    d4d152017e1d parisc: Align parisc MADV_XXX constants with all other architectures

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index d4f5b1cb20..fe945f970b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "62705725902924fafa34c7bcb4c18f2e3b7d473c"
-SRCREV_meta ?= "ed03f6685c020866c2f32c4b14c4f343792146d5"
+SRCREV_machine ?= "24b6f990294dadd1dad56030bb4f044f1cc550bc"
+SRCREV_meta ?= "78c4410c172946903e35ba8cebf1cf90fad09b5a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.87"
+LINUX_VERSION ?= "5.15.89"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index a0af388e73..e3c5a3db22 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.87"
+LINUX_VERSION ?= "5.15.89"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6d10c8fe87e2037c751157ca8677588fa6e0f214"
-SRCREV_meta ?= "ed03f6685c020866c2f32c4b14c4f343792146d5"
+SRCREV_machine ?= "a615c596debf26252bbba9d03ac9eb30ed4d2819"
+SRCREV_meta ?= "78c4410c172946903e35ba8cebf1cf90fad09b5a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index a3895dde78..1154b0aa57 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "7463f1ff9674e97fa6bed05983d4828a219994d9"
-SRCREV_machine:qemuarm64 ?= "09ebb2096efb9e23a1e2c47bf1926dbae0e3f051"
-SRCREV_machine:qemumips ?= "a7058de4f88d9a7a3b3253a31bba703eaf6f78ea"
-SRCREV_machine:qemuppc ?= "e43b0b8b142f689bc2e2297a5ca221fb0f802eb5"
-SRCREV_machine:qemuriscv64 ?= "9768cdc48a9d6cdd9ce0aedc0037d45cfb3f1665"
-SRCREV_machine:qemuriscv32 ?= "9768cdc48a9d6cdd9ce0aedc0037d45cfb3f1665"
-SRCREV_machine:qemux86 ?= "9768cdc48a9d6cdd9ce0aedc0037d45cfb3f1665"
-SRCREV_machine:qemux86-64 ?= "9768cdc48a9d6cdd9ce0aedc0037d45cfb3f1665"
-SRCREV_machine:qemumips64 ?= "75a87ddede429ee1070118f54d38183ee4c81b59"
-SRCREV_machine ?= "9768cdc48a9d6cdd9ce0aedc0037d45cfb3f1665"
-SRCREV_meta ?= "ed03f6685c020866c2f32c4b14c4f343792146d5"
+SRCREV_machine:qemuarm ?= "d624f7bdbfcfc826f4482e860698d4b7eb9bdbbe"
+SRCREV_machine:qemuarm64 ?= "2c4a0624a2de2f262d8c86729e5fa15fc1e57fcc"
+SRCREV_machine:qemumips ?= "99b36760d2ae2c97b9a300f2a9baf70f4d6aee8d"
+SRCREV_machine:qemuppc ?= "7e2d97348966a55d5c4fcfd5bff9b2959becf2c8"
+SRCREV_machine:qemuriscv64 ?= "d925567cd9aafb12f3d4e2d5ff7880795002257e"
+SRCREV_machine:qemuriscv32 ?= "d925567cd9aafb12f3d4e2d5ff7880795002257e"
+SRCREV_machine:qemux86 ?= "d925567cd9aafb12f3d4e2d5ff7880795002257e"
+SRCREV_machine:qemux86-64 ?= "d925567cd9aafb12f3d4e2d5ff7880795002257e"
+SRCREV_machine:qemumips64 ?= "574cd19f6aa1dc13e1b32d6197516f9859666d99"
+SRCREV_machine ?= "d925567cd9aafb12f3d4e2d5ff7880795002257e"
+SRCREV_meta ?= "78c4410c172946903e35ba8cebf1cf90fad09b5a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d57287729e229188e7d07ef0117fe927664e08cb"
+SRCREV_machine:class-devupstream ?= "3bcc86eb3ed952c22ceecce8932dde72ea01f8cc"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.87"
+LINUX_VERSION ?= "5.15.89"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


