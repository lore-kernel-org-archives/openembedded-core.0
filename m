Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web12.9372.1605626697455822203
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:24:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=E5Vejr3k;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id a15so8585027qvk.5
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 07:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uhsc8skJT9DesatTvn5RFMQS5ezbQEG/8yTgPKkxyB8=;
        b=E5Vejr3klSJnYbo9lPIJy3fu6Se5oeGuz576bvnU9IVJwBbsGy3dRBnnM67rLGb4jg
         GwHnXy4QOCxU362NVcDIagnhuJD8oebWtBOFgfkSoGD6qoat4RWmYkiLglyRfaRoz7lS
         OnloEB4YCU6SQcuvKlsx7l0Hg9/8eK/5OwqUoPNWJEgbTHDZPnIYVoWqf81k8JstF6Yh
         /AX7z/W4P/Btwi54EX3YCiK6E594ApNpfKEoJdPPlZ/RfrMTFlx1O8EvzrE9+wdT6ozU
         u0C/Xn2z0ktLpe6DzINLF8WX9uKnILcG3LoCt9EBY2lmTL2elntVlmduOYxRJ7dlh3nG
         IYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uhsc8skJT9DesatTvn5RFMQS5ezbQEG/8yTgPKkxyB8=;
        b=APUHCTYJ6046bWY7d+PxoafE9z0tGh3Ok5EoefqQDd1G0JsIYPbhb+ljKIw7UaDcjn
         /HNCSHkcZxbAWRJtkXruEsFX3wLki6kbki/BhBWM5vp4Hr1aYzdL1kAOU4V/zFOHOv+/
         SdjCuXZbBr6h2RgsqJJptt3auHN95JKx6uIWzyHULFV+I+9JKrlyjRKeRHkLGZP9uCzw
         QeHm4kYNvQ0YrPcBHll53QM/78Etz5iRUisV2avqazuBsHbwDO/GgETpm/4C+ip2I8Mb
         eseX316Q5pJzKBRhRUBb8KNs1Rg+3uoWLWIvKqMSb+SRN8SxF2SzmhOfuhz2FzKSqwlL
         6eOg==
X-Gm-Message-State: AOAM530ewarK8MddS/gk0t1nwMLVv6Mu5V9G32jASMt1KT6iGtnZSI7E
	A9Vd7eVo3E0ygkZQ74k3Zsw=
X-Google-Smtp-Source: ABdhPJx94d+oPLl6COdbDbLDI3ZZGTzph7Bm2pJxIMRzPDm/sA29gSNMVZAFbMJ+L8KkYbHIyzv8uQ==
X-Received: by 2002:a0c:a261:: with SMTP id f88mr21428633qva.56.1605626694919;
        Tue, 17 Nov 2020 07:24:54 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u24sm14537923qtb.33.2020.11.17.07.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 07:24:53 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/11] linux-yocto/5.8: update to v5.8.18
