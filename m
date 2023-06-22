Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 498DFEB64D7
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 02:36:43 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.1223.1687401394843906662
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 19:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=AisaXCAf;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-668730696a4so2673930b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jun 2023 19:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687401394; x=1689993394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwFw+TReN+BV7Ru7VDShjj1o7UbYemz+bNMCT7oQgmo=;
        b=AisaXCAfIgcm/TxnXEYZhXQ6Ky5Xcwk+G25of0ui1Fp7rdewKGfKeOuHW8vRbg67A/
         OiEsQ1Vy1yTm+b8KzboV/Vn1O+Mxx04Koc7XMWU976qQut5opusWU+E1GCajqvmV61oH
         7PIQ/UgqF1ykroLAGJbi34/GPB4Xj1GYDRYojAvWd3zMBAbfJdGCFuwFl8c/DbSKtgDi
         7Wtxl6ZQVOJiki786V4fE+fyjvCEvAy1Wled17dzrqnD7/uAaaAxz9S4gaUfSW1/bMNY
         RTOjS4JkTqbKrmN5co9zJvjpSJDtD1+baxXUUGjBo+b5jEN7Hz1/EOt9rPWVJa/W3uXN
         CbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687401394; x=1689993394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwFw+TReN+BV7Ru7VDShjj1o7UbYemz+bNMCT7oQgmo=;
        b=esLuiWFDmnmiRlxVdIMU3AGXuNyxOTTXkE9M6AkViXcRxlDv+k9oITIiR+X1j/ZFkv
         me/PVAt+OiDZaZk/sZSdSxi32/P2jCioyjXYHtWNt+ZGYwbp1YVcgpd9fdxOGF2KqEvt
         iu/r+/LeXyEHiX++MexajBrKrcivfKvU3Ioo6EDqnVsY+FFHrOw/RIU5woTkFYQ62AbG
         cz0WK+MRdWLl1QHFbbsiMNNsrtUCTBBpB9dzyxFt675aMlGpK9Z2/4RGSJcENQr5KSGn
         mSordNOKbfX8g73BxXqjw+Z+S6+qmSmk99zASqiNvLM/UWlOYNHQyBtxgjNkMbe1qRup
         uW/A==
X-Gm-Message-State: AC+VfDxBVAge7qLhl0pkUrTyGSRtRHnwgthXBGGqTz46dDnrky192S+p
	jd32PaRy4sn7uM31fgybL3CNvIgXZ1cYAQdlSx4=
X-Google-Smtp-Source: ACHHUZ6Cf0u/RiWIkBeZfi6F64bDxziy0G0p6Ru1ipF1oR2Acp0+YmMQFiixwTns6U/3Os7f2UXNzw==
X-Received: by 2002:a05:6a20:ae12:b0:123:8e58:b527 with SMTP id dp18-20020a056a20ae1200b001238e58b527mr1442729pzb.44.1687401393303;
        Wed, 21 Jun 2023 19:36:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001b679ec20f2sm4143691plb.31.2023.06.21.19.36.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 19:36:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 15/23] linux-yocto/6.1: update to v6.1.29
