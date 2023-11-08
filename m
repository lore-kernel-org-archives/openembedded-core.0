Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40667C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 14:16:37 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.14676.1699452995506762092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 06:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nrm8Y+pw;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-41cd8bd5727so42751211cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 06:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699452994; x=1700057794; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H0dKZAMyT9wLDVX5edz3B8vzkukY/7VbAYtIPffCOAg=;
        b=Nrm8Y+pw7kdL3hlIBYFTYHsjgiVPgQ3WB1mu3amC1U+W5tSY+2+orNnV8wzpe7j7YS
         ycydRrki6eVdf5cUCfte8iMfyDlt2MYu4Yg+iHrKiC2xoYdfoZ+y2K5P1injD2nnrmVu
         LeH673cOmkO/s/bfoEbRiCD+HW276WawTz3ndPPny5M2OjZhkr9804WMoVcO/FaqQ+Ay
         9nKtXEcul18RDIo+UQnq7zauhwUqEFYhYGB2xpJxHG3LT+juTJWhLUqbCYjQZrCSMbtN
         7SrLoxCK0eJ5HaNrBXH54G7TEc/QMcjynOZfxafblAv1h1aCeOmKHxTNgDydS2F5PA53
         lqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699452994; x=1700057794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0dKZAMyT9wLDVX5edz3B8vzkukY/7VbAYtIPffCOAg=;
        b=p6gq017BEB0iOUiKt55M+grbhB11m0gZYTpPpK6+PtXFVKTVSexmtizA2/eQGchAF8
         9wnX0F9yOHIeQM0xkpc5aUbObMoaaPnOkZeAzRMkJf5T1PiIGO4PiitDQLuDlLWiE+4o
         j8UA3HeawKygrkq6ZTpYFOLSTfzLG+dPU2596HTAkrS6MP4s04chkJYQSUnql5XIpA+3
         tKZI8yn7Fi2N2WipdRD5N5WSaBp4ukVszmx1Cwie9oDmM1fBsom612s5fG4qZOhYc0T8
         6R9426fbJaDDGoaXVRZNg402e7X42VTcrbP6oeaN/NzJ0F+aZq/FmaTY34sf2BKjmhZg
         vdsA==
X-Gm-Message-State: AOJu0Yy4B0GeE+S/VNrVXk55csJwOaQE2YHKYN+urE/HkONjewgWU1qv
	SBDwZzYNkV7q06VXdLWj2YObCllLdIXnOObF
X-Google-Smtp-Source: AGHT+IHSkJo3UTPndvzEx/ogq8foexY2e0ehIqO+73RWA8+7gvhUY5ua0A4K3yg5sda+hGaG/7GzDA==
X-Received: by 2002:a05:622a:1742:b0:417:95e7:a2f7 with SMTP id l2-20020a05622a174200b0041795e7a2f7mr2316258qtk.19.1699452994285;
        Wed, 08 Nov 2023 06:16:34 -0800 (PST)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id j14-20020ac85c4e000000b004181138e0c0sm921665qtj.31.2023.11.08.06.16.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 06:16:33 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/12] linux-yocto/6.5: update to v6.5.8
