Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEBECA0FF3
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 14:37:23 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.23201.1693924641725405668
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 07:37:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gA/Z/5+f;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-76f14d80ea6so153194885a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 07:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693924641; x=1694529441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzWvMItoDfCsDtnGSHxvsHixr87FGjnHkCLe/CQGgYk=;
        b=gA/Z/5+fn8SgBDHm4CXSRifBspguVXod8mGvhm7YeyJ0ugZddaMHKi1DcRirvyzESV
         EekF+3jWbr4otOb0PkZD31i7+xvzXcKGKCOcJCD6XqwkJnA+f2LiDHzZ6luKGNCbh+W2
         8oB2MqY+1BwlfIaYMzrFBjGZ1dRs2Y0KjXInV5B70psyL4TAItcD7VC/g+XVwbe76ujg
         UpIizbzWNJDr3H1SAy/tDYpzV1BA7ni/4eQDUfBYuPA4JR+ZyvWrjLkGhKaamLcfMC5k
         yyxkVO0Dl+q40xcdY9zxfgHF/hXkQYD3d8KTOpflTwavXlWhLqLPXs4qN/8a9RqCcVAb
         1BWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693924641; x=1694529441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WzWvMItoDfCsDtnGSHxvsHixr87FGjnHkCLe/CQGgYk=;
        b=LATgxop2plfvqGRRKTiWEioyPzLzaW6tAMpXDLZBu5dsyqH5NR7si8xR00zRZduwcC
         zcqDp32p9fKlz7SHVw5G7g4JB+W3W8LBGSMyWI9qZpZCyReRzCOT/yaMuQ6BiMdrPHtI
         pA2K/rMTN4inz1WaZg3MQNlAXv75xZyDWNquAWyHdXmQf34dzxL11cUroOjrY/rLsse9
         3nYSIGA+JNuTOoZj7fvE13r3xZVSH3p8sTXzSRps1vlxTdjrEEgNESks37cjK3Umn46X
         UTDb+m5xliV62CNgmFntuvL/pov8Hf7xhqaho22v4kC/HLdGWN0n3T6ZeFdkRUq+9bYh
         9aEw==
X-Gm-Message-State: AOJu0YwPhOuJEIn0UntihTx4jRR1upj+OIrpGCOAc3/2FyxEKfJRlxiE
	w4tHrogqwK80hfWH0tLowAnogUhm7fqZmQ==
X-Google-Smtp-Source: AGHT+IHVs/C4Un91YKf9rnY9OcHzhO4l82aN1+FET35w7B1qK9tbk2xyh8Gu0vZFRt7dgimiZVhjew==
X-Received: by 2002:a05:620a:2948:b0:76e:f38b:e87a with SMTP id n8-20020a05620a294800b0076ef38be87amr18765528qkp.48.1693924640527;
        Tue, 05 Sep 2023 07:37:20 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id f9-20020a05620a15a900b0076ee82f7726sm4066227qkk.132.2023.09.05.07.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 07:37:20 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] linux-yocto/6.1: update to v6.1.50
