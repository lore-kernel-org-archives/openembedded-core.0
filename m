Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.37098.1598811546583313861
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 11:19:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=LVm3e1bt;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.178, mailfrom: steve@sakoman.com)
Received: by mail-il1-f178.google.com with SMTP id w8so479962ilj.8
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Aug 2020 11:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=QLnCHTh5QQ8nNO0OwRVL0HoYtNBSGxihVUKTpas4gNY=;
        b=LVm3e1btdZbVOUWlvhnsEF4vQZx2XpiTWh2iZsQuvjzj/je44ngH4CPY+z+mMpwka4
         x16FD1rdnMFYGyuVcuNtgusHVt+MaM6K1NuHgOvcq+D1G5Haq26EYSBtv6JcwipSyGQ8
         cle+iA1G1sMn9p4AvnIIzgVUIBbK2ohxRqaMmSh71Et+fP+29b3gzl9qzbINYwGL5CNQ
         OK1jelNOuWR0+m4kGUOpySqscamFD2tKEMeEkpVy6du/v56/T+/nmmADXgwubR949QdB
         2j6ItG1jiGnqBMWBpq3cV1KeHvPx/8bTkTgykHpbw/nuQeRN7pGR9XPqYuS/trQ4Dh6w
         7bmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=QLnCHTh5QQ8nNO0OwRVL0HoYtNBSGxihVUKTpas4gNY=;
        b=PyPcOKEoaXFlTzkUEPW06lSxzsiTHyEGJwxpT3vRNprJlRCwsPfNckCsWKfyK36SY/
         i0XzfpEo3mxI8IxrumaHK/5CrQgcBOVViRIpHwBGXIBzrIF4z6lNVeFORHlkhhskUwu9
         kDex3EfpK689XrKb5Oc28Hetr1ax8PNC9kA8jMjWDmG+DRjp2tmdgWvM8ZFyVdXIeOdP
         7XLfmuQwPBCaABZmhHP1aI2oYBTPTScbv1/e5r7EE6MSEc1bC10aVjnOt4GaQeXBVXrv
         n3fgt088CByjqNjGHF36ggM9TaUHmjW/Igftl7n7H0ztJoKEJWH8AZwbJzhjt8yUxsKy
         YQog==
X-Gm-Message-State: AOAM530ILsoQrzyvm46cr5y0VARl/AoXY+DzZNdsHd6A3eE8r1DhDNul
	mM3wei4wxjsHCxsbYWzmpK9buYOaECMk2CCyb/M=
X-Google-Smtp-Source: ABdhPJx9cV+02e3SKGdtspUBJXCuC9oCQgzwJ66UYoTVpDBdJTMYJdL+yYrgfUV4Ji6Ml/CllDD9IA==
X-Received: by 2002:a92:d386:: with SMTP id o6mr6377949ilo.292.1598811544118;
        Sun, 30 Aug 2020 11:19:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id j62sm2884768iof.53.2020.08.30.11.19.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 11:19:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 21/25] linux-yocto/5.4: update to v5.4.61
