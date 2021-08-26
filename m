Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web12.31219.1629987828916114048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 07:23:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FUahpYJL;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id b64so3641793qkg.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 07:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HSrFDejwnQhRC9avs5z2m2GNIXvdqKS1nggPSpTYYF8=;
        b=FUahpYJLXXwFDetwXjIlAjumjFiDGyo3zf6BjyNoEzIDmPqxJpeJqs2956iQRoRo7l
         5xcdc41ilTkE8t+YniYBQ4Rf6D7mAW4gZsMLT+5Y8fpxz6FZ1nF+dSRXG95P6yGtptgj
         C1Lpuz2Fzz2qYqk7OfUFjIm+cfCT+s8o97EtiuCeQWL+EyyO3qy3MnYpDG2RbKNbKemG
         mYh/oWJblRCcBNMPkixo40Lg0i/nPze4p7BX8bZ1tXBPMZ7/qwJTSZrkYs30btzUsSn9
         4G5l91auN62KB3EKQWnafRzS9y4JjciRN0/Qq6R9C5Kx39fsusHl+vXLMCnGSgx8Ohcw
         YE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HSrFDejwnQhRC9avs5z2m2GNIXvdqKS1nggPSpTYYF8=;
        b=KomxSkqv0r3M8h7s5eNoIdKLIQcF1DjwJR+d7514QXZ6QzCdTgBlXRlNppNyGMmuYc
         xGherEA+B1DBYipuE/2iQBH8cWY5NsqLLp5HvkobsceeVblQfuDhPUQcH+pCCH10mMJ4
         XPdniRijSJUyT8NMtYCj3+//Ed9qjfVJbFZJWimY2iwnj1MRKyyd99b07XKvU2kGIf6z
         SO3FUcgWTQMq4cjxePfaZ9oWjLDTp9d6LKpMt4+rtRvBAXTSdzVRN9EbcUEacuE2WULN
         qJEG1Za6VleLdbcQ9H4QvhkBhKbYVRKyQ7BQsiBV5Jsa30i0IlcXpqtmqyD1A/kKcTy2
         iGEg==
X-Gm-Message-State: AOAM533+qAzWlEReQX6URHf+F1uX3/v2hupTCCWsVzrjrq1QKSdxUes6
	cJvY4b6I8fOl3MetW5xPfBwBWLli6xQ6Kw==
X-Google-Smtp-Source: ABdhPJy3MItEqVXiU/zSGwL/f7iGWWItiQ8l81C47Moyjv7OhqnIQThw1bFSYh1dr20VU1X49BqUgg==
X-Received: by 2002:a05:620a:79b:: with SMTP id 27mr3985702qka.248.1629987827909;
        Thu, 26 Aug 2021 07:23:47 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id q10sm2676124qke.108.2021.08.26.07.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 07:23:47 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/5.10: update to v5.10.60