Date: Tue,  5 Sep 2023 10:37:10 -0400
Message-Id: <a527f850230788d5205a63758f57c019a48aa56d.1693924532.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693924532.git.bruce.ashfield@gmail.com>
References: <cover.1693924532.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 14:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187220

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    a2943d2d9a00 Linux 6.1.50
    19641b979b24 ASoC: amd: vangogh: select CONFIG_SND_AMD_ACP_CONFIG
    9d5a3b4aee11 maple_tree: disable mas_wr_append() when other readers are possible
    936cf79649e0 ASoC: amd: yc: Fix a non-functional mic on Lenovo 82SJ
    d10ab996bd5c gpio: sim: pass the GPIO device's software node to irq domain
    3c839f8332df gpio: sim: dispose of irq mappings before destroying the irq_sim domain
    3282e79a85c1 dma-buf/sw_sync: Avoid recursive lock during fence signal
    6ed06b94f683 pinctrl: renesas: rza2: Add lock around pinctrl_generic{{add,remove}_group,{add,remove}_function}
    3fb1b959af17 pinctrl: renesas: rzv2m: Fix NULL pointer dereference in rzv2m_dt_subnode_to_map()
    4a75bf3f6f4f pinctrl: renesas: rzg2l: Fix NULL pointer dereference in rzg2l_dt_subnode_to_map()
    0ba9a242a6b3 clk: Fix undefined reference to `clk_rate_exclusive_{get,put}'
    70461151d0eb scsi: core: raid_class: Remove raid_component_add()
    774cb3de7ac9 scsi: snic: Fix double free in snic_tgt_create()
    bd20e20c4d64 madvise:madvise_free_pte_range(): don't use mapcount() against large folio for sharing check
    f67e3a725b49 can: raw: add missing refcount for memory leak fix
    b7803afc77be ublk: remove check IO_URING_F_SQE128 in ublk_ch_uring_cmd
    f016326d31d0 thunderbolt: Fix Thunderbolt 3 display flickering issue on 2nd hot plug onwards
    d3ff67076bed cgroup/cpuset: Free DL BW in case can_attach() fails
    f0135131bb0e sched/deadline: Create DL BW alloc, free & check overflow interface
    064b960dbe94 cgroup/cpuset: Iterate only if DEADLINE tasks are present
    d1b4262b78cc sched/cpuset: Keep track of SCHED_DEADLINE task in cpusets
    9bcfe1527882 sched/cpuset: Bring back cpuset_mutex
    7030fbf75f26 cgroup/cpuset: Rename functions dealing with DEADLINE accounting
    ce59b7c1b027 nfsd: use vfs setgid helper
    362ed5d93114 nfs: use vfs setgid helper
    a0ec52f36ce9 selftests/net: mv bpf/nat6to4.c to net folder
    f1fa6e6f85cb hwmon: (aquacomputer_d5next) Add selective 200ms delay after sending ctrl report
    d8f9a9cfdcd3 x86/fpu: Set X86_FEATURE_OSXSAVE feature after enabling OSXSAVE in CR4
    6bcb9c7d0435 x86/fpu: Invalidate FPU state correctly on exec()
    3bc9b0364a8c drm/display/dp: Fix the DP DSC Receiver cap size
    3abffee6091c drm/i915/dgfx: Enable d3cold at s2idle
    115f2ccd3a99 drm/vmwgfx: Fix shader stage validation
    1900e193b5dd PCI: acpiphp: Use pci_assign_unassigned_bridge_resources() only for non-root bus
    fe04122b9321 media: vcodec: Fix potential array out-of-bounds in encoder queue_setup
    4919043ab93b pinctrl: amd: Mask wake bits on probe again
    c6b7d8902025 of: dynamic: Refactor action prints to not use "%pOF" inside devtree_lock
    2d00ca90b81e of: unittest: Fix EXPECT for parse_phandle_with_args_map() test
    e75de82b3786 radix tree: remove unused variable
    aa096bc3c8c0 riscv: Fix build errors using binutils2.37 toolchains
    33835975740e riscv: Handle zicsr/zifencei issue between gcc and binutils
    30ffd5890a03 lib/clz_ctz.c: Fix __clzdi2() and __ctzdi2() for 32-bit kernels
    82bb5f8aba00 batman-adv: Hold rtnl lock during MTU update via netlink
    cb1f73e691bb batman-adv: Fix batadv_v_ogm_aggr_send memory leak
    f1bead97f0ad batman-adv: Fix TT global entry leak when client roamed back
    fc9b87d8b741 batman-adv: Do not get eth header before batadv_check_management_packet
    ed1eb19806ae batman-adv: Don't increase MTU when set by user
    efef746c5a38 batman-adv: Trigger events for auto adjusted MTU
    d6b64d710e9b selinux: set next pointer before attaching to list
    36c5aecc789d nfsd: Fix race to FREE_STATEID and cl_revoked
    96fb46ef8281 NFS: Fix a use after free in nfs_direct_join_group()
    bdc544a87d43 mm: memory-failure: fix unexpected return value in soft_offline_page()
    07fad410aa6e mm: add a call to flush_cache_vmap() in vmap_pfn()
    a8a60bc8027e mm/gup: handle cont-PTE hugetlb pages correctly in gup_must_unshare() via GUP-fast
    d4e11b85a269 ALSA: ymfpci: Fix the missing snd_card_free() call at probe error
    d13f3a63d236 shmem: fix smaps BUG sleeping while atomic
    091591f6e7c3 mm,ima,kexec,of: use memblock_free_late from ima_free_kexec_buffer
    a7d172252bfa clk: Fix slab-out-of-bounds error in devm_clk_release()
    14904f4d8bf8 NFSv4: Fix dropped lock for racing OPEN and delegation return
    ac467d7405fe platform/x86: ideapad-laptop: Add support for new hotkeys found on ThinkBook 14s Yoga ITL
    e6a60eccd0c8 wifi: mac80211: limit reorder_buf_filtered to avoid UBSAN warning
    b8b7243aafec ibmveth: Use dcbf rather than dcbfl
    85607ef399d9 ASoC: cs35l41: Correct amp_gain_tlv values
    014fec554010 ASoC: amd: yc: Add VivoBook Pro 15 to quirks list for acp6x
    22a406b3629a io_uring/msg_ring: fix missing lock on overflow for IOPOLL
    816c7cecf6a0 io_uring/msg_ring: move double lock/unlock helpers higher up
    4f5937528518 io_uring: extract a io_msg_install_complete helper
    0d617fb6d513 io_uring: get rid of double locking
    82d811ff5665 KVM: x86/mmu: Fix an sign-extension bug with mmu_seq that hangs vCPUs
    2800385fda53 KVM: x86: Preserve TDP MMU roots until they are explicitly invalidated
    a0559fd0e14e bonding: fix macvlan over alb bond support
    b15dea3de413 rtnetlink: Reject negative ifindexes in RTM_NEWLINK
    ed3fe5f9020c netfilter: nf_tables: fix out of memory error handling
    41841b585e53 netfilter: nf_tables: flush pending destroy work before netlink notifier
    136861956ad6 i40e: fix potential NULL pointer dereferencing of pf->vf i40e_sync_vsi_filters()
    581668893e31 net/sched: fix a qdisc modification with ambiguous command request
    f94f30e2abfa igc: Fix the typo in the PTM Control macro
    9b7fd6beec37 igb: Avoid starting unnecessary workqueues
    39d43b9cdfe8 can: isotp: fix support for transmission of SF without flow control
    f41781b9d8a4 selftests: bonding: do not set port down before adding to bond
    850e2322ae59 ice: Fix NULL pointer deref during VF reset
    7cddaed2a3f6 Revert "ice: Fix ice VF reset during iavf initialization"
    1188e9dd7af9 ice: fix receive buffer size miscalculation
    417e7ec0d61e ipv4: fix data-races around inet->inet_id
    4af1fe642f37 net: validate veth and vxcan peer ifindexes
    afc9d3d21793 net: bcmgenet: Fix return value check for fixed_phy_register()
    029e491b8c11 net: bgmac: Fix return value check for fixed_phy_register()
    ac259251487a net: dsa: mt7530: fix handling of 802.1X PAE frames
    c663607202f5 selftests: mlxsw: Fix test failure on Spectrum-4
    1288f9907514 mlxsw: Fix the size of 'VIRT_ROUTER_MSB'
    7134565a8207 mlxsw: reg: Fix SSPR register layout
    22f9b5468df5 mlxsw: pci: Set time stamp fields also when its type is MIRROR_UTC
    4496f6ccf599 ipvlan: Fix a reference count leak warning in ipvlan_ns_exit()
    265ed382e0f4 dccp: annotate data-races in dccp_poll()
    b516a24f4c07 sock: annotate data-races around prot->memory_pressure
    cfee17993d10 net: dsa: felix: fix oversize frame dropping for always closed tc-taprio gates
    b701b8d191da devlink: add missing unregister linecard notification
    1375d2061204 devlink: move code to a dedicated directory
    eaeef5c865ab octeontx2-af: SDP: fix receive link config
    2cb0c037c927 tracing: Fix memleak due to race between current_tracer and trace
    7d0c2b0de2db tracing: Fix cpu buffers unavailable due to 'record_disabled' missed
    7e862cce3491 drm/i915/gt: Support aux invalidation on all engines
    8e3f138b96f6 drm/i915/gt: Poll aux invalidation register bit on invalidation
    017d4404312a drm/i915/gt: Ensure memory quiesced before invalidation
    c23126f2c76a drm/i915: Add the gen12_needs_ccs_aux_inv helper
    d4f5dcf68c05 s390/zcrypt: fix reply buffer calculations for CCA replies
    246d763b79a5 s390/zcrypt: remove unnecessary (void *) conversions
    40dafcab9da9 can: raw: fix lockdep issue in raw_release()
    335987e21237 can: raw: fix receiver memory leak
    e5c768d809a8 jbd2: fix a race when checking checkpoint buffer busy
    5fda50e262e6 jbd2: remove journal_clean_one_cp_list()
    8168c96c24ec jbd2: remove t_checkpoint_io_list
    1fa68a781098 MIPS: cpu-features: Use boot_cpu_type for CPU type based features
    92c568c82ee7 MIPS: cpu-features: Enable octeon_cache by cpu_type
    3e4d038da33e PCI: acpiphp: Reassign resources on bridge if necessary
    28916927b762 video/aperture: Move vga handling to pci function
    4aad3b82b9de video/aperture: Only kick vgacon when the pdev is decoding vga
    437e99f2a1e9 drm/aperture: Remove primary argument
    cccfcbb9e51a drm/gma500: Use drm_aperture_remove_conflicting_pci_framebuffers
    6db53af15444 fbdev/radeon: use pci aperture helpers
    cd1f889c99ee drm/ast: Use drm_aperture_remove_conflicting_pci_framebuffers
    26ea8668b8aa xprtrdma: Remap Receive buffers after a reconnect
    d9aac9cdd6e2 NFSv4: fix out path in __nfs4_get_acl_uncached
    4a289d123f62 NFSv4.2: fix error handling in nfs42_proc_getxattr
    024f76bca9d0 Linux 6.1.49
    db05f8449bb3 Revert "f2fs: fix to do sanity check on direct node in truncate_dnode()"
    c5bd20577ff3 Revert "f2fs: fix to set flush_merge opt and show noflush_merge"
    76e18e6709c8 Revert "f2fs: don't reset unchangable mount option in f2fs_remount()"
    77c576602dc7 objtool/x86: Fix SRSO mess
    cd363bb9548e Linux 6.1.48
    7487244912b1 x86/srso: Correct the mitigation status when SMT is disabled
    4da4aae04b7f objtool/x86: Fixup frame-pointer vs rethunk
    c8b056a3b4eb x86/retpoline,kprobes: Fix position of thunk sections with CONFIG_LTO_CLANG
    dae93ed961a8 x86/srso: Disable the mitigation on unaffected configurations
    e4679a0342e0 x86/CPU/AMD: Fix the DIV(0) initial fix attempt
    b41eb316c95c x86/retpoline: Don't clobber RFLAGS during srso_safe_ret()
    c1f831425fe9 x86/static_call: Fix __static_call_fixup()
    c16d0b3baff4 x86/srso: Explain the untraining sequences a bit more
    529a9f087a7e x86/cpu: Cleanup the untrain mess
    e6b40d2cb5aa x86/cpu: Rename srso_(.*)_alias to srso_alias_\1
    54dde78a50a8 x86/cpu: Rename original retbleed methods
    44dbc912fd8a x86/cpu: Clean up SRSO return thunk mess
    53ebbe1c8c02 x86/alternative: Make custom return thunk unconditional
    8bb1ed390d35 x86/cpu: Fix up srso_safe_ret() and __x86_return_thunk()
    6e4dd7d2636d x86/cpu: Fix __x86_return_thunk symbol type
    802aacbbffe2 Linux 6.1.47
    0768ecc49ea7 mmc: f-sdh30: fix order of function calls in sdhci_f_sdh30_remove
    b2c55af89b51 net: fix the RTO timer retransmitting skb every 1ms if linear option is enabled
    3f27451c9f29 drm/nouveau/disp: fix use-after-free in error handling of nouveau_connector_create
    790c2f9d15b5 af_unix: Fix null-ptr-deref in unix_stream_sendpage().
    ab63f883bfdc drm/amdgpu: keep irq count in amdgpu_irq_disable_all
    8abce61273c2 drm/amd/pm: skip the RLC stop when S0i3 suspend for SMU v13.0.4/11
    21614ba60883 arm64/ptrace: Ensure that SME is set up for target when writing SSVE state
    1be35f5c1670 netfilter: set default timeout to 3 secs for sctp shutdown send and recv state
    1b4ce2952b4f hugetlb: do not clear hugetlb dtor until allocating vmemmap
    4bdfe20d85b3 drm/amd/display: Implement workaround for writing to OTG_PIXEL_RATE_DIV register
    8517d739923e sched/fair: Remove capacity inversion detection
    e8acf9971fbe sched/fair: unlink misfit task from cpu overutilized
    5274bf1f743f zsmalloc: allow only one active pool compaction context
    d4008eadfce5 drm/amd/display: disable RCO for DCN314
    b2f599c014f3 ASoC: amd: vangogh: select CONFIG_SND_AMD_ACP_CONFIG
    7de99bf5bcd6 drm/amdgpu/pm: fix throttle_status for other than MP1 11.0.7
    9c8c2cf9f9bc drm/amdgpu: skip fence GFX interrupts disable/enable for S0ix
    e1cbd5637f37 drm/amd: flush any delayed gfxoff on suspend entry
    df1566ce41ee drm/i915/sdvo: fix panel_type initialization
    a1fa8f0fc58e drm/qxl: fix UAF on handle creation
    5818da46a2b5 mmc: block: Fix in_flight[issue_type] value error
    dccd07b0d9e4 mmc: wbsd: fix double mmc_free_host() in wbsd_init()
    8ad3bfdd227e blk-crypto: dynamically allocate fallback profile
    65bcb07b1262 arm64: dts: rockchip: Fix Wifi/Bluetooth on ROCK Pi 4 boards
    fc66f8157917 virtio-net: Zero max_tx_vq field for VIRTIO_NET_CTRL_MQ_HASH_CONFIG case
    9e725386d426 cifs: Release folio lock on fscache read hit.
    bfd25f5e6400 ALSA: usb-audio: Add support for Mythware XA001AU capture and playback interfaces.
    0c05493341d6 serial: 8250: Fix oops for port->pm on uart_change_pm()
    af7ca7ad3753 riscv: uaccess: Return the number of bytes effectively not copied
    ea65d78ef999 ALSA: hda/realtek - Remodified 3k pull low procedure
    b662856b7134 soc: aspeed: socinfo: Add kfree for kstrdup
    15db1e594e2c soc: aspeed: uart-routing: Use __sysfs_match_string
    6c889d2123ba ALSA: hda/realtek: Add quirks for HP G11 Laptops
    7b041466ed42 ASoC: meson: axg-tdm-formatter: fix channel slot allocation
    f0451002a4d9 ASoC: rt5665: add missed regulator_bulk_disable
    2b34636b50bf arm64: dts: imx93: Fix anatop node size
    9ba52bd26774 ARM: dts: imx: Set default tuning step for imx6sx usdhc
    6777c4379bd8 arm64: dts: imx8mm: Drop CSI1 PHY reference clock configuration
    ca69bb145383 ARM: dts: imx6: phytec: fix RTC interrupt level
    d2d6d51d753a ARM: dts: imx: align LED node names with dtschema
    66d761a2290a arm64: dts: rockchip: Disable HS400 for eMMC on ROCK 4C+
    52d3607db0de arm64: dts: rockchip: Disable HS400 for eMMC on ROCK Pi 4
    9657a754c5de arm64: dts: qcom: qrb5165-rb5: fix thermal zone conflict
    fae3868be844 bus: ti-sysc: Flush posted write on enable before reset
    1c82d1b736ce ice: Block switchdev mode when ADQ is active and vice versa
    fbc7b1dad825 qede: fix firmware halt over suspend and resume
    2e03a92b2411 net: do not allow gso_size to be set to GSO_BY_FRAGS
    06b8f06f9302 sock: Fix misuse of sk_under_memory_pressure()
    3d820924c00c sfc: don't unregister flow_indr if it was never registered
    df83af3b996d net: dsa: mv88e6xxx: Wait for EEPROM done before HW reset
    740924313a1b i40e: fix misleading debug logs
    ea749b5e3b38 iavf: fix FDIR rule fields masks validation
    c965a5837614 net: openvswitch: reject negative ifindex
    d5e4c0e78f1d team: Fix incorrect deletion of ETH_P_8021AD protocol vid from slaves
    85bd0af93994 net: phy: broadcom: stub c45 read/write for 54810
    7148bca63b21 netfilter: nft_dynset: disallow object maps
    7f8a160d40ef ipvs: fix racy memcpy in proc_do_sync_threshold
    00ea7eb1c69e netfilter: nf_tables: deactivate catchall elements in next generation
    a800fcd8f18d netfilter: nf_tables: fix false-positive lockdep splat
    75c724e2b714 octeon_ep: cancel tx_timeout_task later in remove sequence
    58a54bad3a76 net: macb: In ZynqMP resume always configure PS GTR for non-wakeup source
    06af678c6080 drm/panel: simple: Fix AUO G121EAN01 panel timings according to the docs
    2f07f1302ecb selftests: mirror_gre_changes: Tighten up the TTL test match
    cd4460b21741 net: phy: fix IRQ-based wake-on-lan over hibernate / power off
    a41e5a79a059 net: pcs: Add missing put_device call in miic_create
    120a89c36d3d virtio-net: set queues after driver_ok
    45085ba966fb virtio_net: notify MAC address change on device initialization
    a442cd170193 xfrm: add forgotten nla_policy for XFRMA_MTIMER_THRESH
    87b655f4936b xfrm: add NULL check in xfrm_update_ae_params
    2b05bf5dc437 ip_vti: fix potential slab-use-after-free in decode_session6
    55ad2309205c ip6_vti: fix slab-use-after-free in decode_session6
    0d27567fde5b xfrm: fix slab-use-after-free in decode_session6
    71dfe71df100 net: xfrm: Amend XFRMA_SEC_CTX nla_policy structure
    479884b4ce16 net: af_key: fix sadb_x_filter validation
    9a0056276f5f net: xfrm: Fix xfrm_address_filter OOB read
    5a47c2fa0d39 i2c: designware: Handle invalid SMBus block data response length value
    52114963307e i2c: designware: Correct length byte validation logic
    ceb9ba8e3083 btrfs: fix BUG_ON condition in btrfs_cancel_balance
    9f68e2105dd9 btrfs: fix incorrect splitting in btrfs_drop_extent_map_range
    0693c8f134f9 tty: serial: fsl_lpuart: Clear the error flags by writing 1 for lpuart32 platforms
    31311a9a4baa tty: n_gsm: fix the UAF caused by race condition in gsm_cleanup_mux
    d6aa03bda8c0 vdpa: Enable strict validation for netlinks ops
    ff71709445ac vdpa: Add max vqp attr to vdpa_nl_policy for nlattr length check
    8ad9bc25cbdc vdpa: Add queue index attr to vdpa_nl_policy for nlattr length check
    44b508cc9688 vdpa: Add features attr to vdpa_nl_policy for nlattr length check
    b8fee83aa4ed powerpc/rtas_flash: allow user copy to flash block cache objects
    9fedcd07abdc fbdev: mmp: fix value check in mmphw_probe()
    3461e6492ca2 i2c: tegra: Fix i2c-tegra DMA config option processing
    ba249011f665 i2c: hisi: Only handle the interrupt of the driver's transfer
    db0416c15572 i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
    5ee28bcfbaac cifs: fix potential oops in cifs_oplock_break
    cba26abc3f94 vdpa/mlx5: Delete control vq iotlb in destroy_mr only when necessary
    bb4983ec9e75 vdpa/mlx5: Fix mr->initialized semantics
    e706675beeec vduse: Use proper spinlock for IRQ injection
    af5818c35173 virtio-mmio: don't break lifecycle of vm_dev
    6297644db23f btrfs: fix use-after-free of new block group that became unused
    29cebf80877b btrfs: convert btrfs_block_group::seq_zone to runtime flag
    94cde94169f0 btrfs: convert btrfs_block_group::needs_free_space to runtime flag
    01eca70ef8cf btrfs: move out now unused BG from the reclaim list
    485ec8f8e1d8 video/aperture: Only remove sysfb on the default vga pci device
    f83ab817effb fbdev/hyperv-fb: Do not set struct fb_info.apertures
    e41170d128e6 ARM: dts: nxp/imx6sll: fix wrong property name in usbphy node
    3d2d051be161 KVM: arm64: vgic-v4: Make the doorbell request robust w.r.t preemption
    402f1d86ea26 drm/amd/display: fix access hdcp_workqueue assert
    81e6cf447a2e drm/amd/display: phase3 mst hdcp for multiple displays
    d90f97cb3821 drm/amd/display: save restore hdcp state when display is unplugged from mst hub
    48f0671be281 igc: read before write to SRRCTL register
    128c06a34cfe ring-buffer: Do not swap cpu_buffer during resize process
    356fe907dfcd Bluetooth: MGMT: Use correct address for memcpy()
    a1ceb871284f powerpc/kasan: Disable KCOV in KASAN code
    6d06cf0f0238 ALSA: hda/realtek: Add quirk for ASUS ROG GZ301V
    2b248cf8b6db ALSA: hda/realtek: Add quirk for ASUS ROG GA402X
    c48616e52d5d ALSA: hda/realtek: Add quirk for ASUS ROG GX650P
    cdd412b528de ALSA: hda: fix a possible null-pointer dereference due to data race in snd_hdac_regmap_sync()
    63e0b5d76d75 ALSA: hda/realtek: Add quirks for Unis H3C Desktop B760 & Q760
    9e79f3e8f129 fs/ntfs3: Mark ntfs dirty when on-disk struct is corrupted
    1e2205568bb8 fs: ntfs3: Fix possible null-pointer dereferences in mi_read()
    4246bbef0442 fs/ntfs3: Enhance sanity check while generating attr_list
    dd0b3b367c38 drm/amdgpu: Fix potential fence use-after-free v2
    3a89f3bfbf53 ceph: try to dump the msgs when decoding fails
    d92613aa43da Bluetooth: btusb: Add MT7922 bluetooth ID for the Asus Ally
    149daab45922 Bluetooth: L2CAP: Fix use-after-free
    de8677ccf883 watchdog: sp5100_tco: support Hygon FCH/SCH (Server Controller Hub)
    9040adc38cf6 firewire: net: fix use after free in fwnet_finish_incoming_packet()
    ef87750caea5 thunderbolt: Limit Intel Barlow Ridge USB3 bandwidth
    acb9038e1d60 thunderbolt: Add Intel Barlow Ridge PCI ID
    e8a80cf06b4b pcmcia: rsrc_nonstatic: Fix memory leak in nonstatic_release_resource_db()
    a4f71523ed21 gfs2: Fix possible data races in gfs2_show_options()
    8277a215c872 usb: chipidea: imx: add missing USB PHY DPDM wakeup setting
    31f8efefa2a9 usb: chipidea: imx: don't request QoS for imx8ulp
    809625f4419c thunderbolt: Read retimer NVM authentication status prior tb_retimer_set_inbound_sbtx()
    b7bd48f0be84 media: platform: mediatek: vpu: fix NULL ptr dereference
    28d900836d47 usb: gadget: uvc: queue empty isoc requests if no video buffer is available
    49038877f948 usb: gadget: u_serial: Avoid spinlock recursion in __gs_console_push
    54a55c345c3b media: camss: set VFE bpl_alignment to 16 for sdm845 and sm8250
    c71aa5f1cf96 media: v4l2-mem2mem: add lock to protect parameter num_rdy
    6c9317f73b80 led: qcom-lpg: Fix resource leaks in for_each_available_child_of_node() loops
    bda3f463543f serial: stm32: Ignore return value of uart_remove_one_port() in .remove()
    7e4f5c3f01fb cifs: fix session state check in reconnect to avoid use-after-free issue
    945f4a7aff84 smb: client: fix warning in cifs_smb3_do_mount()
    a783230585e5 ALSA: hda/realtek: Add quirks for ROG ALLY CS35l41 audio
    de840f77f564 HID: intel-ish-hid: ipc: Add Arrow Lake PCI device ID
    055971715ff6 ASoC: SOF: core: Free the firmware trace before calling snd_sof_shutdown()
    359ec0952cbb drm/amd/display: Enable dcn314 DPP RCO
    5447155001e6 drm/amd/display: Skip DPP DTO update if root clock is gated
    5fe7815e784b RDMA/mlx5: Return the firmware result upon destroying QP/RQ
    fbd9332d32ec drm/amd/display: Apply 60us prefetch for DCFCLK <= 300Mhz
    78b25110eb8c drm/amdgpu: install stub fence into potential unused fence pointers
    96522cf9c71e iommu/amd: Introduce Disable IRTE Caching Support
    83c22663acb6 HID: logitech-hidpp: Add USB and Bluetooth IDs for the Logitech G915 TKL Keyboard
    d7933b92c4ca accel/habanalabs: add pci health check during heartbeat
    b7a34e30d42f dma-remap: use kvmalloc_array/kvfree for larger dma memory remap
    3dd5c90c48bf ASoC: SOF: Intel: fix SoundWire/HDaudio mutual exclusion
    ff1b4b1e02c3 iopoll: Call cpu_relax() in busy loops
    b3e662ece02e ASoC: Intel: sof_sdw: Add support for Rex soundwire
    c01ec45a7c4c ASoC: Intel: sof_sdw_rt_sdca_jack_common: test SOF_JACK_JDSRC in _exit
    31149bb94f77 ARM: dts: imx6dl: prtrvt, prtvt7, prti6q, prtwd2: fix USB related warnings
    a7d4d28d2c0b ASoC: amd: vangogh: Add check for acp config flags in vangogh platform
    633ac567bd9e drm: rcar-du: remove R-Car H3 ES1.* workarounds
    340dba127bbe drm/stm: ltdc: fix late dereference check
    f934cad91318 ASoC: SOF: amd: Add pci revision id check
    ea88c6c7819e PCI: tegra194: Fix possible array out of bounds access
    5c23d9bd5f5d ASoC: Intel: sof_sdw: add quirk for LNL RVP
    3f498ae94c54 ASoC: Intel: sof_sdw: add quirk for MTL RVP
    ce3288d8d654 drm/amdgpu: fix memory leak in mes self test
    9f55d300541c drm/amdgpu: Fix integer overflow in amdgpu_cs_pass1
    ab6f446c220d drm/amdgpu: fix calltrace warning in amddrm_buddy_fini
    caa2d40a0da2 net: phy: at803x: fix the wol setting functions
    7dcc894e1518 net: phy: at803x: Use devm_regulator_get_enable_optional()
    0d52759710fa net/smc: Fix setsockopt and sysctl to specify same buffer size again
    206381cee964 net/smc: replace mutex rmbs_lock and sndbufs_lock with rw_semaphore
    0fc3c55a3a4b selftests: forwarding: tc_actions: Use ncat instead of nc
    306a5dddfb12 selftests: forwarding: tc_actions: cleanup temporary files when test is aborted
    f872672edd5e zsmalloc: fix races between modifications of fullness and isolated
    802b34e99224 zsmalloc: consolidate zs_pool's migrate_lock and size_class's locks
    8a214f88e8ff cpuidle: psci: Move enabling OSI mode after power domains creation
    ad1fa1a028ee cpuidle: psci: Extend information in log about OSI/PC mode
    78721c8f9379 mmc: sdhci-f-sdh30: Replace with sdhci_pltfm

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index c78e248cfd..7839dea7b4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9d355978d3a95f5c190a21d95ebb2a5d0e638537"
-SRCREV_meta ?= "70924d2512b8c20567fade72a22781b9bee3206c"
+SRCREV_machine ?= "347c811f6ceed10dd5f13edfedfdb8a097584c3d"
+SRCREV_meta ?= "d0d2dd467959c77db90458d2fc6864e9505418d5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.46"
+LINUX_VERSION ?= "6.1.50"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 93bda2eca2..8709ad6704 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.46"
+LINUX_VERSION ?= "6.1.50"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
-SRCREV_meta ?= "70924d2512b8c20567fade72a22781b9bee3206c"
+SRCREV_machine ?= "f191b0373f4daac610e4c24d5e6248105c67d109"
+SRCREV_meta ?= "d0d2dd467959c77db90458d2fc6864e9505418d5"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index d1a4bc8538..ba0289a47f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "4e49d63e747e81aebad5ce6091ba6de09f09d46f"
-SRCREV_machine:qemuarm64 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
-SRCREV_machine:qemuloongarch64 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
-SRCREV_machine:qemumips ?= "e527feb9cd8acbcbcd7115f51cf71166fdbce11a"
-SRCREV_machine:qemuppc ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
-SRCREV_machine:qemuriscv64 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
-SRCREV_machine:qemuriscv32 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
-SRCREV_machine:qemux86 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
-SRCREV_machine:qemux86-64 ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
-SRCREV_machine:qemumips64 ?= "296b096f4c747e4c4b31b1708fc8a0acb1dac04e"
-SRCREV_machine ?= "44fd0c7a5a7955282a1ab24bf3dcdee068839ad2"
-SRCREV_meta ?= "70924d2512b8c20567fade72a22781b9bee3206c"
+SRCREV_machine:qemuarm ?= "955185e6572be6bd7604f011ef330147344f9b5e"
+SRCREV_machine:qemuarm64 ?= "f191b0373f4daac610e4c24d5e6248105c67d109"
+SRCREV_machine:qemuloongarch64 ?= "f191b0373f4daac610e4c24d5e6248105c67d109"
+SRCREV_machine:qemumips ?= "0747ac9d34f9bee0ba8b465f501e2d8d34e6523e"
+SRCREV_machine:qemuppc ?= "f191b0373f4daac610e4c24d5e6248105c67d109"
+SRCREV_machine:qemuriscv64 ?= "f191b0373f4daac610e4c24d5e6248105c67d109"
+SRCREV_machine:qemuriscv32 ?= "f191b0373f4daac610e4c24d5e6248105c67d109"
+SRCREV_machine:qemux86 ?= "f191b0373f4daac610e4c24d5e6248105c67d109"
+SRCREV_machine:qemux86-64 ?= "f191b0373f4daac610e4c24d5e6248105c67d109"
+SRCREV_machine:qemumips64 ?= "dac2da1acf6f59c2ffc1187e2a8ba6fc4c88ab30"
+SRCREV_machine ?= "f191b0373f4daac610e4c24d5e6248105c67d109"
+SRCREV_meta ?= "d0d2dd467959c77db90458d2fc6864e9505418d5"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "6c44e13dc284f7f4db17706ca48fd016d6b3d49a"
+SRCREV_machine:class-devupstream ?= "a2943d2d9a00ae7c5c1fde2b2e7e9cdb47e7db05"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.46"
+LINUX_VERSION ?= "6.1.50"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


