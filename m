Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57172C4332F
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 18:00:04 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web12.11351.1641924003478845623
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 10:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UQwyV3Ae;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id c19so126421qtx.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 10:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nrsenssaN2hrl+mwXLZLQCzISomYPLl5meSBfKD3CK8=;
        b=UQwyV3AeHmRiDiDk0jtvftZBBI+ghjfj8Nb6CjF1MA0firo8H8AevtMWwX5L5u6B7a
         rIOYdTc35/PuX6dYp2L9ca92Sdmvi6zR6GvRLuM39uziV8qgttMESwM5y31EMIRtw6GF
         mvLnzvNzpIjLlCZL62hue2RNh8tyYTt3cJVp5gA/lOvuuVoeNU9ept+6EOEdEADZf/f7
         eGOwF0Nl2FqZSjXpiGabJXssK/MgptYWBZD6ZUQ8Ask3ULk0TDvXyHt3qHxrfvK7hw+T
         HdKYusAiqtiwgK3iSmA1B18YYUtLv8k02L15Yonvbajxgp4pGeZNODZNEGjSPlPQKoHO
         WSzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nrsenssaN2hrl+mwXLZLQCzISomYPLl5meSBfKD3CK8=;
        b=jGr3WUwMPdl4IJjpWllctr31qCLBtYB8+dRoNmGnJBOusQsZRK+xGyH6MnLAAygSf6
         xTXaClthfnZ59SSAjNn2iZySnGfT05PgTlq9NyRZSJzyWbhYiKISWApctLMXX+/Dd0ML
         mIfxe8fROzVI3oi0tbHz83mcCZrI1fpz/xuJHUj37YrlguJhpFooyPWY8M86QKXHwqU4
         jfUOgpW9SK/vnA4O5WF/umakjrhAPZz7YnH6iu8Z3jq0sIdtxIzBw9vbjx/BA8WepwFI
         JN2rSNR6nsysHDBh6+4I46p4BsiybOYsMfvzSsGBQtQobAKe4OXSfG2UGb0ogfvCe1SD
         3N0A==
X-Gm-Message-State: AOAM531xSRyXVC2R64enmtNtZUeu7/f3agZArwWPDRbqXRs48coUPWxT
	XHPlgxTY2rSvPWCFKxWUqrMuQBI9Twh5IQ==
X-Google-Smtp-Source: 
 ABdhPJy7GI80uJxPSmUm6oozSHVj1lDkCdk91fetHMTuLNgPEHypDykz89k673aBgDZ/BdyiU9kMFA==
X-Received: by 2002:ac8:7f13:: with SMTP id f19mr4749472qtk.670.1641924002211;
        Tue, 11 Jan 2022 10:00:02 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 x7sm7360749qkp.128.2022.01.11.10.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 10:00:01 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] linux-yocto/5.15: update to v5.15.12
Date: Tue, 11 Jan 2022 12:59:50 -0500
Message-Id: 
 <dd45ad858d939c0a12e777443b3d4f50f0030e5e.1641923693.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1641923693.git.bruce.ashfield@gmail.com>
References: <cover.1641923693.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 18:00:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160426

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

