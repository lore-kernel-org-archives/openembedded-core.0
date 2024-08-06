Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5051EC52D76
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 18:56:13 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.15072.1722970564570554821
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 11:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MygT1Jee;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7093ba310b0so426568a34.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 11:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722970564; x=1723575364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JXt0tApQpdLqfYQu/5wuzlqDCk1BTpTLMXEVp6fG3cM=;
        b=MygT1Jee6/pRCxdrvyRPPV8nGljWh6n7DvkjRP19yJNAc0ABpAJVd+KoHJUuZL6BKF
         PmExhe3RgAHQqls0uj45hzNM0IEtUrWRsh9cS4Ldc9BI5kHHG3xczfybopknjPXD9Lft
         WUaQr5GHXKyEeXtkvRoQGj/FnjDsXAsgo5zT5ruvWS/CKJBzypWM/Ph3IZYkhlVDwUyy
         PB6be0RQPgt9+AEUlMeBvU8hlrJVIayQo5wDtHeE/5sW46KmNXdCJtmlYa9h3KS0TFMU
         sndDQxjTvrc6ZayJsMTYOekHsMMKBpciPYeGC+ZigLaUCYRFHwIptHnVZG58w2pnm2Yp
         IbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722970564; x=1723575364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JXt0tApQpdLqfYQu/5wuzlqDCk1BTpTLMXEVp6fG3cM=;
        b=WdO0QCRv8c5iNJKukvm6cnG7M8Mw7chCWygQYJ8U92tvy/SudEY4vEArbTqMwWsuY3
         kgwWtR1jftvCgW6Ih1C9t3xd9qejmNPVAxu3D6KwfuhXcRCrd9prF4bTqIJLtK9UV9fi
         VFWXcHaqaVveoKitlbIYrK2/FwYLXGUxU/HEWTLFKbwZlth1HMC2EYyhnUjNZAUQ8efP
         4XBbzCAt2dQ5OrpLbvPzTBxWbPSW2F5r9DGWAwkeRjTmWPekERQySgimzXJkveUAD/Ji
         y6Cjw2qXvFFDjPNtdeHSDq9hZl+FJIbRwlkMnI6+dhnNRYAxGKW29QTNA8DAkTdY8c3c
         XVuA==
X-Gm-Message-State: AOJu0Yx3McV2Ex/sdQ43+V4/85LedpIWyOLvpHKbVN93PNUWBMHNLTyf
	PxfqcL4i/6vTeR3JI6/MUMcVzuiX844IWDd2vqN1ZYrlkXWFFtizr26kxSpL
X-Google-Smtp-Source: AGHT+IF7uJ5N1k7b1Egfp4vZ5wqSlTzAcneAuuRPTaKuAL7ugEYfSnWlTL8ZVlzZaXn0zRYml+w8/A==
X-Received: by 2002:a05:6830:6a98:b0:708:29dc:d2fc with SMTP id 46e09a7af769-709b3244ac6mr18363076a34.19.1722970563149;
        Tue, 06 Aug 2024 11:56:03 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a34f6ebcd3sm481988185a.42.2024.08.06.11.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 11:56:02 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/8] linux-yocto/6.10: update to v6.10.3
