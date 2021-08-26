Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web09.30961.1629987825628481738
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 07:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nndjwPDV;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id s16so247314qvt.13
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Aug 2021 07:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ggPclj+6QReGnmCNQIyyKlWhrdAnUJuyxwIG87Qr01g=;
        b=nndjwPDV9UJEogUaSVpUa4RgM+PlfmzvwZT8sv8zV+CxyVEdcAJITzMP1AuCEP3pIj
         mk4jyXTFR7GsOAZItBtLvoaeUhjRjHYpLc1eShlogwuvCCWwHcHvyDoq+WqKMUnBtGQr
         p1JMDbiwgtq4a69kQ/M/Tj+NyKVET47nMS0BDcecV8CBfY0fa1TgwRGCByMDHIc7ZQ0t
         DMFTQMQP6VZ4pd0K1NsJvkhhf3iHL32aKFziUSe0DOjlGbEx5O8VYCSwqop4dPx9Vary
         dI9BvnsfY14o1agFe+aHi8rN4+1Pfn5jwx4kuMq0exqdjKUjTiLxHPHlFrAZNUq0AWMF
         pEPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ggPclj+6QReGnmCNQIyyKlWhrdAnUJuyxwIG87Qr01g=;
        b=NnjG8MxNJTH5L02Dx/HXN0JSb6bQQjalsOld1pzLvhrhPocftaHgMXSXKoikr6hOHT
         8VNA0L2PYVNVk/d3BGK67mXfCNUyB/J2VhCmVHCVdtZOdUqE5JlzAMKXI8QtQVubu1jn
         wuOnc49v/7MwcICtuoa9VtxCWnVXnPCqUHLeqfJNsTbTZ8I6of1kFEDqM8dS4xVO5k8q
         Ip4+eTXIMRhravP22FO+9j3GoSDgqgGA69RL66QuaCoE59AEtQ+iH8pjyBavUdJ0F2de
         T0LXgTCqBdpXL2wIoUI4TF0GqHlEHXianK307ay72WxNi8dmjZLp0ITn+3VoIhJvQToD
         oDnQ==
X-Gm-Message-State: AOAM531m/xzLohKV8lNauGFGOkt9QOggcTpCXezdzWYaymPYkcp1XQHd
	0VlqKdbCTorjYTshhG8G/m1ifWRBsDK05Q==
X-Google-Smtp-Source: ABdhPJwoCDa7Zy1NIhySNvDptURJD3N5JQwFuftksPKhjl3aysUDy1OijiHeGSuz//KYwk9CQLQulw==
X-Received: by 2002:a05:6214:238a:: with SMTP id fw10mr4390510qvb.27.1629987824606;
        Thu, 26 Aug 2021 07:23:44 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id q10sm2676124qke.108.2021.08.26.07.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 07:23:44 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/5.13: update to v5.13.11
