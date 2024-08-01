Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FDCC52D6D
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 15:08:57 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.70682.1722524929188918076
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 08:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kElb4cpZ;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-44fe9aa3bfaso41689371cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 08:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722524928; x=1723129728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dj7x6kf/Byv26HxCzYQOadKp04VXgJszZ87w5USpvlo=;
        b=kElb4cpZ/9mEAw8F3h6M57Xuxq+PmuEY3eFkXrUAvGmXT56L5nQ/BVmhJNDK2ww7hr
         RHXX5yIGm0x9AK07PApHDofkvbgTXOj5fOFyGXKlIxz92RaJCsXt9yUSn51qjgXecoDg
         FDxAiMrALysBKx8KZy+ku6BRe6nDDEO7JZuypSLy3B2zSmzBvyPdQ7Y+lBMca7Cqa8wo
         ejMRpBU9dWfQJojoyjDjrZ8muu25p21T7WsGYQkRuAL+5Bk9LN8vuqmupnMoZ75begrc
         4F4O8LXnZh7LaR24CtDAXRbL1ODXi4Xb0bEeUrwxW2sXYyTRerjBf9JeeQRpVX6n1VVW
         NPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722524928; x=1723129728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dj7x6kf/Byv26HxCzYQOadKp04VXgJszZ87w5USpvlo=;
        b=BSB3DFvaI8yUz/aiU9pBolkNyVLdYe4jGSvwGzKnxd3/WbTq4cYl2pysI81jjFZsn1
         NsxpjDrpC/k8bTXtQQ+GgpKqv4c0yU+ySSiE9M9K/5WQCqex/R7U1fsMzF26OW083c9B
         2HJMGYd7VHQPVjFHK4YJ3OAOxSK8NC4IVtGl02UoyqTM9FijJitIhLcwDd7/1PB423Gg
         l07jcc9TGXel1XkrM+PH2AHbyLxl3SfBh4S67YJJOR5ZgIzNr1Q0x6YZt8xlWok8a+pa
         ZEbLz0iIKUNBFLeS0WD8CFZmjLaRnj1hU5Y/s564h4DebT3/TJkZ+FmQp4IeJRokZ5nW
         jMrQ==
X-Gm-Message-State: AOJu0YykpmHP7AxKOm7pQe6oba2TLt9pu5PiRhoCIJkLW5wOUtsUMEXS
	zTcxtk07i7wpdizo1DB0IuR3RSACptPzF2smxSL38XOB+iTg+pkoTQDuSypc
X-Google-Smtp-Source: AGHT+IFxTKOO1dJauCpzwuQxmNFjv4btsdSMMYNJvK96Z/TpDoUSt10/8vlclDoQw8yDiNCp/woe1Q==
X-Received: by 2002:ac8:7f95:0:b0:447:e0a0:9e75 with SMTP id d75a77b69052e-451892c437bmr4190941cf.63.1722524926767;
        Thu, 01 Aug 2024 08:08:46 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1d73b5003sm859343985a.43.2024.08.01.08.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 08:08:46 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/10] linux-yocto/6.6: update to v6.6.38
