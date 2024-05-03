Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61A6C25B5C
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:41:04 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.3826.1714704055760001112
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:40:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N2++DXM1;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-78ecd752a7cso593641885a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704055; x=1715308855; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s5cvB7GTIjENpZMJUVWUX/7SJdURyfCEn+9x+m5+AfA=;
        b=N2++DXM160G1gkwWRMnXYgYueoZMVXBF7jcvXA13bNiG0dhHaDTV96eYrJnpjV7lKn
         XMuMOCogSEpruQf3eZuhzWcKLvpy0G5nf/H+KwhK2IT5bKpcYe3ZR7Ng1TCeGhLKEKVo
         Aw+J5//DgwZTzxU90zEMNj1qiQH/rl5nOSXG9XbBAtmL+5fqyNFumPipZoyq8dFfI4XZ
         pdeuMQux3wn2tuPe8DWdHwNRQQCSt0miqN5zPtt0wwixYuKC3DuVPWa3jyJQnDc/WCth
         1lxqnIH/UEC9kS5TnKP3SrbL7NuPQMeyfgEl2i/yD3+32OBf/4e6FcN/nM/+dbPH1cqg
         909g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704055; x=1715308855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5cvB7GTIjENpZMJUVWUX/7SJdURyfCEn+9x+m5+AfA=;
        b=SuG2cyx3fBvPI1y6ZOt/QHU82uAU5cPn+c4bW6+qNMACsPwGhGT5hwe7YqwGxTqTP+
         y8mgDutTe+vJJtnZeazaQ6T+BYZccAmFS6EUd4Y9jjjQC0c6NJv108BhaZxDa591ayDU
         +CqvUOz+FoT5aOxw6usNVV2OMbSXEWcRM+5r45sPuAitHWC00w5ojcJbrxoDmqo0goVh
         mnhM7cLF7VsRm2mp081Pl7+F3U3+bRfr0a9IpxFtbnmTAL8GLWx0yCEfz5Mgj/A5MBvd
         TH/U1n5hTATMWS2dD3OmCvIfw/PD7DFJZc+spmfVCN2hy5pNGPd1cmgLShSUTK36VpaK
         FwJA==
X-Gm-Message-State: AOJu0Yy+4EeDcLvllWppSWlmr7K6SfOg9sIpnCLOoHO/vOuLARVtfNF7
	uSIO5/PzNXXRy7n+ip9lZo+/7Y3toLG0tYw2/7lNcKsriZGhN5wJjlq7jA==
X-Google-Smtp-Source: AGHT+IGy0fmrwIUB4BCeITkNHWXcer6GV/o9V8tIZZx88DG+SuSaYG33yyaatffyLFuzzze1jp+lVg==
X-Received: by 2002:a05:620a:470e:b0:790:72c4:d5ea with SMTP id bs14-20020a05620a470e00b0079072c4d5eamr1906857qkb.25.1714704054646;
        Thu, 02 May 2024 19:40:54 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id bm34-20020a05620a19a200b0078ec3aa9cc7sm856163qkb.25.2024.05.02.19.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:40:53 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/12] linux-yocto/6.6: update to v6.6.28
