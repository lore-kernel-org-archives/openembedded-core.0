Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64725E6FE38
	for <webhook@archiver.kernel.org>; Fri,  6 Sep 2024 18:02:57 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web11.5457.1725645776553453396
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Sep 2024 11:02:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kziySsub;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4567587224eso13862901cf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 11:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725645775; x=1726250575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AXsKj8+n3l9KMyuMZBAjwO7Wj8iSwN5TZHmvgnoorew=;
        b=kziySsubwSbOmk9uJCpLtiNaKfvV7c++UvhO1HQGw9+cZhq/KPfBRveC1sbgrIxKfX
         2qjW6sDoiNT7IQ6uih889dU8TJZnntBctzmZ+9b7yCupb7epDTIppbvh/FiBLVPiDYDp
         w+LEXTyMZEgHlbQ4fOXeLfg1TGQNFxsuMhKN4rXjRjg2tV7RWzlNxiiq0zi1/124nSi0
         rzzjtxDP3kAKJpio5yfil7qNbsDW6xPb2ocsMW3wEAfS4wSLeY6p8TjXodgTAkuF1Peo
         kW7FNr+0XdgjATGqo5kuC3sxgHkY736kPYepTBBkiTMUWTW6VAgQCySLPW8dueUtlJJs
         7J2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725645775; x=1726250575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AXsKj8+n3l9KMyuMZBAjwO7Wj8iSwN5TZHmvgnoorew=;
        b=e8QNZltD13yezKXpndI/NlxYm01adpWb2f7fb1sdSMO8gTcs+l5j41OU1s9n3qDkrY
         UQDGXS0gbtSiNJCGdxeaw4y9DEKPxcq+DJ+HYz9OeIf5qlnHTxRnD4X0WYV+Qj3daTvO
         uHWrT9/KEpe7jekTCu+fAIm+B9z1HBLG6bGXxUmCGGExH0RM83F107B53vaFE1WZ/YN5
         Myhvo8JUDDx/TpanpE8GCdSceXlxqQ8PZChC3hKdx5HfM3hGwUe2XKRPEXkW2ICZcUo+
         ruoXlBke8YztNSVuvNUoOPYdANOXmoEIrj3XGwixP/HMy92LaJO0D62LkZxdnqVCwKuU
         oFng==
X-Gm-Message-State: AOJu0Yxd/x27biBicyIdWhIbLoSt3yJUMUAQTwBS1IbbjdS6vi8n67K6
	YjqL2gqPL8wOkvNPMJZLEm64yXD9xDqO+Gve+IxunOZrtW1Ff922Cxwf2w==
X-Google-Smtp-Source: AGHT+IEiLgkhQxCwCVsSfH3iUI9FGDxhSovIgiCqzw16sEveYnxnPGgvt7AA+ImJLd6gD0Xrx2dOsA==
X-Received: by 2002:a05:622a:114e:b0:456:45d8:2f08 with SMTP id d75a77b69052e-4567f6d3c9bmr317605041cf.46.1725645774804;
        Fri, 06 Sep 2024 11:02:54 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45801a15393sm18136871cf.3.2024.09.06.11.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 11:02:54 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/5] linux-yocto/5.15: update to v5.15.165
