Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA96C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 04:16:43 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web09.5085.1643948202608305658
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 20:16:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jxJIC7KT;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id h8so4724001qtk.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Feb 2022 20:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KhZzWK9+UkuubPaKcLibunS4p3+7NS89nHav8xCPr/o=;
        b=jxJIC7KTsdtO8eniFmUra4+IIjuxr41qJLGng0FhC3bS/wIMnNq2Y6zD1YouH0MICe
         f2gfEfEmvDz1o4zhMJAbiWNuVXxHydvHUtoqCk8Vq3wSyA2rOWO05LVdeqyREO5gqg+c
         JLkLqkU4NoFD2WFpH0nOorrju6pOIHtilZQZ7ieAssSOTZAj/aFDQ+HlOq8qpAoLTVF6
         tBdM0M8Nj7QCMoSIOZ6oOJ3FE3YPDzvKC3wtZM1tx8h/E+6Pds+mwavHh10i+sZPW471
         RZ9/InNTCm2OF+rSvN91G3/8kXiQcQNu7/fjtpfPhtmZPUYMFgNoUuoHqJk1EQREUBL7
         Mw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KhZzWK9+UkuubPaKcLibunS4p3+7NS89nHav8xCPr/o=;
        b=NTSuxLNNLTqCXhJmMva/NxvMTKqE4+AmCIlh5iENJ+zWki15x4qSMPrImYgKs7Wr8p
         qD4hD34YrrnN0XTp+RVevZeD/sMK4vP9CPa6vdQe70nSzKrdCxvt+xV8691+LdGtQnur
         73UNk3bgd4frLdP0BTq3o3X8Amb8RVcUDG0vsUbrtl4F6LgjwcFpeIK3dsArtX90rADz
         z4OKoqtCX5b1vXxiifvCDAR6UUDDYjxEuzTdjIbDuxEENcn6Tr+ckHQ6OWCnAicuFEsq
         K07NzfzbDPZkv3aI7kRk3oxkM34IAJ74CdFxGZNPrHvjGmsDxt81xp8g623xHDI9KRoR
         8YhA==
X-Gm-Message-State: AOAM532Xy6mJWLlhvJMLiAJSJi+PKy73rQ2RjJ0PiDNTUdHuIxXb3XAX
	8LH5Qw5OVQVFYIjIFJWv9qvbhNczLnRrUg==
X-Google-Smtp-Source: 
 ABdhPJw+hxqztVfMTies+/HNQui3Iqu5f2mMYZt2jjaV3cgbOXA8Yb37EWm448eQFWTYyD6HxyZkmg==
X-Received: by 2002:a05:622a:50:: with SMTP id
 y16mr853908qtw.183.1643948201092;
        Thu, 03 Feb 2022 20:16:41 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 u17sm515424qkp.90.2022.02.03.20.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 20:16:40 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] linux-yocto/5.15: update to v5.15.19
Date: Thu,  3 Feb 2022 23:16:32 -0500
Message-Id: 
 <3b7ca9d548571178c6b26491667699be95930f4b.1643947217.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1643947217.git.bruce.ashfield@gmail.com>
