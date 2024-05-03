Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED2EC25B75
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 02:41:04 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.4005.1714704059377009048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 19:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hFEU5cGv;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-790c7785ddbso433379085a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 19:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714704058; x=1715308858; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QbF3LUuwAx0JF7sZn1gxmMh1ZakZBC091DeBIv7pXqM=;
        b=hFEU5cGvnpTLd/ElkA630jwS/QrBmQwgFkLHve4LlFgGn7yJqrVxOYjUL1ADt2wQzy
         ZQIRokUKBX7lTLyRo83HihWH8iQ1V+MDYvZEDKmGax7/Bv4cdd1HffwFTKobSlJazPbn
         B/YMtxdCdNk8gNOiQGMRFeQxqdqf9ufgoDDuZDmk7TrvFVwYoySsS8kiWaLjtbrFgngZ
         2Otb62sTFIpzCA3yAAKKeD2P0fX/N6C+9HS5lwfo8s5jUcF88vgYc8pMkhl2fJc0a0AS
         n3Le7OYpbJm+RZapmPKYiNoLQsv6tVYXRb59uOH/v8o3y/KkthavH7hjTg1r9TMhUz98
         80gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714704058; x=1715308858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QbF3LUuwAx0JF7sZn1gxmMh1ZakZBC091DeBIv7pXqM=;
        b=KdOJ0zqYBfR6kNQpL5fLCDAlh1xt35vHRcN3tyO4nS8ue1DoRME68tfJWoquUv/Qhb
         6lrp0pWMUZQfT29HEXpxZNdj6Ze1ugJFETn6gqi3+/K3Dm/Xz3F+/GKyMk47kgFuzhKl
         VIw9QDk8O/pFdbFZr5Rto54MNQtIUqrdPEjyHQgQbw6Uby5XdRwwRn4nf+0yCzjZpjM+
         1Qzrw0SgQd1FaQKN+cvRXIOm8w44yX/u450ancyYqN29tJI6bY7hYIB1EIv15CuFxAvH
         kzt4uuB42fKll3WfntcOujTprq6TuZGZWMs+MzBMddp9S5XfOMhXGkzBU/jYREhBBPi1
         aVvQ==
X-Gm-Message-State: AOJu0YxgaZJ78JpWizvWpw0AfEifc7yhIGoy72UExRIQZBku/X7sENaJ
	1tCKHKmfS7ohB8tfzwy9c6vx08+7nht+DNyPxFJjdGbunfRbUtUnr97JBA==
X-Google-Smtp-Source: AGHT+IFSPody/1K05+6CrUd/qAhhuXsfpE0rTEGIck/ROxtoRFYR5bx7QxHojPEGz1xi3Gr7h1KOXw==
X-Received: by 2002:a05:620a:2953:b0:790:98cd:647e with SMTP id n19-20020a05620a295300b0079098cd647emr1996919qkp.11.1714704058236;
        Thu, 02 May 2024 19:40:58 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id bm34-20020a05620a19a200b0078ec3aa9cc7sm856163qkb.25.2024.05.02.19.40.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 19:40:57 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 11/12] linux-yocto/6.6: update to v6.6.29
