Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web09.252.1621289828547553061
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 15:17:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TUOgjvEh;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id i5so216972qkf.12
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 15:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XMO8gPhlgStFuD8gEJNenTsdJty3oHz/B1uVRBOiJTI=;
        b=TUOgjvEhz65+57T3WYg856L9slSH8PTJ2V05qN30eJgXUPAlv/CKCC1RvTZKdDU9hR
         MzJMF479UZALuG7SRwadmY9JJXwGFW6V9XZlCnVjDxY8QVD8JsDhWiWTssrAKIbtBySq
         P5m3iCL5S7eVSjl6jro7EE774YFBjJ8Wv1Tls6pGIw/AX+0gTLsbh6XwAYXBZxybtaNd
         z4MXG7nVTwA+licnEy0WR/MCEsKc4PPbJA8tYf4E0E0bwaXKfTqrPfQEzsBksBm+f0XA
         JX6CX6tbKrsTAyILT1jlfQgW34Qw0+AHiSa1SYHDENNOHurtzV4kwdlGGj+u39GBLVzg
         J4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XMO8gPhlgStFuD8gEJNenTsdJty3oHz/B1uVRBOiJTI=;
        b=pxtiCZ03YxlDE9nX3FB0MSoE8pzo1Gvb7/jpaS/4ThPst8EJLbiI7nHH7c6GU/xKMh
         mblMCBzovzwDv404CD3HSO4EHCwOnlZtg6uqZUiKLikZ+lJfTpzGAHjykxdE/VnJ5pFb
         tQPGVUDERDIN+vxbV6QQ2rEozc1P0dcEjnujGhir7IJlJ55lwMaUbuiUq3Eqg8qYi8PN
         7Tbkciv+hqY/R4P1cqeTLZQFVuMFHqm5joq4Nnf7NsXiJ+xkybxgox3IoLtkSsS+VyFe
         rdDJ54298aSVS5Cgai2thizqc1vOdsSlY8CoNcyOIoH5M6rdFDyp31HCIulddzx3kS6U
         qrLw==
X-Gm-Message-State: AOAM530rNSvvVhZNoEJTW0OUVY3FqBKslT40514cuaCD1EqWOR80X2rC
	ZjeNbHYfiNkpYOa25NoWLSA=
X-Google-Smtp-Source: ABdhPJzfgKT27M1964/fJEp7zArZBaIrheRO5oy/FyAzv1od/TtN3G1Tum97BWAjx45V62IBP431sw==
X-Received: by 2002:a37:e216:: with SMTP id g22mr2191482qki.254.1621289827501;
        Mon, 17 May 2021 15:17:07 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id y10sm9789558qtm.17.2021.05.17.15.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 15:17:07 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] linux-yocto/5.10: update to v5.10.36