Date: Thu, 26 Aug 2021 10:23:38 -0400
Message-Id: <39a4cf212d20d791a07d290ab2ea822782a0a31e.1629987648.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1629987648.git.bruce.ashfield@gmail.com>
References: <cover.1629987648.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.13 to the latest korg -stable release that comprises
the following commits:

    a3f1a03f54fc Linux 5.13.11
    41812f4b8448 ovl: prevent private clone if bind mount is not allowed
    2b187b56d531 ppp: Fix generating ppp unit id when ifname is not specified
    9153106ca7e3 ALSA: hda: Add quirk for ASUS Flow x13
    1252406498a6 ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook 650 G8 Notebook PC
    c67b3ee8ca46 ALSA: pcm: Fix mmap breakage without explicit buffer setup
    95421b33f9a2 bpf: Add lockdown check for probe_write_user helper
    ea56b15b909c firmware: tee_bnxt: Release TEE shm, session, and context during kexec
    a37da2be8e6c Linux 5.13.10
    65485c34aa43 HID: ft260: fix device removal due to USB disconnect
    6cf4cab9db7e platform/x86: gigabyte-wmi: add support for B550 Aorus Elite V2
    37d363b3f6f7 drm/amdgpu/display: only enable aux backlight control for OLED panels
    0505f8c628b9 smb3: rc uninitialized in one fallocate path
    b092186eb9e6 net/qla3xxx: fix schedule while atomic in ql_wait_for_drvr_lock and ql_adapter_reset
    23f50e8ea008 alpha: Send stop IPI to send to online CPUs
    dd62ad1e49cc net: qede: Fix end of loop tests for list_for_each_entry
    f4c5021e7b3a virt_wifi: fix error on connect
    cd5a60de176c reiserfs: check directory items on read from disk
    42b81b2b6766 reiserfs: add check for root_inode in reiserfs_fill_super
    aa54be4d1716 libata: fix ata_pio_sector for CONFIG_HIGHMEM
    fb9501ef203d riscv: dts: fix memory size for the SiFive HiFive Unmatched
    aa11124534b9 sched/rt: Fix double enqueue caused by rt_effective_prio
    bfdb06df02df perf/x86/amd: Don't touch the AMD64_EVENTSEL_HOSTONLY bit inside the guest
    1de1a42a8590 soc: ixp4xx/qmgr: fix invalid __iomem access
    8db20e539486 drm/i915: Correct SFC_DONE register offset
    9f01d090be13 interconnect: qcom: icc-rpmh: Ensure floor BW is enforced for all nodes
    019387e3c21f interconnect: Always call pre_aggregate before aggregate
    39382972e727 interconnect: Zero initial BW after sync-state
    f2ca988aba4e spi: meson-spicc: fix memory leak in meson_spicc_remove
    e170a01152d2 usb: cdnsp: Fix incorrect supported maximum speed
    95108645a282 usb: cdnsp: Fix the IMAN_IE_SET and IMAN_IE_CLEAR macro
    e9b413776d32 interconnect: Fix undersized devress_alloc allocation
    6d74664e9843 soc: ixp4xx: fix printing resources
    7a822dd050b1 KVM: x86/mmu: Fix per-cpu counter corruption on 32-bit builds
    16375248cec6 KVM: Do not leak memory for duplicate debugfs directories
    9a6772458f8e KVM: SVM: Fix off-by-one indexing when nullifying last used SEV VMCB
    82c9a3098bbc KVM: x86: accept userspace interrupt only if no event is injected
    642ffd390d67 s390/dasd: fix use after free in dasd path handling
    6ed983ea4a12 io-wq: fix race between worker exiting and activating free worker
    08ed8d676c94 md/raid10: properly indicate failure when ending a failed write request
    d6e1229a1bbb ARM: omap2+: hwmod: fix potential NULL pointer access
    b5f6bab9522e arm64: fix compat syscall return truncation
    a62784c80b1b Revert "gpio: mpc8xxx: change the gpio interrupt flags."
    383d2836d2fa bus: ti-sysc: AM3: RNG is GP only
    6e8de6c62763 selinux: correct the return value when loads initial sids
    f730f081a49b scsi: ibmvfc: Fix command state accounting and stale response detection
    1cbbe89e6123 pcmcia: i82092: fix a null pointer dereference bug
    60cd03514038 net/xfrm/compat: Copy xfrm_spdattr_type_t atributes
    d6bfaf682860 xfrm: Fix RCU vs hash_resize_mutex lock inversion
    662a1fd0ec69 perf: Fix required permissions if sigtrap is requested
    711f71b661ff virt: acrn: Do hcall_destroy_vm() before resource release
    9ae78810a2b4 timers: Move clearing of base::timer_running under base:: Lock
    fafe9cf51f80 fpga: dfl: fme: Fix cpu hotplug issue in performance reporting
    03d6da7c923f serial: 8250_pci: Avoid irq sharing for MSI(-X) interrupts.
    134cbd486ac4 serial: 8250_pci: Enumerate Elkhart Lake UARTs via dedicated driver
    9b2967bd9888 MIPS: Malta: Do not byte-swap accesses to the CBUS UART
    b321bb83a2c6 serial: 8250: fix handle_irq locking
    979bd0e11d88 serial: 8250: Mask out floating 16/32-bit bus bits
    19364aeb0b63 serial: 8250_mtk: fix uart corruption issue when rx power off
    b188f699e036 serial: tegra: Only print FIFO error message when an error occurs
    ddbd617df071 Revert "thunderbolt: Hide authorized attribute if router does not support PCIe tunnels"
    bc3c6b55a4ea ext4: fix potential htree corruption when growing large_dir directories
    e745e3033999 pipe: increase minimum default pipe size to 2 pages
    e58376a283bd media: rtl28xxu: fix zero-length control request
    e10d4de4ff5e drivers core: Fix oops when driver probe fails
    9f57b942c4f3 staging: rtl8712: error handling refactoring
    e7565488445d staging: rtl8712: get rid of flush_scheduled_work
    125b1d808b98 staging: rtl8723bs: Fix a resource leak in sd_int_dpc
    7a4e7a65d088 tpm_ftpm_tee: Free and unregister TEE shared memory during kexec
    156dc5bd1c8d optee: fix tee out of memory failure seen during kexec reboot
    7a710ab78bb8 optee: Refuse to load the driver under the kdump kernel
    255e17923b22 optee: Fix memory leak when failing to register shm pages
    55dac0db5316 tee: Correct inappropriate usage of TEE_SHM_DMA_BUF flag
    a256c244187a tee: add tee_shm_alloc_kernel_buf()
    dca5025908f7 optee: Clear stale cache entries during initialization
    c7003666555d arm64: stacktrace: avoid tracing arch_stack_walk()
    ab19b258d68b tracepoint: Use rcu get state and cond sync for static call updates
    21acfdc21754 tracepoint: Fix static call function vs data state mismatch
    ee6f51d74e11 tracepoint: static call: Compare data on transition from 2->1 callees
    1483ce6d8ffd tracing: Fix NULL pointer dereference in start_creating
    aa9876e40cb6 tracing: Reject string operand in the histogram expression
    53e512b6c563 tracing / histogram: Give calculation hist_fields a size
    b907f0dd99cc scripts/tracing: fix the bug that can't parse raw_trace_func
    00fcd7f7a28b clk: fix leak on devm_clk_bulk_get_all() unwind
    8bb9022e0737 usb: otg-fsm: Fix hrtimer list corruption
    8ac3e4bdc284 usb: typec: tcpm: Keep other events when receiving FRS and Sourcing_vbus events
    f6f2d875a557 usb: host: ohci-at91: suspend/resume ports after/before OHCI accesses
    74cd6464d6ad usb: gadget: f_hid: idle uses the highest byte for duration
    b27bb0d8988e usb: gadget: f_hid: fixed NULL pointer dereference
    12620d8780dd usb: gadget: f_hid: added GET_IDLE and SET_IDLE handlers
    39129dc820d0 usb: cdnsp: Fixed issue with ZLP
    36d3bb59f3c6 usb: cdns3: Fixed incorrect gadget state
    271a4a35c61d usb: gadget: remove leaked entry from udc driver list
    fadfc2b17a1d usb: dwc3: gadget: Avoid runtime resume if disabling pullup
    cde7b3b1ddd4 usb: dwc3: gadget: Use list_replace_init() before traversing lists
    22952d4d1ae2 ALSA: usb-audio: Avoid unnecessary or invalid connector selection at resume
    11ebf7631eb6 ALSA: usb-audio: Add registration quirk for JBL Quantum 600
    8691bda37729 ALSA: usb-audio: Fix superfluous autosuspend recovery
    6537805a71cd ALSA: hda/realtek: Fix headset mic for Acer SWIFT SF314-56 (ALC256)
    4cb3b665fa39 ALSA: hda/realtek: add mic quirk for Acer SF314-42
    fb78a577d5e5 ALSA: pcm - fix mmap capability check for the snd-dummy driver
    797bcd3d678b drm/amdgpu/display: fix DMUB firmware version info
    8330879408e5 drm/amdgpu: fix checking pmops when PM_SLEEP is not enabled
    c14a54675db7 firmware_loader: fix use-after-free in firmware_fallback_sysfs
    34311eaec13b firmware_loader: use -ETIMEDOUT instead of -EAGAIN in fw_load_sysfs_fallback
    44b8abfb1c0f USB: serial: pl2303: fix GT type detection
    654b54e72cb3 USB: serial: pl2303: fix HX type detection
    ccc55e1df78b USB: serial: ftdi_sio: add device ID for Auto-M3 OP-COM v2
    9fc923d27852 USB: serial: ch341: fix character loss at high transfer rates
    a07d3a2a57de USB: serial: option: add Telit FD980 composition 0x1056
    e7cf487c5f05 USB: usbtmc: Fix RCU stall warning
    d92eaad3ed95 io-wq: fix lack of acct->nr_workers < acct->max_workers judgement
    ebad5646c059 io-wq: fix no lock protection of acct->nr_worker
    75dd00b755eb Bluetooth: defer cleanup of resources in hci_unregister_dev()
    5c4139e2e299 blk-iolatency: error out if blk_get_queue() failed in iolatency_set_limit()
    fc443dec3786 net: vxge: fix use-after-free in vxge_device_unregister
    5969dc53160a net: fec: fix use-after-free in fec_drv_remove
    91c159168dbd net: pegasus: fix uninit-value in get_interrupt_interval
    a4e2310d171e net: ethernet: ti: am65-cpsw: fix crash in am65_cpsw_port_offload_fwd_mark_update()
    6e2de0ad1d17 bnx2x: fix an error code in bnx2x_nic_load()
    9884f6096c4a kbuild: cancel sub_make_done for the install target to fix DKMS
    cb1f2a9b52d6 mips: Fix non-POSIX regexp
    a047015d4b23 x86/tools/relocs: Fix non-POSIX regexp
    b50d4d2b6fc6 MIPS: check return value of pgtable_pmd_page_ctor
    367c5c9d53e4 drm/i915: fix i915_globals_exit() section mismatch error
    8cc7b4cbce30 net: sched: fix lockdep_set_class() typo error for sch->seqlock
    04c35b1c155d riscv: Disable STACKPROTECTOR_PER_TASK if GCC_PLUGIN_RANDSTRUCT is enabled
    57b76a8fec62 net: dsa: qca: ar9331: reorder MDIO write sequence
    60dd525573d5 RDMA/hns: Fix the double unlock problem of poll_sem
    c3aba13b0e21 net: ipv6: fix returned variable type in ip6_skb_dst_mtu
    2841b3001376 nfp: update ethtool reporting of pauseframe control
    0294ca659bce drm/i915: Call i915_globals_exit() if pci_register_device() fails
    d73959cc5d98 sctp: move the active_key update after sh_keys is added
    8a9099d737d1 net: bridge: validate the NUD_PERMANENT bit when adding an extern_learn FDB entry
    29d04e9cf568 RDMA/mlx5: Delay emptying a cache entry when a new MR is added to it recently
    84a55bb25b8c gpio: tqmx86: really make IRQ optional
    be4b1c034ce7 net: natsemi: Fix missing pci_disable_device() in probe and remove
    a8c78e76c426 net: phy: micrel: Fix detection of ksz87xx switch
    6986053b6f33 net: dsa: sja1105: match FDB entries regardless of inner/outer VLAN tag
    731993ae08c3 net: dsa: sja1105: be stateless with FDB entries on SJA1105P/Q/R/S/SJA1110 too
    8a9e4d4e6ede net: dsa: sja1105: ignore the FDB entry for unknown multicast when adding a new address
    f072c44eb10b net: dsa: sja1105: invalidate dynamic FDB entries learned concurrently with statically added ones
    8395e1c53494 net: dsa: sja1105: overwrite dynamic FDB entries with static ones in .port_fdb_add
    1e6eab0aa13b net, gro: Set inner transport header offset in tcp/udp GRO hook
    64b81fcfd37f dmaengine: imx-dma: configure the generic DMA type to make it work
    6cb60082664e ARM: dts: stm32: Fix touchscreen IRQ line assignment on DHCOM
    3957b6192d01 ARM: dts: stm32: Disable LAN8710 EDPD on DHCOM
    941212f8762b ARM: dts: stm32: Prefer HW RTC on DHCOM SoM
    938b3e21c01a media: videobuf2-core: dequeue if start_streaming fails
    5258b116b485 scsi: sr: Return correct event when media event code is 3
    c298b61f6524 drm/kmb: Enable LCD DMA for low TVDDCV
    1d9f0250c73c spi: imx: mx51-ecspi: Fix low-speed CONFIGREG delay calculation
    de77638ae9ac spi: imx: mx51-ecspi: Reinstate low-speed CONFIGREG delay
    64df529b50d0 dmaengine: stm32-dmamux: Fix PM usage counter unbalance in stm32 dmamux ops
    748fb4387195 dmaengine: stm32-dma: Fix PM usage counter imbalance in stm32 dma ops
    e03d177b32d8 clk: tegra: Implement disable_unused() of tegra_clk_sdmmc_mux_ops
    a4240c4f23fb dmaengine: uniphier-xdmac: Use readl_poll_timeout_atomic() in atomic state
    50836f77ccc2 omap5-board-common: remove not physically existing vdds_1v8_main fixed-regulator
    4b0843e94e86 ARM: dts: am437x-l4: fix typo in can@0 node
    36fec2753f39 clk: stm32f4: fix post divisor setup for I2S/SAI PLLs
    747d62a533b5 riscv: stacktrace: Fix NULL pointer dereference
    b28fd0f0b5cf ALSA: usb-audio: fix incorrect clock source setting
    f98f80297a05 arm64: dts: armada-3720-turris-mox: remove mrvl,i2c-fast-mode
    71ecd71e4e6e ext4: fix potential uninitialized access to retval in kmmpd
    b49b428e9462 arm64: dts: armada-3720-turris-mox: fixed indices for the SDHC controllers
    710be2446523 ARM: dts: imx: Swap M53Menlo pinctrl_power_button/pinctrl_power_out pins
    15d9eb484ebd ARM: imx: fix missing 3rd argument in macro imx_mmdc_perf_init
    50f5768127aa ARM: dts: colibri-imx6ull: limit SDIO clock to 25MHz
    c9658f4ddfce arm64: dts: ls1028: sl28: fix networking for variant 2
    d882c91b1585 dmaengine: idxd: fix submission race window
    1f2b17134c7c dmaengine: idxd: fix sequence for pci driver remove() and shutdown()
    6c3b6b10a84f dmaengine: idxd: fix desc->vector that isn't being updated
    48b425d005b5 Revert "soc: imx8m: change to use platform driver"
    ad6ef82f5695 ARM: dts: imx6qdl-sr-som: Increase the PHY reset duration to 10ms
    b1137318a18c ARM: imx: add missing clk_disable_unprepare()
    f6624656c389 ARM: imx: add missing iounmap()
    e1045d5ac6ad dmaengine: idxd: fix setup sequence for MSIXPERM table
    1c8a2fa0600a dmaengine: idxd: fix array index when int_handles are being used
    84e5c5ccd6ef arm64: dts: ls1028a: fix node name for the sysclk
    e95a18d6f83a net: xfrm: fix memory leak in xfrm_user_rcv_msg
    c03d1a2a4b99 bus: ti-sysc: Fix gpt12 system timer issue with reserved status
    3419672f00c8 ALSA: seq: Fix racy deletion of subscriber
    873180433191 Revert "ACPICA: Fix memory leak caused by _CID repair function"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.13.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.13.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