Date: Thu, 26 Aug 2021 10:23:41 -0400
Message-Id: <c650b54e3d924ac1c4010d5c8fe118db60f62ef1.1629987648.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1629987648.git.bruce.ashfield@gmail.com>
References: <cover.1629987648.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    2c5bd949b1df Linux 5.10.60
    3a24e121304a net: dsa: microchip: ksz8795: Use software untagging on CPU port
    1e78179d75fb net: dsa: microchip: ksz8795: Fix VLAN untagged flag change on deletion
    5033d5e23155 net: dsa: microchip: ksz8795: Reject unsupported VLAN configuration
    60c007b52779 net: dsa: microchip: ksz8795: Fix PVID tag insertion
    f365d53c8687 net: dsa: microchip: Fix probing KSZ87xx switch with DT node for host port
    3dc5666baf2a KVM: nSVM: always intercept VMLOAD/VMSAVE when nested (CVE-2021-3656)
    c0883f693187 KVM: nSVM: avoid picking up unsupported bits from L2 in int_ctl (CVE-2021-3653)
    b5f05bdfda28 vmlinux.lds.h: Handle clang's module.{c,d}tor sections
    2fe07584a623 ceph: take snap_empty_lock atomically with snaprealm refcount change
    a23aced54c2c ceph: clean up locking annotation for ceph_get_snap_realm and __lookup_snap_realm
    b0efc93271ca ceph: add some lockdep assertions around snaprealm handling
    dcdb587ac470 vboxsf: Add support for the atomic_open directory-inode op
    7cd14c1a7fed vboxsf: Add vboxsf_[create|release]_sf_handle() helpers
    433f0b31ebec KVM: nVMX: Use vmx_need_pf_intercept() when deciding if L0 wants a #PF
    0ab67e3dfc4d KVM: VMX: Use current VMCS to query WAITPKG support for MSR emulation
    4a948c579ed6 efi/libstub: arm64: Double check image alignment at entry
    fc7da433fa16 powerpc/smp: Fix OOPS in topology_init()
    312730cd15e0 PCI/MSI: Protect msi_desc::masked for multi-MSI
    724d0a985086 PCI/MSI: Use msi_mask_irq() in pci_msi_shutdown()
    923368751866 PCI/MSI: Correct misleading comments
    e42fb8e6161e PCI/MSI: Do not set invalid bits in MSI mask
    042e03c9cdab PCI/MSI: Enforce MSI[X] entry updates to be visible
    0b2509d7a90c PCI/MSI: Enforce that MSI-X table entry is masked for update
    aa8092c1d1f1 PCI/MSI: Mask all unused MSI-X entries
    7e90e81a4b59 PCI/MSI: Enable and mask MSI-X early
    2d2c66848027 genirq/timings: Prevent potential array overflow in __irq_timings_store()
    355754194b48 genirq/msi: Ensure deactivation on teardown
    f0736bed18fb x86/resctrl: Fix default monitoring groups reporting
    25216ed97da8 x86/ioapic: Force affinity setup before startup
    19fb5dabedca x86/msi: Force affinity setup before startup
    4e52a4fe6f44 genirq: Provide IRQCHIP_AFFINITY_PRE_STARTUP
    2a28b52306f2 x86/tools: Fix objdump version check again
    4acc0d987141 powerpc/kprobes: Fix kprobe Oops happens in booke
    015e2c900b5d efi/libstub: arm64: Relax 2M alignment again for relocatable kernels
    feb4a01d3ece efi/libstub: arm64: Force Image reallocation if BSS was not reserved
    afcb84e6cf8c arm64: efi: kaslr: Fix occasional random alloc (and boot) failure
    e0ee8d9c31b5 nbd: Aovid double completion of a request
    f5cefe9a52a6 vsock/virtio: avoid potential deadlock when vsock device remove
    dff830e5e723 xen/events: Fix race in set_evtchn_to_irq
    65395b053d03 drm/i915: Only access SFC_DONE when media domain is not fused off
    4344440d91b3 net: igmp: increase size of mr_ifc_count
    696afe28dc51 tcp_bbr: fix u32 wrap bug in round logic if bbr_init() called after 2B packets
    8976606ca347 net: linkwatch: fix failure to restore device state across suspend/resume
    4c2af90119ea net: bridge: fix memleak in br_add_if()
    f333a5ca71c3 net: bridge: fix flags interpretation for extern learn fdb entries
    e3b949b86d09 net: bridge: validate the NUD_PERMANENT bit when adding an extern_learn FDB entry
    1cad01aca1fa net: dsa: sja1105: fix broken backpressure in .port_fdb_dump
    56cc3408ff2a net: dsa: lantiq: fix broken backpressure in .port_fdb_dump
    f7720b35cd32 net: dsa: lan9303: fix broken backpressure in .port_fdb_dump
    24e1b7dbb174 net: igmp: fix data-race in igmp_ifc_timer_expire()
    69b13167a636 net: Fix memory leak in ieee802154_raw_deliver
    dbfaf7a6a23a net: dsa: microchip: ksz8795: Fix VLAN filtering
    ccc1fe82c878 net: dsa: microchip: Fix ksz_read64()
    558092b8ed31 drm/meson: fix colour distortion from HDR set during vendor u-boot
    6e1886465dea net/mlx5: Fix return value from tracer initialization
    303ba011f5e1 net/mlx5: Synchronize correct IRQ when destroying CQ
    00a0c11ddd72 bareudp: Fix invalid read beyond skb's linear data
    30b1fc47f765 psample: Add a fwd declaration for skbuff
    b3f0b170842c iavf: Set RSS LUT and key in reset handle path
    a6192bae12e4 ice: don't remove netdev->dev_addr from uc sync list
    bae5b521feaa ice: Prevent probing virtual functions
    059238c52c61 net: sched: act_mirred: Reset ct info when mirror/redirect skb
    f15f7716b047 net/smc: fix wait on already cleared link
    51f4965d775e ppp: Fix generating ifname when empty IFLA_IFNAME is specified
    046579c9fc28 net: phy: micrel: Fix link detection on ksz87xx switch"
    e95620c3bdff bpf: Fix integer overflow involving bucket_size
    1960c3ac5268 libbpf: Fix probe for BPF_PROG_TYPE_CGROUP_SOCKOPT
    a3e9a3e22844 platform/x86: pcengines-apuv2: Add missing terminating entries to gpio-lookup tables
    53ebbfdd0e37 net: mvvp2: fix short frame size on s390
    784320edb6c5 net: dsa: mt7530: add the missing RxUnicast MIB counter
    20a80319028c ASoC: cs42l42: Fix LRCLK frame start edge
    750503aecf4e pinctrl: tigerlake: Fix GPIO mapping for newer version of software
    be49d5437d1a netfilter: nf_conntrack_bridge: Fix memory leak when error
    aa6b17bfefbc ASoC: cs42l42: Remove duplicate control for WNF filter frequency
    b268f9f6b73f ASoC: cs42l42: Fix inversion of ADC Notch Switch control
    2386a8cde18e ASoC: SOF: Intel: hda-ipc: fix reply size checking
    0e47f99e8680 ASoC: cs42l42: Don't allow SND_SOC_DAIFMT_LEFT_J
    576939671f74 ASoC: cs42l42: Correct definition of ADC Volume control
    a21963c35f16 pinctrl: mediatek: Fix fallback behavior for bias_set_combo
    27188a938291 ieee802154: hwsim: fix GPF in hwsim_new_edge_nl
    528f17c02db9 ieee802154: hwsim: fix GPF in hwsim_set_edge_lqi
    95de3592f87e drm/amdgpu: don't enable baco on boco platforms in runpm
    bd80d11a516c drm/amd/display: use GFP_ATOMIC in amdgpu_dm_irq_schedule_work
    ae311a7418f1 drm/amd/display: Remove invalid assert for ODM + MPC case
    c2351e5faa3e libnvdimm/region: Fix label activation vs errors
    366de90ccfa2 ACPI: NFIT: Fix support for virtual SPA ranges
    f3fcf9d1b759 ceph: reduce contention in ceph_check_delayed_caps()
    ca6dea44bd8c ARC: fp: set FPU_STATUS.FWE to enable FPU_STATUS update on context switch
    4716a2145bbf net: ethernet: ti: cpsw: fix min eth packet size for non-switch use-cases
    561d13128bb8 seccomp: Fix setting loaded filter count during TSYNC
    54916988a0fb scsi: lpfc: Move initialization of phba->poll_list earlier to avoid crash
    3db5cb922800 cifs: create sd context must be a multiple of 8
    d1398e3715b1 i2c: dev: zero out array used for i2c reads from userspace
    b8bceace43dd ASoC: intel: atom: Fix reference to PCM buffer address
    261613ef340b ASoC: tlv320aic31xx: Fix jack detection after suspend
    7e5a7fa68b27 ASoC: uniphier: Fix reference to PCM buffer address
    209eb62b45fe ASoC: xilinx: Fix reference to PCM buffer address
    c419c4c91b30 ASoC: amd: Fix reference to PCM buffer address
    0c9adae11701 iio: adc: Fix incorrect exit of for-loop
    632279e5057c iio: humidity: hdc100x: Add margin to the conversion time
    45de224b1332 iio: adis: set GPIO reset pin direction
    d0532ed064d1 iio: adc: ti-ads7950: Ensure CS is deasserted after reading channels

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 6e9b83f7ea..d1100817df 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "459fd323295a5bb19d8ccec0e29dd9d2ba367d81"
-SRCREV_meta ?= "8b02c1cd3424cee6f8d251be8fce9999e59fcf4e"
+SRCREV_machine ?= "c8efa3efd890f35f8037a8c3533ba52e6de83fdf"
+SRCREV_meta ?= "bce2813b162bb472c137fb503951295a931c25b6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.59"
+LINUX_VERSION ?= "5.10.60"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index f5e01f4e69..b2af273aa6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.59"
+LINUX_VERSION ?= "5.10.60"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "124fe0804bda0a51267a847c8e9578630fdbbc99"
-SRCREV_machine ?= "d2ff9c7472c1c748425c04d01e4a682501a0945c"
-SRCREV_meta ?= "8b02c1cd3424cee6f8d251be8fce9999e59fcf4e"
+SRCREV_machine:qemuarm ?= "ffaf70463da1502399f192470dae2d2fbdc7cfbc"
+SRCREV_machine ?= "f92b026dba8bd4e55a5cc88b6231f9118a6ac26b"
+SRCREV_meta ?= "bce2813b162bb472c137fb503951295a931c25b6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 3702d10dff..f1fe87abda 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0978a83dfdb5b685cb0bf102c806a768afb87ae9"
-SRCREV_machine:qemuarm64 ?= "4419f5b76905d079459659e22e68206295461cc4"
-SRCREV_machine:qemumips ?= "258e3d3c45063749d28d8c5f0be7f7de7a7a9a07"
-SRCREV_machine:qemuppc ?= "9b76cd9298382a9d1f49297a094def200504da38"
-SRCREV_machine:qemuriscv64 ?= "0e615f60692e56f2f0c68c1560c95804b8d9b6cf"
-SRCREV_machine:qemuriscv32 ?= "0e615f60692e56f2f0c68c1560c95804b8d9b6cf"
-SRCREV_machine:qemux86 ?= "0e615f60692e56f2f0c68c1560c95804b8d9b6cf"
-SRCREV_machine:qemux86-64 ?= "0e615f60692e56f2f0c68c1560c95804b8d9b6cf"
-SRCREV_machine:qemumips64 ?= "35aae8ce2453e7c72c933ec7b61df88b2dc49d55"
-SRCREV_machine ?= "0e615f60692e56f2f0c68c1560c95804b8d9b6cf"
-SRCREV_meta ?= "8b02c1cd3424cee6f8d251be8fce9999e59fcf4e"
+SRCREV_machine:qemuarm ?= "1d02041bcc6eb8969d832e89b5c893d717b7ed04"
+SRCREV_machine:qemuarm64 ?= "2675ef4d9aefc588d16d085718866a33c62c10e6"
+SRCREV_machine:qemumips ?= "b503b2da9b2487453a9d9b0fa99654f00e1ad311"
+SRCREV_machine:qemuppc ?= "4ef9462af524cbbfcb719304a923e51f88cc3e68"
+SRCREV_machine:qemuriscv64 ?= "65ba2a0d8428c23b7b4375994d417157a35a251b"
+SRCREV_machine:qemuriscv32 ?= "65ba2a0d8428c23b7b4375994d417157a35a251b"
+SRCREV_machine:qemux86 ?= "65ba2a0d8428c23b7b4375994d417157a35a251b"
+SRCREV_machine:qemux86-64 ?= "65ba2a0d8428c23b7b4375994d417157a35a251b"
+SRCREV_machine:qemumips64 ?= "2d0707a62d33b1626329fde6ed9e906f5aba3022"
+SRCREV_machine ?= "65ba2a0d8428c23b7b4375994d417157a35a251b"
+SRCREV_meta ?= "bce2813b162bb472c137fb503951295a931c25b6"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.59"
+LINUX_VERSION ?= "5.10.60"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

