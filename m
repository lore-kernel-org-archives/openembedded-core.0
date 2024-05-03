Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13E5C25B5C
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 03:00:35 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.4335.1714705227905460401
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 20:00:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BLl7xGaa;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-69cb4a046dfso37897056d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 20:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714705227; x=1715310027; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvDbdtbL07zj0/k88VCS3Q2tPfxhdSBCPlqWFI9ka90=;
        b=BLl7xGaaAzgqRMb6+W8kNHkJoEhrYa85u+zMPzgazW2befKNnniheFVFdAS9F1yODg
         F3bafMKz77s9Vg67s6bL5tn9H0UmE6HkK2vsOGf3RQn2WXYknqKds4waZzbfqfh1Gyp1
         WGzFn6ejUJROiXECQ1ZDjuBr/9VjsIlBNxdFWg6On/9cX7tsfpeWPp6q3iU02Yb29JW4
         FyNUFGgReunraaimoVwA7oO919UgXJYrNWQmVFQKZKl+nPM05cYscXhyg2Z3VQcLhnok
         sMwIJGDF+B18ga/YCorVQ+thXQiIt3jq1KSzKtvPCYLRvjdrXAhSDmuK1i7xxY+dHjH0
         gWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714705227; x=1715310027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvDbdtbL07zj0/k88VCS3Q2tPfxhdSBCPlqWFI9ka90=;
        b=ITO0Qu3Ni9h/2GxQQTXWmeC+1BpRandydZT3Dojr/A/EJ53bxa2KsLL5Auh4PtXFdr
         mmhxIoQ2ty6knr96JyQB9u/kQBaZhnOq3o7Ij7iBwoicV01x762ChouAAhoyGyZJuRbb
         b129AW6sJT7Y5LgLYXQzEZDyhG2Md0d0Wgl6OzthMYipWWTkTD/URcHJo5i2H3Mwvn4x
         NOS52jXczDOTzwLJs/kLvX+9HhPT+CwPKPkJm3BQrUfrCeARP8FhH6ie4n916VRWEW/t
         /mfaeAw706tjPrBQRtJhTD+E5ZsBZQIdUGe3JB3tFmEp/L/WSkuwOLJET0E2hadE/eO2
         VWxA==
X-Gm-Message-State: AOJu0Yz5se9BN77tiIqelrldfovQzptFdEHzyeNA1+htgbIPPGrbS/K4
	AUf06+tVdptfsOlEtKl8XnUHhrL+YgB1XkdGx/FIVZVT0R4g0wXh1ZumHw==
X-Google-Smtp-Source: AGHT+IG49Nfv2arcVOW2dDpYE3Vx38F1QkvHNjt0RechG0NCjy88Eek7cBfkM3al+mh0XQF1RmcGVg==
X-Received: by 2002:a05:6214:29ea:b0:6a0:c924:10a with SMTP id jv10-20020a05621429ea00b006a0c924010amr1533340qvb.38.1714705226527;
        Thu, 02 May 2024 20:00:26 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id mi5-20020a056214558500b006a0fa96013asm839357qvb.138.2024.05.02.20.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 20:00:25 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 09/10] linux-yocto/6.1: update to v6.1.89
