Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E40C7C433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:17:50 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com
 [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.6486.1640013469867919165
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SyRav0mY;
 spf=pass (domain: gmail.com, ip: 209.85.222.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id d2so9583762qki.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+GG4xoNLqZtxHmb/9NxEqnnkKBUKmZ4dujtBBvTLlOU=;
        b=SyRav0mYD8U4l0sZC/8cTfeppD90tSseCeXJSAD6Wkdxga9X/IXO2fThWaanopnHHK
         iFBAPT330x69vrSr2uEfpMsgWrdsAmpMuVzd2H9VaJb3gkBvWvkRXx0zMdkZaTZzROKg
         YQV8IgUgEB+0Wa59udrAnX8h9s13WSVzZ1UE3+Teo0/EG9w7RXG0L2ZO0cL4Ri2Uxuje
         fV009TZy2l5dBN7JtLNC8kJmipcxg0J0FpoHVtMK/L8jtR6JVGAARMb+1fg6PFLE48/G
         L3L3v9l+fAEQUOAB1C5AQR7jw0Ua/VMLtr0nvCLSkvJF3floJ1aY0ZowE5jzsIFvZSaj
         MvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+GG4xoNLqZtxHmb/9NxEqnnkKBUKmZ4dujtBBvTLlOU=;
        b=wMQGu2LLzstpxneVlH4M5b5VloUSS33J6blA4c+uoR5+BZCGTrgGIzZeTw+AxX08wB
         uHiKfLt/TPoi7wYa7TBu67gDRJvgi8F6RR4PDWvedXguP5nBgKORHkQyCRM2KTi1pyiS
         15sQWY6CnonDiEm3q+zj75q7kIppfFqKxRfmjg/WgyLZENp4L6bceHSS5nHc5WtUSY3e
         WtKrY+ASfsCLC8B4g+B064o6wXOZ4tPx1WCUsfY+tJN+t34rwszvIKW4CKoI9F+C54JC
         ppAwwMA1X4rNEPmXxExPHvmXLaWNtgiabfv3nuWRQsTi81Jj3j1Ok65IDSVF8nA+Ibh+
         7vDA==
X-Gm-Message-State: AOAM530uFkwD39hdTXeB12FyOyYZ+8TvVdNrIIjljaYlG9wEWiAVx2gP
	GCVWR94zzkPGprpVu5V4M26E3HI9CGQ=
X-Google-Smtp-Source: 
 ABdhPJzOVvU78h/UahX1II5B6dGX0GI/ZmYoL0iBzfGNceL7WZfN3Dl/dhICD4ATuyC0NHemWfhf/g==
X-Received: by 2002:a05:620a:1006:: with SMTP id
 z6mr5120213qkj.50.1640013468579;
        Mon, 20 Dec 2021 07:17:48 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 i7sm11338634qkn.0.2021.12.20.07.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 07:17:48 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto/5.10: update to v5.10.84
Date: Mon, 20 Dec 2021 10:17:41 -0500
Message-Id: 
 <0e597ab1636abd4da3f078f3b3da87a03c1f4bfc.1640013267.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1640013267.git.bruce.ashfield@gmail.com>
References: <cover.1640013267.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 15:17:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159884

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

a0582e24d371 Linux 5.10.84
e6edaf267793 ipmi: msghandler: Make symbol 'remove_work_wq' static
a8d18fb4d11b net/tls: Fix authentication failure in CCM mode
dbe73dace94c parisc: Mark cr16 CPU clocksource unstable on all SMP machines
01300d21505d iwlwifi: mvm: retry init flow if failed
a5d0a72b805e serial: 8250: Fix RTS modem control while in rs485 mode
f9802d7049f5 serial: 8250_pci: rewrite pericom_do_set_divisor()
50b06889c86f serial: 8250_pci: Fix ACCES entries in pci_serial_quirks array
e1722acf4f0d serial: core: fix transmit-buffer reset and memleak
bda142bbeb31 serial: tegra: Change lower tolerance baud rate limit for tegra20 and tegra30
901f7e0aa4a6 serial: pl011: Add ACPI SBSA UART match id
946ded2287a0 tty: serial: msm_serial: Deactivate RX DMA for polling support
67d08450a08d x86/64/mm: Map all kernel memory into trampoline_pgd
b3a519b5a580 x86/tsc: Disable clocksource watchdog for TSC on qualified platorms
1ed4a8fd363c x86/tsc: Add a timer to make sure TSC_adjust is always checked
a92f044a9fcb usb: typec: tcpm: Wait in SNK_DEBOUNCED until disconnect
6d8c191bf464 USB: NO_LPM quirk Lenovo Powered USB-C Travel Hub
90c915051c3d xhci: Fix commad ring abort, write all 64 bits to CRCR register.
1235485c633e vgacon: Propagate console boot parameters before calling `vc_resize'
92b9113c6df0 parisc: Fix "make install" on newer debian releases
c27a548d3f29 parisc: Fix KBUILD_IMAGE for self-extracting kernel
92f309c838fc x86/entry: Add a fence for kernel entry SWAPGS in paranoid_entry()
4bbbc9c4f313 x86/pv: Switch SWAPGS to ALTERNATIVE
4d42b7bcf09d sched/uclamp: Fix rq->uclamp_max not set on first enqueue
2015ffa3a4c2 x86/xen: Add xenpv_restore_regs_and_return_to_usermode()
8b9279cad291 x86/entry: Use the correct fence macro after swapgs in kernel CR3
c8e341191849 x86/sev: Fix SEV-ES INS/OUTS instructions for word, dword, and qword
64ca109bf875 KVM: VMX: Set failure code in prepare_vmcs02()
60ce9a754060 KVM: x86/pmu: Fix reserved bits for AMD PerfEvtSeln register
cfebd5a277ad atlantic: Remove warn trace message.
95f6fae9a0db atlantic: Fix statistics logic for production hardware
695d9c6bc671 Remove Half duplex mode speed capabilities.
0c67e7b98fab atlantic: Add missing DIDs and fix 115c.
ca350298bccb atlantic: Fix to display FW bundle version instead of FW mac version.
93a4f3f4fdb5 atlatnic: enable Nbase-t speeds with base-t
44812111a3b1 atlantic: Increase delay for fw transactions
13f290d5aa4a drm/msm: Do hw_init() before capturing GPU state
d646856a600e drm/msm/a6xx: Allocate enough space for GMU registers
a792b3d56438 net/smc: Keep smc_close_final rc during active close
e226180acc49 net/rds: correct socket tunable error in rds_tcp_tune()
77731fede297 net/smc: fix wrong list_del in smc_lgr_cleanup_early
9a40a1e0eb50 ipv4: convert fib_num_tclassid_users to atomic_t
fa973bf5fd0f net: annotate data-races on txq->xmit_lock_owner
e26dab79e16b dpaa2-eth: destroy workqueue at the end of remove function
dde240695d97 net: marvell: mvpp2: Fix the computation of shared CPUs
3260b8d12057 net: usb: lan78xx: lan78xx_phy_init(): use PHY_POLL instead of "0" if no IRQ is available
acef1c2b1596 ALSA: intel-dsp-config: add quirk for CML devices based on ES8336 codec
60f0b9c42cb8 rxrpc: Fix rxrpc_local leak in rxrpc_lookup_peer()
35b40f724c4e rxrpc: Fix rxrpc_peer leak in rxrpc_look_up_bundle()
4afb32090a15 ASoC: tegra: Fix kcontrol put callback in AHUB
fe4eb5297ac3 ASoC: tegra: Fix kcontrol put callback in DSPK
256aa15aac6d ASoC: tegra: Fix kcontrol put callback in DMIC
1cf1f9a1f3ed ASoC: tegra: Fix kcontrol put callback in I2S
0ee53a1d8889 ASoC: tegra: Fix kcontrol put callback in ADMAIF
e6fb4c3fd35b ASoC: tegra: Fix wrong value type in DSPK
0265ef0dff5e ASoC: tegra: Fix wrong value type in DMIC
e66e75fb2278 ASoC: tegra: Fix wrong value type in I2S
6b54c0d845e5 ASoC: tegra: Fix wrong value type in ADMAIF
932b338f4e5c mt76: mt7915: fix NULL pointer dereference in mt7915_get_phy_mode
a0335cda6d92 selftests: net: Correct case name
f1d43efa59f1 net/mlx4_en: Fix an use-after-free bug in mlx4_en_try_alloc_resources()
59d2dc771006 arm64: ftrace: add missing BTIs
ef55f0f8af2b siphash: use _unaligned version by default
fd52e1f8c093 net: mpls: Fix notifications when deleting a device
15fa12c119f8 net: qlogic: qlcnic: Fix a NULL pointer dereference in qlcnic_83xx_add_rings()
c6f340a331fb tcp: fix page frag corruption on page fault
aa6c393a3c3f natsemi: xtensa: fix section mismatch warnings
289ee320b5ed i2c: cbus-gpio: set atomic transfer callback
58d5c53f2589 i2c: stm32f7: stop dma transfer in case of NACK
c22124491752 i2c: stm32f7: recover the bus on access timeout
8de6ea757c88 i2c: stm32f7: flush TX FIFO upon transfer errors
1c75779dd90c wireguard: ratelimiter: use kvcalloc() instead of kvzalloc()
cb2d7c1992cb wireguard: receive: drop handshakes if queue lock is contended
8a29a50dbdb1 wireguard: receive: use ring buffer for incoming handshakes
e3be118327a1 wireguard: device: reset peer src endpoint when netns exits
f7b6672fab70 wireguard: selftests: rename DEBUG_PI_LIST to DEBUG_PLIST
0584bf51c315 wireguard: selftests: actually test for routing loops
3d1dc3c67773 wireguard: allowedips: add missing __rcu annotation to satisfy sparse
4caf965f6cbe wireguard: selftests: increase default dmesg log size
3d73021f8d74 tracing/histograms: String compares should not care about signed values
d4af6d974951 KVM: X86: Use vcpu->arch.walk_mmu for kvm_mmu_invlpg()
c71b5f37b5ff KVM: arm64: Avoid setting the upper 32 bits of TCR_EL2 and CPTR_EL2 to 1
5f33887a3682 KVM: x86: Use a stable condition around all VT-d PI paths
7722e8850522 KVM: nVMX: Flush current VPID (L1 vs. L2) for KVM_REQ_TLB_FLUSH_GUEST
6a44f200f1f1 KVM: Disallow user memslot with size that exceeds "unsigned long"
775191dd4c1b drm/amd/display: Allow DSC on supported MST branch devices
209d35ee34e2 ipv6: fix memory leak in fib6_rule_suppress
16c242b09106 sata_fsl: fix warning in remove_proc_entry when rmmod sata_fsl
4a46b2f5dce0 sata_fsl: fix UAF in sata_fsl_port_stop when rmmod sata_fsl
4baba6ba56eb fget: check that the fd still exists after getting a ref to it
80bfed369be9 s390/pci: move pseudo-MMIO to prevent MIO overlap
92283c2728a9 cpufreq: Fix get_cpu_device() failure in add_cpu_dev_symlink()
f717f29e8468 ipmi: Move remove_work to dedicated workqueue
de4f5eb02cfe rt2x00: do not mark device gone on EPROTO errors during start
c200721f8eda kprobes: Limit max data_size of the kretprobe instances
2a74c13dfe83 vrf: Reset IPCB/IP6CB when processing outbound pkts in vrf dev xmit
136cabf15779 ACPI: Add stubs for wakeup handler functions
cc443ac5bb31 net/smc: Avoid warning of possible recursive locking
ff061b5bda73 perf report: Fix memory leaks around perf_tip()
a4c17ebdd624 perf hist: Fix memory leak of a perf_hpp_fmt
d9b72274f32a perf inject: Fix ARM SPE handling
2c15d2a6ba27 net: ethernet: dec: tulip: de4x5: fix possible array overflows in type3_infoblock()
f059fa40f0fc net: tulip: de4x5: fix the problem that the array 'lp->phy[8]' may be out of bound
4d5968ea06fb ipv6: check return value of ipv6_skip_exthdr
22519eff7df2 ethernet: hisilicon: hns: hns_dsaf_misc: fix a possible array overflow in hns_dsaf_ge_srst_by_port()
9a32d3c08d8e ata: ahci: Add Green Sardine vendor ID as board_ahci_mobile
c746945fb6bc drm/amd/amdgpu: fix potential memleak
74aafe99efb6 drm/amd/amdkfd: Fix kernel panic when reset failed and been triggered again
f0c9f49b0caf scsi: iscsi: Unblock session then wake up error handler
bc8c423a286a thermal: core: Reset previous low and high trip during thermal zone init
8e4d2ac4348a btrfs: check-integrity: fix a warning on write caching disabled disk
039572290531 s390/setup: avoid using memblock_enforce_memory_limit
fd1e70ef65ee platform/x86: thinkpad_acpi: Fix WWAN device disabled issue after S3 deep
226b21ad01ae platform/x86: thinkpad_acpi: Add support for dual fan control
3fc88660ede6 net: return correct error code
2c514d25003a atlantic: Fix OOB read and write in hw_atl_utils_fw_rpc_wait
ff6eeb627898 net/smc: Transfer remaining wait queue entries during fallback
e1a165599aad mac80211: do not access the IV when it was stripped
c386d7aa59f5 drm/sun4i: fix unmet dependency on RESET_CONTROLLER for PHY_SUN6I_MIPI_DPHY
57e36973fadb powerpc/pseries/ddw: Revert "Extend upper limit for huge DMA window for persistent memory"
7b2b7e03e8ea gfs2: Fix length of holes reported at end-of-file
664cceab6f70 gfs2: release iopen glock early in evict
bcce010f9230 ovl: fix deadlock in splice write
dca4f9a58196 ovl: simplify file splice
7774dd934a65 can: j1939: j1939_tp_cmd_recv(): check the dst address of TP.CM_BAM
60ae63ef194a NFSv42: Fix pagecache invalidation after COPY/CLONE
a324ad794566 Linux 5.10.83
45b42cd05391 drm/amdgpu/gfx9: switch to golden tsc registers for renoir+
98b02755d544 net: stmmac: platform: fix build warning when with !CONFIG_PM_SLEEP
a15261d2a121 shm: extend forced shm destroy to support objects from several IPC nses
aa20e966d8a1 s390/mm: validate VMA in PGSTE manipulation functions
a94e4a7b77ed tty: hvc: replace BUG_ON() with negative return value
1c5f722a8fdf xen/netfront: don't trust the backend response data blindly
334b0f278761 xen/netfront: disentangle tx_skb_freelist
e17ee047eea7 xen/netfront: don't read data from request on the ring page
f5e493709800 xen/netfront: read response from backend only once
1ffb20f0527d xen/blkfront: don't trust the backend response data blindly
8e147855fcf2 xen/blkfront: don't take local copy of a request from the ring page
273f04d5d135 xen/blkfront: read response from backend only once
b98284aa3fc5 xen: sync include/xen/interface/io/ring.h with Xen's newest version
406f2d5fe368 tracing: Check pid filtering when creating events
4fd0ad08ee33 vhost/vsock: fix incorrect used length reported to the guest
fbc0514e1a34 iommu/amd: Clarify AMD IOMMUv2 initialization messages
5655b8bccb8a smb3: do not error on fsync when readonly
c380062d0850 ceph: properly handle statfs on multifs setups
22423c966e02 f2fs: set SBI_NEED_FSCK flag when inconsistent node block found
e6ee7abd6bfe sched/scs: Reset task stack state in bringup_cpu()
71e38a0c7cf8 tcp: correctly handle increased zerocopy args struct size
72f2117e450b net: mscc: ocelot: correctly report the timestamping RX filters in ethtool
73115a2b38dd net: mscc: ocelot: don't downgrade timestamping RX filters in SIOCSHWTSTAMP
62343dadbb96 net: hns3: fix VF RSS failed problem after PF enable multi-TCs
215167df4512 net/smc: Don't call clcsock shutdown twice when smc shutdown
6e800ee43218 net: vlan: fix underflow for the real_dev refcnt
ae2659d2c670 net/sched: sch_ets: don't peek at classes beyond 'nbands'
e3509feb46fa tls: fix replacing proto_ops
22156242b104 tls: splice_read: fix record type check
3b6c71c097da MIPS: use 3-level pgtable for 64KB page size on MIPS_VA_BITS_48
a6a5d853f1e6 MIPS: loongson64: fix FTLB configuration
5e823dbee23c igb: fix netpoll exit with traffic
f2a58ff3e3ad nvmet: use IOCB_NOWAIT only if the filesystem supports it
12ceb52f2cc4 net/smc: Fix loop in smc_listen
c94cbd262b6a net/smc: Fix NULL pointer dereferencing in smc_vlan_by_tcpsk()
3d4937c6a328 net: phylink: Force retrigger in case of latched link-fail indicator
50162ff3c80f net: phylink: Force link down and retrigger resolve on interface change
95ba8f0d57ce lan743x: fix deadlock in lan743x_phy_link_status_change()
c5e4316d9c02 tcp_cubic: fix spurious Hystart ACK train detections for not-cwnd-limited flows
318762309609 drm/amd/display: Set plane update flags for all planes in reset
f634c755a0ee PM: hibernate: use correct mode for swsusp_close()
440bd9faad29 net/ncsi : Add payload to be 32-bit aligned to fix dropped packets
ac88cb3c44b6 nvmet-tcp: fix incomplete data digest send
8889ff80fde3 net: marvell: mvpp2: increase MTU limit when XDP enabled
90d0736876c5 mlxsw: spectrum: Protect driver from buggy firmware
33d89128a960 mlxsw: Verify the accessed index doesn't exceed the array length
29e1b5734795 net/smc: Ensure the active closing peer first closes clcsock
77d9c2efa870 erofs: fix deadlock when shrink erofs slab
9f540c7ffb1e scsi: scsi_debug: Zero clear zones at reset write pointer
725ba1289508 scsi: core: sysfs: Fix setting device state to SDEV_RUNNING
e65a8707b4cd ice: avoid bpf_prog refcount underflow
1eb5395add78 ice: fix vsi->txq_map sizing
26ed13d06422 net: nexthop: release IPv6 per-cpu dsts when replacing a nexthop group
3c40584595f8 net: ipv6: add fib6_nh_release_dsts stub
dc2f7e9d8d20 net: stmmac: retain PTP clock time during SIOCSHWTSTAMP ioctls
79068e6b1cfb net: stmmac: fix system hang caused by eee_ctrl_timer during suspend/resume
cc301ad31207 nfp: checking parameter process for rx-usecs/tx-usecs is invalid
9b44cb67d387 ipv6: fix typos in __ip6_finish_output()
6d9e8dabd46f firmware: smccc: Fix check for ARCH_SOC_ID not implemented
bbd1683e795c mptcp: fix delack timer
061542815af1 ALSA: intel-dsp-config: add quirk for JSL devices based on ES8336 codec
f5af2def7e05 iavf: Prevent changing static ITR values if adaptive moderation is on
5dca8eff4627 net: marvell: prestera: fix double free issue on err path
b33c5c828144 drm/vc4: fix error code in vc4_create_object()
2bf9c5a5039c scsi: mpt3sas: Fix kernel panic during drive powercycle test
29ecb4c0f0d7 drm/nouveau/acr: fix a couple NULL vs IS_ERR() checks
0effb7f51b65 ARM: socfpga: Fix crash with CONFIG_FORTIRY_SOURCE
86c5adc78083 NFSv42: Don't fail clone() unless the OP_CLONE operation failed
c9ba7864d3a2 firmware: arm_scmi: pm: Propagate return value to caller
8730a679c3cb net: ieee802154: handle iftypes as u32
2925aadd1f32 ASoC: codecs: wcd934x: return error code correctly from hw_params
3a25def06de8 ASoC: topology: Add missing rwsem around snd_ctl_remove() calls
4a4f900e0415 ASoC: qdsp6: q6asm: fix q6asm_dai_prepare error handling
9196a6858150 ASoC: qdsp6: q6routing: Conditionally reset FrontEnd Mixer
2be17eca48ae ARM: dts: bcm2711: Fix PCIe interrupts
9db1d4a3c270 ARM: dts: BCM5301X: Add interrupt properties to GPIO node
b2cd6fdcbe0a ARM: dts: BCM5301X: Fix I2C controller interrupt
b7ef25e8c271 netfilter: flowtable: fix IPv6 tunnel addr match
d689176e0e18 netfilter: ipvs: Fix reuse connection if RS weight is 0
994065f6efdc netfilter: ctnetlink: do not erase error code with EINVAL
a3d829e5f375 netfilter: ctnetlink: fix filtering with CTA_TUPLE_REPLY
a8a917058faf proc/vmcore: fix clearing user buffer by properly using clear_user()
1f520a0d78fc PCI: aardvark: Fix link training
aec0751f61f5 PCI: aardvark: Simplify initialization of rootcap on virtual bridge
df5748098878 PCI: aardvark: Implement re-issuing config requests on CRS response
e7f2e2c758ea PCI: aardvark: Update comment about disabling link training
2b7bc1c4b2c8 PCI: aardvark: Deduplicate code in advk_pcie_rd_conf()
dfe906da9a1a powerpc/32: Fix hardlockup on vmap stack overflow
bf00edd9e6c9 mdio: aspeed: Fix "Link is Down" issue
14c3ce30ddbd mmc: sdhci: Fix ADMA for PAGE_SIZE >= 64KiB
63195705b334 mmc: sdhci-esdhc-imx: disable CMDQ support
092a58f0d9ef tracing: Fix pid filtering when triggers are attached
68fa6bf7f179 tracing/uprobe: Fix uprobe_perf_open probes iteration
b777c866aafc KVM: PPC: Book3S HV: Prevent POWER7/8 TLB flush flushing SLB
bfed9c2f2f2e xen: detect uninitialized xenbus in xenbus_init
e1d492c27519 xen: don't continue xenstore initialization in case of errors
8f4d0719f323 fuse: release pipe buf after last use
8d0163cec7de staging: rtl8192e: Fix use after free in _rtl92e_pci_disconnect()
0bfed81b2ccd staging: greybus: Add missing rwsem around snd_ctl_remove() calls
146283f16b7e staging/fbtft: Fix backlight
8fc5e3c7cacc HID: wacom: Use "Confidence" flag to prevent reporting invalid contacts
6ca32e2e776e Revert "parisc: Fix backtrace to always include init funtion names"
3a4aeb37a7a6 media: cec: copy sequence field for the reply
3798218a1af4 ALSA: hda/realtek: Fix LED on HP ProBook 435 G7
60274e248e3d ALSA: hda/realtek: Add quirk for ASRock NUC Box 1100
172167bc8dac ALSA: ctxfi: Fix out-of-range access
4402cf040252 binder: fix test regression due to sender_euid change
aea184ae6408 usb: hub: Fix locking issues with address0_mutex
5bf3a0c7789e usb: hub: Fix usb enumeration issue due to address0 race
00f1038c72f8 usb: typec: fusb302: Fix masking of comparator and bc_lvl interrupts
56fbab4937e0 usb: chipidea: ci_hdrc_imx: fix potential error pointer dereference in probe
b70ff391deee net: nexthop: fix null pointer dereference when IPv6 is not enabled
0755f3f32277 usb: dwc3: gadget: Fix null pointer exception
140e2df472ba usb: dwc3: gadget: Check for L1/L2/U3 for Start Transfer
3abf746e800b usb: dwc3: gadget: Ignore NoStream after End Transfer
2b7ab82f5173 usb: dwc2: hcd_queue: Fix use of floating point literal
4b18ccad9671 usb: dwc2: gadget: Fix ISOC flow for elapsed frames
16f1cac8f702 USB: serial: option: add Fibocom FM101-GL variants
ff721286369e USB: serial: option: add Telit LE910S1 0x9200 composition
854c14b2a15c ACPI: Get acpi_device's parent from the parent field
33fe044f6a9e bpf: Fix toctou on read-only map's constant scalar tracking

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 47f8ff27ee..6390f6f353 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "23f3ad608bc75fc89f49a533ac4e5ed8deaa33b0"
-SRCREV_meta ?= "64fb693a6c11f21bab3ff9bb8dcb65a70abe05e3"
+SRCREV_machine ?= "b964618dbcfd6f010b0204e1b3bf575c2ce17920"
+SRCREV_meta ?= "5bdb3bf9619c5f2b928fc784aa0082d399d83fbb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.82"
+LINUX_VERSION ?= "5.10.84"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index d9bec45691..dbe8ae1fa5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.82"
+LINUX_VERSION ?= "5.10.84"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "01f85f09232df2aa45edd757150cb03e35f41f3b"
-SRCREV_machine ?= "f0a0ddc2f355d02a706454137d3dab7889fcf4d1"
-SRCREV_meta ?= "64fb693a6c11f21bab3ff9bb8dcb65a70abe05e3"
+SRCREV_machine:qemuarm ?= "93faaef91af9e57e70cadd27338f62a4afce83aa"
+SRCREV_machine ?= "fa8269a92a01127ad6627f751cdac5cdbfd527a6"
+SRCREV_meta ?= "5bdb3bf9619c5f2b928fc784aa0082d399d83fbb"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 63d7670f80..dbe17fae6e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "74d64de12f376533a34ec582c19b0dc698aea8fc"
-SRCREV_machine:qemuarm64 ?= "0e5d783a705e4c4846cc34d0fd26bf8645bdfb24"
-SRCREV_machine:qemumips ?= "4a8d5630df98b660aeb137a0ca24021e8e9243bb"
-SRCREV_machine:qemuppc ?= "36a9597fcd7083cab43c5c1ec17c7e7b0ce3fab3"
-SRCREV_machine:qemuriscv64 ?= "1bb9d730ac6630d3f41c2ef529fab09f12bcf07d"
-SRCREV_machine:qemuriscv32 ?= "1bb9d730ac6630d3f41c2ef529fab09f12bcf07d"
-SRCREV_machine:qemux86 ?= "1bb9d730ac6630d3f41c2ef529fab09f12bcf07d"
-SRCREV_machine:qemux86-64 ?= "1bb9d730ac6630d3f41c2ef529fab09f12bcf07d"
-SRCREV_machine:qemumips64 ?= "690b09d3a24bafeff32bb06a72643be0c8fae9a7"
-SRCREV_machine ?= "1bb9d730ac6630d3f41c2ef529fab09f12bcf07d"
-SRCREV_meta ?= "64fb693a6c11f21bab3ff9bb8dcb65a70abe05e3"
+SRCREV_machine:qemuarm ?= "765d9bff031ec7198a3e5359127249df19b8bdfa"
+SRCREV_machine:qemuarm64 ?= "c1bb5868e46a792e176b842aefc98dea2727e5fa"
+SRCREV_machine:qemumips ?= "63624e5dfe27ae4f9caa4a70b12eec4e63a9e557"
+SRCREV_machine:qemuppc ?= "d054e2117a15fe0155fde3878811cf233fca3f83"
+SRCREV_machine:qemuriscv64 ?= "7a88f25e2d0e2dd2da6f0e9cab91e0d097b9e10a"
+SRCREV_machine:qemuriscv32 ?= "7a88f25e2d0e2dd2da6f0e9cab91e0d097b9e10a"
+SRCREV_machine:qemux86 ?= "7a88f25e2d0e2dd2da6f0e9cab91e0d097b9e10a"
+SRCREV_machine:qemux86-64 ?= "7a88f25e2d0e2dd2da6f0e9cab91e0d097b9e10a"
+SRCREV_machine:qemumips64 ?= "d435de927eb2adb0cfcd49572bb71ce7ff31035d"
+SRCREV_machine ?= "7a88f25e2d0e2dd2da6f0e9cab91e0d097b9e10a"
+SRCREV_meta ?= "5bdb3bf9619c5f2b928fc784aa0082d399d83fbb"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.82"
+LINUX_VERSION ?= "5.10.84"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