Date: Tue, 17 Nov 2020 10:24:36 -0500
Message-Id: <b6ceaf9c8bca9f93d88085337ad69f404758cfac.1605626488.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1605626488.git.bruce.ashfield@gmail.com>
References: <cover.1605626488.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.8 to the latest korg -stable release that comprises
the following commits:

    ab435ce49bd1 Linux 5.8.18
    4a5649e0d379 phy: marvell: comphy: Convert internal SMCC firmware return codes to errno
    b8049438969b misc: rtsx: do not setting OC_POWER_DOWN reg in rtsx_pci_init_ocp()
    ad9ee9ce9d68 openrisc: Fix issue with get_user for 64-bit values
    f594998331bc xen/gntdev.c: Mark pages as dirty
    67e326e4f5df ata: sata_rcar: Fix DMA boundary mask
    f6b94060a123 PM: runtime: Fix timer_expires data type on 32-bit arches
    53faca2f4ca3 serial: pl011: Fix lockdep splat when handling magic-sysrq interrupt
    e3f6c126a3f7 serial: qcom_geni_serial: To correct QUP Version detection logic
    8f924c0a5665 drm/i915/gem: Serialise debugfs i915_gem_objects with ctx->mutex
    241bd102e337 mtd: lpddr: Fix bad logic in print_drs_error
    5868beda60c8 RDMA/addr: Fix race with netevent_callback()/rdma_addr_cancel()
    a8069b80a1fb cxl: Rework error message for incompatible slots
    9f9dc704c8cd p54: avoid accessing the data mapped to streaming DMA
    9f4ef6a90c1b evm: Check size of security.evm before using it
    a42b1273af73 bpf: Fix comment for helper bpf_current_task_under_cgroup()
    07d54b8dc56e fuse: fix page dereference after free
    78453a7dbb1a ata: ahci: mvebu: Make SATA PHY optional for Armada 3720
    4752a1313463 PCI: aardvark: Fix initialization with old Marvell's Arm Trusted Firmware
    b9cc04b049d8 x86/xen: disable Firmware First mode for correctable memory errors
    ea4e8cf5072e x86/traps: Fix #DE Oops message regression
    085f6be2fe88 arch/x86/amd/ibs: Fix re-arming IBS Fetch
    b4818cfc3f9c erofs: avoid duplicated permission check for "trusted." xattrs
    3a9e7db9a40e net: protect tcf_block_unbind with block lock
    af5d5b8afd12 tipc: fix memory leak caused by tipc_buf_append()
    519366f64c27 tcp: Prevent low rmem stalls with SO_RCVLOWAT.
    9ceecfdba701 ravb: Fix bit fields checking in ravb_hwtstamp_get()
    fa67cc69a8c8 r8169: fix issue with forced threading in combination with shared interrupts
    62d9cec6f928 net/sched: act_mpls: Add softdep on mpls_gso.ko
    2bc5d5c373ef net: ipa: command payloads already mapped
    1336d288b353 net: hns3: Clear the CMDQ registers before unmapping BAR region
    7fb8fbceb0e3 netem: fix zero division in tabledist
    25259932e1bb mlxsw: core: Fix memory leak on module removal
    d6f6e3f97885 ibmvnic: fix ibmvnic_set_mac
    4606d3512043 ibmveth: Fix use of ibmveth in a bridge.
    b520e574fdbf gtp: fix an use-before-init in gtp_newlink()
    9921e777a347 cxgb4: set up filter action after rewrites
    b97638e0f3be chelsio/chtls: fix tls record info to user
    eb592f2ae478 chelsio/chtls: fix memory leaks in CPL handlers
    c3208dec446a chelsio/chtls: fix deadlock issue
    b334112f20b7 bnxt_en: Send HWRM_FUNC_RESET fw command unconditionally.
    f739fc7e1072 bnxt_en: Re-write PCI BARs after PCI fatal error.
    7fe9514cfe68 bnxt_en: Invoke cancel_delayed_work_sync() for PFs also.
    bfbbfb501e74 bnxt_en: Fix regression in workqueue cleanup logic in bnxt_remove_one().
    0b17de4d67bf bnxt_en: Check abort error state in bnxt_open_nic().
    c328793e21fb efivarfs: Replace invalid slashes with exclamation marks in dentries.
    61ececc85274 x86/copy_mc: Introduce copy_mc_enhanced_fast_string()
    a092869e0351 x86, powerpc: Rename memcpy_mcsafe() to copy_mc_to_{user, kernel}()
    18703f749e99 x86/PCI: Fix intel_mid_pci.c build error when ACPI is not enabled
    4b0a9591dd78 arm64: link with -z norelro regardless of CONFIG_RELOCATABLE
    dfaa0f7d0832 arm64: Run ARCH_WORKAROUND_2 enabling code on all CPUs
    0ccd5c2c60e0 arm64: Run ARCH_WORKAROUND_1 enabling code on all CPUs
    4720b25e4ca3 fs/kernel_read_file: Remove FIRMWARE_EFI_EMBEDDED enum
    8b23af0ef2f7 efi/arm64: libstub: Deal gracefully with EFI_RNG_PROTOCOL failure
    865013fcf4c3 scripts/setlocalversion: make git describe output more reliable
    6f4c9772e195 io_uring: Convert advanced XArray uses to the normal API
    f7b24bee5e6e io_uring: Fix XArray usage in io_uring_add_task_file
    efce965a49f1 io_uring: Fix use of XArray in __io_uring_files_cancel
    5ee3fea0c227 io_uring: no need to call xa_destroy() on empty xarray
    0ca6ce23f4f6 io-wq: fix use-after-free in io_wq_worker_running
    4863be653425 io_wq: Make io_wqe::lock a raw_spinlock_t
    b6a6d1df552b io_uring: reference ->nsproxy for file table commands
    511abceaf0a0 io_uring: don't rely on weak ->files references
    fdc84c9bf131 io_uring: enable task/files specific overflow flushing
    3de61f9bcc1c io_uring: return cancelation status from poll/timeout/files handlers
    f34e674fbe6d io_uring: unconditionally grab req->task
    bf0305989241 io_uring: stash ctx task reference for SQPOLL
    dd1acc182c85 io_uring: move dropping of files into separate helper
    cecf78cc0890 io_uring: allow timeout/poll/files killing to take task into account
    07463d7da999 io_uring: don't run task work on an exiting task
    6e1f770fbc0a netfilter: nftables_offload: KASAN slab-out-of-bounds Read in nft_flow_rule_create

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index d0f3ecb8c8..203ddf6684 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_meta ?= "d5ca337b7e9b5834c83b629b5456bb4744efa644"
+SRCREV_machine ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.8.17"
+LINUX_VERSION ?= "5.8.18"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 536bc26c5e..f37f525cc3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.8.17"
+LINUX_VERSION ?= "5.8.18"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "c548e45d83f9cdf224d2a7e318d68aecf390f3bd"
-SRCREV_machine ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_meta ?= "d5ca337b7e9b5834c83b629b5456bb4744efa644"
+SRCREV_machine_qemuarm ?= "aa614dcf182db126013b255968ab125afd96eb88"
+SRCREV_machine ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index c468170968..c0cdffce73 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "3bb879f7650c06b97ee4d4b496d33bb5d62a4679"
-SRCREV_machine_qemuarm64 ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_machine_qemumips ?= "6dd61d0707b17293a472f5717acb68d5a86e1e4d"
-SRCREV_machine_qemuppc ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_machine_qemuriscv64 ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_machine_qemux86 ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_machine_qemux86-64 ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_machine_qemumips64 ?= "a92b9df163d6e6b05bf1e7137d6868760537f326"
-SRCREV_machine ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_meta ?= "d5ca337b7e9b5834c83b629b5456bb4744efa644"
+SRCREV_machine_qemuarm ?= "cd6c8c74317d2f9504c25e28e37f4140deec2d19"
+SRCREV_machine_qemuarm64 ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_machine_qemumips ?= "c610a204d0821f5abc253e72894fd32b41b92db3"
+SRCREV_machine_qemuppc ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_machine_qemuriscv64 ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_machine_qemux86 ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_machine_qemux86-64 ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_machine_qemumips64 ?= "86cc0d9a3f6751ada12fa4630b3e3c23221d6da7"
+SRCREV_machine ?= "64fd51cbe98ae4a0e05e59ed9abd9135f1b4cf64"
+SRCREV_meta ?= "7883b60d324029d26020c0b3f826b35c52fd9674"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.8.17"
+LINUX_VERSION ?= "5.8.18"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

