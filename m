Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web09.17316.1629907587619684990
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 09:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BOvzqT/6;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id a5so262061qvq.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 09:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZpljhagIFsjyHoAbKMUj7/Th1BFnU7NKftD40T5JW2U=;
        b=BOvzqT/6iQ/Wub6ytcwxtbVOxKj5uwmfXyjKFLmH8palrZV6l6zDOQGtPSo+YntmkK
         MmZpxE1yIgx6RuB67G7oFWbQlYBhVoY69hUbXW73HmkwpWAx65t9T8N5ut6bn7C0/jkB
         pMQJs3rAgJUZ7WVaBxujdsXhAYMPKmo4UnxGIU9n6r8SnOGi4jyxmk8tvYZB1I9UHUhW
         1JBLfH/AwVDHBUAeBwBwSmu6/h03X/OQWQW7nvijkRNm3ziAdgbEbAfnw8rLMmqnL8+b
         ni8wCMHekXx0SXwIDkioXQdPk05ZixdElz7LLC4lhQ5z9U81K4iNephPerpyJ/J9TnPi
         ZlnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZpljhagIFsjyHoAbKMUj7/Th1BFnU7NKftD40T5JW2U=;
        b=CFhZ/A8L65JHTNkrxgSZhB0wX57uLHU1zPcWlZiKFkMgbkAKbQjT24wshz3quaR6rR
         VGhyy1PWb1qCwY+gFxn3Wlb4KKdfpm7+fM4GXCnUxyHwtkgEbxVhQyQFc5qq+p9wa3ur
         a8Q5HPhHw0r3mqPnxlfoEp816WWOaUR+E+aVImpSVTHz8WNd9KkoHjXOEiQgX7TsEOEE
         hJZ6AqWLK1UPhCZbWDuJDVSmbv8Ugf3YfBIbRAxyj0SyQDmY7AdNMC/xdsNIRalp6+Nf
         XVTbRbah8+LS8lv/G9n29u3EeSxwo3J8ZNHdqHSFXgYJxx6grdCbFjZm+wobuHgO41l6
         FPJg==
X-Gm-Message-State: AOAM533ejme77LmQWJXzS9XE1Isadz6aY4YJlsql/yA2EbtcmDLM4ODc
	Si47ysGeay29dwpiTxHvCvA2N6Ka3jhm5Q==
X-Google-Smtp-Source: ABdhPJyhruHEgDZ8/zEE4sUhjN1wwxH8H7TXF8F9O/SGliq/k8GW+kksapNEForr89qeX1V7211u4g==
X-Received: by 2002:a0c:c707:: with SMTP id w7mr45594212qvi.14.1629907586638;
        Wed, 25 Aug 2021 09:06:26 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id n11sm312992qkk.17.2021.08.25.09.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 09:06:26 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/5.13: update to v5.13.12