index 23e1607e6d..db922c17b2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "18b765d01fcd510ccc87d25c62090c3c0b993afe"
-SRCREV_meta ?= "2b89265a0bf39358c674a8e0f38552f6adec6ad8"
+SRCREV_machine ?= "6ff7d7f8b079e82c83929df1b3ec5c9694e28f94"
+SRCREV_meta ?= "ebf34680af9896d3da7cbf4be0fd5e287559372c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.13.9"
+LINUX_VERSION ?= "5.13.11"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
index 81fdd5302f..c7bea48fce 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.13.9"
+LINUX_VERSION ?= "5.13.11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "900da50ce87ab003fecea205f1e1a8c0cdb1ff04"
-SRCREV_machine ?= "3401b8f14370ed2d667c7aa8415c2fcfe50bb414"
-SRCREV_meta ?= "2b89265a0bf39358c674a8e0f38552f6adec6ad8"
+SRCREV_machine:qemuarm ?= "a6b42a4b1d650298ca77a0a4924df5ef37f6d000"
+SRCREV_machine ?= "abd88a509b11a383af46a6ee40a7ae46a0a0b700"
+SRCREV_meta ?= "ebf34680af9896d3da7cbf4be0fd5e287559372c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
index cde00b56a5..78f474c9b9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.13/standard/base"
 KBRANCH:qemux86-64 ?= "v5.13/standard/base"
 KBRANCH:qemumips64 ?= "v5.13/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "e85bc7dd9373a476d7a190b31aed1b95811a82ee"
