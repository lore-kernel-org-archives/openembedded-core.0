Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web11.24885.1598550849193607189
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 10:54:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HuskvGKR;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id d27so5220638qtg.4
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 10:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=j04cbVw5xO6poa7W28buxuuP5v1zx3XwB374A9KjrQ8=;
        b=HuskvGKRrEOnbWN9zMRQGGPQ5r9dk2KybvsuD5CVkD/iMNSQUXRCQkrKfKLggo32DB
         ZS4MkOd6AjS0q8oIFfztaBqGUUaCBTjEpMwMn3iqD0ql6KbYAVBUB6lO4rbS7s1M1X/6
         TQfo6ZYzEJv2jRmPHUNae8euGOsz6XY2UkY6pdmPpg50+JtSCljgaq5/V3bDovzqWxlw
         aS7FQ4WU945XfsVT8miTArDjL2Dwuw08uEfEIkonDKJbRGVNRvHqIEkyTeRD87o/J1Yk
         2KOADI2wITYiUWDtLTa6T2VDoBP4KB9S4WuehmK6iuNBvapN+cYBDo3qRdcIYo0undtd
         0gUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=j04cbVw5xO6poa7W28buxuuP5v1zx3XwB374A9KjrQ8=;
        b=RPzPhmEk4ng8Amr9My1SOwjtS0KARL/TkM5p90nrj5TOSYiC/8DAl0E9YvuZbmaYDU
         bCf/s6MTloRYr0Fsz9gc4gT9vLjfkCTgpLuNGZMjPQPq1D/wtjBeshmJzkUezhO3Qzpv
         p3XJNPobEfErRrw1PLZaxYCCJOAvh2Zr1peaagrFdREIA3ehFP3A0q4JPEkw5nycXDlM
         lNmk4MLAVWz5yg8eB8vDkXIoYeWgfZ1gRucZfIk5m2mQ0qEXr/Y4CZ4CaLL7i8mArQA5
         Oif6Def7ZywwOXn9huB9edOTqpRSVIt03g5VZD4G3c+aqphlx56mt3J9Tz0HCMO8ufXK
         FUBw==
X-Gm-Message-State: AOAM530cL62w4r3rTuaGCy9uJsn4lgj2xHo7lDBSbNfgC7Q05axeL9GL
	WxEfd9YhsRpB/IuI1tVi1vE=
X-Google-Smtp-Source: ABdhPJz2Cst7pMk4CGyyF3Vhuu4uv3t2BAPpaJNhCCvCfTCDeaIPZpJI41e+REyemSMWtDlVqYN+vw==
X-Received: by 2002:ac8:397b:: with SMTP id t56mr20686340qtb.245.1598550848238;
        Thu, 27 Aug 2020 10:54:08 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id f4sm2339963qtp.38.2020.08.27.10.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 10:54:07 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/5] linux-yocto/5.8: update to v5.8.4