Date: Thu,  2 May 2024 23:00:14 -0400
Message-Id: <20240503030015.374078-9-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240503030015.374078-1-bruce.ashfield@gmail.com>
References: <20240503030015.374078-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 03:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198964

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.1 to the latest korg -stable release that comprises
the following commits:

    dcbc050cb0d3 Linux 6.1.89
    8a5291736e70 Revert "ASoC: ti: Convert Pandora ASoC to GPIO descriptors"
    f2295faba5e8 Linux 6.1.88
    0f7908a016c0 PCI/ASPM: Fix deadlock when enabling ASPM
    67a877128bbe ksmbd: common: use struct_group_attr instead of struct_group for network_open_info
    4687606d94de ksmbd: clear RENAME_NOREPLACE before calling vfs_rename
    21ff9d7d223c ksmbd: validate request buffer size in smb2_allocate_rsp_buf()
    b80ba648714e ksmbd: fix slab-out-of-bounds in smb2_allocate_rsp_buf
    7d51db455ca0 net: dsa: mt7530: fix enabling EEE on MT7531 switch on all boards
    41a004ffba9b net: dsa: mt7530: fix improper frames on all 25MHz and 40MHz XTAL MT7530
    d9c2f69cc12c net: dsa: introduce preferred_default_local_cpu_port and use on MT7530
    013c787d2311 net: dsa: mt7530: set all CPU ports in MT7531_CPU_PMAP
    897ac5306bbe nilfs2: fix OOB in nilfs_set_de_type
    1e7feb31a18c bootconfig: use memblock_free_late to free xbc memory to buddy
    ad74d208f213 nouveau: fix instmem race condition around ptr stores
    bcff1ed2ff19 drm/vmwgfx: Fix crtc's atomic check conditional
    8f79b42d1c21 drm/vmwgfx: Sort primary plane formats by order of preference
    212e3baccdb1 drm/amdgpu: validate the parameters of bo mapping operations more clearly
    5ef7ba2799a3 mm/memory-failure: fix deadlock when hugetlb_optimize_vmemmap is enabled
    76c2f4d426a5 init/main.c: Fix potential static_command_line memory overflow
    f7e71a7cf399 arm64: hibernate: Fix level3 translation fault in swsusp_save()
    e09465aeccf1 KVM: x86/pmu: Do not mask LVTPC when handling a PMI on AMD platforms
    0fb74c00d140 KVM: x86/pmu: Disable support for adaptive PEBS
    e487b8eccf67 KVM: x86: Snapshot if a vCPU's vendor model is AMD vs. Intel compatible
    5d43e072285e fs: sysfs: Fix reference leak in sysfs_break_active_protection()
    89af25bd4b4b speakup: Avoid crash on very long word
    7c6f941492b7 mei: me: disable RPL-S on SPS and IGN firmwares
    0588bbbd718a usb: gadget: f_ncm: Fix UAF ncm object at re-bind after usb ep transport error
    a676b17edb52 usb: Disable USB3 LPM at shutdown
    9de10b59d168 usb: dwc2: host: Fix dereference issue in DDMA completion flow.
    8672ad663a22 Revert "usb: cdc-wdm: close race between read and workqueue"
    4ed7c7720aa0 USB: serial: option: add Telit FN920C04 rmnet compositions
    19f98f214bd6 USB: serial: option: add Rolling RW101-GL and RW135-GL support
    25a299c566bf USB: serial: option: support Quectel EM060K sub-models
    9eba0750255a USB: serial: option: add Lonsung U8300/U9300 product
    3e34029b3c11 USB: serial: option: add support for Fibocom FM650/FG650
    3c4ba8a6c589 USB: serial: option: add Fibocom FM135-GL variants
    282b223cfd5b serial: stm32: Reset .throttled state in .startup()
    87d15af82d24 serial: stm32: Return IRQ_NONE in the ISR if no handling happend
    bbaafbb4651f serial/pmac_zilog: Remove flawed mitigation for rx irq flood
    2c9b943e9924 serial: mxs-auart: add spinlock around changing cts state
    ac882d6b21bf comedi: vmk80xx: fix incomplete endpoint checking
    9eae1facfc06 thunderbolt: Fix wake configurations after device unplug
    38e10c9faa95 thunderbolt: Avoid notify PM core about runtime PM resume
    a6d2a8b211c8 binder: check offset alignment in binder_get_object()
    d05380576fb4 ALSA: hda/realtek - Enable audio jacks of Haier Boyue G42 with ALC269VC
    943c3e45c80a x86/cpufeatures: Fix dependencies for GFNI, VAES, and VPCLMULQDQ
    d17075a93501 x86/bugs: Fix BHI retpoline check
    165d22647257 clk: mediatek: Do a runtime PM get on controllers during probe
    c1d87d56af06 clk: mediatek: clk-mtk: Extend mtk_clk_simple_probe()
    a4fe8813a786 clk: mediatek: clk-mux: Propagate struct device for mtk-mux
    6f5f72a684a2 clk: mediatek: clk-mtk: Propagate struct device for composites
    082b831488a4 clk: mediatek: clk-gate: Propagate struct device with mtk_clk_register_gates()
    647a25b07d6d clk: mediatek: mt8192: Propagate struct device for gate clocks
    0904f9ef910a clk: mediatek: mt8192: Correctly unregister and free clocks on failure
    83ada89e4a86 clk: Get runtime PM before walking tree for clk_summary
    5a704c267a21 clk: Show active consumers of clocks in debugfs
    5833b99cf8fd clk: remove unnecessary (void*) conversions
    a424e713e0cc clk: Get runtime PM before walking tree during disable_unused
    5558b3b68c24 clk: Initialize struct clk_core kref earlier
    43bc4cfef2b1 clk: Print an info line before disabling unused clocks
    349dbfd65f86 clk: Remove prepare_lock hold assertion in __clk_release()
    f6ac4fdfa519 usb: new quirk to reduce the SET_ADDRESS request timeout
    5f9b63193bca usb: xhci: Add timeout argument in address_device USB HCD callback
    1d011d972f58 drm: panel-orientation-quirks: Add quirk for Lenovo Legion Go
    7989b04d6cc4 ALSA: scarlett2: Rename scarlett_gen2 to scarlett2
    39f932d2953b PCI: Simplify pcie_capability_clear_and_set_word() to ..._clear_word()
    636f0fdb3623 PCI/DPC: Use FIELD_GET()
    aedbd0961467 ALSA: scarlett2: Add Focusrite Clarett 2Pre and 4Pre USB support
    03bfe0e93613 ALSA: scarlett2: Add Focusrite Clarett+ 2Pre and 4Pre support
    7c02a4a6ccea ALSA: scarlett2: Add correct product series name to messages
    b928cde9c07c ALSA: scarlett2: Default mixer driver to enabled
    0f4048e1a0c6 ASoC: ti: Convert Pandora ASoC to GPIO descriptors
    e2b8480b709d ALSA: scarlett2: Add support for Clarett 8Pre USB
    4d74cb9cdfd5 ALSA: scarlett2: Move USB IDs out from device_info struct
    bbdfa1448205 PCI: switchtec: Add support for PCIe Gen5 devices
    87709f7ecdb8 PCI: switchtec: Use normal comment style
    89a9196aec6b PCI: Execute quirk_enable_clear_retrain_link() earlier
    caa7ff1d7d51 thunderbolt: Add debug log for link controller power quirk
    932a7651002b thunderbolt: Log function name of the called quirk
    4b7ed2400e0d x86/quirks: Include linux/pnp.h for arch_pnpbios_disabled()
    f4aae2afe2d5 PCI: Delay after FLR of Solidigm P44 Pro NVMe
    0fe6a97a5fea usb: pci-quirks: Reduce the length of a spinlock section in usb_amd_find_chipset_info()
    c96b07dca169 HID: kye: Sort kye devices
    57aadcc0288c PCI: Avoid FLR for SolidRun SNET DPU rev 1
    3c55d4396b15 ARM: omap2: n8x0: stop instantiating codec platform data
    c330a13ab77c drm/panel: visionox-rm69299: don't unregister DSI device
    5fd4b090304e drm: nv04: Fix out of bounds access
    559f3a633339 s390/cio: fix race condition during online processing
    beb3ff19a55d s390/qdio: handle deferred cc1
    fe446927f8af RDMA/mlx5: Fix port number for counter query in multi-port configuration
    ea42dbe75992 RDMA/cm: Print the old state when cm_destroy_id gets timeout
    196617d07dd6 RDMA/rxe: Fix the problem "mutex_destroy missing"
    45e811bab2d0 net: ethernet: ti: am65-cpsw-nuss: cleanup DMA Channels before using them
    e86c9db58eba net: dsa: mt7530: fix mirroring frames received on local port
    62e27ef18eb4 tun: limit printing rate when illegal packet received by tun dev
    6a6ebec40820 ice: tc: allow zero flags in parsing tc flower
    46efa4d5930c net/mlx5e: Prevent deadlock while disabling aRFS
    8635ac7dd9cf net/mlx5: Lag, restore buckets number to default after hash LAG deactivation
    ba0db4638525 af_unix: Don't peek OOB data without MSG_OOB.
    a1d3e3521f02 af_unix: Call manage_oob() for every skb in unix_stream_read_generic().
    f1c3c61701a0 netfilter: flowtable: incorrect pppoe tuple
    8bf7c76a2a20 netfilter: flowtable: validate pppoe header
    41d8fdf3afaf netfilter: nft_set_pipapo: do not free live element
    b13db0d16bc7 netfilter: br_netfilter: skip conntrack input hook for promisc packets
    df7c0fb8c2b9 netfilter: nf_tables: Fix potential data-race in __nft_obj_type_get()
    8d56bad42ac4 netfilter: nf_tables: Fix potential data-race in __nft_expr_type_get()
    408a43b6c948 x86/efistub: Remap kernel text read-only before dropping NX attribute
    f56faf87c1e9 x86/sev: Move early startup code into .head.text section
    d6f5bc5ff04f x86/sme: Move early SME kernel encryption handling into .head.text
    e6489cc45fa7 x86/head/64: Move the __head definition to <asm/init.h>
    bbcd0534a3eb x86/head/64: Add missing __head annotation to startup_64_load_idt()
    20dc656b0657 x86/mm: Remove P*D_PAGE_MASK and P*D_PAGE_SIZE macros
    d327e961573f x86/efistub: Use 1:1 file:memory mapping for PE/COFF .compat section
    c4421279b6c2 x86/boot: Increase section and file alignment to 4k/512
    581f5d5e02ef x86/boot: Split off PE/COFF .data section
    43b1920588fa x86/boot: Drop PE/COFF .reloc section
    d03399c3e252 x86/boot: Construct PE/COFF .text section from assembler
    1fa0a2147590 x86/boot: Derive file size from _edata symbol
    1c754c6ec978 x86/boot: Define setup size in linker script
    f9d68334dd99 x86/boot: Set EFI handover offset directly in header asm
    e1380c923ccd x86/boot: Grab kernel_info offset from zoffset header directly
    67b8dc50890b x86/boot: Drop references to startup_64
    33d38d9b35e9 x86/boot: Drop redundant code setting the root device
    5c3e92ad493d x86/boot: Omit compression buffer from PE/COFF image memory footprint
    f31f521ad27e x86/boot: Remove the 'bugger off' message
    0db16d1dce52 x86/efi: Drop alignment flags from PE section headers
    1800c9628ece x86/efistub: Reinstate soft limit for initrd loading
    f46e0e9fbef5 x86/efi: Disregard setup header of loaded image
    f5603f9e13ad x86/efi: Drop EFI stub .bss from .data section
    704edc9252f4 drm/i915/vma: Fix UAF on destroy against retire race
    add0ff34863e net: usb: ax88179_178a: avoid writing the mac address before first reading
    07b37f227c8d random: handle creditable entropy from atomic process context
    bcdd9ce78d66 selftests/ftrace: Limit length in subsystem-enable tests
    45eec81eaca6 SUNRPC: Fix rpcgss_context trace event acceptor field
    cbe7b911e0c9 io_uring: Fix io_cqring_wait() not restoring sigmask on get_timespec64() failure
    121a83be215b drm/amd/display: Do not recursively call manual trigger programming
    01c227f5a72b drm/amdgpu: fix incorrect number of active RBs for gfx11
    87f8aac740f1 drm/amdgpu: fix incorrect active rb bitmap for gfx11
    1e053399681c drm/vmwgfx: Enable DMA mappings with SEV
    b140d9d4515f drm/bridge: adv7511: fix crash on irq during probe
    5c3bf5a26d61 reiserfs: Avoid touching renamed directory if parent does not change
    cc4860dd1375 Subject: [PATCH v6.1] powerpc: drop duplicate entry in Makefile for lib dir
    e083231c43f3 net: fix IPSTATS_MIB_OUTFORWDATAGRAMS increment after fragment check
    6ee7f29fed8c net: ipv4, ipv6: fix IPSTATS_MIB_OUTOCTETS increment duplicated
    a771780cdf4a net: fix IPSTATS_MIB_OUTPKGS increment in OutForwDatagrams.
    8a9f2d0717f0 riscv: Fix build with CONFIG_CC_OPTIMIZE_FOR_SIZE=y
    44fd0c7a5a79 tick/rcu: fix false positive "softirq work is pending" messages on RT
    786775632028 kernel/sched: Fix double free on invalid isolcpus/nohz_full params
    4675ec8d0b9a kernel/sched: Fix uninitialized read in nohz_full/isolcpus setup
    f46dc32a8617 bpf: btf: limit logging of ignored BTF mismatches
    4687b40201db Revert "Revert "tick/common: Align tick period with the HZ tick.""
    947f660bde07 Revert "tick/common: Align tick period with the HZ tick."
    dded404c66bb yaffs2: Fix miscalculation of devname buffer length
    30350f237490 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    0ac32a83ca02 OF: DT-Overlay configfs interface (v8)
    0b07d2478b6b fat: Replace prandom_u32() with get_random_u32()
    927b66bfd641 aufs6: core
    2af5eb310b11 aufs6: standalone
    e6537c94f033 aufs6: mmap
    c51d7f19876f aufs6: base
    1785f762bbbb aufs6: kbuild
    8f625cf94585 qemux86: add configuration symbol to select values
    d81fac6e842a sched/isolation: really align nohz_full with rcu_nocbs
    07c526200cb3 clear_warn_once: add a clear_warn_once= boot parameter
    61e2c52ce198 clear_warn_once: bind a timer to written reset value
    de03f5a3e6c6 clear_warn_once: expand debugfs to include read support
    d3f9a25028d4 tools: Remove some options from CLANG_CROSS_FLAGS
    0fb98cd2429a libbpf: Fix build warning on ref_ctr_off
    e156ff56a19f perf python: Account for multiple words in CC
    f06b9c6ae59d perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    1b099e82095d perf: x86-32: explicitly include <errno.h>
    5fec311e2fd2 perf: mips64: Convert __u64 to unsigned long long
    6cf30287aeaa perf: fix bench numa compilation
    bd8f67dcb8e4 perf: add SLANG_INC for slang.h
    0314b09bf6b9 perf: add sgidefs.h to for mips builds
    4a39cc37b957 perf: change --root to --prefix for python install
    3db4f4e91769 perf: add 'libperl not found' warning
    fa3d24bac29a perf: force include of <stdbool.h>
    deaadc523f8d fat: don't use obsolete random32 call in namei_vfat
    d3c72f5df9a3 FAT: Added FAT_NO_83NAME
    8f1eebeb519c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    78b0423ccc14 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    e998ad53fb68 yaffs2: replace bdevname call with sprintf
    1175db6bf4cb yaffs2: convert read_page -> readfolio
    beb275c683de yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    e807c9e420bd yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    2fdd54282de3 yaffs2: v5.12+ build fixups (not runtime tested)
    869f41030ed8 yaffs: include blkdev.h
    e955b68f2b1f yaffs: fix misplaced variable declaration
    f089603aba1d yaffs2: v5.6 build fixups
    82da54859f0b yaffs2: fix memory leak when /proc/yaffs is read
    2c4cf6808649 yaffs: add strict check when call yaffs_internal_read_super
    e7dadb47ef11 yaffs: repair yaffs_get_mtd_device
    f2e29be130f7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    8ea43ac7f3a3 yaffs2: fix memory leak in mount/umount
    56db60d0abd2 yaffs: Avoid setting any ACL releated xattr
    023baea095bc Yaffs:check oob size before auto selecting Yaffs1
    409d39918661 fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    4bf42c774804 yaffs2: adjust to proper location of MS_RDONLY
    08696e21a84c yaffs2: import git revision b4ce1bb (jan, 2020)
    ca3d9f546a60 initramfs: allow an optional wrapper script around initramfs generation
    301742baace5 pnmtologo: use relocatable file name
    aba96ccce7d9 tools: use basename to identify file in gen-mach-types
    e195c32ca7c7 lib/build_OID_registry: fix reproducibility issues
    876e2f1f7726 vt/conmakehash: improve reproducibility
    28b7a366cfef iwlwifi: select MAC80211_LEDS conditionally
    69933d85f61e net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5a308d8f142a arm64/perf: Fix wrong cast that may cause wrong truncation
    339523a797e9 defconfigs: drop obselete options
    3d751aeb9bcd arm64/perf: fix backtrace for AAPCS with FP enabled
    86fa47f362ae linux-yocto: Handle /bin/awk issues
    86f04668ef6e uvesafb: provide option to specify timeout for task completion
    0db5521a1b3c uvesafb: print error message when task timeout occurs
    710303c12e99 compiler.h: Undef before redefining __attribute_const__
    14a0ede85080 vmware: include jiffies.h
    e232e6ffe081 Resolve jiffies wrapping about arp
    c16abf2d705f nfs: Allow default io size to be configured.
    9e9e885f4a6c check console device file on fs when booting
    0ce0ce443d58 mount_root: clarify error messages for when no rootfs found
    32449db67de8 menuconfig,mconf-cfg: Allow specification of ncurses location
    c55f1054bdce modpost: mask trivial warnings
    30a45d4ee261 kbuild: exclude meta directory from distclean processing
    0890b10d8fb1 powerpc: serialize image targets
    6c0feb81c3ae arm: serialize build targets
    77fa1b70cdbd crtsavres: fixups for 5.4+
    cd107e4edd5f crtsavres: fixups for 5.4+
    8f763b35ae5b powerpc/ptrace: Disable array-bounds warning with gcc8
    fe6f93755196 powerpc: Disable attribute-alias warnings from gcc8
    9b7097364b87 powerpc: add crtsavres.o to archprepare for kbuild
    c106cd86a07b powerpc: kexec fix for powerpc64
    33b7738c61fc powerpc: Add unwind information for SPE registers of E500 core
    c04e26a9beda mips: vdso: fix 'jalr $t9' crash in vdso code
    4733368eab80 mips: Kconfig: add QEMUMIPS64 option
    ec2df6ae5ee5 4kc cache tlb hazard: tlbp cache coherency
    c8c511fae0f0 malta uhci quirks: make allowance for slow 4k(e)c
    b2bf1b6e971a arm64: defconfig: cleanup config options
    a40a34b02336 vexpress: Pass LOADADDR to Makefile
    7c51524611bb arm: ARM EABI socketcall
    1f6e77027c24 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index a1b3e2d33c..5872d75a28 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d8b7bfb52d81a60cce39809fb105d760a359def1"