References: <cover.1643947217.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 04:16:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161335

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    47cccb1eb2fe Linux 5.15.19
    a9739362c7b5 mtd: rawnand: mpc5121: Remove unused variable in ads5121_select_chip()
    4633a79ff8bc block: Fix wrong offset in bio_truncate()
    3d7b7272ce9d fsnotify: invalidate dcache before IN_DELETE event
    e8421a9d7bb3 usr/include/Makefile: add linux/nfc.h to the compile-test coverage
    c571505aa0fc usb: dwc3: xilinx: fix uninitialized return value
    442414e8c474 psi: fix "defined but not used" warnings when CONFIG_PROC_FS=n
    949c4c188955 psi: fix "no previous prototype" warnings when CONFIG_CGROUPS=n
    fd26531855e6 perf/core: Fix cgroup event list management
    cba7bdc04720 dt-bindings: can: tcan4x5x: fix mram-cfg RX FIFO config
    e905e1b65ce9 irqchip/realtek-rtl: Fix off-by-one in routing
    f67594cbf3c8 irqchip/realtek-rtl: Map control data to virq
    bcea886771c3 Bluetooth: refactor malicious adv data check
    c5e216e880fa net: bridge: vlan: fix memory leak in __allowed_ingress
    8861857ccc9d ipv4: remove sparse error in ip_neigh_gw4()
    d887a33724ec ipv4: tcp: send zero IPID in SYNACK messages
    4d0bd948ee86 ipv4: raw: lock the socket in raw_bind()
    2387357199a0 net: bridge: vlan: fix single net device option dumping
    e406345f8a26 Revert "ipv6: Honor all IPv6 PIO Valid Lifetime values"
    1ac025f24b89 gve: Fix GFP flags when allocing pages
    35b092d3b57f ceph: put the requests/sessions when it fails to alloc memory
    0536379e9d9d KVM: selftests: Don't skip L2's VMCALL in SMM test for SVM guest
    9b6be5b1a053 Revert "drm/ast: Support 1600x900 with 108MHz PCLK"
    1714199af7ec sch_htb: Fail on unsupported parameters when offload is requested
    3e662ceb3e6d net: hns3: handle empty unknown interrupt for VF
    925181ea76b5 net: cpsw: Properly initialise struct page_pool_params
    0690c3943ed0 yam: fix a memory leak in yam_siocdevprivate()
    4d5c2dfbc120 drm/msm/a6xx: Add missing suspend_count increment
    8f069f6dde51 drm/msm/dpu: invalid parameter check in dpu_setup_dspp_pcc
    13bd31390cae drm/msm/hdmi: Fix missing put_device() call in msm_hdmi_get_phy
    03a91f9fa93b can: tcan4x5x: regmap: fix max register value
    d0a56e4ebc6b video: hyperv_fb: Fix validation of screen resolution
    38f0bdd548fd net/smc: Transitional solution for clcsock race issue
    fdcdc94b3d35 ibmvnic: don't spin in tasklet
    d4435164be13 ibmvnic: init ->running_cap_crqs early
    aa6ae2341a8f ibmvnic: Allow extra failures before disabling
    9ae4cd5de2a5 ipv4: fix ip option filtering for locally generated fragments
    28aaed966e76 powerpc/perf: Fix power_pmu_disable to call clear_pmi_irq_pending only if PMI is pending
    b9dc12e481c0 hwmon: (adt7470) Prevent divide by zero in adt7470_fan_write()
    774a6ef81458 hwmon: (lm90) Fix sysfs and udev notifications
    f4a61d7989d5 hwmon: (lm90) Mark alert as broken for MAX6654
    ccdf90878b8b hwmon: (lm90) Re-enable interrupts after alert clears
    da20522eba44 Drivers: hv: balloon: account for vmbus packet header in max_pkt_size
    82cc3382e34e io_uring: fix bug in slow unregistering of nodes
    fa005a5c5d4d efi/libstub: arm64: Fix image check alignment at entry
    42ff00c23b16 rxrpc: Adjust retransmission backoff
    437b6b3bd88c octeontx2-pf: Forward error codes to VF
    689620df2080 octeontx2-af: cn10k: Do not enable RPM loopback for LPC interfaces
    35dd0b7e5a13 octeontx2-af: Increase link credit restore polling timeout
    f13bf41cbe2d octeontx2-af: verify CQ context updates
    4070cf004da3 octeontx2-pf: cn10k: Ensure valid pointers are freed to aura
    a332a1050ac6 octeontx2-af: Retry until RVU block reset complete
    b578044bf4de octeontx2-af: Fix LBK backpressure id count
    77c5abff9330 octeontx2-af: Do not fixup all VF action entries
    aefaccd19379 phylib: fix potential use-after-free
    82688a07cc02 net: stmmac: dwmac-visconti: Fix clock configuration for RMII mode
    27e249cafa4f net: stmmac: dwmac-visconti: Fix bit definitions for ETHER_CLK_SEL
    36c7e4f4a3ec net: phy: broadcom: hook up soft_reset for BCM54616S
    58e81159b4f7 sched/pelt: Relax the sync of util_sum with util_avg
    767060539ac4 perf: Fix perf_event_read_local() time
    498e6604a3ae powerpc/64s: Mask SRR0 before checking against the masked NIP
    3dc90add0ca9 netfilter: conntrack: don't increment invalid counter on NF_REPEAT
    3bfbc00587dc powerpc64/bpf: Limit 'ldbrx' to processors compliant with ISA v2.06
    d66377ed9a20 SUNRPC: Don't dereference xprt->snd_task if it's a cookie
    8ea839e3a59e SUNRPC: Use BIT() macro in rpc_show_xprt_state()
    19d4d09c2f16 KVM: arm64: pkvm: Use the mm_ops indirection for cache maintenance
    ee062665fbae NFS: Ensure the server has an up to date ctime before renaming
    7a784c2eaae8 NFS: Ensure the server has an up to date ctime before hardlinking
    fe36a67e82c8 ipv6: annotate accesses to fn->fn_sernum
    56480fb10b97 drm/msm/dsi: invalid parameter check in msm_dsi_phy_enable
    0069c2331be0 drm/msm/dsi: Fix missing put_device() call in dsi_get_phy
    971754f4681c drm/msm: Fix wrong size calculation
    d70d2aa49ace net-procfs: show net devices bound packet types
    d7396948cf38 NFSv4: nfs_atomic_open() can race when looking up a non-regular file
    4c36ca387af4 NFSv4: Handle case where the lookup of a directory fails
    72edb228b420 hwmon: (lm90) Reduce maximum conversion rate for G781
    dee686cbfdd1 ipv4: avoid using shared IP generator for connected sockets
    eeb0c916b0f8 ping: fix the sk_bound_dev_if match in ping_lookup
    4d647a2b6074 hwmon: (lm90) Mark alert as broken for MAX6680
    38cfdc0ef474 hwmon: (lm90) Mark alert as broken for MAX6646/6647/6649
    e43669c77cb3 net: fix information leakage in /proc/net/ptype
    1515e72aae80 ARM: 9170/1: fix panic when kasan and kprobe are enabled
    88e32f7b37a0 ipv6_tunnel: Rate limit warning messages
    b11e34f7bab2 scsi: bnx2fc: Flush destroy_work queue before calling bnx2fc_interface_put()
    9c2ece4852a6 scsi: elx: efct: Don't use GFP_KERNEL under spin lock
    daf9ac79e75b rpmsg: char: Fix race between the release of rpmsg_eptdev and cdev
    85aba11a8ea9 rpmsg: char: Fix race between the release of rpmsg_ctrldev and cdev
    a1f7aa8d60bf usb: roles: fix include/linux/usb/role.h compile issue
    d22045c80283 i40e: fix unsigned stat widths
    d49582860d33 i40e: Fix for failed to init adminq while VF reset
    00eddb0e4ea1 i40e: Fix queues reservation for XDP
    98b70add7576 i40e: Fix issue when maximum queues is exceeded
    d12f5a7c48a9 i40e: Increase delay to 1 s after global EMP reset
    c894d2f9fd53 powerpc/32: Fix boot failure with GCC latent entropy plugin
    db37befafa53 powerpc/32s: Fix kasan_init_region() for KASAN
    569c81c077eb powerpc/32s: Allocate one 256k IBAT instead of two consecutives 128k IBATs
    190753f63fc0 x86/cpu: Add Xeon Icelake-D to list of CPUs that support PPIN
    98ccfec9eae6 x86/MCE/AMD: Allow thresholding interface updates after init
    74e88eceb0af PCI/sysfs: Find shadow ROM before static attribute initialization
    cef9335c465d sched/membarrier: Fix membarrier-rseq fence command missing from query bitmask
    61296272db59 ocfs2: fix a deadlock when commit trans
    9f71d68fa813 jbd2: export jbd2_journal_[grab|put]_journal_head
    4ca8a0bc8354 mm, kasan: use compare-exchange operation to set KASAN page tag
    28b346571edd ucsi_ccg: Check DEV_INT bit only when starting CCG4
    3cdaeb85ed1e usb: typec: tcpm: Do not disconnect when receiving VSAFE0V
    6b71fad7c868 usb: typec: tcpm: Do not disconnect while receiving VBUS off
    a1399fe6d3ba usb: typec: tcpci: don't touch CC line if it's Vconn source
    9340226388c6 USB: core: Fix hang in usb_kill_urb by adding memory barriers
    1cd3a86107f6 usb: dwc3: xilinx: Fix error handling when getting USB3 PHY
    72d338bc467f usb: dwc3: xilinx: Skip resets and USB3 register settings for USB2.0 mode
    897d462d4d15 usb: cdnsp: Fix segmentation fault in cdns_lost_power function
    279804632560 usb: gadget: f_sourcesink: Fix isoc transfer for USB_SPEED_SUPER_PLUS
    42865e5544da usb: common: ulpi: Fix crash in ulpi_match()
    d5755832a1e4 usb: xhci-plat: fix crash when suspend if remote wake enable
    a93284827cb2 usb-storage: Add unusual-devs entry for VL817 USB-SATA bridge
    209a523dea93 kbuild: remove include/linux/cyclades.h from header file check
    fa5180351abe tty: Add support for Brainboxes UC cards.
    b51afdc797fe tty: Partially revert the removal of the Cyclades public API
    ff79be505ad8 tty: n_gsm: fix SW flow control encoding/handling
    775fcd69038a serial: stm32: fix software flow control transfer
    f79903783db1 serial: 8250: of: Fix mapped region size when using reg-offset property
    f0cb78064e1c serial: pl011: Fix incorrect rs485 RTS polarity on set_mctrl
    965bc27251f0 dm: properly fix redundant bio-based IO accounting
    4cca3e3ef21d block: add bio_start_io_acct_time() to control start_time
    86125006d88d dm: revert partial fix for redundant bio-based IO accounting
    c0af639c1adc KVM: PPC: Book3S HV Nested: Fix nested HFSCR being clobbered with multiple vCPUs
    e668b527a259 KVM: x86: Sync the states size with the XCR0/IA32_XSS at, any time
    096779d44087 KVM: x86: Update vCPU's runtime CPUID on write to MSR_IA32_XSS
    5afeafcc59bb KVM: x86: Keep MSR_IA32_XSS unchanged for INIT
    e302786233e6 KVM: x86: Forcibly leave nested virt when SMM state is toggled
    6f3e157e21b2 KVM: x86: nSVM: skip eax alignment check for non-SVM instructions
    575656560897 KVM: SVM: Don't intercept #GP for SEV guests
    3470722fac22 KVM: SVM: Never reject emulation due to SMAP errata for !SEV guests
    54b3439c8e70 KVM: LAPIC: Also cancel preemption timer during SET_LAPIC
    548f20b39ec9 drm/amd/display: Fix FP start/end for dcn30_internal_validate_bw.
    73740f948252 drm/atomic: Add the crtc to affected crtc only if uapi.enable = true
    473aed10d16d drm/etnaviv: relax submit size limits
    b7bfc2c6cdd2 perf/x86/intel: Add a quirk for the calculation of the number of counters on Alder Lake
    1b4abcd997ad perf/x86/intel/uncore: Fix CAS_COUNT_WRITE issue for ICX
    b8140d7733e0 powerpc/audit: Fix syscall_get_arch()
    d3e4c61e143e psi: Fix uaf issue when psi trigger is destroyed while being polled
    b17cb93dda1d Revert "KVM: SVM: avoid infinite loop on NPF from bad address"
    e6023ab8c729 fsnotify: fix fsnotify hooks in pseudo filesystems
    2aac1eda4638 ceph: set pool_ns in new inode layout for async creates
    36d433ae3242 ceph: properly put ceph_string reference after async create attempt
    4e5dcbedd48d tracing: Don't inc err_log entry count if entry allocation fails
    e33fa4a46ee2 tracing/histogram: Fix a potential memory leak for kstrdup()
    fb9b60bbda55 PM: wakeup: simplify the output logic of pm_show_wakelocks()
    3df524489788 efi: runtime: avoid EFIv2 runtime services on Apple x86 machines
    cbf96c58e28b udf: Fix NULL ptr deref when converting from inline format
    2ea17d25be51 udf: Restore i_lenAlloc when inode expansion fails
    172aa3b81182 scsi: zfcp: Fix failed recovery on gone remote port with non-NPIV FCP devices
    348a8501e602 ucount: Make get_ucount a safe get_user replacement
    2dc0a8e0129f powerpc/bpf: Update ldimm64 instructions during extra pass
    2f262cadff57 powerpc32/bpf: Fix codegen for bpf-to-bpf calls
    0bcd484587b3 bpf: Guard against accessing NULL pt_regs in bpf_get_task_stack()
    cfd2a7f8deaa s390/nmi: handle vector validity failures for KVM guests
    c058e1ae9dd5 s390/nmi: handle guarded storage validity failures for KVM guests
    4abcb06fdcb2 s390/hypfs: include z/VM guests with access control group set
    2025d5cb381e s390/module: fix loading modules with a lot of relocations
    a3aa4850b37b KVM: arm64: Use shadow SPSR_EL1 when injecting exceptions on !VHE
    d9505958e1ee ARM: 9180/1: Thumb2: align ALT_UP() sections in modules sufficiently
    cbab3cac94c6 ARM: 9179/1: uaccess: avoid alignment faults in copy_[from|to]_kernel_nofault
    e826ab185717 net: stmmac: skip only stmmac_ptp_register when resume from suspend
    9ef5a86d447a net: stmmac: configure PTP clock source prior to PTP initialization
    30705f1f012c net: sfp: ignore disabled SFP node
    5e32b05c3861 can: m_can: m_can_fifo_{read,write}: don't read or write from/to FIFO if length is 0
    9c43548a7fb8 Linux 5.15.18
    6066977961fc drm/vmwgfx: Fix stale file descriptors on failed usercopy
    9c82ce593626 arm64/bpf: Remove 128MB limit for BPF JIT programs
    7b6577cf9fe4 drm/amdgpu: Use correct VIEWPORT_DIMENSION for DCN2
    145407e54fd1 select: Fix indefinitely sleeping task in poll_schedule_timeout()
    c3156dbd5082 rcu: Tighten rcu_advance_cbs_nowake() checks
    6ebe994b54a6 memcg: better bounds on the memcg stats updates
    6c8076660d9c memcg: unify memcg stat flushing
    7182935bd5ae memcg: flush stats only if updated
    2691be41fede bnx2x: Invalidate fastpath HSI version for VFs
    66e1791cbeed bnx2x: Utilize firmware 7.13.21.0
    b168b1a0397e io_uring: fix not released cached task refs
    f71c91ed1d4b drm/amd/display: reset dcn31 SMU mailbox on failures
    8a17a077e7e9 drm/i915: Flush TLBs before releasing backing store
    e8a2995c6076 Linux 5.15.17
    4ea9b8ed6459 scripts: sphinx-pre-install: Fix ctex support on Debian
    21c9a4d2cdd4 scripts: sphinx-pre-install: add required ctex dependency
    ffd8fd2faf47 lib/test_meminit: destroy cache in kmem_cache_alloc_bulk() test
    8d8f479e08a3 bonding: Fix extraction of ports from the packet headers
    52b66f818916 mm/hmm.c: allow VM_MIXEDMAP to work with hmm_range_fault
    42de0446a142 lib82596: Fix IRQ check in sni_82596_probe
    8d1e3f319160 scripts/dtc: dtx_diff: remove broken example from help text
    46210f505189 sch_api: Don't skip qdisc attach on ingress
    814527dbc101 dt-bindings: watchdog: Require samsung,syscon-phandle for Exynos7
    34aa30c8ff90 dt-bindings: display: meson-vpu: Add missing amlogic,canvas property
    3f219ebc9f63 dt-bindings: display: meson-dw-hdmi: add missing sound-name-prefix property
    e829e487f193 net: mscc: ocelot: fix using match before it is set
    f864b6130498 net: phy: micrel: use kszphy_suspend()/kszphy_resume for irq aware devices
    ed27539e5a4b net: cpsw: avoid alignment faults by taking NET_IP_ALIGN into account
    d1a29a4e334b net: sfp: fix high power modules without diagnostic monitoring
    a2faa4a27262 net: ocelot: Fix the call to switchdev_bridge_port_offload
    f8df88d6d10c net: ethernet: mtk_eth_soc: fix error checking in mtk_mac_config()
    c2d55304dba8 net: wwan: Fix MRU mismatch issue which may lead to data connection lost
    5715614a9da8 bcmgenet: add WOL IRQ check
    784ea1478f4d net: mscc: ocelot: don't let phylink re-enable TX PAUSE on the NPI port
    b4e6455d7ffc net_sched: restore "mpu xxx" handling
    75a09b8d0208 net: ipa: fix atomic update in ipa_endpoint_replenish()
    f1d206181f19 net: bonding: fix bond_xmit_broadcast return value error bug
    62009fa50c1a net: fix sock_timestamping_bind_phc() to release device
    55d613f5d4c2 arm64: dts: qcom: msm8996: drop not documented adreno properties
    795ad139ed91 devlink: Remove misleading internal_flags from health reporter dump
    228a7024ed8a perf probe: Fix ppc64 'perf probe add events failed' case
    115b85125624 perf tools: Drop requirement for libstdc++.so for libopencsd check
    e73f737a6e71 dmaengine: at_xdmac: Fix at_xdmac_lld struct definition
    b81e898073c2 dmaengine: at_xdmac: Fix lld view setting
    fb8f0e827af2 dmaengine: at_xdmac: Fix concurrency over xfers_list
    5a8547fc3c21 dmaengine: at_xdmac: Print debug message after realeasing the lock
    da1875fd4c25 dmaengine: at_xdmac: Start transfer for cyclic channels in issue_pending
    45e0d5185031 dmaengine: at_xdmac: Don't start transactions at tx_submit level
    e127c17af30e perf script: Fix hex dump character output
    48a46df6d542 libcxgb: Don't accidentally set RTO_ONLINK in cxgb_find_route()
    09c0535c768d gre: Don't accidentally set RTO_ONLINK in gre_fill_metadata_dst()
    63bc14d6e261 vdpa/mlx5: Restore cur_num_vqs in case of failure in change_num_qps()
    786e608e97b9 xfrm: Don't accidentally set RTO_ONLINK in decode_session4()
    6dc6e9f9d94d iwlwifi: fix Bz NMI behaviour
    31428796ca4b netns: add schedule point in ops_exit_list()
    958cbb139ec4 inet: frags: annotate races around fqdir->dead and fqdir->high_thresh
    0288b85d750e taskstats: Cleanup the use of task->exit_code
    be82a92c46bc virtio_ring: mark ring unused on error
    0d3334c47a2e vdpa/mlx5: Fix wrong configuration of virtio_version_1_0
    087d45cd0f1a rtc: pxa: fix null pointer dereference
    4c979e88b658 HID: vivaldi: fix handling devices not using numbered reports
    b81f33f1fc38 um: gitignore: Add kernel/capflags.c
    fe17064738ad bitops: protect find_first_{,zero}_bit properly
    6ad2daa516de net: axienet: increase default TX ring size to 128
    4928dd5990ea net: axienet: fix for TX busy handling
    a530eb5ac606 net: axienet: fix number of TX ring slots for available check
    6342bde86b5a net: axienet: Fix TX ring slot available check
    b9d67f0a6dc0 net: axienet: limit minimum TX ring size
    e8893b1f8899 net: axienet: add missing memory barriers
    07a6ec97c1ef net: axienet: reset core on initialization prior to MDIO access
    9b7f3e6adc15 net: axienet: Wait for PhyRstCmplt after core reset
    712224b86247 net: axienet: increase reset timeout
    25b1d0df9483 net/smc: Fix hung_task when removing SMC-R devices
    405d639ac411 gpio: idt3243x: Fix IRQ check in idt_gpio_probe
    4928241698e1 gpio: mpc8xxx: Fix IRQ check in mpc8xxx_probe
    e7525b3b9eda pinctrl/rockchip: fix gpio device creation
    8fc3bd2c347b clk: si5341: Fix clock HW provider cleanup
    4919c0737806 clk: Emit a stern warning with writable debugfs enabled
    3872d146f2b0 af_unix: annote lockless accesses to unix_tot_inflight & gc_in_progress
    cb697a36f415 crypto: octeontx2 - uninitialized variable in kvf_limits_store()
    2d7d3b6da85e f2fs: fix to check available space of CP area correctly in update_ckpt_flags()
    0789b9b34922 f2fs: fix to reserve space for IO align feature
    56dabe87c4aa f2fs: compress: fix potential deadlock of compress file
    b653ee5c4136 f2fs: fix to avoid panic in is_alive() if metadata is inconsistent
    92804f969524 f2fs: fix remove page failed in invalidate compress pages
    28e36db0617c drm/vmwgfx: Remove unused compile options
    f468282f3de0 drm/vmwgfx: Remove explicit transparent hugepages support
    42b777c6aef9 riscv: dts: microchip: mpfs: Drop empty chosen node
    fc1d427d15aa parisc: pdc_stable: Fix memory leak in pdcs_register_pathentries
    911b5ba7c54f net/fsl: xgmac_mdio: Fix incorrect iounmap when removing module
    fa456d92c4b7 net/fsl: xgmac_mdio: Add workaround for erratum A-009885
    0cba6beb9645 mlx5: Don't accidentally set RTO_ONLINK before mlx5e_route_lookup_ipv4_get()
    6c923b0f74ae ipv4: avoid quadratic behavior in netns dismantle
    4bcc304e4255 ipv4: update fib_info_cnt under spinlock protection
    c2a957a6f252 perf evsel: Override attr->sample_period for non-libpfm4 events
    95429d6b64b1 bpf: Mark PTR_TO_FUNC register initially with zero offset
    20ceec871b66 bpf: Fix mount source show for bpffs
    b87b59633e35 xdp: check prog type before updating BPF link
    b46b0ef69d07 bpftool: Fix indent in option lists in the documentation
    220ee6f3b460 bpftool: Remove inclusion of utilities.mak from Makefiles
    adb344f551d6 drm/vc4: crtc: Copy assigned channel to the CRTC
    d26a90d362d9 drm/vc4: Fix non-blocking commit getting stuck forever
    d2cbb24cf66e drm/vc4: crtc: Drop feed_txp from state
    b157f4bf1fc6 block: Fix fsync always failed if once failed
    269fbc268633 block: fix async_depth sysfs interface for mq-deadline
    1e95e6dab0d1 powerpc/fsl/dts: Enable WA for erratum A-009885 on fman3l MDIO buses
    696733774b2f powerpc/cell: Fix clang -Wimplicit-fallthrough warning
    3feb292a03d1 Revert "net/mlx5: Add retry mechanism to the command entry index allocation"
    b8b4a083ab94 dmaengine: stm32-mdma: fix STM32_MDMA_CTBR_TSEL_MASK
    7de812fc6be4 RDMA/rxe: Fix a typo in opcode name
    779ff1e23450 RDMA/hns: Modify the mapping attribute of doorbell to device
    dcb7718a8073 dmaengine: idxd: fix wq settings post wq disable
    d87eb22b94f6 dmaengine: uniphier-xdmac: Fix type of address variables
    60390c2242d6 RDMA/cma: Remove open coding of overflow checking for private_data_len
    0dc4db8abccf scsi: ufs: ufs-mediatek: Fix error checking in ufs_mtk_init_va09_pwr_ctrl()
    46f6dda2a6fc scsi: core: Show SCMD_LAST in text form
    53b2ad98d2bb Bluetooth: hci_sync: Fix not setting adv set duration
    7055782bc722 net: usb: Correct reset handling of smsc95xx
    a15a5eabae41 Bluetooth: btusb: Return error code when getting patch status failed
    9e2d8d9c0e33 Documentation: fix firewire.rst ABI file path error
    b791ffcb23c9 Documentation: refer to config RANDOMIZE_BASE for kernel address-space randomization
    63e9fdd76cca Documentation, arch: Remove leftovers from CIFS_WEAK_PW_HASH
    2644d43268da Documentation, arch: Remove leftovers from raw device
    6bcac3149e94 Documentation: ACPI: Fix data node reference documentation
    d4aa8cd70b3f Documentation: dmaengine: Correctly describe dmatest with channel unset
    1d4f0d707d35 Documentation: coresight: Fix documentation issue
    aceb8d70f7aa media: correct MEDIA_TEST_SUPPORT help text
    fbe1e801bc1f drm/vc4: hdmi: Make sure the device is powered with CEC
    31a5bdbe4a68 media: rcar-csi2: Optimize the selection PHTW register
    c8e0c2cf2dd4 can: mcp251xfd: mcp251xfd_tef_obj_read(): fix typo in error message
    1844b8ae85ac firmware: Update Kconfig help text for Google firmware
    3252ca8b6673 of: base: Improve argument length mismatch error
    f22f67b43775 drm/radeon: fix error handling in radeon_driver_open_kms
    16c436fa4f74 ath11k: qmi: avoid error messages when dma allocation fails
    cb77c81d3479 tracing/osnoise: Properly unhook events if start_per_cpu_kthreads() fails
    0d99b0a7c329 ext4: don't use the orphan list when migrating an inode
    e58742f46afc ext4: fix an use-after-free issue about data=journal writeback mode
    0a3624bfdc00 ext4: fix null-ptr-deref in '__ext4_journal_ensure_credits'
    c857769622f3 ext4: destroy ext4_fc_dentry_cachep kmemcache on module removal
    95fb4c496a7a ext4: fast commit may miss tracking unwritten range during ftruncate
    82034851e93b ext4: use ext4_ext_remove_space() for fast commit replay delete range
    efbb6fcced2d ext4: Fix BUG_ON in ext4_bread when write quota data
    fd86fd7119fb ext4: set csum seed in tmp inode while migrating to extents
    50bc43bc1ce0 ext4: fix fast commit may miss tracking range for FALLOC_FL_ZERO_RANGE
    85cc4554eea8 ext4: initialize err_blk before calling __ext4_get_inode_loc
    2d221d9b17fa ext4: fix a possible ABBA deadlock due to busy PA
    bca8a2bfbdd0 ext4: make sure quota gets properly shutdown on error
    8ffe9ad9f5ef ext4: make sure to reset inode lockdep class when quota enabling fails
    5237c93d58c3 btrfs: respect the max size in the header when activating swap file
    724d9fa55cbe btrfs: check the root node for uptodate before returning it
    ef383621b125 btrfs: fix deadlock between quota enable and other quota operations
    9c1154f395cb xfrm: fix dflt policy check when there is no policy configured
    491c3ae9fbb6 xfrm: fix policy lookup for ipv6 gre packets
    9473abe5b5bf PCI: pci-bridge-emul: Set PCI_STATUS_CAP_LIST for PCIe device
    d4e0d674b42d PCI: pci-bridge-emul: Correctly set PCIe capabilities
    9624d1eb4d1f PCI: pci-bridge-emul: Fix definitions of reserved bits
    b1445d865b05 PCI: pci-bridge-emul: Properly mark reserved PCIe bits in PCI config space
    15cf508331ef PCI: pci-bridge-emul: Make expansion ROM Base Address register read-only
    c2451a37174c PCI: pciehp: Use down_read/write_nested(reset_lock) to fix lockdep errors
    0a04b6a0f7f4 PCI: xgene: Fix IB window setup
    077fe9d86560 drm/i915/display/ehl: Update voltage swing table
    c3a9e0e701df drm/amdgpu: don't do resets on APUs which don't support it
    99d41076c260 scsi: lpfc: Fix lpfc_force_rscn ndlp kref imbalance
    56fc6cb5d59a powerpc/64s/radix: Fix huge vmap false positive
    46df3013a5c2 parisc: Fix lpa and lpa_user defines
    95df03b471d9 drm/bridge: analogix_dp: Make PSR-exit block less
    d2a6d606e6d3 drm/nouveau/kms/nv04: use vzalloc for nv04_display
    3bf997ec299c drm/amd/display: Fix the uninitialized variable in enable_stream_features()
    2de6ce583651 drm/etnaviv: limit submit sizes
    a04da77f444a drm/tegra: submit: Add missing pm_runtime_mark_last_busy()
    b8902d5ab431 device property: Fix fwnode_graph_devcon_match() fwnode leak
    9d2867101704 s390/mm: fix 2KB pgtable release race
    b5498bbba0d3 iwlwifi: mvm: Increase the scan timeout guard to 30 seconds
    9e87229ff651 remoteproc: imx_rproc: Fix a resource leak in the remove function
    74c0c6483b63 tracing: Have syscall trace events use trace_event_buffer_lock_reserve()
    40022b3682d5 tracing/kprobes: 'nmissed' not showed correctly for kretprobe
    95c7ba00353f sched/cpuacct: Fix user/system in shown cpuacct.usage*
    b48450843f57 cputime, cpuacct: Include guest time in user time in cpuacct.stat
    6f52d2531f30 serial: Fix incorrect rs485 polarity on uart open
    3ec632bc0a4a fuse: Pass correct lend value to filemap_write_and_wait_range()
    2884aac07874 HID: magicmouse: Fix an error handling path in magicmouse_probe()
    00e3d58f50a8 md: Move alloc/free acct bioset in to personality
    c77edcd242b4 xen/gntdev: fix unmap notification order
    0d9b780cb385 spi: uniphier: Fix a bug that doesn't point to private data correctly
    e53802534cd2 mfd: tps65910: Set PWR_OFF bit during driver probe
    e6b11d8fc548 tpm: fix NPE on probe for missing device
    c90732a58cd1 tpm: fix potential NULL pointer access in tpm_del_char_device
    277c60c9e9eb ubifs: Error path in ubifs_remount_rw() seems to wrongly free write buffers
    d6b6324c3c17 crypto: caam - replace this_cpu_ptr with raw_cpu_ptr
    5c91102702f7 crypto: stm32/crc32 - Fix kernel BUG triggered in probe()
    7f429ce71edb crypto: omap-aes - Fix broken pm_runtime_and_get() usage
    8b6d58859e8f ifcvf/vDPA: fix misuse virtio-net device config size for blk dev
    e2b53845a939 rpmsg: core: Clean up resources on announce_create failure.
    591a1e2ef0f1 udp6: Use Segment Routing Header for dest address if present
    af58dbc08ea3 icmp: ICMPV6: Examine invoking packet for Segment Route Headers.
    85b3b307471e seg6: export get_srh() for ICMP handling
    bcb86df40f96 mailbox: change mailbox-mpfs compatible string
    d543ba3a61d7 phy: mediatek: Fix missing check in mtk_mipi_tx_probe
    5895474d2182 habanalabs: skip read fw errors if dynamic descriptor invalid
    8f23743e1978 ASoC: mediatek: mt8183: fix device_node leak
    61274c00d8e8 ASoC: mediatek: mt8173: fix device_node leak
    ab23ed0a7c8c phy: phy-mtk-tphy: add support efuse setting
    286c6f7b28fa ASoC: mediatek: mt8192-mt6359: fix device_node leak
    5b03322abb61 scsi: mpi3mr: Fixes around reply request queues
    f325446b5a18 scsi: sr: Don't use GFP_DMA
    6af33b200b7f MIPS: Octeon: Fix build errors using clang
    843fff4287a5 selftests/powerpc: Add a test of sigreturning to the kernel
    845a5a4a8fd9 i2c: designware-pci: Fix to change data types of hcnt and lcnt parameters
    23606176a3b4 irqchip/gic-v4: Disable redistributors' view of the VPE table at boot time
    e8ffc355c7d6 MIPS: OCTEON: add put_device() after of_find_device_by_node()
    9de7569942cc udf: Fix error handling in udf_new_inode()
    625be247e812 powerpc/fadump: Fix inaccurate CPU state info in vmcore generated with panic
    953cacfaf36a powerpc: handle kdump appropriately with crash_kexec_post_notifiers option
    6a0a06c9b193 selftests/powerpc/spectre_v2: Return skip code when miss_percent is high
    e7dd8ba6fc84 powerpc/40x: Map 32Mbytes of memory at startup
    7e6c8ff5c21c MIPS: Loongson64: Use three arguments for slti
    8774f9824c2c ALSA: seq: Set upper limit of processed events
    b693e737e080 scsi: lpfc: Trigger SLI4 firmware dump before doing driver cleanup
    5b91e80b631c scsi: lpfc: Fix leaked lpfc_dmabuf mbox allocations with NPIV
    ef9e3ecacb75 scsi: ufs: Fix a kernel crash during shutdown
    d90d496a999e interconnect: qcom: rpm: Prevent integer overflow in rate
    efd507bed1b4 dm: fix alloc_dax error handling in alloc_dev
    78d56d075464 nvmem: core: set size for sysfs bin file
    fea0e4b49dd2 w1: Misuse of get_user()/put_user() reported by sparse
    d58837197d20 KVM: PPC: Book3S: Suppress failed alloc warning in H_COPY_TOFROM_GUEST
    a0a4d7a23d18 KVM: PPC: Book3S: Suppress warnings when allocating too big memory slots
    9170beaeffe4 powerpc/powermac: Add missing lockdep_register_key()
    af0e9677f6e6 clk: meson: gxbb: Fix the SDM_EN bit for MPLL0 on GXBB
    95abac60d96d i2c: mpc: Correct I2C reset procedure
    f374976a7e4d powerpc/smp: Move setup_profiling_timer() under CONFIG_PROFILING
    be9313f755a7 i2c: i801: Don't silently correct invalid transfer size
    b8526a5003d6 ASoC: imx-hdmi: add put_device() after of_find_device_by_node()
    52ce10c1878c powerpc/watchdog: Fix missed watchdog reset due to memory ordering race
    aa8c27014529 powerpc/btext: add missing of_node_put
    efe379f92d5f powerpc/cell: add missing of_node_put
    179ecdf5c089 powerpc/powernv: add missing of_node_put
    5203c7027fdd powerpc/6xx: add missing of_node_put
    992a9eafb1ec x86/kbuild: Enable CONFIG_KALLSYMS_ALL=y in the defconfigs
    67de7d5ae29b can: flexcan: add more quirks to describe RX path capabilities
    cf0649500913 can: flexcan: rename RX modes
    e719eeb50885 can: flexcan: allow to change quirks at runtime
    b9d50e591133 parisc: Avoid calling faulthandler_disabled() twice
    4e2e5a033e93 net/mlx5e: Unblock setting vid 0 for VF in case PF isn't eswitch manager
    d24e3a126b2e net/mlx5: Update log_max_qp value to FW max capability
    8c751aac0b64 random: do not throw away excess input to crng_fast_load
    0e7d8e930aba serial: core: Keep mctrl register state and cached copy in sync
    5b452507d5e7 serial: pl011: Drop CR register reset on set_termios
    9201e1dd5aee serial: pl010: Drop CR register reset on set_termios
    7828830235cb regulator: qcom_smd: Align probe function with rpmh-regulator
    59caf131b18c net: gemini: allow any RGMII interface mode
    00bf5ce4bf9a net: phy: marvell: configure RGMII delays for 88E1118
    5b2fd3370e7f mlxsw: pci: Avoid flow control for EMAD packets
    0415b84eee93 bpf/selftests: Fix namespace mount setup in tc_redirect
    1674124a8855 dm space map common: add bounds check to sm_ll_lookup_bitmap()
    b5aee20b5316 dm btree: add a defensive bounds check to insert_at()
    3c3417b013cf mac80211: allow non-standard VHT MCS-10/11
    2d1c1df9c899 net: mdio: Demote probed message to debug print
    a3fdfe36c36a btrfs: remove BUG_ON(!eie) in find_parent_nodes
    b667d77ca70c btrfs: remove BUG_ON() in find_parent_nodes()
    d70ce75d1d28 ACPI: CPPC: Check present CPUs for determining _CPC is valid
    dd7c1a930252 ACPI: battery: Add the ThinkPad "Not Charging" quirk
    e4066c05d332 amdgpu/pm: Make sysfs pm attributes as read-only for VFs
    493b87970061 drm/amdgpu: fixup bad vram size on gmc v8
    1ee70b4c5406 mmc: mtk-sd: Use readl_poll_timeout instead of open-coded polling
    dcedcbe17739 ACPICA: Hardware: Do not flush CPU cache when entering S4 and S5
    a4c7a12027f2 ACPICA: Fix wrong interpretation of PCC address
    2718d4a8d632 ACPICA: Executer: Fix the REFCLASS_REFOF case in acpi_ex_opcode_1A_0T_1R()
    3c3b033d170d ACPICA: Utilities: Avoid deleting the same object twice in a row
    78cc8a75303f ACPICA: actypes.h: Expand the ACPI_ACCESS_ definitions
    8c641409536d jffs2: GC deadlock reading a page that is used in jffs2_write_begin()
    46241ec22925 drm/etnaviv: consider completed fence seqno in hang check
    2b68b42a5d05 xfrm: rate limit SA mapping change message to user space
    74f1c807c679 Bluetooth: vhci: Set HCI_QUIRK_VALID_LE_STATES
    e6e03a16eba4 Bluetooth: btintel: Add missing quirks and msft ext for legacy bootloader
    0863e7e0ceb5 ath11k: Fix napi related hang
    617a9e6da974 um: registers: Rename function names to avoid conflicts and build problems
    f75868e020a1 block: check minor range in device_add_disk()
    892805138cb4 mmc: sdhci-pci-gli: GL9755: Support for CD/WP inversion on OF platforms
    0c3f9c13796e iwlwifi: pcie: make sure prph_info is set when treating wakeup IRQ
    ec53a638c18e iwlwifi: mvm: fix AUX ROC removal
    abce9e05089e iwlwifi: mvm: Fix calculation of frame length
    58d53fe49a5d iwlwifi: remove module loading failure message
    e23f075d7798 iwlwifi: fix leaks/bad data after failed firmware load
    73a32ee6daef PM: AVS: qcom-cpr: Use div64_ul instead of do_div
    9a9669e75735 rtw88: 8822c: update rx settings to prevent potential hw deadlock
    38d8d8a88274 ath9k: Fix out-of-bound memcpy in ath9k_hif_usb_rx_stream
    735aefae7b68 ath9k_htc: fix NULL pointer dereference at ath9k_htc_tx_get_packet()
    6eedec710840 ath9k_htc: fix NULL pointer dereference at ath9k_htc_rxep()
    243ab93501e6 mt76: mt7615: improve wmm index allocation
    9d39145c49d0 mt76: do not pass the received frame with decryption error
    3a1ef2b12338 mt76: mt7615: fix possible deadlock while mt7615_register_ext_phy()
    a09dc6c4638f usb: hub: Add delay for SuperSpeed hub resume to let links transit to U0
    79235edc66cb cpufreq: Fix initialization of min and max frequency QoS requests
    fddbdd20c8e0 PM: runtime: Add safety net to supplier device release
    4586d164c319 crypto: hisilicon/hpre - fix memory leak in hpre_curve25519_src_init()
    c0713b3017a8 crypto: ccp - Move SEV_INIT retry for corrupted data
    a8186a100978 arm64: tegra: Adjust length of CCPLEX cluster MMIO region
    77e5d1974a1b arm64: dts: ls1028a-qds: move rtc node to the correct i2c bus
    d978295bb551 audit: ensure userspace is penalized the same as the kernel when under pressure
    305f07b93d34 drm/amd/amdgpu: fix gmc bo pin count leak in SRIOV
    8662d0c6a368 drm/amd/amdgpu: fix psp tmr bo pin count leak in SRIOV
    29d6a92af56d mmc: core: Fixup storing of OCR for MMC_QUIRK_NONSTD_SDIO
    384a5e27a44f mmc: tmio: reinit card irqs in reset routine
    c3d14b3585b7 media: saa7146: hexium_gemini: Fix a NULL pointer dereference in hexium_attach()
    84155d2b0606 media: rockchip: rkisp1: use device name for debugfs subdir name
    87d0b8170234 media: igorplugusb: receiver overflow should be reported
    26d516434d1c HID: i2c-hid-of: Expose the touchscreen-inverted properties
    bc13af2535e5 HID: quirks: Allow inverting the absolute X/Y values
    4a635b9d5ba5 drm/amdkfd: Fix error handling in svm_range_add
    684815ff760b bpf: Do not WARN in bpf_warn_invalid_xdp_action()
    451ee28aed9d kunit: Don't crash if no parameters are generated
    584d9e3e7459 net: bonding: debug: avoid printing debug logs when bond is not notifying peers
    0f962554d016 x86/mce: Mark mce_read_aux() noinstr
    b26d3a8f826d x86/mce: Mark mce_end() noinstr
    f166c0b3ac1c x86/mce: Mark mce_panic() noinstr
    f2bde2aeb1ae x86/mce: Allow instrumentation during task work queueing
    3903e6279530 ARM: dts: qcom: sdx55: fix IPA interconnect definitions
    f6d165a8fa04 ath11k: Avoid false DEADLOCK warning reported by lockdep
    271842c326bb selftests/ftrace: make kprobe profile testcase description unique
    8bb1290e9050 gpio: aspeed-sgpio: Convert aspeed_sgpio.lock to raw_spinlock
    d9332eab2338 gpio: aspeed: Convert aspeed_gpio.lock to raw_spinlock
    3c2a24aa3412 net: phy: prefer 1000baseT over 1000baseKX
    0abd3f9903fa net-sysfs: update the queue counts in the unregistration path
    f7bae4d4595d ath10k: Fix tx hanging
    21b07b470a40 ath11k: avoid deadlock by change ieee80211_queue_work for regd_update_work
    bcf404b305f4 rcutorture: Avoid soft lockup during cpu stall
    d63ddcee9ff3 iwlwifi: mvm: avoid clearing a just saved session protection id
    59b49457fbd8 iwlwifi: mvm: synchronize with FW after multicast commands
    b52954c7798e arm64: dts: renesas: Fix thermal bindings
    2f804823b5b7 thunderbolt: Runtime PM activate both ends of the device link
    0c044e39d52a media: m920x: don't use stack on USB reads
    6aaff2d7c9d5 media: atomisp: fix "variable dereferenced before check 'asd'"
    a2e962b2d8b0 media: saa7146: hexium_orion: Fix a NULL pointer dereference in hexium_attach()
    d747b4831d5f media: rcar-vin: Update format alignment constraints
    1c9bbda87cdc media: uvcvideo: Increase UVC_CTRL_CONTROL_TIMEOUT to 5 seconds.
    4d6a98ce80f6 drm: rcar-du: Fix CRTC timings when CMM is used
    30bd6733ef96 x86/mm: Flush global TLB when switching to trampoline page-table
    1b4422befeba floppy: Add max size check for user space request
    eeefb3436d42 usb: uhci: add aspeed ast2600 uhci support
    750f28d69b99 arm64: dts: ti: j721e-main: Fix 'dtbs_check' in serdes_ln_ctrl node
    e785275d780e arm64: dts: ti: j7200-main: Fix 'dtbs_check' serdes_ln_ctrl node
    94168f47f9b1 ACPI / x86: Add not-present quirk for the PCI0.SDHB.BRC1 device on the GPD win
    10f2c10c0e20 ACPI / x86: Allow specifying acpi_device_override_status() quirks by path
    91f918b7885f ACPI: Change acpi_device_always_present() into acpi_device_override_status()
    1fd897834b77 ACPI / x86: Drop PWM2 device on Lenovo Yoga Book from always present table
    2518f943a18e drm/vmwgfx: Introduce a new placement for MOB page tables
    ff74a49da07b drm/vmwgfx: Release ttm memory if probe fails
    f168858f6096 regulator: da9121: Prevent current limit change when enabled
    34b1e259b1f5 media: venus: avoid calling core_clk_setrate() concurrently during concurrent video sessions
    371a75dfaadb ath11k: Avoid NULL ptr access during mgmt tx cleanup
    dbba81756c1b rsi: Fix out-of-bounds read in rsi_read_pkt()
    bac512a0f3fe rsi: Fix use-after-free in rsi_rx_done_handler()
    b2762757f4e4 mwifiex: Fix skb_over_panic in mwifiex_usb_recv()
    bed51dafd544 crypto: jitter - consider 32 LSB for APT
    0c3df095fab6 HSI: core: Fix return freed object in hsi_new_client
    8c124608bf46 gpiolib: acpi: Do not set the IRQ type if the IRQ is already in use
    c6d9c77a19d0 tty: serial: imx: disable UCR4_OREN in .stop_rx() instead of .shutdown()
    93306292b776 mxser: keep only !tty test in ISR
    405856460d3e drm/bridge: megachips: Ensure both bridges are probed before registration
    58d33532664c drm/amd/display: add else to avoid double destroy clk_mgr
    ae93accee317 mlxsw: pci: Add shutdown method in PCI driver
    b019927f1c4a soc: ti: pruss: fix referenced node in error message
    f94cf1cb1796 drm/amdgpu/display: set vblank_disable_immediate for DC
    1fffa8ffd62f drm/amd/display: check top_pipe_to_program pointer
    5e0f1c68da1e ARM: imx: rename DEBUG_IMX21_IMX27_UART to DEBUG_IMX27_UART
    b16e928b6a30 soc: imx: gpcv2: Synchronously suspend MIX domains
    f573eda00b39 arm64: dts: qcom: sm8350: Shorten camera-thermal-bottom name
    c41c4bc61db2 EDAC/synopsys: Use the quirk for version instead of ddr version
    342aa207c9da ethernet: renesas: Use div64_ul instead of do_div
    a111f8e113c7 libbpf: Accommodate DWARF/compiler bug with duplicated structs
    299951bd1ef9 media: b2c2: Add missing check in flexcop_pci_isr:
    3396b7cf1478 HID: apple: Do not reset quirks when the Fn key is not found
    e6ad399596bd HID: magicmouse: Report battery level over USB
    c350fcc74035 drm: panel-orientation-quirks: Add quirk for the Lenovo Yoga Book X91F/L
    d168123f1388 psi: Fix PSI_MEM_FULL state when tasks are in memstall and doing reclaim
    07888a4fbcf2 usb: gadget: f_fs: Use stream_open() for endpoint files
    7171e60715a6 USB: ehci_brcm_hub_control: Improve port index sanitizing
    432acc8ad244 usb: dwc3: meson-g12a: fix shared reset control use
    79a3d8f1882d ath11k: Fix crash caused by uninitialized TX ring
    f1d85deaf343 media: atomisp: handle errors at sh_css_create_isp_params()
    bab93d536617 batman-adv: allow netlink usage in unprivileged containers
    5a47ca7f7894 ARM: shmobile: rcar-gen2: Add missing of_node_put()
    75272f75eddf media: atomisp: check before deference asd variable
    8335807ce313 media: atomisp-ov2680: Fix ov2680_set_fmt() clobbering the exposure
    f04b8bdddf7a media: atomisp: set per-device's default mode
    d4c0cb23e5b3 media: atomisp: fix try_fmt logic
    7be59e8a6660 drm/nouveau/pmu/gm200-: avoid touching PMU outside of DEVINIT/PREOS/ACR
    0dedaf16ca43 drm/bridge: dw-hdmi: handle ELD when DRM_BRIDGE_ATTACH_NO_CONNECTOR
    fbcd1e9f8a43 ar5523: Fix null-ptr-deref with unexpected WDCMSG_TARGET_START reply
    1f1161c9bb47 selftests/bpf: Fix bpf_object leak in skb_ctx selftest
    57d3ec1106fc selftests/bpf: Destroy XDP link correctly
    7ffd2af8085c selftests/bpf: Fix memory leaks in btf_type_c_dump() helper
    9c46c1f1d2ac drm/lima: fix warning when CONFIG_DEBUG_SG=y & CONFIG_DMA_API_DEBUG=y
    5dc41e6caecc fs: dlm: filter user dlm messages for kernel locks
    41966cae91f1 Bluetooth: Fix removing adv when processing cmd complete
    57347363de0b drm/panel: Delete panel on mipi_dsi_attach() failure
    493c7d56ac22 Bluetooth: Fix memory leak of hci device
    d86db46b5cf5 Bluetooth: Fix debugfs entry leak in hci_register_dev()
    b03b18f0d1e9 leds: lp55xx: initialise output direction from dts
    bc8c07fcb492 ARM: dts: omap3-n900: Fix lp5523 for multi color
    55f8559ba8d3 mailbox: fix gce_num of mt8192 driver data
    38e9447399ff MIPS: compressed: Fix build with ZSTD compression
    925b35b54583 MIPS: boot/compressed/: add __ashldi3 to target for ZSTD compression
    c19b9b755482 of/fdt: Don't worry about non-memory region overlap for no-map
    dc4e2dbe6171 of: base: Fix phandle argument length mismatch error message
    91dcfc658d38 clk: bm1880: remove kfrees on static allocations
    8f5e866cbb97 ASoC: fsl_asrc: refine the check of available clock divider
    0cd1ef3f7b89 ASoC: imx-card: improve the sound quality for low rate
    edc07df0df20 ASoC: imx-card: Fix mclk calculation issue for akcodec
    6bedc3b3d130 ASoC: imx-card: Need special setting for ak4497 on i.MX8MQ
    35816546936d clk: qcom: gcc-sc7280: Mark gcc_cfg_noc_lpass_clk always enabled
    60037a56e08b RDMA/cxgb4: Set queue pair state when being queried
    32faa4c17a56 ALSA: hda/cs8409: Fix Jack detection after resume
    b624b5b2fe02 ALSA: hda/cs8409: Increase delay during jack detection
    65b517f4e0c6 ASoC: fsl_mqs: fix MODULE_ALIAS
    ef9893bb73e7 powerpc/xive: Add missing null check after calling kmalloc
    f1750bf32690 mips: bcm63xx: add support for clk_set_parent()
    b88fea46621d mips: lantiq: add support for clk_set_parent()
    a92e8b510fb4 arm64: tegra: Remove non existent Tegra194 reset
    78926da03360 ASoC: mediatek: mt8195: correct pcmif BE dai control flow
    1cf0a19e33ad misc: lattice-ecp3-config: Fix task hung when firmware load failed
    a17f93a1f0a5 ASoC: samsung: idma: Check of ioremap return value
    8b5d69613b12 phy: cadence: Sierra: Fix to get correct parent for mux clocks
    fca58a434425 powerpc/64s: Use EMIT_WARN_ENTRY for SRR debug warnings
    5bb2d955e81b powerpc/64s: Mask NIP before checking against SRR0
    38accfd85e41 ASoC: mediatek: Check for error clk pointer
    799b2c6cd7b6 phy: uniphier-usb3ss: fix unintended writing zeros to PHY register
    af8cab36bfb8 scsi: block: pm: Always set request queue runtime active in blk_post_runtime_resume()
    e421973fbe6e efi: apply memblock cap after memblock_add()
    77d37071811b of: fdt: Aggregate the processing of "linux,usable-memory-range"
    073d9a2237b1 ASoC: mediatek: mt8195: correct default value
    ef0af09d4113 iommu/iova: Fix race between FQ timeout and teardown
    56c3b7238594 ASoC: Intel: catpt: Test dmaengine_submit() result before moving on
    9bc6d3abccbf iommu/amd: Remove useless irq affinity notifier
    7e7e12092a66 iommu/amd: X2apic mode: mask/unmask interrupts on suspend/resume
    88c62a000be5 iommu/amd: X2apic mode: setup the INTX registers on mask/unmask
    0210cbc1efa3 iommu/amd: X2apic mode: re-enable after resume
    fd77922c94e4 iommu/amd: Restore GA log/tail pointer on host resume
    86bcde384570 dmaengine: pxa/mmp: stop referencing config->slave_id
    b1f659597761 mips: fix Kconfig reference to PHYS_ADDR_T_64BIT
    f345281019b2 mips: add SYS_HAS_CPU_MIPS64_R5 config for MIPS Release 5 support
    cfb6756aea7e clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after system enter shell
    e7962a878b38 of: unittest: 64 bit dma address test requires arch support
    d00393b2c354 of: unittest: fix warning on PowerPC frame size warning
    e91edc3b443c ASoC: rt5663: Handle device_property_read_u32_array error codes
    45f4e3c75877 RDMA/cma: Let cma_resolve_ib_dev() continue search even after empty entry
    8d76d0e4880d RDMA/core: Let ib_find_gid() continue search even after empty entry
    b77f233986b3 iommu/arm-smmu-qcom: Fix TTBR0 read
    2b78e026b455 powerpc/powermac: Add additional missing lockdep_register_key()
    db3e0d59f1c8 PCI/MSI: Fix pci_irq_vector()/pci_irq_get_affinity()
    1526f0ae4949 RDMA/qedr: Fix reporting max_{send/recv}_wr attrs
    f10876654e82 scsi: ufs: Fix race conditions related to driver data
    c9f350ade563 scsi: core: Fix scsi_device_max_queue_depth()
    3db62f98b49f iommu/io-pgtable-arm: Fix table descriptor paddr formatting
    004d84063fa2 iommu: Extend mutex lock scope in iommu_probe_device()
    37fb3dec665c openrisc: Add clone3 ABI wrapper
    7a9ad4aceb02 binder: avoid potential data leakage when copying txn
    f9848823d4e8 binder: fix handling of error during copy
    695ca3e0e24b char/mwave: Adjust io port register size
    356b4ed3ea70 misc: at25: Make driver OF independent again
    ee22462a419b ALSA: usb-audio: Drop superfluous '0' in Presonus Studio 1810c's ID
    6f90ccd96226 ALSA: oss: fix compile error when OSS_DEBUG is enabled
    cf9b8de20168 clocksource: Avoid accidental unstable marking of clocksources
    e3e6b74fad2d powerpc/32s: Fix shift-out-of-bounds in KASAN init
    2d17ab8874bc powerpc/modules: Don't WARN on first module allocation attempt
    fadcafa39592 powerpc/perf: Fix PMU callbacks to clear pending PMI before resetting an overflown PMC
    c15d1468f339 dt-bindings: thermal: Fix definition of cooling-maps contribution property
    9de9858d7bf0 ALSA: hda: Make proper use of timecounter
    a2e525d61801 RDMA/rtrs-clt: Fix the initial value of min_latency
    278df2c08602 ASoC: codecs: wcd938x: add SND_SOC_WCD938_SDW to codec list instead
    dc2400567312 ASoC: uniphier: drop selecting non-existing SND_SOC_UNIPHIER_AIO_DMA
    49a237c73a78 powerpc/prom_init: Fix improper check of prom_getprop()
    e459a89df303 clk: imx8mn: Fix imx8mn_clko1_sels
    6b0335e66b51 clk: renesas: rzg2l: propagate return value of_genpd_add_provider_simple()
    02beeed3928f clk: renesas: rzg2l: Check return value of pm_genpd_init()
    a0b4447677dd scsi: pm80xx: Update WARN_ON check in pm8001_mpi_build_cmd()
    4a1723367f5e RDMA/hns: Validate the pkey index
    8fe8161c50f4 RDMA/bnxt_re: Scan the whole bitmap when checking if "disabling RCFW with pending cmd-bit"
    ec085da3437b ALSA: hda: Fix potential deadlock at codec unbinding
    1b378f59bc86 ALSA: hda: Add missing rwsem around snd_ctl_remove() calls
    9b9f32c0c744 ALSA: PCM: Add missing rwsem around snd_ctl_remove() calls
    19eebde28fc6 ALSA: jack: Add missing rwsem around snd_ctl_remove() calls
    03c2fbca8973 ASoC: Intel: sof_sdw: fix jack detection on HP Spectre x360 convertible
    4846b55a2cd9 ext4: avoid trim error on fs with small groups
    0d3bbe7eb15e net: mcs7830: handle usb read errors properly
    86971970aeed bnxt_en: use firmware provided max timeout for messages
    e685851f0456 bnxt_en: move coredump functions into dedicated file
    a2037e7e4d02 bnxt_en: Refactor coredump functions
    57214d92a69f iwlwifi: mvm: Use div_s64 instead of do_div in iwl_mvm_ftm_rtt_smoothing()
    cf2ce93a7afa net: openvswitch: Fix ct_state nat flags for conns arriving from tc
    e7b33ff6439a net: openvswitch: Fix matching zone id for invalid conns arriving from tc
    a006c8482463 net/sched: flow_dissector: Fix matching on zone id for invalid conns
    3a4ecdfc0cf4 pcmcia: fix setting of kthread task states
    4a71828b2738 can: rcar_canfd: rcar_canfd_channel_probe(): make sure we free CAN network device
    61970e8b5d78 can: xilinx_can: xcan_probe(): check for error irq
    b8609cb64101 can: softing: softing_startstop(): fix set but not used variable warning
    deb81894f56e tpm_tis: Fix an error handling path in 'tpm_tis_core_init()'
    ea1fd8364c9f tpm: add request_locality before write TPM_INT_ENABLE
    8609525ee0ee can: mcp251xfd: add missing newline to printed strings
    f5b7e80e25c4 net: mscc: ocelot: fix incorrect balancing with down LAG ports
    5aff6ae24b39 regmap: Call regmap_debugfs_exit() prior to _init()
    af5dcf968ebe netrom: fix api breakage in nr_setsockopt()
    7b9986a0425a ax25: uninitialized variable in ax25_setsockopt()
    c48c7678739d octeontx2-af: Increment ptp refcount before use
    aac0b364904f spi: spi-meson-spifc: Add missing pm_runtime_disable() in meson_spifc_probe
    e1652f70e896 mptcp: fix a DSS option writing error
    72aba03ba836 mptcp: fix opt size when sending DSS + MP_FAIL
    c310df0eabe5 mptcp: fix per socket endpoint accounting
    abe4b2c214ea Bluetooth: L2CAP: uninitialized variables in l2cap_sock_setsockopt()
    b918c668d295 lib/mpi: Add the return value check of kcalloc()
    d73d81447c66 net/mlx5: Set command entry semaphore up once got index free
    266e6a36546f net/mlx5e: Sync VXLAN udp ports during uplink representor profile change
    fbe5f19824ba net/mlx5: Fix access to sf_dev_table on allocation failure
    7c1f9797e1b5 net/mlx5e: Fix matching on modified inner ip_ecn bits
    46a8a5a42984 Revert "net/mlx5e: Block offload of outer header csum for GRE tunnel"
    a8176f18ab5f Revert "net/mlx5e: Block offload of outer header csum for UDP tunnels"
    44008999815b net/mlx5e: Don't block routes with nexthop objects in SW
    360cbb1c3ec7 net/mlx5e: Fix wrong usage of fib_info_nh when routes with nexthop objects are used
    423bf4c1ea8a net/mlx5e: Fix page DMA map/unmap attributes
    6d818695065d x86, sched: Fix undefined reference to init_freq_invariance_cppc() build error
    f7e2f374799f serial: stm32: move tx dma terminate DMA to shutdown
    8209b0b395aa serial: liteuart: fix MODULE_ALIAS
    71db96193317 drivers/firmware: Add missing platform_device_put() in sysfb_create_simplefb
    1850a403bd0b debugfs: lockdown: Allow reading debugfs files that are not world readable
    0fc97f944245 HID: hid-uclogic-params: Invalid parameter check in uclogic_params_frame_init_v1_buttonpad
    fc8a47ed624b HID: hid-uclogic-params: Invalid parameter check in uclogic_params_huion_init
    964e6a78cb1d HID: hid-uclogic-params: Invalid parameter check in uclogic_params_get_str_desc
    621aade97324 HID: hid-uclogic-params: Invalid parameter check in uclogic_params_init
    78e8660e9d90 usb: gadget: u_audio: Subdevice 0 for capture ctls
    e3e610612234 usb: dwc2: gadget: initialize max_speed from params
    85a75d45f715 usb: dwc2: do not gate off the hardware if it does not support clock gating
    5157828d3975 usb: dwc3: qcom: Fix NULL vs IS_ERR checking in dwc3_qcom_probe
    db7d1a2e0609 net/smc: Reset conn->lgr when link group registration fails
    9186e6ba52af Bluetooth: hci_qca: Fix NULL vs IS_ERR_OR_NULL check in qca_serdev_probe
    ede559376794 Bluetooth: hci_bcm: Check for error irq
    3983254b43c2 fsl/fman: Check for null pointer after calling devm_ioremap
    c154574b84a5 staging: greybus: audio: Check null pointer
    4a308769df64 rocker: fix a sleeping in atomic bug
    5f54a0355802 ppp: ensure minimum packet size in ppp_write()
    ff53c861e97e net: fix SOF_TIMESTAMPING_BIND_PHC to work with multiple sockets
    29a0827b7491 netfilter: nft_set_pipapo: allocate pcpu scratch maps on clone
    500193142a20 netfilter: nft_payload: do not update layer 4 checksum when mangling fragments
    2db60bb56405 bpf: Fix SO_RCVBUF/SO_SNDBUF handling in _bpf_setsockopt().
    2fbd46695272 bpf: Fix verifier support for validation of async callbacks
    a65df848dbe0 bpf: Don't promote bogus looking registers after null check.
    073f7fb020b5 bpf, sockmap: Fix double bpf_prog_put on error case in map_link
    f26349213d97 bpf, sockmap: Fix return codes from tcp_bpf_recvmsg_parser()
    a1c2d9a513e5 netfilter: ipt_CLUSTERIP: fix refcount leak in clusterip_tg_check()
    21bdddc9648b net: dsa: fix incorrect function pointer check for MRP ring roles
    6dab20da69f9 net: ethernet: mtk_eth_soc: fix return values and refactor MDIO ops
    10f849d3e563 net/xfrm: IPsec tunnel mode fix inner_ipproto setting in sec_path
    4849eca4fc6f power: reset: mt6397: Check for null res pointer
    a3b31433147b pcmcia: rsrc_nonstatic: Fix a NULL pointer dereference in nonstatic_find_mem_region()
    7756cb45dbfe pcmcia: rsrc_nonstatic: Fix a NULL pointer dereference in __nonstatic_find_io_region()
    5d2fd6fff8e4 ACPI: scan: Create platform device for BCM4752 and LNV4752 ACPI nodes
    0a9b1fb2a778 serial: 8250_bcm7271: Propagate error codes from brcmuart_probe()
    deb0c71e0b26 io_uring: remove double poll on poll update
    8d3d1c365a89 x86/mce/inject: Avoid out-of-bounds write when setting flags
    4f1096828ece hwmon: (mr75203) fix wrong power-up delay value
    a96546df99ea regulator: qcom-labibb: OCP interrupts are not a failure while disabled
    78cafdf7d219 crypto: octeontx2 - prevent underflow in get_cores_bmap()
    910e5e8ac5de x86/boot/compressed: Move CLANG_FLAGS to beginning of KBUILD_CFLAGS
    5639dcfc6889 Bluetooth: hci_qca: Stop IBS timer during BT OFF
    03dae5e3362e software node: fix wrong node passed to find nargs_prop
    7a4e6e087813 backlight: qcom-wled: Respect enabled-strings in set_brightness
    7abe05ef6648 backlight: qcom-wled: Use cpu_to_le16 macro to perform conversion
    18a8dd081b81 backlight: qcom-wled: Override default length with qcom,enabled-strings
    37b61692f27b backlight: qcom-wled: Fix off-by-one maximum with default num_strings
    219c7d18be5a backlight: qcom-wled: Pass number of elements to read to read_u32_array
    f2bc76de2847 backlight: qcom-wled: Validate enabled string indices in DT
    77c5e99644af bpftool: Enable line buffering for stdout
    79d6a406df00 Bluetooth: L2CAP: Fix using wrong mode
    a3641f64a9d9 um: virtio_uml: Fix time-travel external time propagation
    4e71908ba7cb lib/logic_iomem: Fix operation on 32-bit
    6c72a5bc4df4 lib/logic_iomem: Fix 32-bit build
    b53c2307b18c um: virt-pci: Fix 32-bit compile
    c3d5f267696d um: rename set_signals() to um_set_signals()
    2a2f4f3aeafd um: fix ndelay/udelay defines
    3a45c4703491 selinux: fix potential memleak in selinux_add_opt()
    7be5c25e3155 block: fix error unwinding in device_add_disk
    6c1d0447bf0d mmc: meson-mx-sdio: add IRQ check
    0d840e7e2e6c mmc: meson-mx-sdhc: add IRQ check
    525c2a0763ee iwlwifi: mvm: set protected flag only for NDP ranging
    39cb224bf651 iwlwifi: mvm: perform 6GHz passive scan after suspend
    e895cfb085c6 iwlwifi: mvm: test roc running status bits before removing the sta
    48338cf56eaa iwlwifi: mvm: fix 32-bit build in FTM
    617339466fda rtw88: Disable PCIe ASPM while doing NAPI poll on 8821CE
    9b6b5f07702f rtw88: add quirk to disable pci caps on HP 250 G7 Notebook PC
    b14e931c386f wilc1000: fix double free error in probe()
    1a25b9c4ce2a mt76: mt7921: drop offload_flags overwritten
    e64a3ea17c19 ARM: dts: armada-38x: Add generic compatible to UART nodes
    4518f459c2c0 arm64: dts: marvell: cn9130: enable CP0 GPIO controllers
    864ac5f6bfbe arm64: dts: marvell: cn9130: add GPIO and SPI aliases
    6d88a6849617 usb: ftdi-elan: fix memory leak on device disconnect
    826501a17e98 ARM: 9159/1: decompressor: Avoid UNPREDICTABLE NOP encoding
    851b00b47832 xfrm: state and policy should fail if XFRMA_IF_ID 0
    eab7928527b5 xfrm: interface with if_id 0 should return error
    afd9ebd40bda media: hantro: Fix probe func error path
    3ca9f14fe279 drm/tegra: vic: Fix DMA API misuse
    0dbb2617c713 drm/tegra: gr2d: Explicitly control module reset
    3b90135b03f3 gpu: host1x: select CONFIG_DMA_SHARED_BUFFER
    c0dc02dcfe6b drm/bridge: ti-sn65dsi86: Set max register for regmap
    602662de5f82 drm/msm/dpu: fix safe status debugfs file
    be12d15a817b arm64: dts: qcom: ipq6018: Fix gpio-ranges property
    0c7ec53598a3 arm64: dts: qcom: c630: Fix soundcard setup
    c9fadfaf7b44 net: dsa: hellcreek: Add missing PTP via UDP rules
    ae914fe9310e net: dsa: hellcreek: Allow PTP P2P measurements on blocked ports
    c2be5908dd7c net: dsa: hellcreek: Add STP forwarding rule
    06baf7c33cf3 net: dsa: hellcreek: Fix insertion of static FDB entries
    307ac652e9fb ath11k: Fix a NULL pointer dereference in ath11k_mac_op_hw_scan()
    e935a4dd37e4 media: coda/imx-vdoa: Handle dma_set_coherent_mask error codes
    f0fc76d6cc80 media: msi001: fix possible null-ptr-deref in msi001_probe()
    48225919434f media: dw2102: Fix use after free
    f99f6ea71b55 perf/arm-cmn: Fix CPU hotplug unregistration
    70bf180fef83 ARM: dts: gemini: NAS4220-B: fis-index-block with 128 KiB sectors
    3d3fbbf05fe8 spi: Fix incorrect cs_setup delay handling
    5d0933a65bbd ath11k: Fix deleting uninitialized kernel timer during fragment cache flush
    8b2b88054961 crypto: hisilicon/qm - fix incorrect return value of hisi_qm_resume()
    5367147cb4f8 crypto: stm32 - Revert broken pm_runtime_resume_and_get changes
    2383a52088b6 crypto: stm32/cryp - fix bugs and crash in tests
    4e3043d247e6 crypto: stm32/cryp - fix lrw chaining mode
    0ba9b34ec6e5 crypto: stm32/cryp - fix double pm exit
    ef416e0614af crypto: stm32/cryp - check early input data
    4a62c2b32c41 crypto: stm32/cryp - fix xts and race condition in crypto_engine requests
    4671521de277 crypto: stm32/cryp - fix CTR counter carry
    f857f6cc5fbf selftests: harness: avoid false negatives if test has no ASSERTs
    c0dbfef7e63f selftests: clone3: clone3: add case CLONE3_ARGS_NO_TEST
    fa8db0f53fc1 x86/uaccess: Move variable into switch case statement
    097d4aeea0fc xfrm: fix a small bug in xfrm_sa_len()
    7a95f5d9b80f mwifiex: Fix possible ABBA deadlock
    4e6ad76d340f drm/msm/dsi: fix initialization in the bonded DSI case
    5c2eaa606feb wcn36xx: Fix max channels retrieval
    ef93cc02cafb rcu/exp: Mark current CPU as exp-QS in IPI loop second pass
    87472bebedbb drm/msm/dp: displayPort driver need algorithm rational
    e5d61c5b9c9c drm/msm/gpu: Don't allow zero fence_id
    89166801f80d drm/amd/display: Fix out of bounds access on DNC31 stream encoder regs
    6dcc6706dab1 drm/amd/display: Fix bug in debugfs crc_win_update entry
    d41946e82718 Bluetooth: btusb: Handle download_firmware failure cases
    006157d575d1 Bluetooth: MGMT: Use hci_dev_test_and_{set,clear}_flag
    749fc99daa13 Bluetooth: refactor set_exp_feature with a feature table
    d3f45f4ee17f ath10k: Fix the MTU size on QCA9377 SDIO
    378723bd01b2 sched/rt: Try to restart rt period timer when rt runtime exceeded
    9a664557effe wireless: iwlwifi: Fix a double free in iwl_txq_dyn_alloc_dma
    643af6932580 media: si2157: Fix "warm" tuner state detection
    d8904d2f6283 media: saa7146: mxb: Fix a NULL pointer dereference in mxb_attach()
    6f2d3249b98d media: dib8000: Fix a memleak in dib8000_init()
    1a51d9d60325 samples: bpf: Fix 'unknown warning group' build warning on Clang
    d891664e39ad samples: bpf: Fix xdp_sample_user.o linking with Clang
    c7d36c19cf30 samples/bpf: Clean up samples/bpf build failes
    7b4a30bbf8ca samples/bpf: Install libbpf headers when building
    c7f0c087d483 arm64: mte: DC {GVA,GZVA} shouldn't be used when DCZID_EL0.DZP == 1
    338c297e0885 arm64: clear_page() shouldn't use DC ZVA when DCZID_EL0.DZP == 1
    33fcd00e0aa0 bpf: Remove config check to enable bpf support for branch records
    832d478ccd06 bpf: Disallow BPF_LOG_KERNEL log level for bpf(BPF_BTF_LOAD)
    2571173d3e11 bpf: Adjust BTF log size limit.
    d3c4b3c801c0 sched/fair: Fix per-CPU kthread and wakee stacking for asym CPU capacity
    00c10519538f sched/fair: Fix detection of per-CPU kthreads waking a task
    48419bc90e43 bpf: Fix the test_task_vma selftest to support output shorter than 1 kB
    35a89caf518e Bluetooth: btmtksdio: fix resume failure
    0cad9c0c81be staging: rtl8192e: rtllib_module: fix error handle case in alloc_rtllib()
    90d96a14c558 staging: rtl8192e: return error code from rtllib_softmac_init()
    ff732e9bf68b floppy: Fix hang in watchdog when disk is ejected
    31d60f528238 mtd: core: provide unique name for nvmem device
    aee7ef0305b1 serial: amba-pl011: do not request memory region twice
    7b54c975798d tty: serial: uartlite: allow 64 bit address
    aca61190ec82 arm64: dts: ti: k3-j7200: Correct the d-cache-sets info
    1e2847f9d910 arm64: dts: ti: k3-j721e: Fix the L2 cache sets
    f1f0039956fb arm64: dts: ti: k3-j7200: Fix the L2 cache sets
    10d3b165877f arm64: dts: ti: k3-am642: Fix the L2 cache sets
    2efa4dd4600d crypto: caam - save caam memory to support crypto engine retry mechanism.
    db3c2121d191 libbpf: Clean gen_loader's attach kind.
    e833ef0b545e drm/radeon/radeon_kms: Fix a NULL pointer dereference in radeon_driver_open_kms()
    1e22b51876fa drm/amdgpu: Fix a NULL pointer dereference in amdgpu_connector_lcd_native_mode()
    4c12feec2dfd thermal/drivers/imx8mm: Enable ADC when enabling monitor
    68bf3b2f95ee ACPI: EC: Rework flushing of EC work while suspended to idle
    1fb3838db45c cgroup: Trace event cgroup id fields should be u64
    2d93f960dc7e drm/vmwgfx: Fail to initialize on broken configs
    a6f53731f3bb drm/vmwgfx: Remove the deprecated lower mem limit
    4aa40bf38f71 arm64: dts: qcom: msm8916: fix MMC controller aliases
    0c1cf578a882 powerpc: Avoid discarding flags in system_call_exception()
    f38d669aab33 netfilter: bridge: add support for pppoe filtering
    3f32b8ca8e26 igc: AF_XDP zero-copy metadata adjust breaks SKBs on XDP_PASS
    94821ce188c2 thermal/drivers/imx: Implement runtime PM support
    b588858c09a5 net: stmmac: Add platform level debug register dump feature
    0bc65fcb2b89 media: venus: core: Fix a resource leak in the error handling path of 'venus_probe()'
    4a8a8ff65293 media: venus: core: Fix a potential NULL pointer dereference in an error handling path
    e0d8c693a9d2 media: venus: correct low power frequency calculation for encoder
    64bfc5673415 media: coda: fix CODA960 JPEG encoder buffer overflow
    b85906f919ea media: hantro: Hook up RK3399 JPEG encoder output
    a49171d86d5e media: mtk-vcodec: call v4l2_m2m_ctx_release first when file is released
    893a766ac8fe media: si470x-i2c: fix possible memory leak in si470x_i2c_probe()
    b38f3570f909 media: imx-pxp: Initialize the spinlock prior to using it
    92cb150c3ec8 media: rcar-csi2: Correct the selection of hsfreqrange
    842a24066653 media: i2c: ov8865: Fix lockdep error
    9a11fe9e4467 media: i2c: Re-order runtime pm initialisation
    adf57b861e7f media: i2c: imx274: fix s_frame_interval runtime resume not requested
    300b973af40f libbpf: Silence uninitialized warning/error in btf_dump_dump_type_data
    162bc7bd73a1 bfq: Do not let waker requests skip proper accounting
    6b6e7150c18b mfd: atmel-flexcom: Use .resume_noirq
    8aa5209e54aa mfd: atmel-flexcom: Remove #ifdef CONFIG_PM_SLEEP
    1b1620dd224b tty: serial: atmel: Call dma_async_issue_pending()
    d249a70251ce tty: serial: atmel: Check return code of dmaengine_submit()
    32307d1b94ae arm64: dts: ti: k3-j721e: correct cache-sets info
    920e0e6f0e39 ath11k: Use host CE parameters for CE interrupts configuration
    72b905fb39f0 crypto: qat - fix undetected PFVF timeout in ACK loop
    348210fd7765 crypto: qat - make pfvf send message direction agnostic
    6c58dd967389 crypto: qat - remove unnecessary collision prevention step in PFVF
    ef89212783a2 libbpf: Fix using invalidated memory in bpf_linker
    9b616ae0bf98 libbpf: Fix glob_syms memory leak in bpf_linker
    f8ca67f3fc9e libbpf: Fix potential misaligned memory access in btf_ext__new()
    ae38d3144324 ARM: dts: stm32: fix dtbs_check warning on ili9341 dts binding on stm32f429 disco
    9f670292c080 cpufreq: qcom-hw: Fix probable nested interrupt handling
    929205dc3a0f cpufreq: qcom-cpufreq-hw: Update offline CPUs per-cpu thermal pressure
    5d39cd2059ba mtd: hyperbus: rpc-if: fix bug in rpcif_hb_remove
    869eee39b330 arm64: dts: qcom: sc7280: Fix incorrect clock name
    38a721f60926 crypto: qce - fix uaf on qce_skcipher_register_one
    561030c55120 crypto: qce - fix uaf on qce_ahash_register_one
    cf984b11cdec crypto: qce - fix uaf on qce_aead_register_one
    cb353b688464 crypto: atmel-aes - Reestablish the correct tfm context at dequeue
    4d6a558bde10 media: dmxdev: fix UAF when dvb_register_device() fails
    87a413e3d8c9 arm64: dts: renesas: cat875: Add rx/tx delays
    7bce20277784 drm/vboxvideo: fix a NULL vs IS_ERR() check
    56339a5546a7 drm/dp: Don't read back backlight mode in drm_edp_backlight_enable()
    25f2b49f65c6 fs: dlm: fix build with CONFIG_IPV6 disabled
    815570353f6b tee: fix put order in teedev_close_context()
    d46f937233b1 spi: hisi-kunpeng: Fix the debugfs directory name incorrect
    50dab89c25dd ath11k: reset RSN/WPA present state for open BSS
    4ca3ffff349f ath11k: clear the keys properly via DISABLE_KEY
    dff606fc5068 ath11k: Fix ETSI regd with weather radar overlap
    2de0e6a71ceb Bluetooth: stop proccessing malicious adv data
    63811bf4f572 memory: renesas-rpc-if: Return error in case devm_ioremap_resource() fails
    dba0aea5727c fs: dlm: don't call kernel_getpeername() in error_report()
    ba43bd2be16b arm64: dts: meson-gxbb-wetek: fix missing GPIO binding
    0a7dd2ec89b2 arm64: dts: meson-gxbb-wetek: fix HDMI in early boot
    74ad053d7338 arm64: dts: amlogic: Fix SPI NOR flash node name for ODROID N2/N2+
    3cebbcbf9198 arm64: dts: amlogic: meson-g12: Fix GPU operating point table node name
    82515555873e media: aspeed: Update signal status immediately to ensure sane hw state
    85d5345bd861 media: em28xx: fix memory leak in em28xx_init_dev
    c4f0f1608727 media: aspeed: fix mode-detect always time out at 2nd run
    7fd4b0e18903 media: atomisp: fix uninitialized bug in gmin_get_pmic_id_and_addr()
    37d7ebf0179b media: atomisp: fix enum formats logic
    a030bcd96ef4 media: atomisp: add NULL check for asd obtained from atomisp_video_pipe
    124fd314c5fe media: atomisp: fix ifdefs in sh_css.c
    0224641992e1 media: atomisp: fix inverted error check for ia_css_mipi_is_source_port_valid()
    4de485f6d5fe media: atomisp: do not use err var when checking port validity for ISP2400
    b7033740e367 media: atomisp: fix inverted logic in buffers_needed()
    bb8ac1ec5a82 media: atomisp: fix punit_ddr_dvfs_enable() argument for mrfld_power up case
    6c3547e103e4 media: atomisp: add missing media_device_cleanup() in atomisp_unregister_entities()
    26e8cd84d7d2 media: videobuf2: Fix the size printk format
    6b3a83a450dd mtd: hyperbus: rpc-if: Check return value of rpcif_sw_init()
    77d19bad301f bpftool: Fix memory leak in prog_dump()
    9f3cbc3ba5ad ath11k: Send PPDU_STATS_CFG with proper pdev mask to firmware
    26b9d4ac42ab wcn36xx: fix RX BD rate mapping for 5GHz legacy rates
    3913db56e471 wcn36xx: populate band before determining rate on RX
    d97aa008ebc0 wcn36xx: Put DXE block into reset before freeing memory
    514c1df9dfa9 wcn36xx: Release DMA channel descriptor allocations
    8da7a0e26c4a wcn36xx: Fix DMA channel enable/disable cycle
    a3ec2b9456eb libbpf: Free up resources used by inner map definition
    620a2ee55059 drm/vc4: hdmi: Enable the scrambler on reconnection
    23d2c4eb76d6 wcn36xx: Indicate beacon not connection loss on MISSED_BEACON_IND
    a33fc07affe5 wcn36xx: ensure pairing of init_scan/finish_scan and start_scan/end_scan
    8c3830446ccc drm/vc4: crtc: Make sure the HDMI controller is powered when disabling
    2bba39feaa3e drm/vc4: hdmi: Rework the pre_crtc_configure error handling
    a26aa0f3982f drm/vc4: hdmi: Make sure the controller is powered up during bind
    e3e8f46f36e0 drm/vc4: hdmi: Make sure the controller is powered in detect
    b9b1fbe61ff1 drm/vc4: hdmi: Move the HSM clock enable to runtime_pm
    2d717d822675 drm/vc4: hdmi: Set a default HSM rate
    49b570f5d2e4 clk: bcm-2835: Remove rounding up the dividers
    2ff7b32f6b3e clk: bcm-2835: Pick the closest clock rate
    d2e7a4d20f7c Bluetooth: cmtp: fix possible panic when cmtp_init_sockets() fails
    1f2270e161f9 Bluetooth: virtio_bt: fix memory leak in virtbt_rx_handle()
    f28d819f17d3 drm/rockchip: dsi: Reconfigure hardware on resume()
    506bae94333b drm/rockchip: dsi: Disable PLL clock on bind error
    4f005cef1d5a drm/rockchip: dsi: Hold pm-runtime across bind/unbind
    dd0ed218c0bf drm/rockchip: dsi: Fix unbalanced clock on probe error
    1a943d8ad9c0 drm/panel: innolux-p079zca: Delete panel on attach() failure
    92082e300373 drm/panel: kingdisplay-kd097d04: Delete panel on attach() failure
    52e1bf49e3e2 drm: fix null-ptr-deref in drm_dev_init_release()
    11182d953e64 drm/bridge: display-connector: fix an uninitialized pointer in probe()
    6c1ad4aeeab4 Bluetooth: L2CAP: Fix not initializing sk_peer_pid
    0da09030aae4 drm/ttm: Put BO in its memory manager's lru list
    19f76690fe68 shmem: fix a race between shmem_unused_huge_shrink and shmem_evict_inode
    6292bd6f654e ath11k: add string type to search board data in board-2.bin for WCN6855
    e363ab335751 mm/page_alloc.c: do not warn allocation failure on zone DMA if no managed pages
    bcf64fb327c8 dma/pool: create dma atomic pool only if dma zone has managed pages
    240e8d331a9b mm_zone: add function to check if managed dma zone exists
    55bd26fd08da PCI: Add function 1 DMA alias quirk for Marvell 88SE9125 SATA controller
    484654a6f6ed dma_fence_array: Fix PENDING_ERROR leak in dma_fence_array_signaled()
    03e964ad35ac virtio/virtio_mem: handle a possible NULL as a memcpy parameter
    b9a524d6ec03 drm/tegra: Add back arm_iommu_detach_device()
    3ff8942bb8ab gpu: host1x: Add back arm_iommu_detach_device()
    03c8e18f3c14 iommu/io-pgtable-arm-v7s: Add error handle for page table allocation failure
    bed344b54daa ARM: dts: at91: update alternate function of signal PD20
    c77a4529ca38 arm64: errata: Fix exec handling in erratum 1418040 workaround
    181c78d6c12d cxl/pmem: Fix reference counting for delayed work
    bc95dbf5502c bus: mhi: core: Fix race while handling SYS_ERR at power up
    c8aa11642478 bus: mhi: core: Fix reading wake_capable channel configuration
    2075d9f4fdc5 bus: mhi: pci_generic: Graceful shutdown on freeze
    acb5a8bee27b lkdtm: Fix content of section containing lkdtm_rodata_do_nothing()
    a18aeac73c0f iio: trigger: Fix a scheduling whilst atomic issue seen on tsc2046
    5c397420c0e2 iio: adc: ti-adc081c: Partial revert of removal of ACPI IDs
    702c89045230 mei: hbm: fix client dma reply status
    697c41375739 can: softing_cs: softingcs_probe(): fix memleak on registration failure
    61eb4ad9ae46 media: cec-pin: fix interrupt en/disable handling
    1baebfdf19b0 media: stk1160: fix control-message timeouts
    b208a386572a media: pvrusb2: fix control-message timeouts
    8b8dbc22b9f7 media: redrat3: fix control-message timeouts
    821e5abd2198 media: dib0700: fix undefined behavior in tuner shutdown
    4e56a231210f media: s2255: fix control-message timeouts
    15955a24fa8e media: cpia2: fix control-message timeouts
    198e0c619f46 media: em28xx: fix control-message timeouts
    2516fab22e65 media: mceusb: fix control-message timeouts
    a16e2eff80fa media: flexcop-usb: fix control-message timeouts
    1bde26972360 media: v4l2-ioctl.c: readbuffers depends on V4L2_CAP_READWRITE
    9aaf99b4a8b0 media: ov8865: Disable only enabled regulators on error path
    a0d6e64b3413 media: cec: fix a deadlock situation
    8202aa60f077 ksmbd: add reserved room in ipc request/response
    d7004f0cc4a7 ksmbd: limits exceeding the maximum allowable outstanding requests
    0aadd32bebc9 ksmbd: move credit charge deduction under processing request
    40fc68aeeb24 ksmbd: add support for smb2 max credit parameter
    0a8347db70a6 ksmbd: fix guest connection failure with nautilus
    bbba4a0b8efa ksmbd: uninitialized variable in create_socket()
    893dfb14cac1 net: phy: marvell: add Marvell specific PHY loopback
    e428c89717ff rtc: cmos: take rtc_lock while reading from CMOS
    9899cea59121 tools/nolibc: fix incorrect truncation of exit code
    72191715afee tools/nolibc: i386: fix initial stack alignment
    9dc4c4e19084 crypto: x86/aesni - don't require alignment of data
    132cb7f64697 tools/nolibc: x86-64: Fix startup code bug
    850bc1262a2b x86/gpu: Reserve stolen memory for first integrated Intel GPU
    07c1c8e3202e riscv: mm: fix wrong phys_ram_base value for RV64
    a2389e4f54e5 riscv: use hart id instead of cpu id on machine_kexec
    b9f3e769ecf5 riscv: Don't use va_pa_offset on kdump
    9550c6f0b2a6 riscv: try to allocate crashkern region from 32bit addressible memory
    1402857bf15f RISC-V: Use common riscv_cpuid_to_hartid_mask() for both SMP=y and SMP=n
    6250ecf5ba42 riscv: Get rid of MAXPHYSMEM configs
    cee8830146cf mtd: rawnand: ingenic: JZ4740 needs 'oob_first' read page function
    abf8c8712b6d mtd: rawnand: Export nand_read_page_hwecc_oob_first()
    26aa92a7f931 mtd: rawnand: davinci: Rewrite function description
    3f5eb2d89032 mtd: rawnand: davinci: Avoid duplicated page read
    eebc910e09d4 mtd: rawnand: davinci: Don't calculate ECC when reading page
    5794c37d2a98 mtd: Fixed breaking list in __mtd_del_partition.
    bb969ffe1d0e mtd: rawnand: gpmi: Remove explicit default gpmi clock setting for i.MX6
    0fe08bf9909f mtd: rawnand: gpmi: Add ERR007117 protection for nfc_apply_timings
    f4dfc52a1eab nfc: llcp: fix NULL error pointer dereference on sendmsg() after failed bind()
    c9cd02cb7a26 f2fs: avoid EINVAL by SBI_NEED_FSCK when pinning a file
    dd88a805d2d0 f2fs: fix to do sanity check in is_alive()
    0ddbdc0b7f0c f2fs: fix to do sanity check on inode type during garbage collection
    7f6e3cbbd600 ALSA: core: Fix SSID quirk lookup for subvendor=0
    8877331177de HID: wacom: Avoid using stale array indicies to read contact count
    c965ad71a05d HID: wacom: Ignore the confidence flag when a touch is removed
    f9f16383d596 HID: wacom: Reset expected and received contact counts at the same time
    6a4ec6f2429e HID: uhid: Fix worker destroying device without any protection
    47b5c189d6a4 HID: Ignore battery for Elan touchscreen on HP Envy X360 15t-dr100
    91b7cbea9efc KVM: VMX: switch blocked_vcpu_on_cpu_lock to raw spinlock
    a88ebc49c633 KVM: x86/mmu: Fix write-protection of PTs mapped by the TDP MMU

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 161b418293..e686770248 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3500b1673d3c5cdab46d497c5d492e81cc0a6a13"
-SRCREV_meta ?= "cf716c58bea8a4c0daba70740803b5074766f2fd"
+SRCREV_machine ?= "8cee5455f1da9a04453db35f13497067fcc1da86"
+SRCREV_meta ?= "287299fba9a8435f470eaf0fa218041b9a716a71"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.16"
+LINUX_VERSION ?= "5.15.19"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index c2ba73fc81..9905bc1925 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.16"
+LINUX_VERSION ?= "5.15.19"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "67b4c868eafbd63c437d0e79523c3bdc5f3aa834"
-SRCREV_machine ?= "f46816a75d738acbe4b1211153badf2f8e412780"
-SRCREV_meta ?= "cf716c58bea8a4c0daba70740803b5074766f2fd"
+SRCREV_machine:qemuarm ?= "35fb6c4d167cb1231aef234a06a66f577aa1391b"
+SRCREV_machine ?= "e5cd0b75a56725559a57e91a1e3139ed6618e181"
+SRCREV_meta ?= "287299fba9a8435f470eaf0fa218041b9a716a71"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 8356e6d16c..6b877ae7cf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "453d02534c0a02adf3c45d10c3654ff4b8fef05c"
-SRCREV_machine:qemuarm64 ?= "f46816a75d738acbe4b1211153badf2f8e412780"
-SRCREV_machine:qemumips ?= "df874c475e84e375b21c1f71ad7c3ab5cab22218"
-SRCREV_machine:qemuppc ?= "f46816a75d738acbe4b1211153badf2f8e412780"
-SRCREV_machine:qemuriscv64 ?= "f46816a75d738acbe4b1211153badf2f8e412780"
-SRCREV_machine:qemuriscv32 ?= "f46816a75d738acbe4b1211153badf2f8e412780"
-SRCREV_machine:qemux86 ?= "f46816a75d738acbe4b1211153badf2f8e412780"
-SRCREV_machine:qemux86-64 ?= "f46816a75d738acbe4b1211153badf2f8e412780"
-SRCREV_machine:qemumips64 ?= "6f4bc07807d1e17fde099baadf60752fca51fee8"
-SRCREV_machine ?= "f46816a75d738acbe4b1211153badf2f8e412780"
-SRCREV_meta ?= "cf716c58bea8a4c0daba70740803b5074766f2fd"
+SRCREV_machine:qemuarm ?= "4f846cfafc6eaeb7c0bdfc59aef1fb22163564b6"
+SRCREV_machine:qemuarm64 ?= "e5cd0b75a56725559a57e91a1e3139ed6618e181"
+SRCREV_machine:qemumips ?= "cfe801db227a60eda2090ffeafb472c7d1bd2b32"
+SRCREV_machine:qemuppc ?= "e5cd0b75a56725559a57e91a1e3139ed6618e181"
+SRCREV_machine:qemuriscv64 ?= "e5cd0b75a56725559a57e91a1e3139ed6618e181"
+SRCREV_machine:qemuriscv32 ?= "e5cd0b75a56725559a57e91a1e3139ed6618e181"
+SRCREV_machine:qemux86 ?= "e5cd0b75a56725559a57e91a1e3139ed6618e181"
+SRCREV_machine:qemux86-64 ?= "e5cd0b75a56725559a57e91a1e3139ed6618e181"
+SRCREV_machine:qemumips64 ?= "eca2bcfe39044e9d4611a98493f7e8135cb5fdcf"
+SRCREV_machine ?= "e5cd0b75a56725559a57e91a1e3139ed6618e181"
+SRCREV_meta ?= "287299fba9a8435f470eaf0fa218041b9a716a71"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "cf716c58bea8a4c0daba70740803b5074766f2fd"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "63dcc388662c3562de94d69bfa771ae4cd29b79f"
+SRCREV_machine:class-devupstream ?= "e8a2995c6076721d496d9458e13142caa7ba8753"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.16"
+LINUX_VERSION ?= "5.15.19"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