Date: Wed, 25 Aug 2021 12:06:20 -0400
Message-Id: <4adc82371c910a3415c7bafd28853a63457380eb.1629907508.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1629907508.git.bruce.ashfield@gmail.com>
References: <cover.1629907508.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.13 to the latest korg -stable release that comprises
the following commits:

    f428e49b8cb1 Linux 5.13.12
    639a033fd765 KVM: nSVM: always intercept VMLOAD/VMSAVE when nested (CVE-2021-3656)
    a0949ee63cf9 KVM: nSVM: avoid picking up unsupported bits from L2 in int_ctl (CVE-2021-3653)
    874213144352 kasan, slub: reset tag when printing address
    ac0e79584d41 ceph: take snap_empty_lock atomically with snaprealm refcount change
    dcd02a1248cc ceph: clean up locking annotation for ceph_get_snap_realm and __lookup_snap_realm
    36b361cb1966 ceph: add some lockdep assertions around snaprealm handling
    90d215367156 KVM: x86/mmu: Protect marking SPs unsync when using TDP MMU with spinlock
    0f4bf029494d KVM: x86/mmu: Don't leak non-leaf SPTEs when zapping all SPTEs
    bd043e754f4d KVM: nVMX: Use vmx_need_pf_intercept() when deciding if L0 wants a #PF
    1163cd462e1f KVM: VMX: Use current VMCS to query WAITPKG support for MSR emulation
    a3040e7e9ff2 locking/rtmutex: Use the correct rtmutex debugging config option
    b636a0d1e5c8 efi/libstub: arm64: Double check image alignment at entry
    0e1d1392f381 powerpc/32: Fix critical and debug interrupts on BOOKE
    4ce6f022df43 powerpc/xive: Do not skip CPU-less nodes when creating the IPIs
    3b1700551dee powerpc/smp: Fix OOPS in topology_init()
    115ff78c3a03 powerpc/32s: Fix napping restore in data storage interrupt (DSI)
    3eda59bcee6e powerpc/pseries: Fix update of LPAR security flavor after LPM
    33971cedf1d9 powerpc/interrupt: Do not call single_step_exception() from other exceptions
    11aa5db61e9b PCI/MSI: Protect msi_desc::masked for multi-MSI
    b82047e5d807 PCI/MSI: Use msi_mask_irq() in pci_msi_shutdown()
    849b6a5bde32 PCI/MSI: Correct misleading comments
    ea6cc94e8807 PCI/MSI: Do not set invalid bits in MSI mask
    78225ed700df PCI/MSI: Enforce MSI[X] entry updates to be visible
    0b51d4c16a27 PCI/MSI: Enforce that MSI-X table entry is masked for update
    6c971252f090 PCI/MSI: Mask all unused MSI-X entries
    f800bb380fea PCI/MSI: Enable and mask MSI-X early
    73d8b5769514 powerpc/interrupt: Fix OOPS by not calling do_IRQ() from timer_interrupt()
    9dac5f65caaf genirq/timings: Prevent potential array overflow in __irq_timings_store()
    0c081d4a6a13 genirq/msi: Ensure deactivation on teardown
    0abb63311246 x86/resctrl: Fix default monitoring groups reporting
    55cd80f4928c x86/ioapic: Force affinity setup before startup
    067ef0204880 x86/msi: Force affinity setup before startup
    24ed8f291d59 genirq: Provide IRQCHIP_AFFINITY_PRE_STARTUP
    560051d8f439 x86/tools: Fix objdump version check again
    d8f9d8c4be6e i2c: iproc: fix race between client unreg and tasklet
    daf371e74d36 powerpc/kprobes: Fix kprobe Oops happens in booke
    2bfb303470e0 efi/libstub: arm64: Relax 2M alignment again for relocatable kernels
    bfc48d02d915 efi/libstub: arm64: Force Image reallocation if BSS was not reserved
    f3409e925da2 KVM: arm64: Fix off-by-one in range_is_memory
    14034883d058 arm64: efi: kaslr: Fix occasional random alloc (and boot) failure
    98f73989055f nbd: Aovid double completion of a request
    09625c5badd2 vsock/virtio: avoid potential deadlock when vsock device remove
    128e480afe78 xen/events: Fix race in set_evtchn_to_irq
    950429a4d346 drm/i915: Only access SFC_DONE when media domain is not fused off
    9977d0baadc8 net: igmp: increase size of mr_ifc_count
    4391389526a1 tcp_bbr: fix u32 wrap bug in round logic if bbr_init() called after 2B packets
    53201f2902ee net: linkwatch: fix failure to restore device state across suspend/resume
    59cabc513b8a net: bridge: fix memleak in br_add_if()
    ff6c9aad3599 net: bridge: fix flags interpretation for extern learn fdb entries
    c7c9cc4a6016 pinctrl: sunxi: Don't underestimate number of functions
    735e90f3efa6 net: dsa: sja1105: fix broken backpressure in .port_fdb_dump
    8398aab49ba3 net: dsa: lantiq: fix broken backpressure in .port_fdb_dump
    c6cbf5672cc0 net: dsa: lan9303: fix broken backpressure in .port_fdb_dump
    22ecb3423f9c net: dsa: hellcreek: fix broken backpressure in .port_fdb_dump
    52133524d807 net: igmp: fix data-race in igmp_ifc_timer_expire()
    44c8aa996911 net: Fix memory leak in ieee802154_raw_deliver
    74b264b342a5 net: dsa: microchip: ksz8795: Don't use phy_port_cnt in VLAN table lookup
    1c4f28207fab net: dsa: microchip: ksz8795: Fix VLAN filtering
    3cc015794dab net: dsa: microchip: ksz8795: Use software untagging on CPU port
    9674dc6724c5 net: dsa: microchip: ksz8795: Fix VLAN untagged flag change on deletion
    159948c423aa net: dsa: microchip: ksz8795: Reject unsupported VLAN configuration
    3149f9edddf9 net: dsa: microchip: ksz8795: Fix PVID tag insertion
    8154453a4be5 net: dsa: microchip: Fix ksz_read64()
    037570c9adab bpf: Fix potentially incorrect results with bpf_get_local_storage()
    1d1808fae2e0 ovl: fix deadlock in splice write
    75004b47fba4 drm/meson: fix colour distortion from HDR set during vendor u-boot
    11e249ce5e3e net/mlx5: Fix return value from tracer initialization
    436f4a1c6d17 net/mlx5: Synchronize correct IRQ when destroying CQ
    9b0b9c9da810 net/mlx5e: TC, Fix error handling memory leak
    89163e392e57 net/mlx5: Block switchdev mode while devlink traps are active
    09ab613d4996 net/mlx5e: Destroy page pool after XDP SQ to fix use-after-free
    c0cb7d8be945 net/mlx5e: Avoid creating tunnel headers for local route
    3f20768c9fdc net/mlx5: DR, Add fail on error check on decap
    df712c5d591a net/mlx5: Don't skip subfunction cleanup in case of error in module init
    f49d457950b9 io-wq: fix IO_WORKER_F_FIXED issue in create_io_worker()
    815a0fe3f415 io-wq: fix bug of creating io-wokers unconditionally
    3cedeb691b74 bareudp: Fix invalid read beyond skb's linear data
    ed277fbd3053 psample: Add a fwd declaration for skbuff
    792e7591d308 iavf: Set RSS LUT and key in reset handle path
    f2b15898012a ice: don't remove netdev->dev_addr from uc sync list
    8a0814243362 ice: Stop processing VF messages during teardown
    e266d4c43b95 ice: Prevent probing virtual functions
    00735401c918 net: sched: act_mirred: Reset ct info when mirror/redirect skb
    e04669e14c5a net/smc: Correct smc link connection counter in case of smc client
    9b8f136b88f3 net/smc: fix wait on already cleared link
    6a4b92821135 io_uring: clear TIF_NOTIFY_SIGNAL when running task work
    1e19d18189fe ppp: Fix generating ifname when empty IFLA_IFNAME is specified
    2a4a96afa7b5 net: phy: micrel: Fix link detection on ksz87xx switch"
    d8431e3fa7b3 net: dsa: qca: ar9331: make proper initial port defaults
    ada7135e6d99 bpf: Fix integer overflow involving bucket_size
    621d81cfbb0c libbpf: Do not close un-owned FD 0 on errors
    51f19580f5f4 libbpf: Fix probe for BPF_PROG_TYPE_CGROUP_SOCKOPT
    466f5509f62a drm/amd/pm: Fix a memory leak in an error handling path in 'vangogh_tables_init()'
    fd0b94e6b1c7 perf/x86/intel: Apply mid ACK for small core
    736e0445f921 platform/x86: pcengines-apuv2: Add missing terminating entries to gpio-lookup tables
    a4de486958ff net: mvvp2: fix short frame size on s390
    f67f34a86375 net: dsa: mt7530: add the missing RxUnicast MIB counter
    141af64cf768 ASoC: cs42l42: Fix mono playback
    d57b00645556 ASoC: cs42l42: Fix LRCLK frame start edge
    6e61f4d51d38 ASoC: cs42l42: PLL must be running when changing MCLK_SRC_SEL
    22af0d2a5e5e pinctrl: tigerlake: Fix GPIO mapping for newer version of software
    deff14bdcc54 netfilter: nf_conntrack_bridge: Fix memory leak when error
    71805c36336a ASoC: cs42l42: Remove duplicate control for WNF filter frequency
    9c272596189c ASoC: cs42l42: Fix inversion of ADC Notch Switch control
    710490222c69 ASoC: SOF: Intel: hda-ipc: fix reply size checking
    ba216b210f26 ASoC: SOF: Intel: Kconfig: fix SoundWire dependencies
    d82c88a44bb6 selftests/sgx: Fix Q1 and Q2 calculation in sigstruct.c
    67488f5c9613 ASoC: cs42l42: Fix bclk calculation for mono
    b4f870447de1 ASoC: cs42l42: Don't allow SND_SOC_DAIFMT_LEFT_J
    918bbb32c823 ASoC: cs42l42: Correct definition of ADC Volume control
    676b96483576 pinctrl: mediatek: Fix fallback behavior for bias_set_combo
    73e81f7219aa drm/mediatek: Fix cursor plane no update
    30df59b45cac ieee802154: hwsim: fix GPF in hwsim_new_edge_nl
    bb0c87658dd1 ieee802154: hwsim: fix GPF in hwsim_set_edge_lqi
    73248a01ae14 drm/amdgpu: handle VCN instances when harvesting (v2)
    7e73eac2bd90 drm/amdgpu: don't enable baco on boco platforms in runpm
    fcd957aa8b32 drm/amdgpu: Add preferred mode in modeset when freesync video mode's enabled.
    7b69bee4817c drm/amd/display: use GFP_ATOMIC in amdgpu_dm_irq_schedule_work
    164759f4070e drm/amd/display: Remove invalid assert for ODM + MPC case
    3565f42dc8e2 drm/i915/display: Fix the 12 BPC bits for PIPE_MISC reg
    01478e251732 drm/i915/gvt: Fix cached atomics setting for Windows VM
    21fcf2f1ced4 vmlinux.lds.h: Handle clang's module.{c,d}tor sections
    33d2301ad61b riscv: kexec: do not add '-mno-relax' flag if compiler doesn't support it
    1579656b0141 libnvdimm/region: Fix label activation vs errors
    4debaa9f577a ACPI: NFIT: Fix support for virtual SPA ranges
    fbe28d4afbda pinctrl: k210: Fix k210_fpioa_probe()
    3d33960c8d66 ceph: reduce contention in ceph_check_delayed_caps()
    01b2ec534d38 ARC: fp: set FPU_STATUS.FWE to enable FPU_STATUS update on context switch
    30a5d06dc3dd net: ethernet: ti: cpsw: fix min eth packet size for non-switch use-cases
    2bb154128d14 net: wwan: mhi_wwan_ctrl: Fix possible deadlock
    8610d75c4db6 seccomp: Fix setting loaded filter count during TSYNC
    bf77f479cd4c cgroup: rstat: fix A-A deadlock on 32bit around u64_stats_sync
    5028bdb679c4 scsi: lpfc: Move initialization of phba->poll_list earlier to avoid crash
    3e35c7dbf706 io_uring: fix ctx-exit io_rsrc_put_work() deadlock
    e1c5046e341d io_uring: drop ctx->uring_lock before flushing work item
    000cb600dabf cifs: use the correct max-length for dentry_path_raw()
    0ca6ac8a2691 cifs: Call close synchronously during unlink/rename/lease break.
    10290043f377 cifs: create sd context must be a multiple of 8
    3c420ec43971 cifs: Handle race conditions during rename
    cc3a5a27e811 i2c: dev: zero out array used for i2c reads from userspace
    2693a747960b ASoC: intel: atom: Fix reference to PCM buffer address
    145951900b76 ASoC: kirkwood: Fix reference to PCM buffer address
    8e4a0581e288 ASoC: tlv320aic31xx: Fix jack detection after suspend
    3380a37484eb ASoC: uniphier: Fix reference to PCM buffer address
    4cf1b08e6889 ASoC: xilinx: Fix reference to PCM buffer address
    c43e0f97f5fc ASoC: amd: Fix reference to PCM buffer address
    b37adfb2c760 iio: adc: Fix incorrect exit of for-loop
    88f5acc1f2af iio: humidity: hdc100x: Add margin to the conversion time
    29ccbb4684e9 iio: adis: set GPIO reset pin direction
    51289a499dd1 iio: adc: ti-ads7950: Ensure CS is deasserted after reading channels
    c7ee0c9854fd Revert "usb: dwc3: gadget: Use list_replace_init() before traversing lists"
    95f4fb3ef0b9 lib: use PFN_PHYS() in devmem_is_allowed()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb |  4 ++--
 .../linux/linux-yocto-tiny_5.13.bb               |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.13.bb    | 16 ++++++++--------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