Date: Thu, 27 Aug 2020 13:54:00 -0400
Message-Id: <2098c0d51569d83719a1618b10c91a5537b18e60.1598550535.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1598550535.git.bruce.ashfield@gmail.com>
References: <cover.1598550535.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.8 to the latest korg -stable release that comprises
the following commits:

    47dcb7fcad1d Linux 5.8.4
    920ebff48be3 Revert "drm/amd/display: Improve DisplayPort monitor interop"
    d0a3a0136337 KVM: arm64: Only reschedule if MMU_NOTIFIER_RANGE_BLOCKABLE is not set
    af3093319fce KVM: Pass MMU notifier range flags to kvm_unmap_hva_range()
    d9903e8c2576 do_epoll_ctl(): clean the failure exits up a bit
    1f802ace4bd5 efi/libstub: Handle unterminated cmdline
    ca60a5eb8372 efi/libstub: Handle NULL cmdline
    3bff856ba44d efi/libstub: Stop parsing arguments at "--"
    e6584124b982 efi: add missed destroy_workqueue when efisubsys_init fails
    09a307050798 efi/x86: Mark kernel rodata non-executable for mixed mode
    3d9ed544ec9b EDAC/{i7core,sb,pnd2,skx}: Fix error event severity
    979a9c0058f9 powerpc/pseries: Do not initiate shutdown when system is running on UPS
    d9b227a03e9a powerpc: Fix P10 PVR revision in /proc/cpuinfo for SMT4 cores
    c09886c19233 epoll: Keep a reference on files added to the check list
    3489cea04a4b net: dsa: b53: check for timeout
    0c831e9dad9d hv_netvsc: Fix the queue_mapping in netvsc_vf_xmit()
    d446604e432c selftests/bpf: Remove test_align leftovers
    9500db5480f8 net: gemini: Fix missing free_netdev() in error path of gemini_ethernet_port_probe()
    af4a56476ddd net: ena: Change WARN_ON expression in ena_del_napi_in_range()
    8c01a77d28bf net: ena: Prevent reset after device destruction
    3c1d705f29c6 bonding: fix active-backup failover for current ARP slave
    f6c6b312efef powerpc/pseries/hotplug-cpu: wait indefinitely for vCPU death
    63f10205a215 bpf: Use get_file_rcu() instead of get_file() for task_file iterator
    2fe8be1a33d5 powerpc/fixmap: Fix the size of the early debug area
    6f1d3ac25b59 ARM64: vdso32: Install vdso32 from vdso_install
    88d78fa3426f afs: Fix NULL deref in afs_dynroot_depopulate()
    f09a790a6e46 kconfig: qconf: remove qInfo() to get back Qt4 support
    19881ebab34f afs: Fix key ref leak in afs_put_operation()
    f35bb8426115 Revert "RDMA/hns: Reserve one sge in order to avoid local length error"
    8facd0c47293 RDMA/bnxt_re: Do not add user qps to flushlist
    1f43cb1c6f56 Fix build error when CONFIG_ACPI is not set/enabled:
    15f8decf24ed efi: avoid error message when booting under Xen
    80876bf7962d kconfig: qconf: fix signal connection to invalid slots
    a00ac43450bf kconfig: qconf: do not limit the pop-up menu to the first row
    a4d533969b91 Revert "scsi: qla2xxx: Disable T10-DIF feature with FC-NVMe during probe"
    06e5e83d1fa5 scsi: ufs: Fix interrupt error message for shared interrupts
    a3ef038de59a scsi: ufs-pci: Add quirk for broken auto-hibernate for Intel EHL
    88a3da2e55b0 scsi: ufs: Add quirk to fix abnormal ocs fatal error
    65fa4a6ee3b8 scsi: ufs: Introduce UFSHCD_QUIRK_PRDT_BYTE_GRAN quirk
    2a0b7adc5d0d scsi: ufs: Add quirk to enable host controller without hce
    81929755f92e scsi: ufs: Add quirk to disallow reset of interrupt aggregation
    8ab0b065d8bd scsi: ufs: Add quirk to fix mishandling utrlclr/utmrlclr
    c3e9f5c75eba scsi: ufs: ti-j721e-ufs: Fix error return in ti_j721e_ufs_probe()
    3d1bc8c7b20f of/address: check for invalid range.cpu_addr
    e10e99e4872b kvm: x86: Toggling CR4.PKE does not load PDPTEs in PAE mode
    cfc52749f050 kvm: x86: Toggling CR4.SMAP does not load PDPTEs in PAE mode
    753d60c62003 arch/ia64: Restore arch-specific pgd_offset_k implementation
    c9486fc5f69b vfio/type1: Add proper error unwind for vfio_iommu_replay()
    c49fa6397b6d vfio-pci: Avoid recursive read-lock usage
    ba9c27ba1175 watch_queue: Limit the number of watches a user can hold
    7505eeadc5a7 ASoC: intel: Fix memleak in sst_media_open
    2586fcb08f85 ASoC: msm8916-wcd-analog: fix register Interrupt offset
    ca79907768d3 s390/ptrace: fix storage key handling
    87a297a5a835 s390/runtime_instrumentation: fix storage key handling
    3bd77efc033f ipvlan: fix device features
    39560b31450b bonding: fix a potential double-unregister
    dfdc8eaf69a6 can: j1939: add rxtimer for multipacket broadcast session
    638e26b82db3 can: j1939: abort multipacket broadcast session when timeout occurs
    f7653e4b8fa9 can: j1939: cancel rxtimer on multipacket broadcast session complete
    6cc1cc005e97 can: j1939: fix support for multipacket broadcast message
    f9c6097aeb30 bonding: show saner speed for broadcast mode
    b9ca7a24e64a net: fec: correct the error path for regulator disable in probe
    22da47f7c872 i40e: Fix crash during removing i40e driver
    fb95a28d7daf i40e: Set RX_ONLY mode for unicast promiscuous on VLAN
    d302358881c4 igc: Fix PTP initialization
    16c3d947c69b can: j1939: transport: add j1939_session_skb_find_by_offset() function
    f0c778597a5a can: j1939: transport: j1939_simple_recv(): ignore local J1939 messages send not by J1939 stack
    089dd91ec99b can: j1939: fix kernel-infoleak in j1939_sk_sock2sockaddr_can()
    93c39ebb5d44 libbpf: Fix BTF-defined map-in-map initialization on 32-bit host arches
    db7f8c57dbdd bpf: sock_ops sk access may stomp registers when dst_reg = src_reg
    cd4644d904e1 bpf: sock_ops ctx access may stomp registers in corner case
    5d9c020bd8e3 tools/bpftool: Make skeleton code C++17-friendly by dropping typeof()
    c2bbf3cbcf78 ASoC: q6routing: add dummy register read/write function
    60df9abd8489 ASoC: q6afe-dai: mark all widgets registers as SND_SOC_NOPM
    4c3f6739fe05 spi: stm32: fixes suspend/resume management
    4707dba95055 netfilter: nf_tables: nft_exthdr: the presence return value should be little-endian
    cfa678021a1b ext4: check journal inode extents more carefully
    20070b188bf4 ext4: don't allow overlapping system zones
    480a5124cd0e drm/virtio: fix missing dma_fence_put() in virtio_gpu_execbuffer_ioctl()
    88e79f7a9841 ext4: fix potential negative array index in do_split()
    95e117076842 fs/signalfd.c: fix inconsistent return codes for signalfd4
    796f99a7b77a fat: fix fat_ra_init() for data clusters == 0
    f358706be43a alpha: fix annotation of io{read,write}{16,32}be()
    5461d5e84ed3 xfs: Fix UBSAN null-ptr-deref in xfs_sysfs_init
    99b3f3bd1fa9 tools/testing/selftests/cgroup/cgroup_util.c: cg_read_strcmp: fix null pointer dereference
    2dc74b9a9a9f media: camss: fix memory leaks on error handling paths in probe
    630170dfc73a virtio_ring: Avoid loop when vq is broken in virtqueue_poll
    55bd4074ce6b scsi: libfc: Free skb in fc_disc_gpn_id_resp() for valid cases
    caceaea09891 cpufreq: intel_pstate: Fix cpuinfo_max_freq when MSR_TURBO_RATIO_LIMIT is 0
    3f6735308fdf swiotlb-xen: use vmalloc_to_page on vmalloc virt addresses
    8d5b9bb9a58a ceph: fix use-after-free for fsc->mdsc
    17754f71db7b jffs2: fix UAF problem
    7beedf14a639 riscv: Fixup static_obj() fail
    106f319212e5 drm/ttm: fix offset in VMAs with a pg_offs in ttm_bo_vm_access
    8da93b053951 xfs: fix inode quota reservation checks
    a8c8ad128e19 svcrdma: Fix another Receive buffer leak
    2a9eccbe614e m68knommu: fix overwriting of bits in ColdFire V3 cache control
    4accb5af385b MIPS: Fix unable to reserve memory for Crash kernel
    689bee9eb02a Input: psmouse - add a newline when printing 'proto' by sysfs
    f6b2fb80ffdc f2fs: should avoid inode eviction in synchronous path
    a692a28626e2 media: vpss: clean up resources in init
    b0eecd0e3c05 rtc: goldfish: Enable interrupt in set_alarm() when necessary
    e055ffe8d48a f2fs: fix to check page dirty status before writeback
    527b13f612df media: coda: jpeg: add NULL check after kmalloc
    cd67c599233f media: budget-core: Improve exception handling in budget_register()
    f05c0e45e0b7 scsi: target: tcmu: Fix crash in tcmu_flush_dcache_range on ARM
    b84142b25cae scsi: ufs: Add DELAY_BEFORE_LPM quirk for Micron devices
    c68589be55fd drm/i915: Provide the perf pmu.module
    3a07e556aa59 drm/i915/pmu: Prefer drm_WARN_ON over WARN_ON
    33eb147ff02f drm/amd/display: fix pow() crashing when given base 0
    e0a7a29fb37f drm/amd/display: Fix DFPstate hang due to view port changed
    9cb01ea4fab5 drm/amd/display: Blank stream before destroying HDCP session
    115e2a7226c0 drm/amd/display: Fix EDID parsing after resume from suspend
    e06fe5e678fe drm/amd/display: Fix incorrect backlight register offset for DCN
    c20d9803acc2 drm/amdgpu/display: use GFP_ATOMIC in dcn20_validate_bandwidth_internal
    bdc689905bef drm: amdgpu: Use the correct size when allocating memory
    144fa0580fbe mm/memory.c: skip spurious TLB flush for retried page fault
    6f2950ebcd88 s390/pci: ignore stale configuration request event
    4c86de3bff29 s390/pci: fix PF/VF linking on hot plug
    1d95c4596123 s390/pci: re-introduce zpci_remove_device()
    c77c3fdef0f6 s390/pci: fix zpci_bus_link_virtfn()
    91729fc577b3 selftests: kvm: Use a shorter encoding to clear RAX
    171f7e5f7d6a scsi: zfcp: Fix use-after-free in request timeout handlers
    1ae4b74a2302 jbd2: add the missing unlock_buffer() in the error path of jbd2_write_superblock()
    38ccb4b484bb ext4: fix checking of directory entry validity for inline directories
    7535cbdd6cab ext4: do not block RWF_NOWAIT dio write on unallocated space
    e25d2b38fe64 opp: Put opp table in dev_pm_opp_set_rate() if _set_opp_bw() fails
    9cb98fa067fa opp: Put opp table in dev_pm_opp_set_rate() for empty tables
    e8996e480762 opp: Enable resources again if they were disabled earlier
    6b5b9fdedd98 RDMA/hfi1: Correct an interlock issue for TID RDMA WRITE request
    e0d5793a7aa6 ASoC: amd: renoir: restore two more registers during resume
    5b21a116b136 mm, page_alloc: fix core hung in free_pcppages_bulk()
    3d803ebd631e mm: include CMA pages in lowmem_reserve at boot
    37d1789de274 squashfs: avoid bio_alloc() failure with 1Mbyte blocks
    a1a1ea598177 uprobes: __replace_page() avoid BUG in munlock_vma_page()
    14fb06cc4b38 kernel/relay.c: fix memleak on destroy relay channel
    734a5c3f266c romfs: fix uninitialized memory leak in romfs_dev_read()
    0675a6f26bd8 mm/vunmap: add cond_resched() in vunmap_pmd_range
    917cdc0d2c53 io_uring: find and cancel head link async work on files exit
    93366cb81056 spi: Prevent adding devices below an unregistering controller
    a14e7ce59232 can: j1939: socket: j1939_sk_bind(): make sure ml_priv is allocated
    cf3b3ffb272c can: j1939: transport: j1939_session_tx_dat(): fix use-after-free read in j1939_tp_txtimer()
    2d790596d76f ALSA: hda/realtek: Add quirk for Samsung Galaxy Book Ion
    c20d8d9c04b9 ALSA: hda/realtek: Add quirk for Samsung Galaxy Flex Book
    44d8f487a7d6 ALSA: hda: avoid reset of sdo_limit
    6a1624ca6229 khugepaged: adjust VM_BUG_ON_MM() in __khugepaged_enter()
    801515285db3 drm/ast: Initialize DRAM type before posting GPU
    38814f974d34 drm/ast: Remove unused code paths for AST 1180
    f8be691dbd88 drm/panel-simple: Fix inverted V/H SYNC for Frida FRD350H54004 panel
    f04844351ce2 drm/vgem: Replace opencoded version of drm_gem_dumb_map_offset()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index 363b771967..f8758d2b1c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