Date: Thu,  2 May 2024 22:40:37 -0400
Message-Id: <79e349fa7793fc23b5897ca5b72fe60ee439be31.1714703667.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1714703667.git.bruce.ashfield@gmail.com>
References: <cover.1714703667.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198940

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    ba151416051a Linux 6.6.28
    50971570ba79 drm/amd/display: fix disable otg wa logic in DCN316
    5ca6cbd8adbe drm/amd/display: Set VSC SDP Colorimetry same way for MST and SST
    b12c3cfd8265 drm/amd/display: Program VSC SDP colorimetry for all DP sinks >= 1.4
    bd3105a71d1c drm/amdgpu: fix incorrect number of active RBs for gfx11
    fa2df4aa3e3a drm/amdgpu: always force full reset for SOC21
    1520bf605d2f drm/amdgpu: Reset dGPU if suspend got aborted
    2708354ffb70 drm/i915: Disable port sync when bigjoiner is used
    d1742f77bdf2 drm/i915/cdclk: Fix CDCLK programming order when pipes are active
    09e6cbe98c10 x86/bugs: Replace CONFIG_SPECTRE_BHI_{ON,OFF} with CONFIG_MITIGATION_SPECTRE_BHI
    a823da65dce8 x86/bugs: Remove CONFIG_BHI_MITIGATION_AUTO and spectre_bhi=auto
    9c9cd014d048 x86/bugs: Clarify that syscall hardening isn't a BHI mitigation
    7497589a96bc x86/bugs: Fix BHI handling of RRSBA
    c83e35f47595 x86/bugs: Rename various 'ia32_cap' variables to 'x86_arch_cap_msr'
    bdbbe95b536c x86/bugs: Cache the value of MSR_IA32_ARCH_CAPABILITIES
    39053a34963a x86/bugs: Fix BHI documentation
    2d003904b934 x86/bugs: Fix return type of spectre_bhi_state()
    548af6102c8e irqflags: Explicitly ignore lockdep_hrtimer_exit() argument
    052d73ca9435 x86/apic: Force native_apic_mem_read() to use the MOV instruction
    5c5fb5057933 selftests: timers: Fix abs() warning in posix_timers test
    2978ee7c973c x86/cpu: Actually turn off mitigations by default for SPECULATION_MITIGATIONS=n
    d4a2a965d630 perf/x86: Fix out of range data
    d619651ae6e3 vhost: Add smp_rmb() in vhost_enable_notify()
    8a05b6630be0 vhost: Add smp_rmb() in vhost_vq_avail_empty()
    a156f37b8e3c arm64: dts: imx8-ss-dma: fix spi lpcg indices
    e9e44fc88aba arm64: dts: imx8-ss-lsio: fix pwm lpcg indices
    16c2dd96e479 arm64: dts: imx8-ss-conn: fix usb lpcg indices
    7c4285471c03 arm64: dts: imx8-ss-dma: fix adc lpcg indices
    19a8492473b0 arm64: dts: imx8-ss-dma: fix can lpcg indices
    20ceb2b50fd5 arm64: dts: imx8qm-ss-dma: fix can lpcg indices
    04e018bd913d drm/client: Fully protect modes[] with dev->mode_config.mutex
    31806711e8a4 drm/panfrost: Fix the error path in panfrost_mmu_map_fault_addr()
    a81b2acd43e2 drm/ast: Fix soft lockup
    4d87f08eb755 drm/amdkfd: Reset GPU on queue preemption failure
    f9b31dfdc0b5 drm/i915/vrr: Disable VRR when using bigjoiner
    88685c3e7d24 drm/vmwgfx: Enable DMA mappings with SEV
    d43e11d9c7fc accel/ivpu: Fix deadlock in context_xa
    2704f4833550 scsi: sg: Avoid race in error handling & drop bogus warn
    46af9047523e scsi: sg: Avoid sg device teardown race
    d15023fb4073 kprobes: Fix possible use-after-free issue on kprobe registration
    96b7b0934a34 io_uring/net: restore msg_control on sendzc retry
    585c5732caaa btrfs: qgroup: convert PREALLOC to PERTRANS after record_root_in_trans
    363be24c010a btrfs: record delayed inode root in transaction
    14431815a4ae btrfs: qgroup: fix qgroup prealloc rsv leak in subvolume operations
    03cca8fe300f btrfs: qgroup: correctly model root qgroup rsv in convert
    732752bac3bd selftests: mptcp: use += operator to append strings
    4c6d2f453970 iommu/vt-d: Allocate local memory for page request queue
    f3ccbb6b6d52 iommu/vt-d: Fix wrong use of pasid config
    e3e1e80b692c tracing: hide unused ftrace_event_id_fops
    2fc4d53ff055 net: ena: Set tx_info->xdpf value to NULL
    354627f92679 net: ena: Use tx_ring instead of xdp_ring for XDP channel TX
    bc0ad6857c86 net: ena: Pass ena_adapter instead of net_device to ena_xmit_common()
    c891d7678f44 net: ena: Move XDP code to its new files
    5c7f2240d983 net: ena: Fix incorrect descriptor free behavior
    dc1d1e35c8fd net: ena: Wrong missing IO completions check order
    4d142dda057a net: ena: Fix potential sign extension issue
    507cc232ffe5 af_unix: Fix garbage collector racing against connect()
    301fdbaa0bba af_unix: Do not use atomic ops for unix_sk(sk)->inflight.
    8b6c4b625826 net: dsa: mt7530: trap link-local frames regardless of ST Port State
    785510c91be3 Revert "s390/ism: fix receive message buffer allocation"
    54541e18ca9d net: sparx5: fix wrong config being used when reconfiguring PCS
    292a76473334 net/mlx5e: Do not produce metadata freelist entries in Tx port ts WQE xmit
    8777d6ad7b8a net/mlx5e: HTB, Fix inconsistencies with QoS SQs number
    f9ac93b6f3de net/mlx5e: Fix mlx5e_priv_init() cleanup flow
    690e3d91c5b1 net/mlx5: Correctly compare pkt reformat ids
    5cf5337ef701 net/mlx5: Properly link new fs rules into the tree
    cbe5852d3d8d net/mlx5: offset comp irq index in name by one
    8c91c6085847 net/mlx5: Register devlink first under devlink lock
    7a836736b653 net/mlx5: SF, Stop waiting for FW as teardown was called
    89242d9584c3 netfilter: complete validation of user input
    e2c680fce985 Bluetooth: l2cap: Don't double set the HCI_CONN_MGMT_CONNECTED bit
    72473db90900 Bluetooth: SCO: Fix not validating setsockopt user input
    cc950d584610 Bluetooth: hci_sync: Fix using the same interval and window for Coded PHY
    de3c85d321bf Bluetooth: hci_sync: Use QoS to determine which PHY to scan
    a39cc8d08270 Bluetooth: ISO: Don't reject BT_ISO_QOS if parameters are unset
    c832164549f8 Bluetooth: ISO: Align broadcast sync_timeout with connection timeout
    01b11a056667 ipv6: fix race condition between ipv6_get_ifaddr and ipv6_del_addr
    5fd0b8b48696 ipv4/route: avoid unused-but-set-variable warning
    8a18d2f0c214 ipv6: fib: hide unused 'pn' variable
    cc10d3eadb58 octeontx2-af: Fix NIX SQ mode and BP config
    601a89ea24d0 af_unix: Clear stale u->oob_skb.
    cba376eb036c net: ks8851: Handle softirqs at the end of IRQ thread to fix hang
    e454abe5cc17 net: ks8851: Inline ks8851_rx_skb()
    499c993ca7cc bnxt_en: Reset PTP tx_avail after possible firmware reset
    4cbcf8cffa01 bnxt_en: Fix error recovery for RoCE ulp client
    c60ed825530b bnxt_en: Fix possible memory leak in bnxt_rdma_aux_device_init()
    1e91775286f2 s390/ism: fix receive message buffer allocation
    190d9efa5773 geneve: fix header validation in geneve[6]_xmit_skb
    740ffad95ca8 block: fix q->blkg_list corruption during disk rebind
    7af5582ea672 octeontx2-pf: Fix transmit scheduler resource leak
    b143e19dc28c xsk: validate user input for XDP_{UMEM|COMPLETION}_FILL_RING
    80fa4fb27303 u64_stats: fix u64_stats_init() for lockdep when used repeatedly in one file
    bdce65f2a95e net: openvswitch: fix unwanted error log on timeout policy probing
    60b87b5ecbe0 scsi: qla2xxx: Fix off by one in qla_edif_app_getstats()
    8a1821645708 scsi: hisi_sas: Modify the deadline for ata_wait_after_reset()
    aebbe59bd6a7 nouveau: fix function cast warning
    42cbe04a5c77 Revert "drm/qxl: simplify qxl_fence_wait"
    9bd1891cac32 cxl/core: Fix initialization of mbox_cmd.size_out in get event
    ea16e637e868 arm64: dts: imx8-ss-conn: fix usdhc wrong lpcg clock order
    f7ef9a437950 drm/msm/dpu: don't allow overriding data from catalog
    eb0ef4118693 cxl/core/regs: Fix usage of map->reg_type in cxl_decode_regblock() before assigned
    645cef136e47 cxl/mem: Fix for the index of Clear Event Record Handle
    c0781d6898dc firmware: arm_scmi: Make raw debugfs entries non-seekable
    6f9a8a54bb8e ARM: OMAP2+: fix USB regression on Nokia N8x0
    ff75f9f74975 mmc: omap: restore original power up/down steps
    f6c34c9bb3d1 mmc: omap: fix deferred probe
    267bcd2213ac mmc: omap: fix broken slot switch lookup
    086426dc64e0 ARM: OMAP2+: fix N810 MMC gpiod table
    d73e7fb9d7c8 ARM: OMAP2+: fix bogus MMC GPIO labels on Nokia N8x0
    7611722dc5dd media: cec: core: remove length check of Timer Status
    9fdfeef4c541 PM: s2idle: Make sure CPUs will wakeup directly on resume
    3860152c104f ACPI: scan: Do not increase dep_unmet for already met dependencies
    cfd758041d8b platform/chrome: cros_ec_uart: properly fix race condition
    1e3b8874d55c drm/amd/pm: fixes a random hang in S4 for SMU v13.0.4/11
    9ab5e44b9bac Bluetooth: Fix memory leak in hci_req_sync_complete()
    a9cd92bc051f ring-buffer: Only update pages_touched when a new page is touched
    3f28d49a328f raid1: fix use-after-free for original bio in raid1_write_request()
    1808b991c790 ARM: dts: imx7s-warp: Pass OV2680 link-frequencies
    4ca2a5fb54ea batman-adv: Avoid infinite loop trying to resize local TT
    341b5e1016cf ata: libata-scsi: Fix ata_scsi_dev_rescan() error path
    99618f8a7216 ata: libata-core: Allow command duration limits detection for ACS-4 drives
    05eedb5abc07 smb3: fix Open files on server counter going negative
    06644f0d7193 drm/tilcdc: Set preferred depth
    ff7ae7b32324 crypto: jitter - add RCT/APT support for different OSRs
    50cd24ddb6f0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    58e5c91d6701 x86/alternatives: Disable interrupts and sync when optimizing NOPs in place
    c878fd2d4c79 x86/alternatives: Sync core before enabling interrupts
    c2d64b9f52b6 qemux86: add configuration symbol to select values
    630c33229e6d sched/isolation: really align nohz_full with rcu_nocbs
    0e5e0f68e2e6 clear_warn_once: add a clear_warn_once= boot parameter
    46934791b902 clear_warn_once: bind a timer to written reset value
    cdee9e38ff32 clear_warn_once: expand debugfs to include read support
    82b562b81841 tools: Remove some options from CLANG_CROSS_FLAGS
    36dc380b776b libbpf: Fix build warning on ref_ctr_off
    9e3e1fe20982 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    e497a4a5da65 perf: x86-32: explicitly include <errno.h>
    7b57ddd89565 perf: mips64: Convert __u64 to unsigned long long
    1cfc19423dc7 perf: fix bench numa compilation
    98bc2815fade perf: add SLANG_INC for slang.h
    17209a70b9b3 perf: add sgidefs.h to for mips builds
    9cd4258d910a perf: change --root to --prefix for python install
    8110a4f26628 perf: add 'libperl not found' warning
    bc89d5e08f77 perf: force include of <stdbool.h>
    4f6c760cc876 fat: Replace prandom_u32() with get_random_u32()
    bc53117b12b2 fat: don't use obsolete random32 call in namei_vfat
    30b2236ab378 FAT: Added FAT_NO_83NAME
    cef98d22b4ed FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    0bbd7daba9e1 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5883fc340084 aufs6: adapt to v6.6 i_op->ctime changes
    c4342d979bf2 aufs6: fix magic.mk include path
    35266bc2dc81 aufs6: adapt to v6.6
    8edede4e98be aufs6: core
    712248233ebe aufs6: standalone
    3b71a8a848d8 aufs6: mmap
    3e2924871f37 aufs6: base
    7f4907a93101 aufs6: kbuild
    d2f7b03e4aa7 yaffs2: update VFS ctime operations to 6.6+
    bcd6cfcd1aa0 yaffs2: v6.5 fixups
    cc615704b5f5 yaffs2: Fix miscalculation of devname buffer length
    8ef2e22dcf91 yaffs2: convert user_namespace to mnt_idmap
    c9c749f9f7d3 yaffs2: replace bdevname call with sprintf
    395b01cdc39d yaffs2: convert read_page -> readfolio
    d98b07e43ba6 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    613c6d50fdbe yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    622c4648936f yaffs2: v5.12+ build fixups (not runtime tested)
    7562133d4090 yaffs: include blkdev.h
    dbd44252cd59 yaffs: fix misplaced variable declaration
    c223a10b1ac0 yaffs2: v5.6 build fixups
    90f6007cfbf4 yaffs2: fix memory leak when /proc/yaffs is read
    37ee169c5ea1 yaffs: add strict check when call yaffs_internal_read_super
    b6e007b8abb6 yaffs: repair yaffs_get_mtd_device
    fb98f65a466a yaffs: Fix build failure by handling inode i_version with proper atomic API
    51e0aac75ea2 yaffs2: fix memory leak in mount/umount
    2b74a0cae7b0 yaffs: Avoid setting any ACL releated xattr
    ff4130a9c376 Yaffs:check oob size before auto selecting Yaffs1
    ba95b409c67c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    8fa35eba9056 yaffs2: adjust to proper location of MS_RDONLY
    1eb5deaad8c4 yaffs2: import git revision b4ce1bb (jan, 2020)
    4dce67c1e8c8 initramfs: allow an optional wrapper script around initramfs generation
    2f603d83fcc4 pnmtologo: use relocatable file name
    664a6a0a484b tools: use basename to identify file in gen-mach-types
    9de64bc0c185 lib/build_OID_registry: fix reproducibility issues
    ae9b80797295 vt/conmakehash: improve reproducibility
    a972323151bd iwlwifi: select MAC80211_LEDS conditionally
    15d2adcc0198 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5556a6c04b19 arm64/perf: Fix wrong cast that may cause wrong truncation
    5552dc768ffc defconfigs: drop obselete options
    00fe4152df31 arm64/perf: fix backtrace for AAPCS with FP enabled
    3888d0652edf linux-yocto: Handle /bin/awk issues
    3d55d299f23a uvesafb: provide option to specify timeout for task completion
    23c068c080be uvesafb: print error message when task timeout occurs
    edbfc939266e compiler.h: Undef before redefining __attribute_const__
    c99ae7e2a19a vmware: include jiffies.h
    572d84d928c8 Resolve jiffies wrapping about arp
    fdcd47cac843 nfs: Allow default io size to be configured.
    927d48801098 check console device file on fs when booting
    57cc27f821dd mount_root: clarify error messages for when no rootfs found
    1b53d82a8152 mconf: fix output of cflags and libraries
    1811da09f42c menuconfig,mconf-cfg: Allow specification of ncurses location
    83c2e0c6eb1f modpost: mask trivial warnings
    6de673039484 kbuild: exclude meta directory from distclean processing
    6decd32815f5 powerpc: serialize image targets
    f6b683b38318 arm: serialize build targets
    e798b09ebf57 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    dc8a1e5a88f8 x86_64_defconfig: Fix warnings
    68491e5f72b6 powerpc/ptrace: Disable array-bounds warning with gcc8
    d71ebfce3004 powerpc: Disable attribute-alias warnings from gcc8
    62f50884b8b1 powerpc: kexec fix for powerpc64
    da6871c62c37 powerpc: Add unwind information for SPE registers of E500 core
    f161c880c11d mips: make current_cpu_data preempt safe
    5e94a8247ce7 mips: vdso: fix 'jalr $t9' crash in vdso code
    19e36714b1c7 mips: Kconfig: add QEMUMIPS64 option
    e2e537db3cbd 4kc cache tlb hazard: tlbp cache coherency
    aee9870611e5 malta uhci quirks: make allowance for slow 4k(e)c
    881948cd1517 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    98ec1963fcb7 arm64: defconfig: cleanup config options
    f1727c537ba8 vexpress: Pass LOADADDR to Makefile
    4474c32dc24a arm: ARM EABI socketcall
    75e31a2b70fd ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 0972d4edde..2f3008140d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5272561b019836f2ee2f175b23029649431d6fca"
