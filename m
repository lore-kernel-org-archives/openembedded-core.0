Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.31428.1629987826890816642
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 07:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lWwCWT1X;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id a66so3550404qkc.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xGstIgYaByK7T8dZCa9V+Q2GNJ7NcELgErcomXjz4mo=;
        b=lWwCWT1XikL61tyPTsVVZPz58XlSdEn7MxBE+WQpOmCqUylEeAXT86rJqKzfwL01xz
         PMCnc3A57jzyFmyvujPlDzOcDIo1T/+nJJbwH4/ddx3J4uZ9RH4qjLrus9Ufgs1TxOEM
         m0P1lHbdfKj4Tmm8bSYHnzPQIfbywryFk0gBzeNnNiG9+AHCHF44pg+t+Ccq8rPo4g0R
         TcsI5gTYfB40gNbduJvJ5q2/z52DL2MKtnI+FX5c7qsrTvhklPl7DLlGuJNiR0KeBK0n
         EuHuloesqpnwI28yRf1/4keZf+ZOBWMZ/REhQtzHqX9igA4HhsnlnitJ0hrZAGk+6Oep
         zdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xGstIgYaByK7T8dZCa9V+Q2GNJ7NcELgErcomXjz4mo=;
        b=VzVX1wzQOhvvl8kHreGueDcucVYVbSef6s5OmgiEcSf3Y/5kF1sCfG+e9TJGuBWx1/
         CzTBUUyDNINwrWLgJwXqeXqqsd7piXFyATYVC1iuL/nksL4pEFmNVieuf+wUXrLiywDW
         TvyAO2HuFoENk8C7YhBSbAqyqR0clhzTSdAE6vAf3QyzsCI6f0W0c2dIocYHep7XwaMV
         Lg9V7tR/wb32ZXjSRf1CrUr+u9o1GTpaXbIfp7lN356Q9G8TbP7a7nyH3Th5b5oqLn0I
         1+5D50lE2f9D66lZuNIOlPHq9EPxNb/ddy8Vl7+3HoIlvIt7/3Mf0Rpp6EnQMtigJk+i
         i6SQ==
X-Gm-Message-State: AOAM533e0fhdgFmz8wWTj7eNSBpSx+kiSlZ3Ew2I3xX2QzIdLaIbgCYt
	UzlCD6D6uo4uw00istn1LdF/TBtUvvfKuA==
X-Google-Smtp-Source: ABdhPJwhB06YjKrYjCgjjembmjA+imC/EpClm5isnU5aTj8RGnOw9HDMmrKGok4B8EuDSGpj4Lfo4A==
X-Received: by 2002:a37:483:: with SMTP id 125mr4037444qke.306.1629987825810;
        Thu, 26 Aug 2021 07:23:45 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id q10sm2676124qke.108.2021.08.26.07.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 07:23:45 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/5.10: update to v5.10.59