-SRCREV_machine:qemuarm64 ?= "a88c6ef395d5fb8e0b6d8df3e1099b7e5b584968"
-SRCREV_machine:qemumips ?= "c040b29d5eda76464d67b59373977f289d3646df"
-SRCREV_machine:qemuppc ?= "5c6982e564b80ec80f77d728186f7b29ff62898f"
-SRCREV_machine:qemuriscv64 ?= "609a8a548c0931b07afb0f8b92068ec10e306aa5"
-SRCREV_machine:qemuriscv32 ?= "609a8a548c0931b07afb0f8b92068ec10e306aa5"
-SRCREV_machine:qemux86 ?= "609a8a548c0931b07afb0f8b92068ec10e306aa5"
-SRCREV_machine:qemux86-64 ?= "609a8a548c0931b07afb0f8b92068ec10e306aa5"
-SRCREV_machine:qemumips64 ?= "583c978f97f6e1b779f2210e74907d0c1c3da9a2"
-SRCREV_machine ?= "609a8a548c0931b07afb0f8b92068ec10e306aa5"
-SRCREV_meta ?= "2b89265a0bf39358c674a8e0f38552f6adec6ad8"
+SRCREV_machine:qemuarm ?= "d3166cf020bc65c4ae322afb38ccd571e15d3df9"
+SRCREV_machine:qemuarm64 ?= "263fa9bce1cbbecef59fc8460d23fa5ec289cfa9"
+SRCREV_machine:qemumips ?= "caffc7430fe0a6674f8e6dbd97bae05c59039e88"
+SRCREV_machine:qemuppc ?= "c061eef7c73df5d534ebd800a439fb95aac5829c"
+SRCREV_machine:qemuriscv64 ?= "fe64083abac67ac736aa0133f3a4088286aece40"
+SRCREV_machine:qemuriscv32 ?= "fe64083abac67ac736aa0133f3a4088286aece40"
+SRCREV_machine:qemux86 ?= "fe64083abac67ac736aa0133f3a4088286aece40"
+SRCREV_machine:qemux86-64 ?= "fe64083abac67ac736aa0133f3a4088286aece40"
+SRCREV_machine:qemumips64 ?= "28a1eb78129046c8f3f06f7cc1710fc761a84e30"
+SRCREV_machine ?= "fe64083abac67ac736aa0133f3a4088286aece40"
+SRCREV_meta ?= "ebf34680af9896d3da7cbf4be0fd5e287559372c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "2b89265a0bf39358c674a8e0f38552f6adec6ad8"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "f259ee2f037925eaf3d0c53f7d7aa2d3fae4ea13"
+SRCREV_machine:class-devupstream ?= "a3f1a03f54fc08ca86ad0759a46244a771ce6547"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.13/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.13.9"
+LINUX_VERSION ?= "5.13.11"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

