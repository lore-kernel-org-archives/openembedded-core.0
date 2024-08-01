Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6503C52D54
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 15:08:47 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web10.70824.1722524927190917175
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 08:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SgoJR2uR;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7a337501630so52268985a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 08:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722524926; x=1723129726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgWGgtvg4qNP1weZiS7aOLKWFTFVtPcwDxjUEGQXxoU=;
        b=SgoJR2uRggsTLYDSFuMfA1al9XHsQ2RMbTBXz1l6U7wkSmOmSKe7qb3yJg+egEkFUD
         fdzrAVy7MmJYyXnmR0dDDhpRnQo+e0sWOOVnW3D4Xz27HJWMMErVwSFvXkd+zIGQnDsf
         I9wZcAbzkWYnIwy1w9/EBDccCMusff68K4nfh1sKMupFeEXFA8sJdYNwHKKl/u8bN8dg
         WTjjDMfoSziwipdD/AV0xyk1pvQVKvi0P3nWlmO2AuNJZtVsr6d3dEzxJuxggvCW3W8V
         GQDXJYSSt955G8ebaoMXxVbVgopYhbr4RhqcinBaXaxgQ+S/s74LEJlfG0WMSEzPkqsh
         TmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722524926; x=1723129726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgWGgtvg4qNP1weZiS7aOLKWFTFVtPcwDxjUEGQXxoU=;
        b=i3mVK9I17RRcaVCT/qtF7nqKuMy8/JJGcXMRZDKazIqWzDuBbfJwrK0Drfm4AjNRPx
         NfO/p9LxVn/09nlIwxfqRSn+6P2hlfbAuvPr0UO6CfShOJWHbSc9elOpBUYpcxxhHzqd
         uyZ1DuZBoR4KFmsr2qG3gQcLURnReMlnIdLeIhd398sYXRS1LnmEPJZLkey0wleL+tmf
         QQNR07YTRLn5gb21CTKfhh6msrlplvGSAylwFDTXpPtJgh+c4nnXiIaNAguYDBqcdiOi
         4NJa+xdBDltMH5ZufbA7dh8uJrSzwrN0CjWG9RtX8kWlyeUupX2pdSEvVCOVNEgWvMf1
         KFNw==
X-Gm-Message-State: AOJu0YzJ207vBVd34lsghQCFSnfE1Ce6uHdo6OXmMgYrlJjn98YnxpwX
	KGBhluPtdnyaawySYJPb8Sxm56meew5SxI7rR2N7MXUy3N3CqcqfXYEH0AQu
X-Google-Smtp-Source: AGHT+IHGy/Da4WaXXW8eRUK47HgRx5Bx6u6EQtNV1GkbsqHzmwBkIzzOy47YWa0ih79jEGOiLen09A==
X-Received: by 2002:a05:620a:454b:b0:79c:130:452b with SMTP id af79cd13be357-7a34efd8362mr39443085a.47.1722524925770;
        Thu, 01 Aug 2024 08:08:45 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d73b5003sm859343985a.43.2024.08.01.08.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:08:45 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/10] linux-yocto/6.6: update to v6.6.36