25960cafa06e Linux 5.15.12
53ccdc73eeda phonet/pep: refuse to enable an unbound pipe
3cb5ae77799e tun: avoid double free in tun_free_netdev
03d00f7f1815 hamradio: improve the incomplete fix to avoid NPD
cb6c99aedd2c hamradio: defer ax25 kfree after unregister_netdev
a8e4a64cdc97 ax25: NPD bug when detaching AX25 device
f547b0f8f3ce r8152: sync ocp base
5cc8813c4966 hwmon: (lm90) Do not report 'busy' status bit as alarm
722fc45be049 hwmom: (lm90) Fix citical alarm status for MAX6680/MAX6681
fb563baa3eb8 pinctrl: mediatek: fix global-out-of-bounds issue
aa50406f36a1 ASoC: rt5682: fix the wrong jack type detected
46b3fe1eb2b7 ASoC: SOF: Intel: pci-tgl: add ADL-N support
d0fa8c252956 ASoC: SOF: Intel: pci-tgl: add new ADL-P variant
d9ad0ae8bfa0 ASoC: tas2770: Fix setting of high sample rates
cc71a723f3d8 Input: goodix - add id->model mapping for the "9111" model
efaa327b4146 Input: elants_i2c - do not check Remark ID on eKTH3900/eKTH5312
70750056620b Input: iqs626a - prohibit inlining of channel parsing functions
2f06c8293d27 kfence: fix memory leak when cat kfence objects
ca38833c915e arm64: dts: lx2160a: fix scl-gpios property name
0ae519ecbbdb KVM: VMX: Fix stale docs for kvm-intel.emulate_invalid_guest_state
35f9ff45ee5c netfs: fix parameter of cleanup()
a8a9d753edd7 f2fs: fix to do sanity check on last xattr entry in __f2fs_setxattr()
91e94e42f6fc tee: optee: Fix incorrect page free bug
330c6117a82c mm/damon/dbgfs: protect targets destructions with kdamond_lock
c691e7575eff mm/hwpoison: clear MF_COUNT_INCREASED before retrying get_any_page()
7a77e22fde63 mm, hwpoison: fix condition in free hugetlb page path
6b2cdcc8f555 mm: mempolicy: fix THP allocations escaping mempolicy restrictions
c1d1ec4db5f7 mac80211: fix locking in ieee80211_start_ap error path
a2c144d17623 ksmbd: disable SMB2_GLOBAL_CAP_ENCRYPTION for SMB 3.1.1
f43ba86a8211 ksmbd: fix uninitialized symbol 'pntsd_size'
89d0ffb4bb96 ksmbd: fix error code in ndr_read_int32()
c99513dffd36 ARM: 9169/1: entry: fix Thumb2 bug in iWMMXt exception handling
c7814569b387 mmc: mmci: stm32: clear DLYB_CR after sending tuning command
c0db06fd0993 mmc: core: Disable card detect during shutdown
9d93c863d04f mmc: meson-mx-sdhc: Set MANUAL_STOP for multi-block SDIO commands
46e2fc260543 mmc: sdhci-tegra: Fix switch to HS400ES mode
e5dd3e61baed gpio: dln2: Fix interrupts when replugging the device
c1ce3c410038 pinctrl: stm32: consider the GPIO offset to expose all the GPIO lines
b9d7c7a5bf6e KVM: VMX: Wake vCPU when delivering posted IRQ even if vCPU == this vCPU
e4e4e7cb2298 KVM: VMX: Always clear vmx->fail on emulation_required
543bfbcb5cf5 KVM: nVMX: Synthesize TRIPLE_FAULT for L2 if emulation is required
d884eefd75cc KVM: x86/mmu: Don't advance iterator after restart due to yielding
5dea76f5da65 KVM: x86: Always set kvm_run->if_flag
9ca1324755f1 platform/x86: intel_pmc_core: fix memleak on registration failure
a42c41be8324 platform/x86: amd-pmc: only use callbacks for suspend
9ede07c4af14 x86/pkey: Fix undefined behaviour with PKRU_WD_BIT
492eb7afe858 tee: handle lookup of shm with reference count 0
c576d7a197b7 parisc: Fix mask used to select futex spinlock
7c6567979c82 parisc: Correct completer in lws start
5aae769a0ef7 ipmi: fix initialization when workqueue allocation fails
77a7311ca167 ipmi: ssif: initialize ssif_info->client early
7232a5941d3f ipmi: bail out if init_srcu_struct fails
7f7f61042f70 Input: atmel_mxt_ts - fix double free in mxt_read_info_block
6084a6c1ca7f ASoC: tegra: Restore headphones jack name on Nyan Big
f7fe9d303445 ASoC: tegra: Add DAPM switches for headphones and mic jack
8e9b8b8a8ff2 ASoC: meson: aiu: Move AIU_I2S_MISC hold setting to aiu-fifo-i2s
88b4fbd6348a ALSA: hda/realtek: Fix quirk for Clevo NJ51CU
417e6ee4df64 ALSA: hda/realtek: fix mute/micmute LEDs for a HP ProBook
0896c97e6657 ALSA: hda/realtek: Add new alc285-hp-amp-init model
3934aa1259d9 ALSA: hda/realtek: Amp init fixup for HP ZBook 15 G6
2e9cd9ff997f ALSA: hda/hdmi: Disable silent stream on GLK
b398fcbe4de1 ALSA: rawmidi - fix the uninitalized user_pversion
3fd58303b05e ALSA: drivers: opl3: Fix incorrect use of vp->state
fdaa60d900a7 ALSA: jack: Check the return value of kstrdup()
28b03ec2c0c5 x86/boot: Move EFI range reservation after cmdline parsing
f95fcac5d66a Revert "x86/boot: Pull up cmdline preparation and early param parsing"
70e7705b0230 kernel/crash_core: suppress unknown crashkernel parameter warning
4a34b51ea99b platform/x86/intel: Remove X86_PLATFORM_DRIVERS_INTEL
50f27a29d758 compiler.h: Fix annotation macro misplacement with Clang
0cd3ef801004 uapi: Fix undefined __always_inline on non-glibc systems
8a351388b295 ARM: 9160/1: NOMMU: Reload __secondary_data after PROCINFO_INITFUNC
afda22fea766 hwmon: (lm90) Drop critical attribute support for MAX6654
9d21029e7199 hwmon: (lm90) Add basic support for TI TMP461
983084e19aeb hwmon: (lm90) Introduce flag indicating extended temperature support
d105f30bea91 hwmon: (lm90) Prevent integer overflow/underflow in hysteresis calculations
4b8f0e940972 hwmon: (lm90) Fix usage of CONFIG2 register in detect function
79c6d4fa1be1 pinctrl: bcm2835: Change init order for gpio hogs
dfd5b60b5342 Input: elantech - fix stack out of bound access in elantech_change_report_id()
b480d5f42d45 net: stmmac: dwmac-visconti: Fix value of ETHER_CLK_SEL_FREQ_SEL_2P5M
f80527200d01 r8152: fix the force speed doesn't work for RTL8156
b8871c6734d8 net: bridge: fix ioctl old_deviceless bridge argument
1c66ea39c6c4 net: bridge: Use array_size() helper in copy_to_user()
be2473e5f377 net: stmmac: ptp: fix potentially overflowing expression
d2269ae48598 veth: ensure skb entering GRO are not cloned.
20fb0dc35bf9 io_uring: zero iocb->ki_pos for stream file types
5cf03976e1f0 asix: fix wrong return value in asix_check_host_enable()
d259f621c859 asix: fix uninit-value in asix_mdio_read()
d00726b7061c sfc: falcon: Check null pointer of rx_queue->page_ring
20c3efcca612 sfc: Check null pointer of rx_queue->page_ring
8307c1ecd366 net: ks8851: Check for error irq
98a5242e82f2 drivers: net: smc911x: Check for error irq
643c89669e31 fjes: Check for error irq
a038c504f6f5 bonding: fix ad_actor_system option setting to default
1f0d95fb3755 gpio: virtio: remove timeout
6b3f7e4b10f3 ipmi: Fix UAF when uninstall ipmi_si and ipmi_msghandler module
33385aded71e igb: fix deadlock caused by taking RTNL in RPM resume path
b99c71f90978 net: skip virtio_net_hdr_set_proto if protocol already set
8ba353f553da net: accept UFOv6 packages in virtio_net_hdr_to_skb
0249a4b8a554 inet: fully convert sk->sk_rx_dst to RCU rules
98a8e5c20027 ipv6: move inet6_sk(sk)->rx_dst_cookie to sk->sk_rx_dst_cookie
8e096cffc6d3 tcp: move inet->rx_dst_ifindex to sk->sk_rx_dst_ifindex
e69eacf74e15 qlcnic: potential dereference null pointer of rx_queue->page_ring
5c553a0cd126 net: marvell: prestera: fix incorrect structure access
da3feb8a9baf net: marvell: prestera: fix incorrect return of port_find
ad6d20da2cfb ice: xsk: return xsk buffers back to pool when cleaning the ring
c1c36df0b0a5 ice: Use xdp_buf instead of rx_buf for xsk zero-copy
ef73e3b650b7 ARM: dts: imx6qdl-wandboard: Fix Ethernet support
406b7337d6bc netfilter: fix regression in looped (broad|multi)cast's MAC handling
9d558e5f0d6f netfilter: nf_tables: fix use-after-free in nft_set_catchall_destroy()
2eb1cac16bc7 RDMA/hns: Replace kfree() with kvfree()
aefcc25f3a0c IB/qib: Fix memory leak in qib_user_sdma_queue_pkts()
c41b98070392 RDMA/hns: Fix RNR retransmission issue for HIP08
9b0ed41b25e2 ASoC: meson: aiu: fifo: Add missing dma_coerce_mask_and_coherent()
71d07ebc5000 drm/mediatek: hdmi: Perform NULL pointer check for mtk_hdmi_conf
11bf802877bf ucounts: Fix rlimit max values check
3121b5bff903 spi: change clk_disable_unprepare to clk_unprepare
512dbc1a09ac bus: sunxi-rsb: Fix shutdown
115a291395df arm64: dts: allwinner: orangepi-zero-plus: fix PHY mode
f4321ac030b5 PM: sleep: Fix error handling in dpm_prepare()
eabc0aab98e5 NFSD: Fix READDIR buffer overflow
b1712a691bbb HID: potential dereference of null pointer
3c431e19ad70 HID: holtek: fix mouse probing
a65ac9d23276 selftests: KVM: Fix non-x86 compiling
49c29e13fcd6 ext4: check for inconsistent extents between index and leaf block
f71ab21b1a28 ext4: check for out-of-order index extents in ext4_valid_extent_entries()
02f825cf0255 ext4: prevent partial update of the extent blocks
fedeb1b2c8e6 net: usb: lan78xx: add Allied Telesis AT29M2-AF
1d1c25233a29 arm64: vdso32: require CROSS_COMPILE_COMPAT for gcc+bfd
fb6ad5cb3b67 Linux 5.15.11
bd926d189210 xen/netback: don't queue unlimited number of packages
88449dbe6203 xen/netback: fix rx queue stall detection
153d1ea32722 xen/console: harden hvc_xen against event channel storms
a29c8b5226ed xen/netfront: harden netfront against event channel storms
caf9b51829a5 xen/blkfront: harden blkfront against event channel storms
ffbd663ebac9 Revert "xsk: Do not sleep in poll() when need_wakeup set"
581b09795199 selftests/damon: test debugfs file reads/writes with huge count
a272f990cb26 bus: ti-sysc: Fix variable set but not used warning for reinit_modules
11053a021937 io-wq: drop wqe lock before creating new worker
a96ac0688acb rcu: Mark accesses to rcu_state.n_force_qs
4b4e5bbf9386 io-wq: check for wq exit after adding new worker task_work
024f9c7cd3d8 io-wq: remove spurious bit clear on task_work addition
dfc3fff63793 scsi: scsi_debug: Sanity check block descriptor length in resp_mode_select()
308514764593 scsi: scsi_debug: Fix type in min_t to avoid stack OOB
47d11d35203b scsi: scsi_debug: Don't call kcalloc() if size arg is zero
d2ccdd4e4efa ovl: fix warning in ovl_create_real()
4658f2a9b336 fuse: annotate lock in fuse_reverse_inval_entry()
8c6fdf62bfe1 media: mxl111sf: change mutex_init() location
403716741c6c USB: core: Make do_proc_control() and do_proc_bulk() killable
303644fe7e0c bpf: Fix extable address check.
eea5a58d86a4 bpf, x64: Factor out emission of REX byte in more cases
7e83a6577d5c mptcp: add missing documented NL params
e8d38fcd0a1c xsk: Do not sleep in poll() when need_wakeup set
6b2ee1002c6b ARM: dts: imx6ull-pinfunc: Fix CSI_DATA07__ESAI_TX0 pad name
0e8ffdf3b86d can: m_can: pci: use custom bit timings for Elkhart Lake
274f4b342ba9 can: m_can: make custom bittiming fields const
5b4641e9c06c Revert "can: m_can: remove support for custom bit timing"
e3a01c14e806 drm/amd/pm: fix reading SMU FW version from amdgpu_firmware_info on YC
a386ae526866 drm/amdgpu: don't override default ECO_BITs setting
f2e600f6572b drm/amdgpu: correct register access for RLC_JUMP_TABLE_RESTORE
9b9f2567145b powerpc/module_64: Fix livepatching for RO modules
78f27c43eb16 libata: if T_LENGTH is zero, dma direction should be DMA_NONE
f67c85a557c8 perf inject: Fix segfault due to perf_data__fd() without open
a7c0e6aa63c8 perf inject: Fix segfault due to close without open
4a74df7707b5 riscv: dts: unmatched: Add gpio card detect to mmc-spi-slot
7fe286afbd90 riscv: dts: unleashed: Add gpio card detect to mmc-spi-slot
5e14b8b2680a locking/rtmutex: Fix incorrect condition in rtmutex_spin_on_owner()
c63433a09d6a cifs: sanitize multiple delimiters in prepath
c5664d508674 timekeeping: Really make sure wall_to_monotonic isn't positive
89362ec97ac0 serial: 8250_fintek: Fix garbled text for console
3a1a4eb57417 iocost: Fix divide-by-zero on donation from low hweight cgroup
d153ff65a977 zonefs: add MODULE_ALIAS_FS
210ab4e3c032 btrfs: fix missing blkdev_put() call in btrfs_scan_one_device()
8848395975bd btrfs: check WRITE_ERR when trying to read an extent buffer
bbdaa7a48f46 btrfs: fix double free of anon_dev after failure to create subvolume
493ff661d434 btrfs: fix memory leak in __add_inode_ref()
d1bac0d97bc9 selinux: fix sleeping function called from invalid context
252f245ff4a1 USB: serial: option: add Telit FN990 compositions
db83bbfe1bec USB: serial: cp210x: fix CP2105 GPIO registration
5154bc1c16c9 usb: gadget: u_ether: fix race in setting MAC address in setup phase
428ad19f98bb usb: typec: tcpm: fix tcpm unregister port but leave a pending timer
ffe642edb4e2 usb: cdnsp: Fix lack of spin_lock_irqsave/spin_lock_restore
368bfabceb11 usb: cdnsp: Fix issue in cdnsp_log_ep trace event
ec83d6e57a62 usb: cdnsp: Fix incorrect calling of cdnsp_died function
ed89521e2dcb usb: cdnsp: Fix incorrect status for control request
5cb5c3e1b184 usb: xhci: Extend support for runtime power management for AMD's Yellow carp.
67cbcd3fb8e6 usb: xhci-mtk: fix list_del warning when enable list debug
d8888cdabedf PCI/MSI: Mask MSI-X vectors only on success
4df1af29930b PCI/MSI: Clear PCI_MSIX_FLAGS_MASKALL on error
3901c7784ad7 usb: dwc2: fix STM ID/VBUS detection startup delay in dwc2_driver_probe
af00fb784286 USB: NO_LPM quirk Lenovo USB-C to Ethernet Adapher(RTL8153-04)
e7a8a261bab0 tty: n_hdlc: make n_hdlc_tty_wakeup() asynchronous
5fc3cfa62b85 KVM: x86: Drop guest CPUID check for host initiated writes to MSR_IA32_PERF_CAPABILITIES
9f8b3f238530 Revert "usb: early: convert to readl_poll_timeout_atomic()"
abd3a33b3f2b USB: gadget: bRequestType is a bitfield, not a enum
d0ac17b9bac5 powerpc/85xx: Fix oops when CONFIG_FSL_PMC=n
c8e8e6f4108e bpf, selftests: Fix racing issue in btf_skc_cls_ingress test
9f55f2913ebd bpf: Fix extable fixup offset.
ecd8ad3af6d5 arm64: kexec: Fix missing error code 'ret' warning in load_other_segments()
5473fe0c484a afs: Fix mmap
44a6c846bc3a sit: do not call ipip6_dev_free() from sit_init_net()
eb4687c74429 net: systemport: Add global locking for descriptor lifecycle
e99fe4137b6d net/smc: Prevent smc_release() from long blocking
ff3d58592be4 net: Fix double 0x prefix print in SKB dump
987e1a4682e5 dsa: mv88e6xxx: fix debug print for SPEED_UNFORCED
9a77c02d1d21 sfc_ef100: potential dereference of null pointer
0b4a5d1e15ce net: stmmac: dwmac-rk: fix oob read in rk_gmac_setup
feb116a0ecc5 net/packet: rx_owner_map depends on pg_vec
27358aa81a7d netdevsim: Zero-initialize memory for new map's value in function nsim_bpf_map_alloc
288b0c511c11 ixgbe: set X550 MDIO speed before talking to PHY
2f2ebb7d4324 ixgbe: Document how to enable NBASE-T support
33c1707a8ea4 igc: Fix typo in i225 LTR functions
944b8be08131 igbvf: fix double free in `igbvf_probe`
81ffe207ae1b igb: Fix removal of unicast MAC filters of VFs
12dc89ccaf20 soc/tegra: fuse: Fix bitwise vs. logical OR warning
23311b92755f mptcp: fix deadlock in __mptcp_push_pending()
c26ac0ea3a91 mptcp: clear 'kern' flag from fallback sockets
3de0c86d42f8 mptcp: remove tcp ulp setsockopt support
257b3bb16634 drm/amd/pm: fix a potential gpu_metrics_table memory leak
cc98ef784152 drm/amd/display: Set exit_optimized_pwr_state for DCN31
a0dacf4bc3c5 ice: Don't put stale timestamps in the skb
89f9c880141e ice: Use div64_u64 instead of div_u64 in adjfine
68014890e438 rds: memory leak in __rds_conn_create()
d92781bf78db flow_offload: return EOPNOTSUPP for the unsupported mpls action type
97cb5c82aa1d net: stmmac: fix tc flower deletion for VLAN priority Rx steering
1571ff2d199e mac80211: fix lookup when adding AddBA extension element
0783716ba2bd cfg80211: Acquire wiphy mutex on regulatory work
e0984a4d414b mac80211: agg-tx: don't schedule_and_wake_txq() under sta->lock
95053f4477c9 drm/i915/display: Fix an unsigned subtraction which can never be negative.
fb5099ad02dc drm/ast: potential dereference of null pointer
1456a0004cc5 mptcp: never allow the PM to close a listener subflow
1752132eba08 selftest/net/forwarding: declare NETIFS p9 p10
7c23a5d90733 net: dsa: mv88e6xxx: Unforce speed & duplex in mac_link_down()
4985d3b53c4d selftests/net: toeplitz: fix udp option
491c1253441e net/sched: sch_ets: don't remove idle classes from the round-robin list
215b5046b11e drm: simpledrm: fix wrong unit with pixel clock
00b072a55ffc dmaengine: st_fdma: fix MODULE_ALIAS
ee3701c4d975 dmaengine: idxd: fix missed completion on abort path
088e4d7dba27 selftests: Fix IPv6 address bind tests
28c73d856b71 selftests: Fix raw socket bind tests with VRF
013ed7533966 selftests: Add duplicate config only for MD5 VRF tests
769f38809709 net: hns3: fix race condition in debugfs
4f4a353f6fe0 net: hns3: fix use-after-free bug in hclgevf_send_mbx_msg
a4377575d2e9 selftests: icmp_redirect: pass xfail=0 to log_test()
4cd2d21bbe58 netdevsim: don't overwrite read only ethtool parms
e5d28205bf1d inet_diag: fix kernel-infoleak for UDP sockets
f6deae2e2d83 sch_cake: do not call cake_destroy() from cake_init()
cc851898751d s390/kexec_file: fix error handling when applying relocations
b0eb9ac9ddc3 selftests: net: Correct ping6 expected rc from 2 to 1
9ff66e9ceefc Revert "drm/fb-helper: improve DRM fbdev emulation device names"
03b5d9d618a6 vdpa: Consider device id larger than 31
091b84437a82 virtio/vsock: fix the transport to work with VMADDR_CID_ANY
149a4d12c44b virtio: always enter drivers/virtio/
fac85fe13547 iwlwifi: mvm: don't crash on invalid rate w/o STA
f295986e5b6d soc: imx: Register SoC device only on i.MX boards
ad4adbbf666e clk: Don't parent clks until the parent is fully registered
d058c136fe3d arm64: dts: imx8mq: remove interconnect property from lcdif
f580a4315062 ARM: socfpga: dts: fix qspi node compatible
e7506c76b7ef ceph: initialize pathlen variable in reconnect_caps_cb
24a19e6d6518 ceph: fix duplicate increment of opened_inodes metric
832f3655c613 tee: amdtee: fix an IS_ERR() vs NULL bug
42d08e97b196 mac80211: track only QoS data frames for admission control
b08767936841 dmaengine: idxd: fix calling wq quiesce inside spinlock
05d2cc973cf5 dmaengine: idxd: add halt interrupt support
f2aebdaa3d3c arm64: dts: rockchip: fix poweroff on helios64
d4218b2803de arm64: dts: rockchip: fix audio-supply for Rock Pi 4
77eb455febc5 arm64: dts: rockchip: fix rk3399-leez-p710 vcc3v3-lan supply
e2daa0c9e898 arm64: dts: rockchip: fix rk3308-roc-cc vcc-sd supply
c2ff001288dd arm64: dts: rockchip: remove mmc-hs400-enhanced-strobe from rk3399-khadas-edge
8e72fcf9aa9a pinctrl: amd: Fix wakeups when IRQ is shared with SCI
78ae328fb170 drm/i915/hdmi: Turn DP++ TMDS output buffers back on in encoder->shutdown()
8f50c26fdf65 drm/i915/hdmi: convert intel_hdmi_to_dev to intel_hdmi_to_i915
4999509a9184 scsi: ufs: core: Retry START_STOP on UNIT_ATTENTION
af9b9c8bfeee btrfs: remove stale comment about the btrfs_show_devname
a6e7e218a4d6 btrfs: update latest_dev when we create a sprout device
e342c2558016 btrfs: use latest_dev in btrfs_show_devname
5c460192c2fa btrfs: convert latest_bdev type to btrfs_device and rename
a5f4d17daf2e audit: improve robustness of the audit queue handling
607beb420b3f dm btree remove: fix use after free in rebalance_children()
09cdb8aa5904 ceph: fix up non-directory creation in SGID directories
2c7a616145aa arm64: dts: ten64: remove redundant interrupt declaration for gpio-keys
ab2ba2dd711f recordmcount.pl: look for jgnop instruction as well as bcrl on s390
2eeff00926e5 s390/entry: fix duplicate tracking of irq nesting level
b08b3bfcc720 vdpa: check that offsets are within bounds
0c51663c77d2 virtio_ring: Fix querying of maximum DMA mapping size for virtio device
ebbbc5fea3f6 vduse: check that offset is within bounds in get_config()
e6c67560b434 vduse: fix memory corruption in vduse_dev_ioctl()
2746d3face65 bpf, selftests: Update test case for atomic cmpxchg on r0 with pointer
f87a6c160ecc bpf: Fix kernel address leakage in atomic cmpxchg's r0 aux reg
d0d68083f273 bpf, selftests: Add test case trying to taint map value pointer
dbda060d50ab bpf: Make 32->64 bounds propagation slightly more robust
f77d7a35d491 bpf: Fix signed bounds propagation after mov32
efcad725feb4 bpf, selftests: Add test case for atomic fetch on spilled pointer
423628125a48 bpf: Fix kernel address leakage in atomic fetch
976389cbb16c firmware: arm_scpi: Fix string overflow in SCPI genpd driver
c62b16f98688 mac80211: validate extended element ID is present
e606db721de5 mac80211: send ADDBA requests using the tid/queue of the aggregation session
815ee27cfbf8 mac80211: mark TX-during-stop for TX in in_reconfig
a7aed5c87d74 mac80211: fix regression in SSN handling of addba tx
237ee0f24bc4 mac80211: fix rate control for retransmitted frames
6bd55427e266 KVM: X86: Fix tlb flush for tdp in kvm_invalidate_pcid()
bf4367c02c8c x86/kvm: remove unused ack_notifier callbacks
54bf0b0d3536 KVM: downgrade two BUG_ONs to WARN_ON_ONCE
4b65555a501e KVM: selftests: Make sure kvm_create_max_vcpus test won't hit RLIMIT_NOFILE
6890c75c14b3 KVM: VMX: clear vmx_x86_ops.sync_pir_to_irr if APICv is disabled
efccff32defc reset: tegra-bpmp: Revert Handle errors in BPMP response

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 2c83ffabf4..ea50600972 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "689069f890d6c3c472b45b5073f80723bd188160"
-SRCREV_meta ?= "eeb5d0c9dd5e2928835c633644426ee357fbce12"
+SRCREV_machine ?= "11651ef1c948677add527afd54c9f960a33884c8"
+SRCREV_meta ?= "c5d4d9353dad22aa75f6192cd4ff15cf14c69a68"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.10"
+LINUX_VERSION ?= "5.15.12"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 8915df774a..bf7e39b630 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.10"
+LINUX_VERSION ?= "5.15.12"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "b43bd6284bd9ab63deded777807b4f9c1026ff02"
-SRCREV_machine ?= "81abcbb980529f94d9630358ecffbabd6a21e149"
-SRCREV_meta ?= "eeb5d0c9dd5e2928835c633644426ee357fbce12"
+SRCREV_machine:qemuarm ?= "0f7af34df7639ad8c513e6698d5f1a6081b55f77"
+SRCREV_machine ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
+SRCREV_meta ?= "c5d4d9353dad22aa75f6192cd4ff15cf14c69a68"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index e87e446664..cdb7be779a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6ef10661ed1b3f14bd424f5a533f431c3121ae1f"
-SRCREV_machine:qemuarm64 ?= "81abcbb980529f94d9630358ecffbabd6a21e149"
-SRCREV_machine:qemumips ?= "c2d607d67a1c0231b63bbbbd7eb490342fd48ade"
-SRCREV_machine:qemuppc ?= "81abcbb980529f94d9630358ecffbabd6a21e149"
-SRCREV_machine:qemuriscv64 ?= "81abcbb980529f94d9630358ecffbabd6a21e149"
-SRCREV_machine:qemuriscv32 ?= "81abcbb980529f94d9630358ecffbabd6a21e149"
-SRCREV_machine:qemux86 ?= "81abcbb980529f94d9630358ecffbabd6a21e149"
-SRCREV_machine:qemux86-64 ?= "81abcbb980529f94d9630358ecffbabd6a21e149"
-SRCREV_machine:qemumips64 ?= "31c1532611489b9fdc807d9cec8ff3b727d5f9fe"
-SRCREV_machine ?= "81abcbb980529f94d9630358ecffbabd6a21e149"
-SRCREV_meta ?= "eeb5d0c9dd5e2928835c633644426ee357fbce12"
+SRCREV_machine:qemuarm ?= "1ed914708fb430667f06724b65aaa872d939bcc4"
+SRCREV_machine:qemuarm64 ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
+SRCREV_machine:qemumips ?= "e2e8b2e5f6f7fda78b8d7641810c0d04be150c0a"
+SRCREV_machine:qemuppc ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
+SRCREV_machine:qemuriscv64 ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
+SRCREV_machine:qemuriscv32 ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
+SRCREV_machine:qemux86 ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
+SRCREV_machine:qemux86-64 ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
+SRCREV_machine:qemumips64 ?= "723cf54aff5756af97663c4a8a7bf0754d0d940e"
+SRCREV_machine ?= "721ba67b41253d17c7bb71aadae3e7a44bf4d22c"
+SRCREV_meta ?= "c5d4d9353dad22aa75f6192cd4ff15cf14c69a68"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "eeb5d0c9dd5e2928835c633644426ee357fbce12"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "57dcae4a8b93271c4e370920ea0dbb94a0215d30"
+SRCREV_machine:class-devupstream ?= "25960cafa06e6fcd830e6c792e6a7de68c1e25ed"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.10"
+LINUX_VERSION ?= "5.15.12"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