Date: Sun, 30 Aug 2020 08:16:15 -1000
Message-Id: <5a9bd1351b3ab66d8cefaf2ca3d4925e66bd0d5d.1598810890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1598810890.git.steve@sakoman.com>
References: <cover.1598810890.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    6576d69aac94 Linux 5.4.61
    d316d52742c4 KVM: arm64: Only reschedule if MMU_NOTIFIER_RANGE_BLOCKABLE is not set
    e1818ffcca0e KVM: Pass MMU notifier range flags to kvm_unmap_hva_range()
    744fde53ec32 xen: don't reschedule in preemption off sections
    d6bca2a8f064 mm/hugetlb: fix calculation of adjust_range_if_pmd_sharing_possible
    42694912aaf1 do_epoll_ctl(): clean the failure exits up a bit
    b158e91610c7 epoll: Keep a reference on files added to the check list
    5167f194da69 efi: add missed destroy_workqueue when efisubsys_init fails
    13b1fc60ecb0 powerpc/pseries: Do not initiate shutdown when system is running on UPS
    dafae068886a net: dsa: b53: check for timeout
    83236e697f79 hv_netvsc: Fix the queue_mapping in netvsc_vf_xmit()
    2dd00ae408a9 net: gemini: Fix missing free_netdev() in error path of gemini_ethernet_port_probe()
    f4adc6430d74 net: ena: Prevent reset after device destruction
    f4ed9ede3441 bonding: fix active-backup failover for current ARP slave
    542a493c8c5e ARM64: vdso32: Install vdso32 from vdso_install
    278eb88ab206 afs: Fix NULL deref in afs_dynroot_depopulate()
    140ac9370b16 RDMA/bnxt_re: Do not add user qps to flushlist
    dc0d58e281a6 Fix build error when CONFIG_ACPI is not set/enabled:
    7cc9812be1c7 efi: avoid error message when booting under Xen
    d3ca317cf62a kconfig: qconf: fix signal connection to invalid slots
    51d85e70e3ad kconfig: qconf: do not limit the pop-up menu to the first row
    da1069e4e727 Revert "scsi: qla2xxx: Disable T10-DIF feature with FC-NVMe during probe"
    6e2aa034d777 kvm: x86: Toggling CR4.PKE does not load PDPTEs in PAE mode
    46713f3d61b3 kvm: x86: Toggling CR4.SMAP does not load PDPTEs in PAE mode
    667a59aa55fb vfio/type1: Add proper error unwind for vfio_iommu_replay()
    503176f5dc07 ASoC: intel: Fix memleak in sst_media_open
    8aeb112d58c0 ASoC: msm8916-wcd-analog: fix register Interrupt offset
    e9849a60facb s390/ptrace: fix storage key handling
    d35f24bc566d s390/runtime_instrumentation: fix storage key handling
    cc215d206881 bonding: fix a potential double-unregister
    8a49739f58f5 can: j1939: add rxtimer for multipacket broadcast session
    d7ab964b6ba9 can: j1939: abort multipacket broadcast session when timeout occurs
    d0dc3d2c71e2 can: j1939: cancel rxtimer on multipacket broadcast session complete
    5159a0a5164b can: j1939: fix support for multipacket broadcast message
    5dc0c1c12094 bonding: show saner speed for broadcast mode
    1b9dee25ad25 net: fec: correct the error path for regulator disable in probe
    c0e04d08e544 i40e: Fix crash during removing i40e driver
    e2a8d4423640 i40e: Set RX_ONLY mode for unicast promiscuous on VLAN
    154ccf69feca can: j1939: transport: add j1939_session_skb_find_by_offset() function
    3bfd1398de6a can: j1939: transport: j1939_simple_recv(): ignore local J1939 messages send not by J1939 stack
    ff723ef6b7b6 can: j1939: fix kernel-infoleak in j1939_sk_sock2sockaddr_can()
    6e0bc946cbee bpf: sock_ops sk access may stomp registers when dst_reg = src_reg
    ece9ca5840e0 ASoC: q6routing: add dummy register read/write function
    aaa6e691b983 ASoC: q6afe-dai: mark all widgets registers as SND_SOC_NOPM
    233d6f2ab120 spi: stm32: fixes suspend/resume management
    666d1d1a0584 netfilter: nf_tables: nft_exthdr: the presence return value should be little-endian
    3473fa198178 ext4: don't allow overlapping system zones
    ea54176e5821 ext4: fix potential negative array index in do_split()
    2585402c5799 fs/signalfd.c: fix inconsistent return codes for signalfd4
    e4f952b031c1 alpha: fix annotation of io{read,write}{16,32}be()
    538c74a9cb26 xfs: Fix UBSAN null-ptr-deref in xfs_sysfs_init
    4591461ea9f2 tools/testing/selftests/cgroup/cgroup_util.c: cg_read_strcmp: fix null pointer dereference
    10b2bb101f06 media: camss: fix memory leaks on error handling paths in probe
    05724341d9db virtio_ring: Avoid loop when vq is broken in virtqueue_poll
    34f8368f6634 scsi: libfc: Free skb in fc_disc_gpn_id_resp() for valid cases
    28850b8043cc cpufreq: intel_pstate: Fix cpuinfo_max_freq when MSR_TURBO_RATIO_LIMIT is 0
    cca58a166920 swiotlb-xen: use vmalloc_to_page on vmalloc virt addresses
    2bd8ba398fad ceph: fix use-after-free for fsc->mdsc
    2524bb04d81b jffs2: fix UAF problem
    04aeb884e8a5 drm/ttm: fix offset in VMAs with a pg_offs in ttm_bo_vm_access
    711f5688bb97 xfs: fix inode quota reservation checks
    8fe5e38acbe7 svcrdma: Fix another Receive buffer leak
    7aca2f7d1710 m68knommu: fix overwriting of bits in ColdFire V3 cache control
    1a718d4caa1a MIPS: Fix unable to reserve memory for Crash kernel
    5594a54c520b Input: psmouse - add a newline when printing 'proto' by sysfs
    06d4d9acd7d8 media: vpss: clean up resources in init
    f948f1d02237 rtc: goldfish: Enable interrupt in set_alarm() when necessary
    85ad0d5f3d69 media: budget-core: Improve exception handling in budget_register()
    62b8c76d061f scsi: target: tcmu: Fix crash in tcmu_flush_dcache_range on ARM
    59d587cc3640 scsi: ufs: Add DELAY_BEFORE_LPM quirk for Micron devices
    10e99c3003d5 opp: Enable resources again if they were disabled earlier
    52d322f91954 kthread: Do not preempt current task if it is going to call schedule()
    504fe0ab2412 drm/amd/display: fix pow() crashing when given base 0
    1f3cfa9338c3 drm/amd/display: Fix EDID parsing after resume from suspend
    6f3bff30f1cb drm/amdgpu/display: use GFP_ATOMIC in dcn20_validate_bandwidth_internal
    f45ab6e7d957 scsi: zfcp: Fix use-after-free in request timeout handlers
    b4062a49ad4a jbd2: add the missing unlock_buffer() in the error path of jbd2_write_superblock()
    2bc54ba65fdc ext4: fix checking of directory entry validity for inline directories
    59af0759bd46 RDMA/hfi1: Correct an interlock issue for TID RDMA WRITE request
    0cfb9320d00c mm, page_alloc: fix core hung in free_pcppages_bulk()
    5663159e2930 mm: include CMA pages in lowmem_reserve at boot
    e9e3ec03e6ae uprobes: __replace_page() avoid BUG in munlock_vma_page()
    fa2e0d4e4a4c kernel/relay.c: fix memleak on destroy relay channel
    19a77c937a19 romfs: fix uninitialized memory leak in romfs_dev_read()
    3e538c536f01 spi: Prevent adding devices below an unregistering controller
    143df6b3584a can: j1939: socket: j1939_sk_bind(): make sure ml_priv is allocated
    60be1488a3ae can: j1939: transport: j1939_session_tx_dat(): fix use-after-free read in j1939_tp_txtimer()
    055c65c7e7dd ALSA: hda/realtek: Add quirk for Samsung Galaxy Book Ion
    4fe52a85eeb4 ALSA: hda/realtek: Add quirk for Samsung Galaxy Flex Book
    84bfb4b10d6f btrfs: add wrapper for transaction abort predicate
    745148367b04 btrfs: return EROFS for BTRFS_FS_STATE_ERROR cases
    de88b7e2f02f btrfs: don't show full path of bind mounts in subvol=
    038580b1f58b btrfs: export helpers for subvolume name/id resolution
    b40753984979 bcache: avoid nr_stripes overflow in bcache_device_init()
    9f4f7c08d50b khugepaged: adjust VM_BUG_ON_MM() in __khugepaged_enter()
    9a05b774af30 khugepaged: khugepaged_test_exit() check mmget_still_valid()
    8043d5ee9168 perf probe: Fix memory leakage when the probe point is not found
    888d9b829c25 gfs2: Never call gfs2_block_zero_range with an open transaction
    18a640d3b570 gfs2: Improve mmap write vs. punch_hole consistency
    e42c75ef3477 drm/vgem: Replace opencoded version of drm_gem_dumb_map_offset()
    62353048e2d4 kbuild: support LLVM=1 to switch the default tools to Clang/LLVM
    c7d8f67db126 kbuild: replace AS=clang with LLVM_IAS=1
    244d9026768d kbuild: remove AS variable
    fed06097acce kbuild: remove PYTHON2 variable
    fa84d9f31599 x86/boot: kbuild: allow readelf executable to be specified
    c173511a12e4 net: wan: wanxl: use $(M68KCC) instead of $(M68KAS) for rebuilding firmware
    c7c239c947be net: wan: wanxl: use allow to pass CROSS_COMPILE_M68k for rebuilding firmware
    f781285d09a9 Documentation/llvm: fix the name of llvm-size
    97eab9af0036 Documentation/llvm: add documentation on building w/ Clang/LLVM

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0c67ef9397da5dacaba557956a33c0c457684032)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index a3416a660f..a0324f0304 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ac6f31906972c08f16c1ce43410502a5ef251dce"
-SRCREV_meta ?= "96bf76ffc2601220c790ffc0b57eec5a06c3f819"
+SRCREV_machine ?= "e65e9ff22c5c42c9ae57a4cce45fbf91a7e7ae3b"
+SRCREV_meta ?= "7ed307f65171d331a784ceecb6f56b9f8ecadb10"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.60"
+LINUX_VERSION ?= "5.4.61"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 58697bb9ef..f835a45870 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.60"
+LINUX_VERSION ?= "5.4.61"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "693cdc59f5332582cd1e0e21f388b5342fadb5c6"
-SRCREV_machine ?= "60fc5f2c61a48088ff4bbfb35b2f64af70bc5bdd"
-SRCREV_meta ?= "96bf76ffc2601220c790ffc0b57eec5a06c3f819"
+SRCREV_machine_qemuarm ?= "f30ce7653a038eb05ef0503d0d15c7c6ec33cdc5"
+SRCREV_machine ?= "00809fdaf65b24fcd0347f3d3e489e2890f7ed44"
+SRCREV_meta ?= "7ed307f65171d331a784ceecb6f56b9f8ecadb10"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 61699cda86..070486c8aa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "05fde54b1e68379be26d2d666e52eb8a4433cf67"
-SRCREV_machine_qemuarm64 ?= "60fc5f2c61a48088ff4bbfb35b2f64af70bc5bdd"
-SRCREV_machine_qemumips ?= "02fee7ae77f92e2090c26959be11c0a109b02ec2"
-SRCREV_machine_qemuppc ?= "60fc5f2c61a48088ff4bbfb35b2f64af70bc5bdd"
-SRCREV_machine_qemuriscv64 ?= "60fc5f2c61a48088ff4bbfb35b2f64af70bc5bdd"
-SRCREV_machine_qemux86 ?= "60fc5f2c61a48088ff4bbfb35b2f64af70bc5bdd"
-SRCREV_machine_qemux86-64 ?= "60fc5f2c61a48088ff4bbfb35b2f64af70bc5bdd"
-SRCREV_machine_qemumips64 ?= "e8247201b3d33b579520620cf37a398fa8311822"
-SRCREV_machine ?= "60fc5f2c61a48088ff4bbfb35b2f64af70bc5bdd"
-SRCREV_meta ?= "96bf76ffc2601220c790ffc0b57eec5a06c3f819"
+SRCREV_machine_qemuarm ?= "487ecd38aaa59c22302930e8a9697c62c9d85fe5"
+SRCREV_machine_qemuarm64 ?= "00809fdaf65b24fcd0347f3d3e489e2890f7ed44"
+SRCREV_machine_qemumips ?= "ad1d747e7343bc9851bff62c4279060094c6eb59"
+SRCREV_machine_qemuppc ?= "00809fdaf65b24fcd0347f3d3e489e2890f7ed44"
+SRCREV_machine_qemuriscv64 ?= "00809fdaf65b24fcd0347f3d3e489e2890f7ed44"
+SRCREV_machine_qemux86 ?= "00809fdaf65b24fcd0347f3d3e489e2890f7ed44"
+SRCREV_machine_qemux86-64 ?= "00809fdaf65b24fcd0347f3d3e489e2890f7ed44"
+SRCREV_machine_qemumips64 ?= "4fe8438e9dea8d0a00f82003277f36785aac9e3d"
+SRCREV_machine ?= "00809fdaf65b24fcd0347f3d3e489e2890f7ed44"
+SRCREV_meta ?= "7ed307f65171d331a784ceecb6f56b9f8ecadb10"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.60"
+LINUX_VERSION ?= "5.4.61"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1