index db922c17b2..976a700b3d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
@@ -12,12 +12,12 @@ python () {
 }
 
 SRCREV_machine ?= "6ff7d7f8b079e82c83929df1b3ec5c9694e28f94"
-SRCREV_meta ?= "ebf34680af9896d3da7cbf4be0fd5e287559372c"
+SRCREV_meta ?= "c38435a3cacf424fa686ecac9a95ef8349b83bb3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.13.11"
+LINUX_VERSION ?= "5.13.12"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
index c7bea48fce..d99bef49d8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.13.11"
+LINUX_VERSION ?= "5.13.12"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine:qemuarm ?= "a6b42a4b1d650298ca77a0a4924df5ef37f6d000"
 SRCREV_machine ?= "abd88a509b11a383af46a6ee40a7ae46a0a0b700"
-SRCREV_meta ?= "ebf34680af9896d3da7cbf4be0fd5e287559372c"
+SRCREV_meta ?= "c38435a3cacf424fa686ecac9a95ef8349b83bb3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
index 78f474c9b9..1503c3a1e2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
@@ -17,13 +17,13 @@ SRCREV_machine:qemuarm ?= "d3166cf020bc65c4ae322afb38ccd571e15d3df9"
 SRCREV_machine:qemuarm64 ?= "263fa9bce1cbbecef59fc8460d23fa5ec289cfa9"
 SRCREV_machine:qemumips ?= "caffc7430fe0a6674f8e6dbd97bae05c59039e88"
 SRCREV_machine:qemuppc ?= "c061eef7c73df5d534ebd800a439fb95aac5829c"