Date: Fri,  6 Sep 2024 14:02:46 -0400
Message-Id: <20240906180247.376758-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240906180247.376758-1-bruce.ashfield@gmail.com>
References: <20240906180247.376758-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Sep 2024 18:02:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204291

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    3d85d75cac5b arm64: dts: imx8-ss-conn: Remove unrelated changes introduced when merging v5.15/standard/base
    fa93fa65db6e Linux 5.15.165
    b2c5a0f32c6c Revert "ata: libata-scsi: Honor the D_SENSE bit for CK_COND=1 and no error"
    79273dd53868 media: Revert "media: dvb-usb: Fix unexpected infinite loop in dvb_usb_read_remote_control()"
    dbcde9673101 ARM: dts: imx6qdl-kontron-samx6i: fix phy-mode
    33ac5a4eb3d4 wifi: cfg80211: restrict NL80211_ATTR_TXQ_QUANTUM values
    3a684499261d binfmt_flat: Fix corruption when not offsetting data start
    479e23af2015 usb: gadget: u_audio: Check return codes from usb_ep_enable and config_ep_by_speed.
    a6117b3c1bd6 nvme/pci: Add APST quirk for Lenovo N60z laptop
    9b424c5d4130 exec: Fix ToCToU between perm check and set-uid/gid usage
    de9628332253 arm64: cpufeature: Fix the visibility of compat hwcaps
    dde07b87e84b arm64: dts: qcom: msm8996: correct #clock-cells for QMP PHY nodes
    e2afb26615ad powerpc: Avoid nmi_enter/nmi_exit in real mode interrupt.
    911f8055f175 drm/i915/gem: Fix Virtual Memory mapping boundaries calculation
    53d55bea2589 mptcp: fully established after ADD_ADDR echo on MPJ
    badabac392d3 wifi: mac80211: check basic rates validity
    cbf2b2ce6047 PCI: dwc: Restore MSI Receiver mask during resume
    67a03645dc1d net: stmmac: Enable mac_managed_pm phylink config
    8246b7466c8d netfilter: nf_tables: prefer nft_chain_validate
    d7c5f8bd1287 netfilter: nf_tables: allow clone callbacks to sleep
    d71a76f3758e netfilter: nf_tables: bail out if stateful expression provides no .clone
    0d40e8cb1d1f netfilter: nf_tables: use timestamp to check for set element timeout
    9526393ed6c7 netfilter: nf_tables: set element extended ACK reporting support
    dd32621f1924 tls: fix race between tx work scheduling and socket close
    2c111413f38c PCI/DPC: Fix use-after-free on concurrent DPC and hot-removal
    1a607d22dea4 btrfs: fix double inode unlock for direct IO sync writes
    f754591b17d0 xfs: fix log recovery buffer allocation for the legacy h_size fixup
    4e17707035a6 btrfs: fix corruption after buffer fault in during direct IO append write
    9d1f4ecc31ad selftests: mptcp: join: check backup support in signal endp
    34558a433f87 selftests: mptcp: join: validate backup in MPJ
    3c7dafc17196 mptcp: pm: fix backup support in signal endpoints
    ffd002277096 mptcp: export local_address
    2c978352ae21 mptcp: pm: only set request_bkup flag when sending MP_PRIO
    e6e6c678c9cc mptcp: fix bad RCVPRUNED mib accounting
    dff41c5f691f mptcp: mib: count MPJ with backup flag
    3d16add56e32 mptcp: fix NL PM announced address accounting
    6f01f41b6a49 mptcp: distinguish rcv vs sent backup flag in requests
    42c7f7ac9ac3 mptcp: sched: check both directions for backup
    cd8a0ed3d80d drm/mgag200: Set DDC timeout in milliseconds
    8bf13339bf90 drm/bridge: analogix_dp: properly handle zero sized AUX transactions
    2a3548c7ef2e sched/smt: Fix unbalance sched_smt_present dec/inc
    5c66a9672c0d sched/smt: Introduce sched_smt_present_inc/dec() helper
    ca7d00c5656d x86/mtrr: Check if fixed MTRRs exist before saving them
    8f5ffd2af727 padata: Fix possible divide-by-0 panic in padata_mt_helper()
    cd10d186a540 tracing: Fix overflow in get_free_elt()
    77289f29b0c4 power: supply: axp288_charger: Round constant_charge_voltage writes down
    ff03c1b9409e power: supply: axp288_charger: Fix constant_charge_voltage writes
    0ad02834c2bf genirq/irqdesc: Honor caller provided affinity in alloc_desc()
    a2ff3482269d irqchip/xilinx: Fix shift out of bounds
    5bdf4bc692dd kcov: properly check for softirq context
    9196e42a3b8e serial: core: check uartclk for zero to avoid divide by zero
    eb044b9c234f timekeeping: Fix bogus clock_was_set() invocation in do_adjtimex()
    9532482c9163 ntp: Safeguard against time_constant overflow
    9c23fc327d6e driver core: Fix uevent_show() vs driver detach race
    7c921031fa78 irqchip/meson-gpio: Convert meson_gpio_irq_controller::lock to 'raw_spinlock_t'
    2d60656f35ce irqchip/meson-gpio: support more than 8 channels gpio irq
    c5ea55fe2b13 clocksource: Fix brown-bag boolean thinko in cs_watchdog_read()
    fcd4f3a9d92b clocksource: Scale the watchdog read retries automatically
    d607bbc7f049 torture: Enable clocksource watchdog with "tsc=watchdog"
    26dae4c8cb45 clocksource: Reduce the default clocksource_watchdog() retries to 2
    a70401730770 ntp: Clamp maxerror and esterror to operating range
    231897021c55 vhost-vdpa: switch to use vmf_insert_pfn() in the fault handler
    541a900d2455 tick/broadcast: Move per CPU pointer access into the atomic section
    2ac8f14d7f9d scsi: ufs: core: Fix hba->last_dme_cmd_tstamp timestamp updating logic
    cac638238584 scsi: mpi3mr: Avoid IOMMU page faults on REPORT ZONES
    896a3286375a usb: gadget: u_serial: Set start_delayed during suspend
    50c5248b0ea8 usb: gadget: core: Check for unset descriptor
    741403cfbf8b USB: serial: debug: do not echo input by default
    e8c1e606dab8 usb: vhci-hcd: Do not drop references before new references are gained
    a2400556fb43 ALSA: hda/hdmi: Yet more pin fix for HP EliteDesk 800 G4
    296f83154c42 ALSA: hda: Add HP MP9 G4 Retail System AMS to force connect list
    a54da4b787dc ALSA: line6: Fix racy access to midibuf
    c763dfe09425 drm/client: fix null pointer dereference in drm_client_modeset_probe
    ba43e5827e83 ASoC: meson: axg-fifo: fix irq scheduling issue with PREEMPT_RT
    f9727470b1d2 ALSA: usb-audio: Re-add ScratchAmp quirk entries
    4f8c8ededece spi: spi-fsl-lpspi: Fix scldiv calculation
    4b316da441c5 kprobes: Fix to check symbol prefixes correctly
    97182790c0e0 bpf: kprobe: remove unused declaring of bpf_kprobe_override
    87b834b6a528 i2c: smbus: Send alert notifications to all devices if source not found
    efb937c66b2c spi: spidev: Add missing spi_device_id for bh2228fv
    9ffb4dbaa976 ASoC: codecs: wsa881x: Correct Soundwire ports mask
    fce8bfcf72ba ASoC: codecs: wcd938x-sdw: Correct Soundwire ports mask
    93d89bb74d73 i2c: smbus: Improve handling of stuck alerts
    d12517dd095d arm64: errata: Expand speculative SSBS workaround (again)
    60c18204671d arm64: cputype: Add Cortex-A725 definitions
    e36cb8e5cc64 arm64: cputype: Add Cortex-X1C definitions
    724750c88a10 arm64: errata: Expand speculative SSBS workaround
    71098a6e6576 arm64: errata: Unify speculative SSBS errata logic
    15756fac89da arm64: cputype: Add Cortex-X925 definitions
    a518122c2ccd arm64: cputype: Add Cortex-A720 definitions
    67fb54d359d1 arm64: cputype: Add Cortex-X3 definitions
    cc627930b2ac arm64: errata: Add workaround for Arm errata 3194386 and 3312417
    d3760b292b2d arm64: cputype: Add Neoverse-V3 definitions
    48a6a925eab6 arm64: cputype: Add Cortex-X4 definitions
    f69456619434 arm64: barrier: Restore spec_bar() macro
    480bc90406c5 arm64: Add Neoverse-V2 part
    77137d50c91d arm64: cpufeature: Force HWCAP to be based on the sysreg visible to user-space
    f07bf04fbfba ext4: fix wrong unit use in ext4_mb_find_by_goal
    b1343c6f569f sched/cputime: Fix mul_u64_u64_div_u64() precision for cputime
    d939bf5f3795 scsi: mpt3sas: Avoid IOMMU page faults on REPORT ZONES
    0a7fbde518cc profiling: remove profile=sleep support
    3c4ded276f03 SUNRPC: Fix a race to wake a sync task
    a88a49473c94 s390/sclp: Prevent release of buffer in I/O
    459ca6821440 jbd2: avoid memleak in jbd2_journal_write_metadata_buffer
    096ec0bfa3a1 ext4: fix uninitialized variable in ext4_inlinedir_to_tree
    5b8055c38690 media: uvcvideo: Fix the bandwdith quirk on USB 3.x
    7744eb83e1cb media: uvcvideo: Ignore empty TS packets
    d0b8b23b9c2e drm/amd/display: Add null checker before passing variables
    0c065e50445a drm/amdgpu/pm: Fix the null pointer dereference in apply_state_adjust_rules
    56e848034cca drm/amdgpu: Fix the null pointer dereference to ras_manager
    37b9df457cbc drm/amdgpu/pm: Fix the null pointer dereference for smu7
    d836431eb5bc btrfs: fix bitmap leak when loading free space cache on duplicate entry
    b248bf150e4f wifi: nl80211: don't give key data to userspace
    22cc7323f090 udf: prevent integer overflow in udf_bitmap_free_blocks()
    023319525610 PCI: Add Edimax Vendor ID to pci_ids.h
    6f8dc63f8e6a selftests/bpf: Fix send_signal test with nested CONFIG_PARAVIRT
    264087ccbe52 ACPI: SBS: manage alarm sysfs attribute through psy core
    43b24be70e47 ACPI: battery: create alarm sysfs attribute atomically
    2bb27b956a98 clocksource/drivers/sh_cmt: Address race condition for clock events
    bf0ff69a42a3 md/raid5: avoid BUG_ON() while continue reshape after reassembling
    be08dc614bdd md: do not delete safemode_timer in mddev_suspend
    7ce75b3c84e2 rcutorture: Fix rcu_torture_fwd_cb_cr() data race
    79008767d6cf net: fec: Stop PPS on driver remove
    cb85266c6ca3 l2tp: fix lockdep splat
    c05516c07290 net: dsa: bcm_sf2: Fix a possible memory leak in bcm_sf2_mdio_register()
    5caf0ffaf915 Bluetooth: l2cap: always unlock channel in l2cap_conless_channel()
    5df559303570 net: linkwatch: use system_unbound_wq
    1e16828020c6 net: bridge: mcast: wait for previous gc cycles when removing port
    c4251a3decca net: usb: qmi_wwan: fix memory leak for not ip packets
    54b303d8f970 sctp: Fix null-ptr-deref in reuseport_add_sock().
    83f1d094e84b sctp: move hlist_node and hashent out of sctp_ep_common
    e0c647c1c845 x86/mm: Fix pti_clone_entry_text() for i386
    4d143ae78200 x86/mm: Fix pti_clone_pgtable() alignment assumption
    d5371fc8d04b irqchip/mbigen: Fix mbigen node address layout
    d44d1055f305 genirq: Allow irq_chip registration functions to take a const irq_chip
    8a326a2ef8f3 netfilter: ipset: Add list flush to cancel_gc
    83a04f95f5c0 mptcp: fix duplicate data handling
    314d14b04004 r8169: don't increment tx_dropped in case of NETDEV_TX_BUSY
    19eabe988c44 net: usb: sr9700: fix uninitialized variable use in sr_mdio_read
    9e20d028d8d1 drm/vmwgfx: Fix a deadlock in dma buf fence polling
    7c07220cf634 Revert "ALSA: firewire-lib: operate for period elapse event in process context"
    2b9fcb649808 Revert "ALSA: firewire-lib: obsolete workqueue for period update"
    ecf75022936d ALSA: hda/realtek: Add quirk for Acer Aspire E5-574G
    7a0f5ead13c3 ALSA: usb-audio: Correct surround channels in UAC1 channel map
    3f480493550b protect the fetch of ->fd[fd] in do_dup2() from mispredictions
    a8b242a64445 HID: wacom: Modify pen IDs
    b6fc20e9bdef platform/chrome: cros_ec_proto: Lock device when updating MKBP version
    8fcc96708fdb power: supply: bq24190_charger: replace deprecated strncpy with strscpy
    20dbdebc5580 riscv/mm: Add handling for VM_FAULT_SIGSEGV in mm_fault_error()
    434ae939b9c5 ipv6: fix ndisc_is_useropt() handling for PIO
    252c9741cfa2 net/mlx5e: Add a check for the return value from mlx5_port_set_eth_ptys
    419ee6274c51 netfilter: iptables: Fix potential null-ptr-deref in ip6table_nat_table_init().
    b98ddb65fa16 netfilter: iptables: Fix null-ptr-deref in iptable_nat_table_init().
    ab91b2e892d0 net: mvpp2: Don't re-use loop iterator
    ac758e1f663f net/iucv: fix use after free in iucv_sock_close()
    014d0a450a07 rtnetlink: Don't ignore IFLA_TARGET_NETNSID when ifname is specified in rtnl_dellink().
    0c50a4ad8e6e rtnetlink: enable alt_ifname for setlink/newlink
    9e382030bfd6 ALSA: hda: conexant: Fix headset auto detect fail in the polling mode
    3ddefcb8f75e sched: act_ct: take care of padding in struct zones_ht_key
    fed36de9e242 drm/vmwgfx: Fix overlay when using Screen Targets
    16998763c62b drm/nouveau: prime: fix refcount underflow
    0309f66a10ec MIPS: dts: loongson: Fix ls2k1000-rtc interrupt
    33ba9570b4ab MIPS: dts: loongson: Fix liointc IRQ polarity
    e11b89cdcb27 MIPS: Loongson64: DTS: Fix PCIe port nodes for ls7a
    9aeeece87346 MIPS: Loongson64: DTS: Add RTC support to Loongson-2K1000
    380fa8172e24 remoteproc: imx_rproc: Fix refcount mistake in imx_rproc_addr_init
    39b3e0b18f68 drm/dp_mst: Fix all mstb marked as not probed after suspend/resume
    fa1803401e1c irqchip/imx-irqsteer: Handle runtime power management correctly
    0abb3875e53d irqchip/imx-irqsteer: Add runtime PM support
    8e085fa5949e irqchip/imx-irqsteer: Constify irq_chip struct
    64494bfe5be5 genirq: Allow the PM device to originate from irq domain
    50beae26ed0f irqdomain: Fixed unbalanced fwnode get and put
    780785c77e63 leds: triggers: Flush pending brightness before activating trigger
    ab694f667a12 leds: trigger: Call synchronize_rcu() before calling trig->activate()
    ac8f748cccb5 leds: trigger: Store brightness set by led_trigger_event()
    f1a0ef0bade5 leds: trigger: Remove unused function led_trigger_rename_static()
    590304b798a3 leds: trigger: use RCU to protect the led_cdevs list
    96166cca228c drivers: soc: xilinx: check return status of get_api_version()
    2a1833cf2a41 soc: xilinx: move PM_INIT_FINALIZE to zynqmp_pm_domains driver
    69901726a3c9 ext4: check the extent status again before inserting delalloc block
    580adf8e8db6 ext4: factor out a common helper to query extent map
    57ba1bc08528 ext4: convert to exclusive lock while inserting delalloc extents
    5cce19905fef ext4: refactor ext4_da_map_blocks()
    698be0f2e15e ext4: make ext4_es_insert_extent() return void
    34a86adea1f2 sysctl: always initialize i_uid/i_gid
    9ea7fc2788fd arm64: dts: qcom: ipq8074: Disable SS instance in Parkmode for USB
    f913e112bab6 arm64: dts: qcom: msm8998: Disable SS instance in Parkmode for USB
    42821f8410bd arm64: dts: qcom: msm8998: switch USB QMP PHY to new style of bindings
    f7d5d99c0d22 arm64: dts: qcom: msm8998: drop USB PHY clock index
    32f0e52f16d4 arm64: dts: qcom: msm8996: Move '#clock-cells' to QMP PHY child node
    0f0c74eb6a0c powerpc/configs: Update defconfig with now user-visible CONFIG_FSL_IFC
    79186ae126e7 fs: don't allow non-init s_user_ns for filesystems without FS_USERNS_MOUNT
    7cc1f4cd90a0 nvme-pci: add missing condition check for existence of mapped data
    ebb6f1f12090 nvme: separate command prep and issue
    20dd2e9db85d nvme: split command copy into a helper
    8c79ceb4ecf8 iommu: sprd: Avoid NULL deref in sprd_iommu_hw_en
    d76bec2f0d64 ceph: fix incorrect kmalloc size of pagevec mempool
    ed25b6aa3ca8 ASoC: Intel: use soc_intel_is_byt_cr() only when IOSF_MBI is reachable
    20b2def9311d spi: spidev: add correct compatible for Rohm BH2228FV
    6a32ade732ed spi: spidev: order compatibles alphabetically
    bff165a39936 spidev: Add Silicon Labs EM3581 device compatible
    547252602276 spi: spidev: Replace OF specific code by device property API
    b0b3d2432f62 spi: spidev: Replace ACPI specific code by device_get_match_data()
    eb47ec48a88e spi: spidev: Make probe to fail early if a spidev compatible is used
    150af4538397 lirc: rc_dev_get_from_fd(): fix file leak
    05ca5676e1af powerpc: fix a file leak in kvm_vcpu_ioctl_enable_cap()
    290a6b88e8c1 apparmor: Fix null pointer deref when receiving skb during sock creation
    8f4030277dfb mISDN: Fix a use after free in hfcmulti_tx()
    f6bb8c90cab9 bpf: Fix a segment issue when downgrading gso_size
    9e8f558a3afe net: nexthop: Initialize all fields in dumped nexthops
    c56abfb6c27a net: stmmac: Correct byte order of perfect_match
    5eea12767545 tipc: Return non-zero value from tipc_udp_addr2str() on error
    b90d2b3f1730 netfilter: nft_set_pipapo_avx2: disable softinterrupts
    3756c2575110 net: bonding: correctly annotate RCU in bond_should_notify_peers()
    ef1d3d90c76d ipv4: Fix incorrect source address in Record Route option
    b23aaa2ecc3a MIPS: SMP-CPS: Fix address for GCR_ACCESS register for CM3 and later
    6b4ff38c97a3 bpf, events: Use prog to emit ksymbol event for main program
    87b34c8c94e2 dma: fix call order in dmam_free_coherent
    ca667c3c90ea libbpf: Fix no-args func prototype BTF dumping syntax
    2746eeace5cf um: time-travel: fix signal blocking race/hang
    ccff45a1ff43 um: time-travel: fix time-travel-start option
    6516149e03b6 phy: cadence-torrent: Check return value on register read
    f21e71928b0f dmaengine: ti: k3-udma: Fix BCHAN count with UHC and HC channels
    63f7fdf733ad jfs: Fix array-index-out-of-bounds in diFree
    0529ca94f7d8 kdb: Use the passed prompt in kdb_position_cursor()
    a27107234253 kdb: address -Wformat-security warnings
    840c6def242c kernel: rerun task_work while freezing in get_signal()
    5c402f323f17 io_uring/io-wq: limit retrying worker initialisation
    e34191cce3ee nilfs2: handle inconsistent state in nilfs_btnode_create_block()
    cc3c5ae5a7b9 Bluetooth: btusb: Add Realtek RTL8852BE support ID 0x13d3:0x3591
    e9cdf403a86a Bluetooth: btusb: Add RTL8852BE device 0489:e125 to device tables
    4cf7e2a3053a rbd: don't assume RBD_LOCK_STATE_LOCKED for exclusive mappings
    0a97cc547fdc rbd: rename RBD_LOCK_STATE_RELEASING and releasing_wait
    bc4204886c4f drm/panfrost: Mark simple_ondemand governor as softdep
    64ad15893e70 MIPS: Loongson64: Test register availability before use
    77011a1d7a1a MIPS: Loongson64: reset: Prioritise firmware service
    a64a9736d72b MIPS: Loongson64: Remove memory node for builtin-dtb
    103cc2530315 MIPS: Loongson64: env: Hook up Loongsson-2K
    5feae7c2c8bb MIPS: dts: loongson: Fix GMAC phy node
    bc3336666062 MIPS: ip30: ip30-console: Add missing include
    4e13b7c23988 remoteproc: imx_rproc: Skip over memory region when node value is NULL
    d627cc333c81 remoteproc: stm32_rproc: Fix mailbox interrupts queuing
    cfc2304e5cd9 rbd: don't assume rbd_is_lock_owner() for exclusive mappings
    22cc7f013a20 selftests/sigaltstack: Fix ppc64 GCC build
    557d035fe88d RDMA/iwcm: Fix a use-after-free related to destroying CM IDs
    4488eef06dcf platform: mips: cpu_hwmon: Disable driver on unsupported hardware
    2f9bed9e1ca2 watchdog/perf: properly initialize the turbo mode timestamp and rearm counter
    b7fdaab71bb7 rtc: isl1208: Fix return value of nvmem callbacks
    bd8e059c6f97 drm/i915/dp: Reset intel_dp->link_trained before retraining the link
    3ff604499ec6 drm/amdgpu/sdma5.2: Update wptr registers as well as doorbell
    145d4dd823ea drm/i915/gt: Do not consider preemption during execlists_dequeue for gen8
    6efcf9f4d547 perf/x86/intel/pt: Fix a topa_entry base address calculation
    e4181a2c9b47 perf/x86/intel/pt: Fix topa_entry base length
    8020e0657a8a perf/x86/intel/uncore: Fix the bits of the CHA extended umask for SPR
    9ad46f1fef42 perf: Fix event leak upon exec and file release
    67fad724f1b5 perf: Fix event leak upon exit
    cde43031df53 scsi: qla2xxx: validate nvme_local_port correctly
    9117337b04d7 scsi: qla2xxx: Complete command early within lock
    bdfdd57a308a scsi: qla2xxx: Fix flash read failure
    73dbf4d44fc3 scsi: qla2xxx: Use QP lock to search for bsg
    b0302ffc7412 scsi: qla2xxx: Fix for possible memory corruption
    51be74018998 scsi: qla2xxx: Unable to act on RSCN for port online
    b12c54e51ba8 scsi: qla2xxx: During vport delete send async logout explicitly
    5f60a07fb40f rtc: cmos: Fix return value of nvmem callbacks
    dcaa88c2c1d9 mm/numa_balancing: teach mpol_to_str about the balancing mode
    3047f99caec2 devres: Fix memory leakage caused by driver API devm_free_percpu()
    2a4094c646da devres: Fix devm_krealloc() wasting memory
    fcdfc0413a72 gve: Fix an edge case for TSO skb validity check
    c5ee8adc8d98 kobject_uevent: Fix OOB access within zap_modalias_env()
    84bb2f0c98f5 kbuild: Fix '-S -c' in x86 stack protector scripts
    d6570ec38206 decompress_bunzip2: fix rare decompression failure
    a7a59a1234f2 ubi: eba: properly rollback inside self_check_eba
    2ede59d7a794 clk: davinci: da8xx-cfgchip: Initialize clk_init_data before use
    52433f778980 scsi: qla2xxx: Return ENOBUFS if sg_cnt is more than one for ELS cmds
    0484adcb5fbc fs/ntfs3: Update log->page_{mask,bits} if log->page_size changed
    c719b393374d dev/parport: fix the array out-of-bounds risk
    08853ea15d0b binder: fix hang of unregistered readers
    7799c9dd6d8f PCI: rockchip: Use GPIOD_OUT_LOW flag while requesting ep_gpio
    0bba47fec14d PCI: dw-rockchip: Fix initial PERST# GPIO value
    ddd840a191dc PCI: hv: Return zero, not garbage, when reading PCI_INTERRUPT_PIN
    6fa86b2a8bcf hwrng: amd - Convert PCIBIOS_* return codes to errnos
    f5c99f224e64 tools/memory-model: Fix bug in lock.cat
    e05b37ab349c ALSA: usb-audio: Add a quirk for Sonix HD USB Camera
    e3a61bc83eea ALSA: usb-audio: Move HD Webcam quirk to the right place
    f7e3ac300e71 ALSA: usb-audio: Fix microphone sound on HD webcam.
    63173938750d KVM: VMX: Split out the non-virtualization part of vmx_interrupt_blocked()
    c666d46b3f01 media: uvcvideo: Fix integer overflow calculating timestamp
    6db719f299bb jbd2: make jbd2_journal_get_max_txn_bufs() internal
    93d417d39624 leds: ss4200: Convert PCIBIOS_* return codes to errnos
    838fef8e44b0 wifi: mwifiex: Fix interface type change
    fc2ea3b5f726 selftests/landlock: Add cred_transfer test
    6b2e11d782eb io_uring: tighten task exit cancellations
    9771e3d8365a ext4: make sure the first directory block is not a hole
    8afe06ed3be7 ext4: check dot and dotdot of dx_root before making dir indexed
    cca17211c805 m68k: amiga: Turn off Warp1260 interrupts during boot
    6a43e3c210df udf: Avoid using corrupted block bitmap buffer
    f79e54a755f8 task_work: Introduce task_work_cancel() again
    451952f2ff06 task_work: s/task_work_cancel()/task_work_cancel_func()/
    4224da51200e apparmor: use kvfree_sensitive to free data->data
    94aeee7c21dc sched/fair: Use all little CPUs for CPU-bound workloads
    6b5ed0648213 drm/amd/display: Check for NULL pointer
    94f003925c26 scsi: qla2xxx: Fix optrom version displayed in FDMI
    7e52c62ff029 drm/gma500: fix null pointer dereference in psb_intel_lvds_get_modes
    08f45102c81a drm/gma500: fix null pointer dereference in cdv_intel_lvds_get_modes
    a89702729837 ext2: Verify bitmap and itable block numbers before using them
    d55aae5c1730 hfs: fix to initialize fields of hfs_inode_info after hfs_alloc_inode()
    b8044a91dad7 ata: libata-scsi: Honor the D_SENSE bit for CK_COND=1 and no error
    f8e9a63b982a media: venus: fix use after free in vdec_close
    558e339b16fa char: tpm: Fix possible memory leak in tpm_bios_measurements_open()
    215e9a695e4b fuse: verify {g,u}id mount options correctly
    b37f1c530da8 sched/fair: set_load_weight() must also call reweight_task() for SCHED_IDLE tasks
    a3578d3bf87d ipv6: take care of scope when choosing the src addr
    d0a1f9aa70f0 af_packet: Handle outgoing VLAN packets without hardware offloading
    2f9576a9c296 net: netconsole: Disable target before netpoll cleanup
    d3b165c10473 tick/broadcast: Make takeover of broadcast hrtimer reliable
    8b6ad5840fab dt-bindings: thermal: correct thermal zone node name limit
    d240b789dded mm: mmap_lock: replace get_memcg_path_buf() with on-stack buffer
    fa774151f9b7 mm/hugetlb: fix possible recursive locking detected warning
    916c648323fa landlock: Don't lose track of restrictions on cred_transfer
    dc31856c99c8 fs/ntfs3: Missed error return
    f99a44c33fa4 rtc: interface: Add RTC offset to alarm after fix-up
    b23e7de39064 nilfs2: avoid undefined behavior in nilfs_cnt32_ge macro
    10d7b93ecbb2 fs/proc/task_mmu: indicate PM_FILE for PMD-mapped file THP
    ebefb924ceda fs/ntfs3: Fix field-spanning write in INDEX_HDR
    e3e3b3eb54fe fs/ntfs3: Replace inode_trylock with inode_lock
    865da0f08330 pinctrl: freescale: mxs: Fix refcount of child
    e77fe8295bd9 pinctrl: ti: ti-iodelay: fix possible memory leak when pinctrl_enable() fails
    59c849f555d5 pinctrl: ti: ti-iodelay: Drop if block with always false condition
    f57e93aba207 pinctrl: single: fix possible memory leak when pinctrl_enable() fails
    b5aa7fe19c45 pinctrl: core: fix possible memory leak when pinctrl_enable() fails
    44e688040210 pinctrl: rockchip: update rk3308 iomux routes
    bdee29d6786f fs/ntfs3: Fix getting file type
    bd6af2b024fc fs/ntfs3: Missed NI_FLAG_UPDATE_PARENT setting
    eb10ee9fb0b0 fs/ntfs3: Fix transform resident to nonresident for compressed files
    7d99c5a93e86 fs/ntfs3: Merge synonym COMPRESSION_UNIT and NTFS_LZNT_CUNIT
    48c4ac742654 fs/ntfs3: Use ALIGN kernel macro
    2dfb0dcb7812 net: dsa: b53: Limit chip-wide jumbo frame config to CPU ports
    6c57b1714227 net: dsa: mv88e6xxx: Limit chip-wide frame size config to CPU ports
    957a4d1c4c58 netfilter: nf_set_pipapo: fix initial map fill
    fee6d3f75438 netfilter: nft_set_pipapo: constify lookup fn args where possible
    5e2c24f7b091 netfilter: ctnetlink: use helper function to calculate expect ID
    913173f42057 bnxt_re: Fix imm_data endianness
    52238c05973c RDMA/hns: Fix insufficient extend DB for VFs.
    ecc693348c6d RDMA/hns: Fix undifined behavior caused by invalid max_sge
    3c301b8a046b RDMA/hns: Fix missing pagesize and alignment check in FRMR
    dc00026b893e macintosh/therm_windtunnel: fix module unload.
    1b83f8967b6b powerpc/xmon: Fix disassembly CPU feature checks
    a679094b1c49 MIPS: Octeron: remove source file executable bit
    27874ca77bd2 net: missing check virtio
    ea558f10fb05 vhost/vsock: always initialize seqpacket_allow
    24414c842a24 PCI: endpoint: Clean up error handling in vpci_scan_bus()
    a32c9d72025d Input: elan_i2c - do not leave interrupt disabled on suspend failure
    53f1a0c08fbb RDMA/device: Return error earlier if port in not valid
    69e6784f83cb mtd: make mtd_test.c a separate module
    11cd585857e9 ASoC: max98088: Check for clk_prepare_enable() error
    1e3829f6e01f RDMA/rxe: Don't set BTH_ACK_MASK for UC or UD QPs
    9189c23067e3 RDMA/mlx4: Fix truncated output warning in alias_GUID.c
    56e1f54fc6d4 RDMA/mlx4: Fix truncated output warning in mad.c
    3bff42b29a24 Input: qt1050 - handle CHIP_ID reading error
    389f6d5ee179 RDMA/cache: Release GID table even if leak is detected
    f8241991d9f5 RDMA/mlx5: Set mkeys for dmabuf at PAGE_SIZE
    ccca62998958 coresight: Fix ref leak when of_coresight_parse_endpoint() fails
    15c10cc9553f clk: qcom: gcc-sc7280: Update force mem core bit for UFS ICE clock
    cfbd43e37bf1 clk: qcom: branch: Add helper functions for setting retain bits
    82ee9913b137 PCI: Fix resource double counting on remove & rescan
    0d45e9942033 SUNRPC: Fixup gss_status tracepoint error output
    de602aadfb15 sparc64: Fix incorrect function signature and add prototype for prom_cif_init
    c3e33c899d6d ext4: avoid writing unitialized memory to disk in EA inodes
    6bb47c93353b ext4: don't track ranges in fast_commit if inode has inlined data
    8087b63911ba ext4: return early for non-eligible fast_commit track events
    7639acde754e NFSv4.1 another fix for EXCHGID4_FLAG_USE_PNFS_DS for DS server
    533ae7fef359 SUNRPC: avoid soft lockup when transmitting UDP to reachable server.
    524e6b54399d xprtrdma: Fix rpcrdma_reqs_reset()
    b0fece168289 mfd: omap-usb-tll: Use struct_size to allocate tll
    359e5c05ba96 mfd: rsmu: Split core code into separate module
    d856cb53b69a perf intel-pt: Fix exclude_guest setting
    d5f39d2b827e perf intel-pt: Fix aux_watermark calculation for 64-bit size
    cd6b8fc9c16f media: venus: flush all buffers in output plane streamoff
    0619f7750f2b ext4: fix infinite loop when replaying fast_commit
    0781e4231117 Revert "leds: led-core: Fix refcount leak in of_led_get()"
    3efe34f95b1a drm/qxl: Add check for drm_cvt_mode
    4b60f8c55b71 drm/etnaviv: fix DMA direction handling for cached RW buffers
    2f74f09fcce0 perf report: Fix condition in sort__sym_cmp()
    3fb6a9d67cfd leds: trigger: Unregister sysfs attributes before calling deactivate()
    a3d41048e51b drm/mediatek: Add DRM_MODE_ROTATE_0 to rotation property
    a668169b56fe drm/mediatek: Add missing plane settings when async update
    d6f55120eecc media: renesas: vsp1: Store RPF partition configuration per RPF instance
    71732853dc80 media: renesas: vsp1: Fix _irqsave and _irq mix
    3a1e47f47986 media: uvcvideo: Override default flags
    d3259f456ecb saa7134: Unchecked i2c_transfer function result fixed
    dba5dc8a3b3f media: i2c: Fix imx412 exposure control
    477799870120 media: imon: Fix race getting ictx->lock
    bde204dbdafa media: dvb-usb: Fix unexpected infinite loop in dvb_usb_read_remote_control()
    623541e581f0 drm/panel: boe-tv101wum-nl6: Check for errors on the NOP in prepare()
    402e4d38969c drm/panel: boe-tv101wum-nl6: If prepare fails, disable GPIO before regulators
    a8d90f00265d drm/amdgpu: Check if NBIO funcs are NULL in amdgpu_device_baco_exit
    d649eb1f9653 drm/amd/pm: Fix aldebaran pcie speed reporting
    6c390ef198aa xdp: fix invalid wait context of page_pool_destroy()
    28dfdb7d67a4 selftests: forwarding: devlink_lib: Wait for udev events after reloading
    c9b30877a03c bpf: Eliminate remaining "make W=1" warnings in kernel/bpf/btf.o
    6d20c4044ab4 bna: adjust 'name' buf size of bna_tcb and bna_ccb structures
    d933d43eadab bpf: annotate BTF show functions with __printf
    a0737beff634 selftests/bpf: Close fd in error path in drop_on_reuseport
    0c54a73f29b7 locking/rwsem: Add __always_inline annotation to __down_write_common() and inlined callers
    1ff103fb6939 wifi: virt_wifi: don't use strlen() in const context
    8b0f1717ecb3 gss_krb5: Fix the error handling path for crypto_sync_skcipher_setkey
    93e898a264b4 wifi: virt_wifi: avoid reporting connection success with wrong SSID
    e1e354a2cd05 perf: Fix default aux_watermark calculation
    872260112082 perf: Prevent passing zero nr_pages to rb_alloc_aux()
    48767a6992ce perf: Fix perf_aux_size() for greater-than 32-bit size
    84ba02e90546 perf/x86/intel/pt: Fix pt_topa_entry_for_page() address calculation
    8ad0ec7f368d netfilter: nf_tables: rise cap on SELinux secmark context
    bb7e4dedbacb ipvs: Avoid unnecessary calls to skb_is_gso_sctp
    fb274d9c68cd libbpf: Checking the btf_type kind when fixing variable offsets
    7068a11d5714 net: fec: Fix FEC_ECR_EN1588 being cleared on link-down
    b95c9431f2fa net: fec: Refactor: #define magic constants
    576c64622649 wifi: cfg80211: handle 2x996 RU allocation in cfg80211_calculate_bitrate_he()
    2dc00d0f355a wifi: cfg80211: fix typo in cfg80211_calculate_bitrate_he()
    41728c9b3f93 wifi: ath11k: fix wrong handling of CCMP256 and GCMP ciphers
    d794f6261451 mlxsw: spectrum_acl: Fix ACL scale regression and firmware errors
    4b60b403f7b7 mlxsw: spectrum_acl_bloom_filter: Make mlxsw_sp_acl_bf_key_encode() more flexible
    9a5261a984bb mlxsw: spectrum_acl_erp: Fix object nesting warning
    565213e00555 lib: objagg: Fix general protection fault
    4f44cb495c2b selftests/bpf: Check length of recv in test_sockmap
    5bf89e8fdab7 net/smc: set rmb's SG_MAX_SINGLE_ALLOC limitation only when CONFIG_ARCH_NO_SG_CHAIN is defined
    ed3bc31ed0a0 tcp: fix races in tcp_v[46]_err()
    09519197b070 tcp: fix race in tcp_write_err()
    d99b21ace8a3 tcp: add tcp_done_with_error() helper
    7a6a2614561d tcp: annotate lockless access to sk->sk_err
    25eeea5cc87f tcp: annotate lockless accesses to sk->sk_err_soft
    22314f1b0c25 net: esp: cleanup esp_output_tail_tcp() in case of unsupported ESPINTCP
    d0c8fb1b559c selftests/bpf: Fix prog numbers in test_sockmap
    73d8f5a1cb70 wifi: brcmsmac: LCN PHY code is used for BCM4313 2G-only device
    95eff767a4dc firmware: turris-mox-rwtm: Initialize completion before mailbox
    b368066a1b21 firmware: turris-mox-rwtm: Fix checking return value of wait_for_completion_timeout()
    cd84e10affd4 firmware: turris-mox-rwtm: Do not complete if there are no waiters
    6427d6fefb34 vmlinux.lds.h: catch .bss..L* sections into BSS")
    cabdacc08397 ARM: spitz: fix GPIO assignment for backlight
    421eb215125a ARM: pxa: spitz: use gpio descriptors for audio
    d32d5c0d822f m68k: cmpxchg: Fix return value for default case in __arch_xchg()
    9a8362816612 x86/xen: Convert comma to semicolon
    8e368db650ba m68k: atari: Fix TT bootup freeze / unexpected (SCU) interrupt messages
    115db06a3666 arm64: dts: amlogic: gx: correct hdmi clocks
    6dfc6eb5f08f arm64: dts: mediatek: mt8183-kukui-jacuzzi: Add ports node for anx7625
    9f51247d6b1d arm64: dts: mediatek: mt7622: fix "emmc" pinctrl mux
    fbd40f460f34 arm64: dts: mediatek: mt8183-kukui: Drop bogus output-enable property
    030d39eba765 ARM: dts: imx6qdl-kontron-samx6i: fix PCIe reset polarity
    988641b6eebd ARM: dts: imx6qdl-kontron-samx6i: fix SPI0 chip selects
    c716d3e9fa07 ARM: dts: imx6qdl-kontron-samx6i: fix board reset
    5bf37f5338b8 ARM: dts: imx6qdl-kontron-samx6i: fix PHY reset
    241db6dad2f6 ARM: dts: imx6qdl-kontron-samx6i: move phy reset into phy-node
    6adbe72e8b5b arm64: dts: rockchip: Increase VOP clk rate on RK3328
    8e3bd91edaab soc: qcom: pdr: fix parsing of domains lists
    d0870c4847e7 soc: qcom: pdr: protect locator_addr with the main mutex
    e59386c30019 memory: fsl_ifc: Make FSL_IFC config visible and selectable
    67d9adeb851a arm64: dts: qcom: msm8996: specify UFS core_clk frequencies
    0d1d78c2c1fa soc: qcom: rpmh-rsc: Ensure irqs aren't disabled by rpmh_rsc_send_data() callers
    c32836dfe3fd arm64: dts: qcom: sm8250: add power-domain to UFS PHY
    6bb3dc543b7a arm64: dts: qcom: sm8250: switch UFS QMP PHY to new style of bindings
    34ce7f7278c4 arm64: dts: qcom: sdm845: add power-domain to UFS PHY
    6c1c93494dea hwmon: (max6697) Fix swapped temp{1,8} critical alarms
    8822f44f7333 hwmon: (max6697) Fix underflow when writing limit attributes
    0b9a36505476 drm/meson: fix canvas release in bind function
    62bae56ce765 pwm: stm32: Always do lazy disabling
    1da47a5a1f4a hwmon: (adt7475) Fix default duty on fan is disabled
    0f109f8cf185 x86/platform/iosf_mbi: Convert PCIBIOS_* return codes to errnos
    fab5dc353993 x86/pci/xen: Fix PCIBIOS_* return code handling
    b47ce2e7202b x86/pci/intel_mid_pci: Fix PCIBIOS_* return code handling
    d63fda6ebe1a x86/of: Return consistent error type from x86_of_pci_irq_enable()
    603d064d406a hfsplus: fix to avoid false alarm of circular locking
    cf6b45ea7a8d block: initialize integrity buffer to zero before writing it to media
    260dab50a1a7 block: cleanup bio_integrity_prep
    4c566a1c2bea block: refactor to use helper
    608475b52da1 platform/chrome: cros_ec_debugfs: fix wrong EC message version
    2259b26ff45a EDAC, i10nm: make skx_common.o a separate module
    ec56571b4b14 f2fs: fix to don't dirty inode for readonly filesystem
    70f5ef5f33c3 f2fs: fix return value of f2fs_convert_inline_inode()
    e6a43185a1bd octeontx2-af: Remove unrelated changes introduced when merging v5.15/standard/base
    7c317bec311f f2fs: check validation of fault attrs in f2fs_build_fault_attr()
    81c12119c23f bpf: Fix accesses to uninit stack slots [ Upstream commit 6b4a64bafd107e521c01eec3453ce94a3fb38529 ]
    c4fa05422d87 smb: client: fix potential OOB in smb2_dump_detail()
    299ef3b5b00b of: module: add buffer overflow check in of_modalias()
    cdf1fbdb57b4 Linux 5.15.158-rt76
    d1782d26fc85 Linux 5.15.153-rt75
    31eb6c72870a Linux 5.15.148-rt74
    19d6dc150eba Linux 5.15.145-rt73
    b8086c3c1548 reiserfs: Avoid touching renamed directory if parent does not change
    ea091017ef62 ipv6: Fix data races around sk->sk_prot.
    ff8710da80ee ipv6: annotate some data-races around sk->sk_prot
    e8c2eafaaa6a tcp: Fix data races around icsk->icsk_af_ops.
    8d1bab770956 locking/rwsem: Disable preemption while trying for rwsem lock
    7c82dac02886 block, loop: support partitions without scanning
    45f504f301d4 bpftool: Fix pretty print dump for maps without BTF loaded
    2b654ae07464 Linux 5.15.141-rt72
    5ae18c1bad70 drm/i915: Do not disable preemption for resets
    e231c3cb8e7c posix-timers: Ensure timer ID search-loop limit is valid
    8039b1f68b6f bpf: Remove in_atomic() from bpf_link_put().
    6161a8a868e2 mm/page_alloc: Use write_seqlock_irqsave() instead write_seqlock() + local_irq_save().
    758ca2219bab sched: avoid false lockdep splat in put_task_struct()
    a0b272c43e0a debugobjects,locking: Annotate debug_object_fill_pool() wait type violation
    b09c457e6d26 debugobject: Ensure pool refill (again)
    5fb44556da73 Revert "softirq: Let ksoftirqd do its job"
    1dc8565b13f4 locking/rwbase: Mitigate indefinite writer starvation
    1d6effd9e0f5 io-mapping: don't disable preempt on RT in io_mapping_map_atomic_wc().
    1f24338cb789 jbd2: Drop the merge conflicted hunk
    3ca0d714c7c1 tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    e57456047118 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    0fe0d24b5c78 tpm: Add flag to use default cancellation policy
    43d4e811ed5d tpm: tis_i2c: Fix sanity check interrupt enable mask
    6aeca5727a4d tpm: Add tpm_tis_i2c backend for tpm_tis_core
    7a646e274e8e tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    d65d402bb7ad tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    e1d0e3c51bde tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    1abe841fe331 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    6224acfc1d56 tpm: Add flag to use default cancellation policy
    1cd19d48fb90 tpm: tis_i2c: Fix sanity check interrupt enable mask
    a883da132fa8 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    a742ac8a1c51 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    ef495c5f45f2 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    1f3be2e23aa6 gcc-plugins: Reorganize gimple includes for GCC 13
    24615a3b932a ata: ahci: fix enum constants for gcc-13
    f7b59cf09dff 'Linux 5.15.96-rt61'
    1c906ed4bd61 'Linux 5.15.95-rt60'
    5d6cb145541a net: stmmac: Enable mac_managed_pm phylink config
    63a865cbbc8a mm/page_alloc: Drop the deferred printing
    fd93aabb4287 tools/resolve_btfids: Use pkg-config to locate libelf
    130f9da78406 tools/resolve_btfids: Build with host flags
    00f2f1a782f9 tools/resolve_btfids: Support cross-building the kernel with clang
    17776a4ba9c2 tools/resolve_btfids: Install libbpf headers when building
    7c9808380d70 libbpf: Make libbpf_version.h non-auto-generated
    37ae1ba791ac libbpf: Add LIBBPF_DEPRECATED_SINCE macro for scheduling API deprecations
    4d335265c101 'Linux 5.15.94-rt59'
    c3b4464f5d2b 'Linux 5.15.93-rt58'
    c67bd325f576 'Linux 5.15.92-rt57'
    48e551ae0f55 'Linux 5.15.86-rt56'
    977a63a270ad 'Linux 5.15.85-rt55'
    adaa1d9e19a5 'Linux 5.15.79-rt54'
    ff3c61c5ead1 'Linux 5.15.76-rt53'
    e17260e8d340 'Linux 5.15.73-rt52'
    c83f436b7981 'Linux 5.15.71-rt51'
    e01c9e3ba82d 'Linux 5.15.70-rt50'
    debedeb4264e mm/memcg: Only perform the debug checks on !PREEMPT_RT
    1ef2cd0b8676 mm/memcg: Add a comment regarding the release `obj'.
    f8d153e08d42 mm/memcg: Add missing counter index which are not update in interrupt.
    11624404f67a mm/memcg: Disable migration instead of preemption in drain_all_stock().
    0a1f4de6ed4f mm/memcg: Protect memcg_stock with a local_lock_t
    3f15202f27da mm/memcg: Opencode the inner part of obj_cgroup_uncharge_pages() in drain_obj_stock()
    40dbbd2f9773 mm/memcg: Protect per-CPU counter by disabling preemption on PREEMPT_RT where needed.
    6269831106f5 mm/memcg: Disable threshold event handlers on PREEMPT_RT
    8da0e71b7b7d mm/memcg: Revert ("mm/memcg: optimize user context object stock access")
    45e3750e4458 'Linux 5.15.65-rt49'
    a4e36ed13a3b arm: Fix the "invalid constant" error when assembling entry-common.S
    82f18d6a09c0 arm: merge fixup for duplicate TIF_NOTIFY_SIGNAL and other TIF_*
    a2667e6d7314 drm/radeon: free iio for atombios when driver shutdown
    f100c753aa1f powerpc: Fix reschedule bug in KUAP-unlocked user copy
    da5513f30187 libbpf: Fix build warning on ref_ctr_off
    4c5a089621a8 perf python: Account for multiple words in CC
    1c5699ee85d4 fs: move S_ISGID stripping into the vfs_*() helpers
    838f5d0701d8 fs: add mode_strip_sgid() helper
    d97172683641 squashfs: provide backing_dev_info in order to disable read-ahead
    ed037d7be40c irq_work: use kasan_record_aux_stack_noalloc() record callstack
    1363bd7dbde3 ixgbevf: add disable link state
    e5601ae2bd24 ixgbe: add improvement for MDD response functionality
    caa57cd80575 ixgbe: add the ability for the PF to disable VF link state
    16a77bfcc7df Check /dev/console using init_stat()
    04574fd5579a tracing/arm: Have max stack tracer handle the case of return address after data
    0e51e5717018 gpiolib: cdev: Set lineevent_state::irq after IRQ register successfully
    1e6b7da6ddba drivers/base: Fix unsigned comparison to -1 in CPUMAP_FILE_MAX_BYTES
    493160901320 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    04224f725aa3 irqchip/gic-v3-its: Skip HP notifier when no ITS is registered
    6f6c2996a81c irqchip/gic-v3-its: Postpone LPI pending table freeing and memreserve
    1fa94473423f irqchip/gic-v3-its: Give the percpu rdist struct its own flags field
    6013d1ae5feb cert host tools: Stop complaining about deprecated OpenSSL functions
    efe20512212b init/Kconfig: fix CC_HAS_ASM_GOTO_TIED_OUTPUT test with dash
    6bc08dd702bb 'Linux 5.15.55-rt48'
    9a1a3c0162ef sched/core: Always flush pending blk_plug
    f178a16e9368 crypto/cryptd: fix leftover hunks from 2a30446f4
    0e01a5c5a80e 'Linux 5.15.49-rt47'
    2aa2253a0595 'Linux 5.15.44-rt46'
    c94ef3468bef 'Linux 5.15.43-rt45'
    264141c33af3 'Linux 5.15.41-rt44'
    9934b33b68d9 'Linux 5.15.40-rt43'
    ca63907ee4b7 'Linux 5.15.39-rt42'
    238b266d7aa8 sched/deadline: fixup -stable / -rt merge
    a40d2daf2795 pnmtologo: use relocatable file name
    3b40d5b41155 of: configfs: remove unused variable overlay_lock
    6c085baf1838 tools: use basename to identify file in gen-mach-types
    2fca0fd71981 lib/build_OID_registry: fix reproducibility issues
    0f586f4ee8ad vt/conmakehash: improve reproducibility
    a75774679f28 OF: DT-Overlay configfs interface (v8)
    23374f7aa074 printk/rt: fixup 5.15-stable merge
    d179c639b30b x86/boot: Wrap literal addresses in absolute_pointer()
    83bec9a458bf rt: fixup random and irq/manage merge issues
    856ec356cf91 ACPI: thermal: drop an always true check
    7614af249993 xfs: Fix -Werror=dangling-pointer work-around for older GCC
    41470215f97e xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    44a445c1922d virtio-pci: Remove wrong address verification in vp_del_vqs()
    77aa9e489eaf bpf: Disallow unprivileged bpf by default
    6991d3cb4877 Linux 5.15.36-rt41
    bc407f70bc87 Linux 5.15.34-rt40
    8b85316a6763 Linux 5.15.32-rt39
    713e04ecea94 Linux 5.15.31-rt38
    4718a7a13c94 Linux 5.15.29-rt37
    5d854189d406 Linux 5.15.28-rt36
    6c7c91516867 Linux 5.15.27-rt35
    ebfb1822e9f9 fs/aufs: fixup 5.15.36 fixups
    b64046617467 inet/hash: fixup -rt merge
    4eba9348d3e2 Revert "Revert "fbdev: Hot-unplug firmware fb devices on forced removal""
    5df6d1b00f95 jbd2: fix use-after-free of transaction_t race
    2d83e8196487 jbd2: refactor wait logic for transaction updates into a common function
    07a63f760793 netfilter: conntrack: avoid useless indirection during conntrack destruction
    4e7122625996 Revert "fbdev: Hot-unplug firmware fb devices on forced removal"
    7ba4cb36fd4f rcu: Avoid alloc_pages() when recording stack
    f78574dee71e kasan: test: silence intentional read overflow warnings
    d313cb89b6b1 kasan: arm64: fix pcpu_page_first_chunk crash with KASAN_VMALLOC
    5e279d5647cc arm64: support page mapping percpu first chunk allocator
    e5bf16752dca vmalloc: choose a better start address in vm_area_register_early()
    660b3d21b46f kasan: test: bypass __alloc_size checks
    00aa7573e53a kasan: test: add memcpy test that avoids out-of-bounds write
    67becf0b1bd4 kasan: fix tag for large allocations when using CONFIG_SLAB
    bedf1e033213 workqueue, kasan: avoid alloc_pages() when recording stack
    7195b67ce69b kasan: generic: introduce kasan_record_aux_stack_noalloc()
    bdff763f0e29 kasan: common: provide can_alloc in kasan_save_stack()
    51423ebb36ad lib/stackdepot: introduce __stack_depot_save()
    85373e66d847 lib/stackdepot: remove unused function argument
    5b6cc9b251f3 lib/stackdepot: include gfp.h
    29d051cc421a aufs: update compile fix for v5.15+ preempt-rt kernels
    c9f3902d8069 aufs: reduce overhead for "code present but disabled" use case.
    b98d189df02c aufs: bugfix, umount passes NULL to ->parse_monolithic()
    13b883cbbbd9 aufs standalone: cosmetic, missing copyright sentence
    21f8b0d81898 aufs: 5.15.5-20220117 ---> 5.15.5-20220221
    6199fd896645 aufs: tiny, headers after fs_context
    8ddb40e31c29 aufs: fs_context 7/7, finally remount
    69035f71c6fd aufs: fs_context 6/7, now mount
    bc841b970697 aufs: fs_context 5/7, parse all other mount options
    435188053da2 aufs: fs_context 4/7, parse xino options
    9af1f1825cbd aufs: fs_context 3/7, parse the branch-management options
    1c05eb767f8c aufs: fs_context 2/7, parse "br" mount option
    a8488f603134 aufs: fs_context 1/7, skelton of the new shceme
    8e32e0015564 aufs: pre fs_context, convert a static flag to a macro
    f90cb4144aec aufs: pre fs_context, support the incomplete sb and sbinfo case
    948762ef859c aufs: pre fs_context, convert the type of alloc_sbinfo()
    77151a08776b aufs: 5.15.5-20211129 ---> 5.15.5-20220117
    2539adbbbe1e aufs: 5.14-20211018 ---> 5.15.5-20211129
    7d32b25193c4 aufs: for v5.15-rc1, sync_inode() is gone
    66ec0c509225 aufs: for v5.15-rc1, new param 'rcu' for ->get_acl()
    69709dc518cd aufs: for v5.15-rc1, no mand-lock anymore
    ada8fe9543e5 aufs: 5.14-20210906  ---> 5.14-20211018
    b77f7f3f394a Revert "aufs: adjust to v5.15 fs changes"
    3f9f162d9bb0 aufs: i_op: Add handling for au_pin_hdir_set_owner with RT kernel
    931d5079b9fc Linux 5.15.26-rt34
    c5c22d2fdb7b Linux 5.15.25-rt33
    6a2e3e6c9401 staging: greybus: gpio: Use generic_handle_irq_safe().
    cb17d0820286 net: usb: lan78xx: Use generic_handle_irq_safe().
    a4040e8669d8 mfd: ezx-pcap: Use generic_handle_irq_safe().
    870d69c5f090 misc: hi6421-spmi-pmic: Use generic_handle_irq_safe().
    3718dd5011f4 i2c: cht-wc: Use generic_handle_irq_safe().
    1252887f9872 i2c: core: Use generic_handle_irq_safe() in i2c_handle_smbus_host_notify().
    5aa6ecf9212a genirq: Provide generic_handle_irq_safe().
    1c73db1779a6 Linux 5.15.25-rt32
    2e68dcd8d632 Linux 5.15.24-rt31
    5ec703bf5ccc net: Write lock dev_base_lock without disabling bottom halves.
    15bd5dea95e6 Linux 5.15.21-rt30
    88c15a185ab7 Linux 5.15.19-rt29
    a70f09a4d312 Linux 5.15.18-rt28
    771d328d2646 Linux 5.15.14-rt27
    b56e1f0d87ba Linux 5.15.13-rt26
    5e8adc085a2b Linux 5.15.12-rt25
    ea0f771b9442 Linux 5.15.10-rt24
    269b39adfb2c Linux 5.15.7-rt23
    81bdce5b5876 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    97c963889222 sched/isolation: really align nohz_full with rcu_nocbs
    871f23ad3627 Revert "ARM: defconfig: Enable ax88796c driver for Exynos boards"
    ffad0783dd5b ARM: config: multi v7: Regenerate defconifg
    5c1e1a1ff2d3 ARM: config: multi v7: Add renamed symbols
    badaf96564fe ARM: config: multi v7: Clean up enabled by default options
    34996040fc9b ARM: config: multi v7: Drop unavailable options
    05e1d4873542 ARM: config: multi v7: Regenerate defconifg
    4510f665a53a ARM: config: multi v7: Add renamed symbols
    d021435a532a ARM: config: multi v7: Clean up enabled by default options
    dbf8daa0ee01 ARM: config: multi v7: Drop unavailable options
    7f685244afb3 powerpc/mm: Switch obsolete dssall to .long
    20301aeb1a64 riscv: fix build with binutils 2.38
    9df58d070506 powerpc/lib/sstep: fix 'ptesync' build error
    720b61fc400b x86_64_defconfig: Fix warnings
    799919ec2113 v5.15.5-rt22
    4745560a36e7 v5.15.3-rt21
    9b4d36e0fbeb v5.15.2-rt20
    d156320aca54 net: sched: gred: dynamically allocate tc_gred_qopt_offload
    d36603e0d213 v5.15.2-rt19
    7ddf3a205fa3 mm/vmalloc: Remove unused `cpu' variable.
    3f8e7f777049 v5.15.2-rt18
    7b0fd383bb9a printk: fixup -stable merge to -rt
    02bf23d26bc4 arm64: defconfig: cleanup config options
    05914e2c87e5 arm: defconfig: drop unused POWER_AVS option
    ffb532fa19b9 aufs5: fix build against v5.15.3+
    6f51b8d2b7dc Add localversion for -RT release
    3c8ff0c09156 sysfs: Add /sys/kernel/realtime entry
    828d8f9b903f POWERPC: Allow to enable RT
    6db76b613e53 powerpc/stackprotector: work around stack-guard init from atomic
    44be16e0180a powerpc/kvm: Disable in-kernel MPIC emulation for PREEMPT_RT
    a5c27dfc178a powerpc/pseries/iommu: Use a locallock instead local_irq_save()
    dce767609e50 powerpc: traps: Use PREEMPT_RT
    9cad1f8c7dd7 ARM64: Allow to enable RT
    5bd881944e4f ARM: Allow to enable RT
    715792fbbaf7 tty/serial/pl011: Make the locking work on RT
    69221f2f5b91 tty/serial/omap: Make the locking RT aware
    5fa50218f3e3 arm64: signal: Use ARCH_RT_DELAYS_SIGNAL_SEND.
    c004c410d380 arm64/sve: Make kernel FPU protection RT friendly
    7ffcb4485981 arm64/sve: Delay freeing memory in fpsimd_flush_thread()
    322561563b01 KVM: arm/arm64: downgrade preempt_disable()d region to migrate_disable()
    fe5ed302a1ec ARM: enable irq in translation/section permission fault handlers
    f17af435c3a3 arch/arm64: Add lazy preempt support
    10e096c7a491 powerpc: Add support for lazy preemption
    5e15c21804be arm: Add support for lazy preemption
    abc04080e1b3 entry: Fix the preempt lazy fallout
    2fb1741e933b x86: Support for lazy preemption
    24b379de7afc x86/entry: Use should_resched() in idtentry_exit_cond_resched()
    860dbaa27ad1 sched: Add support for lazy preemption
    4d5c9c824eee */softirq: Disable softirq stacks on PREEMPT_RT
    2676f33e2cf4 generic/softirq: Disable softirq stacks on PREEMPT_RT
    1886700e5658 leds: trigger: Disable CPU trigger on PREEMPT_RT
    694e3f263964 drivers/block/zram: Replace bit spinlocks with rtmutex for -rt
    97f765c75d6d mm/zsmalloc: Replace bit spinlock and get_cpu_var() usage.
    49c7010ff12e tpm_tis: fix stall after iowrite*()s
    df583a002c38 virt: acrn: Remove unsued acrn_irqfds_mutex.
    a68737287907 smack: Guard smack_ipv6_lock definition within a SMACK_IPV6_PORT_LABELING block
    ac9df8459eda ASoC: mediatek: mt8195: Remove unsued irqs_lock.
    02bc2e3cbe09 genirq: update irq_set_irqchip_state documentation
    ac932078b2e6 x86: Enable RT also on 32bit
    e262f9f76c5b x86: Allow to enable RT
    fef570ba4596 x86: kvm Require const tsc for RT
    e5a9202c3535 signal/x86: Delay calling signals in atomic
    2c0f317da8b9 drm/i915: Drop the irqs_disabled() check
    06b3f43f370b drm/i915/gt: Use spin_lock_irq() instead of local_irq_disable() + spin_lock()
    ac58ec9af512 drm/i915/gt: Queue and wait for the irq_work item.
    aaa6ddcfd053 drm/i915: skip DRM_I915_LOW_LEVEL_TRACEPOINTS with NOTRACE
    6db29073f209 drm/i915: Disable tracing points on PREEMPT_RT
    5d34e949e11c drm/i915: Don't check for atomic context on PREEMPT_RT
    0ca85efbe2e9 drm/i915: Don't disable interrupts on PREEMPT_RT during atomic updates
    688ce2658570 drm/i915: Use preempt_disable/enable_rt() where recommended
    9a76a256848c drm/i915: Don't disable interrupts and pretend a lock as been acquired in __timeline_mark_lock().
    766248132ccf random: Make it work on rt
    ba411ba63b8e x86: stackprotector: Avoid random pool on rt
    3c158aab9acc panic: skip get_random_bytes for RT_FULL in init_oops_id
    bf099c9ff70f net: dev: always take qdisc's busylock in __dev_xmit_skb()
    783862056952 net: Dequeue in dev_cpu_dead() without the lock
    61793a50d51d net: Use skbufhead with raw lock
    4e369dc108af net/core: use local_bh_disable() in netif_rx_ni()
    8056c6bd6380 rcu: Delay RCU-selftests
    1372b981252b fs/dcache: disable preemption on i_dir_seq's write side
    8f35827f634d fs/dcache: use swait_queue instead of waitqueue
    dc26bf05c680 ptrace: fix ptrace vs tasklist_lock race
    54332013d985 signal: Revert ptrace preempt magic
    65309bca8d9c mm/memcontrol: Disable on PREEMPT_RT
    5d193966a444 u64_stats: Disable preemption on 32bit-UP/SMP with RT during updates
    9e7c9b1a7d21 softirq: Check preemption after reenabling interrupts
    0d4e38f0610e crypto: cryptd - add a lock instead preempt_disable/local_bh_disable
    4a01578f1878 sunrpc: Make svc_xprt_do_enqueue() use get_cpu_light()
    03f8b0f0eedb net: Remove preemption disabling in netif_rx()
    ddd725b42e48 mm/vmalloc: Another preempt disable region which sucks
    28545272667f scsi/fcoe: Make RT aware.
    dcb042c59ca4 md: raid5: Make raid5_percpu handling RT aware
    393999301a85 block/mq: do not invoke preempt_disable()
    8485ff82f922 kernel/sched: add {put|get}_cpu_light()
    274408c7b291 sched: Make preempt_enable_no_resched() behave like preempt_enable() on PREEMPT_RT
    9708837923a7 locking: Allow to include asm/spinlock_types.h from linux/spinlock_types_raw.h
    b5f1fc042d2f lockdep/selftests: Adapt ww-tests for PREEMPT_RT
    3e6dd28f0231 lockdep/selftests: Skip the softirq related tests on PREEMPT_RT
    0da6a4f59354 lockdep/selftests: Unbalanced migrate_disable() & rcu_read_lock()
    b29dc4a9ef20 lockdep/selftests: Add rtmutex to the last column
    db92f5fc3fb7 lockdep: Make it RT aware
    fae24609aafa rtmutex: Add rt_mutex_lock_nest_lock() and rt_mutex_lock_killable().
    9d8c380fa819 rtmutex: Add a special case for ww-mutex handling.
    d6b24f0f2a8a sched: Trigger warning if ->migration_disabled counter underflows.
    6e09a284f2a6 lockdep/selftests: Avoid using local_lock_{acquire|release}().
    bd833044483a locking: Remove rt_rwlock_is_contended()
    36839db14247 jump-label: disable if stop_machine() is used
    5a657ef837de tcp: Remove superfluous BH-disable around listening_hash
    c11095ec78ef mm: workingset: replace IRQ-off check with a lockdep assert.
    168e3d8875c7 cgroup: use irqsave in cgroup_rstat_flush_locked()
    639d2eb6493f sched: Move mmdrop to RCU on RT
    590419b10863 sched: Delay task stack freeing on RT
    37860896be2e sched: Move kprobes cleanup out of finish_task_switch()
    dc3565cd6bbd sched: Disable TTWU_QUEUE on RT
    77db91d4d2b5 sched: Limit the number of task migrations per batch on RT
    8ea3ab8bb409 locking/rt: Take RCU nesting into account for __might_resched()
    b2f56dfeab18 sched: Make cond_resched_lock() variants RT aware
    9bac73a04b71 sched: Make RCU nest depth distinct in __might_resched()
    4f3dd3cb71e5 sched: Make might_sleep() output less confusing
    b8c4ad5ceaec sched: Cleanup might_sleep() printks
    588c973bd55b sched: Remove preempt_offset argument from __might_sleep()
    5b8fbf83bb40 sched: Make cond_resched_*lock() variants consistent vs. might_sleep()
    8e4b532478f2 sched: Clean up the might_sleep() underscore zoo
    3a5e868f92f0 fscache: Use only one fscache_object_cong_wait.
    67ba86618a1e fs/namespace: Boost the mount_lock.lock owner instead of spinning on PREEMPT_RT.
    cad3bedc2a83 smp: Wake ksoftirqd on PREEMPT_RT instead do_softirq().
    394e3bdd3242 irq_poll: Use raise_softirq_irqoff() in cpu_dead notifier
    4de8f9d6a1ad irq_work: Also rcuwait for !IRQ_WORK_HARD_IRQ on PREEMPT_RT
    87e75faa338d irq_work: Handle some irq_work in a per-CPU thread on PREEMPT_RT
    d2100f67254d irq_work: Allow irq_work_sync() to sleep if irq_work() no IRQ support.
    ada60e0098ea sched/rt: Annotate the RT balancing logic irqwork as IRQ_WORK_HARD_IRQ
    f657de711e15 net: stats: Read the statistics in ___gnet_stats_copy_basic() instead of adding.
    0d3a9c303dd9 net: sched: remove one pair of atomic operations
    853f1349041a net: sched: fix logic error in qdisc_run_begin()
    68f3b93760b7 net: sched: Allow statistics reads from softirq.
    86e29a3d2d68 net: sched: Remove Qdisc::running sequence counter
    304640d0b862 net: sched: Merge Qdisc::bstats and Qdisc::cpu_bstats data types
    1c7a827367ee net: sched: Use _bstats_update/set() instead of raw writes
    22701ce1b59f net: sched: Protect Qdisc::bstats with u64_stats
    54538aff544a u64_stats: Introduce u64_stats_set()
    69534c384086 gen_stats: Move remaining users to gnet_stats_add_queue().
    e1f89d46623c mq, mqprio: Use gnet_stats_add_queue().
    d3968711bb65 gen_stats: Add gnet_stats_add_queue().
    c2b1af791919 gen_stats: Add instead Set the value in __gnet_stats_copy_basic().
    3d38b89d239a net/sched: sch_ets: properly init all active DRR list handles
    b59a9b759b1a kcov: Replace local_irq_save() with a local_lock_t.
    8e2db8a2201a kcov: Avoid enable+disable interrupts if !in_task().
    d244291fb820 kcov: Allocate per-CPU memory on the relevant node.
    6eec9f99da0e Documentation/kcov: Define `ip' in the example.
    e619eb9cb198 Documentation/kcov: Include types.h in the example.
    f002c820156b x86/softirq: Disable softirq stacks on PREEMPT_RT
    12b80085754b mm: Disable NUMA_BALANCING_DEFAULT_ENABLED and TRANSPARENT_HUGEPAGE on PREEMPT_RT
    a1411120989b mm/scatterlist: Replace the !preemptible warning in sg_miter_stop()
    56fb69cc8a0b mm: page_alloc: Use migrate_disable() in drain_local_pages_wq()
    39d1d6a46eaa mm: Allow only SLUB on PREEMPT_RT
    bf1b661248f6 crypto: testmgr - Only disable migration in crypto_disable_simd_for_test()
    ddd1767afd69 samples/kfifo: Rename read_lock/write_lock
    a6c921dd2368 net/core: disable NET_RX_BUSY_POLL on PREEMPT_RT
    96cc6b82ae54 mm: Disable zsmalloc on PREEMPT_RT
    f77af3465961 efi: Allow efi=runtime
    8b3cde535f8f efi: Disable runtime services on RT
    7082e94c5405 lockdep: Let lock_is_held_type() detect recursive read as read
    ffc314d30f16 genirq: Disable irqfixup/poll on PREEMPT_RT.
    1ec49f38b6ae genirq: Move prio assignment into the newly created thread
    e272fc66d6bc kthread: Move prio/affinite change into the newly created thread
    468813504d5a rcutorture: Avoid problematic critical section nesting on PREEMPT_RT
    e6a408241cee sched: Switch wait_task_inactive to HRTIMER_MODE_REL_HARD
    cd6bda4839a6 printk: Enhance the condition check of msleep in pr_flush()
    2ad1282d77e8 printk: add pr_flush()
    cd582486f3e8 printk: add console handover
    25f13bd1d07b printk: remove deferred printing
    2d440f3f2ee5 printk: move console printing to kthreads
    df0a27dbd128 printk: introduce kernel sync mode
    4efb519165f1 printk: use seqcount_latch for console_seq
    8653ea7d3c45 printk: call boot_delay_msec() in printk_delay()
    892cddfada1f printk: relocate printk_delay()
    e1ac77117990 serial: 8250: implement write_atomic
    967b98b7c528 kdb: only use atomic consoles for output mirroring
    36422a33e3b3 console: add write_atomic interface
    7b9055c4c17d printk: rename printk cpulock API and always disable interrupts
    3791dee37847 arm64: mm: Make arch_faults_on_old_pte() check for migratability
    e5b82790a28d sched: Introduce migratable()
    0cf3b776c423 rcu/tree: Protect rcu_rdp_is_offloaded() invocations on RT
    a4b3abf4d96d qemux86: add configuration symbol to select values
    fee94ee09154 clear_warn_once: add a clear_warn_once= boot parameter
    3d8762d900d9 clear_warn_once: bind a timer to written reset value
    95faacac47e8 clear_warn_once: expand debugfs to include read support
    de20c4240018 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    0e4aacead9c1 perf: x86-32: explicitly include <errno.h>
    9ad92c11468e perf: mips64: Convert __u64 to unsigned long long
    09e7efe3e68a perf: fix bench numa compilation
    e79becc44fa6 perf: add SLANG_INC for slang.h
    b1033b588681 perf: add sgidefs.h to for mips builds
    cf9db484ac0b perf: change --root to --prefix for python install
    7fd052c2c562 perf: add 'libperl not found' warning
    27a437cdd469 perf: force include of <stdbool.h>
    3b99d21bec2f fat: don't use obsolete random32 call in namei_vfat
    a7e9293b506b FAT: Added FAT_NO_83NAME
    6fd0e71d9e5c FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    c379b0d324ae FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    538be0fdb124 aufs: adjust to v5.15 fs changes
    f45da75c8759 aufs5: core
    047f57e07e01 aufs5: standalone
    029fc15574c8 aufs5: mmap
    610d0192ee94 aufs5: base
    d4e428d0ec5f aufs5: kbuild
    eb067eca251a yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    286af18d0875 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    24d59a4e26a6 yaffs2: v5.12+ build fixups (not runtime tested)
    22c73536d5d7 yaffs: include blkdev.h
    506b7251bfb8 yaffs: fix misplaced variable declaration
    a0e26ff364dc yaffs2: v5.6 build fixups
    b10b1b2d169e yaffs2: fix memory leak when /proc/yaffs is read
    ad9adccbb214 yaffs: add strict check when call yaffs_internal_read_super
    2e3c3aec8279 yaffs: repair yaffs_get_mtd_device
    d662538516a7 yaffs: Fix build failure by handling inode i_version with proper atomic API
    70a6113ee2c7 yaffs2: fix memory leak in mount/umount
    3378e4a9e404 yaffs: Avoid setting any ACL releated xattr
    ec2284edddef Yaffs:check oob size before auto selecting Yaffs1
    c2a49874051c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    e9a5105a3e73 yaffs2: adjust to proper location of MS_RDONLY
    608807406f13 yaffs2: import git revision b4ce1bb (jan, 2020)
    89e660ece42c initramfs: allow an optional wrapper script around initramfs generation
    b179dbc9aa10 iwlwifi: select MAC80211_LEDS conditionally
    3fd5ca3673d0 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    d1f6edbf0188 arm64/perf: Fix wrong cast that may cause wrong truncation
    d202fb2caf33 defconfigs: drop obselete options
    9a27e3b5f4e7 arm64/perf: fix backtrace for AAPCS with FP enabled
    e20d8cf019b4 linux-yocto: Handle /bin/awk issues
    b6d2a3dbbd3a uvesafb: provide option to specify timeout for task completion
    adb40f1e6a1a uvesafb: print error message when task timeout occurs
    f280a1ed0962 compiler.h: Undef before redefining __attribute_const__
    4352732f268c vmware: include jiffies.h
    7954a677968d Resolve jiffies wrapping about arp
    5f28a1035d95 nfs: Allow default io size to be configured.
    0d7260ad7106 check console device file on fs when booting
    900a12e37e0a mount_root: clarify error messages for when no rootfs found
    7b878cbea726 menuconfig,mconf-cfg: Allow specification of ncurses location
    6604fc1763b3 modpost: mask trivial warnings
    0d294adb09cb kbuild: exclude meta directory from distclean processing
    a097cdd95a9e powerpc: serialize image targets
    5db6ec39a0a3 arm: serialize build targets
    cbabca27905e crtsavres: fixups for 5.4+
    7fc7656ed403 powerpc/ptrace: Disable array-bounds warning with gcc8
    a5faac5a19a2 powerpc: Disable attribute-alias warnings from gcc8
    186c54665b67 powerpc: add crtsavres.o to archprepare for kbuild
    d1ea862964ca powerpc: kexec fix for powerpc64
    2ac35b89a0f9 powerpc: Add unwind information for SPE registers of E500 core
    2e1c348a28bb mips: vdso: fix 'jalr $t9' crash in vdso code
    ec57870b303a mips: Kconfig: add QEMUMIPS64 option
    6a81b3c08107 4kc cache tlb hazard: tlbp cache coherency
    74e3b2a21e54 malta uhci quirks: make allowance for slow 4k(e)c
    22e65b63d3b4 arm/Makefile: Fix systemtap
    b7f1ab59f19e vexpress: Pass LOADADDR to Makefile
    ce2800c73bf7 arm: ARM EABI socketcall
    019d142fd956 ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 49e580f7e1..459268e821 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ac5e398055e97136165efed6894a43ed8653f889"
-SRCREV_meta ?= "6975e512fd99bccf35a7e257532b9c0eb134519b"
+SRCREV_machine ?= "648e2b0d0a1c9a9bb317bdb55b29993f2e0af2d0"
+SRCREV_meta ?= "8a6c91bd89f5c33849168f27e46984d7d3f2096a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.164"
+LINUX_VERSION ?= "5.15.165"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index aca30cedc9..56934b4969 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.164"
+LINUX_VERSION ?= "5.15.165"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "eadae004a94c5d0493b1f8a468fba0be26992a06"
-SRCREV_meta ?= "6975e512fd99bccf35a7e257532b9c0eb134519b"
+SRCREV_machine ?= "8dae928d1dd4ddfbc311ba6260984e110f739183"
+SRCREV_meta ?= "8a6c91bd89f5c33849168f27e46984d7d3f2096a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 0209ed1ad0..639d68c277 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8b286046b21b66a29e230ad7351b860b6aa2c550"
-SRCREV_machine:qemuarm64 ?= "fff468175b7b8245d6fc879838c5aa18ee14b4ed"
-SRCREV_machine:qemumips ?= "62db590dcb8639442872980bc2d25c0b671b52cf"
-SRCREV_machine:qemuppc ?= "c07fd78bfccea5b38cdeda707b3501b5b477175a"
-SRCREV_machine:qemuriscv64 ?= "62668d7a159c070de488aa68681641f59389b4cd"
-SRCREV_machine:qemuriscv32 ?= "62668d7a159c070de488aa68681641f59389b4cd"
-SRCREV_machine:qemux86 ?= "62668d7a159c070de488aa68681641f59389b4cd"
-SRCREV_machine:qemux86-64 ?= "62668d7a159c070de488aa68681641f59389b4cd"
-SRCREV_machine:qemumips64 ?= "519192c1b0ece4ee37c31977e62031aa8de75cfb"
-SRCREV_machine ?= "62668d7a159c070de488aa68681641f59389b4cd"
-SRCREV_meta ?= "6975e512fd99bccf35a7e257532b9c0eb134519b"
+SRCREV_machine:qemuarm ?= "de43915ea5c320615b33faac4c978fb5198a5c0f"
+SRCREV_machine:qemuarm64 ?= "431eb5ac3e3e1a4b59dbc3a24187a73342149608"
+SRCREV_machine:qemumips ?= "d2ad175f9908bdd74b52cfffdd63dffe5c3fc58b"
+SRCREV_machine:qemuppc ?= "302b961f25eb7a0810e10642fde14d66dee71431"
+SRCREV_machine:qemuriscv64 ?= "14993927ac7b21eda3feac4752b4b694f44beaaf"
+SRCREV_machine:qemuriscv32 ?= "14993927ac7b21eda3feac4752b4b694f44beaaf"
+SRCREV_machine:qemux86 ?= "14993927ac7b21eda3feac4752b4b694f44beaaf"
+SRCREV_machine:qemux86-64 ?= "14993927ac7b21eda3feac4752b4b694f44beaaf"
+SRCREV_machine:qemumips64 ?= "84c58d392f4efc9c8e070ed134be1cae96942805"
+SRCREV_machine ?= "14993927ac7b21eda3feac4752b4b694f44beaaf"
+SRCREV_meta ?= "8a6c91bd89f5c33849168f27e46984d7d3f2096a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "7e89efd3ae1cfa05fe918588a92628b9bbeda4b2"
+SRCREV_machine:class-devupstream ?= "fa93fa65db6e232b5f2226dd86c9f066ec6dfd97"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.164"
+LINUX_VERSION ?= "5.15.165"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