-SRCREV_meta ?= "c3d1322fb6ff68cdcf4d7a3c1140d81bfdc1320a"
+SRCREV_machine ?= "471a0c8db3216975eaf56a8fe3a19550a6210e27"
+SRCREV_meta ?= "1cd08f1fb2b33510783fa31c11150038a1ff8c42"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.27"
+LINUX_VERSION ?= "6.6.28"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 3b3e277c38..05ce4c5713 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.27"
+LINUX_VERSION ?= "6.6.28"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
-SRCREV_meta ?= "c3d1322fb6ff68cdcf4d7a3c1140d81bfdc1320a"
+SRCREV_machine ?= "c59995318b24c6b5a9969d43c0ca0179612aac2d"
+SRCREV_meta ?= "1cd08f1fb2b33510783fa31c11150038a1ff8c42"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index a02452feda..2930343090 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "51c07ec56f85fbbfa9ea6944a4b14eee7e715566"
-SRCREV_machine:qemuarm64 ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
-SRCREV_machine:qemuloongarch64 ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
-SRCREV_machine:qemumips ?= "4bf661a8afc7323030a6af73fc5640ef4dabe01f"
-SRCREV_machine:qemuppc ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
-SRCREV_machine:qemuriscv64 ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
-SRCREV_machine:qemuriscv32 ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
-SRCREV_machine:qemux86 ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
-SRCREV_machine:qemux86-64 ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
-SRCREV_machine:qemumips64 ?= "d3abfe3c736d5869cb26f24c653b7e6eeafac715"
-SRCREV_machine ?= "4f3a41583a21c529bc7fc3a6c4a33bdffb16fa24"
-SRCREV_meta ?= "c3d1322fb6ff68cdcf4d7a3c1140d81bfdc1320a"
+SRCREV_machine:qemuarm ?= "c57230148694fc5902bdf9d157232c6ebb88dc1a"
+SRCREV_machine:qemuarm64 ?= "c59995318b24c6b5a9969d43c0ca0179612aac2d"
+SRCREV_machine:qemuloongarch64 ?= "c59995318b24c6b5a9969d43c0ca0179612aac2d"
+SRCREV_machine:qemumips ?= "997005f111bca244db370a8ecaa3bcb37302d800"
+SRCREV_machine:qemuppc ?= "c59995318b24c6b5a9969d43c0ca0179612aac2d"
+SRCREV_machine:qemuriscv64 ?= "c59995318b24c6b5a9969d43c0ca0179612aac2d"
+SRCREV_machine:qemuriscv32 ?= "c59995318b24c6b5a9969d43c0ca0179612aac2d"
+SRCREV_machine:qemux86 ?= "c59995318b24c6b5a9969d43c0ca0179612aac2d"
+SRCREV_machine:qemux86-64 ?= "c59995318b24c6b5a9969d43c0ca0179612aac2d"
+SRCREV_machine:qemumips64 ?= "262154440336f42524f03266bb0cc6e7ed62f9d6"
+SRCREV_machine ?= "c59995318b24c6b5a9969d43c0ca0179612aac2d"
+SRCREV_meta ?= "1cd08f1fb2b33510783fa31c11150038a1ff8c42"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "5e828009c8b380739e13da92be847f10461c38b1"
+SRCREV_machine:class-devupstream ?= "ba151416051a45ffca565f708584b9cd5c971481"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.27"
+LINUX_VERSION ?= "6.6.28"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