-SRCREV_machine:qemuriscv64 ?= "fe64083abac67ac736aa0133f3a4088286aece40"
-SRCREV_machine:qemuriscv32 ?= "fe64083abac67ac736aa0133f3a4088286aece40"
-SRCREV_machine:qemux86 ?= "fe64083abac67ac736aa0133f3a4088286aece40"
-SRCREV_machine:qemux86-64 ?= "fe64083abac67ac736aa0133f3a4088286aece40"
+SRCREV_machine:qemuriscv64 ?= "49ec738aa7f6a59d11b46f61dea82965018f3124"
+SRCREV_machine:qemuriscv32 ?= "49ec738aa7f6a59d11b46f61dea82965018f3124"
+SRCREV_machine:qemux86 ?= "49ec738aa7f6a59d11b46f61dea82965018f3124"
+SRCREV_machine:qemux86-64 ?= "49ec738aa7f6a59d11b46f61dea82965018f3124"
 SRCREV_machine:qemumips64 ?= "28a1eb78129046c8f3f06f7cc1710fc761a84e30"
-SRCREV_machine ?= "fe64083abac67ac736aa0133f3a4088286aece40"
-SRCREV_meta ?= "ebf34680af9896d3da7cbf4be0fd5e287559372c"
+SRCREV_machine ?= "49ec738aa7f6a59d11b46f61dea82965018f3124"
+SRCREV_meta ?= "c38435a3cacf424fa686ecac9a95ef8349b83bb3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "ebf34680af9896d3da7cbf4be0fd5e287559372c"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "a3f1a03f54fc08ca86ad0759a46244a771ce6547"
+SRCREV_machine:class-devupstream ?= "f428e49b8cb1fbd9b4b4b29ea31b6991d2ff7de1"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.13/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.13.11"
+LINUX_VERSION ?= "5.13.12"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