-SRCREV_meta ?= "2ccedc62a19929df39eef4a5f2255b6f03652b31"
+SRCREV_machine ?= "0efb10b7f099e769d4f27db872ef52394021e5b5"
+SRCREV_meta ?= "6bf76ba66fb63fb2deb03805dc45ca86186e7010"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.87"
+LINUX_VERSION ?= "6.1.89"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 2f99c068c1..313aa27406 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.87"
+LINUX_VERSION ?= "6.1.89"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9bf85a364245b2c3b98879c869725adbf8fb37ca"
-SRCREV_meta ?= "2ccedc62a19929df39eef4a5f2255b6f03652b31"
+SRCREV_machine ?= "728b553d7c4fc1fb3512c59462f628b997fff257"
+SRCREV_meta ?= "6bf76ba66fb63fb2deb03805dc45ca86186e7010"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index ad19080bc7..e39106ccd2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "80e50241e06c17d0ba9d637bbd2e01aeadc0b385"
-SRCREV_machine:qemuarm64 ?= "9bf85a364245b2c3b98879c869725adbf8fb37ca"
-SRCREV_machine:qemuloongarch64 ?= "9bf85a364245b2c3b98879c869725adbf8fb37ca"
-SRCREV_machine:qemumips ?= "32a30aff77ba61611596d04faab7658d2e3d9154"
-SRCREV_machine:qemuppc ?= "c2dc480743bc2fa933761e7c68f01d973875f6d9"
-SRCREV_machine:qemuriscv64 ?= "9bf85a364245b2c3b98879c869725adbf8fb37ca"
-SRCREV_machine:qemuriscv32 ?= "9bf85a364245b2c3b98879c869725adbf8fb37ca"
-SRCREV_machine:qemux86 ?= "9bf85a364245b2c3b98879c869725adbf8fb37ca"
-SRCREV_machine:qemux86-64 ?= "9bf85a364245b2c3b98879c869725adbf8fb37ca"
-SRCREV_machine:qemumips64 ?= "fce0b9ab6a695ab8a214c65f22a5f58ad623b1f9"
-SRCREV_machine ?= "9bf85a364245b2c3b98879c869725adbf8fb37ca"
-SRCREV_meta ?= "2ccedc62a19929df39eef4a5f2255b6f03652b31"
+SRCREV_machine:qemuarm ?= "b1cc4225c4b5588cf0c63e6f86116a38cdb53c64"
+SRCREV_machine:qemuarm64 ?= "728b553d7c4fc1fb3512c59462f628b997fff257"
+SRCREV_machine:qemuloongarch64 ?= "728b553d7c4fc1fb3512c59462f628b997fff257"
+SRCREV_machine:qemumips ?= "731b88d4e5731096e2ca6cb8f04eb8325693abac"
+SRCREV_machine:qemuppc ?= "ffcfc9a6c9dfe39c7ed298dce35d814b361774d6"
+SRCREV_machine:qemuriscv64 ?= "728b553d7c4fc1fb3512c59462f628b997fff257"
+SRCREV_machine:qemuriscv32 ?= "728b553d7c4fc1fb3512c59462f628b997fff257"
+SRCREV_machine:qemux86 ?= "728b553d7c4fc1fb3512c59462f628b997fff257"
+SRCREV_machine:qemux86-64 ?= "728b553d7c4fc1fb3512c59462f628b997fff257"
+SRCREV_machine:qemumips64 ?= "3b4c60db0192221d71a32d8646efa3aa5b96dc8e"
+SRCREV_machine ?= "728b553d7c4fc1fb3512c59462f628b997fff257"
+SRCREV_meta ?= "6bf76ba66fb63fb2deb03805dc45ca86186e7010"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "6741e066ec7633450d3186946035c1f80c4226b8"
+SRCREV_machine:class-devupstream ?= "dcbc050cb0d304c3427d6583384eebcaf0e3caee"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.87"
+LINUX_VERSION ?= "6.1.89"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