Date: Tue,  6 Aug 2024 14:55:50 -0400
Message-Id: <d83ce1ec7d8930b1704c1cb7296e00b7e7386d54.1722970092.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1722970092.git.bruce.ashfield@gmail.com>
References: <cover.1722970092.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 18:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203043

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.10 to the latest korg -stable release that comprises
the following commits:

    d29de02effd4e Linux 6.10.3
    979185d6ddfea selftests/bpf: DENYLIST.aarch64: Skip fexit_sleep again
    bc8ccc1f1e079 selinux,smack: remove the capability checks in the removexattr hooks
    bb6841f96eb6f powerpc/configs: Update defconfig with now user-visible CONFIG_FSL_IFC
    1861a571928cc perf dso: Fix build when libunwind is enabled
    6a424ef14fbcb wifi: ath12k: fix mbssid max interface advertisement
    767d55c3f571c fs: don't allow non-init s_user_ns for filesystems without FS_USERNS_MOUNT
    70a449b162c4f i3c: mipi-i3c-hci: Fix number of DAT/DCT entries for HCI versions < 1.1
    70100fe721840 nvme-pci: add missing condition check for existence of mapped data
    7b2384f7ebbf6 apparmor: unpack transition table if dfa is not present
    ac2d19b9ba6c8 ublk: fix UBLK_CMD_DEL_DEV_ASYNC handling
    697d7ca75d581 io_uring: fix io_match_task must_hold
    58b067d997c61 thermal: core: Back off when polling thermal zones on errors
    4530d81ef57aa thermal: trip: Split thermal_zone_device_set_mode()
    d5fe884ce28c5 iommu: sprd: Avoid NULL deref in sprd_iommu_hw_en
    0ac864075fc8b s390/cpum_cf: Fix endless loop in CF_DIAG event stop
    6a54c9737a843 s390/setup: Fix __pa/__va for modules under non-GPL licenses
    7368a86b8a3be s390/pci: Allow allocation of more than 1 MSI interrupt
    943270570f637 s390/pci: Refactor arch_setup_msi_irqs()
    dd296402e6816 ceph: fix incorrect kmalloc size of pagevec mempool
    00a60bdabefe0 timers/migration: Do not rely always on group->parent
    51be301d29d67 ASoC: TAS2781: Fix tasdev_load_calibrated_data()
    1978d917827fa ASoC: Intel: use soc_intel_is_byt_cr() only when IOSF_MBI is reachable
    70500f4fce354 drm/xe/pf: Limit fair VF LMEM provisioning
    fa1c57d10700d drm/xe/exec: Fix minor bug related to xe_sync_entry_cleanup
    eade3b0867db8 spi: spidev: add correct compatible for Rohm BH2228FV
    16f6a58b99763 ASoC: sof: amd: fix for firmware reload failure in Vangogh platform
    7988f28990117 ASoC: Intel: Fix RT5650 SSP lookup
    e68262dcf45c3 ASOC: SOF: Intel: hda-loader: only wait for HDaudio IOC for IPC4 devices
    4c61ee99eb972 nvme-pci: Fix the instructions for disabling power management
    45e03d35229b6 spi: microchip-core: ensure TX and RX FIFOs are empty at start of a transfer
    65850e52a7e3b spi: microchip-core: fix init function not setting the master and motorola modes
    263b6c23e1ffd spi: microchip-core: only disable SPI controller when register value change requires it
    0fe4960783942 spi: microchip-core: defer asserting chip select until just before write to TX FIFO
    1504fb528742d spi: microchip-core: fix the issues in the isr
    aa650d0a0b535 ASoC: SOF: imx8m: Fix DSP control regmap retrieval
    5c19062372bb6 auxdisplay: ht16k33: Drop reference after LED registration
    47ff960f0e460 lirc: rc_dev_get_from_fd(): fix file leak
    c8f1f53d13c44 powerpc: fix a file leak in kvm_vcpu_ioctl_enable_cap()
    46c17ead5b738 apparmor: Fix null pointer deref when receiving skb during sock creation
    7e4a539bca7d8 mISDN: Fix a use after free in hfcmulti_tx()
    35dd37536e2e0 xsk: Require XDP_UMEM_TX_METADATA_LEN to actuate tx_metadata_len
    ec4eea14d75f7 bpf: Fix a segment issue when downgrading gso_size
    af6bd5c9901b1 net: mediatek: Fix potential NULL pointer dereference in dummy net_device handling
    a13d3864b76ac net: nexthop: Initialize all fields in dumped nexthops
    fa938b04359f0 net: stmmac: Correct byte order of perfect_match
    dd66c60645ff0 selftests: forwarding: skip if kernel not support setting bridge fdb learning limit
    2abe350db1aa5 tipc: Return non-zero value from tipc_udp_addr2str() on error
    a939f3f9975b3 netfs: Fix writeback that needs to go to both server and cache
    c8f36af07025c netfilter: nft_set_pipapo_avx2: disable softinterrupts
    0c69f4777924f ice: Fix recipe read procedure
    b3892898d0ea8 net: bonding: correctly annotate RCU in bond_should_notify_peers()
    7cdbc23424d7b ipv4: Fix incorrect source address in Record Route option
    44f83b7e45ae8 MIPS: SMP-CPS: Fix address for GCR_ACCESS register for CM3 and later
    ba61d9ecc604b tools/resolve_btfids: Fix comparison of distinct pointer types warning in resolve_btfids
    2188279e6b2a3 bpf, events: Use prog to emit ksymbol event for main program
    22094f5f52e7b dma: fix call order in dmam_free_coherent
    1c939f94571b9 af_unix: Disable MSG_OOB handling for sockets in sockmap/sockhash
    8fa2d3427f98c libbpf: Fix no-args func prototype BTF dumping syntax
    db35552a6ffee selftests/bpf: fexit_sleep: Fix stack allocation for arm64
    fce48882dfbc8 kbuild: avoid build error when single DTB is turned into composite DTB
    1cb5934cc0962 f2fs: fix to update user block counts in block_operations()
    381cbe85592c7 f2fs: fix null reference error when checking end of zone
    e0671f99ae6ef watchdog: rzg2l_wdt: Check return status of pm_runtime_put()
    a70c141e8fefb watchdog: rzg2l_wdt: Use pm_runtime_resume_and_get()
    59b0fd36ec285 f2fs: fix start segno of large section
    42b15c72db065 um: time-travel: fix signal blocking race/hang
    336370d5bfbd3 arch: um: rust: Use the generated target.json again
    a79c2099928e2 um: time-travel: fix time-travel-start option
    2025dce49a06f phy: zynqmp: Enable reference clock correctly
    57a05c3a891cb phy: cadence-torrent: Check return value on register read
    a1e10962e8dfc phy: phy-rockchip-samsung-hdptx: Select CONFIG_MFD_SYSCON
    2f32c3f818537 dmaengine: ti: k3-udma: Fix BCHAN count with UHC and HC channels
    6aa6892a90a5a jfs: Fix array-index-out-of-bounds in diFree
    7b27de0d27e41 kdb: Use the passed prompt in kdb_position_cursor()
    9711067017a23 kdb: address -Wformat-security warnings
    cda36155fc458 phy: qcom: qmp-pcie: restore compatibility with existing DTs
    3ba0ae885215b f2fs: fix to truncate preallocated blocks in f2fs_file_open()
    7b4219d0212ad minmax: scsi: fix mis-use of 'clamp()' in sr.c
    356270ed4de41 Bluetooth: btusb: Add Realtek RTL8852BE support ID 0x13d3:0x3591
    692cca98456d5 Bluetooth: btusb: Add RTL8852BE device 0489:e125 to device tables
    dd2353f158999 rbd: don't assume RBD_LOCK_STATE_LOCKED for exclusive mappings
    a049f7a09d440 rbd: rename RBD_LOCK_STATE_RELEASING and releasing_wait
    c600e6de0cd09 drm/panfrost: Mark simple_ondemand governor as softdep
    916dbd422213c drm/etnaviv: don't block scheduler when GPU is still active
    541dbf8735338 MIPS: Loongson64: Test register availability before use
    8131b5046e703 MIPS: Loongson64: reset: Prioritise firmware service
    82016fa2f209a MIPS: Loongson64: Remove memory node for builtin-dtb
    519a900ad3e0b MIPS: Loongson64: env: Hook up Loongsson-2K
    840db5d790035 MIPS: dts: loongson: Fix GMAC phy node
    b721ae74eb7f9 MIPS: ip30: ip30-console: Add missing include
    ed987a5ca7792 MIPS: dts: loongson: Add ISA node
    e63a9e5475ab2 remoteproc: imx_rproc: Fix refcount mistake in imx_rproc_addr_init
    c877a5f5268d4 remoteproc: imx_rproc: Skip over memory region when node value is NULL
    3a18cb4c711f9 remoteproc: stm32_rproc: Fix mailbox interrupts queuing
    ebdee076e6e08 rbd: don't assume rbd_is_lock_owner() for exclusive mappings
    a59633f6a6aa9 dm-verity: fix dm_is_verity_target() when dm-verity is builtin
    9d8d95b10e614 selftests/sigaltstack: Fix ppc64 GCC build
    bbf2c94503f6a crypto: ccp - Fix null pointer dereference in __sev_snp_shutdown_locked
    ee39384ee787e RDMA/iwcm: Fix a use-after-free related to destroying CM IDs
    378a9d51afc17 platform: mips: cpu_hwmon: Disable driver on unsupported hardware
    774ffcb28cd96 ASoC: SOF: ipc4-topology: Use correct queue_id for requesting input pin format
    60609323f1328 ASoC: codecs: wcd939x: Fix typec mux and switch leak during device removal
    9aa5b0f19cc88 bus: mhi: ep: Do not allocate memory for MHI objects from DMA zone
    1bbbaddb25cd7 watchdog/perf: properly initialize the turbo mode timestamp and rearm counter
    5570209a6551b rtc: abx80x: Fix return value of nvmem callback on read
    c30b42b558880 rtc: isl1208: Fix return value of nvmem callbacks
    10a93cc4ec9a9 drm/i915/dp: Don't switch the LTTPR mode on an active link
    7d6971bfe1df3 drm/i915/dp: Reset intel_dp->link_trained before retraining the link
    9f33d44ab5ef5 drm/amd/amdgpu: Fix uninitialized variable warnings
    9bf1a4e3d4be4 drm/amdgpu: add missed harvest check for VCN IP v4/v5
    fa717750ecf18 drm/amdgpu: reset vm state machine after gpu reset(vram lost)
    972dd51f1857b drm/dp_mst: Fix all mstb marked as not probed after suspend/resume
    60887a89986f0 drm/udl: Remove DRM_CONNECTOR_POLL_HPD
    09a67694edd1f drm/amdgpu/sdma5.2: Update wptr registers as well as doorbell
    1a802eaa152b8 drm/i915/gt: Do not consider preemption during execlists_dequeue for gen8
    a9e7274166a70 perf/x86/intel/pt: Fix a topa_entry base address calculation
    9e00108f122c0 perf/x86/intel/pt: Fix topa_entry base length
    97ad12b9b6e69 perf/x86/intel/ds: Fix non 0 retire latency on Raptorlake
    cfb00bcd61533 perf/x86/intel/uncore: Fix the bits of the CHA extended umask for SPR
    3293f2dd0921b perf stat: Fix the hard-coded metrics calculation on the hybrid
    f34d8307a73a1 perf: Fix event leak upon exec and file release
    3d7a63352a93b perf: Fix event leak upon exit
    3eac973eb5cb2 scsi: qla2xxx: validate nvme_local_port correctly
    36fdc5319c4d0 scsi: qla2xxx: Complete command early within lock
    1e6aca8f07f1e scsi: qla2xxx: Fix flash read failure
    5b1ed6e6f2df1 scsi: qla2xxx: Reduce fabric scan duplicate code
    1e39d28440095 scsi: qla2xxx: Use QP lock to search for bsg
    8192c533e89d9 scsi: qla2xxx: Fix for possible memory corruption
    50ed642a860ff scsi: qla2xxx: Unable to act on RSCN for port online
    b35d6d5a2f386 scsi: qla2xxx: During vport delete send async logout explicitly
    81079920f1163 scsi: lpfc: Allow DEVICE_RECOVERY mode after RSCN receipt if in PRLI_ISSUE state
    7816a528add16 rtc: cmos: Fix return value of nvmem callbacks
    5fdb0de5465b7 mm/numa_balancing: teach mpol_to_str about the balancing mode
    f8ae38f1dfe65 irqchip/imx-irqsteer: Handle runtime power management correctly
    0a1230db5d67e md/raid1: set max_sectors during early return from choose_slow_rdev()
    3a7f23e1d81ce irqdomain: Fixed unbalanced fwnode get and put
    95065edb8ebb2 devres: Fix memory leakage caused by driver API devm_free_percpu()
    c885ca965a4cf devres: Fix devm_krealloc() wasting memory
    205dfd57a8ee5 dt-bindings: phy: qcom,qmp-usb: fix spelling error
    292081c4e7f57 ice: Add a per-VF limit on number of FDIR filters
    edd21c8a929f9 gve: Fix an edge case for TSO skb validity check
    d4663536754de kobject_uevent: Fix OOB access within zap_modalias_env()
    78672d49d3eeb arm64: mm: Fix lockless walks with static and dynamic page-table folding
    00a2ac6c89ebe ASoC: amd: yc: Support mic on Lenovo Thinkpad E16 Gen 2
    834188d88a806 ASoC: SOF: ipc4-topology: Preserve the DMA Link ID for ChainDMA on unprepare
    5eca92031ffe2 ASoC: SOF: ipc4-topology: Only handle dai_config with HW_PARAMS for ChainDMA
    4a9a52b70cce1 alloc_tag: outline and export free_reserved_page()
    a1e78bf940c4c kbuild: Fix '-S -c' in x86 stack protector scripts
    8a83f0e5dda0e decompress_bunzip2: fix rare decompression failure
    96b74765425c5 mm: fix old/young bit handling in the faulting path
    f5418f48a93b6 block: fix deadlock between sd_remove & sd_release
    b7c51fb4c16ba clk: samsung: fix getting Exynos4 fin_pll rate from external clocks
    154d33dc8de81 ubi: eba: properly rollback inside self_check_eba
    f6386c256b79b clk: davinci: da8xx-cfgchip: Initialize clk_init_data before use
    366c3f688dd02 nilfs2: handle inconsistent state in nilfs_btnode_create_block()
    9e5f087b81a71 dmaengine: fsl-edma: change the memory access from local into remote mode in i.MX 8QM
    bd9b941078bc4 f2fs: use meta inode for GC of COW file
    0ecfe3974b216 f2fs: use meta inode for GC of atomic file
    1e7725814361c f2fs: fix return value of f2fs_convert_inline_inode()
    2434344559f67 f2fs: fix to don't dirty inode for readonly filesystem
    2ea700595158b f2fs: fix to force buffered IO on inline_data inode
    af466037fa2b2 ASoC: fsl: fsl_qmc_audio: Check devm_kasprintf() returned value
    a28fe9105fee4 scsi: qla2xxx: Return ENOBUFS if sg_cnt is more than one for ELS cmds
    0a4ae2644e2a3 fs/ntfs3: Update log->page_{mask,bits} if log->page_size changed
    830dc86a29312 mm/page_alloc: fix pcp->count race between drain_pages_zone() vs __rmqueue_pcplist()
    49b22e06a9477 erofs: fix race in z_erofs_get_gbuf()
    242cda6c45a09 efi/libstub: Zero initialize heap allocated struct screen_info
    5a9a5f39376ff hostfs: fix dev_t handling
    7789a1d6792af dev/parport: fix the array out-of-bounds risk
    d9954d47c73bf xhci: Apply XHCI_RESET_TO_DEFAULT quirk to TGL
    4130526f7a8d8 binder: fix hang of unregistered readers
    23c57a7c88b05 PCI: loongson: Enable MSI in LS7A Root Complex
    b27d26d07b187 PCI: rockchip: Use GPIOD_OUT_LOW flag while requesting ep_gpio
    bf50d38243989 PCI: dw-rockchip: Fix initial PERST# GPIO value
    bfb58cc86e49d PCI: hv: Return zero, not garbage, when reading PCI_INTERRUPT_PIN
    b16f3ea1db47a PCI/DPC: Fix use-after-free on concurrent DPC and hot-removal
    43c6b8d369d8f parisc: Fix warning at drivers/pci/msi/msi.h:121
    985d3c869aa6c hwrng: amd - Convert PCIBIOS_* return codes to errnos
    96852136af638 drm/fbdev-dma: Fix framebuffer mode for big endian devices
    d0facbb37293a fbdev: vesafb: Detect VGA compatibility from screen info's VESA attributes
    4b89bfaefb5fe tools/memory-model: Fix bug in lock.cat
    11f4a6d2740bc ALSA: usb-audio: Add a quirk for Sonix HD USB Camera
    590c9a623ab39 ALSA: usb-audio: Move HD Webcam quirk to the right place
    67f2807608604 ALSA: usb-audio: Fix microphone sound on HD webcam.
    fcb2fa8f500f5 ALSA: ump: Force 1 Group for MIDI1 FBs
    d40ff156254f4 ALSA: ump: Don't update FB name for static blocks
    2afaf0b52fb12 ALSA: firewire-lib: fix wrong value as length of header for CIP_NO_HEADER case
    2da6a98422a81 ALSA: hda/realtek: cs35l41: Fixup remaining asus strix models
    be7486f6e0d02 KVM: nVMX: Fold requested virtual interrupt check into has_nested_events()
    65d5d97e753a5 KVM: nVMX: Check for pending posted interrupts when looking for nested events
    b75e89946e9c5 KVM: nVMX: Request immediate exit iff pending nested event needs injection
    0c6c9421b0afd KVM: nVMX: Add a helper to get highest pending from Posted Interrupt vector
    a8ab69cf6f432 KVM: VMX: Split out the non-virtualization part of vmx_interrupt_blocked()
    a849f058f1be1 KVM: PPC: Book3S HV nestedv2: Add DPDES support in helper library for Guest state buffer
    86abaf9d6c984 KVM: PPC: Book3S HV nestedv2: Fix doorbell emulation
    a70fcc748d41e remoteproc: mediatek: Increase MT8188/MT8195 SCP core0 DRAM size
    da24c4dc87d1d media: ivsc: csi: don't count privacy on as error
    f083de7ff8f6b media: uvcvideo: Fix integer overflow calculating timestamp
    54f56ba4829a8 jbd2: avoid infinite transaction commit loop
    ceee029e76dad jbd2: precompute number of transaction descriptor blocks
    428f8371d09c3 jbd2: make jbd2_journal_get_max_txn_bufs() internal
    5ab6ac4e9e165 media: imx-pxp: Fix ERR_PTR dereference in pxp_probe()
    7b17fbfe4fd6b media: i2c: alvium: Move V4L2_CID_GAIN to V4L2_CID_ANALOG_GAIN
    08e5adac54e89 media: ivsc: csi: add separate lock for v4l2 control handler
    ea916691a4b00 leds: mt6360: Fix memory leak in mt6360_init_isnk_properties()
    8f4acacd20671 leds: triggers: Flush pending brightness before activating trigger
    5600d6013c634 md/md-bitmap: fix writing non bitmap pages
    e9ad5a675cba2 leds: ss4200: Convert PCIBIOS_* return codes to errnos
    fdcadf496f09e drivers: soc: xilinx: check return status of get_api_version()
    86d03934a5d61 cpufreq: qcom-nvmem: fix memory leaks in probe error paths
    02253054b4f96 wifi: rtw88: usb: Further limit the TX aggregation
    77911a765209d wifi: rtw88: usb: Fix disconnection after beacon loss
    2d3673643a62d wifi: rtw89: fix HW scan not aborting properly
    c2b75b4e483a1 wifi: mwifiex: Fix interface type change
    a2fa4c058a7c1 genirq: Set IRQF_COND_ONESHOT in request_irq()
    cf4a37d14ccd6 trace/pid_list: Change gfp flags in pid_list_fill_irq()
    c2ed4dd5e341d io_uring: don't allow netpolling with SETUP_IOPOLL
    4d909285f6d28 io_uring: tighten task exit cancellations
    2a03e99ff9421 io_uring: fix lost getsockopt completions
    299bc6ffa57e0 ext4: make sure the first directory block is not a hole
    cdd3453216990 ext4: check dot and dotdot of dx_root before making dir indexed
    68afb02d219e6 block: check bio alignment in blk_mq_submit_bio
    550cc6a4dc25e m68k: amiga: Turn off Warp1260 interrupts during boot
    8ca170c39eca7 udf: Avoid using corrupted block bitmap buffer
    ed88f19eba215 task_work: Introduce task_work_cancel() again
    012e110c7dc70 task_work: s/task_work_cancel()/task_work_cancel_func()/
    f8533c194141b cifs: mount with "unix" mount option for SMB1 incorrectly handled
    08e863bd57908 cifs: fix reconnect with SMB1 UNIX Extensions
    3739d711246d8 cifs: fix potential null pointer use in destroy_workqueue in init_cifs error path
    fde89bb85457a apparmor: use kvfree_sensitive to free data->data
    185616085b12e drm/amd/display: Check for NULL pointer
    79bc42a9f5866 scsi: qla2xxx: Fix optrom version displayed in FDMI
    5afbbe7a5535f drm/amd/display: fix corruption with high refresh rates on DCN 3.0
    475a5b3b7c8ed drm/gma500: fix null pointer dereference in psb_intel_lvds_get_modes
    977ee4fe895e1 drm/gma500: fix null pointer dereference in cdv_intel_lvds_get_modes
    fc7c4b8ec9d64 io_uring/io-wq: limit retrying worker initialisation
    e71327a647a58 lsm: fixup the inode xattr capability handling
    40d7f363196c1 media: i2c: Kconfig: Fix missing firmware upload config select
    f1834feb25770 ext2: Verify bitmap and itable block numbers before using them
    d3493d6f0dfb1 hfs: fix to initialize fields of hfs_inode_info after hfs_alloc_inode()
    c7e2f43d182f5 sysctl: always initialize i_uid/i_gid
    1005f8300593e ata: libata-scsi: Honor the D_SENSE bit for CK_COND=1 and no error
    67d9d0b6ae4aa ata: libata-scsi: Do not overwrite valid sense data when CK_COND=1
    6a96041659e83 media: venus: fix use after free in vdec_close
    9e0ad66cc78dd char: tpm: Fix possible memory leak in tpm_bios_measurements_open()
    d7f3e486b8f03 tpm_tis_spi: add missing attpm20p SPI device ID entry
    9291f9de77e10 selftests/nolibc: fix printf format mismatch in expect_str_buf_eq()
    1477bafd7df4f ata: libata-scsi: Fix offsets for the fixed format sense data
    4a534f9550215 null_blk: Fix description of the fua parameter
    d2abd36ce8b7d media: stm32: dcmipp: correct error handling in dcmipp_create_subdevs
    e20f9e50dced0 md/raid5: fix spares errors about rcu usage
    794964ac11ffe fuse: verify {g,u}id mount options correctly
    054dc05f57694 sched/fair: set_load_weight() must also call reweight_task() for SCHED_IDLE tasks
    f035d08e8ce2d wifi: mac80211: chanctx emulation set CHANGE_CHANNEL when in_reconfig
    2dd958fa9f31f NFSD: Support write delegations in LAYOUTGET
    8bb69cbc32d69 drm/xe: Use write-back caching mode for system memory on DGFX
    e1523d1372339 ipv6: take care of scope when choosing the src addr
    a9e9686a84fac ipv4: fix source address selection with route leak
    ce1268b5adbe2 ipv6: fix source address selection with route leak
    ebb124228eb57 kernel: rerun task_work while freezing in get_signal()
    b7859ff398b6b btrfs: fix extent map use-after-free when adding pages to compressed bio
    bf55c43fcf436 workqueue: Always queue work items to the newest PWQ for order workqueues
    66f23a7b5174b af_packet: Handle outgoing VLAN packets without hardware offloading
    c18191ae468fc net: netconsole: Disable target before netpoll cleanup
    2cdab4b4bf773 tick/broadcast: Make takeover of broadcast hrtimer reliable
    4eb577144b6f6 dt-bindings: thermal: correct thermal zone node name limit
    1535254fa4b38 thermal/drivers/broadcom: Fix race between removal and clock disable
    1d1970493c289 exfat: fix potential deadlock on __exfat_get_dentry_set
    4615095f17abb Revert "firewire: Annotate struct fw_iso_packet with __counted_by()"
    0099736d7effc x86/efistub: Revert to heap allocated boot_params for PE entrypoint
    436d1595fa8de x86/efistub: Avoid returning EFI_SUCCESS on error
    891d90ab1fe59 mm/mglru: fix ineffective protection calculation
    e7767066d5d76 mm/mglru: fix overshooting shrinker memory
    9f72d8703dd6a mm: mmap_lock: replace get_memcg_path_buf() with on-stack buffer
    a39e38be632f0 mm/mglru: fix div-by-zero in vmpressure_calc_level()
    8e157c8421daa mm/hugetlb: fix possible recursive locking detected warning
    eebc67ae0b224 hugetlb: force allocating surplus hugepages on mempolicy allowed nodes
    e60f62f75c997 mm/huge_memory: avoid PMD-size page cache if needed
    7e1f4efb8d614 mm: huge_memory: use !CONFIG_64BIT to relax huge page alignment on 32 bit machines
    b14cc2cf313bd landlock: Don't lose track of restrictions on cred_transfer
    f7b9c501b548b selftests/landlock: Add cred_transfer test
    11fa625b45faf mailbox: mtk-cmdq: Move devm_mbox_controller_register() after devm_pm_runtime_enable()
    131c294b77576 mailbox: imx: fix TXDB_V2 channel race condition
    fbe0fa41d8da7 mailbox: omap: Fix mailbox interrupt sharing
    b6273c184d09e remoteproc: k3-r5: Fix IPC-only mode detection
    8fea24a25cd93 remoteproc: mediatek: Don't attempt to remap l1tcm memory if missing
    f3af305fd8c59 power: supply: ingenic: Fix some error handling paths in ingenic_battery_get_property()
    ce8bf8b992192 power: supply: ab8500: Fix error handling when calling iio_read_channel_processed()
    773e7fd311ed1 LoongArch: Check TIF_LOAD_WATCH to enable user space watchpoint
    420837d08cc2c sbitmap: fix io hung due to race on sbitmap_word::cleared
    215553c3c3db1 alloc_tag: fix page_ext_get/page_ext_put sequence during page splitting
    24b39c0ca836e lib: reuse page_ext_data() to obtain codetag_ref
    fba302603cea3 lib: add missing newline character in the warning message
    68d4c3722290a s390/dasd: fix error checks in dasd_copy_pair_store()
    06219163d24fb powerpc/8xx: fix size given to set_huge_pte_at()
    973850dd83b62 md-cluster: fix hanging issue while a new disk adding
    ff9400d32183b fs/ntfs3: Keep runs for $MFT::$ATTR_DATA and $MFT::$ATTR_BITMAP
    73e38cb683679 fs/ntfs3: Missed error return
    2e83375fd95b8 fs/ntfs3: Fix the format of the "nocase" mount option
    6af0ce7182e92 rtc: interface: Add RTC offset to alarm after fix-up
    31be02ef4e54a nilfs2: avoid undefined behavior in nilfs_cnt32_ge macro
    45475cbe0cc7d selftests/damon/access_memory: use user-defined region size
    16a767c96902e fs/proc/task_mmu: properly detect PM_MMAP_EXCLUSIVE per page of PMD-mapped THPs
    65c52a91e3998 fs/proc/task_mmu: don't indicate PM_MMAP_EXCLUSIVE without PM_PRESENT
    680f6ceee867d fs/proc/task_mmu: indicate PM_FILE for PMD-mapped file THP
    ce8c54d360df7 pinctrl: renesas: r8a779g0: Fix TPU suffixes
    d6452ef3a6e31 pinctrl: renesas: r8a779g0: Fix TCLK suffixes
    488f0a526df05 pinctrl: renesas: r8a779g0: FIX PWM suffixes
    91bbe8e304092 pinctrl: renesas: r8a779g0: Fix IRQ suffixes
    42c06e713fcad pinctrl: renesas: r8a779g0: Fix (H)SCIF3 suffixes
    f634a01daf92a pinctrl: renesas: r8a779g0: Fix (H)SCIF1 suffixes
    f20026c237746 pinctrl: renesas: r8a779g0: Fix FXR_TXEN[AB] suffixes
    6474ac2f334b4 pinctrl: renesas: r8a779g0: Fix CANFD5 suffix
    500295cdc5247 rtc: tps6594: Fix memleak in probe
    c41eadba18049 fs/ntfs3: Fix field-spanning write in INDEX_HDR
    d7d3cbb23136a fs/ntfs3: Drop stray '\' (backslash) in formatting string
    8e0f398c6f5c3 fs/ntfs3: Correct undo if ntfs_create_inode failed
    d5ad80aabd5a7 fs/ntfs3: Replace inode_trylock with inode_lock
    33d8dfc0bdaf9 pinctrl: freescale: mxs: Fix refcount of child
    b3c0850f871c4 pinctrl: ti: ti-iodelay: fix possible memory leak when pinctrl_enable() fails
    d90085d566a9b pinctrl: single: fix possible memory leak when pinctrl_enable() fails
    272b9b8e9b7af pinctrl: core: fix possible memory leak when pinctrl_enable() fails
    065d1ee1a0c8d pinctrl: rockchip: update rk3308 iomux routes
    edfef987bc5c8 fs/ntfs3: Add missing .dirty_folio in address_space_operations
    0bbd61e1ac77f fs/ntfs3: Fix getting file type
    2f7236ba9f7c5 fs/ntfs3: Missed NI_FLAG_UPDATE_PARENT setting
    539bd10ab6539 fs/ntfs3: Deny getting attr data block in compressed frame
    ff73b9187376d fs/ntfs3: Fix transform resident to nonresident for compressed files
    a62241fb49ac1 fs/ntfs3: Merge synonym COMPRESSION_UNIT and NTFS_LZNT_CUNIT
    1fd2bf31aa542 net: dsa: b53: Limit chip-wide jumbo frame config to CPU ports
    ea59437fe8aa4 net: dsa: mv88e6xxx: Limit chip-wide frame size config to CPU ports
    bc410a24a99c2 ipv4: Fix incorrect TOS in fibmatch route get reply
    3ff2e0a82532b ipv4: Fix incorrect TOS in route get reply
    c5d21aabf1b31 net: flow_dissector: use DEBUG_NET_WARN_ON_ONCE
    c62bf09262c5e gve: Fix XDP TX completion handling when counters overflow
    c420cd5d5bc67 ipvs: properly dereference pe in ip_vs_add_service
    8058c88ac0df2 netfilter: nf_set_pipapo: fix initial map fill
    74de442b8e12a netfilter: ctnetlink: use helper function to calculate expect ID
    487ded1dbb0c4 MIPS: Fix fallback march for SB1
    d2aea330f4de1 RDMA/mana_ib: Set correct device into ib
    03ab92bb185c6 RDMA/mana_ib: set node_guid
    79dc0c2200cf4 bnxt_re: Fix imm_data endianness
    abd9c8843cbc1 RDMA: Fix netdev tracker in ib_device_set_netdev
    e1640fed0377b crypto: mxs-dcp - Ensure payload is zero when using key slot
    133a2823a9ba2 iommu/vt-d: Fix identity map bounds in si_domain_init()
    97204e45721f3 RDMA/hns: Fix mbx timing out before CMD execution is completed
    16c003fa616d2 RDMA/hns: Fix insufficient extend DB for VFs.
    d0aa92bd8111b RDMA/hns: Fix undifined behavior caused by invalid max_sge
    f169b6243032e RDMA/hns: Fix shift-out-bounds when max_inline_data is 0
    ecdf900a5a337 RDMA/hns: Fix missing pagesize and alignment check in FRMR
    6dbec7322f620 RDMA/hns: Fix unmatch exception handling when init eq table fails
    06580b33c183c RDMA/hns: Fix soft lockup under heavy CEQE load
    9b812436f03e3 RDMA/hns: Check atomic wr length
    9210853b0c529 macintosh/therm_windtunnel: fix module unload.
    dd479933722ec powerpc/xmon: Fix disassembly CPU feature checks
    7e686c35fad0c iommu/vt-d: Fix aligned pages in calculate_psi_aligned_address()
    497a8fdd1e5c1 iommu/vt-d: Limit max address mask to MAX_AGAW_PFN_WIDTH
    a08b8b144cc79 PCI: dwc: Fix index 0 incorrectly being interpreted as a free ATU slot
    66363bc6ff3eb PCI: qcom-ep: Disable resources unconditionally during PERST# assert
    aceabb0c074a2 MIPS: Octeron: remove source file executable bit
    f6f2e9c208a65 clk: en7523: fix rate divider for slic and spi clocks
    b5bdb36e7ccf9 clk: qcom: Park shared RCGs upon registration
    3717b094aa727 clk: qcom: gcc-x1e80100: Set parent rate for USB3 sec and tert PHY pipe clks
    a3889e012f7df clk: qcom: kpss-xcc: Return of_clk_add_hw_provider to transfer the error
    8a2694a0cad71 crypto: qat - extend scope of lock in adf_cfg_add_key_value_param()
    728ca88a7e982 nvmem: rockchip-otp: set add_legacy_fixed_of_cells config option
    9fd003f344d50 scsi: lpfc: Revise lpfc_prep_embed_io routine with proper endian macro usages
    e9164903b8b30 net: missing check virtio
    eab96e8716cbf vhost/vsock: always initialize seqpacket_allow
    55237ec25ed59 PCI: endpoint: Fix error handling in epf_ntb_epc_cleanup()
    b9e8695246bcf PCI: endpoint: Clean up error handling in vpci_scan_bus()
    4275b46b75731 iommu/arm-smmu-qcom: Register the TBU driver in qcom_smmu_impl_init
    b1173d64edd27 ASoC: amd: Adjust error handling in case of absent codec device
    1f2ff6935b6de eeprom: ee1004: Call i2c_new_scanned_device to instantiate thermal sensor
    49c9945c054df kvm: s390: Reject memory region operations for ucontrol VMs
    a5c15a78c0e16 dm-raid: Fix WARN_ON_ONCE check for sync_thread in raid_resume
    298feddffbfc3 clk: qcom: gcc-x1e80100: Fix halt_check for all pipe clocks
    899bb519f2a9e Input: elan_i2c - do not leave interrupt disabled on suspend failure
    4adabd438382d RDMA/device: Return error earlier if port in not valid
    e4e11a6ed2a8a mtd: make mtd_test.c a separate module
    0036f27f2a7b4 iommufd/iova_bitmap: Check iova_bitmap_done() after set ahead
    1d779d0e4e8fe iommufd/selftest: Fix tests to use MOCK_PAGE_SIZE based buffer sizes
    b06d34eb8fcd9 iommufd/selftest: Add tests for <= u8 bitmap sizes
    73dc9fb2b38de iommufd/selftest: Fix iommufd_test_dirty() to handle <u8 bitmaps
    2355c5321732f iommufd/selftest: Fix dirty bitmap tests with u8 bitmaps
    57a6e7619ceac ASoC: max98088: Check for clk_prepare_enable() error
    cc3c0d2784be5 powerpc/prom: Add CPU info to hardware description string later
    c2fa93051fdcd hwrng: core - Fix wrong quality calculation at hw rng registration
    45b2a23e00d44 scsi: lpfc: Fix a possible null pointer dereference
    577eac91b2a2b ASoC: qcom: Adjust issues in case of DT error in asoc_qcom_lpass_cpu_platform_probe()
    498766fc3e51f RDMA/rxe: Don't set BTH_ACK_MASK for UC or UD QPs
    c2ac6edfc9199 RDMA/mlx5: Use sq timestamp as QP timestamp when RoCE is disabled
    a6366755586de RDMA/mlx4: Fix truncated output warning in alias_GUID.c
    40ef9b895119f RDMA/mlx4: Fix truncated output warning in mad.c
    9569c97b3c7ea Input: qt1050 - handle CHIP_ID reading error
    fa2eb7920e590 interconnect: qcom: qcm2290: Fix mas_snoc_bimc RPM master ID
    c916004860b65 clk: qcom: gpucc-sa8775p: Update wait_val fields for GPU GDSC's
    6c0a1938183a4 clk: qcom: gpucc-sa8775p: Park RCG's clk source at XO during disable
    f6896514c5edd clk: qcom: gpucc-sa8775p: Remove the CLK_IS_CRITICAL and ALWAYS_ON flags
    0e3c462b1472b clk: qcom: gcc-sa8775p: Update the GDSC wait_val fields and flags
    6b8a9b71629ef clk: qcom: gpucc-sm8350: Park RCG's clk source at XO during disable
    0fcc48494a1e3 mtd: spi-nor: winbond: fix w25q128 regression
    313231de3e76a RDMA/cache: Release GID table even if leak is detected
    fa6f16eff7320 ASoc: PCM6240: Return directly after a failed devm_kzalloc() in pcmdevice_i2c_probe()
    e158d5ecd0c06 usb: typec-mux: nb7vpq904m: unregister typec switch on probe error and remove
    7c04f4334a915 usb: typec-mux: ptn36502: unregister typec switch on probe error and remove
    90cda6c657f96 ASoC: cs35l56: Accept values greater than 0 as IRQ numbers
    0c9dcb01325ac ASoc: tas2781: Enable RCA-based playback without DSP firmware download
    f7275af580b13 powerpc/kexec_file: fix cpus node update to FDT
    a1861bdd9f7da RDMA/mlx5: Set mkeys for dmabuf at PAGE_SIZE
    ed67aa7da9173 coresight: Fix ref leak when of_coresight_parse_endpoint() fails
    7aa2a86bc9b53 KVM: PPC: Book3S HV: Fix the get_one_reg of SDAR
    d18ff82c2da9d KVM: PPC: Book3S HV: Fix the set_one_reg for MMCR3
    b956989690048 iommu/arm-smmu-v3: Avoid uninitialized asid in case of error
    9d9029157d49f iio: adc: adi-axi-adc: don't allow concurrent enable/disable calls
    532248d0f0365 iio: frequency: adrf6780: rm clk provider include
    1ff0fc4949e22 iio: adc: ad9467: use DMA safe buffer for spi
    0019bd1e6c348 clk: meson: s4: fix pwm_j_div parent clock
    b156f8f482580 clk: meson: s4: fix fixed_pll_dco clock
    69b5557d750ae clk: qcom: camcc-sc7280: Add parent dependency to all camera GDSCs
    5f25486c4ee72 clk: qcom: gcc-sc7280: Update force mem core bit for UFS ICE clock
    f94068f2343ee crypto: atmel-sha204a - fix negated return value
    1041f82849289 crypto: tegra - Remove an incorrect iommu_fwspec_free() call in tegra_se_remove()
    e42cc7d832b43 scsi: ufs: mcq: Fix missing argument 'hba' in MCQ_OPR_OFFSET_n
    1911fd52a37a2 riscv: smp: fail booting up smp if inconsistent vlen is detected
    b2808d2370cc2 PCI: tegra194: Set EP alignment restriction for inbound ATU
    3ff3bdde950f1 PCI: rcar: Demote WARN() to dev_warn_ratelimited() in rcar_pcie_wakeup()
    dbcdd1863ba2e PCI: keystone: Fix NULL pointer dereference in case of DT error in ks_pcie_setup_rc_app_regs()
    36aaa68b1a991 PCI: keystone: Don't enable BAR 0 for AM654x
    09904aba0cf8e PCI: keystone: Relocate ks_pcie_set/clear_dbi_mode()
    ffffd95e46be0 PCI: Fix resource double counting on remove & rescan
    af4ad016abb16 PCI: endpoint: pci-epf-test: Make use of cached 'epc_features' in pci_epf_test_core_init()
    b5046de32fd15 iio: Fix the sorting functionality in iio_gts_build_avail_time_table
    5532e0c563659 SUNRPC: Fixup gss_status tracepoint error output
    387e6e9d11025 nfs: pass explicit offset/count to trace events
    b69c02dea9bfd platform/x86: asus-wmi: fix TUF laptop RGB variant
    8725399367426 perf dso: Fix address sanitizer build
    54765806773ef sparc64: Fix incorrect function signature and add prototype for prom_cif_init
    2c370dda0ee71 leds: flash: leds-qcom-flash: Test the correct variable in init
    c9c1d9be6f22f drm/qxl: Pin buffer objects for internal mappings
    024d8556f37fc ext4: avoid writing unitialized memory to disk in EA inodes
    149a0691bf95e ext4: don't track ranges in fast_commit if inode has inlined data
    4ebf5bfd34001 NFSv4.1 another fix for EXCHGID4_FLAG_USE_PNFS_DS for DS server
    030fdc351225c SUNRPC: avoid soft lockup when transmitting UDP to reachable server.
    fb778472ba466 xprtrdma: Fix rpcrdma_reqs_reset()
    fecdddd8524d6 mfd: omap-usb-tll: Use struct_size to allocate tll
    abf9d5c35453a mfd: rsmu: Split core code into separate module
    35f45d148d041 drm/panthor: Record devfreq busy as soon as a job is started
    8b833796fa231 perf intel-pt: Fix exclude_guest setting
    f44c448bfb2a7 perf intel-pt: Fix aux_watermark calculation for 64-bit size
    b7182f73d7568 media: venus: flush all buffers in output plane streamoff
    5b9eb7e0ab828 perf stat: Fix a segfault with --per-cluster --metric-only
    c5d98f78ef3ae drm/mediatek/dp: Fix spurious kfree()
    7d44a63b4860a drm/mediatek: dpi/dsi: Fix possible_crtcs calculation
    081ff4c0ef188 drm/amd/display: Add null check before access structs
    81f819c537d29 ext4: fix infinite loop when replaying fast_commit
    b8e7d26610fff drm/mediatek: Remove less-than-zero comparison of an unsigned value
    c0fd0eba42528 drm/panic: Do not select DRM_KMS_HELPER
    d6f36acfc4588 drm/panic: depends on !VT_CONSOLE
    c53e98ef03722 Revert "leds: led-core: Fix refcount leak in of_led_get()"
    2862ec16f5085 leds: rgb: leds-qcom-lpg: Add PPG check for setting/clearing PBS triggers
    d4c57354a06cb drm/qxl: Add check for drm_cvt_mode
    7b232168841a3 drm/etnaviv: fix DMA direction handling for cached RW buffers
    01723f9a60b4e perf report: Fix condition in sort__sym_cmp()
    da17ee4015c64 perf pmus: Fixes always false when compare duplicates aliases
    ee0a02229380f tools/perf: Fix the string match for "/tmp/perf-$PID.map" files in dso__load
    46a62b1cbca95 perf test: Make test_arm_callgraph_fp.sh more robust
    eb049d63ba11f platform/arm64: build drivers even on non-ARM64 platforms
    31b6cd5545f13 drm/panic: Fix off-by-one logo size checks
    1d5d55b29999a drm/panic: only draw the foreground color in drm_panic_blit()
    b9080795fe80e drm/ttm/tests: Fix a warning in ttm_bo_unreserve_bulk
    aa6e78f2c87d9 drm/msm/dpu: drop validity checks for clear_pending_flush() ctl op
    0bdec11134cc9 drm/msm/dsi: set VIDEO_COMPRESSION_MODE_CTRL_WC
    2afd0e9059d5b drm/msm/dsi: set video mode widebus enable bit when widebus is enabled
    0788a6f3523d3 leds: trigger: Unregister sysfs attributes before calling deactivate()
    e6daf3bf851b4 media: imx-jpeg: Drop initial source change event if capture has been setup
    d371e4eed3117 drm/msm/a6xx: Fix A702 UBWC mode
    faedf1281d28f drm/msm/a6xx: use __unused__ to fix compiler warnings for gen7_* includes
    8a4ce184dcc6e drm/mediatek: Set DRM mode configs accordingly
    0d4c45d401980 drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
    19ef723f6edd6 drm/mediatek: Add OVL compatible name for MT8195
    a063acc5d33d6 drm/mediatek: Turn off the layers with zero width or height
    5e28b7aa8be14 drm/mediatek: Fix destination alpha error in OVL
    8c3411d859f16 drm/mediatek: Fix XRGB setting error in Mixer
    91ef5af76f7ec drm/mediatek: Fix XRGB setting error in OVL
    a2541f21713f7 drm/mediatek: Use 8-bit alpha in ETHDR
    0e2b6d89ae144 drm/mediatek: Add missing plane settings when async update
    41b97b3d61a0b drm/ttm/tests: Let ttm_bo_test consider different ww_mutex implementation.
    0f2a77c69b193 media: renesas: vsp1: Store RPF partition configuration per RPF instance
    f1fd968260da5 media: renesas: vsp1: Fix _irqsave and _irq mix
    c88ffbc568cbd media: rcar-csi2: Cleanup subdevice in remove()
    484f18269e799 media: rcar-csi2: Disable runtime_pm in probe error
    7dd4dba5dc103 media: rcar-vin: Fix YUYV8_1X16 handling for CSI-2
    a749415d2058a drm/i915/psr: Set SU area width as pipe src width
    475c678426b15 drm: zynqmp_kms: Fix AUX bus not getting unregistered
    8c07f6b2abda3 drm: zynqmp_dpsub: Fix an error handling path in zynqmp_dpsub_probe()
    0f12d2b6e6118 media: uvcvideo: Override default flags
    35a00891b0c22 media: uvcvideo: Add quirk for invalid dev_sof in Logitech C920
    27e991a926212 media: uvcvideo: Quirk for invalid dev_sof in Logitech C922
    0fe5ae08c1321 media: i2c: imx219: fix msr access command sequence
    29649f3c5697e media: c8sectpfe: Add missing parameter names
    97a80ca3dce37 saa7134: Unchecked i2c_transfer function result fixed
    23f5e185134cf drm/amd/display: use pre-allocated temp structure for bounding box
    898d200148d03 ipmi: ssif_bmc: prevent integer overflow on 32bit systems
    5f8c27d3985ed x86/shstk: Make return uprobe work with shadow stack
    504f9ce3bcfe9 drm/i915/psr: Print Panel Replay status instead of frame lock status
    63b0fcbbaaf0c drm/i915/display: Skip Panel Replay on pipe comparison if no active planes
    63d71da2b875a drm/bridge: samsung-dsim: Set P divider based on min/max of fin pll
    309fdbb585186 media: mediatek: vcodec: Fix unreasonable data conversion
    cdf05ae76198c media: mediatek: vcodec: Handle invalid decoder vsi
    a59088577033a perf maps: Fix use after free in __maps__fixup_overlap_and_insert
    e1d86efd46986 drm/msm/dp: fix runtime_pm handling in dp_wait_hpd_asserted
    7deaf31e79bb8 drm/msm/dpu: drop duplicate drm formats from wb2_formats arrays
    ca168c0d8faf1 Revert "drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set"
    956bb63a227f4 drm/msm/dpu: fix encoder irq wait skip
    b21aba72aadd9 s390/uv: Don't call folio_wait_writeback() without a folio reference
    bd7e3335a8b9c drm/amdgpu: Fix type mismatch in amdgpu_gfx_kiq_init_ring
    b87e28050d9b0 media: v4l: async: Fix NULL pointer dereference in adding ancillary links
    04be7591f3107 media: i2c: hi846: Fix V4L2_SUBDEV_FORMAT_TRY get_selection()
    f843053eca59c media: i2c: Fix imx412 exposure control
    3d4e5b75e9903 drm/i915/psr: Use enable boolean from intel_crtc_state for Early Transport
    6f611b000d623 media: imon: Fix race getting ictx->lock
    ad24b56e0d987 media: dvb-usb: Fix unexpected infinite loop in dvb_usb_read_remote_control()
    c766065e82720 media: pci: ivtv: Add check for DMA map result
    0afb3c7020844 drm/amd/display: Move 'struct scaler_data' off stack
    a9b68a2f325e4 drm/amd/display: fix graphics_object_id size
    814d1469dd35c drm/amd/display: dynamically allocate dml2_configuration_options structures
    79161e9cc12a7 drm/amdgpu: Fix snprintf usage in amdgpu_gfx_kiq_init_ring
    8607894112f1d drm/bridge: it6505: fix hibernate to resume no display issue
    c47583f3cb066 drm/panel: ilitek-ili9882t: Check for errors on the NOP in prepare()
    30c229ef8d2c8 drm/panel: ilitek-ili9882t: If prepare fails, disable GPIO before regulators
    505c099de10c6 drm/panel: boe-tv101wum-nl6: Check for errors on the NOP in prepare()
    4c34113e9d08c drm/panel: boe-tv101wum-nl6: If prepare fails, disable GPIO before regulators
    5e42e925ce8d9 drm/panel: himax-hx8394: Handle errors from mipi_dsi_dcs_set_display_on() better
    889f0cb5a83d9 drm/amdgpu: Remove GC HW IP 9.3.0 from noretry=1
    9084114e33859 drm/amdgpu: Check if NBIO funcs are NULL in amdgpu_device_baco_exit
    422b081874bbc drm/amdgpu: Fix memory range calculation
    6369ac0eb0c3b drm/amd/pm: Fix aldebaran pcie speed reporting
    ca503105cbe57 drm/panel: lg-sw43408: add missing error handling
    6f793d85289fd drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_generic_write_seq()
    810066677eb8c drm/mipi-dsi: Fix theoretical int overflow in mipi_dsi_dcs_write_seq()
    1f45e83312b59 drm/i915/display: Do not print "psr: enabled" for on Panel Replay
    f2df0e9cf1c3c drm/i915/psr: Rename has_psr2 as has_sel_update
    e86f34eba0a9a drm/amdkfd: Fix CU Masking for GFX 9.4.3
    23c8257eee944 drm/arm/komeda: Fix komeda probe failing if there are no links in the secondary pipeline
    a97c08513bc33 drm/rockchip: vop2: Fix the port mux of VP2
    e85e7f0936d87 tcp: Don't access uninit tcp_rsk(req)->ao_keyid in tcp_create_openreq_child().
    70d665b83e2ea Bluetooth: Fix usage of __hci_cmd_sync_status
    f7fb60b5380a8 net: bridge: mst: Check vlan state for egress decision
    12144069209ee xdp: fix invalid wait context of page_pool_destroy()
    468a729b78895 virtio_net: Fix napi_skb_cache_put warning
    4a0d2efbb773b Bluetooth: hci_core, hci_sync: cleanup struct discovery_state
    8424783412074 Bluetooth: hci_event: Set QoS encryption from BIGInfo report
    dc14469e43da1 Bluetooth: btnxpuart: Add handling for boot-signature timeout errors
    be2ac1f45f39f Bluetooth: btintel_pcie: Fix irq leak
    ea4a294c6feae Bluetooth: btintel: Refactor btintel_set_ppag()
    cfd70400a3115 Bluetooth: hci_bcm4377: Use correct unit for timeouts
    cad797ceeeb19 selftests: forwarding: devlink_lib: Wait for udev events after reloading
    e187690b125a2 net: ethtool: pse-pd: Fix possible null-deref
    dd5a33e0af6fd net: pse-pd: Do not return EOPNOSUPP if config is null
    b29a880bb145e bpf: Fix null pointer dereference in resolve_prog_type() for BPF_PROG_TYPE_EXT
    4799e4e51fe4f nfsd: nfsd_file_lease_notifier_call gets a file_lease as an argument
    345652866a886 bpf: fix overflow check in adjust_jmp_off()
    fbb84b1b05c97 bpf: Eliminate remaining "make W=1" warnings in kernel/bpf/btf.o
    e0f48f51d55fb bna: adjust 'name' buf size of bna_tcb and bna_ccb structures
    888d1d38bd1f1 bpf: annotate BTF show functions with __printf
    a8d0ea2607132 selftests/resctrl: Fix closing IMC fds on error and open-code R+W instead of loops
    6d218fcc707d6 bpf, arm64: Fix trampoline for BPF_TRAMP_F_CALL_ORIG
    5b08892910296 selftests/bpf: Close obj in error path in xdp_adjust_tail
    8262bca056784 selftests/bpf: Null checks for links in bpf_tcp_ca
    72607d8ad89b4 selftests/bpf: Close fd in error path in drop_on_reuseport
    29ca547e87501 locking/rwsem: Add __always_inline annotation to __down_write_common() and inlined callers
    85a28462f87e6 wifi: virt_wifi: don't use strlen() in const context
    c1cb824e66236 net: page_pool: fix warning code
    378003612bc9c gss_krb5: Fix the error handling path for crypto_sync_skcipher_setkey
    65b97d6f328f9 NFSD: Fix nfsdcld warning
    0faaa5f29e513 bpf: helpers: fix bpf_wq_set_callback_impl signature
    416d3c1538df0 wifi: virt_wifi: avoid reporting connection success with wrong SSID
    574c740486169 xfrm: call xfrm_dev_policy_delete when kill policy
    31d0172a091dc xfrm: fix netdev reference count imbalance
    96ae4de5bc4c8 wifi: rtw89: Fix array index mistake in rtw89_sta_info_get_iter()
    3fd761e3cefdc perf/x86/amd/uncore: Fix DF and UMC domain identification
    381b21a1cf2ad perf/x86/amd/uncore: Avoid PMU registration if counters are unavailable
    501b077aefc1a perf/x86/intel/cstate: Fix Alderlake/Raptorlake/Meteorlake
    9bed6852d3f56 perf: Fix default aux_watermark calculation
    e8bf18de94550 perf: Prevent passing zero nr_pages to rb_alloc_aux()
    f86f70e332258 perf: Fix perf_aux_size() for greater-than 32-bit size
    d483e01df5cb1 perf/x86/intel/pt: Fix pt_topa_entry_for_page() address calculation
    0561e6743c6b5 bpf: Fix atomic probe zero-extension
    c3be81545328a bpftool: Mount bpffs when pinmaps path not under the bpffs
    3e6a1b1b179ab riscv, bpf: Fix out-of-bounds issue when preparing trampoline image
    7276b1d7b1e79 xfrm: Export symbol xfrm_dev_state_delete.
    48ec0d5910248 wifi: rtl8xxxu: 8188f: Limit TX power index
    74e17a9237196 wifi: rtw89: 8852b: fix definition of KIP register number
    ef0d9d2f0dc11 wifi: rtw89: wow: fix GTK offload H2C skbuff issue
    0767f5fe9f48e wifi: ath12k: fix peer metadata parsing
    23a9aab65585c wifi: ath12k: advertise driver capabilities for MBSSID and EMA
    b33855de5c62d wifi: iwlwifi: mvm: always unblock EMLSR on ROC end
    9d5593e6b1639 wifi: iwlwifi: fix iwl_mvm_get_valid_rx_ant()
    2f4182ef6adef wifi: mac80211: correcty limit wider BW TDLS STAs
    306d783dd1cf1 wifi: mac80211: add ieee80211_tdls_sta_link_id()
    28353278ee8c4 netfilter: nf_tables: rise cap on SELinux secmark context
    bb65059d251a3 ipvs: Avoid unnecessary calls to skb_is_gso_sctp
    8ecee44464a49 xfrm: Fix unregister netdevice hang on hardware offload.
    2845db7bedd84 libbpf: Skip base btf sanity checks
    aeb79296c65cb libbpf: Checking the btf_type kind when fixing variable offsets
    fe60c691835ed bpf: Change bpf_session_cookie return value to __u64 *
    00e09f86c6fa5 net: dsa: ksz_common: Allow only up to two HSR HW offloaded ports for KSZ9477
    3bde02b27aacd net: fec: Fix FEC_ECR_EN1588 being cleared on link-down
    40d7b3ed52449 udf: Fix bogus checksum computation in udf_rename()
    73c19830cd723 xfrm: Log input direction mismatch error in one place
    a4c10813bc394 xfrm: Fix input error path memory access
    8ca4ec5a59d34 bpf: Make bpf_session_cookie() kfunc return long *
    ddbd23de1d2dd wifi: iwlwifi: mvm: separate non-BSS/ROC EMLSR blocking
    94d2e5b7866da wifi: iwlwifi: mvm: fix re-enabling EMLSR
    07117ccf53731 wifi: nl80211: expose can-monitor channel property
    19eaf4f2f5a98 wifi: cfg80211: handle 2x996 RU allocation in cfg80211_calculate_bitrate_he()
    c70efd8546e65 wifi: cfg80211: fix typo in cfg80211_calculate_bitrate_he()
    7a00a36b656de wifi: ath12k: fix per pdev debugfs registration
    1d291225c40b8 wifi: ath11k: fix wrong handling of CCMP256 and GCMP ciphers
    630c62b468357 wifi: ath12k: fix ACPI warning when resume
    53c7c8ed563da jump_label: Fix concurrency issues in static_key_slow_dec()
    7e4a0c17a81d3 perf/x86: Serialize set_attr_rdpmc()
    431342f4ba521 mlxsw: spectrum_acl: Fix ACL scale regression and firmware errors
    fb5d4fc578e65 mlxsw: spectrum_acl_erp: Fix object nesting warning
    499f742fed42e lib: objagg: Fix general protection fault
    a1cf0f193db57 sched/core: Drop spinlocks on contention iff kernel is preemptible
    b20578a3a2e67 sched/core: Move preempt_model_*() helpers from sched.h to preempt.h
    50b556a1ce2cb udf: Fix lock ordering in udf_evict_inode()
    bd334e2f45a81 selftests/bpf: Check length of recv in test_sockmap
    befa479331099 net/smc: set rmb's SG_MAX_SINGLE_ALLOC limitation only when CONFIG_ARCH_NO_SG_CHAIN is defined
    f6f67fff74f1b libbpf: keep FD_CLOEXEC flag when dup()'ing FD
    1a07de1959cae hns3: avoid linking objects into multiple modules
    5e8a0b94c58f9 tcp: fix races in tcp_v[46]_err()
    0c6034cae002b tcp: fix races in tcp_abort()
    c366435a152b8 tcp: fix race in tcp_write_err()
    ea734f7724ebb tcp: add tcp_done_with_error() helper
    13829bfb38bcf net: ethernet: cortina: Restore TSO support
    04d8b7a21c006 wifi: ath12k: fix wrong definition of CE ring's base address
    5c7db8b09fbaa wifi: ath11k: fix wrong definition of CE ring's base address
    bdfbf56652d5c wifi: rtw89: 8852c: correct logic and restore PCI PHY EQ after device resume
    95d4e829e50e2 wifi: ath12k: fix firmware crash during reo reinject
    36fc66a7d9ca3 wifi: ath12k: fix invalid memory access while processing fragmented packets
    6925320fcd40d wifi: ath12k: change DMA direction while mapping reinjected packets
    59423af36b253 wifi: ath11k: restore country code during resume
    bee1f0e97cea5 wifi: ath11k: refactor setting country code logic
    12e0c7822a5a4 wifi: mac80211: reset negotiated TTLM on disconnect
    d28e8958fc080 wifi: mac80211: cancel TTLM teardown work earlier
    a82d97b9979bf wifi: mac80211: cancel multi-link reconf work on disconnect
    9750899410c84 wifi: mac80211: fix TTLM teardown work
    0b336e37e77cb wifi: iwlwifi: mvm: don't skip link selection
    b17b8b492764a net: esp: cleanup esp_output_tail_tcp() in case of unsupported ESPINTCP
    9a340fe1b0b4e wifi: rtw89: 8852b: restore setting for RFE type 5 after device resume
    eab9ecfa8ed3d selftests/bpf: Fix prog numbers in test_sockmap
    b04566066c0ac bpftool: Un-const bpf_func_info to fix it for llvm 17 and newer
    9abf615e1572d wifi: ath12k: fix Smatch warnings on ath12k_core_suspend()
    a9ac7d444de51 wifi: ath12k: Fix tx completion ring (WBM2SW) setup failure
    7f41e6f884cc9 wifi: ath12k: Correct 6 GHz frequency value in rx status
    c33154cd0e162 wifi: brcmsmac: LCN PHY code is used for BCM4313 2G-only device
    c9a04fc459677 wifi: ath12k: avoid duplicated vdev stop
    e0f67630ee8f6 wifi: ath12k: drop failed transmitted frames from metric calculation.
    059ef22f55ee0 wifi: ath12k: Don't drop tx_status in failure case
    2af312f4a6d03 firmware: turris-mox-rwtm: Initialize completion before mailbox
    4f3811ecac84a firmware: turris-mox-rwtm: Fix checking return value of wait_for_completion_timeout()
    c83d61d3cab0a firmware: turris-mox-rwtm: Do not complete if there are no waiters
    1081b3f819610 vmlinux.lds.h: catch .bss..L* sections into BSS")
    3dc633cb63305 x86/sev: Do RMP memory coverage check after max_pfn has been set
    8057117dafb49 ARM: Remove address checking for MMUless devices
    38908feafa26a ARM: spitz: fix GPIO assignment for backlight
    50162623cb8da m68k: cmpxchg: Fix return value for default case in __arch_xchg()
    57a818bfa03b1 cpufreq/amd-pstate: Fix the scaling_max_freq setting on shared memory CPPC systems
    aff58cd5ddc1a cpufreq/amd-pstate-ut: Convert nominal_freq to khz during comparisons
    d7a8cf3fafc44 arm64: dts: qcom: sm6350: Add missing qcom,non-secure-domain property
    9633f16563c25 arm64: dts: rockchip: fixes PHY reset for Lunzn Fastrhino R68S
    9a19c4a67e5e8 arm64: dts: rockchip: disable display subsystem for Lunzn Fastrhino R6xS
    4f19bf7f6d6d7 arm64: dts: rockchip: remove unused usb2 nodes for Lunzn Fastrhino R6xS
    e22a93c8070d9 arm64: dts: rockchip: fix pmu_io supply for Lunzn Fastrhino R6xS
    65de64c52ce03 arm64: dts: rockchip: fix usb regulator for Lunzn Fastrhino R6xS
    36f12ac15e6cb arm64: dts: rockchip: fix regulator name for Lunzn Fastrhino R6xS
    66dbed6840265 arm64: dts: rockchip: Add missing power-domains for rk356x vop_mmu
    1709d8fc48e19 arm64: dts: qcom: qrb4210-rb2: Correct max current draw for VBUS
    eaf36e6600fa4 x86/xen: Convert comma to semicolon
    cba20cbcf31b3 arm64: dts: qcom: x1e80100: Fix USB HS PHY 0.8V supply
    d437ba496d2c4 arm64: dts: imx8mp: Fix pgc vpu locations
    4bf10cc8b5210 arm64: dts: imx8mp: Fix pgc_mlmix location
    92df560733f7d m68k: atari: Fix TT bootup freeze / unexpected (SCU) interrupt messages
    4bc7267967cda arm64: dts: renesas: r9a08g045: Add missing hypervisor virtual timer IRQ
    2eee24dbb952f arm64: dts: renesas: r9a07g054: Add missing hypervisor virtual timer IRQ
    e88370be243cd arm64: dts: renesas: r9a07g044: Add missing hypervisor virtual timer IRQ
    c34ac879e17ff arm64: dts: renesas: r9a07g043u: Add missing hypervisor virtual timer IRQ
    94f19d09e81ea arm64: dts: renesas: r8a779g0: Add missing hypervisor virtual timer IRQ
    d5c33c9ed99cd arm64: dts: renesas: r8a779f0: Add missing hypervisor virtual timer IRQ
    703eedeebe139 arm64: dts: renesas: r8a779a0: Add missing hypervisor virtual timer IRQ
    68e39a9a7f717 arm64: dts: renesas: r8a779h0: Drop "opp-shared" from opp-table-0
    30c59704ab60f arm64: dts: rockchip: Fix mic-in-differential usage on rk3568-evb1-v10
    d65388253c1aa arm64: dts: rockchip: Fix mic-in-differential usage on rk3566-roc-pc
    c9d4cbc72a469 arm64: dts: rockchip: Drop invalid mic-in-differential on rk3568-rock-3a
    f146001e49922 arm64: dts: amlogic: setup hdmi system clock
    5d1e9ca9f76ee arm64: dts: amlogic: add power domain to hdmitx
    70bc57ac4f73b arm64: dts: amlogic: gx: correct hdmi clocks
    e5ed533f690f3 soc: mediatek: mtk-mutex: Add MDP_TCC0 mod to MT8188 mutex table
    a6a7ed42ac93d arm64: dts: mediatek: mt8183-kukui-jacuzzi: Add ports node for anx7625
    c0d6ac595e152 arm64: dts: mediatek: mt8183-pico6: Fix wake-on-X event node names
    8bd5cc9b7bfd3 arm64: dts: mediatek: mt8183-kukui: Fix the value of `dlg,jack-det-rate` mismatch
    33456268a54e1 arm64: dts: mediatek: mt7622: fix "emmc" pinctrl mux
    a3c80f9326aea arm64: dts: mediatek: mt7981: fix code alignment for PWM clocks
    a07456e3c3d0c arm64: dts: mediatek: mt8192-asurada: Add off-on-delay-us for pp3300_mipibrdg
    c42e03a08ba9a arm64: dts: mediatek: mt8183-kukui: Drop bogus output-enable property
    573fb73db52f2 arm64: dts: medaitek: mt8395-nio-12l: Set i2c6 pins to bias-disable
    e8f068a23a18b arm64: dts: mediatek: mt8192: Fix GPU thermal zone name for SVS
    509a9dc5cf665 arm64: dts: mediatek: mt8195: Fix GPU thermal zone name for SVS
    70aa2d9b89d31 ARM: dts: imx6qdl-kontron-samx6i: fix PCIe reset polarity
    7f62fe7e0e85d ARM: dts: imx6qdl-kontron-samx6i: fix SPI0 chip selects
    b2490fc162b45 ARM: dts: imx6qdl-kontron-samx6i: fix board reset
    3326d475ddd7d ARM: dts: imx6qdl-kontron-samx6i: fix PHY reset
    873aaa24d0398 ARM: dts: imx6qdl-kontron-samx6i: fix phy-mode
    4025ecca3c790 arm64: dts: amlogic: sm1: fix spdif compatibles
    9a9f8515c449d arm64: dts: rockchip: Increase VOP clk rate on RK3328
    ba9fa7529a149 soc: qcom: pdr: fix parsing of domains lists
    8543269567e2f soc: qcom: pdr: protect locator_addr with the main mutex
    4100d4d019f8e soc: qcom: icc-bwmon: Fix refcount imbalance seen during bwmon_remove
    9eacfd2ab4c61 arm64: dts: qcom: qdu1000: Add secure qfprom node
    a0f985672d68a arm64: dts: qcom: sc7180-trogdor: Disable pwmleds node where unused
    9d998dcfff80a arm64: dts: ti: k3-am62p5-sk: Fix pinmux for McASP1 TX
    3b2ce19ac2f7e arm64: dts: ti: k3-am625-phyboard-lyra-rdk: Drop McASP AFIFOs
    1322529b0c782 arm64: dts: ti: k3-am62-verdin: Drop McASP AFIFOs
    a4a03e2f485bf arm64: dts: ti: k3-am625-beagleplay: Drop McASP AFIFOs
    4efa40f9dfe58 arm64: dts: ti: k3-am62p5: Drop McASP AFIFOs
    a8c6c5e13aba9 arm64: dts: ti: k3-am62a7: Drop McASP AFIFOs
    2a3e7f475866c arm64: dts: ti: k3-am62x: Drop McASP AFIFOs
    9e6590af6999e arm64: dts: ti: k3-j722s: Fix main domain GPIO count
    2ea4abb96f206 arm64: dts: ti: k3-am642-hummingboard-t: correct rs485 rts polarity
    98e86ab64873e arm64: dts: ti: k3-am62p-main: Fix the reg-range for main_pktdma
    909ad4f81cc82 arm64: dts: ti: k3-am62a-main: Fix the reg-range for main_pktdma
    f007e23ebd9a1 arm64: dts: ti: k3-am62-main: Fix the reg-range for main_pktdma
    ee56e86c3f211 memory: fsl_ifc: Make FSL_IFC config visible and selectable
    f666c421e1d78 OPP: ti: Fix ti_opp_supply_probe wrong return values
    c9fdb8980b781 arm64: dts: qcom: sc8280xp: Throttle the GPU when overheating
    a291feafde81e arm64: dts: qcom: sc8280xp-*: Remove thermal zone polling delays
    233c60cdcf99e cpufreq: ti-cpufreq: Handle deferred probe with dev_err_probe()
    057850ed81c4f arm64: dts: qcom: qrb4210-rb2: make L9A always-on
    0c269c1f58d74 ARM: dts: stm32: Add arm,no-tick-in-suspend to STM32MP15xx STGEN timer
    8938217a8d672 ARM: dts: sunxi: remove duplicated entries in makefile
    f762acdaff9e5 soc: xilinx: rename cpu_number1 to dummy_cpu_number
    312396939bf5b arm64: dts: qcom: sa8775p: mark ethernet devices as DMA-coherent
    611d4a8313423 arm64: dts: qcom: msm8996: specify UFS core_clk frequencies
    504652b2eed84 OPP: Fix missing cleanup on error in _opp_attach_genpd()
    232c1085fcd9f cpufreq: sun50i: fix memory leak in dt_has_supported_hw()
    1390b9f652283 arm64: dts: rockchip: Update WIFi/BT related nodes on rk3308-rock-pi-s
    68dea92d678af arm64: dts: rockchip: Add mdio and ethernet-phy nodes to rk3308-rock-pi-s
    bcbed5fee3e5f arm64: dts: rockchip: Add pinctrl for UART0 to rk3308-rock-pi-s
    90e63ee2879ef arm64: dts: rockchip: Add sdmmc related properties on rk3308-rock-pi-s
    f7b9e814ab8d4 soc: qcom: rpmh-rsc: Ensure irqs aren't disabled by rpmh_rsc_send_data() callers
    2dcefd6d1e711 soc: qcom: pmic_glink: Handle the return value of pmic_glink_init
    501db89e28fea arm64: dts: qcom: msm8998: enable adreno_smmu by default
    fbf852d429e44 arm64: dts: qcom: sdm850-lenovo-yoga-c630: fix IPA firmware path
    94afdaa14344d arm64: dts: qcom: msm8996-xiaomi-common: drop excton from the USB PHY
    e93112293d20a arm64: dts: qcom: sm8450: add power-domain to UFS PHY
    8533f637f6620 arm64: dts: qcom: sm8350: add power-domain to UFS PHY
    b042cf07c9aaf arm64: dts: qcom: sm8250: add power-domain to UFS PHY
    8c93c87cfa899 arm64: dts: qcom: sm6350: add power-domain to UFS PHY
    b5357d8fc93f6 arm64: dts: qcom: sm6115: add power-domain to UFS PHY
    080bcc8cce96a arm64: dts: qcom: sdm845: add power-domain to UFS PHY
    bec81d919cfac arm64: dts: qcom: sc8180x: add power-domain to UFS PHY
    138abbabf63b9 arm64: dts: qcom: sc7180: drop extra UFS PHY compat
    a8d494762c4ff ARM: dts: qcom: msm8226-microsoft-common: Enable smbb explicitly
    85610b00af752 arm64: dts: qcom: sc7280: Remove CTS/RTS configuration
    6dbc8239be9c0 arm64: dts: qcom: sc8180x: Correct PCIe slave ports
    c1ae2a706e776 soc: qcom: socinfo: Update X1E PMICs
    bc29bc14c2169 hwmon: (max6697) Fix swapped temp{1,8} critical alarms
    7c7cf939b3b21 hwmon: (max6697) Fix underflow when writing limit attributes
    9fab017e2ea4b drm/xe/display/xe_hdcp_gsc: Free arbiter on driver removal
    1e6805b6ecf79 pwm: atmel-tcb: Fix race condition and convert to guards
    8afada330c16c drm/meson: fix canvas release in bind function
    a0d1545830305 nvmet-auth: fix nvmet_auth hash error handling
    069f34f991cd6 arm64: smp: Fix missing IPI statistics
    ee6669355fa43 drm/bridge: adv7511: Fix Intermittent EDID failures
    b1c83176c1d77 pwm: stm32: Always do lazy disabling
    c180311c0a520 hwmon: (ltc2991) re-order conditions to fix off by one bug
    0c7429256de1d md/raid5: recheck if reshape has finished with device_lock held
    dc72af89c94bd md: Don't wait for MD_RECOVERY_NEEDED for HOT_REMOVE_DISK ioctl
    90ebddded5367 perf: arm_pmuv3: Avoid assigning fixed cycle counter with threshold
    269535618c161 xen-blkfront: fix sector_size propagation to the block layer
    28f7a3403100b block/mq-deadline: Fix the tag reservation code
    136598536aaa8 block: Call .limit_depth() after .hctx has been set
    515278065c702 hwmon: (adt7475) Fix default duty on fan is disabled
    29ac1d238b3bf cgroup/cpuset: Prevent UAF in proc_cpuset_show()
    f38d2e9214996 x86/syscall: Mark exit[_group] syscall handlers __noreturn
    70035fdfa8354 x86/platform/iosf_mbi: Convert PCIBIOS_* return codes to errnos
    590c9a8348f97 x86/pci/xen: Fix PCIBIOS_* return code handling
    32adc6914bb18 x86/pci/intel_mid_pci: Fix PCIBIOS_* return code handling
    0cee39aa04eec x86/of: Return consistent error type from x86_of_pci_irq_enable()
    312d272dc47ae hfsplus: fix to avoid false alarm of circular locking
    72b7a3b3268e6 x86/kconfig: Add as-instr64 macro to properly evaluate AS_WRUSS
    c324141645280 cgroup/cpuset: Fix remote root partition creation problem
    b17f8733d5118 cgroup/cpuset: Optimize isolated partition only generate_sched_domains() calls
    7703ee4c86c92 io_uring: Fix probe of disabled operations
    47149c165a6fa dm: Call dm_revalidate_zones() after setting the queue limits
    ebc0e91ba76dc block: initialize integrity buffer to zero before writing it to media
    5535adc933fb2 ubd: untagle discard vs write zeroes not support handling
    49d7da56f1d95 ubd: refactor the interrupt handler
    e2172a1397630 platform/chrome: cros_ec_debugfs: fix wrong EC message version
    6bb2fccb2cb7e md/raid1: don't free conf on raid0_run failure
    7526c725d5120 md/raid0: don't free conf on raid0_run failure
    ca963eefbc333 md: fix deadlock between mddev_suspend and flush bio
    af594a0bb5c80 rcu/tasks: Fix stale task snaphot for Tasks Trace
    32700ecf8007e EDAC, i10nm: make skx_common.o a separate module
    24468dbfec053 spi: atmel-quadspi: Add missing check for clk_prepare
    949676eb8a4d9 spi: spi-microchip-core: Fix the number of chip selects supported
    c4386c5293aa8 drivers: gpu: drm: msm: registers: improve reproducibility
    915a386c7cffd qemux86: add configuration symbol to select values
    62df91b21626f sched/isolation: really align nohz_full with rcu_nocbs
    afe643f5802b8 clear_warn_once: add a clear_warn_once= boot parameter
    7b016793edbff clear_warn_once: bind a timer to written reset value
    89a5c70f20001 clear_warn_once: expand debugfs to include read support
    8014704c527d7 tools: Remove some options from CLANG_CROSS_FLAGS
    e9ca44556936c libbpf: Fix build warning on ref_ctr_off
    32fe8c972c362 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    a372ac2b798dc perf: x86-32: explicitly include <errno.h>
    a5cb41682777e perf: mips64: Convert __u64 to unsigned long long
    ed8ee9f3d1ae2 perf: fix bench numa compilation
    6dbb2915e8a7c perf: add SLANG_INC for slang.h
    57f78dddfd930 perf: add sgidefs.h to for mips builds
    130f0306cfbac perf: change --root to --prefix for python install
    2520efe953414 perf: add 'libperl not found' warning
    45731b6ae676f perf: force include of <stdbool.h>
    ace10f8dec53e fat: Replace prandom_u32() with get_random_u32()
    64797bdca14e2 fat: don't use obsolete random32 call in namei_vfat
    2442bae1a6451 FAT: Added FAT_NO_83NAME
    7561126bce00c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    5c51ab9598763 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5869720658c99 aufs6: match exports to functions
    e125467cf228f aufs: adjust for v6.9+
    eebcdc6635bfa aufs6: correct do_splice_from prototype
    4c5829036c457 aufs: update remove_page to remove_folio
    e8d889d0f4341 aufs: i_op: Add handling for au_pin_hdir_set_owner with RT kernel
    3ecd9203de174 aufs: fix v6.7 kernel build compilation
    5e8ee028dbe24 aufs6: adapt to v6.6 i_op->ctime changes
    1132c330feed3 aufs6: adapt to v6.6
    d3e4ede696034 aufs6: core
    49ec9271f41d3 aufs6: standalone
    dcc0978da2dd9 aufs6: mmap
    80e1609b37e77 aufs6: base
    0dbb3f0624208 aufs6: kbuild
    ad51078c5ebfc yaffs: fix mtime/itime field access
    e5f1d35d6188c yaffs2: update VFS ctime operations to 6.6+
    dd374461adc7c yaffs2: v6.5 fixups
    f5908785d88d7 yaffs2: Fix miscalculation of devname buffer length
    d1403f0acfdff yaffs2: convert user_namespace to mnt_idmap
    7dae5463b54fa yaffs2: replace bdevname call with sprintf
    92d30df4eb56c yaffs2: convert read_page -> readfolio
    6c895bffdf725 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    6801e7d90255b yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    aff012190046f yaffs2: v5.12+ build fixups (not runtime tested)
    fb474842c16ee yaffs: include blkdev.h
    fe7d745aac947 yaffs: fix misplaced variable declaration
    bee147b2e5336 yaffs2: v5.6 build fixups
    22998f589ec26 yaffs2: fix memory leak when /proc/yaffs is read
    ce7d8084a9764 yaffs: add strict check when call yaffs_internal_read_super
    adb7202fda953 yaffs: repair yaffs_get_mtd_device
    2852e5c15d4dc yaffs: Fix build failure by handling inode i_version with proper atomic API
    1526802a81470 yaffs2: fix memory leak in mount/umount
    6c7827a16aaaa yaffs: Avoid setting any ACL releated xattr
    fa34828155425 Yaffs:check oob size before auto selecting Yaffs1
    aaa4843b73ce7 fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    48e992af6531c yaffs2: adjust to proper location of MS_RDONLY
    f3af7160d8a0c yaffs2: import git revision b4ce1bb (jan, 2020)
    4add698ed6e8b initramfs: allow an optional wrapper script around initramfs generation
    b619a8d543360 vt/conmakehash: improve reproducibility
    c786186aeef39 tools: use basename to identify file in gen-mach-types
    aa3a8e7ceb6e7 iwlwifi: select MAC80211_LEDS conditionally
    325db54c4be9f net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    23a87c6e13aad defconfigs: drop obselete options
    946e5b78ab94d linux-yocto: Handle /bin/awk issues
    9daee1dba5852 uvesafb: provide option to specify timeout for task completion
    f68b8683441a0 uvesafb: print error message when task timeout occurs
    a1595c6b60173 compiler.h: Undef before redefining __attribute_const__
    8086839613c68 vmware: include jiffies.h
    32e79eb3c169c Resolve jiffies wrapping about arp
    f6fabf91b6f24 nfs: Allow default io size to be configured.
    ad2b29f801e9e check console device file on fs when booting
    5194785d545b8 mount_root: clarify error messages for when no rootfs found
    78b3498cb59a7 mconf: fix output of cflags and libraries
    9cc6870708d54 menuconfig,mconf-cfg: Allow specification of ncurses location
    f34088ed9c938 modpost: mask trivial warnings
    4784584582f50 kbuild: exclude meta directory from distclean processing
    73072b5fe25a9 powerpc: serialize image targets
    a120eb2003200 arm: serialize build targets
    51d5719ac05b4 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    5155f0bb36f0c cpu/amd: inhibit SMP check for qemux86
    e5a5996ee586f x86_64_defconfig: Fix warnings
    1359db75df0c9 mips: make current_cpu_data preempt safe
    385edf6090c30 mips: vdso: fix 'jalr $t9' crash in vdso code
    968266397319f mips: Kconfig: add QEMUMIPS64 option
    389ce854fde30 4kc cache tlb hazard: tlbp cache coherency
    9cab61199fa85 malta uhci quirks: make allowance for slow 4k(e)c
    80cae3bd9eea0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    41c82709900f7 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    59ef4f151a5e5 arm64: defconfig: cleanup config options
    c5fb425762ed8 vexpress: Pass LOADADDR to Makefile
    07a8b544d4e96 arm: ARM EABI socketcall
    574f3ae3d2ca7 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.10.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.10.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.10.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index 3bdf089cfb..a060100761 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5bdc0b099619bc8b5ba78c959341fbdec94bbcb0"
