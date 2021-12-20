Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06403C433F5
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:17:52 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web08.6380.1640013470636776783
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:17:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HbUKd1R9;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id m192so9650734qke.2
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=euK7iKBbqJLN9Jti3Z7dM5avHScPorr2s9kmDFxjGb4=;
        b=HbUKd1R9kFPwS4yEiibGsQdgPMfU4lGjgpjcejaudm2gzh+lCSmOki2z6aDCfGCN81
         fXBIOdQRapGoNRPrMqayelt1hq8l6qkuXaCxSMmii7WYSQ2N/HsAL3tL7fSlP+abjAfE
         n5eK/Oc4p1t3aUtQAL88zWwPF4dROM1ErJ4WWP6+NHIdwrAs8mqEZYpfbo8wrd+ZnH8o
         fRNTM4uglANrjIVk5nzqOJEwhXg5q0NMHNGEDWucU4EVbBPCra/Pr3yTGoDZBW2PpBOm
         p7FZoNHRLaFbRjd0rRchCIFYkJMvJcX+85E9WW5fUHGapNcanZqxzL9XHsFZewINQ2km
         lgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=euK7iKBbqJLN9Jti3Z7dM5avHScPorr2s9kmDFxjGb4=;
        b=bJCE/yZChXhSaUrPsO1Bqa9HSP5L5q4HEQVYPcfgkc2iWqlP1aKYCcNbqmeEkiNzRu
         gCAfspzZFtwwwJUKWwA4BK4O/cvThNgjxerneKzJB/nH1MMDKGocfSGuEFSBYZ3pk2aZ
         z+k9GjmEHb/23wZ1MckynBjjjutbQlS8gGr3uz+NtDIEbmn/N79SZaOgazGU77fWiUmW
         B8dS9t8r+O7moWRKRIwCUe1AuO9FA8AXCDgHpzrPcNfXw0RrzPmT7GCoBNOzX9Zy6VRa
         BbSVyVUppKA/cYUM9ZqOPxlFakRyx9qbJ/o7gvBkvf7LuOTCV6w3YZvUxS1dgV6csNRM
         OsBw==
X-Gm-Message-State: AOAM530X3VS/a71kWOJ2cvv90vl7c0GIe3MbcGkdHTFAtM0eZoB6rgLR
	8ayf1nVwAmJMP1z9Vcc4H+VYDanx4Gs=
X-Google-Smtp-Source: 
 ABdhPJyg/qVCsa74+GCH9Un9dS7HPb239/KCltAzUatzv/qdYPjTLpNSr1tfKGf8u5BhAA4IZIWlJQ==
X-Received: by 2002:a37:a1c1:: with SMTP id
 k184mr9889818qke.383.1640013469463;
        Mon, 20 Dec 2021 07:17:49 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 i7sm11338634qkn.0.2021.12.20.07.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 07:17:48 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] linux-yocto/5.15: update to v5.15.7
Date: Mon, 20 Dec 2021 10:17:42 -0500
Message-Id: 
 <93d6e1d262e58ff83f755715768ee149874ad1be.1640013267.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1640013267.git.bruce.ashfield@gmail.com>
References: <cover.1640013267.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 15:17:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159885

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