Date: Wed,  8 Nov 2023 09:16:19 -0500
Message-Id: <7f6c9b8cd499f21d2ad8825128231be3b3892f3f.1699452828.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699452828.git.bruce.ashfield@gmail.com>
References: <cover.1699452828.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 14:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190340

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    8bbe7c640d76 Linux 6.5.8
    46fd4e1547f9 ALSA: hda/realtek - Fixed two speaker platform
    ae0c44ce454d ovl: fix regression in showing lowerdir mount option
    a8187a9ca253 ovl: make use of ->layers safe in rcu pathwalk
    58240ade86f2 ovl: fix regression in parsing of mount options with escaped comma
    cd86498418ed fs: factor out vfs_parse_monolithic_sep() helper
    87be623442a8 fs: Fix kernel-doc warnings
    9baee1becd64 powerpc/64e: Fix wrong test in __ptep_test_and_clear_young()
    909c0bfa08d5 powerpc/8xx: Fix pte_access_permitted() for PAGE_NONE
    7b126f4402c2 dmaengine: mediatek: Fix deadlock caused by synchronize_irq()
    c6695a0ad6fb dmaengine: idxd: use spin_lock_irqsave before wait_event_lock_irq
    0c1773bf8f38 Revert "x86/smp: Put CPUs into INIT on shutdown if possible"
    a9b0e9e65106 usb: misc: onboard_hub: add support for Microchip USB2412 USB 2.0 hub
    91a9aaad5d8c usb: typec: qcom: Update the logic of regulator enable and disable
    f0c0314aac42 usb: cdnsp: Fixes issue with dequeuing not queued requests
    4bf1a9d20c65 usb: gadget: ncm: Handle decoding of multiple NTB's in unwrap call
    098bc0565250 usb: gadget: udc-xilinx: replace memcpy with memcpy_toio
    3039b7d5ebb7 usb: typec: ucsi: Clear EVENT_PENDING bit if ucsi_send_command fails
    522b7d736575 usb: typec: altmodes/displayport: Signal hpd low when exiting mode
    d386632939e0 usb: typec: ucsi: Fix missing link removal
    d68c74f3b2db RISC-V: Fix wrong use of CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK
    3431cfe773ac riscv: Remove duplicate objcopy flag
    fdd3ceb0001d coresight: Fix run time warnings while reusing ETR buffer
    8c4f6d1a8e4d counter: microchip-tcb-capture: Fix the use of internal GCLK logic
    837b24646cfd counter: chrdev: fix getting array extensions
    6a4a432e616f riscv: Only consider swbp/ss handlers for correct privileged mode
    27f69c85f445 scsi: ufs: core: Correct clear TM error log
    d2180b58a8a1 pinctrl: avoid unsafe code pattern in find_pinctrl()
    a473943294f1 dma-buf: add dma_fence_timestamp helper
    da9de0b714d5 cgroup: Remove duplicates in cgroup v1 tasks file
    c3239301ef7a usb: typec: ucsi: Use GET_CAPABILITY attributes data to set power supply scope
    92437349c0f0 power: supply: qcom_battmgr: fix enable request endianness
    fbda26ff92e0 power: supply: qcom_battmgr: fix battery_id type
    704e0e2a0c60 can: sja1000: Always restart the Tx queue after an overrun
    fc9ea80fa4e9 nfp: flower: avoid rmmod nfp crash issues
    f7c949fa298f block: Don't invalidate pagecache for invalid falloc modes
    2405f64a95a7 mctp: perform route lookups under a RCU read-side lock
    1c95574350cd tee: amdtee: fix use-after-free vulnerability in amdtee_close_session
    b8f18fa39cec Input: goodix - ensure int GPIO is in input for gpio_count == 1 && gpio_int_idx == 0 case
    eb2b6503a6ff Input: xpad - add HyperX Clutch Gladiate Support
    8a2c1970a178 Input: i8042 - add Fujitsu Lifebook E5411 to i8042 quirk table
    9832f2274abe Input: xpad - add PXN V900 support
    eb12a7d348ed Input: psmouse - fix fast_reconnect function for PS/2 mode
    e528b1b9d607 Input: powermate - fix use-after-free in powermate_config_complete
    093f82c2b56b ceph: fix type promotion bug on 32bit systems
    afe8dcef4b7a ceph: fix incorrect revoked caps assert in ceph_fill_file_size()
    707ee6525987 libceph: use kernel_connect()
    70f6756ad96d powerpc/47x: Fix 47x syscall return crash
    e28ca99f2f9c powerpc/pseries: Fix STK_PARAM access in the hcall tracing code
    b6ab7f19a44f thunderbolt: Restart XDomain discovery handshake after failure
    9828a7fa65a6 thunderbolt: Correct TMU mode initialization from hardware
    7525edf6aca5 thunderbolt: Check that lane 1 is in CL0 before enabling lane bonding
    5e9e8b6448f4 thunderbolt: Workaround an IOMMU fault on certain systems with Intel Maple Ridge
    3953f7ca6521 mcb: remove is_added flag from mcb_device struct
    cd287cc208df x86/alternatives: Disable KASAN in apply_alternatives()
    12f8e4d71d99 x86/cpu: Fix AMD erratum #1485 on Zen4-based CPUs
    f71edacbd4f9 perf/x86/lbr: Filter vsyscall addresses
    f40723f20839 ksmbd: not allow to open file if delelete on close bit is set
    77d616b2b4ed binder: fix memory leaks of spam and pending work
    8459746f889d serial: core: Fix checks for tx runtime PM state
    02c7efd75c61 serial: 8250_omap: Fix errors with no_console_suspend
    031ddb94d4ef serial: Reduce spinlocked portion of uart_rs485_config()
    a20d0faed2f4 ACPI: EC: Add quirk for the HP Pavilion Gaming 15-dk1xxx
    351a16dff55b ACPI: resource: Add TongFang GM6BGEQ, GM6BG5Q and GM6BG0Q to irq1_edge_low_force_override[]
    e7a8ce872214 ACPI: resource: Skip IRQ override on ASUS ExpertBook B1402CBA
    1474b39f9617 drm/vmwgfx: Keep a gem reference to user bos in surfaces
    65059dc00a79 drm/amd/display: Don't set dpms_off for seamless boot
    ea7596e54ba9 drm/amdgpu: add missing NULL check
    d8bb7861a764 drm/atomic-helper: relax unregistered connector check
    7e34cec74ee1 drm/tiny: correctly print `struct resource *` on error
    8abd2793db0f drm: Do not overrun array in drm_gem_get_pages()
    5ecce079d8ef arm64: dts: mediatek: mt8195-demo: update and reorder reserved memory regions
    b2b2706b149d arm64: dts: mediatek: mt8195-demo: fix the memory size to 8GB
    a4442f43569c media: subdev: Don't report V4L2_SUBDEV_CAP_STREAMS when the streams API is disabled
    bcf670d1f6b3 iio: addac: Kconfig: update ad74413r selections
    5ad7badddf52 iio: adc: ad7192: Correct reference voltage
    96e1752330df iio: pressure: ms5611: ms5611_prom_is_valid false negative bug
    a934a1a2b5ac iio: pressure: dps310: Adjust Timeout Settings
    727115b7c668 iio: admv1013: add mixer_vgate corner cases
    197f50f9699d iio: dac: ad3552r: Correct device IDs
    7488449fce1b iio: adc: imx8qxp: Fix address for command buffer registers
    833423930050 iio: cros_ec: fix an use-after-free in cros_ec_sensors_push_data()
    8a80ebbdc490 iio: imu: bno055: Fix missing Kconfig dependencies
    a130c5dacfe4 iio: pressure: bmp280: Fix NULL pointer exception
    4c7f9ce4e1ed usb: musb: Modify the "HWVers" register address
    9f13422e080b usb: musb: Get the musb_qh poniter after musb_giveback
    136f69a04e71 usb: hub: Guard against accesses to uninitialized BOS descriptors
    d33756339fe2 usb: cdns3: Modify the return value of cdns_set_active () to void when CONFIG_PM_SLEEP is disabled
    c39cb50e1b8a usb: dwc3: Soft reset phy on probe for host
    92d68868386d net: usb: dm9601: fix uninitialized variable use in dm9601_mdio_read
    41d00825cbff xhci: Preserve RsvdP bits in ERSTBA register correctly
    c247dfde7e40 xhci: Clear EHB bit only at end of interrupt handler
    c4ea3c85a64a xhci: track port suspend state correctly in unsuccessful resume cases
    acf5731ea0de usb: xhci: xhci-ring: Use sysdev for mapping bounce buffer
    86b3ba53b81d dmaengine: stm32-mdma: set in_flight_bytes in case CRQA flag is set
    70641b112b5b dmaengine: stm32-mdma: use Link Address Register to compute residue
    02544433d143 dmaengine: stm32-dma: fix residue in case of MDMA chaining
    fa03b3920caa dmaengine: stm32-dma: fix stm32_dma_prep_slave_sg in case of MDMA chaining
    f862dcfa849f dmaengine: stm32-mdma: abort resume if no ongoing transfer
    56f16bda27aa ovl: temporarily disable appending lowedirs
    8eaa7650056d riscv: signal: fix sigaltstack frame size checking
    c24f3b78692d workqueue: Override implicit ordered attribute in workqueue_apply_unbound_cpumask()
    63ca6c516fe6 rswitch: Fix imbalance phy_power_off() calling
    8911d3485cec rswitch: Fix renesas_eth_sw_remove() implementation
    7164d177bd16 octeontx2-pf: Fix page pool frag allocation warning
    6584eba7688d nfc: nci: assert requested protocol is valid
    843e69515b04 af_packet: Fix fortified memcpy() without flex array.
    84a6f89acb77 pinctrl: renesas: rzn1: Enable missing PINMUX
    e8dc72cb8312 net: tcp: fix crashes trying to free half-baked MTU probes
    806f8e051903 net/smc: Fix pos miscalculation in statistics
    d1af8a39cf83 net: nfc: fix races in nfc_llcp_sock_get() and nfc_llcp_sock_get_sn()
    cf5b41a81fee s390/bpf: Fix unwinding past the trampoline
    beb59c1a3296 s390/bpf: Fix clobbering the caller's backchain in the trampoline
    96217b5df8ae net/mlx5e: Again mutually exclude RX-FCS and RX-port-timestamp
    915a812423ed net/smc: Fix dependency of SMC on ISM
    9c22611716b1 ixgbe: fix crash with empty VF macvlan list
    78004df64a76 drm/panel: boe-tv101wum-nl6: Completely pull GPW to VGL before TP term
    946b595277a7 net/mlx5e: macsec: use update_pn flag instead of PN comparation
    5bf8bd49315a net: phy: mscc: macsec: reject PN update requests
    f74aa471ee76 net: macsec: indicate next pn update when offloading
    e0a9630ad1d5 octeontx2-pf: mcs: update PN only when update_pn is true
    90baaf9ced76 net: refine debug info in skb_checksum_help()
    7067ebaf98a2 bpf: Fix verifier log for async callback return values
    67394149d7c4 drm/vmwgfx: fix typo of sizeof argument
    50c28a3bfe6e xdp: Fix zero-size allocation warning in xskq_create()
    5b01f4c71a03 riscv, bpf: Track both a0 (RISC-V ABI) and a5 (BPF) return values
    7f6ef07f8ab5 riscv, bpf: Sign-extend return values
    82d52f300e48 xen-netback: use default TX queue size for vifs
    a0cde56933f2 mlxsw: fix mlxsw_sp2_nve_vxlan_learning_set() return type
    becf5c147198 ieee802154: ca8210: Fix a potential UAF in ca8210_probe
    105abd68ad8f ravb: Fix use-after-free issue in ravb_tx_timeout_work()
    b3b8f0ea74cf ravb: Fix up dma_free_coherent() call in ravb_remove()
    f776656844b1 devlink: Hold devlink lock on health reporter dump get
    6dd5b1a37a73 arm64: dts: mediatek: mt8195: Set DSU PMU status to fail
    340e23477773 arm64: dts: mediatek: fix t-phy unit name
    2463f7061ce6 can: sun4i_can: Only show Kconfig if ARCH_SUNXI is set
    ed545e8ccc85 can: isotp: isotp_sendmsg(): fix TX state detection and wait behavior
    96c8f1141055 net: dsa: qca8k: fix potential MDIO bus conflict when accessing internal PHYs via management frames
    9515695b6a9d net: dsa: qca8k: fix regmap bulk read/write methods on big endian systems
    c2d7c79898b4 phy: lynx-28g: serialize concurrent phy_set_mode_ext() calls to shared registers
    1c68986b6950 phy: lynx-28g: lock PHY while performing CDR lock workaround
    3dea2f73f171 phy: lynx-28g: cancel the CDR check work item on the remove path
    ca98df1efda0 drm/msm/dpu: fail dpu_plane_atomic_check() based on mdp clk limits
    91f31c14f299 drm/msm/dp: Add newlines to debug printks
    4c90ae0ef321 drm/msm/dpu: change _dpu_plane_calc_bw() to use u64 to avoid overflow
    06b722ee3141 drm/msm/dsi: fix irq_of_parse_and_map() error checking
    66b54db0e8a4 drm/msm/dsi: skip the wait for video mode done if not applicable
    b945326b569f drm/msm/dp: do not reinitialize phy unless retry during link training
    098c06b6903c pinctrl: starfive: jh7110: Fix failure to set irq after CONFIG_PM is enabled
    c9d7cac0fd27 pinctrl: nuvoton: wpcm450: fix out of bounds write
    44ec7bd0bd83 ALSA: hda/realtek - ALC287 merge RTK codec with CS CS35L41 AMP
    4654dd54a0fa ALSA: hda/realtek - ALC287 I2S speaker platform support
    92e54a0648dd ALSA: hda/realtek: Add quirk for mute LEDs on HP ENVY x360 15-eu0xxx
    b94e563ae542 ALSA: hda/realtek: Add quirk for HP Victus 16-d1xxx to enable mute LED
    8cdbfcefbb37 ASoC: Intel: soc-acpi: Add entry for sof_es8336 in MTL match table.
    a2511b24670a ASoC: Intel: sof_sdw: add support for SKU 0B14
    3aa5bd4b8a2e ASoC: fsl_sai: Don't disable bitclock for i.MX8MP
    0cee8c73ea35 ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in MTL match table
    934c889a945b ASoC: Intel: soc-acpi: fix Dell SKU 0B34
    838cf77c7449 ASoC: simple-card-utils: fixup simple_util_startup() error handling
    ba1e7575a0bb ASoC: SOF: amd: fix for firmware reload failure after playback
    8380e411ab73 ALSA: hda/realtek: Change model for Intel RVP board
    9da0985b9f57 ALSA: hda: cs35l41: Cleanup and fix double free in firmware request
    235805a7a788 ALSA: usb-audio: Fix microphone sound on Nexigo webcam.
    f64401dec39c ALSA: usb-audio: Fix microphone sound on Opencomm2 Headset
    8a8ca58b89d5 KEYS: trusted: Remove redundant static calls usage
    b50b1d7e76aa irqchip: renesas-rzg2l: Fix logic to clear TINT interrupt source
    380aa2dfb419 dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Update description for '#interrupt-cells' property
    862e2b015bbd arm64: dts: qcom: sm8150: extend the size of the PDC resource
    2f89f1515e13 net: prevent address rewrite in kernel_bind()
    bbbf096ea227 ata: libata-scsi: Disable scsi device manage_system_start_stop
    567558b4350e ASoC: hdmi-codec: Fix broken channel map reporting
    a70aec77d89b ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
    59073dfbc666 dm crypt: Fix reqsize in crypt_iv_eboiv_gen
    2a1ddddba654 quota: Fix slow quotaoff
    f7b2c7d9831a HID: logitech-hidpp: Fix kernel crash on receiver USB disconnect
    705c1eb72b74 ata: pata_parport: implement set_devctl
    cbb170a68ca4 ata: pata_parport: fix pata_parport_devchk
    e958cc021262 scsi: Do not rescan devices with a suspended queue
    4e76d4585daf drm/amd/display: apply edge-case DISPCLK WDIVIDER changes to master OTG pipes only
    f4b4b7448ccc drm/amd/display: implement pipe type definition and adding accessors
    50f84c0b1e2c media: dt-bindings: imx7-csi: Make power-domains not required for imx8mq
    fe76d3e58a81 platform/x86: hp-wmi:: Mark driver struct with __refdata to prevent section mismatch warning
    c8647e25346e drm/amdgpu: Fix a memory leak
    fdae43a5b6ce cpuidle, ACPI: Evaluate LPI arch_flags for broadcast timer
    1d61ce0a321f drm/i915: Register engines early to avoid type confusion
    c6e3023579de platform/x86: think-lmi: Fix reference leak
    1cd61412f98d perf/arm-cmn: Fix the unhandled overflow status of counter 4 to 7
    7e879676635c RDMA/cxgb4: Check skb value for failure to allocate
    9dcc8f4dbe14 net: stmmac: remove unneeded stmmac_poll_controller

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.5.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.5.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index 598280c5b6..edd6cd67fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2aa14dbb8520e59358778a80b32d7ccf6dd6c2ac"
-SRCREV_meta ?= "9af846da534077c91e3c42242fceba7aef8dd784"
+SRCREV_machine ?= "6e643d0d0344bba195b8c8c5532de9b77ae5a9b4"
+SRCREV_meta ?= "1920717e6c53d0bdd0ebb6aa943657854c44b5db"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.5.7"
+LINUX_VERSION ?= "6.5.8"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index b047ab340b..e8e7de57a4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.5.inc
 