Date: Thu, 26 Aug 2021 10:23:39 -0400
Message-Id: <cddbc2ead5efe467ee992cad023806dfe8021afe.1629987648.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1629987648.git.bruce.ashfield@gmail.com>
References: <cover.1629987648.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    5805e5eec901 Linux 5.10.59
    25cff25ec606 net: xilinx_emaclite: Do not print real IOMEM pointer
    6a002d48a660 ovl: prevent private clone if bind mount is not allowed
    bffead8d3648 ppp: Fix generating ppp unit id when ifname is not specified
    5df85901fe45 ALSA: hda: Add quirk for ASUS Flow x13
    8930f2c60a45 ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook 650 G8 Notebook PC
    98c3fa3a9d7a ALSA: pcm: Fix mmap breakage without explicit buffer setup
    cc1a4dff23a4 USB:ehci:fix Kunpeng920 ehci hardware problem
    bd909fd3878d vboxsf: Make vboxsf_dir_create() return the handle for the created file
    971703fc19cf vboxsf: Honor excl flag to the dir-inode create op
    96b2232cb7e5 arm64: dts: renesas: beacon: Fix USB ref clock references
    e0dd4a0ab072 arm64: dts: renesas: beacon: Fix USB extal reference
    0f47027d1b9b arm64: dts: renesas: rzg2: Add usb2_clksel to RZ/G2 M/N/H
    eaa7feecd366 mm: make zone_to_nid() and zone_set_nid() available for DISCONTIGMEM
    0e709390372f Revert "selftests/resctrl: Use resctrl/info for feature detection"
    d8c38598701f bpf: Add lockdown check for probe_write_user helper
    5b5064ea9a94 firmware: tee_bnxt: Release TEE shm, session, and context during kexec
    c5a625c6a4ac tee: Correct inappropriate usage of TEE_SHM_DMA_BUF flag
    9f105d2d4f6c KVM: SVM: Fix off-by-one indexing when nullifying last used SEV VMCB
    132a8267adab Linux 5.10.58
    3d7d1b0f5f41 arm64: fix compat syscall return truncation
    bb65051dcd1f drm/amdgpu/display: only enable aux backlight control for OLED panels
    c8b7cfa674ee smb3: rc uninitialized in one fallocate path
    8cfdd039ca18 net/qla3xxx: fix schedule while atomic in ql_wait_for_drvr_lock and ql_adapter_reset
    fbbb209268e5 alpha: Send stop IPI to send to online CPUs
    13d0a9b3b917 net: qede: Fix end of loop tests for list_for_each_entry
    1478e902bcbc virt_wifi: fix error on connect
    ecd8614809eb reiserfs: check directory items on read from disk
    dbe4f82fedc6 reiserfs: add check for root_inode in reiserfs_fill_super
    0f05e0ffa247 libata: fix ata_pio_sector for CONFIG_HIGHMEM
    11891adab23d drm/i915: avoid uninitialised var in eb_parse()
    a3e6bd0c71bb sched/rt: Fix double enqueue caused by rt_effective_prio
    c797b8872bb9 perf/x86/amd: Don't touch the AMD64_EVENTSEL_HOSTONLY bit inside the guest
    2d94cffc94a5 soc: ixp4xx/qmgr: fix invalid __iomem access
    7397034905ac drm/i915: Correct SFC_DONE register offset
    16aecf1e36d9 interconnect: qcom: icc-rpmh: Ensure floor BW is enforced for all nodes
    22b4917c85af interconnect: Always call pre_aggregate before aggregate
    ccfe4f62ff9f interconnect: Zero initial BW after sync-state
    05565b469358 spi: meson-spicc: fix memory leak in meson_spicc_remove
    1a084e78217d interconnect: Fix undersized devress_alloc allocation
    dcc23e58511b soc: ixp4xx: fix printing resources
    37cbd27ef4b2 arm64: vdso: Avoid ISB after reading from cntvct_el0
    7a2b5bb00f54 KVM: x86/mmu: Fix per-cpu counter corruption on 32-bit builds
    32f55c25ee29 KVM: Do not leak memory for duplicate debugfs directories
    309a31127bef KVM: x86: accept userspace interrupt only if no event is injected
    a786282b55b4 md/raid10: properly indicate failure when ending a failed write request
    3d7d2d2b069b ARM: omap2+: hwmod: fix potential NULL pointer access
    9851ad2f7107 Revert "gpio: mpc8xxx: change the gpio interrupt flags."
    57c44e7ac788 bus: ti-sysc: AM3: RNG is GP only
    f4984f60acc7 selinux: correct the return value when loads initial sids
    100f8396d154 pcmcia: i82092: fix a null pointer dereference bug
    afcd5a0e015f net/xfrm/compat: Copy xfrm_spdattr_type_t atributes
    f08b2d078cbb xfrm: Fix RCU vs hash_resize_mutex lock inversion
    23e36a8610ca timers: Move clearing of base::timer_running under base:: Lock
    9a69d0d24d69 fpga: dfl: fme: Fix cpu hotplug issue in performance reporting
    bfb5f1a12325 serial: 8250_pci: Avoid irq sharing for MSI(-X) interrupts.
    0f30fedced7c serial: 8250_pci: Enumerate Elkhart Lake UARTs via dedicated driver
    17f3c64f707b MIPS: Malta: Do not byte-swap accesses to the CBUS UART
    8a1624f4a8d3 serial: 8250: Mask out floating 16/32-bit bus bits
    c03cef67157a serial: 8250_mtk: fix uart corruption issue when rx power off
    a4f8bfc919ee serial: tegra: Only print FIFO error message when an error occurs
    cc7300776808 ext4: fix potential htree corruption when growing large_dir directories
    6b5a3d2c2b89 pipe: increase minimum default pipe size to 2 pages
    556e7f204d34 media: rtl28xxu: fix zero-length control request
    551e0c5d6b2e drivers core: Fix oops when driver probe fails
    faec2c68ea5f staging: rtl8712: error handling refactoring
    e468a357af68 staging: rtl8712: get rid of flush_scheduled_work
    369101e39911 staging: rtl8723bs: Fix a resource leak in sd_int_dpc
    1628b64efb36 tpm_ftpm_tee: Free and unregister TEE shared memory during kexec
    2a879ff9719f optee: fix tee out of memory failure seen during kexec reboot
    ad80c25987fe optee: Refuse to load the driver under the kdump kernel
    1340dc3fb75e optee: Fix memory leak when failing to register shm pages
    6b2ded93d35c tee: add tee_shm_alloc_kernel_buf()
    5e9d82021425 optee: Clear stale cache entries during initialization
    e5d8fd87091c arm64: stacktrace: avoid tracing arch_stack_walk()
    7799ad4d181f tracepoint: Fix static call function vs data state mismatch
    14673e19291c tracepoint: static call: Compare data on transition from 2->1 callees
    046e12323ab4 tracing: Fix NULL pointer dereference in start_creating
    b2aca8daa50e tracing: Reject string operand in the histogram expression
    b10ccc2c5888 tracing / histogram: Give calculation hist_fields a size
    f97274528037 scripts/tracing: fix the bug that can't parse raw_trace_func
    fd3afb81f448 clk: fix leak on devm_clk_bulk_get_all() unwind
    948ff2f214fb usb: otg-fsm: Fix hrtimer list corruption
    8f8645de092a usb: typec: tcpm: Keep other events when receiving FRS and Sourcing_vbus events
    5b4318885a43 usb: host: ohci-at91: suspend/resume ports after/before OHCI accesses
    1f2015506d9c usb: gadget: f_hid: idle uses the highest byte for duration
    825ac3f0bc35 usb: gadget: f_hid: fixed NULL pointer dereference
    683702dff7c8 usb: gadget: f_hid: added GET_IDLE and SET_IDLE handlers
    051518d9cfe3 usb: cdns3: Fixed incorrect gadget state
    822bec5cbb05 usb: gadget: remove leaked entry from udc driver list
    98c83d72614e usb: dwc3: gadget: Avoid runtime resume if disabling pullup
    79e9389038c4 ALSA: usb-audio: Add registration quirk for JBL Quantum 600
    b7532db2d458 ALSA: usb-audio: Fix superfluous autosuspend recovery
    80b7aa2651bc ALSA: hda/realtek: Fix headset mic for Acer SWIFT SF314-56 (ALC256)
    de30786fb25a ALSA: hda/realtek: add mic quirk for Acer SF314-42
    c0b626f0a29a ALSA: pcm - fix mmap capability check for the snd-dummy driver
    dd3f7c5c8904 drm/amdgpu/display: fix DMUB firmware version info
    ecb739cf15a9 firmware_loader: fix use-after-free in firmware_fallback_sysfs
    5019f5812bbf firmware_loader: use -ETIMEDOUT instead of -EAGAIN in fw_load_sysfs_fallback
    aa3b8bc17e2a USB: serial: ftdi_sio: add device ID for Auto-M3 OP-COM v2
    d245a76719cf USB: serial: ch341: fix character loss at high transfer rates
    0470385e63bb USB: serial: option: add Telit FD980 composition 0x1056
    ba4a395668b5 USB: usbtmc: Fix RCU stall warning
    f2f856b65ac4 Bluetooth: defer cleanup of resources in hci_unregister_dev()
    821e6a613354 blk-iolatency: error out if blk_get_queue() failed in iolatency_set_limit()
    c5a499b8607a net: vxge: fix use-after-free in vxge_device_unregister
    fb49d67262ca net: fec: fix use-after-free in fec_drv_remove
    f12b6b6bc15f net: pegasus: fix uninit-value in get_interrupt_interval
    c66d273b70fe bnx2x: fix an error code in bnx2x_nic_load()
    f76f9caccb46 mips: Fix non-POSIX regexp
    f93b7b000044 MIPS: check return value of pgtable_pmd_page_ctor
    9b2b2f07712b net: sched: fix lockdep_set_class() typo error for sch->seqlock
    d1f2abe57bc1 net: dsa: qca: ar9331: reorder MDIO write sequence
    a45ee8ed0c7d net: ipv6: fix returned variable type in ip6_skb_dst_mtu
    f87be69b7fe9 nfp: update ethtool reporting of pauseframe control
    44f2e360e784 sctp: move the active_key update after sh_keys is added
    e74551ba938a RDMA/mlx5: Delay emptying a cache entry when a new MR is added to it recently
    1242ca9369b1 gpio: tqmx86: really make IRQ optional
    4ef549dc9c1a net: natsemi: Fix missing pci_disable_device() in probe and remove
    1dc3eef381c1 net: phy: micrel: Fix detection of ksz87xx switch
    e09dba75cafd net: dsa: sja1105: match FDB entries regardless of inner/outer VLAN tag
    c0b14a0e61e7 net: dsa: sja1105: be stateless with FDB entries on SJA1105P/Q/R/S/SJA1110 too
    00bf923dce2a net: dsa: sja1105: invalidate dynamic FDB entries learned concurrently with statically added ones
    de425f1c3a60 net: dsa: sja1105: overwrite dynamic FDB entries with static ones in .port_fdb_add
    74bcf85ff1e2 net, gro: Set inner transport header offset in tcp/udp GRO hook
    80fd533ac3f9 dmaengine: imx-dma: configure the generic DMA type to make it work
    163e6d87216d ARM: dts: stm32: Fix touchscreen IRQ line assignment on DHCOM
    442f7e04d592 ARM: dts: stm32: Disable LAN8710 EDPD on DHCOM
    449991df08d5 media: videobuf2-core: dequeue if start_streaming fails
    3e8bba601212 scsi: sr: Return correct event when media event code is 3
    aaaf6e6e4174 spi: imx: mx51-ecspi: Fix low-speed CONFIGREG delay calculation
    cd989e119272 spi: imx: mx51-ecspi: Reinstate low-speed CONFIGREG delay
    281514da66a4 dmaengine: stm32-dmamux: Fix PM usage counter unbalance in stm32 dmamux ops
    bbce3c99f622 dmaengine: stm32-dma: Fix PM usage counter imbalance in stm32 dma ops
    84656b4c27bf clk: tegra: Implement disable_unused() of tegra_clk_sdmmc_mux_ops
    edf1b7911af2 dmaengine: uniphier-xdmac: Use readl_poll_timeout_atomic() in atomic state
    4ebd11d1c782 omap5-board-common: remove not physically existing vdds_1v8_main fixed-regulator
    9bf056b99fa0 ARM: dts: am437x-l4: fix typo in can@0 node
    e79a30f71d95 clk: stm32f4: fix post divisor setup for I2S/SAI PLLs
    71f39badc898 ALSA: usb-audio: fix incorrect clock source setting
    c4fcda128780 arm64: dts: armada-3720-turris-mox: remove mrvl,i2c-fast-mode
    8d13f6a0a656 arm64: dts: armada-3720-turris-mox: fixed indices for the SDHC controllers
    f239369f37d9 ARM: dts: imx: Swap M53Menlo pinctrl_power_button/pinctrl_power_out pins
    ee6f7084324d ARM: imx: fix missing 3rd argument in macro imx_mmdc_perf_init
    e1011b9c597d ARM: dts: colibri-imx6ull: limit SDIO clock to 25MHz
    c0f61abbefdf arm64: dts: ls1028: sl28: fix networking for variant 2
    54555c399668 ARM: dts: imx6qdl-sr-som: Increase the PHY reset duration to 10ms
    3790f940981d ARM: imx: add missing clk_disable_unprepare()
    a28569b510e5 ARM: imx: add missing iounmap()
    9189d77f0e21 arm64: dts: ls1028a: fix node name for the sysclk
    d61dc8c634bb net: xfrm: fix memory leak in xfrm_user_rcv_msg
    8efe3a635f22 bus: ti-sysc: Fix gpt12 system timer issue with reserved status
    e32a291736fc ALSA: seq: Fix racy deletion of subscriber
    b917f123b50d Revert "ACPICA: Fix memory leak caused by _CID repair function"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 1c0b2ce3b1..6e9b83f7ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9ad4f13ee44c39e890638d8a2157adcf830fc7bc"