4e8c680af6d5 Linux 5.15.7
3ded93ae46ce ipmi: msghandler: Make symbol 'remove_work_wq' static
888fc81107ca serial: liteuart: fix minor-number leak on probe errors
602824cf9aa9 serial: liteuart: fix use-after-free and memleak on unbind
189c99c629bb serial: liteuart: Fix NULL pointer dereference in ->remove()
54b4cfe4c999 serial: 8250: Fix RTS modem control while in rs485 mode
b6e196d931d0 serial: 8250_pci: rewrite pericom_do_set_divisor()
1718ff2e3dad serial: 8250_pci: Fix ACCES entries in pci_serial_quirks array
64e491c1634b serial: core: fix transmit-buffer reset and memleak
d2341178187a serial: tegra: Change lower tolerance baud rate limit for tegra20 and tegra30
ea3628ce85ff serial: pl011: Add ACPI SBSA UART match id
87eb31a7d1e7 tty: serial: msm_serial: Deactivate RX DMA for polling support
498ddcffe2ff x86/64/mm: Map all kernel memory into trampoline_pgd
6e0dd9cceac7 x86/tsc: Disable clocksource watchdog for TSC on qualified platorms
53df08733bc4 x86/tsc: Add a timer to make sure TSC_adjust is always checked
7d94bc8e335c usb: cdnsp: Fix a NULL pointer dereference in cdnsp_endpoint_init()
f4f77594cc30 usb: cdns3: gadget: fix new urb never complete if ep cancel previous requests
cfdb7032a488 usb: typec: tcpm: Wait in SNK_DEBOUNCED until disconnect
43cdf7b5645d USB: NO_LPM quirk Lenovo Powered USB-C Travel Hub
fa75f593c867 xhci: Fix commad ring abort, write all 64 bits to CRCR register.
81dbda4c70f3 vgacon: Propagate console boot parameters before calling `vc_resize'
dbeb9153ded9 parisc: Mark cr16 CPU clocksource unstable on all SMP machines
98736f21f673 parisc: Fix "make install" on newer debian releases
34680557cf3a parisc: Fix KBUILD_IMAGE for self-extracting kernel
8e044b80e6ba serial: 8250_bcm7271: UART errors after resuming from S2
cb0fb54ff6ee net/mlx5e: Sync TIR params updates against concurrent create/modify
a950a93be05f net/mlx5e: Rename TIR lro functions to TIR packet merge functions
3cd81837f46f net/mlx5e: Rename lro_timeout to packet_merge_timeout
66e507d96869 KVM: x86/mmu: Remove spurious TLB flushes in TDP MMU zap collapsible path
e0609b252c8c KVM: x86/mmu: Rename slot_handle_leaf to slot_handle_level_4k
7012eb0e5220 KVM: SEV: Return appropriate error codes if SEV-ES scratch setup fails
a246d92dda9f sched/uclamp: Fix rq->uclamp_max not set on first enqueue
fcf714776066 preempt/dynamic: Fix setup_preempt_mode() return value
e19a07833960 x86/xen: Add xenpv_restore_regs_and_return_to_usermode()
308cc9668d7c x86/entry: Use the correct fence macro after swapgs in kernel CR3
efc5d7be3eb0 x86/entry: Add a fence for kernel entry SWAPGS in paranoid_entry()
ce364f143caa x86/sev: Fix SEV-ES INS/OUTS instructions for word, dword, and qword
690637ec0442 io-wq: don't retry task_work creation failure on fatal conditions
894b21da042f Revert "drm/i915: Implement Wa_1508744258"
812ed9b71246 mctp: Don't let RTM_DELROUTE delete local routes
f1bcddbc7b60 KVM: VMX: Set failure code in prepare_vmcs02()
5333bef073f8 KVM: x86/pmu: Fix reserved bits for AMD PerfEvtSeln register
7a22778cc73b net/mlx5: E-Switch, Check group pointer before reading bw_share value
4cc946fae4c5 net/mlx5: E-Switch, fix single FDB creation on BlueField
301c7519106d net/mlx5: E-switch, Respect BW share of the new group
3f8887350191 net/mlx5: Move MODIFY_RQT command to ignore list in internal error state
1adc4914a0da net/mlx5e: Fix missing IPsec statistics on uplink representor
c4db545992ad KVM: SEV: initialize regions_list of a mirror VM
b5a8918d0865 KVM: X86: Fix when shadow_root_level=5 && guest root_level<4
4768935c2540 iwlwifi: Fix memory leaks in error handling path
8b9bed7c63f0 ASoC: rk817: Add module alias for rk817-codec
805c90e0e919 drm/msm: Restore error return on invalid fence
4c3cdbf25403 drm/msm: Fix wait_fence submitqueue leak
8e2b7fe5e8a4 drm/msm: Fix mmap to include VM_IO and VM_DONTDUMP
a4eb55901df1 drm/msm/devfreq: Fix OPP refcnt leak
8e256b45e058 KVM: x86/mmu: Pass parameter flush as false in kvm_tdp_mmu_zap_collapsible_sptes()
d618539224ea KVM: x86/mmu: Skip tlb flush if it has been done in zap_gfn_range()
be9163800ba7 atlantic: Remove warn trace message.
35b75e2b72c5 atlantic: Fix statistics logic for production hardware
469d2288e059 Remove Half duplex mode speed capabilities.
4b72830f1e30 atlantic: Add missing DIDs and fix 115c.
6816e0fa49f3 atlantic: Fix to display FW bundle version instead of FW mac version.
e9df163300ae atlatnic: enable Nbase-t speeds with base-t
da0027b4178d atlantic: Increase delay for fw transactions
e216e02befc3 drm/vc4: kms: Fix previous HVS commit wait
aeadbd778d66 drm/vc4: kms: Don't duplicate pending commit
2931db9a5ed2 drm/vc4: kms: Clear the HVS FIFO commit pointer once done
53f9601e908d drm/vc4: kms: Add missing drm_crtc_commit_put
b044180fcb38 drm/vc4: kms: Fix return code check
fd7bfba0112d drm/vc4: kms: Wait for the commit before increasing our clock rate
3cae481575f5 drm/msm: Do hw_init() before capturing GPU state
83e54fcf0b14 drm/msm/a6xx: Allocate enough space for GMU registers
3a3db121f999 net/smc: Keep smc_close_final rc during active close
b44a55ee25ef net/rds: correct socket tunable error in rds_tcp_tune()
95518fe354d7 net/smc: fix wrong list_del in smc_lgr_cleanup_early
170739c45e37 ipv4: convert fib_num_tclassid_users to atomic_t
94782c8ffd07 net: annotate data-races on txq->xmit_lock_owner
1c0ddef45b7e octeontx2-af: Fix a memleak bug in rvu_mbox_init()
e83fb96f915a dpaa2-eth: destroy workqueue at the end of remove function
686578a1bac1 net: marvell: mvpp2: Fix the computation of shared CPUs
231117a52713 net: usb: lan78xx: lan78xx_phy_init(): use PHY_POLL instead of "0" if no IRQ is available
823ae758c0f3 net: stmmac: Avoid DMA_CHAN_CONTROL write if no Split Header support
a927f9dfd0d9 ALSA: intel-dsp-config: add quirk for CML devices based on ES8336 codec
9469273e616c rxrpc: Fix rxrpc_local leak in rxrpc_lookup_peer()
bc97458620e3 rxrpc: Fix rxrpc_peer leak in rxrpc_look_up_bundle()
f50dcc9d14f5 ASoC: tegra: Fix kcontrol put callback in AHUB
e13772cfb25d ASoC: tegra: Fix kcontrol put callback in DSPK
1686d2e9edb2 ASoC: tegra: Fix kcontrol put callback in DMIC
e6186c773572 ASoC: tegra: Fix kcontrol put callback in I2S
7b77bdff45ff ASoC: tegra: Fix kcontrol put callback in ADMAIF
a0730b605153 ASoC: tegra: Fix wrong value type in DSPK
7e83ca5d78bb ASoC: tegra: Fix wrong value type in DMIC
36358b208cdb ASoC: tegra: Fix wrong value type in I2S
f3f65b768880 ASoC: tegra: Fix wrong value type in ADMAIF
14b03b8cebdf mt76: mt7915: fix NULL pointer dereference in mt7915_get_phy_mode
f8aceb91a5dd net: dsa: b53: Add SPI ID table
ad7f90bb8846 selftests: net: Correct case name
75917372eef0 net/mlx4_en: Fix an use-after-free bug in mlx4_en_try_alloc_resources()
b762b3e28c92 net/mlx5e: IPsec: Fix Software parser inner l3 type setting in case of encapsulation
3f837fefa59d iwlwifi: fix warnings produced by kernel debug options
b9dffaf94908 arm64: ftrace: add missing BTIs
49d17d1a4ba5 siphash: use _unaligned version by default
519ed0ab5f8b net: mpls: Fix notifications when deleting a device
c5ef33c1489b net: qlogic: qlcnic: Fix a NULL pointer dereference in qlcnic_83xx_add_rings()
5a9afcd827ca tcp: fix page frag corruption on page fault
22a18dd48866 natsemi: xtensa: fix section mismatch warnings
f744230dfbf2 i2c: cbus-gpio: set atomic transfer callback
e2d234f96d8b i2c: stm32f7: stop dma transfer in case of NACK
3dd6c5899695 i2c: stm32f7: recover the bus on access timeout
a153d4253530 i2c: stm32f7: flush TX FIFO upon transfer errors
d5f50794a49f wireguard: ratelimiter: use kvcalloc() instead of kvzalloc()
2745192cb798 wireguard: receive: drop handshakes if queue lock is contended
af794a64d6ca wireguard: receive: use ring buffer for incoming handshakes
4db0d88a9048 wireguard: device: reset peer src endpoint when netns exits
7c0d08d85139 wireguard: selftests: rename DEBUG_PI_LIST to DEBUG_PLIST
631a480320f1 wireguard: selftests: actually test for routing loops
d33493e9654a wireguard: allowedips: add missing __rcu annotation to satisfy sparse
b050a8d576b1 wireguard: selftests: increase default dmesg log size
326fb8a1c267 net: dsa: mv88e6xxx: Link in pcs_get_state() if AN is bypassed
19f7ad89bcb7 net: dsa: mv88e6xxx: Fix inband AN for 2500base-x on 88E6393X family
6f273a649608 net: dsa: mv88e6xxx: Add fix for erratum 5.2 of 88E6393X family
f2be2d4c8e8f net: dsa: mv88e6xxx: Save power by disabling SerDes trasmitter and receiver
865185f74509 net: dsa: mv88e6xxx: Drop unnecessary check in mv88e6393x_serdes_erratum_4_6()
0671c8f7332f net: dsa: mv88e6xxx: Fix application of erratum 4.8 for 88E6393X
f7b4f571d580 tracing/histograms: String compares should not care about signed values
4e06bb02ad6a KVM: x86: check PIR even for vCPUs with disabled APICv
2846d550f8f5 KVM: X86: Use vcpu->arch.walk_mmu for kvm_mmu_invlpg()
6aebd2da8d49 KVM: arm64: Avoid setting the upper 32 bits of TCR_EL2 and CPTR_EL2 to 1
87d9c628be26 KVM: MMU: shadow nested paging does not have PKU
9325b1dbdbf9 KVM: x86: Use a stable condition around all VT-d PI paths
70a37e04c08a KVM: VMX: prepare sync_pir_to_irr for running with APICv disabled
8ed61a2a6a28 KVM: nVMX: Abide to KVM_REQ_TLB_FLUSH_GUEST request on nested vmentry/vmexit
361e68805ace KVM: nVMX: Flush current VPID (L1 vs. L2) for KVM_REQ_TLB_FLUSH_GUEST
85f2cf6419dd KVM: nVMX: Emulate guest TLB flush on nested VM-Enter with new vpid12
3a929e1d7e5e KVM: x86: ignore APICv if LAPIC is not enabled
cbe4fcf37150 KVM: Ensure local memslot copies operate on up-to-date arch-specific data
2bdc79ac9a4f KVM: x86/mmu: Fix TLB flush range when handling disconnected pt
0827b8db5c7f KVM: Disallow user memslot with size that exceeds "unsigned long"
f1a1693ea4e2 KVM: fix avic_set_running for preemptable kernels
245241821ecf drm/i915/dp: Perform 30ms delay after source OUI write
7418356362ce drm/amd/display: Allow DSC on supported MST branch devices
8ef8a76a340e ipv6: fix memory leak in fib6_rule_suppress
3ce84ab279ef scsi: ufs: ufs-pci: Add support for Intel ADL
a8392866c522 scsi: lpfc: Fix non-recovery of remote ports following an unsolicited LOGO
dd267e59a181 sata_fsl: fix warning in remove_proc_entry when rmmod sata_fsl
adf098e2a8a1 sata_fsl: fix UAF in sata_fsl_port_stop when rmmod sata_fsl
6fe4eadd54da fget: check that the fd still exists after getting a ref to it
31aa63f69a3c s390/pci: move pseudo-MMIO to prevent MIO overlap
c1079ff6f9a0 dma-buf: system_heap: Use 'for_each_sgtable_sg' in pages free flow
075d9c1497f2 iwlwifi: mvm: retry init flow if failed
c649d47801df cpufreq: Fix get_cpu_device() failure in add_cpu_dev_symlink()
c4618188b15a ipmi: Move remove_work to dedicated workqueue
2a715e15588c rt2x00: do not mark device gone on EPROTO errors during start
edbdf9da8015 ALSA: hda/cs8409: Set PMSG_ON earlier inside cs8409 driver
16ccd481e3d8 kprobes: Limit max data_size of the kretprobe instances
75fc0eba15df vrf: Reset IPCB/IP6CB when processing outbound pkts in vrf dev xmit
275827a7dcaf net/tls: Fix authentication failure in CCM mode
f06c3b728ae7 ACPI: Add stubs for wakeup handler functions
b589021871cf net/smc: Avoid warning of possible recursive locking
859ea5a20ee7 tracing: Don't use out-of-sync va_list in event printing
71e284dcebec perf report: Fix memory leaks around perf_tip()
5b5c6f57a1f8 perf hist: Fix memory leak of a perf_hpp_fmt
27802de133dc perf inject: Fix ARM SPE handling
cf49756c3d68 perf sort: Fix the 'p_stage_cyc' sort key behavior
199e20f4fdfa perf sort: Fix the 'ins_lat' sort key behavior
57482dc5ac7d perf sort: Fix the 'weight' sort key behavior
40e35c77448e net: ethernet: dec: tulip: de4x5: fix possible array overflows in type3_infoblock()
12f907cb1157 net: tulip: de4x5: fix the problem that the array 'lp->phy[8]' may be out of bound
634ef8cf4e51 ipv6: check return value of ipv6_skip_exthdr
fc7ffa7f10b9 ethernet: hisilicon: hns: hns_dsaf_misc: fix a possible array overflow in hns_dsaf_ge_srst_by_port()
b56c75d4d3c3 ata: libahci: Adjust behavior when StorageD3Enable _DSD is set
ab8efdbda76c ata: ahci: Add Green Sardine vendor ID as board_ahci_mobile
75752ada77e0 drm/amd/amdgpu: fix potential memleak
06c6f8f86ec2 drm/amd/amdkfd: Fix kernel panic when reset failed and been triggered again
c786a7d5b88b drm/amd/pm: Remove artificial freq level on Navi1x
9774ec30cf7b net: usb: r8152: Add MAC passthrough support for more Lenovo Docks
592195692021 scsi: iscsi: Unblock session then wake up error handler
80050db986a1 thermal: core: Reset previous low and high trip during thermal zone init
7440613439a3 btrfs: check-integrity: fix a warning on write caching disabled disk
e26605497f4e btrfs: silence lockdep when reading chunk tree during mount
efc562ea9d8a s390/setup: avoid using memblock_enforce_memory_limit
b6d5c4e3fce7 platform/x86: thinkpad_acpi: Fix WWAN device disabled issue after S3 deep
d17d9e935f72 platform/x86: thinkpad_acpi: Add support for dual fan control
8df09ab9d374 platform/x86: dell-wmi-descriptor: disable by default
aca091aadef4 pinctrl: qcom: fix unmet dependencies on GPIOLIB for GPIOLIB_IRQCHIP
00fdcc2b4474 net: return correct error code
cec49b6dfdb0 atlantic: Fix OOB read and write in hw_atl_utils_fw_rpc_wait
fb92e025baa7 net/smc: Transfer remaining wait queue entries during fallback
cc447c1e1482 x86/hyperv: Move required MSRs check to initial platform probing
60af14bf37ec mac80211: fix throughput LED trigger
9d3eb89e6ca3 mac80211: do not access the IV when it was stripped
8e7c364d1c07 drm/sun4i: fix unmet dependency on RESET_CONTROLLER for PHY_SUN6I_MIPI_DPHY
05d27cd9bc70 powerpc/pseries/ddw: Do not try direct mapping with persistent memory and one window
b67ff10e43d3 powerpc/pseries/ddw: Revert "Extend upper limit for huge DMA window for persistent memory"
f8b76df0055c gfs2: Fix length of holes reported at end-of-file
4b11e583193c gfs2: release iopen glock early in evict
1236351c29c7 ALSA: usb-audio: Don't start stream for capture at prepare
321cd173b8cc ALSA: usb-audio: Switch back to non-latency mode at a later point
2cea047b74da ALSA: usb-audio: Less restriction for low-latency playback mode
c7ac29edfb6a ALSA: usb-audio: Fix packet size calculation regression
458871f21e69 ALSA: usb-audio: Avoid killing in-flight URBs during draining
ff39117fac65 ALSA: usb-audio: Improved lowlatency playback support
7303160785e5 ALSA: usb-audio: Add spinlock to stop_urbs()
31056232ad3c ALSA: usb-audio: Check available frames for the next packet size
8d7c6f515b15 ALSA: usb-audio: Disable low-latency mode for implicit feedback sync
5ca1fa52d351 ALSA: usb-audio: Disable low-latency playback for free-wheel mode
2d9ea74b3751 ALSA: usb-audio: Rename early_playback_start flag with lowlatency_playback
8f0a376b2eaa ALSA: usb-audio: Restrict rates for the shared clocks

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 9f5d4447d3..4047648ecd 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7e69ef480edfe25ec8e0237b54815138a5a10695"
-SRCREV_meta ?= "df57bc53f6ca3fb3b2d3a9e5331ceff533d6f508"
+SRCREV_machine ?= "f6d02f13253de53534cd0d5d449fe9f21ca943f0"
+SRCREV_meta ?= "2cfaf2c0b58d9507b0f5d62d0a514ca6cb688eda"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.6"
+LINUX_VERSION ?= "5.15.7"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 6bb09e28a8..be432628e6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.6"
+LINUX_VERSION ?= "5.15.7"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "d3f6afd8b86ba551b9b866c98ee6470d7ee3b99f"
-SRCREV_machine ?= "17da35e5c5cafd55f8a10d43d8765397eb733399"
-SRCREV_meta ?= "df57bc53f6ca3fb3b2d3a9e5331ceff533d6f508"
+SRCREV_machine:qemuarm ?= "410e941717cfa38fa13d6ab885d0149dfc6029c0"
+SRCREV_machine ?= "f82433b2add15e6f0d19f3f200c24cc9c9f85bb0"
+SRCREV_meta ?= "2cfaf2c0b58d9507b0f5d62d0a514ca6cb688eda"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index a67771eb1b..99e2ff14ff 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8935caacf2a94b558bb610594d6afd044aa26be3"
-SRCREV_machine:qemuarm64 ?= "17da35e5c5cafd55f8a10d43d8765397eb733399"
-SRCREV_machine:qemumips ?= "71955d634950e6477e594645b8159445e48a875d"
-SRCREV_machine:qemuppc ?= "17da35e5c5cafd55f8a10d43d8765397eb733399"
-SRCREV_machine:qemuriscv64 ?= "17da35e5c5cafd55f8a10d43d8765397eb733399"
-SRCREV_machine:qemuriscv32 ?= "17da35e5c5cafd55f8a10d43d8765397eb733399"
-SRCREV_machine:qemux86 ?= "17da35e5c5cafd55f8a10d43d8765397eb733399"
-SRCREV_machine:qemux86-64 ?= "17da35e5c5cafd55f8a10d43d8765397eb733399"
-SRCREV_machine:qemumips64 ?= "84a301c888e6dda95617c3009a7aace5c31c5048"
-SRCREV_machine ?= "17da35e5c5cafd55f8a10d43d8765397eb733399"
-SRCREV_meta ?= "df57bc53f6ca3fb3b2d3a9e5331ceff533d6f508"
+SRCREV_machine:qemuarm ?= "68220d3c864ae61309a39bbd31d56982199f1738"
+SRCREV_machine:qemuarm64 ?= "f82433b2add15e6f0d19f3f200c24cc9c9f85bb0"
+SRCREV_machine:qemumips ?= "176481738feda5bc490b5f293d012b4a8597b458"
+SRCREV_machine:qemuppc ?= "f82433b2add15e6f0d19f3f200c24cc9c9f85bb0"
+SRCREV_machine:qemuriscv64 ?= "f82433b2add15e6f0d19f3f200c24cc9c9f85bb0"
+SRCREV_machine:qemuriscv32 ?= "f82433b2add15e6f0d19f3f200c24cc9c9f85bb0"
+SRCREV_machine:qemux86 ?= "f82433b2add15e6f0d19f3f200c24cc9c9f85bb0"
+SRCREV_machine:qemux86-64 ?= "f82433b2add15e6f0d19f3f200c24cc9c9f85bb0"
+SRCREV_machine:qemumips64 ?= "92a4a55fc14c4ef2a8b216489a4847719aa1505d"
+SRCREV_machine ?= "f82433b2add15e6f0d19f3f200c24cc9c9f85bb0"
+SRCREV_meta ?= "2cfaf2c0b58d9507b0f5d62d0a514ca6cb688eda"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "df57bc53f6ca3fb3b2d3a9e5331ceff533d6f508"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "a2547651bc896f95a3680a6a0a27401e7c7a1080"
+SRCREV_machine:class-devupstream ?= "4e8c680af6d51ba9315e31bd4f7599e080561a2d"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.6"
+LINUX_VERSION ?= "5.15.7"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