Date: Mon, 17 May 2021 18:16:56 -0400
Message-Id: <2daaa87ef4bce77b9b3061556b2a12a06611214b.1621275692.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1621275692.git.bruce.ashfield@gmail.com>
References: <cover.1621275692.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    72bb632d15f2 Linux 5.10.36
    14b2801ccd9b thermal/core/fair share: Lock the thermal zone while looping over instances
    c24a20912eef thermal/drivers/cpufreq_cooling: Fix slab OOB issue
    051dd0681ce1 lib/vsprintf.c: remove leftover 'f' and 'F' cases from bstr_printf()
    1cb02dc76f4c dm rq: fix double free of blk_mq_tag_set in dev remove after table load fails
    06141465e372 dm integrity: fix missing goto in bitmap_flush_interval error handling
    df893916b330 dm space map common: fix division bug in sm_ll_find_free_block()
    fcf763a80e0e dm persistent data: packed struct should have an aligned() attribute too
    a33614d52e97 tracing: Restructure trace_clock_global() to never block
    9e40ef5391df tracing: Map all PIDs to command lines
    ea6803ff2cd1 tools/power turbostat: Fix offset overflow issue in index converting
    b84c57762cef rsi: Use resume_noirq for SDIO
    b1c953dc853a tty: fix memory leak in vc_deallocate
    25e9c2c11735 usb: dwc2: Fix session request interrupt handler
    fce7bbcd07d5 usb: dwc3: core: Do core softreset when switch mode
    b624b32584ac usb: dwc3: gadget: Fix START_TRANSFER link state check
    f9ddfaa9703c usb: dwc3: gadget: Remove FS bInterval_m1 limitation
    8df75d1296d0 usb: gadget/function/f_fs string table fix for multiple languages
    ba8ce683076e usb: gadget: Fix double free of device descriptor pointers
    f12c5cca65f7 usb: gadget: dummy_hcd: fix gpf in gadget_setup
    678e76bccee4 media: venus: hfi_parser: Don't initialize parser on v1
    5d0f6f5251a3 media: v4l2-ctrls: fix reference to freed memory
    4121def7df29 media: staging/intel-ipu3: Fix race condition during set_fmt
    c6b81b897f6f media: staging/intel-ipu3: Fix set_fmt error handling
    517f6f570566 media: staging/intel-ipu3: Fix memory leak in imu_fmt
    8acb13189dae media: dvb-usb: Fix memory leak at error in dvb_usb_device_init()
    a5e9ae5a22b0 media: dvb-usb: Fix use-after-free access
    43263fd43083 media: dvbdev: Fix memory leak in dvb_media_device_free()
    378a016271ba ext4: Fix occasional generic/418 failure
    133e83b5b3b3 ext4: allow the dax flag to be set and cleared on inline directories
    72447c925ea9 ext4: fix error return code in ext4_fc_perform_commit()
    bf4ba04f0161 ext4: fix ext4_error_err save negative errno into superblock
    12905cf9e5c4 ext4: fix error code in ext4_commit_super
    7e9298f4d139 ext4: do not set SB_ACTIVE in ext4_orphan_cleanup()
    098b257563b9 ext4: fix check to prevent false positive report of incorrect used inodes
    346190959f97 ext4: annotate data race in jbd2_journal_dirty_metadata()
    9aca313726cb ext4: annotate data race in start_this_handle()
    a27aad321751 kbuild: update config_data.gz only when the content of .config is changed
    3aec683ee79b x86/cpu: Initialize MSR_TSC_AUX if RDTSCP *or* RDPID is supported
    d19a456acaec futex: Do not apply time namespace adjustment on FUTEX_LOCK_PI
    2543329485e2 Revert 337f13046ff0 ("futex: Allow FUTEX_CLOCK_REALTIME with FUTEX_WAIT op")
    d35c4c959eb4 smb3: do not attempt multichannel to server which does not support it
    796b82637528 smb3: when mounting with multichannel include it in requested capabilities
    5781c9df77a3 jffs2: check the validity of dstlen in jffs2_zlib_compress()
    54708651bc1e Fix misc new gcc warnings
    f37b9c142e1c security: commoncap: fix -Wstringop-overread warning
    bf2b941d0a6f sfc: farch: fix TX queue lookup in TX event handling
    fb791572d674 sfc: farch: fix TX queue lookup in TX flush done handling
    11e3ff7e164a exfat: fix erroneous discard when clear cluster bit
    1c525c265668 fuse: fix write deadlock
    0cd2d2577a98 dm raid: fix inconclusive reshape layout on fast raid4/5/6 table reload sequences
    661061a45e32 md/raid1: properly indicate failure when ending a failed write request
    015cc7ad58d0 crypto: rng - fix crypto_rng_reset() refcounting when !CRYPTO_STATS
    0ba942cbf52b crypto: arm/curve25519 - Move '.fpu' after '.arch'
    c9adb76c712c tpm: vtpm_proxy: Avoid reading host log when using a virtual device
    60a01ecc9f68 tpm: efi: Use local variable for calculating final log size
    4a63b2438a93 intel_th: pci: Add Alder Lake-M support
    34ceafa62f49 powerpc: fix EDEADLOCK redefinition error in uapi/asm/errno.h
    0bdcaebb1225 powerpc/32: Fix boot failure with CONFIG_STACKPROTECTOR
    f2aa64979e11 powerpc/kexec_file: Use current CPU info while setting up FDT
    481fee8295ab powerpc/eeh: Fix EEH handling for hugepages in ioremap space.
    293c30ce25e0 powerpc/powernv: Enable HAIL (HV AIL) for ISA v3.1 processors
    643243e31868 jffs2: Hook up splice_write callback
    72c282b10951 jffs2: Fix kasan slab-out-of-bounds problem
    072f787e8798 Input: ili210x - add missing negation for touch indication on ili210x
    2fafe7d5047f NFSv4: Don't discard segments marked for return in _pnfs_return_layout()
    334165d9fb69 NFS: Don't discard pNFS layout segments that are marked for return
    96fa26b74cdc NFS: fs_context: validate UDP retrans to prevent shift out-of-bounds
    e0f2d86481ea ACPI: GTDT: Don't corrupt interrupt mappings on watchdow probe failure
    a1478374b0bd openvswitch: fix stack OOB read while fragmenting IPv4 packets
    4248f4649bf3 mlxsw: spectrum_mr: Update egress RIF list before route's action
    9aa4602237d5 f2fs: fix to avoid out-of-bounds memory access
    39624749c52d f2fs: fix error handling in f2fs_end_enable_verity()
    50b0c0c3385d ubifs: Only check replay with inode type to judge if inode linked
    5a876a46d7b7 kcsan, debugfs: Move debugfs file creation out of early init
    d19555ff225d virtiofs: fix memory leak in virtio_fs_probe()
    1b41d4e5aa75 fs: fix reporting supported extra file attributes for statx()
    dc4b67baba3b Makefile: Move -Wno-unused-but-set-variable out of GCC only block
    0f9055936668 arm64/vdso: Discard .note.gnu.property sections in vDSO
    1d852d6bb4d4 btrfs: fix race when picking most recent mod log operation for an old root
    b24f0e381036 tools/power/turbostat: Fix turbostat for AMD Zen CPUs
    d1ca3d2c4fd5 ALSA: hda/realtek: Add quirk for Intel Clevo PCx0Dx
    a9d0f7c14789 ALSA: hda/realtek: fix static noise on ALC285 Lenovo laptops
    3c8a599bc951 ALSA: hda/realtek - Headset Mic issue on HP platform
    871234a6ad4c ALSA: hda/realtek: fix mic boost on Intel NUC 8
    13ff604c79a0 ALSA: hda/realtek: GA503 use same quirks as GA401
    970fbbee55bc ALSA: hda/realtek: fix mute/micmute LEDs for HP ProBook 445 G7
    12fea3cb2277 ALSA: usb-audio: Add dB range mapping for Sennheiser Communications Headset PC 8
    ad7736cebf4d ALSA: usb-audio: Explicitly set up the clock selector
    cc427a507f29 ALSA: sb: Fix two use after free in snd_sb_qsound_build
    1ce8212e80f9 ALSA: hda/conexant: Re-order CX5066 quirk table entries
    9b7388931fbb ALSA: emu8000: Fix a use after free in snd_emu8000_create_mixer
    443467bd6240 power: supply: cpcap-battery: fix invalid usage of list cursor
    a15f68a5d55c sched,psi: Handle potential task count underflow bugs more gracefully
    a32a2d831de0 s390/archrandom: add parameter check for s390_arch_random_generate
    338a87230228 block/rnbd-clt: Fix missing a memory free when unloading the module
    ae7fe4794da2 sched,fair: Alternative sched_slice()
    94902ee2996a perf: Rework perf_event_exit_event()
    2c4de79e9a09 scsi: libfc: Fix a format specifier
    97a81d4051c3 mfd: arizona: Fix rumtime PM imbalance on error
    14c7e3f5bed5 mfd: da9063: Support SMBus and I2C mode
    d7ec1dab6be7 mfd: intel-m10-bmc: Fix the register access range
    c8fe9ef530e9 scsi: lpfc: Remove unsupported mbox PORT_CAPABILITIES logic
    cc42ea42e250 scsi: lpfc: Fix error handling for mailboxes completed in MBX_POLL mode
    1ac2b3720f61 scsi: lpfc: Fix crash when a REG_RPI mailbox fails triggering a LOGO response
    56488df9f4bc drm/amdgpu: fix NULL pointer dereference
    d721702f8a82 drm/amd/display: Try YCbCr420 color when YCbCr444 fails
    f26f33a40952 amdgpu: avoid incorrect %hu format string
    a98a90048853 drm/amdkfd: Fix cat debugfs hang_hws file causes system crash bug
    081cec78467f drm/amd/display: Fix UBSAN: shift-out-of-bounds warning
    cc6215d94de9 drm/amd/display: Fix debugfs link_settings entry
    bcefa89b3e48 drm/radeon/ttm: Fix memory leak userptr pages
    14637a8dfe4f drm/amdgpu/ttm: Fix memory leak userptr pages
    6e4ae9b0eb23 drm/msm/mdp5: Do not multiply vclk line count by 100
    79f701ec9efa drm/msm/mdp5: Configure PP_SYNC_HEIGHT to double the vtotal
    2f5f4cce496e sched/fair: Ignore percpu threads for imbalance pulls
    fded2096b153 media: gscpa/stv06xx: fix memory leak
    f8f2b7ebe03a media: dvb-usb: fix memory leak in dvb_usb_adapter_init
    1b61ad26af55 media: sun8i-di: Fix runtime PM imbalance in deinterlace_start_streaming
    810cf54025b7 media: platform: sti: Fix runtime PM imbalance in regs_show
    67a97525dd6e media: i2c: adv7842: fix possible use-after-free in adv7842_remove()
    c8e7e6e1780c media: i2c: tda1997: Fix possible use-after-free in tda1997x_remove()
    3f9e0eb06258 media: i2c: adv7511-v4l2: fix possible use-after-free in adv7511_remove()
    651ad9e04f75 media: adv7604: fix possible use-after-free in adv76xx_remove()
    8d3ae83d6344 media: tc358743: fix possible use-after-free in tc358743_remove()
    a931c5791b5e power: supply: s3c_adc_battery: fix possible use-after-free in s3c_adc_bat_remove()
    ccb098c053dc power: supply: generic-adc-battery: fix possible use-after-free in gab_remove()
    932329941ca8 clk: socfpga: arria10: Fix memory leak of socfpga_clk on error return
    573bbb6f80f1 drm/msm/dp: Fix incorrect NULL check kbot warnings in DP driver
    4066456bb2de media: vivid: update EDID
    6fef73a039da media: em28xx: fix memory leak
    ed7ab208cc2e scsi: scsi_dh_alua: Remove check for ASC 24h in alua_rtpg()
    486e974358e7 scsi: smartpqi: Add new PCI IDs
    c3187412d9c7 scsi: smartpqi: Correct request leakage during reset operations
    bc05560dd756 scsi: smartpqi: Use host-wide tag space
    dc655d743c2b power: supply: cpcap-charger: Add usleep to cpcap charger to avoid usb plug bounce
    a669817a3384 selftests/resctrl: Fix checking for < 0 for unsigned values
    726d3185b89a selftests/resctrl: Fix incorrect parsing of iMC counters
    19eaad1400ea selftests/resctrl: Use resctrl/info for feature detection
    0ccead50c386 selftests/resctrl: Fix missing options "-n" and "-p"
    cd29eef12771 selftests/resctrl: Clean up resctrl features check
    6ef95f0b80ec selftests/resctrl: Fix compilation issues for other global variables
    cf99daf7c3a2 selftests/resctrl: Fix compilation issues for global variables
    078d3d75dd4c selftests/resctrl: Enable gcc checks to detect buffer overflows
    9ec74da2ac4c nvmet: return proper error code from discovery ctrl
    7f9757005cf5 drm/komeda: Fix bit check to import to value of proper type
    5e8b58e27ea8 ata: ahci: Disable SXS for Hisilicon Kunpeng920
    c753c1a77e7a mmc: sdhci-brcmstb: Remove CQE quirk
    fdd04d1c8336 mmc: sdhci-pci: Add PCI IDs for Intel LKF
    79315ebff432 mmc: sdhci-esdhc-imx: validate pinctrl before use it
    47ac226199f0 scsi: qla2xxx: Fix use after free in bsg
    1d7935fd022d drm/vkms: fix misuse of WARN_ON
    57fa6a6a998c scsi: qla2xxx: Always check the return value of qla24xx_get_isp_stats()
    298778681c10 drm/amd/display: fix dml prefetch validation
    dd5d6042e5d2 drm/amd/display: DCHUB underflow counter increasing in some scenarios
    9cc76f29b9e5 drm/amd/display: Fix UBSAN warning for not a valid value for type '_Bool'
    729b92e68b8e drm/amd/pm: fix workload mismatch on vega10
    7cb855dfe5f0 drm/amdgpu : Fix asic reset regression issue introduce by 8f211fe8ac7c4f
    1874b0ef1426 drm/amdkfd: Fix UBSAN shift-out-of-bounds warning
    7b3eb98a3ef4 drm/amdgpu: mask the xgmi number of hops reported from psp to kfd
    61c1ddd29f87 backlight: qcom-wled: Fix FSC update issue for WLED5
    918a45b65365 backlight: qcom-wled: Use sink_addr for sync toggle
    983d10e59fb4 power: supply: Use IRQF_ONESHOT
    80ba39ec7cc9 media: gspca/sq905.c: fix uninitialized variable
    6a3edc1a5e17 media: media/saa7164: fix saa7164_encoder_register() memory leak bugs
    087c2bffb4e9 extcon: arizona: Fix various races on driver unbind
    b7d2e5097f18 extcon: arizona: Fix some issues when HPDET IRQ fires after the jack has been unplugged
    8ff0d8a0904b power: supply: bq27xxx: fix power_avg for newer ICs
    7bb783ec9e0e atomisp: don't let it go past pipes array
    12b4b2855024 media: imx: capture: Return -EPIPE from __capture_legacy_try_fmt()
    f3dd6c47c493 media: drivers: media: pci: sta2x11: fix Kconfig dependency on GPIOLIB
    b5261590f309 media: ite-cir: check for receive overflow
    3a2270dd3f09 scsi: target: pscsi: Fix warning in pscsi_complete_cmd()
    09a27d662006 kvfree_rcu: Use same set of GFP flags as does single-argument
    661af9371c32 sched/pelt: Fix task util_est update filtering
    b168fffa3821 drm/amdgpu: Fix some unload driver issues
    5b62053e762c scsi: lpfc: Fix pt2pt connection does not recover after LOGO
    7382825b068e scsi: lpfc: Fix incorrect dbde assignment when building target abts wqe
    b814402fdf37 drm/amd/display/dc/dce/dce_aux: Remove duplicate line causing 'field overwritten' issue
    500ec98998c2 drm/amdgpu/display: buffer INTERRUPT_LOW_IRQ_CONTEXT interrupt work
    bd9477319714 drm/amd/display: Don't optimize bandwidth before disabling planes
    6b2132f50d9f drm/amd/display: Check for DSC support instead of ASIC revision
    01e03a661872 drm/ast: fix memory leak when unload the driver
    100e35484682 drm/amd/display: changing sr exit latency
    2c518667f953 drm/ast: Fix invalid usage of AST_MAX_HWC_WIDTH in cursor atomic_check
    6f64be8f5211 drm/qxl: release shadow on shutdown
    423fb866b3fc drm/qxl: do not run release if qxl failed to init
    6228456ceb1a drm: Added orientation quirk for OneGX1 Pro
    9c60c881d662 btrfs: convert logic BUG_ON()'s in replace_path to ASSERT()'s
    f32b84d7c977 btrfs: do proper error handling in btrfs_update_reloc_root
    224c654a2eca btrfs: do proper error handling in create_reloc_root
    c5aa9ea54a00 spi: sync up initial chipselect state
    b82e8f0bb028 platform/x86: intel_pmc_core: Don't use global pmcdev in quirks
    5d60792d1292 crypto: omap-aes - Fix PM reference leak on omap-aes.c
    92894b185321 crypto: sa2ul - Fix PM reference leak in sa_ul_probe()
    4e7ae0cfaca9 crypto: stm32/cryp - Fix PM reference leak on stm32-cryp.c
    8a090d492f70 crypto: stm32/hash - Fix PM reference leak on stm32-hash.c
    836671775a6e crypto: sun8i-ce - Fix PM reference leak in sun8i_ce_probe()
    2264965f576f crypto: sun8i-ss - Fix PM reference leak when pm_runtime_get_sync() fails
    a16162a17417 phy: phy-twl4030-usb: Fix possible use-after-free in twl4030_usb_remove()
    df9105950755 intel_th: Consistency and off-by-one fix
    b549cc7c9ca2 tty: n_gsm: check error while registering tty devices
    8f7cdbbf61f9 usb: dwc3: gadget: Check for disabled LPM quirk
    2946f95356cc usb: core: hub: Fix PM reference leak in usb_port_resume()
    e82da9b21fed usb: musb: fix PM reference leak in musb_irq_work()
    015f3f25213e usb: gadget: tegra-xudc: Fix possible use-after-free in tegra_xudc_remove()
    0e73535a496c spi: qup: fix PM reference leak in spi_qup_remove()
    75e2b4621137 spi: omap-100k: Fix reference leak to master
    517e99f22842 spi: dln2: Fix reference leak to master
    4ddfac16b5c7 platform/x86: ISST: Account for increased timeout in some cases
    bc900a7ccdd4 tools/power/x86/intel-speed-select: Increase string size
    125b3590d1fb ARM: dts: at91: change the key code of the gpio key
    2ed4d587539e bus: mhi: core: Clear context for stopped channels from remove()
    3737cf191a80 xhci: fix potential array out of bounds with several interrupters
    98599e1045c2 xhci: check control context is valid before dereferencing it.
    2b195c32bccd xhci: check port array allocation was successful before dereferencing it
    b52b1b8c480c fpga: dfl: pci: add DID for D5005 PAC cards
    e22fd531518d usb: xhci-mtk: support quirk to disable usb2 lpm
    5c22421fb35f random: initialize ChaCha20 constants with correct endianness
    2d78ede60615 perf/arm_pmu_platform: Fix error handling
    167fecaa4311 perf/arm_pmu_platform: Use dev_err_probe() for IRQ errors
    64d579453bd6 soundwire: cadence: only prepare attached devices on clock stop
    9584ce366cc9 tee: optee: do not check memref size on return from Secure World
    e5da8b37ce34 arm64: dts: imx8mq-librem5-r3: Mark buck3 as always on
    187c001c492c soc/tegra: pmc: Fix completion of power-gate toggling
    bc24381f5768 efi/libstub: Add $(CLANG_FLAGS) to x86 flags
    8829b6ccf49f x86/boot: Add $(CLANG_FLAGS) to compressed KBUILD_CFLAGS
    fdc9c3cff9e2 x86/build: Propagate $(CLANG_FLAGS) to $(REALMODE_FLAGS)
    af79dc5ad974 ARM: dts: ux500: Fix up TVK R3 sensors
    3f571ae706da ARM: dts: BCM5301X: fix "reg" formatting in /memory node
    f38f972e14f1 kselftest/arm64: mte: Fix MTE feature detection
    d16749988d09 PCI: PM: Do not read power state in pci_enable_device_flags()
    d863389e9f2e ARM: tegra: acer-a500: Rename avdd to vdda of touchscreen node
    d9a1f62b03da kselftest/arm64: mte: Fix compilation with native compiler
    173ab4bb8cbf usb: xhci: Fix port minor revision
    45f879b29da7 usb: dwc3: gadget: Ignore EP queue requests during bus reset
    85eb84bd818f usb: gadget: f_uac1: validate input parameters
    f63390de9b43 usb: gadget: f_uac2: validate input parameters
    df7452f03b7f genirq/matrix: Prevent allocation counter corruption
    bde50f19ba24 crypto: hisilicon/sec - fixes a printing error
    6a6273a65fcd x86/sev: Do not require Hypervisor CPUID bit for SEV guests
    ba637773a9f9 usb: webcam: Invalid size of Processing Unit Descriptor
    930d586646cf usb: gadget: uvc: add bInterval checking for HS mode
    6202e708f303 crypto: qat - fix unmap invalid dma address
    92f333793a78 crypto: api - check for ERR pointers in crypto_destroy_tfm()
    298a44f38171 bus: mhi: core: Destroy SBL devices when moving to mission mode
    2e40d8cd3db5 spi: ath79: remove spi-master setup and cleanup assignment
    91629921cef9 spi: ath79: always call chipselect function
    40e02e167816 staging: wimax/i2400m: fix byte-order issue
    e160833c9fdf bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first
    6af796b4ac45 cpuidle: tegra: Fix C7 idling state on Tegra114
    6f85f0497274 fbdev: zero-fill colormap in fbcmap.c
    af830b27c34d posix-timers: Preserve return value in clock_adjtime32()
    a4794be7b00b btrfs: fix race between transaction aborts and fsyncs leading to use-after-free
    af835665ddc9 intel_th: pci: Add Rocket Lake CPU support
    97f30747b22c btrfs: fix metadata extent leak after failure to create subvolume
    0c48349a6d41 x86/build: Disable HIGHMEM64G selection for M486SX
    dba16ca6f347 btrfs: handle remount to no compress during compression
    5f2adf84624e smb2: fix use-after-free in smb2_ioctl_query_info()
    8a90058752e0 cifs: detect dead connections only when echoes are enabled.
    23d7b4a8f77a cifs: fix out-of-bound memory access when calling smb3_notify() at mount point
    aaa0faa5c28a cifs: Return correct error code from smb2_get_enc_key
    7be4db5c2b59 irqchip/gic-v3: Do not enable irqs when handling spurious interrups
    44faf03f56b8 mmc: core: Fix hanging on I/O during system suspend for removable cards
    886da99e8fc4 mmc: core: Set read only for SD cards with permanent write protect bit
    140f225218cd mmc: core: Do a power cycle when the CMD11 fails
    20d6f231f8f1 mmc: block: Issue a cache flush only when it's enabled
    b1fba87e60bc mmc: block: Update ext_csd.cache_ctrl if it was written
    cdc615acade4 mmc: sdhci-tegra: Add required callbacks to set/clear CQE_EN bit
    6c43290972ed mmc: sdhci-pci: Fix initialization of some SD cards for Intel BYT-based controllers
    01db7cb746f0 mmc: sdhci: Check for reset prior to DMA address unmap
    25ac6ce65f1a mmc: uniphier-sd: Fix a resource leak in the remove function
    83e9e22ba93a mmc: uniphier-sd: Fix an error handling path in uniphier_sd_probe()
    b7a1577a1a79 scsi: mpt3sas: Block PCI config access from userspace during reset
    702cdaa2c628 scsi: qla2xxx: Fix crash in qla2xxx_mqueuecommand()
    f1cbba5ea75b spi: spi-ti-qspi: Free DMA resources
    421f24114c64 spi: stm32-qspi: fix pm_runtime usage_count counter
    dbaf435ddf97 erofs: add unsupported inode i_format check
    34ec706bf0b7 mtd: physmap: physmap-bt1-rom: Fix unintentional stack access
    706e60c19237 mtd: rawnand: atmel: Update ecc_stats.corrected counter
    907452b3b6a6 mtd: spinand: core: add missing MODULE_DEVICE_TABLE()
    cb5305ac5bac Revert "mtd: spi-nor: macronix: Add support for mx25l51245g"
    2e41cc10660e mtd: spi-nor: core: Fix an issue of releasing resources during read/write
    4c44c136f2fa fs/epoll: restore waking from ep_done_scan()
    6b5aeb69bb9f ecryptfs: fix kernel panic with null dev_name
    3ad1fb97619b arm64: dts: mt8173: fix property typo of 'phys' in dsi node
    6c2f97f3887f arm64: dts: marvell: armada-37xx: add syscon compatible to NB clk node
    011b9e1c2a18 ARM: 9056/1: decompressor: fix BSS size calculation for LLVM ld.lld
    634684d79733 ftrace: Handle commands when closing set_ftrace_filter file
    d11fdbee28af ACPI: custom_method: fix a possible memory leak
    62dc2440ebb5 ACPI: custom_method: fix potential use-after-free issue
    58a762a7f3be tpm: acpi: Check eventlog signature before using it
    3b8b6399666a vhost-vdpa: fix vm_flags for virtqueue doorbell mapping
    026499a9c2e0 s390/zcrypt: fix zcard and zqueue hot-unplug memleak
    e534a4b139a8 s390/disassembler: increase ebpf disasm buffer size
    90402b6b45f3 dyndbg: fix parsing file query without a line-range suffix
    ed9cfd60c787 nitro_enclaves: Fix stale file descriptors on failed usercopy
    a1d2bd164c1c bus: mhi: core: Sanity check values from remote device before use
    bcb80329e815 bus: mhi: core: Clear configuration from channel context during reset
    542fd3e4fde6 bus: mhi: core: Fix check for syserr at power_up

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 424dc83e15..a5a2bb08ac 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "fd84ed4cd5f8671db5ff31c00712c607c379a924"
-SRCREV_meta ?= "6dbd5491f4b9592d6332fd8e1bcf29ab01901274"
+SRCREV_machine ?= "9aa05ff10d0110953bf3597b3c4ea90f74a78d85"
+SRCREV_meta ?= "009a0d9db0fb974aaafddfb2fe6ced4fd1f8bfc8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.35"
+LINUX_VERSION ?= "5.10.36"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index ea41d74add..1f85d972f7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.35"
+LINUX_VERSION ?= "5.10.36"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "9d4af32a2486acf5feb473b0d5656155cf80f115"
-SRCREV_machine ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
-SRCREV_meta ?= "6dbd5491f4b9592d6332fd8e1bcf29ab01901274"
+SRCREV_machine_qemuarm ?= "170e1fc536c98406fb1ad250af511a4bf401f8e2"
+SRCREV_machine ?= "2105ce2526ddd17827c23e89d6b4e9010261c08c"
+SRCREV_meta ?= "009a0d9db0fb974aaafddfb2fe6ced4fd1f8bfc8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 1200cba942..969f1a46d4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "f3a20db821a8802c1b3e71c0cccded36d89671b5"
-SRCREV_machine_qemuarm64 ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
-SRCREV_machine_qemumips ?= "c64120ac8b71098f6356a992f7e302caa75d4bae"
-SRCREV_machine_qemuppc ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
-SRCREV_machine_qemuriscv64 ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
-SRCREV_machine_qemuriscv32 ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
-SRCREV_machine_qemux86 ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
-SRCREV_machine_qemux86-64 ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
-SRCREV_machine_qemumips64 ?= "b9a0cc14b51ac1bc5f2bcdcc0f53f6913e877e20"
-SRCREV_machine ?= "ddac76981cb3a53de4f2feb2746661a02a6763bd"
-SRCREV_meta ?= "6dbd5491f4b9592d6332fd8e1bcf29ab01901274"
+SRCREV_machine_qemuarm ?= "0da8b6daad325e8c6ae957d9023e91186645a4cd"
+SRCREV_machine_qemuarm64 ?= "2105ce2526ddd17827c23e89d6b4e9010261c08c"
+SRCREV_machine_qemumips ?= "4b377a8a37f03f34fff1e1fcf49e31772e6fda08"
+SRCREV_machine_qemuppc ?= "2105ce2526ddd17827c23e89d6b4e9010261c08c"
+SRCREV_machine_qemuriscv64 ?= "2105ce2526ddd17827c23e89d6b4e9010261c08c"
+SRCREV_machine_qemuriscv32 ?= "2105ce2526ddd17827c23e89d6b4e9010261c08c"
+SRCREV_machine_qemux86 ?= "2105ce2526ddd17827c23e89d6b4e9010261c08c"
+SRCREV_machine_qemux86-64 ?= "2105ce2526ddd17827c23e89d6b4e9010261c08c"
+SRCREV_machine_qemumips64 ?= "df5eac625c02c6be577dbb1a7cc0472b71c704b4"
+SRCREV_machine ?= "2105ce2526ddd17827c23e89d6b4e9010261c08c"
+SRCREV_meta ?= "009a0d9db0fb974aaafddfb2fe6ced4fd1f8bfc8"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.35"
+LINUX_VERSION ?= "5.10.36"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