Date: Thu,  2 May 2024 22:40:39 -0400
Message-Id: <29bbb045219d1b56eb794932c164923bbcaa8464.1714703667.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1714703667.git.bruce.ashfield@gmail.com>
References: <cover.1714703667.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 02:41:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198942

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    a3463f081046 Linux 6.6.29
    63cc4f14bb03 selftests: kselftest: Fix build failure with NOLIBC
    c67f926ec870 thunderbolt: Reset only non-USB4 host routers in resume
    b0f4478838be PCI/ASPM: Fix deadlock when enabling ASPM
    3b629239773b ksmbd: common: use struct_group_attr instead of struct_group for network_open_info
    4cbb88351b55 ksmbd: clear RENAME_NOREPLACE before calling vfs_rename
    5c20b242d4fe ksmbd: validate request buffer size in smb2_allocate_rsp_buf()
    3160d9734453 ksmbd: fix slab-out-of-bounds in smb2_allocate_rsp_buf
    6355b468e2a7 powerpc/ftrace: Ignore ftrace locations in exit text sections
    43a71c1b4b3a virtio_net: Do not send RSS key if it is not supported
    bd41ee1efd47 net: dsa: mt7530: fix enabling EEE on MT7531 switch on all boards
    21b9d89d9342 net: dsa: mt7530: fix improper frames on all 25MHz and 40MHz XTAL MT7530
    2382eae66b19 nilfs2: fix OOB in nilfs_set_de_type
    e46d3be714ad bootconfig: use memblock_free_late to free xbc memory to buddy
    a019b44b1bc6 nouveau: fix instmem race condition around ptr stores
    5d2f587aef37 drm/vmwgfx: Fix crtc's atomic check conditional
    f1769cb2c912 drm/vmwgfx: Sort primary plane formats by order of preference
    65674218b43f drm/vmwgfx: Fix prime import/export
    db74904a93a3 drm/amdgpu: remove invalid resource->start check v2
    aa02d43367a9 drm/amdkfd: Fix memory leak in create_process failure
    ef13eeca7c79 drm/amdgpu: validate the parameters of bo mapping operations more clearly
    885d4c31a432 fuse: fix leaked ENOSYS error on first statx call
    cc10db003033 mm/shmem: inline shmem_is_huge() for disabled transparent hugepages
    882e1180c83f mm/memory-failure: fix deadlock when hugetlb_optimize_vmemmap is enabled
    c85106fb08f4 mm,swapops: update check in is_pfn_swap_entry for hwpoison entries
    db01bfbdddd8 mm/userfaultfd: allow hugetlb change protection upon poison entry
    81cf85ae4f2d init/main.c: Fix potential static_command_line memory overflow
    31f815cb4360 arm64: hibernate: Fix level3 translation fault in swsusp_save()
    e972b6a70126 arm64/head: Disable MMU at EL2 before clearing HCR_EL2.E2H
    cdf811a93747 KVM: x86/mmu: Write-protect L2 SPTEs in TDP MMU when clearing dirty status
    947d518e0daf KVM: x86/pmu: Do not mask LVTPC when handling a PMI on AMD platforms
    037e48ceccf1 KVM: x86/pmu: Disable support for adaptive PEBS
    bdda0c17fe90 KVM: x86: Snapshot if a vCPU's vendor model is AMD vs. Intel compatible
    7fce9f0f4810 sched: Add missing memory barrier in switch_mm_cid
    ac107356aabc fs: sysfs: Fix reference leak in sysfs_break_active_protection()
    8defb1d22ba0 speakup: Avoid crash on very long word
    2a19c2a5caf0 mei: me: disable RPL-S on SPS and IGN firmwares
    f356fd0cbd9c usb: gadget: f_ncm: Fix UAF ncm object at re-bind after usb ep transport error
    aa61f87fd18b usb: Disable USB3 LPM at shutdown
    8a139fa44870 usb: dwc2: host: Fix dereference issue in DDMA completion flow.
    2ff436b63998 Revert "usb: cdc-wdm: close race between read and workqueue"
    d841a93b5a24 USB: serial: option: add Telit FN920C04 rmnet compositions
    0772a60994ee USB: serial: option: add Rolling RW101-GL and RW135-GL support
    b39ecc8c97ab USB: serial: option: support Quectel EM060K sub-models
    aeb7de0a3840 USB: serial: option: add Lonsung U8300/U9300 product
    f91606d71fab USB: serial: option: add support for Fibocom FM650/FG650
    590d0e130757 USB: serial: option: add Fibocom FM135-GL variants
    83290f9f0719 serial: core: Fix missing shutdown and startup for serial base port
    7ae7104d5434 serial: core: Clearing the circular buffer before NULLifying it
    12e9459ddaea serial: stm32: Reset .throttled state in .startup()
    9f9be0ec3130 serial: stm32: Return IRQ_NONE in the ISR if no handling happend
    52aaf1ff1462 serial/pmac_zilog: Remove flawed mitigation for rx irq flood
    5f40fd6ca2cf serial: mxs-auart: add spinlock around changing cts state
    59f33af97961 comedi: vmk80xx: fix incomplete endpoint checking
    9954c514424f thunderbolt: Fix wake configurations after device unplug
    3238b23e661e thunderbolt: Avoid notify PM core about runtime PM resume
    1d7f1049035b binder: check offset alignment in binder_get_object()
    ce2ec45c7817 ALSA: hda/realtek - Enable audio jacks of Haier Boyue G42 with ALC269VC
    90782cf17e9c ALSA: hda/realtek: Add quirks for Huawei Matebook D14 NBLB-WAX9N
    05e6bfd31b06 ALSA: hda/tas2781: Add new vendor_id and subsystem_id to support ThinkPad ICE-1
    1da8f46f1332 ALSA: hda/tas2781: correct the register for pow calibrated data
    02d32d5acb13 ALSA: seq: ump: Fix conversion from MIDI2 to MIDI1 UMP messages
    388a7302beda net/mlx5: E-switch, store eswitch pointer before registering devlink_param
    00cf046afe34 x86/cpufeatures: Fix dependencies for GFNI, VAES, and VPCLMULQDQ
    5facc0428bd2 x86/bugs: Fix BHI retpoline check
    c0dcd5c072e2 clk: mediatek: Do a runtime PM get on controllers during probe
    2c077fdfd09d clk: Get runtime PM before walking tree for clk_summary
    888a44f261ae clk: Show active consumers of clocks in debugfs
    60ff482c4205 clk: Get runtime PM before walking tree during disable_unused
    731ffd8dea1c clk: Initialize struct clk_core kref earlier
    02a516cbda04 clk: Remove prepare_lock hold assertion in __clk_release()
    d0d04efa2e36 interconnect: Don't access req_list while it's being manipulated
    d7cc1d721564 platform/x86/amd/pmc: Extend Framework 13 quirk to more BIOSes
    3adcbec4dc62 usb: new quirk to reduce the SET_ADDRESS request timeout
    26cc5cb00310 usb: xhci: Add timeout argument in address_device USB HCD callback
    ac1ddbed5b2e drm: panel-orientation-quirks: Add quirk for Lenovo Legion Go
    771ad4dfbdbb ALSA: scarlett2: Rename scarlett_gen2 to scarlett2
    4afc65cf78bd PCI: Simplify pcie_capability_clear_and_set_word() to ..._clear_word()
    d9a28916ff35 PCI/DPC: Use FIELD_GET()
    4ef929059230 ALSA: scarlett2: Add Focusrite Clarett 2Pre and 4Pre USB support
    92088c488e20 ALSA: scarlett2: Add Focusrite Clarett+ 2Pre and 4Pre support
    2c57a5c68f49 ALSA: scarlett2: Add correct product series name to messages
    9c48e24cb71b ALSA: scarlett2: Default mixer driver to enabled
    3c1d704d9266 thunderbolt: Reset topology created by the boot firmware
    90cdb98254ef thunderbolt: Make tb_switch_reset() support Thunderbolt 2, 3 and USB4 routers
    dc32d754d7cc thunderbolt: Introduce tb_path_deactivate_hop()
    6c24584aface thunderbolt: Introduce tb_port_reset()
    ac630fb8dbb5 ASoC: ti: Convert Pandora ASoC to GPIO descriptors
    a95f279ecd33 ALSA: scarlett2: Add support for Clarett 8Pre USB
    a299e0bf4d2d ALSA: scarlett2: Move USB IDs out from device_info struct
    259486b5bdc6 drm/radeon: make -fstrict-flex-arrays=3 happy
    158010bf1a84 drm/panel: visionox-rm69299: don't unregister DSI device
    6690cc2732e2 drm: nv04: Fix out of bounds access
    2df56f4ea769 s390/cio: fix race condition during online processing
    e43c12451a7d s390/qdio: handle deferred cc1
    c418d7a675d8 perf lock contention: Add a missing NULL check
    910be4f9f805 RDMA/mlx5: Fix port number for counter query in multi-port configuration
    b42852826323 RDMA/cm: Print the old state when cm_destroy_id gets timeout
    99a7ccc4e038 RDMA/rxe: Fix the problem "mutex_destroy missing"
    75170320459a drm/i915/mst: Limit MST+DSC to TGL+
    7ba7f7074006 net: ethernet: ti: am65-cpsw-nuss: cleanup DMA Channels before using them
    6855f724f196 net: ethernet: mtk_eth_soc: fix WED + wifi reset
    cd81184797a0 gpiolib: swnode: Remove wrong header inclusion
    121fb75414ab s390/ism: Properly fix receive message buffer allocation
    f8de1b6208bf net: dsa: mt7530: fix port mirroring for MT7988 SoC switch
    d1be39605392 net: dsa: mt7530: fix mirroring frames received on local port
    40f4ced305c6 tun: limit printing rate when illegal packet received by tun dev
    0ada9981cdfe ice: Fix checking for unsupported keys on non-tunnel device
    8d2e34e4e20e ice: tc: allow zero flags in parsing tc flower
    91efeadfa20e ice: tc: check src_vsi in case of traffic from VF
    93d565ebe41f net: stmmac: Fix IP-cores specific MAC capabilities
    178856bf1f50 net: stmmac: Fix max-speed being ignored on queue re-init
    0580dcc53a7f net: stmmac: Apply half-duplex-less constraint for DW QoS Eth only
    447e00fb04f7 octeontx2-pf: fix FLOW_DIS_IS_FRAGMENT implementation
    622479d10047 net: change maximum number of UDP segments to 128
    48c4bb81df19 net/mlx5e: Prevent deadlock while disabling aRFS
    c7fbc7bb48fc net/mlx5: Lag, restore buckets number to default after hash LAG deactivation
    ff928d7bb1d8 net: sparx5: flower: fix fragment flags handling
    022d81a709cd af_unix: Don't peek OOB data without MSG_OOB.
    aea3cb8cfb30 af_unix: Call manage_oob() for every skb in unix_stream_read_generic().
    4ed82dd368ad netfilter: flowtable: incorrect pppoe tuple
    a2471d271042 netfilter: flowtable: validate pppoe header
    ebf7c9746f07 netfilter: nft_set_pipapo: do not free live element
    3f59ac29dea0 netfilter: br_netfilter: skip conntrack input hook for promisc packets
    ad333578f736 netfilter: nf_tables: Fix potential data-race in __nft_obj_type_get()
    a9ebf340d123 netfilter: nf_tables: Fix potential data-race in __nft_expr_type_get()
    5562a51c6e4e scsi: ufs: qcom: Add missing interconnect bandwidth values for Gear 5
    ac4ad513de4f arm64: tlb: Fix TLBI RANGE operand
    663f72cf95ed arm64/mm: Modify range-based tlbi to decrement scale
    bc835b838999 net: usb: ax88179_178a: avoid writing the mac address before first reading
    37e14dbe8c8f scsi: core: Fix handling of SCMD_FAIL_IF_RECOVERING
    998f52a86055 random: handle creditable entropy from atomic process context
    9f39e9e367b3 selftests/ftrace: Limit length in subsystem-enable tests
    5b84dab87cdb SUNRPC: Fix rpcgss_context trace event acceptor field
    5e3eb862df9f drm/i915/vma: Fix UAF on destroy against retire race
    63fb4af8a069 io_uring: Fix io_cqring_wait() not restoring sigmask on get_timespec64() failure
    390a71e361f4 media: videobuf2: request more buffers for vb2_read
    bef71390ac37 drm/msm/dpu: populate SSPP scaler block version
    fe09b8d26e1a selftests: timers: Fix posix_timers ksft_print_msg() warning
    dbfb5232bd83 ceph: redirty page before returning AOP_WRITEPAGE_ACTIVATE
    985b9ee8a2cf ceph: rename _to_client() to _to_fs_client()
    2e2023e9a4c2 ceph: pass the mdsc to several helpers
    a17236f99f49 drm/amd/display: Do not recursively call manual trigger programming
    c626db7151bf selftests/timers/posix_timers: Reimplement check_timer_distribution()
    b04cae49a5e7 selftests: timers: Convert posix_timers test to generate KTAP output
    9d106175b7a0 drm/i915: Disable live M/N updates when using bigjoiner
    ccb0934aeb3f drm/i915: Adjust seamless_m_n flag behaviour
    deaeb5b64c5b drm/i915: Enable VRR later during fastsets
    7e50ac4203d6 drm/i915: Extract intel_crtc_vblank_evade_scanlines()
    e19dc8c49e97 drm/i915: Change intel_pipe_update_{start,end}() calling convention
    51cc733fb48e drm/i915/cdclk: Fix voltage_level programming edge case
    6711b0817a38 drm/i915/mst: Reject FEC+MST on ICL
    6b625d2743b4 drm/i915: Fix FEC pipe A vs. DDI A mixup
    488d4cbc6f28 smb: client: refresh referral without acquiring refpath_lock
    645f332c6b63 smb: client: guarantee refcounted children from parent session
    441786be0c19 smb3: show beginning time for per share stats
    6202996a1c18 smb: client: fix UAF in smb2_reconnect_server()
    fe1bad73d35f smb: client: remove extra @chan_count check in __cifs_put_smb_ses()
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
index 2f3008140d..ea429692d8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "471a0c8db3216975eaf56a8fe3a19550a6210e27"
-SRCREV_meta ?= "1cd08f1fb2b33510783fa31c11150038a1ff8c42"
+SRCREV_machine ?= "99d3632c1cf7688066e57aea89f9adfe8d1a5ca5"
+SRCREV_meta ?= "a78c74a3510067017dda1926f88bd914f0a053b3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.28"
+LINUX_VERSION ?= "6.6.29"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 05ce4c5713..bdad73bbbc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.28"
+LINUX_VERSION ?= "6.6.29"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c59995318b24c6b5a9969d43c0ca0179612aac2d"
-SRCREV_meta ?= "1cd08f1fb2b33510783fa31c11150038a1ff8c42"
+SRCREV_machine ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
+SRCREV_meta ?= "a78c74a3510067017dda1926f88bd914f0a053b3"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 2930343090..12197ba414 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c57230148694fc5902bdf9d157232c6ebb88dc1a"
-SRCREV_machine:qemuarm64 ?= "c59995318b24c6b5a9969d43c0ca0179612aac2d"
-SRCREV_machine:qemuloongarch64 ?= "c59995318b24c6b5a9969d43c0ca0179612aac2d"
-SRCREV_machine:qemumips ?= "997005f111bca244db370a8ecaa3bcb37302d800"
-SRCREV_machine:qemuppc ?= "c59995318b24c6b5a9969d43c0ca0179612aac2d"
-SRCREV_machine:qemuriscv64 ?= "c59995318b24c6b5a9969d43c0ca0179612aac2d"
-SRCREV_machine:qemuriscv32 ?= "c59995318b24c6b5a9969d43c0ca0179612aac2d"
-SRCREV_machine:qemux86 ?= "c59995318b24c6b5a9969d43c0ca0179612aac2d"
-SRCREV_machine:qemux86-64 ?= "c59995318b24c6b5a9969d43c0ca0179612aac2d"
-SRCREV_machine:qemumips64 ?= "262154440336f42524f03266bb0cc6e7ed62f9d6"
-SRCREV_machine ?= "c59995318b24c6b5a9969d43c0ca0179612aac2d"
-SRCREV_meta ?= "1cd08f1fb2b33510783fa31c11150038a1ff8c42"
+SRCREV_machine:qemuarm ?= "45982c347ee123883a88f220d1d9a740e2c2b959"
+SRCREV_machine:qemuarm64 ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
+SRCREV_machine:qemuloongarch64 ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
+SRCREV_machine:qemumips ?= "738f344ef6da38ebf6fcca87b701281c930b16e4"
+SRCREV_machine:qemuppc ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
+SRCREV_machine:qemuriscv64 ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
+SRCREV_machine:qemuriscv32 ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
+SRCREV_machine:qemux86 ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
+SRCREV_machine:qemux86-64 ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
+SRCREV_machine:qemumips64 ?= "7f4b889b7acb9fe36e290bf40c2e9b6cec523f6d"
+SRCREV_machine ?= "6655dc03f5de7bb734da3ec8eb97f9be281dfbdb"
+SRCREV_meta ?= "a78c74a3510067017dda1926f88bd914f0a053b3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "ba151416051a45ffca565f708584b9cd5c971481"
+SRCREV_machine:class-devupstream ?= "a3463f08104612fc979c41fa54733e925205d3d7"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.28"
+LINUX_VERSION ?= "6.6.29"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