-SRCREV_meta ?= "f916cd32718f329bbad3fb54fdae2b5014360a59"
+SRCREV_machine ?= "887c7d0294726a161396812dcf2088f29b522b48"
+SRCREV_meta ?= "9e63c08171dc88ed8a5ed8ecc4b508465ea75352"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.10.2"
+LINUX_VERSION ?= "6.10.3"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
index 8d95064732..2416382020 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.10.inc
 
-LINUX_VERSION ?= "6.10.2"
+LINUX_VERSION ?= "6.10.3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "f3e7c54da960b173702dafe96d5419a90fd29698"
-SRCREV_meta ?= "f916cd32718f329bbad3fb54fdae2b5014360a59"
+SRCREV_machine ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
+SRCREV_meta ?= "9e63c08171dc88ed8a5ed8ecc4b508465ea75352"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index 7b27d84ba8..876f504e14 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.10/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.10/standard/base"
 KBRANCH:qemumips64 ?= "v6.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6705d5dee8c10b540b87b02bc0f154739c73c7e8"
-SRCREV_machine:qemuarm64 ?= "f3e7c54da960b173702dafe96d5419a90fd29698"
-SRCREV_machine:qemuloongarch64 ?= "f3e7c54da960b173702dafe96d5419a90fd29698"
-SRCREV_machine:qemumips ?= "80b11e534e03a10fb309eccb5128e83d42b0266c"
-SRCREV_machine:qemuppc ?= "f3e7c54da960b173702dafe96d5419a90fd29698"
-SRCREV_machine:qemuriscv64 ?= "f3e7c54da960b173702dafe96d5419a90fd29698"
-SRCREV_machine:qemuriscv32 ?= "f3e7c54da960b173702dafe96d5419a90fd29698"
-SRCREV_machine:qemux86 ?= "f3e7c54da960b173702dafe96d5419a90fd29698"
-SRCREV_machine:qemux86-64 ?= "f3e7c54da960b173702dafe96d5419a90fd29698"
-SRCREV_machine:qemumips64 ?= "09b08cd8880a997a591cae3d306c12a60193742b"
-SRCREV_machine ?= "f3e7c54da960b173702dafe96d5419a90fd29698"
-SRCREV_meta ?= "f916cd32718f329bbad3fb54fdae2b5014360a59"
+SRCREV_machine:qemuarm ?= "4562f66c12f660d40de2c8dc2b53f851ba1d7847"
+SRCREV_machine:qemuarm64 ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
+SRCREV_machine:qemuloongarch64 ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
+SRCREV_machine:qemumips ?= "8ef41c4428d1eb040edbae58b685bcba6472ab9b"
+SRCREV_machine:qemuppc ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
+SRCREV_machine:qemuriscv64 ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
+SRCREV_machine:qemuriscv32 ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
+SRCREV_machine:qemux86 ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
+SRCREV_machine:qemux86-64 ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
+SRCREV_machine:qemumips64 ?= "c1f8e21e4999d233df12ee60c7a47cad144e7344"
+SRCREV_machine ?= "92466d9d49ed65d9a13f2ab648a92becc027a257"
+SRCREV_meta ?= "9e63c08171dc88ed8a5ed8ecc4b508465ea75352"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "2d002356c3bb628937e0fb5d72a91dc493a984fe"
+SRCREV_machine:class-devupstream ?= "d29de02effd4e8816333582ed8230d41e14a73dc"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.10/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.10.2"
+LINUX_VERSION ?= "6.10.3"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