-SRCREV_meta ?= "22257690910a1befc2ed8a98ef218bd0c5cfd844"
+SRCREV_machine ?= "459fd323295a5bb19d8ccec0e29dd9d2ba367d81"
+SRCREV_meta ?= "8b02c1cd3424cee6f8d251be8fce9999e59fcf4e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.57"
+LINUX_VERSION ?= "5.10.59"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 755f24c0bd..f5e01f4e69 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.57"
+LINUX_VERSION ?= "5.10.59"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "60d8a10a1e8acdabbd61f3705b67b2112e7866e0"
-SRCREV_machine ?= "df4ea731a9dc6e1076f3e2935d6689668d8f58ac"
-SRCREV_meta ?= "22257690910a1befc2ed8a98ef218bd0c5cfd844"
+SRCREV_machine:qemuarm ?= "124fe0804bda0a51267a847c8e9578630fdbbc99"
+SRCREV_machine ?= "d2ff9c7472c1c748425c04d01e4a682501a0945c"
+SRCREV_meta ?= "8b02c1cd3424cee6f8d251be8fce9999e59fcf4e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index c56d0dc3fb..3702d10dff 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "21075c593dd7a09fc2e0fe4c1f751999fee1127a"
-SRCREV_machine:qemuarm64 ?= "e32f43fed15419c8461207c4d2b76879920d5928"
-SRCREV_machine:qemumips ?= "127501aba35af6e38f50ecd814da4416f361fd84"
-SRCREV_machine:qemuppc ?= "219057449c55acde1060af4b63c2d1ba5ec19978"
-SRCREV_machine:qemuriscv64 ?= "b1ff0bb0de7abc5039e0db14f66e01eb0a3c24bb"
-SRCREV_machine:qemuriscv32 ?= "b1ff0bb0de7abc5039e0db14f66e01eb0a3c24bb"
-SRCREV_machine:qemux86 ?= "b1ff0bb0de7abc5039e0db14f66e01eb0a3c24bb"
-SRCREV_machine:qemux86-64 ?= "b1ff0bb0de7abc5039e0db14f66e01eb0a3c24bb"
-SRCREV_machine:qemumips64 ?= "dd28c0cc8a79329b8b724821e7c09b210a2e2948"
-SRCREV_machine ?= "b1ff0bb0de7abc5039e0db14f66e01eb0a3c24bb"
-SRCREV_meta ?= "22257690910a1befc2ed8a98ef218bd0c5cfd844"
+SRCREV_machine:qemuarm ?= "0978a83dfdb5b685cb0bf102c806a768afb87ae9"
+SRCREV_machine:qemuarm64 ?= "4419f5b76905d079459659e22e68206295461cc4"
+SRCREV_machine:qemumips ?= "258e3d3c45063749d28d8c5f0be7f7de7a7a9a07"
+SRCREV_machine:qemuppc ?= "9b76cd9298382a9d1f49297a094def200504da38"
+SRCREV_machine:qemuriscv64 ?= "0e615f60692e56f2f0c68c1560c95804b8d9b6cf"
+SRCREV_machine:qemuriscv32 ?= "0e615f60692e56f2f0c68c1560c95804b8d9b6cf"
+SRCREV_machine:qemux86 ?= "0e615f60692e56f2f0c68c1560c95804b8d9b6cf"
+SRCREV_machine:qemux86-64 ?= "0e615f60692e56f2f0c68c1560c95804b8d9b6cf"
+SRCREV_machine:qemumips64 ?= "35aae8ce2453e7c72c933ec7b61df88b2dc49d55"
+SRCREV_machine ?= "0e615f60692e56f2f0c68c1560c95804b8d9b6cf"
+SRCREV_meta ?= "8b02c1cd3424cee6f8d251be8fce9999e59fcf4e"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.57"
+LINUX_VERSION ?= "5.10.59"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

