Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45167C52D6D
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 15:17:58 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.71065.1722525474944985672
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 08:17:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wtgz8jdu;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7a1dac7f0b7so446236185a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722525474; x=1723130274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/Df/HjDMQTwClLMtQv5o9XlnGwu9RaqbYOSsFHczPY=;
        b=Wtgz8jdub4CIcdhq/4FI+0ZQILAiezCH/WtTkFb76oAxzgOdZM4ARDxE+gk+LVGFfU
         qTOeUc8BrFbkDVCAH0pfmUBh88E0NoEIrr4xDL+rsF9Gnf6/Z4ZguwSsjdhGCXGGfzbE
         nxPiJ5gpXFzbA+vnMwkCxEJAgEkoWJjBJiDtV+zm139fkc70PxwQH5k1/RtghpYwiy12
         icKtzxkDDYOoWTyjbIJK4k7ivCI2wP3g8XclKXI/hoVwFwkq46LEKA7t92A68reJ5L+b
         yRQBsuX+VhCN0lHLVbnSFx21kEUWP+HriNWfuFQvRUjeABXLJv5Tx6270Lxf5ZKUW9VX
         lmJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722525474; x=1723130274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/Df/HjDMQTwClLMtQv5o9XlnGwu9RaqbYOSsFHczPY=;
        b=g8lgQl0Jk1b6mU9F70ehnM0IvJOLINQqAiyiIc0yjK2TJXtvn27TtgEDWzahTgbQIq
         I8BqTSlV6foUOGoPl7rXr8IDzwbDQUPG11OkbxEI52jjiKXRDLKFAPUqJjYvJOYqGmT3
         8oW13b54gOaej1mPRc/y84rntJZAqG3RhVeuM/RlEYVWILr5x40tISc8Qo/2UWY3hRG5
         arxhe0T+C3S2fyiSF+mZ+n+m8JUAfwGgIQ1/nAvystn5pWg+P/MHFg6JcAYIMRCqwQlY
         z/46D9trYvyjmXxcCoei985vFHKwQtJ6TxUgR42ZxMFIXaRmsvccInrWwVVZrjrahPAv
         Jq+A==
X-Gm-Message-State: AOJu0YywgkjvUSVD8ySg2ilRFGDtyuhfH7lwkmKKcGTmuKSvJ7rg9NcS
	ZnWmgHc42BAlBgA/cgkd5mG2tQoB8b4zgl8GjiAl6gRXwvtbBMDMrgJm14sm
X-Google-Smtp-Source: AGHT+IGVX8QQPS7gafHMuAUDClFlibcDHegR+9nRVBHoznogDB3uyZcPlWN6OuthQGqWLTUXQgddRw==
X-Received: by 2002:a05:620a:244d:b0:7a1:e1d1:fcee with SMTP id af79cd13be357-7a34ef0af6amr33695985a.20.1722525473330;
        Thu, 01 Aug 2024 08:17:53 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d73ee80esm863306085a.70.2024.08.01.08.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:17:52 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 5/6] linux-yocto/5.15: update to v5.15.162