Date: Wed, 21 Jun 2023 16:35:47 -1000
Message-Id: <65f144af7b20c6331a2fda26d047f7fa7258b093.1687401182.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687401182.git.steve@sakoman.com>
References: <cover.1687401182.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 02:36:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183215

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    fa74641fb6b9 Linux 6.1.29
    49f63bd0625a drm/amd/display: Fix hang when skipping modeset
    7f6738e003b3 spi: fsl-cpm: Use 16 bit mode for large transfers with even size
    441fa642995a spi: fsl-spi: Re-organise transfer bits_per_word adaptation
    76ce32682635 x86: fix clear_user_rep_good() exception handling annotation
    4ae066699dc0 x86/amd_nb: Add PCI ID for family 19h model 78h
    514728ffc05b f2fs: inode: fix to do sanity check on extent cache correctly
    85eb8b61dd4c f2fs: fix to do sanity check on extent cache correctly
    18ecffd03626 drm/dsc: fix DP_DSC_MAX_BPP_DELTA_* macro values
    c5fa4eedddd1 ext4: fix invalid free tracking in ext4_xattr_move_to_block()
    d87a4e4094c9 ext4: remove a BUG_ON in ext4_mb_release_group_pa()
    19fb73b8eaef ext4: fix lockdep warning when enabling MMP
    6e7a97628f27 ext4: bail out of ext4_xattr_ibody_get() fails for any reason
    1d2caddbeeee ext4: add bounds checking in get_max_inline_xattr_value_size()
    665cc3ba5033 ext4: fix deadlock when converting an inline directory in nojournal mode
    f68876aeef96 ext4: improve error handling from ext4_dirhash()
    25c9fca7b71c ext4: improve error recovery code paths in __ext4_remount()
    748e4bb27d2e ext4: check iomap type only if ext4_iomap_begin() does not fail
    b006e2228503 ext4: fix data races when using cached status extents
    1fffe4750500 ext4: avoid a potential slab-out-of-bounds in ext4_group_desc_csum
    dba62fa84a8e ext4: fix WARNING in mb_find_extent
    1b9c92432fdf locking/rwsem: Add __always_inline annotation to __down_read_common() and inlined callers
    98643c991057 drm/dsc: fix drm_edp_dsc_sink_output_bpp() DPCD high byte usage
    f95a60099dfd drm: Add missing DP DSC extended capability definitions.
    4aba9ab6a007 ksmbd: fix racy issue from smb2 close and logoff with multichannel
    502cf9709036 ksmbd: block asynchronous requests when making a delay on session setup
    1fc8a2b14ef5 ksmbd: destroy expired sessions
    f623f627ad2b ksmbd: fix racy issue from session setup and logoff
    91bbf9cb2387 ksmbd: Implements sess->ksmbd_chann_list as xarray
    3db734e4d95a drm/amd/display: Change default Z8 watermark values
    a009acf68717 drm/amd/display: Update Z8 SR exit/enter latencies
    e22ef1561085 drm/amd/display: Update Z8 watermarks for DCN314
    cf49b2ff253f ASoC: codecs: wcd938x: fix accessing regmap on unattached devices
    400950f66a8a ASoC: codecs: constify static sdw_slave_ops struct
    5279ab199cbd ASoC: rt1318: Add RT1318 SDCA vendor-specific driver
    1d383f9d6527 drm/amd/display: Lowering min Z8 residency time
    e6332695d484 drm/amd/display: Update minimum stutter residency for DCN314 Z8
    25f603624246 drm/amd/display: Add minimum Z8 residency debug option
    97b3d8eed097 drm/amd/display: Fix Z8 support configurations
    182251340884 drm/amd/display: Add debug option to skip PSR CRTC disable
    bcde2c877993 drm/amd/display: Add Z8 allow states to z-state support list
    83468820168a drm/amd/display: Refactor eDP PSR codes
    74a03d3c8d89 drm/i915: Check pipe source size when using skl+ scalers
    549ce5199d99 drm/i915/mtl: update scaler source and destination limits for MTL
    20a1064a7598 wifi: rtw88: rtw8821c: Fix rfe_option field width
    6578ae84e9ad irqchip/loongson-eiointc: Fix registration of syscore_ops
    fa29d577e2fc irqchip/loongson-eiointc: Fix incorrect use of acpi_get_vec_parent
    9e7f788dd74a irqchip/loongarch: Adjust acpi_cascade_irqdomain_init() and sub-routines
    c5111be87376 drm/msm: fix missing wq allocation error handling
    46062a1c0a01 drm/msm: Hangcheck progress detection
    a7fdb37d93bc drm/msm/adreno: Simplify read64/write64 helpers
    cba285695872 f2fs: factor out victim_entry usage from general rb_tree use
    4377b1d3b19e f2fs: allocate the extent_cache by default
    33112a0a17ef f2fs: refactor extent_cache to support for read and more
    3af09dee7f9b f2fs: remove unnecessary __init_extent_tree
    91b1554e66bc f2fs: move internal functions into extent_cache.c
    155ff41cf28c f2fs: specify extent cache for read explicitly
    77d2651cc8b5 drm/msm/adreno: adreno_gpu: Use suspend() instead of idle() on load error
    b2bd08be1a64 fs/ntfs3: Refactoring of various minor issues
    fb98336e23c1 HID: wacom: insert timestamp to packed Bluetooth (BT) events
    fb2f0c00048b HID: wacom: Set a default resolution for older tablets
    7a0731130425 drm/amd: Use `amdgpu_ucode_*` helpers for MES
    a3e3a640d4fd drm/amd: Add a new helper for loading/validating microcode
    3e1fa150e798 drm/amd: Load MES microcode during early_init
    369b89184222 drm/amdgpu: remove deprecated MES version vars
    506da05a5e0f drm/amd/pm: avoid potential UBSAN issue on legacy asics
    2a179117a3b2 drm/amdgpu: disable sdma ecc irq only when sdma RAS is enabled in suspend
    17a69415679c drm/amd/pm: parse pp_handle under appropriate conditions
    348dcdf102a4 drm/amd/display: Enforce 60us prefetch for 200Mhz DCFCLK modes
    7a8248317b32 drm/amdgpu: Fix vram recover doesn't work after whole GPU reset (v2)
    6197fb331a6e drm/amdgpu: change gfx 11.0.4 external_id range
    28c2e072fa13 drm/amdgpu/jpeg: Remove harvest checking for JPEG3
    f661ad53658a drm/amdgpu/gfx: disable gfx9 cp_ecc_error_irq only when enabling legacy gfx ras
    02e6cb9b3aef drm/amdgpu: fix amdgpu_irq_put call trace in gmc_v11_0_hw_fini
    59cb2d46e177 drm/amdgpu: fix an amdgpu_irq_put() issue in gmc_v9_0_hw_fini()
    59e2439111ac drm/amdgpu: fix amdgpu_irq_put call trace in gmc_v10_0_hw_fini
    f2e43c98042c drm/amd/display: fix flickering caused by S/G mode
    4c1e747ca61c drm/amd/display: filter out invalid bits in pipe_fuses
    c2b2641ecb9a drm/amd/display: Fix 4to1 MPC black screen with DPP RCO
    cc9942840afa drm/amd/display: Add NULL plane_state check for cursor disable logic
    bfe56245f4f1 drm/panel: otm8009a: Set backlight parent to panel device
    2e51d7c09d1f irqchip/loongson-eiointc: Fix returned value on parsing MADT
    84c64fb57887 irqchip/loongson-pch-pic: Fix pch_pic_acpi_init calling
    8a0b544b7cae f2fs: fix potential corruption when moving a directory
    424f8cdc0ad2 f2fs: fix null pointer panic in tracepoint in __replace_atomic_write_block
    aa0f98c5d196 drm/i915/dsi: Use unconditional msleep() instead of intel_dsi_msleep()
    6e1476225ec0 drm/msm: fix workqueue leak on bind errors
    544711591a67 drm/msm: fix vram leak on bind errors
    0fad173f9cf2 drm/msm: fix drm device leak on bind errors
    dd8ce825b165 drm/msm: fix NULL-deref on irq uninstall
    16e0e6fb4511 drm/msm: fix NULL-deref on snapshot tear down
    5b6b81decdf0 drm/i915/color: Fix typo for Plane CSC indexes
    2b01534c8fa2 drm/bridge: lt8912b: Fix DSI Video Mode
    47bfe1280456 drm/msm/adreno: fix runtime PM imbalance at gpu load
    3d0fdfefb384 ARM: dts: aspeed: romed8hm3: Fix GPIO polarity of system-fault LED
    f327c7443610 ARM: dts: s5pv210: correct MIPI CSIS clock name
    5503ea70de6c ARM: dts: exynos: fix WM8960 clock name in Itop Elite
    6efe88c34f5f ARM: dts: aspeed: asrock: Correct firmware flash SPI clocks
    a64910ba868c sysctl: clarify register_sysctl_init() base directory order
    c3c70209a991 remoteproc: rcar_rproc: Call of_node_put() on iteration error
    948f81dac388 remoteproc: imx_rproc: Call of_node_put() on iteration error
    fe3497c3bfcb remoteproc: imx_dsp_rproc: Call of_node_put() on iteration error
    8a0fc842af1c remoteproc: st: Call of_node_put() on iteration error
    0d6b66657c24 remoteproc: stm32: Call of_node_put() on iteration error
    fde64a409bee proc_sysctl: enhance documentation
    f4708645c144 proc_sysctl: update docs for __register_sysctl_table()
    c93185ffd996 sh: nmi_debug: fix return value of __setup handler
    2ebd0064352e sh: init: use OF_EARLY_FLATTREE for early init
    ab2221dc3c76 sh: mcount.S: fix build error when PRINTK is not enabled
    fdac282b3c17 sh: math-emu: fix macro redefined warning
    6d103a576522 SMB3: force unmount was failing to close deferred close files
    bb0091a5c97a smb3: fix problem remounting a share after shutdown
    145f54ea336b inotify: Avoid reporting event with invalid wd
    d759abeb273c platform/x86: thinkpad_acpi: Add profile force ability
    66d4f7f327e4 platform/x86: touchscreen_dmi: Add info for the Dexp Ursus KX210i
    e614c1de9e8d platform/x86: thinkpad_acpi: Fix platform profiles on T490
    a02d29de79a4 platform/x86: touchscreen_dmi: Add upside-down quirk for GDIX1002 ts on the Juno Tablet
    61549b7414b6 platform/x86/intel-uncore-freq: Return error on write frequency
    b886ad6b6bfb cifs: release leases for deferred close handles when freezing
    187f89cff775 cifs: fix pcchunk length type in smb2_copychunk_range
    c5544c95ad3d btrfs: zoned: fix full zone super block reading on ZNS
    4def3a0a8522 btrfs: zoned: zone finish data relocation BG with last IO
    1e8de3223bd2 btrfs: fix space cache inconsistency after error loading it from disk
    1689eabbc3d0 btrfs: print-tree: parent bytenr must be aligned to sector size
    83ae0282f17d btrfs: make clear_cache mount option to rebuild FST without disabling it
    dd5a21941f51 btrfs: zero the buffer before marking it dirty in btrfs_redirty_list_add
    15e877e5923e btrfs: don't free qgroup space unless specified
    44c52544b271 btrfs: fix encoded write i_size corruption with no-holes
    17eaeee4c5f2 btrfs: fix assertion of exclop condition when starting balance
    0a99cd08e236 btrfs: properly reject clear_cache and v1 cache for block-group-tree
    8583cc10aad7 btrfs: zoned: fix wrong use of bitops API in btrfs_ensure_empty_zones
    bcd7aa2963d3 btrfs: fix btrfs_prev_leaf() to not return the same key twice
    000322b29c01 x86/retbleed: Fix return thunk alignment
    2feac714c681 RISC-V: fix taking the text_mutex twice during sifive errata patching
    0fad198fffda RISC-V: take text_mutex during alternative patching
    13a0e212ddef perf stat: Separate bperf from bpf_profiler
    602603baae5f perf tracepoint: Fix memory leak in is_valid_tracepoint()
    3fb0d061dd0b perf symbols: Fix return incorrect build_id size in elf_read_build_id()
    2dd641d78d44 crypto: engine - fix crypto_queue backlog handling
    14a2259317f9 crypto: engine - Use crypto_request_complete
    6ba620fc9164 crypto: api - Add scaffolding to change completion function signature
    1055eddce776 crypto: sun8i-ss - Fix a test in sun8i_ss_setup_ivs()
    267db6bff34b perf cs-etm: Fix timeless decode mode detection
    b6671b7172a7 perf map: Delete two variable initialisations before null pointer checks in sort__sym_from_cmp()
    d592598f4775 perf pmu: zfree() expects a pointer to a pointer to zero it after freeing its contents
    36a840a86278 perf vendor events power9: Remove UTF-8 characters from JSON files
    0dabe1ae74e9 perf ftrace: Make system wide the default target for latency subcommand
    44060612613c perf tests record_offcpu.sh: Fix redirection of stderr to stdin
    6d20672d52ef perf vendor events s390: Remove UTF-8 characters from JSON file
    b2b916996042 perf scripts intel-pt-events.py: Fix IPC output for Python 2
    f108cbc83641 perf record: Fix "read LOST count failed" msg with sample read
    2424b456c37d net: enetc: check the index of the SFI rather than the handle
    d86d42e4a9b6 virtio_net: suppress cpu stall when free_unused_bufs
    4a61d7965611 ice: block LAN in case of VF to VF offload
    2f80efc46b73 net: dsa: mt7530: fix network connectivity with multiple CPU ports
    9d46edd93aa4 net: dsa: mt7530: split-off common parts from mt7531_setup
    98fc75c172ba net: dsa: mt7530: fix corrupt frames using trgmii on 40 MHz XTAL MT7621
    c6fafaa6f20a KVM: s390: fix race in gmap_make_secure()
    4e875cf90d75 ALSA: caiaq: input: Add error handling for unsupported input methods in `snd_usb_caiaq_input_init`
    7887397338a5 drm/amdgpu: add a missing lock for AMDGPU_SCHED
    f2e8e338622b af_packet: Don't send zero-byte data in packet_sendmsg_spkt().
    0d02efe7f251 ionic: catch failure from devlink_alloc
    942a2a0184f7 ethtool: Fix uninitialized number of lanes
    a05e5634c158 ionic: remove noise from ethtool rxnfc error msg
    3cad35b62eaa octeontx2-vf: Detach LF resources on probe cleanup
    401d11f274a5 octeontx2-pf: Disable packet I/O for graceful exit
    d28f6ad8b1a0 octeontx2-af: Skip PFs if not enabled
    ac613d0bd244 octeontx2-af: Fix issues with NPC field hash extract
    ab0742bd5b43 octeontx2-af: Update/Fix NPC field hash extract feature
    2b84d24d3ad1 octeontx2-pf: Add additional checks while configuring ucast/bcast/mcast rules
    bd9234da97fd octeontx2-af: Allow mkex profile without DMAC and add L2M/L2B header extraction support
    14504aaa8b55 octeontx2-pf: Increase the size of dmac filter flows
    2376ca72b55c octeontx2-af: Fix depth of cam and mem table.
    1c98271e0c23 octeontx2-af: Fix start and end bit for scan config
    e92399f52744 octeontx2-af: Secure APR table update with the lock
    419cc2c50761 selftests: netfilter: fix libmnl pkg-config usage
    4b08cdd239e7 drm/i915/mtl: Add the missing CPU transcoder mask in intel_device_info
    2bb120405ad3 riscv: compat_syscall_table: Fixup compile warning
    40f8b3f5e679 rxrpc: Fix hard call timeout units
    ab14de49e44f sfc: Fix module EEPROM reporting for QSFP modules
    68b1614b3211 r8152: move setting r8153b_rx_agg_chg_indicate()
    2642d7c136cd r8152: fix the poor throughput for 2.5G devices
    fbdde7ef2564 r8152: fix flow control issue of RTL8156A
    e2efb94966e7 net/sched: act_mirred: Add carrier check
    3b3537d4a026 i2c: tegra: Fix PEC support for SMBUS block read
    ffa97b59526e RISC-V: mm: Enable huge page support to kernel_page_present() function
    1e8ad3e45b5d watchdog: dw_wdt: Fix the error handling path of dw_wdt_drv_probe()
    c36975a654d4 block: Skip destroyed blkg when restart in blkg_destroy_all()
    7c4c6e2a4075 writeback: fix call of incorrect macro
    5ac2914f67c8 net: dsa: mv88e6xxx: add mv88e6321 rsvd2cpu
    1f274d53165b net: ipv6: fix skb hash for some RST packets
    686c70131e93 selftests: srv6: make srv6_end_dt46_l3vpn_test more robust
    5a98019e96e1 sit: update dev->needed_headroom in ipip6_tunnel_bind_dev()
    55866fe3fded net/sched: cls_api: remove block_cb from driver_list before freeing
    7fa93e39fbb0 tcp: fix skb_copy_ubufs() vs BIG TCP
    449280afaa05 net/ncsi: clear Tx enable mode when handling a Config required AEN
    a78b922d1180 octeontx2-pf: mcs: Do not reset PN while updating secy
    fd59ec145595 octeontx2-pf: mcs: Fix shared counters logic
    a8ddb974f014 octeontx2-pf: mcs: Clear stats before freeing resource
    c52ebecd89ae octeontx2-pf: mcs: Match macsec ethertype along with DMAC
    a3dcc45eca01 octeontx2-pf: mcs: Fix NULL pointer dereferences
    9ff806d07025 octeontx2-af: mcs: Fix MCS block interrupt
    add6bdb8d603 octeontx2-af: mcs: Config parser to skip 8B header
    39b436f0acfb octeontx2-af: mcs: Write TCAM_DATA and TCAM_MASK registers at once
    06fdaf7711f3 octeonxt2-af: mcs: Fix per port bypass config
    192445017534 ixgbe: Fix panic during XDP_TX with > 64 CPUs
    80a791a19902 drm/amd/display: Update bounding box values for DCN321
    7bba2e5e096e drm/amd/display: Do not clear GPINT register when releasing DMUB from reset
    ccb0ad946adc drm/amd/display: Reset OUTBOX0 r/w pointer on DMUB reset
    bb13726625e7 drm/amd/display: Fixes for dcn32_clk_mgr implementation
    b7ae53dd0d29 drm/amd/display: Return error code on DSC atomic check failure
    374f7fa01ae5 drm/amd/display: Add missing WA and MCLK validation
    0b47019f544f drm/amd/display: Remove FPU guards from the DML folder
    3738a230831e scsi: qedi: Fix use after free bug in qedi_remove()
    e60e5d672248 ASoC: Intel: soc-acpi-byt: Fix "WM510205" match no longer working
    1193a36f58c6 KVM: x86/mmu: Refresh CR0.WP prior to checking for emulated permission faults
    71e848bac0a4 KVM: VMX: Make CR0.WP a guest owned bit
    27ec4cbc1d51 KVM: x86: Make use of kvm_read_cr*_bits() when testing bits
    956777b2538e KVM: x86: Do not unload MMU roots when only toggling CR0.WP with TDP enabled
    d20a0195b3fe KVM: x86/mmu: Avoid indirect call for get_cr3
    28d0f85aff34 drm/amd/display: Ext displays with dock can't recognized after resume
    d69d5e2a81df fs/ntfs3: Fix null-ptr-deref on inode->i_op in ntfs_lookup()
    93eb8dd4b4c1 mtd: spi-nor: spansion: Enable JFFS2 write buffer for Infineon s25hx SEMPER flash
    50f54a48f678 mailbox: zynqmp: Fix counts of child nodes
    e63a796b852f mailbox: zynq: Switch to flexible array to simplify code
    b12078b67a6d soc: qcom: llcc: Do not create EDAC platform device on SDM845
    bf9712195f5e qcom: llcc/edac: Support polling mode for ECC handling
    4fdb257b2a4c mtd: spi-nor: spansion: Enable JFFS2 write buffer for Infineon s28hx SEMPER flash
    8630dfcdab0d mtd: spi-nor: Add a RWW flag
    897a40dbcf1e mtd: spi-nor: add SFDP fixups for Quad Page Program
    de26d26f5519 mtd: spi-nor: spansion: Remove NO_SFDP_FLAGS from s28hs512t info
    b951d4924c50 KVM: x86/pmu: Disallow legacy LBRs if architectural LBRs are available
    189cdd8fe7c6 KVM: x86: Track supported PERF_CAPABILITIES in kvm_caps
    0457b6d04fb7 perf/x86/core: Zero @lbr instead of returning -1 in x86_perf_get_lbr() stub
    9239f895a854 crypto: ccp - Clear PSP interrupt status register before calling handler
    add662775df4 drm/vmwgfx: Fix Legacy Display Unit atomic drm support
    b3204cb3e0ad drm/vmwgfx: Remove explicit and broken vblank handling
    c613c951e686 usb: dwc3: gadget: Execute gadget stop after halting the controller
    065c3d4319c5 USB: dwc3: gadget: drop dead hibernation code

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7e1ecd91b71c3246599b22c9281404d3a9a7db01)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 9ed118189f..4fbbfb1367 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "085dd99c0bdc160daa3327cf4347d7850ae88e42"
-SRCREV_meta ?= "76f7fbdf330d6a4b2aaa98085546030d7aec4a61"
+SRCREV_machine ?= "8b754025611eb94967a5b03aeaabe629ab4d1f03"
+SRCREV_meta ?= "8ad7b7906e93fe0deed70d93632299c5dc937258"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.28"
+LINUX_VERSION ?= "6.1.29"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 8b90e6b7c2..3074420f4f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.28"
+LINUX_VERSION ?= "6.1.29"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "c5c0c7ccfe672491795b3c926f70171dc380ced7"
-SRCREV_meta ?= "76f7fbdf330d6a4b2aaa98085546030d7aec4a61"
+SRCREV_machine ?= "593e4f8f12aa24a3b24b0065b871441c9cc092bd"
+SRCREV_meta ?= "8ad7b7906e93fe0deed70d93632299c5dc937258"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index a6ec624a07..aa371a966e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "95289cb8222292127ee39078f54542395d839d64"
-SRCREV_machine:qemuarm64 ?= "c5c0c7ccfe672491795b3c926f70171dc380ced7"
-SRCREV_machine:qemuloongarch64 ?= "c5c0c7ccfe672491795b3c926f70171dc380ced7"
-SRCREV_machine:qemumips ?= "15aab7123b475365095665030ec81fd54fbc8041"
-SRCREV_machine:qemuppc ?= "c5c0c7ccfe672491795b3c926f70171dc380ced7"
-SRCREV_machine:qemuriscv64 ?= "c5c0c7ccfe672491795b3c926f70171dc380ced7"
-SRCREV_machine:qemuriscv32 ?= "c5c0c7ccfe672491795b3c926f70171dc380ced7"
-SRCREV_machine:qemux86 ?= "c5c0c7ccfe672491795b3c926f70171dc380ced7"
-SRCREV_machine:qemux86-64 ?= "c5c0c7ccfe672491795b3c926f70171dc380ced7"
-SRCREV_machine:qemumips64 ?= "da9ecfb67170876bff1ca1d5547d438cbcb70671"
-SRCREV_machine ?= "c5c0c7ccfe672491795b3c926f70171dc380ced7"
-SRCREV_meta ?= "76f7fbdf330d6a4b2aaa98085546030d7aec4a61"
+SRCREV_machine:qemuarm ?= "6980804856a73a2c52e94bc6121c3d9d5caaed42"
+SRCREV_machine:qemuarm64 ?= "593e4f8f12aa24a3b24b0065b871441c9cc092bd"
+SRCREV_machine:qemuloongarch64 ?= "593e4f8f12aa24a3b24b0065b871441c9cc092bd"
+SRCREV_machine:qemumips ?= "9c44910d8c8dbb994ffd0b92d89d0842e754f37f"
+SRCREV_machine:qemuppc ?= "593e4f8f12aa24a3b24b0065b871441c9cc092bd"
+SRCREV_machine:qemuriscv64 ?= "593e4f8f12aa24a3b24b0065b871441c9cc092bd"
+SRCREV_machine:qemuriscv32 ?= "593e4f8f12aa24a3b24b0065b871441c9cc092bd"
+SRCREV_machine:qemux86 ?= "593e4f8f12aa24a3b24b0065b871441c9cc092bd"
+SRCREV_machine:qemux86-64 ?= "593e4f8f12aa24a3b24b0065b871441c9cc092bd"
+SRCREV_machine:qemumips64 ?= "18710460737428d230d146df6c84b803cd52d878"
+SRCREV_machine ?= "593e4f8f12aa24a3b24b0065b871441c9cc092bd"
+SRCREV_meta ?= "8ad7b7906e93fe0deed70d93632299c5dc937258"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "bf4ad6fa4e5332e53913b073d0219319a4091619"
+SRCREV_machine:class-devupstream ?= "fa74641fb6b93a19ccb50579886ecc98320230f9"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.28"
+LINUX_VERSION ?= "6.1.29"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