Date: Thu,  1 Aug 2024 11:08:33 -0400
Message-Id: <9d5c647a196a7e3effcce9a7abc814f2f9e95333.1722524523.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1722524523.git.bruce.ashfield@gmail.com>
References: <cover.1722524523.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 15:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202741

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    f71bb11887ba cpu/amd: inhibit SMP check for qemux86
    61945f2f69d0 Linux 6.6.36
    b3f7525556fb Revert "mm: mmap: allow for the maximum number of bits for randomizing mmap_base by default"
    9de62e88310c hid: asus: asus_report_fixup: fix potential read out of bounds
    25f8b9a7811a kprobe/ftrace: fix build error due to bad function definition
    a08936934676 net/sched: unregister lockdep keys in qdisc_create/qdisc_alloc error path
    b552a47cc81b ASoC: Intel: sof-sdw: really remove FOUR_SPEAKER quirk
    56aa62ff36f3 drm/amd/display: revert Exit idle optimizations before HDCP execution
    988a03e31e07 LoongArch: Fix entry point in kernel image header
    eae6e7dbd1b6 efi/loongarch: Directly position the loaded image file
    d9a5d5c49306 vgacon: rework screen_info #ifdef checks
    05f263c166ad riscv: force PAGE_SIZE linear mapping if debug_pagealloc is enabled
    5f03d4f286b8 riscv: Don't use PGD entries for the linear mapping
    65ac09c96588 x86/cpu: Fix x86_match_cpu() to match just X86_VENDOR_INTEL
    71cf8cfd1906 x86/cpu/vfm: Add new macros to work with (vendor/family/model) values
    6408fcfea4c3 tracing: Add MODULE_DESCRIPTION() to preemptirq_delay_test
    7261d27bcc09 nbd: Fix signal handling
    193820ee0c1c nbd: Improve the documentation of the locking assumptions
    afcd1a3ac37d ocfs2: update inode fsync transaction id in ocfs2_unlink and ocfs2_link
    10fc3a1813ea ocfs2: convert to new timestamp accessors
    1dbb1a3181d8 wifi: rtl8xxxu: enable MFP support with security flag of RX descriptor
    b30c9b111837 perf script: Show also errors for --insn-trace option
    0ea11a112408 perf: script: add raw|disasm arguments to --insn-trace option
    23b1940096b6 spi: stm32: qspi: Clamp stm32_qspi_get_mode() output to CCR_BUSWIDTH_4
    299c0cb3aaab arm64: dts: imx8qm-mek: fix gpio number for reg_usdhc2_vmmc
    6e77a7c0bdfc spi: stm32: qspi: Fix dual flash mode sanity test in stm32_qspi_setup()
    211deb3e31ed dt-bindings: i2c: google,cros-ec-i2c-tunnel: correct path to i2c-controller schema
    f712670a91fc dt-bindings: i2c: atmel,at91sam: correct path to i2c-controller schema
    391251d496e2 i2c: ocores: set IACK bit after core is enabled
    84d3549d54f5 mm/page_table_check: fix crash on ZONE_DEVICE
    250fad18b0c9 tcp: clear tp->retrans_stamp in tcp_rcv_fastopen_synack()
    856cf3305f11 mm: mmap: allow for the maximum number of bits for randomizing mmap_base by default
    08cfaa12171d serial: 8250_dw: Revert "Move definitions to the shared header"
    231f18e8e93c efi/x86: Free EFI memory map only when installing a new one.
    637619b02cc3 kcov: don't lose track of remote references during softirqs
    ae30200eccd4 gcov: add support for GCC 14
    67bcecd78060 ocfs2: fix NULL pointer dereference in ocfs2_abort_trigger()
    0550ad87711f ocfs2: fix NULL pointer dereference in ocfs2_journal_dirty()
    63f894de08e1 dt-bindings: dma: fsl-edma: fix dma-channels constraints
    b065d79ed06a drm/amdgpu: fix UBSAN warning in kv_dpm.c
    9e57611182a8 drm/radeon: fix UBSAN warning in kv_dpm.c
    e7bda1f8ba84 drm/i915/mso: using joiner is not possible with eDP MSO
    9f3b02cc05df ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14AHP9
    b03d8b4a646f ALSA: hda/realtek: Limit mic boost on N14AP7
    dd3068d81d1c ALSA: hda/realtek: fix mute/micmute LEDs don't work for ProBook 445/465 G11.
    10252816227c ovl: fix encoding fid for lower only root
    cd2f51797607 RDMA/mlx5: Follow rb_key.ats when creating new mkeys
    637a3bebcd57 RDMA/mlx5: Remove extra unlock on error path
    94646324833d RDMA/rxe: Fix data copy for IB_SEND_INLINE
    72040b4f9934 KVM: x86: Always sync PIR to IRR prior to scanning I/O APIC routes
    48bb62859d47 KVM: arm64: Disassociate vcpus from redistributor region on teardown
    a937ef951bba KVM: Fix a data race on last_boosted_vcpu in kvm_vcpu_on_spin()
    32a62a6b1052 LoongArch: Fix multiple hardware watchpoint issues
    75ecfab9bf9c LoongArch: Trigger user-space watchpoints correctly
    4b26f9ace31f LoongArch: Fix watchpoint setting error
    450df994f32a cifs: fix typo in module parameter enable_gcm_256
    eacfd7f07eb0 scsi: ufs: core: Free memory allocated for model before reinit
    bf1e8c21f2be btrfs: retry block group reclaim without infinite loop
    454c454ed645 net: do not leave a dangling sk pointer, when socket creation fails
    f08e079bdde1 net: usb: ax88179_178a: improve reset check
    78a6136e949f net: stmmac: Assign configured channel value to EXTTS event
    555672188053 locking/atomic: scripts: fix ${atomic}_sub_and_test() kerneldoc
    677ff4589f15 ext4: fix slab-out-of-bounds in ext4_mb_find_good_group_avg_frag_lists()
    82d5a4ba46b3 ext4: avoid overflow when setting values via sysfs
    db3d39869e53 arm64: defconfig: enable the vf610 gpio driver
    17095b1d79ae ACPI: EC: Evaluate orphan _REG under EC device
    d63c635e226d RDMA/mana_ib: Ignore optional access flags for MRs
    e0deb0e9c967 RDMA/mlx5: Add check for srq max_sge attribute
    3b733016d878 RDMA/mlx5: Fix unwind flow as part of mlx5_ib_stage_init_init
    a6d6332a005e firmware: psci: Fix return value from psci_system_suspend()
    2a215410cf59 io_uring/rsrc: fix incorrect assignment of iter->nr_segs in io_import_fixed
    87e0621a6b36 spi: spi-imx: imx51: revert burst length calculation back to bits_per_word
    434c6b924e1f ACPICA: Revert "ACPICA: avoid Info: mapping multiple BARs. Your kernel is fine."
    83936d4ecd0a arm64: dts: freescale: imx8mm-verdin: enable hysteresis on slow input pin
    563788af0767 arm64: dts: imx93-11x11-evk: Remove the 'no-sdio' property
    c41f973a68f3 arm64: dts: freescale: imx8mp-venice-gw73xx-2x: fix BT shutdown GPIO
    625c4fda1188 arm64: dts: imx8mp: Fix TC9595 input clock on DH i.MX8M Plus DHCOM SoM
    332af18d1ab1 arm64: dts: imx8mp: Fix TC9595 reset GPIO on DH i.MX8M Plus DHCOM SoM
    90d29da11445 thermal/drivers/mediatek/lvts_thermal: Return error in case of invalid efuse data
    47a0fe77b6c8 regulator: bd71815: fix ramp values
    79cee58de38f dmaengine: ioatdma: Fix missing kmem_cache_destroy()
    6f47c1e98700 dmaengine: fsl-edma: avoid linking both modules
    30d2259c5ebb dmaengine: ioatdma: Fix kmemleak in ioat_pci_probe()
    fb6e3d4d43ac dmaengine: ioatdma: Fix error path in ioat3_dma_probe()
    ab9501ecaac9 dmaengine: ioatdma: Fix leaking on version mismatch
    faa35db78b05 dmaengine: idxd: Fix possible Use-After-Free in irq_process_work_list
    186d77852555 regulator: core: Fix modpost error "regulator_get_regmap" undefined
    163868ec1f6c RDMA/rxe: Fix responder length checking for UD request packets
    9f06731c4eca spi: cs42l43: Correct SPI root clock speed
    5f338cb5ca96 RDMA/bnxt_re: Fix the max msix vectors macro
    7bcca7108c5b net: usb: rtl8150 fix unintiatilzed variables in rtl8150_get_link_ksettings
    ad22071b8e0e bnxt_en: Restore PTP tx_avail count in case of skb_pad() error
    714782d58099 ice: Fix VSI list rule with ICE_SW_LKUP_LAST type
    325f8ab7765d netfilter: move the sysctl nf_hooks_lwtunnel into the netfilter core
    d62df86c1720 seg6: fix parameter passing when calling NF_HOOK() in End.DX4 and End.DX6 behaviors
    94dd411c18d7 netfilter: ipset: Fix suspicious rcu_dereference_protected()
    3ee9c732d672 octeontx2-pf: Fix linking objects into multiple modules
    096a93e1c46e octeontx2-pf: Add error handling to VLAN unoffload handling
    3ef2a16a1d17 virtio_net: fixing XDP for fully checksummed packets handling
    ef609fd73433 virtio_net: checksum offloading handling fix
    a71b686418ee net: stmmac: No need to calculate speed divider when offload is disabled
    a674424c23db selftests: openvswitch: Use bash as interpreter
    666e934d749e ptp: fix integer overflow in max_vclocks_store
    9126fd82e9ed sched: act_ct: add netns into the key of tcf_ct_flow_table
    b57a4a2dc874 tipc: force a dst refcount before doing decryption
    5f926aa96b08 net/sched: act_api: fix possible infinite loop in tcf_idr_check_alloc()
    284fd7e97b92 net/sched: act_api: rely on rcu in tcf_idr_check_alloc
    123eaaf63602 net: phy: mxl-gpy: Remove interrupt mask clearing from config_init
    de4fc1091af1 net: lan743x: Support WOL at both the PHY and MAC appropriately
    41805c46d550 net: lan743x: disable WOL upon resume to restore full data path operation
    6b2dfc4ff3f6 qca_spi: Make interrupt remembering atomic
    ef0394ca2595 netns: Make get_net_ns() handle zero refcount net
    f897d7171652 xfrm6: check ip6_dst_idev() return value in xfrm6_get_saddr()
    73e7c8ca6ad7 ipv6: prevent possible NULL dereference in rt6_probe()
    b6947723c9ea ipv6: prevent possible NULL deref in fib6_nh_init()
    b6ebe4fed73e netrom: Fix a memory leak in nr_heartbeat_expiry()
    d940be596b28 ALSA: hda/realtek: Enable headset mic on IdeaPad 330-17IKB 81DM
    7f9644782c55 bpf: Avoid splat in pskb_pull_reason
    5a24f876b5ce ALSA: hda: tas2781: Component should be unbound before deconstruction
    8be82acd4ee3 ALSA: hda: cs35l56: Component should be unbound before deconstruction
    08fa10b26592 cipso: fix total option length computation
    23a52ca69c4b net: mvpp2: use slab_build_skb for oversized frames
    082b3d4e7889 btrfs: zoned: allocate dummy checksums for zoned NODATASUM writes
    823e42971f8f ice: avoid IRQ collision to fix init failure on ACPI S3 resume
    83de3ace795b ALSA/hda: intel-dsp-config: Document AVS as dsp_driver option
    590f9d97cd31 ALSA: hda/realtek: Remove Framework Laptop 16 from quirks
    55d5d0817436 tracing: Build event generation tests only as modules
    2cd4854ef14a mips: bmips: BCM6358: make sure CBR is correctly set
    fe5a1bfad443 MIPS: Routerboard 532: Fix vendor retry check code
    b89c2c56a010 ALSA: seq: ump: Fix missing System Reset message handling
    ff27bd8e1788 ALSA: hda: cs35l41: Possible null pointer dereference in cs35l41_hda_unbind()
    fae0e055d01d PCI: Do not wait for disconnected devices when resuming
    96a0e06dfe0c ACPI: EC: Install address space handler at the namespace root
    448efb7ea0bf cpufreq: amd-pstate: fix memory leak on CPU EPP exit
    618fbf4c910a vfio/pci: Collect hot-reset devices to local buffer
    287b569a5b91 tty: add the option to have a tty reject a new ldisc
    a94a56004082 usb: gadget: function: Remove usage of the deprecated ida_simple_xx() API
    404fb6c4c842 serial: exar: adding missing CTI and Exar PCI ids
    982ae3376c4c serial: imx: Introduce timeout when waiting on transmitter empty
    1c33fd17383f MIPS: Octeon: Add PCIe link status check
    1036d3ea7a32 f2fs: don't set RO when shutting down f2fs
    7196289190d5 PCI/PM: Avoid D3cold for HP Pavilion 17 PC/1972 PCIe Ports
    6f999660a621 udf: udftime: prevent overflow in udf_disk_stamp_to_time()
    38e6a5296615 usb: typec: ucsi_glink: drop special handling for CCI_BUSY
    eba944dffe0b usb: dwc3: pci: Don't set "linux,phy_charger_detect" property on Lenovo Yoga Tab2 1380
    e151ae1ee065 Avoid hw_desc array overrun in dw-axi-dmac
    10132ccf99f4 usb: misc: uss720: check for incompatible versions of the Belkin F5U002
    eddeb8d941d5 f2fs: remove clear SB_INLINECRYPT flag in default_options
    971c3be5dbf6 usb: gadget: uvc: configfs: ensure guid to be valid before set
    ae0d1ea3e8cd kprobe/ftrace: bail out if ftrace was killed
    23afcd52af06 ext4: fix uninitialized ratelimit_state->lock access in __ext4_fill_super()
    54f514a03676 iommu/arm-smmu-v3: Free MSIs in case of ENOMEM
    89bed5c84450 power: supply: cros_usbpd: provide ID table for avoiding fallback match
    4569c9641e76 platform/x86: p2sb: Don't init until unassigned resources have been assigned
    2ff4b9a2f016 powerpc/io: Avoid clang null pointer arithmetic warnings
    f066882293b5 media: mtk-vcodec: potential null pointer deference in SCP
    23d3c898d584 media: intel/ipu6: Fix build with !ACPI
    3ad0034910a5 powerpc/pseries: Enforce hcall result buffer validity and size
    ff1de429c2b5 ALSA: hda/realtek: Add quirks for Lenovo 13X
    bdbc4ca77f5e drm/lima: mask irqs in timeout path before hard reset
    022db5d6a8bd drm/lima: add mask irq callback to gp and pp
    171f438a878e ASoC: Intel: sof_sdw: add quirk for Dell SKU 0C0F
    38bf3b41b628 ASoC: Intel: sof_sdw: add JD2 quirk for HP Omen 14
    a63054e677fd platform/x86: toshiba_acpi: Add quirk for buttons on Z830
    8f3ade4b60b6 drm/amd/display: Exit idle optimizations before HDCP execution
    d7b8159dddc8 Bluetooth: ath3k: Fix multiple issues reported by checkpatch.pl
    810e6a1da6f5 ACPI: video: Add backlight=native quirk for Lenovo Slim 7 16ARH7
    18fa9a90a0ae HID: asus: fix more n-key report descriptors if n-key quirked
    a956f64ca8d1 HID: Add quirk for Logitech Casa touchpad
    85edd783f453 wifi: mt76: mt7921s: fix potential hung tasks during chip recovery
    3f1a155950a1 netpoll: Fix race condition in netpoll_owner_active
    4882e92c8881 net: dsa: realtek: keep default LED state in rtl8366rb
    c4dbe5501ff9 kselftest: arm64: Add a null pointer check
    6d8b2c5206dd net/sched: fix false lockdep warning on qdisc root lock
    2f037b28a7bf net: sfp: add quirk for ATS SFP-GE-T 1000Base-TX module
    fa85b016a56b scsi: qedi: Fix crash while reading debugfs attribute
    76ce2f912524 drop_monitor: replace spin_lock by raw_spin_lock
    2d42aacea8cb ACPI: x86: Add PNP_UART1_SKIP quirk for Lenovo Blade2 tablets
    c572d3a92023 af_packet: avoid a false positive warning in packet_setsockopt()
    946a635b1a2e wifi: ath9k: work around memset overflow warning
    2685008a5f9a batman-adv: bypass empty buckets in batadv_purge_orig_ref()
    ef063f0f5c79 selftests/bpf: Fix flaky test btf_map_in_map/lookup_update
    5270950a3bc1 selftests/bpf: Prevent client connect before server bind in test_tc_tunnel.sh
    c5dc2d8eb398 ssb: Fix potential NULL pointer dereference in ssb_device_uevent()
    fd841ee01fb4 block/ioctl: prefer different overflow check
    3afcca7bccd0 rcutorture: Fix invalid context warning when enable srcu barrier testing
    93b7d5820296 rcutorture: Make stall-tasks directly exit when rcutorture tests end
    2e5ed1130eda rcutorture: Fix rcu_torture_one_read() pipe_count overflow comment
    9e810bd99582 io_uring/sqpoll: work around a potential audit memory leak
    b101f0bfb637 crypto: hisilicon/qm - Add the err memory release process to qm uninit
    9f21886370db crypto: hisilicon/sec - Fix memory leak for sec resource release
    7220b9795dab padata: Disable BH when taking works lock on MT path
    0eeb28d7e136 fs/writeback: bail out if there is no more inodes for IO and queued once
    c31365597a17 powerpc/uaccess: Fix build errors seen with GCC 13/14
    64ebf485c56b usb: dwc3: core: remove lock of otg mode during gadget suspend/resume to avoid deadlock
    7c76aad68f6d kselftest: Add a ksft_perror() helper
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
index dc1413ca94..8a0f850404 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4209a548f26ad97f610f6c7acfee7fabe009dd3d"
-SRCREV_meta ?= "da275b53b13faafa834352e3f9dd3f91a2c03bb8"
+SRCREV_machine ?= "4f98797a9bf5e14e9c23bb87c65ad9d0deb7e53b"
+SRCREV_meta ?= "733366844f5e114221372929392bf237fc8d823c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.35"
+LINUX_VERSION ?= "6.6.36"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index f02a9c186a..b115c21ce2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.35"
+LINUX_VERSION ?= "6.6.36"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
-SRCREV_meta ?= "da275b53b13faafa834352e3f9dd3f91a2c03bb8"
+SRCREV_machine ?= "d461ff7e19e9484f1405682275fc91889922e069"
+SRCREV_meta ?= "733366844f5e114221372929392bf237fc8d823c"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 62c0f0ab36..b48872716f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "7558103b801174f277373aa9d7d7eedf3a30d5f8"
-SRCREV_machine:qemuarm64 ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
-SRCREV_machine:qemuloongarch64 ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
-SRCREV_machine:qemumips ?= "cd21dc96adcb1d60ad6cc57446464abf4dd338fc"
-SRCREV_machine:qemuppc ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
-SRCREV_machine:qemuriscv64 ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
-SRCREV_machine:qemuriscv32 ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
-SRCREV_machine:qemux86 ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
-SRCREV_machine:qemux86-64 ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
-SRCREV_machine:qemumips64 ?= "6700dad2e55f71fea268db201a394b371ffdd78c"
-SRCREV_machine ?= "f71bb11887bae80ab718b3f38f1c1e80c07676a3"
-SRCREV_meta ?= "da275b53b13faafa834352e3f9dd3f91a2c03bb8"
+SRCREV_machine:qemuarm ?= "847d20241cd3c55e38027066bca6c87495d1c713"
+SRCREV_machine:qemuarm64 ?= "d461ff7e19e9484f1405682275fc91889922e069"
+SRCREV_machine:qemuloongarch64 ?= "d461ff7e19e9484f1405682275fc91889922e069"
+SRCREV_machine:qemumips ?= "158aceac74beabc5b189e3683fac9d1038ad96b5"
+SRCREV_machine:qemuppc ?= "d461ff7e19e9484f1405682275fc91889922e069"
+SRCREV_machine:qemuriscv64 ?= "d461ff7e19e9484f1405682275fc91889922e069"
+SRCREV_machine:qemuriscv32 ?= "d461ff7e19e9484f1405682275fc91889922e069"
+SRCREV_machine:qemux86 ?= "d461ff7e19e9484f1405682275fc91889922e069"
+SRCREV_machine:qemux86-64 ?= "d461ff7e19e9484f1405682275fc91889922e069"
+SRCREV_machine:qemumips64 ?= "2cc28c14a399c490816c6183ad3fc784e7bdda39"
+SRCREV_machine ?= "d461ff7e19e9484f1405682275fc91889922e069"
+SRCREV_meta ?= "733366844f5e114221372929392bf237fc8d823c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "5f2d0708acd0e1d2475d73c61819053de284bcc4"
+SRCREV_machine:class-devupstream ?= "61945f2f69d080a9cf2c879cb959d4648df9b94c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.35"
+LINUX_VERSION ?= "6.6.36"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