-SRCREV_meta ?= "84377c2c723fe121d041f8fcfc99b8c244dcd6b0"
+SRCREV_machine ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
+SRCREV_meta ?= "7ddf21c67d219078d369988270f008bf8d730b1c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.8.3"
+LINUX_VERSION ?= "5.8.4"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 6c18a6178f..53145287bb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.8.3"
+LINUX_VERSION ?= "5.8.4"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "e5992f87f18d3e99f7448111f99bb1769dc718c7"
-SRCREV_machine ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
-SRCREV_meta ?= "84377c2c723fe121d041f8fcfc99b8c244dcd6b0"
+SRCREV_machine_qemuarm ?= "657076afb65e40e322bcc3b2bb8eeca590e20912"
+SRCREV_machine ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
+SRCREV_meta ?= "7ddf21c67d219078d369988270f008bf8d730b1c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index 283c74694d..7b2844699a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "2285cab1d5ddd24e489dab0d9faa7f3718e86195"
-SRCREV_machine_qemuarm64 ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
-SRCREV_machine_qemumips ?= "18aba2b2d36ac3908500770d4b462c633aaa4e3c"
-SRCREV_machine_qemuppc ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
-SRCREV_machine_qemuriscv64 ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
-SRCREV_machine_qemux86 ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
-SRCREV_machine_qemux86-64 ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
-SRCREV_machine_qemumips64 ?= "f8266b2a44053579c3bb0bde59552b30091ddb83"
-SRCREV_machine ?= "34702049e3c1a4bb927e5f8d1cbe5f134afb4036"
-SRCREV_meta ?= "84377c2c723fe121d041f8fcfc99b8c244dcd6b0"
+SRCREV_machine_qemuarm ?= "a23a3757322d01974a65285aefcf7fdbbcde9aa8"
+SRCREV_machine_qemuarm64 ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
+SRCREV_machine_qemumips ?= "1f31484dac3aaf69f06a07d8869bd04d1d0377b7"
+SRCREV_machine_qemuppc ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
+SRCREV_machine_qemuriscv64 ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
+SRCREV_machine_qemux86 ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
+SRCREV_machine_qemux86-64 ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
+SRCREV_machine_qemumips64 ?= "768aed7c0609f38222ee7672981a9b60c943f4fb"
+SRCREV_machine ?= "6a095b50f83adc33b07bd1b3dbbcca8bec66849f"
+SRCREV_meta ?= "7ddf21c67d219078d369988270f008bf8d730b1c"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.8.3"
+LINUX_VERSION ?= "5.8.4"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