Date: Thu,  1 Aug 2024 11:08:34 -0400
Message-Id: <1ba9915203d50af6a4cf725bcca5cb1f43f73a25.1722524523.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1722524523.git.bruce.ashfield@gmail.com>
References: <cover.1722524523.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 15:08:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202742

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    2928631d5304 Linux 6.6.38
    e3540e5a7054 Revert "bpf: Take return from set_memory_ro() into account with bpf_prog_lock_ro()"
    a5c2956637ba Revert "powerpc/bpf: rename powerpc64_jit_data to powerpc_jit_data"
    466562d7646b Revert "powerpc/bpf: use bpf_jit_binary_pack_[alloc|finalize|free]"
    9fef36cad60d Revert "bpf: Take return from set_memory_rox() into account with bpf_jit_binary_lock_ro()"
    8fa96e44d36c Linux 6.6.37
    8417af02247e tracing/net_sched: NULL pointer dereference in perf_trace_qdisc_reset()
    18630d83b770 serial: 8250_omap: Fix Errata i2310 with RX FIFO level check
    633c861c0e85 serial: imx: only set receiver level if it is zero
    843836bfc199 cxl/region: check interleave capability
    a9e099e29e92 cxl/region: Avoid null pointer dereference in region lookup
    f12be1a1fdee cxl/region: Move cxl_dpa_to_region() work to the region driver
    3b758696cc4a arm64: dts: rockchip: Add sound-dai-cells for RK3368
    a96a83c939d9 arm64: dts: rockchip: fix PMIC interrupt pin on ROCK Pi E
    d530fe86286b arm64: dts: rockchip: make poweroff(8) work on Radxa ROCK 5A
    c6639892ca95 ARM: dts: rockchip: rk3066a: add #sound-dai-cells to hdmi node
    619c5fe7d3da arm64: dts: rockchip: Fix the value of `dlg,jack-det-rate` mismatch on rk3399-gru
    b6970ce861d8 arm64: dts: rockchip: Rename LED related pinctrl nodes on rk3308-rock-pi-s
    c49af0075f3e arm64: dts: rockchip: Fix SD NAND and eMMC init on rk3308-rock-pi-s
    c5978b996260 mm/page_alloc: Separate THP PCP into movable and non-movable categories
    07caf754f696 Revert "cpufreq: amd-pstate: Fix the inconsistency in max frequency units"
    d83df7de2b0a pwm: stm32: Refuse too small period requests
    00432384ec40 erofs: fix NULL dereference of dif->bdev_handle in fscache mode
    c636bb37f886 syscalls: fix sys_fanotify_mark prototype
    e04886b50c3e syscalls: fix compat_sys_io_pgetevents_time64 usage
    836359247b04 ftruncate: pass a signed offset
    062e256516d7 ata: libata-core: Fix double free on error
    d8d54126880c ata: ahci: Clean up sysfs file on error
    3e72558c1711 can: mcp251xfd: fix infinite loop when xmit fails
    73fb6df4e6d1 batman-adv: Don't accept TT entries for out-of-spec VIDs
    01f58871af9c drm/amdgpu/atomfirmware: fix parsing of vram_info
    89d8a851543e drm/amd/display: Send DP_TOTAL_LTTPR_CNT during detection if LTTPR is present
    7ece609b0ce7 drm/nouveau/dispnv04: fix null pointer dereference in nv17_tv_get_hd_modes
    06dec31a0a51 drm/i915/gt: Fix potential UAF by revoke of fence registers
    330c8c145384 drm/amdgpu: avoid using null object of framebuffer
    f29fcfbf6067 drm/fbdev-dma: Only set smem_start is enable per module option
    cb751e48bbcf drm/nouveau/dispnv04: fix null pointer dereference in nv17_tv_get_ld_modes
    16682588ead4 drm/drm_file: Fix pid refcounting race
    5515a8165257 hexagon: fix fadvise64_64 calling conventions
    32dffe1365c3 csky, hexagon: fix broken sys_sync_file_range
    a0bfefcb61a7 btrfs: zoned: fix initial free space detection
    91878a2bc88e sh: rework sync_file_range ABI
    829974305d8e kbuild: Install dtb files as 0644 in Makefile.dtbinst
    d2683b2d1ec2 irqchip/loongson-liointc: Set different ISRs for different cores
    52bbae429b86 cpu/hotplug: Fix dynstate assignment in __cpuhp_setup_state_cpuslocked()
    c5a51cfe943d irqchip/loongson-eiointc: Use early_cpu_to_node() instead of cpu_to_node()
    da3cabfd8b31 cpufreq: intel_pstate: Use HWP to initialize ITMT if CPPC is missing
    ff1121d2214b PCI/MSI: Fix UAF in msi_capability_init
    177e33b655d3 net: can: j1939: enhanced error handling for tightly received RTS messages in xtp_rx_rts_session_new
    b6f78276b9aa net: can: j1939: recover socket queue on CAN bus error during BAM transmission
    ab2a683938ba net: can: j1939: Initialize unused data in j1939_send_one()
    31020bea754d tty: mcf: MCF54418 has 10 UARTS
    1d994fb58e72 ALSA: hda/realtek: fix mute/micmute LEDs don't work for EliteBook 645/665 G11.
    d3ebc5597ec2 serial: bcm63xx-uart: fix tx after conversion to uart_port_tx_limited()
    60dc1a2a3f13 serial: core: introduce uart_port_tx_limited_flags()
    d75b8ae150e9 serial: imx: set receiver level before starting uart
    e67d7f38008e serial: 8250_omap: Implementation of Errata i2310
    2ab254507c87 Revert "serial: core: only stop transmit when HW fifo is empty"
    6b80ccc0acc8 usb: dwc3: core: Workaround for CSR read timeout
    ab99c4be9457 usb: dwc3: core: Add DWC31 version 2.00a controller
    e63059271945 usb: ucsi: stm32: fix command completion handling
    519610e20e8a usb: typec: ucsi: glink: fix child node release in probe function
    9ed8e8c440f5 usb: gadget: aspeed_udc: fix device address configuration
    17e2956633ca usb: dwc3: core: remove lock of otg mode during gadget suspend/resume to avoid deadlock
    f536f09eb45e usb: atm: cxacru: fix endpoint checking in cxacru_bind()
    bcf78eca0967 usb: musb: da8xx: fix a resource leak in probe()
    a96915ffc956 usb: gadget: printer: fix races against disable
    9dec26eda3b2 usb: gadget: printer: SS+ support
    cc2bce1fe1e6 net: usb: ax88179_178a: improve link status logs
    055b4e3d6beb iio: chemical: bme680: Fix sensor data read operation
    b5967393d50e iio: chemical: bme680: Fix overflows in compensate() functions
    93709966cec9 iio: chemical: bme680: Fix calibration data variable
    133828897c81 iio: chemical: bme680: Fix pressure value output
    7387777aeb2c iio: accel: fxls8962af: select IIO_BUFFER & IIO_KFIFO_BUF
    1ce8be8442cd iio: adc: ad7266: Fix variable checking bug
    8c65da9b153a ata,scsi: libata-core: Do not leak memory for ata_port struct members
    119c97ace2a9 ata: libata-core: Fix null pointer dereference on error
    84ee4515a81b i2c: testunit: discard write requests while old command is running
    37bec254ee75 i2c: testunit: don't erase registers after STOP
    b89b0af97dc5 kbuild: Fix build target deb-pkg: ln: failed to create hard link
    4edc6c5b3157 kbuild: doc: Update default INSTALL_MOD_DIR from extra to updates
    8fd89aa382a5 counter: ti-eqep: enable clock at probe
    da6c6adba557 iio: xilinx-ams: Don't include ams_ctrl_channels in scan_mask
    7fb456c3c6e1 mmc: sdhci: Do not lock spinlock around mmc_gpio_get_ro()
    3336979b6a75 mmc: sdhci: Do not invert write-protect twice
    006e04ae96bd mmc: sdhci-pci: Convert PCIBIOS_* return codes to errnos
    485d9421719b mmc: sdhci-brcmstb: check R1_STATUS for erase/trim/discard
    50a68792a945 mmc: sdhci-pci-o2micro: Convert PCIBIOS_* return codes to errnos
    88e0ad40d08a mm: fix incorrect vbq reference in purge_fragmented_block
    bc5e98e004ce nfs: drop the incorrect assertion in nfs_swap_rw()
    c05ffb693bfb ocfs2: fix DIO failure due to insufficient transaction credits
    c2a78811ff9b pinctrl: qcom: spmi-gpio: drop broken pm8008 support
    9b95f63d54a7 Revert "MIPS: pci: lantiq: restore reset gpio polarity"
    d0be1c8ee425 parisc: use generic sys_fanotify_mark implementation
    16222beb9f8e x86: stop playing stack games in profile_pc()
    591c0650b9e6 randomize_kstack: Remove non-functional per-arch entropy filtering
    67ccb6b02154 gpiolib: cdev: Disallow reconfiguration without direction (uAPI v1)
    74eb70ce6790 riscv: stacktrace: convert arch_stack_walk() to noinstr
    f16c10e05f14 drm/amdgpu: Fix pci state save during mode-1 reset
    abb84c462000 RISC-V: fix vector insn load/store width mask
    2d83492259ad gpio: davinci: Validate the obtained number of IRQs
    0ca8656457be drm/panel: simple: Add missing display timing flags for KOE TX26D202VM0BWA
    e834fecf6611 nvme: fixup comment for nvme RDMA Provider Type
    41e58607a57c drm/radeon/radeon_display: Decrease the size of allocated memory
    3429ef5f5090 gfs2: Fix NULL pointer dereference in gfs2_log_flush
    ed4434b8b1c9 soc: ti: wkup_m3_ipc: Send NULL dummy message instead of pointer message
    79c9ea0d425b irqchip/loongson: Select GENERIC_IRQ_EFFECTIVE_AFF_MASK if SMP for IRQ_LOONGARCH_CPU
    06fa2d9445e0 media: dvbdev: Initialize sbuf
    d8f5ce3cb9ad ALSA: emux: improve patch ioctl data validation
    80575b252ab0 crypto: ecdh - explicitly zeroize private_key
    69f49527aea1 net/dpaa2: Avoid explicit cpumask var allocation on stack
    724e7965af05 net/iucv: Avoid explicit cpumask var allocation on stack
    8ac281d42337 RDMA/restrack: Fix potential invalid address access
    d812ae6e02bd bpf: Mark bpf prog stack with kmsan_unposion_memory in interpreter mode
    e6bb84cb47e3 wifi: ieee80211: check for NULL in ieee80211_mle_size_ok()
    5266cbcf3ad1 mtd: partitions: redboot: Added conversion of operands to a larger type
    94111446fa12 x86/fpu: Fix AMD X86_BUG_FXSAVE_LEAK fixup
    df475f71d42e vduse: Temporarily fail if control queue feature requested
    8d4d14536c06 vduse: validate block features only with block devices
    1618f7a875ff drm/panel: ilitek-ili9881c: Fix warning with GPIO controllers that sleep
    08f6c05feb1d bpf: Take return from set_memory_rox() into account with bpf_jit_binary_lock_ro()
    f99feda5684a powerpc/bpf: use bpf_jit_binary_pack_[alloc|finalize|free]
    103391940092 powerpc/bpf: rename powerpc64_jit_data to powerpc_jit_data
    fdd411af8178 bpf: Take return from set_memory_ro() into account with bpf_prog_lock_ro()
    3243e64eb4d8 net: mana: Fix possible double free in error handling path
    952bf8df2225 netfilter: nf_tables: fully validate NFT_DATA_VALUE on store to data registers
    b5418b416223 ALSA: seq: Fix missing MSB in MIDI2 SPP conversion
    b4b26d23a1e2 tcp: fix tcp_rcv_fastopen_synack() to enter TCP_CA_Loss for failed TFO
    91fe991e02c2 powerpc: restore some missing spu syscalls
    55aed1491bd3 parisc: use correct compat recv/recvfrom syscalls
    61ff73933b68 sparc: fix compat recv/recvfrom syscalls
    035c504121e5 sparc: fix old compat_sys_select()
    784079f69787 net: dsa: microchip: fix wrong register write when masking interrupt
    f981ca3fcf89 ALSA: seq: Fix missing channel at encoding RPN/NRPN MIDI2 messages
    fdae4d139f47 Fix race for duplicate reqsk on identical SYN
    cf0291a67967 btrfs: use NOFS context when getting inodes during logging and log replay
    3ebda17c46d3 netfilter: fix undefined reference to 'netfilter_lwtunnel_*' when CONFIG_SYSCTL=n
    14e51ea78b4c xdp: Remove WARN() from __xdp_reg_mem_model()
    b36267d996fb ice: Rebuild TC queues on VSI queue reconfiguration
    9d36f6312bc0 net: dsa: microchip: use collision based back pressure mode
    96c8693fc11c net: phy: micrel: add Microchip KSZ 9477 to the device table
    23f0624bcba2 ibmvnic: Free any outstanding tx skbs during scrq reset
    511804ab701c bpf: Fix overrunning reservations in ringbuf
    942901e0fc74 mlxsw: spectrum_buffers: Fix memory corruptions on Spectrum-4 systems
    ba4d75a8f411 openvswitch: get related ct labels from its master if it is not confirmed
    2ef957de4e2d net: dsa: microchip: fix initial port flush problem
    29bc9e7c7539 ASoC: fsl-asoc-card: set priv->pdev before using it
    032a2ec27dab ASoC: amd: acp: remove i2s configuration check in acp_i2s_probe()
    e158ed266fc1 ASoC: amd: acp: add a null check for chip_pdev structure
    05cbeb0803ef s390/pci: Add missing virt_to_phys() for directed DIBV
    8d02ead6d015 bpf: Add missed var_off setting in coerce_subreg_to_size_sx()
    185dca875591 bpf: Add missed var_off setting in set_sext32_default_val()
    b377d4df8fb0 ASoC: q6apm-lpass-dai: close graph on prepare errors
    f74bb396f120 workqueue: Increase worker desc's length to 32
    6ffd06c3715c ASoC: atmel: atmel-classd: Re-add dai_link->platform to fix card init
    6de2e5820477 ASoC: atmel: convert not to use asoc_xxx()
    2886b30b1c11 ASoC: mediatek: mt8183-da7219-max98357: Fix kcontrol name collision
    4932ddb9fd3f ASoC: rockchip: i2s-tdm: Fix trcm mode by setting clock on right mclk
    00da1ddd6936 wifi: mac80211: Use flexible array in struct ieee80211_tim_ie
    2dcc136eef30 selftests: mptcp: userspace_pm: fixed subtest names
    528c3a4ceb38 selftests: mptcp: print_test out of verify_listener_events
    71d21704d24e MIPS: pci: lantiq: restore reset gpio polarity
    2838dfa5290f pinctrl: rockchip: fix pinmux reset in rockchip_pmx_set
    b85dec60a374 pinctrl: rockchip: use dedicated pinctrl type for RK3328
    14f6c7bf21ce pinctrl: rockchip: fix pinmux bits for RK3328 GPIO3-B pins
    98db00947697 pinctrl: rockchip: fix pinmux bits for RK3328 GPIO2-B pins
    4038c57bf616 pinctrl: fix deadlock in create_pinctrl() when handling -EPROBE_DEFER
    f1d05111b39f Input: ili210x - fix ili251x_read_touch_data() return value
    d9933caf865e usb: typec: ucsi: Ack also failed Get Error commands
    64ab9d2d1bd0 usb: typec: ucsi: Never send a lone connector change ack
    dd7c4e370444 iio: pressure: bmp280: Fix BMP580 temperature reading
    3f199b4e3987 iio: pressure: fix some word spelling errors
    f71bb11887ba cpu/amd: inhibit SMP check for qemux86
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
index 8a0f850404..d95a102160 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4f98797a9bf5e14e9c23bb87c65ad9d0deb7e53b"
-SRCREV_meta ?= "733366844f5e114221372929392bf237fc8d823c"
+SRCREV_machine ?= "d2157fa7a1fa4a9fe1787c632d5deb380f2c6c17"
+SRCREV_meta ?= "2ea9ff717ef4924299295edc441c23fab24a93e6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.36"
+LINUX_VERSION ?= "6.6.38"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index b115c21ce2..0b3dd4d735 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.36"
+LINUX_VERSION ?= "6.6.38"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d461ff7e19e9484f1405682275fc91889922e069"
-SRCREV_meta ?= "733366844f5e114221372929392bf237fc8d823c"
+SRCREV_machine ?= "371a13177d24bf76ce6c5074d2d745896ef0c526"
+SRCREV_meta ?= "2ea9ff717ef4924299295edc441c23fab24a93e6"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index b48872716f..a300651c13 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "847d20241cd3c55e38027066bca6c87495d1c713"
-SRCREV_machine:qemuarm64 ?= "d461ff7e19e9484f1405682275fc91889922e069"
-SRCREV_machine:qemuloongarch64 ?= "d461ff7e19e9484f1405682275fc91889922e069"
-SRCREV_machine:qemumips ?= "158aceac74beabc5b189e3683fac9d1038ad96b5"
-SRCREV_machine:qemuppc ?= "d461ff7e19e9484f1405682275fc91889922e069"
-SRCREV_machine:qemuriscv64 ?= "d461ff7e19e9484f1405682275fc91889922e069"
-SRCREV_machine:qemuriscv32 ?= "d461ff7e19e9484f1405682275fc91889922e069"
-SRCREV_machine:qemux86 ?= "d461ff7e19e9484f1405682275fc91889922e069"
-SRCREV_machine:qemux86-64 ?= "d461ff7e19e9484f1405682275fc91889922e069"
-SRCREV_machine:qemumips64 ?= "2cc28c14a399c490816c6183ad3fc784e7bdda39"
-SRCREV_machine ?= "d461ff7e19e9484f1405682275fc91889922e069"
-SRCREV_meta ?= "733366844f5e114221372929392bf237fc8d823c"
+SRCREV_machine:qemuarm ?= "47eb5131c7040017eeebdf16249899875dba22ef"
+SRCREV_machine:qemuarm64 ?= "371a13177d24bf76ce6c5074d2d745896ef0c526"
+SRCREV_machine:qemuloongarch64 ?= "371a13177d24bf76ce6c5074d2d745896ef0c526"
+SRCREV_machine:qemumips ?= "0b1fefb914311dc537509785fe4f0f18a63893d5"
+SRCREV_machine:qemuppc ?= "371a13177d24bf76ce6c5074d2d745896ef0c526"
+SRCREV_machine:qemuriscv64 ?= "371a13177d24bf76ce6c5074d2d745896ef0c526"
+SRCREV_machine:qemuriscv32 ?= "371a13177d24bf76ce6c5074d2d745896ef0c526"
+SRCREV_machine:qemux86 ?= "371a13177d24bf76ce6c5074d2d745896ef0c526"
+SRCREV_machine:qemux86-64 ?= "371a13177d24bf76ce6c5074d2d745896ef0c526"
+SRCREV_machine:qemumips64 ?= "f512122c65a6e1cab7053e80e0b6965a7f15a7ae"
+SRCREV_machine ?= "371a13177d24bf76ce6c5074d2d745896ef0c526"
+SRCREV_meta ?= "2ea9ff717ef4924299295edc441c23fab24a93e6"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "61945f2f69d080a9cf2c879cb959d4648df9b94c"
+SRCREV_machine:class-devupstream ?= "2928631d5304b8fec48bad4c7254ebf230b6cc51"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.36"
+LINUX_VERSION ?= "6.6.38"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