-LINUX_VERSION ?= "6.5.7"
+LINUX_VERSION ?= "6.5.8"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "dfe7f47645429e162819c3d5690d8f5052f5b5a3"
-SRCREV_meta ?= "9af846da534077c91e3c42242fceba7aef8dd784"
+SRCREV_machine ?= "e36ee0929b3072f10e3749279ca498bfaee2454d"
+SRCREV_meta ?= "1920717e6c53d0bdd0ebb6aa943657854c44b5db"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index 516605c587..f0f3706784 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.5/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.5/standard/base"
 KBRANCH:qemumips64 ?= "v6.5/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "04942abac8568705f1fae34066db171b6e2669bd"
-SRCREV_machine:qemuarm64 ?= "ea4b620f18f882b3d882a53ffa33d8125ab27c83"
-SRCREV_machine:qemuloongarch64 ?= "14f83e40930806c3f5c61988e69a3ca1820a1b8f"
-SRCREV_machine:qemumips ?= "3348b580e3c47da56ce97a8297a574c2e37bc410"
-SRCREV_machine:qemuppc ?= "2fd47e07960edcd21455548ac6a25b19babe5c10"
-SRCREV_machine:qemuriscv64 ?= "14f83e40930806c3f5c61988e69a3ca1820a1b8f"
-SRCREV_machine:qemuriscv32 ?= "14f83e40930806c3f5c61988e69a3ca1820a1b8f"
-SRCREV_machine:qemux86 ?= "14f83e40930806c3f5c61988e69a3ca1820a1b8f"
-SRCREV_machine:qemux86-64 ?= "14f83e40930806c3f5c61988e69a3ca1820a1b8f"
-SRCREV_machine:qemumips64 ?= "6706327d870a0f246df8ed20c6a7f51ef46db1d6"
-SRCREV_machine ?= "14f83e40930806c3f5c61988e69a3ca1820a1b8f"
-SRCREV_meta ?= "9af846da534077c91e3c42242fceba7aef8dd784"
+SRCREV_machine:qemuarm ?= "38c4fee81a4d2da3be10690f5b78151e0bd544ac"
+SRCREV_machine:qemuarm64 ?= "7358f19647fcab467f6d00d9a24aec8e99f8cd00"
+SRCREV_machine:qemuloongarch64 ?= "8503729f1f61e7464270af24a6a9e10460158d4e"
+SRCREV_machine:qemumips ?= "5b03adb9d873c62991c87fed8a186bbd8d65987c"
+SRCREV_machine:qemuppc ?= "7c2b15eb10d4337712627cd70d668184bfd0d177"
+SRCREV_machine:qemuriscv64 ?= "8503729f1f61e7464270af24a6a9e10460158d4e"
+SRCREV_machine:qemuriscv32 ?= "8503729f1f61e7464270af24a6a9e10460158d4e"
+SRCREV_machine:qemux86 ?= "8503729f1f61e7464270af24a6a9e10460158d4e"
+SRCREV_machine:qemux86-64 ?= "8503729f1f61e7464270af24a6a9e10460158d4e"
+SRCREV_machine:qemumips64 ?= "ce7978769497891f4d4a7c0b310515febd208b6d"
+SRCREV_machine ?= "8503729f1f61e7464270af24a6a9e10460158d4e"
+SRCREV_meta ?= "1920717e6c53d0bdd0ebb6aa943657854c44b5db"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "121c6addffd71815cbd333baf409be682e2e148f"
+SRCREV_machine:class-devupstream ?= "8bbe7c640d76724e9cfd8aa130b8d36ad6db77a9"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.5/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.5.7"
+LINUX_VERSION ?= "6.5.8"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