Date: Thu,  1 Aug 2024 11:17:45 -0400
Message-Id: <20240801151746.3685916-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240801151746.3685916-1-bruce.ashfield@gmail.com>
References: <20240801151746.3685916-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 15:17:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202756

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    f45bea23c39c Linux 5.15.162
    69cdccf53725 tracing/net_sched: NULL pointer dereference in perf_trace_qdisc_reset()
    500bfbababce serial: 8250_omap: Fix Errata i2310 with RX FIFO level check
    c3507e8da743 arm64: dts: rockchip: Add sound-dai-cells for RK3368
    43d892943631 arm64: dts: rockchip: fix PMIC interrupt pin on ROCK Pi E
    f2474803e4fc ARM: dts: rockchip: rk3066a: add #sound-dai-cells to hdmi node
    468ef1530f0f KVM: arm64: vgic-v4: Make the doorbell request robust w.r.t preemption
    da38b55cd5c2 efi/x86: Free EFI memory map only when installing a new one.
    7e5a18bbe4d0 efi: xen: Set EFI_PARAVIRT for Xen dom0 boot on all architectures
    b898fae96331 efi: memmap: Move manipulation routines into x86 arch tree
    7670c5cbdf34 efi: Correct comment on efi_memmap_alloc
    78eed2c89c74 drivers: fix typo in firmware/efi/memmap.c
    fcd31dd8291b tcp: Fix data races around icsk->icsk_af_ops.
    5088b4d4f91f ipv6: Fix data races around sk->sk_prot.
    cb632144aed3 ipv6: annotate some data-races around sk->sk_prot
    e710727f4391 nfs: Leave pages in the pagecache if readpage failed
    a556ab1925ec pwm: stm32: Refuse too small period requests
    76da46c25dfc syscalls: fix sys_fanotify_mark prototype
    16c0403b7dec syscalls: fix compat_sys_io_pgetevents_time64 usage
    dbb226d81cd0 ftruncate: pass a signed offset
    5dde5f8b7902 ata: libata-core: Fix double free on error
    82f1a6910b3e ata: ahci: Clean up sysfs file on error
    a726d01d54c0 batman-adv: Don't accept TT entries for out-of-spec VIDs
    5eecb49a6c26 drm/nouveau/dispnv04: fix null pointer dereference in nv17_tv_get_hd_modes
    29c0fdf49078 drm/i915/gt: Fix potential UAF by revoke of fence registers
    7f35e01cb0ea drm/amdgpu: avoid using null object of framebuffer
    0d17604f2e44 drm/nouveau/dispnv04: fix null pointer dereference in nv17_tv_get_ld_modes
    c85d02f5bdb5 hexagon: fix fadvise64_64 calling conventions
    574afeec2f33 csky, hexagon: fix broken sys_sync_file_range
    79d2e629ecd8 sh: rework sync_file_range ABI
    32523b5717f0 kbuild: Install dtb files as 0644 in Makefile.dtbinst
    227dbe069a3c cpu/hotplug: Fix dynstate assignment in __cpuhp_setup_state_cpuslocked()
    1762ca80c2b7 net: can: j1939: enhanced error handling for tightly received RTS messages in xtp_rx_rts_session_new
    684f6709a17d net: can: j1939: recover socket queue on CAN bus error during BAM transmission
    4c5dc3927e17 net: can: j1939: Initialize unused data in j1939_send_one()
    4a4b2a33a357 tty: mcf: MCF54418 has 10 UARTS
    87257a28271c serial: 8250_omap: Implementation of Errata i2310
    7026576e8909 usb: dwc3: core: remove lock of otg mode during gadget suspend/resume to avoid deadlock
    1aac4be1aaa5 usb: atm: cxacru: fix endpoint checking in cxacru_bind()
    04ab997a63ba usb: musb: da8xx: fix a resource leak in probe()
    aa14dca6392a usb: gadget: printer: fix races against disable
    7abdf15c0c8e usb: gadget: printer: SS+ support
    7faf881854f7 net: usb: ax88179_178a: improve link status logs
    4c3bf788a45e iio: chemical: bme680: Fix sensor data read operation
    7a13d1357658 iio: chemical: bme680: Fix overflows in compensate() functions
    2edd0078e368 iio: chemical: bme680: Fix calibration data variable
    093d57259da8 iio: chemical: bme680: Fix pressure value output
    97cec39e61b7 iio: accel: fxls8962af: select IIO_BUFFER & IIO_KFIFO_BUF
    70908f430a2b iio: adc: ad7266: Fix variable checking bug
    9cab73566eb5 i2c: testunit: discard write requests while old command is running
    ae7871cc3ee8 i2c: testunit: don't erase registers after STOP
    7d8692671e5f mmc: sdhci: Do not lock spinlock around mmc_gpio_get_ro()
    9e77eb1a2a8c mmc: sdhci: Do not invert write-protect twice
    c389127e6947 mmc: sdhci-pci: Convert PCIBIOS_* return codes to errnos
    320273b5649b ocfs2: fix DIO failure due to insufficient transaction credits
    89c0dc93e564 parisc: use generic sys_fanotify_mark implementation
    2d07fea561d6 x86: stop playing stack games in profile_pc()
    064cfc7c2544 gpiolib: cdev: Disallow reconfiguration without direction (uAPI v1)
    70b48899f3f2 gpio: davinci: Validate the obtained number of IRQs
    287ea87ded8b drm/panel: simple: Add missing display timing flags for KOE TX26D202VM0BWA
    1c504edf1e48 nvme: fixup comment for nvme RDMA Provider Type
    ae4228a0a519 drm/radeon/radeon_display: Decrease the size of allocated memory
    70eb95e06427 soc: ti: wkup_m3_ipc: Send NULL dummy message instead of pointer message
    3d189e1a8152 media: dvbdev: Initialize sbuf
    7a18293fd8d8 ALSA: emux: improve patch ioctl data validation
    39173b04abda crypto: ecdh - explicitly zeroize private_key
    a55afc0f5f20 net/dpaa2: Avoid explicit cpumask var allocation on stack
    0af718a690ac net/iucv: Avoid explicit cpumask var allocation on stack
    8656ef8a9288 RDMA/restrack: Fix potential invalid address access
    43c39193d4f9 bpf: Add a check for struct bpf_fib_lookup size
    3f210d912874 mtd: partitions: redboot: Added conversion of operands to a larger type
    8607d7ccbf71 x86/fpu: Fix AMD X86_BUG_FXSAVE_LEAK fixup
    e1e4fb853aac vduse: Temporarily fail if control queue feature requested
    9649f8fdf83d vduse: validate block features only with block devices
    489f38de3375 drm/panel: ilitek-ili9881c: Fix warning with GPIO controllers that sleep
    a359696856ca bpf: Take return from set_memory_ro() into account with bpf_prog_lock_ro()
    461302e07f49 netfilter: nf_tables: fully validate NFT_DATA_VALUE on store to data registers
    3c5b9d05cec6 tcp: fix tcp_rcv_fastopen_synack() to enter TCP_CA_Loss for failed TFO
    950edaecc068 parisc: use correct compat recv/recvfrom syscalls
    9330cff1d4df sparc: fix compat recv/recvfrom syscalls
    acc3b8ee3828 sparc: fix old compat_sys_select()
    527bec1f56ac Fix race for duplicate reqsk on identical SYN
    57a1a06755e2 tcp: Use BPF timeout setting for SYN ACK RTO
    1d3e3b3aa2cb xdp: Remove WARN() from __xdp_reg_mem_model()
    9509b3269726 net: phy: micrel: add Microchip KSZ 9477 to the device table
    1d885efda88d ibmvnic: Free any outstanding tx skbs during scrq reset
    9eb0295f39dc net: dsa: microchip: fix initial port flush problem
    544ab46b7ece ASoC: fsl-asoc-card: set priv->pdev before using it
    e827e077a93d net: stmmac: Assign configured channel value to EXTTS event
    a03c3a34692f net: mdio: add helpers to extract clause 45 regad and devad fields
    4d020c1dbd2b drm/amdgpu: fix UBSAN warning in kv_dpm.c
    537bc27213ed cifs: fix typo in module parameter enable_gcm_256
    86ed0b350d44 pinctrl: rockchip: fix pinmux reset in rockchip_pmx_set
    a29846058819 pinctrl: rockchip: use dedicated pinctrl type for RK3328
    8f1b6cea9707 pinctrl: rockchip: fix pinmux bits for RK3328 GPIO3-B pins
    96903ed0e846 pinctrl: rockchip: fix pinmux bits for RK3328 GPIO2-B pins
    01fe2f885f78 pinctrl: fix deadlock in create_pinctrl() when handling -EPROBE_DEFER
    906faa4eee0a Input: ili210x - fix ili251x_read_touch_data() return value
    75afd8724739 gve: Clear napi->skb before dev_kfree_skb_any()
    b9b194dc3045 gve: Add RX context.
    4d59364add6a ACPI: x86: Force StorageD3Enable on more products
    029f2adf933a ACPI: x86: utils: Add Picasso to the list for forcing StorageD3Enable
    21f5dd36e655 smb: client: fix deadlock in smb2_find_smb_tcon()
    09783e2c024b x86/amd_nb: Check for invalid SMN reads
    34566c9c5ae3 PCI: Add PCI_ERROR_RESPONSE and related definitions
    f0f1bd244a85 perf/core: Fix missing wakeup when waiting for context reference
    ab4458bc32cb riscv: fix overlap of allocated page and PTR_ERR
    c1cb08c5a128 riscv: mm: init: try best to use IS_ENABLED(CONFIG_64BIT) instead of #ifdef
    3a20de3273d2 kheaders: explicitly define file modes for archived headers
    6aef00795f70 Revert "kheaders: substituting --sort in archive creation"
    4b9646f7fa02 drm/i915/gt: Disarm breadcrumbs if engines are already idle
    881ba5db3190 drm/i915/gt: Only kick the signal worker if there's been an update
    5e08b49ab291 ksmbd: ignore trailing slashes in share paths
    e492449549e9 x86/cpu: Fix x86_match_cpu() to match just X86_VENDOR_INTEL
    31446e391180 x86/cpu/vfm: Add new macros to work with (vendor/family/model) values
    96c75227ead5 tracing: Add MODULE_DESCRIPTION() to preemptirq_delay_test
    5a1922adc579 bcache: fix variable length array abuse in btree_iter
    d999d28e24d0 pmdomain: ti-sci: Fix duplicate PD referrals
    a5cca15b1a5c wifi: rtlwifi: rtl8192de: Fix 5 GHz TX power
    516aa9badb75 rtlwifi: rtl8192de: Style clean-ups
    751f50473977 ARM: dts: samsung: smdk4412: fix keypad no-autorepeat
    e5861d7faa93 ARM: dts: samsung: exynos4412-origen: fix keypad no-autorepeat
    f7fd57754c10 ARM: dts: samsung: smdkv310: fix keypad no-autorepeat
    e24d9a5c7375 perf script: Show also errors for --insn-trace option
    69c5f3ca1650 perf: script: add raw|disasm arguments to --insn-trace option
    b3f36a58e0cd drm/amd/display: revert Exit idle optimizations before HDCP execution
    716b29202db2 arm64: dts: imx8qm-mek: fix gpio number for reg_usdhc2_vmmc
    26c89fffcbf9 dt-bindings: i2c: google,cros-ec-i2c-tunnel: correct path to i2c-controller schema
    667b2471501b i2c: ocores: set IACK bit after core is enabled
    1ab1f442aab8 tcp: clear tp->retrans_stamp in tcp_rcv_fastopen_synack()
    b679b54b2cbc kcov: don't lose track of remote references during softirqs
    18647a78feb9 gcov: add support for GCC 14
    cf1cc8fcfe51 drm/radeon: fix UBSAN warning in kv_dpm.c
    e68266f2788a drm/i915/mso: using joiner is not possible with eDP MSO
    f553e58ddea5 ALSA: hda/realtek: Limit mic boost on N14AP7
    731df07602e5 KVM: x86: Always sync PIR to IRR prior to scanning I/O APIC routes
    2311fd03027d btrfs: retry block group reclaim without infinite loop
    78e4aa528a7b net: do not leave a dangling sk pointer, when socket creation fails
    8f64b185f53b serial: stm32: rework RX over DMA
    1e692244bf7d RDMA/mlx5: Add check for srq max_sge attribute
    dc5017c57f5e ACPICA: Revert "ACPICA: avoid Info: mapping multiple BARs. Your kernel is fine."
    fad7776dd9dd regulator: bd71815: fix ramp values
    b0f0bc72ec82 dmaengine: ioatdma: Fix missing kmem_cache_destroy()
    6666a3a137eb dmaengine: ioatdma: Fix kmemleak in ioat_pci_probe()
    e84cee6c468f dmaengine: ioatdma: Fix error path in ioat3_dma_probe()
    d83f755a6e3e dmaengine: ioat: use PCI core macros for PCIe Capability
    f063620856c6 dmaengine: ioatdma: Fix leaking on version mismatch
    7b1192a0842d dmaengine: ioat: Drop redundant pci_enable_pcie_error_reporting()
    a5dac50aee71 dmaengine: ioat: switch from 'pci_' to 'dma_' API
    1b08bf5a17c6 dmaengine: idxd: Fix possible Use-After-Free in irq_process_work_list
    1cfcb0cf2508 regulator: core: Fix modpost error "regulator_get_regmap" undefined
    9a314d3e5717 net: usb: rtl8150 fix unintiatilzed variables in rtl8150_get_link_ksettings
    bf9beea46130 bnxt_en: Restore PTP tx_avail count in case of skb_pad() error
    af90e3d73dc4 seg6: fix parameter passing when calling NF_HOOK() in End.DX4 and End.DX6 behaviors
    523bed6489e0 netfilter: ipset: Fix suspicious rcu_dereference_protected()
    7c9df04ea3a1 octeontx2-pf: Add error handling to VLAN unoffload handling
    0359fea1c117 virtio_net: checksum offloading handling fix
    2145583e5995 net: stmmac: No need to calculate speed divider when offload is disabled
    4b03da87d0b7 ptp: fix integer overflow in max_vclocks_store
    aa1f81fe3a05 sched: act_ct: add netns into the key of tcf_ct_flow_table
    4b361712667c net/sched: act_ct: set 'net' pointer when creating new nf_flow_table
    692803b39a36 tipc: force a dst refcount before doing decryption
    25987a97eec4 net/sched: act_api: fix possible infinite loop in tcf_idr_check_alloc()
    815bd4e2d152 net/sched: act_api: rely on rcu in tcf_idr_check_alloc
    e57495a0c388 qca_spi: Make interrupt remembering atomic
    cb7f811f638a netns: Make get_net_ns() handle zero refcount net
    9f30f1f1a51d xfrm6: check ip6_dst_idev() return value in xfrm6_get_saddr()
    569c9d9ea664 ipv6: prevent possible NULL dereference in rt6_probe()
    4cdfe813015d ipv6: prevent possible NULL deref in fib6_nh_init()
    280cf1173726 netrom: Fix a memory leak in nr_heartbeat_expiry()
    fbf722769712 cipso: fix total option length computation
    98a7bfc48fff tracing: Build event generation tests only as modules
    89167072fd24 mips: bmips: BCM6358: make sure CBR is correctly set
    9c82759c9c00 MIPS: Routerboard 532: Fix vendor retry check code
    5e93c2602710 serial: exar: adding missing CTI and Exar PCI ids
    7f2b9ab6d0b2 serial: imx: Introduce timeout when waiting on transmitter empty
    25998f561315 MIPS: Octeon: Add PCIe link status check
    3992ce79c919 PCI/PM: Avoid D3cold for HP Pavilion 17 PC/1972 PCIe Ports
    4f4ab8fb00a3 udf: udftime: prevent overflow in udf_disk_stamp_to_time()
    7c3bb96a20cd Avoid hw_desc array overrun in dw-axi-dmac
    4eaf2331a779 usb: misc: uss720: check for incompatible versions of the Belkin F5U002
    724429db09e2 f2fs: remove clear SB_INLINECRYPT flag in default_options
    34e0e05161cb iommu/arm-smmu-v3: Free MSIs in case of ENOMEM
    e63f071b916d power: supply: cros_usbpd: provide ID table for avoiding fallback match
    9ad656ec23a4 powerpc/io: Avoid clang null pointer arithmetic warnings
    262e942ff5a8 powerpc/pseries: Enforce hcall result buffer validity and size
    70aa1f2dec46 drm/lima: mask irqs in timeout path before hard reset
    2e0d73a2abb0 drm/lima: add mask irq callback to gp and pp
    ffabdc44b538 drm/amd/display: Exit idle optimizations before HDCP execution
    df8eaae03878 Bluetooth: ath3k: Fix multiple issues reported by checkpatch.pl
    8f917f517b24 ACPI: video: Add backlight=native quirk for Lenovo Slim 7 16ARH7
    f4223566f4d2 HID: Add quirk for Logitech Casa touchpad
    efd29cd9c7b8 netpoll: Fix race condition in netpoll_owner_active
    a5bd59e04819 kselftest: arm64: Add a null pointer check
    397a8990c377 scsi: qedi: Fix crash while reading debugfs attribute
    b3722fb69468 drop_monitor: replace spin_lock by raw_spin_lock
    03ea65b91f1f af_packet: avoid a false positive warning in packet_setsockopt()
    b37b1b660eae wifi: ath9k: work around memset overflow warning
    92176caf9896 batman-adv: bypass empty buckets in batadv_purge_orig_ref()
    ec874fb27fff selftests/bpf: Fix flaky test btf_map_in_map/lookup_update
    f4258833ffb3 selftests/bpf: Prevent client connect before server bind in test_tc_tunnel.sh
    3220c90f4dbd block/ioctl: prefer different overflow check
    103b56af907c rcutorture: Fix invalid context warning when enable srcu barrier testing
    b56e19015809 rcutorture: Make stall-tasks directly exit when rcutorture tests end
    48b0a8596f86 rcutorture: Fix rcu_torture_one_read() pipe_count overflow comment
    a886bcb0f67d crypto: hisilicon/sec - Fix memory leak for sec resource release
    ec7afa254367 padata: Disable BH when taking works lock on MT path
    a3dff121a7f5 Bluetooth: qca: fix info leak when fetching board id
    f257d5614941 Bluetooth: qca: Fix error code in qca_read_fw_build_info()
    8e69e589f233 zap_pid_ns_processes: clear TIF_NOTIFY_SIGNAL along with TIF_SIGPENDING
    8e9499ca912e i2c: designware: Fix the functionality flags of the slave-only interface
    42bb4ac55239 i2c: at91: Fix the functionality flags of the slave-only interface
    3eee13ab67f6 usb-storage: alauda: Check whether the media is initialized
    fb071f5c75d4 greybus: Fix use-after-free bug in gb_interface_release due to race condition.
    3f507f4a5bb0 kbuild: Remove support for Clang's ThinLTO caching
    b4697a762d8c mptcp: pm: update add_addr counters after connect
    9c2ed72112f3 mptcp: pm: inc RmAddr MIB counter once per RM_ADDR ID
    f571c8ab18a3 hugetlb_encode.h: fix undefined behaviour (34 << 26)
    3f92924d6f4b serial: 8250_pxa: Configure tx_loadsz to match FIFO IRQ level
    688bb46ad339 mm/huge_memory: don't unpoison huge_zero_folio
    3e5a49e3a2cc scsi: mpi3mr: Fix ATA NCQ priority support
    ecb7ab3a3288 tick/nohz_full: Don't abuse smp_call_function_single() in tick_setup_device()
    33900d7eae61 nilfs2: fix potential kernel bug due to lack of writeback flag waiting
    a942289800be intel_th: pci: Add Lunar Lake support
    90fa01534e14 intel_th: pci: Add Meteor Lake-S support
    4dbfc57316da intel_th: pci: Add Sapphire Rapids SOC support
    2b6e0d427bc3 intel_th: pci: Add Granite Rapids SOC support
    0bb4c9482bdf intel_th: pci: Add Granite Rapids support
    714950089aa7 dmaengine: axi-dmac: fix possible race in remove()
    85dac3dc9c81 PCI: rockchip-ep: Remove wrong mask on subsys_vendor_id
    38825ff9da91 ocfs2: fix races between hole punching and AIO+DIO
    fc1d429c857e ocfs2: use coarse time for new created files
    e1b160a50c75 fs/proc: fix softlockup in __read_vmcore
    4f2fd2a3789e knfsd: LOOKUP can return an illegal error value
    a4d9818ff52d spmi: hisi-spmi-controller: Do not override device identifier
    95ac3e773a1f vmci: prevent speculation leaks by sanitizing event in event_deliver()
    4959ffc65a0e sock_map: avoid race between sock_map_close and sk_psock_put
    efede53ad14b null_blk: Print correct max open zones limit in null_init_zoned_dev()
    367ef3c86557 tracing/selftests: Fix kprobe event name test for .isra. functions
    7b9c7fc8600b mptcp: ensure snd_una is properly initialized on connect
    6d6bb258d886 drm/exynos: hdmi: report safe 640x480 mode as a fallback when no EDID found
    777838c9b571 drm/exynos/vidi: fix memory leak in .get_modes()
    ec772ed7cb21 drivers: core: synchronize really_probe() and dev_uevent()
    085656620ba1 iio: imu: inv_icm42600: delete unneeded update watermark call
    d0f8616e11ab iio: dac: ad5592r: fix temperature channel scaling value
    e5134860a929 iio: adc: ad9467: fix scan type sign
    fa38ee41c952 af_unix: Read with MSG_PEEK loops if the first unread byte is OOB
    8edd18dab443 ionic: fix use after netif_napi_del()
    7aae016b231a net/ipv6: Fix the RT cache flush via sysctl using a previous delay
    76b34e5899ba net: stmmac: replace priv->speed with the portTransmitRate from the tc-cbs parameters
    0f1bb77c6d83 netfilter: ipset: Fix race between namespace cleanup and gc in the list:set type
    3c2a6dd63106 Bluetooth: L2CAP: Fix rejecting L2CAP_CONN_PARAM_UPDATE_REQ
    caf273553348 net/mlx5e: Fix features validation check for tunneled UDP (non-VXLAN) packets
    cba6c9058303 tcp: fix race in tcp_v6_syn_recv_sock()
    6e5164a5b757 drm/bridge/panel: Fix runtime warning on panel bridge release
    86042e3d16b7 drm/komeda: check for error-valued pointer
    a86490a3712c liquidio: Adjust a NULL pointer handling path in lio_vf_rep_copy_packet
    eeadf207a2c0 net: hns3: add cond_resched() to hns3 ring buffer init process
    62b5dfb67bfa net: hns3: fix kernel crash problem in concurrent scenario
    29c451129ebe net: sfp: Always call `sfp_sm_mod_remove()` on remove
    40e767bfc10d drm/vmwgfx: 3D disabled should not effect STDU memory limits
    a0503757947f HID: logitech-dj: Fix memory leak in logi_dj_recv_switch_to_dj_mode()
    2973b8e7d127 iommu: Return right value in iommu_sva_bind_device()
    05a61b03a81f iommu/amd: Fix sysfs leak in iommu init
    d37895aeacdd iommu/amd: Introduce pci segment structure
    8bac61934cd5 HID: core: remove unnecessary WARN_ON() in implement()
    bc0ab111f001 gpio: tqmx86: store IRQ trigger type and unmask status separately
    05f45f065821 gpio: tqmx86: fix typo in Kconfig label
    7625992f16c3 platform/x86: dell-smbios: Fix wrong token data in sysfs
    beec9b57e9f6 platform/x86: dell-smbios-base: Use sysfs_emit()
    9e6c4b1027b0 SUNRPC: return proper error from gss_wrap_req_priv
    6487966b4863 clk: sifive: Do not register clkdevs for PRCI clocks
    29d991419edd Input: try trimming too long modalias strings
    40c2bdef8104 powerpc/uaccess: Fix build errors seen with GCC 13/14
    521f333e644c scsi: mpt3sas: Avoid test/set_bit() operating in non-allocated memory
    42ce0d444be9 xhci: Apply broken streams quirk to Etron EJ188 xHCI host
    26460c1afa31 xhci: Handle TD clearing for multiple streams case
    8348dd97ab5c xhci: Apply reset resume quirk to Etron EJ188 xHCI host
    df2615cd7680 xhci: Set correct transferred length for cancelled bulk transfers
    480e5bc21f2c jfs: xattr: fix buffer overflow for invalid xattr
    3e89411cbb99 mei: me: release irq in mei_me_pci_resume error path
    62e939abae58 usb: typec: tcpm: Ignore received Hard Reset in TOGGLING state
    53250b54c92f USB: class: cdc-wdm: Fix CPU lockup caused by excessive log messages
    11a2edb70356 nilfs2: fix nilfs_empty_dir() misjudgment and long loop on I/O errors
    1db095222b58 nilfs2: return the mapped address from nilfs_get_page()
    95403e65525f nilfs2: Remove check for PageError
    f5d700d8bc31 btrfs: fix leak of qgroup extent records after transaction abort
    9c0914b8733d wifi: ath10k: fix QCOM_RPROC_COMMON dependency
    fdba4fbe5e54 selftests/mm: compaction_test: fix bogus test success on Aarch64
    9df7bb70906d selftests/mm: conform test to TAP format output
    68fdfb1dfe20 selftests/mm: compaction_test: fix incorrect write of zero to nr_hugepages
    70c8ec82f899 mm/cma: drop incorrect alignment check in cma_init_reserved_mem
    51163bfef6b7 cma: factor out minimum alignment requirement
    8dd8de424f30 i2c: acpi: Unbind mux adapters before delete
    fb6c53211fb7 i2c: add fwnode APIs
    aea35157bb9b mmc: davinci: Don't strip remove function when driver is builtin
    c4f8e95a2e03 mmc: davinci_mmc: Convert to platform remove callback returning void
    8ea8ef5e4217 ftrace: Fix possible use-after-free issue in ftrace_location()
    ce1b8b30d79a x86/ibt,ftrace: Search for __fentry__ location
    db11ccb43ae7 serial: sc16is7xx: fix bug in sc16is7xx_set_baud() when using prescaler
    f518bf02dd0e serial: sc16is7xx: replace hardcoded divisor value with BIT() macro
    62d5550ab620 Bluetooth: qca: fix info leak when fetching fw build id
    c3c1bd421db6 Bluetooth: qca: add support for QCA2066
    63053181b20e Bluetooth: qca: use switch case for soc type behavior
    60ff5e040527 Bluetooth: btqca: Add WCN3988 support
    76649dae9615 Bluetooth: btqca: use le32_to_cpu for ver.soc_id
    852a311d63fc Bluetooth: hci_qca: mark OF related data as maybe unused
    a9935c14a789 skbuff: introduce skb_pull_data
    28478f4ef9ec misc/pvpanic-pci: register attributes via pci_driver
    10921527ae88 misc/pvpanic: deduplicate common code
    7be0bdbcb977 pvpanic: Indentation fixes here and there
    52b5d3ca1364 pvpanic: Keep single style across modules
    2677eec526da drm/amd/display: Fix incorrect DSC instance for MST
    f055ddbc82fa drm/amd/display: drop unnecessary NULL checks in debugfs
    2d8139599ecf drm/amd/display: Clean up some inconsistent indenting
    8480f6083031 drm/amd/display: Handle Y carry-over in VCP X.Y calculation
    50b878ed127e iio: accel: mxc4005: Reset chip on probe() and resume()
    3613e5023f09 usb: gadget: f_fs: Fix race between aio_cancel() and AIO request complete
    3ec6464f050d usb: gadget: f_fs: use io_data->status consistently
    a0bc020592b5 ipv6: fix possible race in __fib6_drop_pcpu_from()
    d34d3b3f9224 af_unix: Annotate data-race of sk->sk_shutdown in sk_diag_fill().
    bdb5e4fbad58 af_unix: Use skb_queue_len_lockless() in sk_diag_show_rqlen().
    9402362b4c14 af_unix: Use skb_queue_empty_lockless() in unix_release_sock().
    0142dce07799 af_unix: annotate lockless accesses to sk->sk_err
    c633ff24d961 af_unix: Use unix_recvq_full_lockless() in unix_stream_connect().
    2c2e9cab9b2a af_unix: Annotate data-race of net->unx.sysctl_max_dgram_qlen.
    69e797f63468 af_unix: Annotate data-races around sk->sk_state in UNIX_DIAG.
    836a0b57633f af_unix: Annotate data-race of sk->sk_state in unix_stream_read_skb().
    cb1b9bee4b98 af_unix: Annotate data-races around sk->sk_state in sendmsg() and recvmsg().
    8807ca49c903 af_unix: Annotate data-race of sk->sk_state in unix_stream_connect().
    c8f2ebbb0e0c net: drop nopreempt requirement on sock_prot_inuse_add()
    aa4ed1e0f6cc net: inline sock_prot_inuse_add()
    d8653ec0e38d af_unix: Annotate data-races around sk->sk_state in unix_write_space() and poll().
    892cbc48c643 af_unix: Annotate data-race of sk->sk_state in unix_inq_len().
    5b9668fd8741 af_unix: Annodate data-races around sk->sk_state for writers.
    c8ffe6b44c3c af_unix: Set sk->sk_state under unix_state_lock() for truly disconencted peer.
    aed4a2b3eccc ptp: Fix error message on failed pin verification
    d3dde4c217f0 net/sched: taprio: always validate TCA_TAPRIO_ATTR_PRIOMAP
    582c32e6df40 tcp: count CLOSE-WAIT sockets for TCP_MIB_CURRESTAB
    d69cac92d1d9 vxlan: Fix regression when dropping packets due to invalid src addresses
    598572c64287 net: sched: sch_multiq: fix possible OOB write in multiq_tune()
    994c0f46668b octeontx2-af: Always allocate PF entries from low prioriy zone
    789bd77c9342 bpf: Set run context for rawtp test_run callback
    c30a334011f6 ipv6: sr: block BH in seg6_output_core() and seg6_input_core()
    50a5dd6de147 net/ncsi: Fix the multi thread manner of NCSI driver
    d5869d550ded net/ncsi: Simplify Kconfig/dts control flow
    7664a26be043 wifi: mac80211: correctly parse Spatial Reuse Parameter Set element
    65686118845d wifi: iwlwifi: mvm: don't read past the mfuart notifcation
    f777792952d0 wifi: iwlwifi: mvm: check n_ssids before accessing the ssids
    ab4cd503fd4e wifi: iwlwifi: dbg_ini: move iwl_dbg_tlv_free outside of debugfs ifdef
    3ce4c7e7fc0c wifi: iwlwifi: mvm: revert gen2 TX A-MPDU size to 64
    008ab7cc3292 wifi: cfg80211: pmsr: use correct nla_get_uX functions
    dfd84ce41663 wifi: cfg80211: Lock wiphy in cfg80211_get_station
    d90bdff79f8e wifi: mac80211: Fix deadlock in ieee80211_sta_ps_deliver_wakeup()
    c4c865f971fd wifi: mac80211: mesh: Fix leak of mesh_preq_queue objects
    b8086c3c1548 reiserfs: Avoid touching renamed directory if parent does not change
    ea091017ef62 ipv6: Fix data races around sk->sk_prot.
    ff8710da80ee ipv6: annotate some data-races around sk->sk_prot
    e8c2eafaaa6a tcp: Fix data races around icsk->icsk_af_ops.
    8d1bab770956 locking/rwsem: Disable preemption while trying for rwsem lock
    7c82dac02886 block, loop: support partitions without scanning
    45f504f301d4 bpftool: Fix pretty print dump for maps without BTF loaded
    1f24338cb789 jbd2: Drop the merge conflicted hunk
    e1d0e3c51bde tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    1abe841fe331 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    6224acfc1d56 tpm: Add flag to use default cancellation policy
    1cd19d48fb90 tpm: tis_i2c: Fix sanity check interrupt enable mask
    a883da132fa8 tpm: Add tpm_tis_i2c backend for tpm_tis_core
    a742ac8a1c51 tpm: Add tpm_tis_verify_crc to the tpm_tis_phy_ops protocol layer
    ef495c5f45f2 tpm: Remove read16/read32/write32 calls from tpm_tis_phy_ops
    1f3be2e23aa6 gcc-plugins: Reorganize gimple includes for GCC 13
    24615a3b932a ata: ahci: fix enum constants for gcc-13
    5d6cb145541a net: stmmac: Enable mac_managed_pm phylink config
    fd93aabb4287 tools/resolve_btfids: Use pkg-config to locate libelf
    130f9da78406 tools/resolve_btfids: Build with host flags
    00f2f1a782f9 tools/resolve_btfids: Support cross-building the kernel with clang
    17776a4ba9c2 tools/resolve_btfids: Install libbpf headers when building
    7c9808380d70 libbpf: Make libbpf_version.h non-auto-generated
    37ae1ba791ac libbpf: Add LIBBPF_DEPRECATED_SINCE macro for scheduling API deprecations
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
    a40d2daf2795 pnmtologo: use relocatable file name
    3b40d5b41155 of: configfs: remove unused variable overlay_lock
    6c085baf1838 tools: use basename to identify file in gen-mach-types
    2fca0fd71981 lib/build_OID_registry: fix reproducibility issues
    0f586f4ee8ad vt/conmakehash: improve reproducibility
    a75774679f28 OF: DT-Overlay configfs interface (v8)
    d179c639b30b x86/boot: Wrap literal addresses in absolute_pointer()
    856ec356cf91 ACPI: thermal: drop an always true check
    7614af249993 xfs: Fix -Werror=dangling-pointer work-around for older GCC
    41470215f97e xfs: Work around GCC 12 -Werror=dangling-pointer for xfs_attr_remote.o
    44a445c1922d virtio-pci: Remove wrong address verification in vp_del_vqs()
    77aa9e489eaf bpf: Disallow unprivileged bpf by default
    ebfb1822e9f9 fs/aufs: fixup 5.15.36 fixups
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
    81bdce5b5876 tick/nohz: WARN_ON --> WARN_ON_ONCE to prevent console saturation
    97c963889222 sched/isolation: really align nohz_full with rcu_nocbs
    871f23ad3627 Revert "ARM: defconfig: Enable ax88796c driver for Exynos boards"
    ffad0783dd5b ARM: config: multi v7: Regenerate defconifg
    5c1e1a1ff2d3 ARM: config: multi v7: Add renamed symbols
    badaf96564fe ARM: config: multi v7: Clean up enabled by default options
    34996040fc9b ARM: config: multi v7: Drop unavailable options
    7f685244afb3 powerpc/mm: Switch obsolete dssall to .long
    20301aeb1a64 riscv: fix build with binutils 2.38
    9df58d070506 powerpc/lib/sstep: fix 'ptesync' build error
    720b61fc400b x86_64_defconfig: Fix warnings
    02bf23d26bc4 arm64: defconfig: cleanup config options
    05914e2c87e5 arm: defconfig: drop unused POWER_AVS option
    ffb532fa19b9 aufs5: fix build against v5.15.3+
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
index d56f836423..99b0cb09ba 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bb5c5e098fac580b02483dee081215a9311c6ae0"
-SRCREV_meta ?= "e18b1bbce72e4371c787e998793a11d14fc2312a"
+SRCREV_machine ?= "17d344e1e72d797a5f4bbc4b552912989f9e6922"
+SRCREV_meta ?= "eb9e477ff920b871c79ebf6e5309d35b48d983af"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.161"
+LINUX_VERSION ?= "5.15.162"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index a2ebd3288c..ca7494308f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.161"
+LINUX_VERSION ?= "5.15.162"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ddd4e95180eff3396e4cf9e154b43cfc1400064c"
-SRCREV_meta ?= "e18b1bbce72e4371c787e998793a11d14fc2312a"
+SRCREV_machine ?= "84b0c24c303ac61747604a657c5a94bf313ab087"
+SRCREV_meta ?= "eb9e477ff920b871c79ebf6e5309d35b48d983af"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 90897ac336..b3cfdeebdf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -14,24 +14,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "688f035c78850cd701e12885fb31ae6aee471ea4"
-SRCREV_machine:qemuarm64 ?= "64dc94083abec04622dec3856f085407b456b6a2"
-SRCREV_machine:qemumips ?= "43bdd49d2338322cf6dbeb5c716822df923d865e"
-SRCREV_machine:qemuppc ?= "ff717d376102db97f22f7f80fd81d60b4f9f8eaf"
-SRCREV_machine:qemuriscv64 ?= "d973ca5c2861215878f17359736c7bdb14ecd5c8"
-SRCREV_machine:qemuriscv32 ?= "d973ca5c2861215878f17359736c7bdb14ecd5c8"
-SRCREV_machine:qemux86 ?= "d973ca5c2861215878f17359736c7bdb14ecd5c8"
-SRCREV_machine:qemux86-64 ?= "d973ca5c2861215878f17359736c7bdb14ecd5c8"
-SRCREV_machine:qemumips64 ?= "2d24caba985f863bc79bab2735e60748b17b1ad5"
-SRCREV_machine ?= "d973ca5c2861215878f17359736c7bdb14ecd5c8"
-SRCREV_meta ?= "e18b1bbce72e4371c787e998793a11d14fc2312a"
+SRCREV_machine:qemuarm ?= "1fd4f503830570e254661a8cfd9be7d3592e8b64"
+SRCREV_machine:qemuarm64 ?= "737d528a03d2fc1d83a33c6a527ffdc15f33652c"
+SRCREV_machine:qemumips ?= "b9dfd0af3606636b3a24d8de53c81d78e74b3d3d"
+SRCREV_machine:qemuppc ?= "5ec9de7723a3d560c932a37d88da115ef1d938c8"
+SRCREV_machine:qemuriscv64 ?= "5a4667da1ebc1750b1ddaaf93a1f3f98634360e3"
+SRCREV_machine:qemuriscv32 ?= "5a4667da1ebc1750b1ddaaf93a1f3f98634360e3"
+SRCREV_machine:qemux86 ?= "5a4667da1ebc1750b1ddaaf93a1f3f98634360e3"
+SRCREV_machine:qemux86-64 ?= "5a4667da1ebc1750b1ddaaf93a1f3f98634360e3"
+SRCREV_machine:qemumips64 ?= "861eb0361f55f33d7dedd9dc2bcb90ccc2d82cfa"
+SRCREV_machine ?= "5a4667da1ebc1750b1ddaaf93a1f3f98634360e3"
+SRCREV_meta ?= "eb9e477ff920b871c79ebf6e5309d35b48d983af"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4878aadf2d1519f3731ae300ce1fef78fc63ee30"
+SRCREV_machine:class-devupstream ?= "f45bea23c39cbd0d9b89d6b43563b02aa2dfe5de"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -39,7 +39,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.161"
+LINUX_VERSION ?= "5.15.162"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.39.2


