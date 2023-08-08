Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BE6C04A6A
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 03:36:07 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.54147.1691465759658622211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 20:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gxP+SDnf;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-63cfd6e3835so29855906d6.3
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 20:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691465758; x=1692070558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=modWWD9cL2fVZmfq/8xUT8mSjOUZCl/KgD5FI/F8lM4=;
        b=gxP+SDnfab/lNyQW2zPGZHeG4KYAYP5d5WdZBuCOASsHf0seA4PQSb+/RMA4uxDTzw
         OC8vKuQsvnKMi1INqKyHh68CW/yjTfrGd3ZegZAcVRz2sBwB8mHFSuUhC6hzwep867+O
         vawtjFzTOpeRKrn/RnVvgMG/J7SkL0DBJJRMyL1AkN8f3E+HrsVnDfH1r6RR/33BWzQb
         vLzRuMe4vnRK+HovL4soP+q1HgP9E4leJNxv1bjhVzO0u8P0ExQgeJjoBqKjXNg2xdQK
         YzXCQy2MufCqplnC9MW6fgy6MSIYDHojykQ++HvpMdc3v+wKYsEVpV+/HQ+veadfkixH
         mqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691465758; x=1692070558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=modWWD9cL2fVZmfq/8xUT8mSjOUZCl/KgD5FI/F8lM4=;
        b=T4KsIWPYGiaZ+18QgrutVGb5hKrKmh3q7Paqf9DrKiG1+G3wBN3XigtXmfHxjmSe/M
         /KL5B3XnMbuMiG0cbsNr0ghOhDo/n8qE5KVC4MrsxDZ3Q6hVeNNwlczeplcRAoe3wIIo
         S+ann7+Yw1oEYH3QhcQaQWBnPoIqBlaJskdHvbuNP6MAeydETOLdS0vxdsAp9j4IiPqc
         SInLD1CTeABQWVVYZy7xW9r1TW0UD9+OxJvUPTUyGo+EzfyQTzAjx5EgljEobSwhS+I3
         z/IcJy8xdkZkixGepolFXLYL4S99rnfF+f+qoTrGobqJtgHrU/fL2jZG1bFGjmxnjb0a
         8yAw==
X-Gm-Message-State: AOJu0Yx9dg8EVj7XWtDtS7F/pP379ounufcV2yr7OuFEZJe7bbLunUEn
	6fnL1elA0HpxjgfK8jhpMmJ6DoFPjLJJCw==
X-Google-Smtp-Source: AGHT+IFJaqX8syq1tfqmPRp5lCu+haRT/x5RLj/9tDP5tQzle5S+pz95cgSc12cUdVpvrDaOgxwRGw==
X-Received: by 2002:a05:6214:9b0:b0:63c:eb21:206c with SMTP id du16-20020a05621409b000b0063ceb21206cmr10524950qvb.15.1691465758135;
        Mon, 07 Aug 2023 20:35:58 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g16-20020ae9e110000000b0076cb0ed2d7asm3033840qkm.24.2023.08.07.20.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 20:35:57 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto/6.4: update to v6.4.6
Date: Mon,  7 Aug 2023 23:35:48 -0400
Message-Id: <5f4539cfff6b0da8f642203d8e5e45c3682907d4.1691465503.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691465503.git.bruce.ashfield@gmail.com>
References: <cover.1691465503.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 03:36:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185632

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    79562f63d621 Linux 6.4.6
    9b8bb5c4e256 x86/cpu/amd: Add a Zenbleed fix
    fee9e8639658 x86/cpu/amd: Move the errata checking functionality up
    bcecfeef53d4 Linux 6.4.5
    4db0b9e4ab8a net/ncsi: change from ndo_set_mac_address to dev_set_mac_address
    3bcc68a429c1 net/ncsi: make one oem_gma function for all mfr id
    328f520540db drm/atomic: Fix potential use-after-free in nonblocking commits
    c1748049c097 Revert "drm/amd: Disable PSR-SU on Parade 0803 TCON"
    9ccdf2eccac7 MIPS: kvm: Fix build error with KVM_MIPS_DEBUG_COP0_COUNTERS enabled
    38f16f0c2c22 net: dsa: ocelot: unlock on error in vsc9959_qos_port_tas_set()
    f425c44c9af7 scsi: qla2xxx: Fix end of loop test
    92529387a006 scsi: qla2xxx: Remove unused nvme_ls_waitq wait queue
    22b1d7c8bb59 scsi: qla2xxx: Pointer may be dereferenced
    824ff8d1c89a scsi: qla2xxx: Correct the index of array
    ced5460eae77 scsi: qla2xxx: Check valid rport returned by fc_bsg_to_rport()
    af7affc0f6b8 scsi: qla2xxx: Fix potential NULL pointer dereference
    d5e7c9cd56e9 scsi: qla2xxx: Fix buffer overrun
    7bbeff613ec0 scsi: qla2xxx: Avoid fcport pointer dereference
    e934737e18ff scsi: qla2xxx: Array index may go out of bound
    38144f42f236 scsi: qla2xxx: Fix mem access after free
    5bcdaafd92be scsi: qla2xxx: Wait for io return on terminate rport
    78f0e86e361d scsi: qla2xxx: Fix hang in task management
    8815992d6868 scsi: qla2xxx: Fix task management cmd fail due to unavailable resource
    d7ab6f2504aa scsi: qla2xxx: Fix task management cmd failure
    7687186efc4d scsi: qla2xxx: Multi-que support for TMF
    4262f38e5b90 tracing/user_events: Fix struct arg size match check
    3a4d026899a1 tracing/probes: Fix to record 0-length data_loc in fetch_store_string*() if fails
    05304990f326 Revert "tracing: Add "(fault)" name injection to kernel probes"
    d0b9d2616261 tracing/probes: Fix to update dynamic data counter if fetcharg uses it
    923e1b331635 tracing/probes: Fix not to count error code to total length
    3efe0c1b4085 tracing/probes: Fix to avoid double count of the string length on the array
    e48b4d77fc1f smb: client: Fix -Wstringop-overflow issues
    0809de8fefbd selftests: mptcp: pm_nl_ctl: fix 32-bit support
    3e1de5a0ad3c selftests: mptcp: depend on SYN_COOKIES
    07e5fb9a29aa selftests: mptcp: userspace_pm: report errors with 'remove' tests
    eb7a979f6c35 selftests: mptcp: userspace_pm: use correct server port
    31ed3efae7b0 selftests: mptcp: sockopt: return error if wrong mark
    650f2bddffa6 selftests: mptcp: connect: fail if nft supposed to work
    926d63dd116d selftests: mptcp: sockopt: use 'iptables-legacy' if available
    7b8e734d7b93 mptcp: ensure subflow is unhashed before cleaning the backlog
    8953d2aaf507 mptcp: do not rely on implicit state check in mptcp_listen()
    1e1c9aa9288a tracing: Fix null pointer dereference in tracing_err_log_open()
    af2c39d87fcf fprobe: Ensure running fprobe_exit_handler() finished before calling rethook_free()
    03d63255a578 fprobe: Release rethook after the ftrace_ops is unregistered
    2d63081c7c3f accel/ivpu: Clear specific interrupt status bits on C0
    b978f392ebf0 accel/ivpu: Fix VPU register access in irq disable
    b55c769efa96 pwm: meson: fix handling of period/duty if greater than UINT_MAX
    f50a7fd012b1 pwm: meson: modify and simplify calculation in meson_pwm_get_state
    c52fc6ed367b PM: QoS: Restore support for default value on frequency QoS
    aee811c6c744 perf/x86: Fix lockdep warning in for_each_sibling_event() on SPR
    20c91d232631 xtensa: ISS: fix call to split_if_spec
    bc0b7ba07668 cifs: if deferred close is disabled then close files immediately
    a924e0fa77d0 drm/amd/pm: conditionally disable pcie lane/speed switching for SMU13
    0614fc44c636 drm/amd/pm: share the code around SMU13 pcie parameters update
    dc8d22f061df ftrace: Fix possible warning on checking all pages used in ftrace_process_locs()
    27bdd93e44cc ring-buffer: Fix deadloop issue on reading trace_pipe
    0939c264729d net: ena: fix shift-out-of-bounds in exponential backoff
    6e7b2337ecd0 regmap-irq: Fix out-of-bounds access when allocating config buffers
    8270d539a943 perf: RISC-V: Remove PERF_HES_STOPPED flag checking in riscv_pmu_start()
    f5997d173cdc samples: ftrace: Save required argument registers in sample trampolines
    b9621ce759e1 nvme: don't reject probe due to duplicate IDs for single-ported PCIe devices
    3f42d57a76e7 tracing: Fix memory leak of iter->temp when reading trace_pipe
    4a540f63618e tracing/histograms: Add histograms to hist_vars if they have referenced variables
    52c16b9fb910 dm: verity-loadpin: Add NULL pointer check for 'bdev' parameter
    9ea29ff30e6d s390/decompressor: fix misaligned symbol build error
    5b5f46317af5 bus: ixp4xx: fix IXP4XX_EXP_T1_MASK
    ed60e0031cbe Revert "8250: add support for ASIX devices with a FIFO bug"
    6f198932e005 media: uapi: Fix [GS]_ROUTING ACTIVE flag value
    32eb67d7360d soundwire: qcom: fix storing port config out-of-bounds
    c05e76d6b249 opp: Fix use-after-free in lazy_opp_tables after probe deferral
    11394a9eb18d meson saradc: fix clock divider mask length
    d2ac73ed512d xhci: Show ZHAOXIN xHCI root hub speed correctly
    3c3f95e5dbef xhci: Fix TRB prefetch issue of ZHAOXIN hosts
    8f16f4a3db78 xhci: Fix resume issue of some ZHAOXIN hosts
    51ca4bffdd22 arm64: errata: Mitigate Ampere1 erratum AC03_CPU_38 at stage-2
    c427221733d4 nfp: clean mc addresses in application firmware when closing port
    83040d3908b2 ceph: don't let check_caps skip sending responses for revoke msgs
    ce0ce5a5828e ceph: fix blindly expanding the readahead windows
    a18bb9f95eaa ceph: add a dedicated private data for netfs rreq
    0a6db5646777 libceph: harden msgr2.1 frame segment length checks
    7363de081c79 firmware: stratix10-svc: Fix a potential resource leak in svc_create_memory_pool()
    02b6e3cf23e6 tty: fix hang on tty device with no_room set
    2e97d6ecc55f tty: serial: imx: fix rs485 rx after tx
    1f426293fef1 tty: serial: samsung_tty: Fix a memory leak in s3c24xx_serial_getclk() when iterating clk
    1694fc8ad734 tty: serial: samsung_tty: Fix a memory leak in s3c24xx_serial_getclk() in case of error
    607fa9311235 serial: atmel: don't enable IRQs prematurely
    4a5b37ea6797 drm/ttm: Don't leak a resource on swapout move error
    6aea0032380b drm/ttm: Don't leak a resource on eviction error
    985560bdbf66 drm/amd/pm: fix smu i2c data read risk
    478e83b96931 drm/amdgpu: avoid restore process run into dead loop.
    7b58666b1e29 drm/amd/display: Add monitor specific edid quirk
    7c535cf9f62f drm/amd/display: Correct `DMUB_FW_VERSION` macro
    8961ce852fec drm/amd/display: Fix 128b132b link loss handling
    6593bd908f93 drm/amd/display: add a NULL pointer check
    8b7fb7d4fd1e drm/amd: Disable PSR-SU on Parade 0803 TCON
    733a1854db14 drm/amdgpu: fix clearing mappings for BOs that are always valid in VM
    4dae95b1e0cc drm/amd/display: disable seamless boot if force_odm_combine is enabled
    ca60e64d508e drm/amd/display: Remove Phantom Pipe Check When Calculating K1 and K2
    3bbd9b0bb7eb drm/amd/display: edp do not add non-edid timings
    0a494893bf63 drm/amd/display: fix seamless odm transitions
    dd1c1dd24fc0 drm/amd/display: Fix in secure display context creation
    7a1cf6495808 drm/amd/display: Limit DCN32 8 channel or less parts to DPM1 for FPO
    104d79eb58aa drm/dp_mst: Clear MSG_RDY flag before sending new message
    999b3d17af96 drm/rockchip: vop: Leave vblank enabled in self-refresh
    679aa391f161 drm/atomic: Allow vblank-enabled + self-refresh "disable"
    311558d2f8fe scsi: lpfc: Fix double free in lpfc_cmpl_els_logo_acc() caused by lpfc_nlp_not_used()
    eb8282cceacc fs: dlm: fix missing pending to false
    e6f620597785 fs: dlm: clear pending bit when queue was empty
    1a3a8048b7e9 fs: dlm: fix mismatch of plock results from userspace
    8293a61ab923 fs: dlm: make F_SETLK use unkillable wait_event
    27edf3c76f65 fs: dlm: interrupt posix locks only when process is killed
    c80b05b8a30f fs: dlm: fix cleanup pending ops when interrupted
    a2e6385e9bfb fs: dlm: return positive pid value for F_GETLK
    27eb7f1e3755 md/raid0: add discard support for the 'original' layout
    7a0c60e6781b mfd: pm8008: Fix module autoloading
    892667b7796e misc: pci_endpoint_test: Re-init completion for every test
    38d12bcf4e2c misc: pci_endpoint_test: Free IRQs before removing the device
    4998b8d241fc PCI: rockchip: Set address alignment for endpoint mode
    fc069ddb01f5 PCI: rockchip: Use u32 variable to access 32-bit registers
    e8a6e5382032 PCI: rockchip: Fix legacy IRQ generation for RK3399 PCIe endpoint core
    8d61fa105809 PCI: rockchip: Add poll and timeout to wait for PHY PLLs to be locked
    e82e1f1f2101 PCI: rockchip: Write PCI Device ID to correct register
    0a2b46bb6d06 PCI: rockchip: Assert PCI Configuration Enable bit after probe
    db88c2b0b6c1 PCI: epf-test: Fix DMA transfer completion detection
    4bad9a2583b0 PCI: epf-test: Fix DMA transfer completion initialization
    18896b146bb0 PCI: qcom: Disable write access to read only registers for IP v2.3.3
    f7a59ae38990 PCI: Add function 1 DMA alias quirk for Marvell 88SE9235
    b9bd8e34ec97 PCI: Release resource invalidated by coalescing
    e7afe162cb6e PCI/PM: Avoid putting EloPOS E2/S2/H2 PCIe Ports in D3cold
    7f8209580c1a s390/zcrypt: do not retry administrative requests
    352cf23c6785 scsi: mpi3mr: Propagate sense data for admin queue SCSI I/O
    85587cb0661e dm integrity: reduce vmalloc space footprint on 32-bit architectures
    5eaef775fa73 hwrng: imx-rngc - fix the timeout for init and self check
    bd6736b88897 arm64: dts: ti: k3-j721s2: Fix wkup pinmux range
    c5d4ecc2e531 arm64: dts: mt7986: use size of reserved partition for bl2
    2a03c4e683d3 jfs: jfs_dmap: Validate db_l2nbperpage while mounting
    5cee8bfb8cbd ext2/dax: Fix ext2_setsize when len is page aligned
    15544619bcd9 soc: qcom: mdt_loader: Fix unconditional call to scm_pas_mem_setup
    f83c7b79847f mm/mmap: Fix error return in do_vmi_align_munmap()
    566468af21cd fs: dlm: revert check required context while close
    0b8b682bc535 ext4: only update i_reserved_data_blocks on successful block allocation
    77c3ca1108eb ext4: turn quotas off if mount failed after enabling quotas
    329388470de5 ext4: fix to check return value of freeze_bdev() in ext4_shutdown()
    03eb7f300141 ext4: avoid updating the superblock on a r/o mount if not needed
    08bd62023ffa ext4: fix wrong unit use in ext4_mb_new_blocks
    a6cff82d891d ext4: get block from bh in ext4_free_blocks for fast commit replay
    ed53b2418b68 ext4: fix wrong unit use in ext4_mb_clear_bb
    da170f7cf5f1 ext4: Fix reusing stale buffer heads from last failed mounting
    6b9fb255d537 MIPS: KVM: Fix NULL pointer dereference
    08de7c3f9d30 MIPS: Loongson: Fix build error when make modules_install
    71a16db6fa33 MIPS: Loongson: Fix cpu_probe_loongson() again
    0b176d52ed3d MIPS: cpu-features: Use boot_cpu_type for CPU type based features
    2111a6b05852 drm/amd/display: perform a bounds check before filling dirty rectangles
    a0a533e39c26 powerpc/64s: Fix native_hpte_remove() to be irq-safe
    c9cf5af93259 powerpc/security: Fix Speculation_Store_Bypass reporting on Power10
    8c8191c1a045 misc: fastrpc: Create fastrpc scalar with correct buffer count
    383b4a3844c7 powerpc: Fail build if using recordmcount with binutils v2.37
    662685edb53f tracing/user_events: Fix incorrect return value for writing operation when events are disabled
    22d82affc0d6 kasan: fix type cast in memory_is_poisoned_n
    f1a739fab13c kasan, slub: fix HW_TAGS zeroing with slub_debug
    29851fd19558 kasan: use internal prototypes matching gcc-13 builtins
    79afd776e33f kasan: add kasan_tag_mismatch prototype
    18feb239683e net: phy: dp83td510: fix kernel stall during netboot in DP83TD510E PHY driver
    3260d91b16d0 net: bcmgenet: Ensure MDIO unregistration has clocks enabled
    695b5b4fa1ed mtd: rawnand: meson: fix unaligned DMA buffers handling
    0da8f857cae2 tpm/tpm_tis: Disable interrupts for Lenovo L590 devices
    7f13d7f68763 tpm,tpm_tis: Disable interrupts after 1000 unhandled IRQs
    aa6e6c72cc9a tpm/tpm_tis: Disable interrupts for Framework Laptop Intel 13th gen
    15914c95e29c tpm: return false from tpm_amd_is_rng_defective on non-x86 platforms
    70c001a67e72 tpm: tis_i2c: Limit write bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    60057602899c tpm/tpm_tis: Disable interrupts for Framework Laptop Intel 12th gen
    0f20054539e4 tpm: tis_i2c: Limit read bursts to I2C_SMBUS_BLOCK_MAX (32) bytes
    6e110666d870 tpm: tpm_tis: Disable interrupts *only* for AEON UPX-i11
    092db954e2c3 tpm: tpm_vtpm_proxy: fix a race condition in /dev/vtpmx creation
    4d73d1ceda70 tpm: Do not remap from ACPI resources again for Pluton TPM
    86749d3e4fa9 pinctrl: amd: Unify debounce handling into amd_pinconf_set()
    a4c524c732fe pinctrl: amd: Drop pull up select configuration
    4ba2df05d5dc pinctrl: amd: Use amd_pinconf_set() for all config options
    cfe503d0fc1c pinctrl: amd: Only use special debounce behavior for GPIO 0
    940cc84e278d pinctrl: amd: Revert "pinctrl: amd: disable and mask interrupts on probe"
    6841d9bdf4e0 pinctrl: amd: Detect and mask spurious interrupts
    3a62651f5aed pinctrl: amd: Fix mistake in handling clearing pins at startup
    ebfd0235355b pinctrl: amd: Detect internal GPIO0 debounce handling
    930e6f585c7b kbuild: make modules_install copy modules.builtin(.modinfo)
    3350fd6ef507 f2fs: fix deadlock in i_xattr_sem and inode page lock
    115557cc226a f2fs: don't reset unchangable mount option in f2fs_remount()
    aa87c43ea599 drm/client: Send hotplug event after registering a client
    6b99f5a95523 smb: client: fix parsing of source mount option
    99cdabe81962 cifs: fix session state check in smb2_find_smb_ses
    ba6d78d90e21 smb: client: improve DFS mount check
    4314b692dc92 nvme-pci: fix DMA direction of unmapping integrity data
    bd2333fa86dc net/sched: sch_qfq: account for stab overhead in qfq_enqueue
    7d5e5c515157 net/sched: sch_qfq: reintroduce lmax bound check for MTU
    d2cb036bac82 wifi: rtw89: debug: fix error code in rtw89_debug_priv_send_h2c_set()
    3fdb0a02e7c0 net: txgbe: fix eeprom calculation error
    5a95747feefa net/sched: make psched_mtu() RTNL-less safe
    5cd311d6a31c drm/nouveau: bring back blit subchannel for pre nv50 GPUs
    20686cb5af1a drm/nouveau/acr: Abort loading ACR if no firmware was found
    c06b0530b4d5 netdevsim: fix uninitialized data in nsim_dev_trap_fa_cookie_write()
    b9c110f45206 drm/nouveau/disp/g94: enable HDMI
    c557e9329aea drm/nouveau/disp: fix HDMI on gt215+
    5be91e9f28e5 riscv: mm: fix truncation warning on RV32
    fa05020e383d net/sched: flower: Ensure both minimum and maximum ports are specified
    ccb843ee2c93 xdp: use trusted arguments in XDP hints kfuncs
    a957ac8e0b5f bpf: cpumap: Fix memory leak in cpu_map_update_elem
    6e2401fa092e wifi: airo: avoid uninitialized warning in airo_get_rate()
    f30de55777c9 erofs: fix fsdax unavailability for chunk-based regular files
    3cf79e59ca0f erofs: avoid infinite loop in z_erofs_do_read_page() when reading beyond EOF
    95a4ba7fde10 erofs: avoid useless loops in z_erofs_pcluster_readmore() when reading beyond EOF
    e91fa782185e octeontx2-pf: Add additional check for MCAM rules
    7ead10b44b79 net: dsa: Removed unneeded of_node_put in felix_parse_ports_node
    eeab8f95bae2 drm/i915: Fix one wrong caching mode enum usage
    444969c846b8 drm/i915: Don't preserve dpll_hw_state for slave crtc in Bigjoiner
    11a7171016e8 net: fec: increase the size of tx ring and update tx_wake_threshold
    593a129efa73 net: fec: recycle pages for transmitted XDP frames
    dd8403cf52e4 net: fec: remove last_bdp from fec_enet_txq_xmit_frame()
    9541f33a2d83 net: fec: remove useless fec_enet_reset_skb()
    a05dce2058a4 riscv, bpf: Fix inconsistent JIT image generation
    ed60a9c42199 openrisc: Union fpcsr and oldmask in sigcontext to unbreak userspace ABI
    5647f239a7c0 nvme: fix the NVME_ID_NS_NVM_STS_MASK definition
    dcb2303c5155 igc: Fix inserting of empty frame for launchtime
    f591f7111fc1 igc: Fix launchtime before start of cycle
    3cfa77213bd2 igc: No strict mode in pure launchtime/CBS offload
    9689dde9728a fprobe: add unlock to match a succeeded ftrace_test_recursion_trylock
    ad62e7f59aa3 kernel/trace: Fix cleanup logic of enable_trace_eprobe
    e93bc9d28aab igc: Handle already enabled taprio offload for basetime 0
    c0b7b7a7a3d4 igc: Do not enable taprio offload for invalid arguments
    bafe3293aa0f igc: Rename qbv_enable to taprio_offload_enable
    bfd02dcd12a1 net/sched: taprio: replace tc_taprio_qopt_offload :: enable with a "cmd" enum
    3b9dca92e0e2 platform/x86: wmi: Break possible infinite loop when parsing GUID
    06a87ac14d46 net: dsa: qca8k: Add check for skb_copy
    a7902cc5f5b9 HID: hyperv: avoid struct memcpy overrun warning
    1f656e483eb4 ipv6/addrconf: fix a potential refcount underflow for idev
    c9a6bd1cc028 NTB: ntb_tool: Add check for devm_kcalloc
    d04d154836c8 NTB: ntb_transport: fix possible memory leak while device_register() fails
    416dcc87109c ntb: intel: Fix error handling in intel_ntb_pci_driver_init()
    8e88c5726d93 NTB: amd: Fix error handling in amd_ntb_pci_driver_init()
    99f7f2d441f9 ntb: idt: Fix error handling in idt_pci_driver_init()
    bf9585e74446 udp6: fix udp6_ehashfn() typo
    aa657d319e6c icmp6: Fix null-ptr-deref of ip6_null_entry->rt6i_idev in icmp6_dev().
    dd8ec9922c06 s390/ism: Do not unregister clients with registered DMBs
    fdeb916f172e s390/ism: Fix and simplify add()/remove() callback handling
    32b055e05ce1 s390/ism: Fix locking for forwarding of IRQs and events to clients
    7a59f29961cf net: prevent skb corruption on frag list segmentation
    4066d102ff1f net: bgmac: postpone turning IRQs off to avoid SoC hangs
    bd4a820551ad udp6: add a missing call into udp_fail_queue_rcv_skb tracepoint
    daeaad114cb1 ionic: remove WARN_ON to prevent panic_on_warn
    a08a2f193411 octeontx2-af: Move validation of ptp pointer before its usage
    eb4783ba9af0 octeontx2-af: Promisc enable/disable through mbox
    ab640e7d0d56 drm/fbdev-dma: Fix documented default preferred_bpp value
    fb04621a4ef8 gve: Set default duplex configuration to full
    0a2e3f49febd net/sched: cls_fw: Fix improper refcount update leads to use-after-free
    8163e5353f20 net: mscc: ocelot: fix oversize frame dropping for preemptible TCs
    c1b9b13ed2c3 net: dsa: felix: make vsc9959_tas_guard_bands_update() visible to ocelot->ops
    fa27885c488d net: mvneta: fix txq_map in case of txq_number==1
    7fa7ac28bd85 bpf: Fix max stack depth check for async callbacks
    d4355a79d07d scsi: ufs: ufs-mediatek: Add dependency for RESET_CONTROLLER
    a5737c43853e scsi: qla2xxx: Fix error code in qla2x00_start_sp()
    505b2e1ca03d blk-crypto: use dynamic lock class for blk_crypto_profile::lock
    7df9b9ac3ff0 igc: Handle PPS start time programming for past time values
    6bb1650e4834 igc: Include the length/type field and VLAN tag in queueMaxSDU
    a3390ae2d9a9 igc: set TP bit in 'supported' and 'advertising' fields of ethtool_link_ksettings
    cbb537936251 net/mlx5e: RX, Fix page_pool page fragment tracking for XDP
    3c351aa1f462 net/mlx5: Query hca_cap_2 only when supported
    35525719b9ed net/mlx5e: TC, CT: Offload ct clear only once
    f7ceedd1d124 net/mlx5e: Check for NOT_READY flag state after locking
    facf08c813ed net/mlx5: Register a unique thermal zone per device
    bfc6d6dfd082 net/mlx5e: RX, Fix flush and close release flow of regular rq for legacy rq
    7035e3ae600c net/mlx5e: fix memory leak in mlx5e_ptp_open
    8a75a6f169c3 net/mlx5e: fix memory leak in mlx5e_fs_tt_redirect_any_create
    e864500fae0f net/mlx5e: fix double free in mlx5e_destroy_flow_table
    8b07934fac7a igc: Fix TX Hang issue when QBV Gate is closed
    c1d10b158753 igc: Add XDP hints kfuncs for RX hash
    77c18544c9c1 igc: Add igc_xdp_buff wrapper for xdp_buff in driver
    fdda1047dcc4 igc: Remove delay during TX ring configuration
    2e8ae808f33d igc: Add condition for qbv_config_change_errors counter
    652b1b951c01 ice: Fix tx queue rate limit when TCs are configured
    230cef981530 ice: Fix max_rate check while configuring TX rate limits
    027685f7e490 netfilter: conntrack: don't fold port numbers into addresses before hashing
    e93cbd7efd8e netfilter: nf_tables: report use refcount overflow
    9c1c1cc08b88 xen/virtio: Fix NULL deref when a bridge of PCI root bus has no parent
    e49989d5da03 drm/panel: simple: Add Powertip PH800480T013 drm_display_mode flags
    4ad26d1d447a swiotlb: reduce the number of areas to match actual memory pool size
    06450d406150 swiotlb: always set the number of areas before allocating the pool
    58d3b65b89ef drm/bridge: ti-sn65dsi86: Fix auxiliary bus lifetime
    552f79aa9e80 drm: bridge: dw_hdmi: fix connector access for scdc
    44f0720d154e drm/panel: simple: Add connector_type for innolux_at043tn24
    2ba03cecb12a ksmbd: fix out of bounds read in smb2_sess_setup
    ffaa0c85edd9 ksmbd: add missing compound request handing in some commands
    26f91bd2fdae net: lan743x: select FIXED_PHY
    c93f4ff89a67 net: lan743x: Don't sleep in atomic context
    1e50bc2c177d HID: amd_sfh: Fix for shift-out-of-bounds
    5a1a6225dd11 HID: amd_sfh: Rename the float32 variable
    13c82d94c601 HID: input: fix mapping for camera access keys
    10540fca53ee security/integrity: fix pointer to ESL data and its size on pseries
    62813c2d2a36 Linux 6.4.4
    a1eaafa2c0ea sh: hd64461: Handle virq offset for offchip IRQ base and HD64461 IRQ
    b990fcf1f816 sh: mach-dreamcast: Handle virq offset in cascaded IRQ demux
    42530519c7f2 sh: mach-highlander: Handle virq offset in cascaded IRL demux
    eca4937e394f sh: mach-r2d: Handle virq offset in cascaded IRL demux
    7b43d7b8664c block/partition: fix signedness issue for Amiga partitions
    bd4f737b145d io_uring: Use io_schedule* in cqring wait
    90583977cae9 tty: serial: fsl_lpuart: add earlycon for imx8ulp platform
    35a1185745df wireguard: netlink: send staged packets when setting initial private key
    9a1317621fbf wireguard: queueing: use saner cpu selection wrapping
    b79c09c2bf2d netfilter: nf_tables: prevent OOB access in nft_byteorder_eval
    5e5e967e8505 netfilter: nf_tables: do not ignore genmask when looking up chain by id
    fce5cc7cbd4b netfilter: conntrack: Avoid nf_ct_helper_hash uses after free
    14c6b21717f0 drm/amdgpu: check RAS irq existence for VCN/JPEG
    c8ae016b2416 drm/amd/pm: add abnormal fan detection for smu 13.0.0
    f9fdc20982b5 drm/amdgpu/sdma4: set align mask to 255
    50515f38521b drm/amd/pm: revise the ASPM settings for thunderbolt attached scenario
    414d11852603 drm/amdgpu: Skip mark offset for high priority rings
    fbec04aa5cb8 drm/amdgpu: make sure that BOs have a backing store
    2eb044def66c drm/amdgpu: make sure BOs are locked in amdgpu_vm_get_memory
    e46fce918eb3 LoongArch: Include KBUILD_CPPFLAGS in CHECKFLAGS invocation
    d536af163c53 ovl: fix null pointer dereference in ovl_get_acl_rcu()
    a682c42c5f7e ovl: let helper ovl_i_path_real() return the realinode
    69f9ae7edf9e ovl: fix null pointer dereference in ovl_permission()
    e7c921db1739 kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS
    6de71217023c kbuild: Add KBUILD_CPPFLAGS to as-option invocation
    103d3437b3c6 kbuild: Add CLANG_FLAGS to as-instr
    03c0d4aa8550 powerpc/vdso: Include CLANG_FLAGS explicitly in ldflags-y
    089f24d3f39e mips: Include KBUILD_CPPFLAGS in CHECKFLAGS invocation
    528839d3262b Input: ads7846 - fix pointer cast warning
    f5a48c015129 fs: no need to check source
    ac2d66430ea6 md/raid1-10: fix casting from randomized structure in raid1_submit_write()
    20365396f643 Input: ads7846 - Fix usage of match data
    c503b8fc7845 blktrace: use inline function for blk_trace_remove() while blktrace is disabled
    78a7f865e283 leds: trigger: netdev: Recheck NETDEV_LED_MODE_LINKUP on dev rename
    5dc4972929bc ARM: orion5x: fix d2net gpio initialization
    18b4ca24eaa9 ARM: dts: qcom: ipq4019: fix broken NAND controller properties override
    7ad032cac448 ARM: dts: qcom: msm8660: Fix regulator node names
    3f6af56d4204 regulator: tps65219: Fix matching interrupts for their regulators
    a94147563e91 ASoC: mediatek: mt8173: Fix snd_soc_component_initialize error path
    05be6adaac93 ASoC: mediatek: mt8173: Fix irq error path
    82270e7f284f btrfs: do not BUG_ON() on tree mod log failure at __btrfs_cow_block()
    796eb12aa5e4 btrfs: fix extent buffer leak after tree mod log failure at split_node()
    6df630a1e382 btrfs: add missing error handling when logging operation while COWing extent buffer
    a5cdc4012efa btrfs: fix race when deleting quota root from the dirty cow roots list
    6c65062f66cf btrfs: reinsert BGs failed to reclaim
    7b063701b5c3 btrfs: add block-group tree to lockdep classes
    f61029274c70 btrfs: bail out reclaim process if filesystem is read-only
    9d9586ef1ac9 btrfs: delete unused BGs while reclaiming BGs
    987cf64973ae btrfs: warn on invalid slot in tree mod log rewind
    11f14402fe34 btrfs: insert tree mod log move in push_node_left
    1ea89213cdfe btrfs: fix dirty_metadata_bytes for redirtied buffers
    1b532748ba00 btrfs: add handling for RAID1C23/DUP to btrfs_reduce_alloc_profile
    b9a6e00591a2 ipvs: increase ip_vs_conn_tab_bits range for 64BIT
    7e3b21ebfe33 usb: typec: ucsi: Mark dGPUs as DEVICE scope
    059484d31a8a fs: Lock moved directories
    4cbd5eb173bf fs: Establish locking order for unrelated directories
    f55aaecb4d76 Revert "udf: Protect rename against modification of moved directory"
    0b6f613e2b50 Revert "f2fs: fix potential corruption when moving a directory"
    cf9b6fe98470 ext4: Remove ext4 locking of moved directory
    f80436e4f788 fs: avoid empty option when generating legacy mount string
    fb306470cada jffs2: reduce stack usage in jffs2_build_xattr_subsystem()
    7fd2ca4a860c nfsd: use vfs setgid helper
    ebe07db84099 shmem: use ramfs_kill_sb() for kill_sb method of ramfs-based tmpfs
    35cbaf3516aa mm/damon/ops-common: atomically test and clear young on ptes and pmds
    3fd41a972f7f autofs: use flexible array in ioctl structure
    fd768cc263f3 integrity: Fix possible multiple allocation in integrity_inode_get()
    d363ac7bd4bb um: Use HOST_DIR for mrproper
    bec85c4df15d watch_queue: prevent dangling pipe pointer
    4514847aee18 bcache: Fix __bch_btree_node_alloc to make the failure behavior consistent
    0cabf9e16466 bcache: Remove unnecessary NULL point check in node allocations
    2882a4c4f0c9 bcache: fixup btree_cache_wait list damage
    53e89d83dcc6 wifi: mt76: mt7921e: fix init command fail with enabled device
    54c1b922683d wifi: cfg80211: fix receiving mesh packets without RFC1042 header
    1a9f0e23079d wifi: ath10k: Serialize wake_tx_queue ops
    12627f20eb45 wifi: cfg80211: fix regulatory disconnect for non-MLO
    cfc678270165 mmc: sdhci: fix DMA configure compatibility issue when 64bit DMA mode is used.
    0d8292bb9f0f mmc: mmci: Set PROBE_PREFER_ASYNCHRONOUS
    21d3f844cad5 mmc: core: disable TRIM on Micron MTFC4GACAJCN-1M
    94675949da02 mmc: core: disable TRIM on Kingston EMMC04G-M627
    6d1ac6bc1bbb mm/mglru: make memcg_lru->lock irq safe
    58e80cb68b05 io_uring: wait interruptibly for request completions on exit
    5cf0490a35af irqchip/loongson-pch-pic: Fix initialization of HT vector register
    adc096e680b9 NFSD: add encoding of op_recall flag for write delegation
    236381050d2b irqchip/loongson-pch-pic: Fix potential incorrect hwirq assignment
    768c408594b5 nfsd: move init of percpu reply_cache_stats counters back to nfsd_init_net
    7f4f66ac8381 irqchip/loongson-liointc: Fix IRQ trigger polarity
    2e07e4bbf0ec arm64/signal: Restore TPIDR2 register rather than memory state
    4cfa81020c65 Revert "drm/amd/display: Move DCN314 DOMAIN power control to DMCUB"
    64c79e58a721 lib: dhry: fix sleeping allocations inside non-preemptable section
    e22ca18614d2 writeback: account the number of pages written back
    22f127fffe72 i2c: xiic: Don't try to handle more interrupt events after error
    346b1ac789fa apparmor: fix profile verification and enable it
    6108e25cfe43 apparmor: fix policy_compat permission remap with extended permissions
    33b1fe578f7d apparmor: add missing failure check in compute_xmatch_perms
    543731db0173 apparmor: fix missing error check for rhashtable_insert_fast
    e9e33faea104 sh: dma: Fix DMA channel offset calculation
    96524810c654 risc-v: Fix order of IPI enablement vs RCU startup
    b8204a8ca897 s390/qeth: Fix vipa deletion
    cfc3b2e0c244 afs: Fix accidental truncation when storing data
    e21994909eb2 octeontx-af: fix hardware timestamp configuration
    af20ce74201d net: dsa: sja1105: always enable the send_meta options
    666e1db22a88 net: dsa: tag_sja1105: fix MAC DA patching from meta frames
    fda0f1e649b2 pptp: Fix fib lookup calls.
    ba11f4e59509 riscv: move memblock_allow_resize() after linear mapping is ready
    d003ad402ae6 fanotify: disallow mount/sb marks on kernel internal pseudo fs
    60e09765cee1 drm/i915/psr: Fix BDW PSR AUX CH data register offsets
    e5f1e5a57fba net/sched: act_pedit: Add size check for TCA_PEDIT_PARMS_EX
    bc2298851257 xsk: Honor SO_BINDTODEVICE on bind
    90b9e7202676 bpf, btf: Warn but return no error for NULL btf from __register_btf_kfunc_id_set()
    f9d46429de2a vduse: fix NULL pointer dereference
    5738c0c4eec9 tcp: annotate data races in __tcp_oow_rate_limited()
    58f9e88eb247 net: fix net_dev_start_xmit trace event vs skb_transport_offset()
    ea0822019036 net: dsa: tag_sja1105: fix source port decoding in vlan_filtering=0 bridge mode
    f8fe2df13a0f net: bridge: keep ports without IFF_UNICAST_FLT in BR_PROMISC mode
    b018ce10361b powerpc: dts: turris1x.dts: Fix PCIe MEM size for pci2 node
    d31ee3376fe2 powerpc: allow PPC_EARLY_DEBUG_CPM only when SERIAL_CPM=y
    721b75ea2dfc ntfs: Fix panic about slab-out-of-bounds caused by ntfs_listxattr()
    84996061793a octeontx2-af: Reset MAC features in FLR
    b04872e15f3d octeontx2-af: Add validation before accessing cgx and lmac
    425a724a7c6e octeontx2-af: Fix mapping for NIX block from CGX connection
    1faafa54bb80 octeontx2-af: cn10kb: fix interrupt csr addresses
    0dc1f2b88b6e f2fs: fix error path handling in truncate_dnode()
    dfaa428d137d mailbox: ti-msgmgr: Fill non-message tx data fields with 0x0
    a389109fb8e0 drm/amd: Don't try to enable secure display TA multiple times
    f0f26d35d4ac drm/amdgpu: fix number of fence calculations
    22ae32d80ef5 spi: bcm-qspi: return error if neither hif_mspi nor mspi is available
    cd716022c968 mlxsw: minimal: fix potential memory leak in mlxsw_m_linecards_init
    82b3e8afba06 net: dsa: vsc73xx: fix MTU configuration
    91a0632e7307 ibmvnic: Do not reset dql stats on NON_FATAL err
    048b241b7f5f sfc: support for devlink port requires MAE access
    662d31232b2c Bluetooth: MGMT: Fix marking SCAN_RSP as not connectable
    90845ae29e68 Bluetooth: ISO: use hci_sync for setting CIG parameters
    9e65e361e3d4 Bluetooth: fix invalid-bdaddr quirk for non-persistent setup
    bd95be10a23e Add MODULE_FIRMWARE() for FIRMWARE_TG357766.
    6028a6b3f9ae net: dsa: tag_sja1105: always prefer source port information from INCL_SRCPT
    89fd65ca2fb9 net: dsa: sja1105: always enable the INCL_SRCPT option
    7095192c7477 net: dsa: felix: don't drop PTP frames with tag_8021q when RX timestamping is disabled
    ad1fb7de4604 net: mscc: ocelot: don't keep PTP configuration of all ports in single structure
    ad95418b5d8b net: mscc: ocelot: don't report that RX timestamping is enabled by default
    ce77da4747f5 spi: spi-geni-qcom: enable SPI_CONTROLLER_MUST_TX for GPI DMA mode
    8148e4038447 net/sched: act_ipt: zero skb->cb before calling target
    c4394a69c773 net/sched: act_ipt: add sanity checks on skb before calling target
    8ed12339c99c net/sched: act_ipt: add sanity checks on table name and hook locations
    f8d77336af38 sctp: fix potential deadlock on &net->sctp.addr_wq_lock
    f77b761bf05a media: cec: i2c: ch7322: also select REGMAP
    9f6293ad7f48 media: tc358746: select CONFIG_GENERIC_PHY
    e975c5240365 tools/virtio: fix build break for aarch64
    7b6a9ec3ed4d virtio-vdpa: Fix unchecked call to NULL set_vq_affinity
    cabaaa0ee05c f2fs: check return value of freeze_super()
    77ea88751f68 drm/i915/guc/slpc: Apply min softlimit correctly
    6902516030d8 drm/i915/psr: Use hw.adjusted mode when calculating io/fast wake times
    a7d66bf8e326 rtc: st-lpc: Release some resources in st_rtc_probe() in case of error
    a88994f0301d blk-throttle: Fix io statistics for cgroup v1
    4ed22bf4f235 perf bpf: Move the declaration of struct rq
    8c59a155c887 md/raid10: fix the condition to call bio_end_io_acct()
    9b2beba7feba pwm: mtk_disp: Fix the disable flow of disp_pwm
    bdf3e642dc55 pwm: ab8500: Fix error code in probe()
    44e7df11414d pwm: sysfs: Do not apply state to already disabled PWMs
    2acc6fac21c1 pwm: imx-tpm: force 'real_period' to be zero in suspend
    3efba046f65b lib/bitmap: drop optimization of bitmap_{from,to}_arr64
    25cbee4f2d01 phy: tegra: xusb: check return value of devm_kzalloc()
    ddce2002e5b0 mfd: stmpe: Only disable the regulators if they are enabled
    53a2894293e8 phy: qcom: qmp-combo: fix Display Port PHY configuration for SM8550
    de55ce827a76 hwtracing: hisi_ptt: Fix potential sleep in atomic context
    f712198e4ba9 clk: qcom: mmcc-msm8974: fix MDSS_GDSC power flags
    96be1c8a3f7e misc: fastrpc: check return value of devm_kasprintf()
    08e6cb1a9f83 cpufreq: mediatek: correct voltages for MT7622 and MT7623
    dc7e0192c470 KVM: s390/diag: fix racy access of physical cpu number in diag 9c handler
    5dfbcfc5caf0 KVM: s390: vsie: fix the length of APCB bitmap
    77ad08c74e24 mfd: stmfx: Nullify stmfx->vdd in case of error
    3711e3d4a074 mfd: stmfx: Fix error path in stmfx_chip_init
    8bdd5c21ec02 bus: fsl-mc: don't assume child devices are all fsl-mc devices
    92bc4a26b037 nvmem: rmem: Use NVMEM_DEVID_AUTO
    0dfaf543aac8 test_firmware: return ENOMEM instead of ENOSPC on failed memory allocation
    603bfb26090a nvmem: imx-ocotp: Reverse MAC addresses on all i.MX derivates
    94e0469149d4 nvmem: sunplus-ocotp: release otp->clk before return
    dd67388bd67c cdx: fix driver managed dma support
    f358776ab9d7 drivers: fwnode: fix fwnode_irq_get[_byname]()
    85fd0afbfea6 serial: 8250_omap: Use force_suspend and resume for system suspend
    e8c07171d168 Revert "usb: common: usb-conn-gpio: Set last role to unknown before initial detection"
    2aa0b8ffd964 mfd: intel-lpss: Add missing check for platform_get_resource
    6e25e6fcef91 mfd: wcd934x: Fix an error handling path in wcd934x_slim_probe()
    df2d221e9340 rtla/hwnoise: Reduce runtime to 75%
    1eecbbf3d251 usb: dwc3-meson-g12a: Fix an error handling path in dwc3_meson_g12a_probe()
    c7d1adb395ea usb: common: usb-conn-gpio: Set last role to unknown before initial detection
    1ddee43610ec usb: dwc3: qcom: Fix an error handling path in dwc3_qcom_probe()
    3a8e53ac1009 usb: dwc3: qcom: Release the correct resources in dwc3_qcom_remove()
    8a46414dbbdd KVM: s390: fix KVM_S390_GET_CMMA_BITS for GFNs in memslot holes
    908fa828b61f f2fs: flush error flags in workqueue
    bd519deaa2a3 f2fs: fix the wrong condition to determine atomic context
    ed1d478bf838 f2fs: support errors=remount-ro|continue|panic mountoption
    5619e9aabbd2 f2fs: fix to avoid NULL pointer dereference f2fs_write_end_io()
    e747ccff7a62 f2fs: fix potential deadlock due to unpaired node_write lock use
    22cfc91c3be7 gfs2: Fix duplicate should_fault_in_pages() call
    af687d9ff1fd sh: Avoid using IRQ0 on SH3 and SH4
    de0737c97592 media: atomisp: ov2680: Stop using half pixelclock for binned modes
    c965ec6fdaf6 media: atomisp: gmin_platform: fix out_len in gmin_get_config_dsm_var()
    a8778b236f6a media: atomisp: gc0310: Fix double free in gc0310_remove()
    924277579816 media: venus: helpers: Fix ALIGN() of non power of two
    6b7d296b63f1 mfd: rt5033: Drop rt5033-battery sub-device
    7a34dc6dc1d0 power: supply: rt9467: Make charger-enable control as logic level
    d0674d07e4fb coresight: etm4x: Fix missing trctraceidr file in sysfs
    bab5cd4fde9e coresight: Fix loss of connection info when a module is unloaded
    3d3a2307ff88 i3c: master: svc: fix cpu schedule in spin lock
    5d77a4114430 lkdtm: replace ll_rw_block with submit_bh
    0c5631b11678 kernfs: fix missing kernfs_idr_lock to remove an ID from the IDR
    fc52289156d7 serial: 8250: lock port for UART_IER access in omap8250_irq()
    ce73b6f8d92d serial: core: lock port for start_rx() in uart_resume_port()
    27cd11322f9d serial: 8250: lock port for stop_rx() in omap8250_irq()
    ece78f66a948 serial: core: lock port for stop_rx() in uart_suspend_port()
    a44696977dd3 usb: misc: eud: Fix eud sysfs path (use 'qcom_eud')
    f996b241c925 usb: hide unused usbfs_notify_suspend/resume functions
    38dbd6f72bfb usb: phy: phy-tahvo: fix memory leak in tahvo_usb_probe()
    95a99cac3dad extcon: Fix kernel doc of property capability fields to avoid warnings
    adae2c1a68e6 extcon: Fix kernel doc of property fields to avoid warnings
    374447e33677 usb: gadget: u_serial: Add null pointer check in gserial_suspend
    134a7d4642f1 usb: dwc3: qcom: Fix potential memory leak
    fefce5299e64 soundwire: debugfs: fix unbalanced pm_runtime_put()
    7c30688e3426 soundwire: qcom: fix unbalanced pm_runtime_put()
    0522fce83630 soundwire: qcom: use consistently 'ctrl' as state variable name
    bbd3421a6159 staging: vchiq_arm: mark vchiq_platform_init() static
    f8f7fdbece48 clk: qcom: mmcc-msm8974: use clk_rcg2_shared_ops for mdp_clk_src clock
    240e128ad423 clk: qcom: ipq5332: fix the order of SLEEP_CLK and XO clock
    0dd0f81ce289 clk: qcom: ipq5332: fix the src parameter in ftbl_gcc_apss_axi_clk_src
    6e4b73d1bcf4 clk: qcom: dispcc-qcm2290: Fix GPLL0_OUT_DIV handling
    fed34a3f0781 clk: qcom: dispcc-qcm2290: Fix BI_TCXO_AO handling
    262bbc8ea9ba clk: qcom: ipq6018: fix networking resets
    0270c9d68ce4 media: mediatek: vcodec: using decoder status instead of core work count
    c5dcd7a19f1e media: hi846: fix usage of pm_runtime_get_if_in_use()
    7429f5f2a830 media: renesas: fdp1: Identify R-Car Gen2 versions
    875e2e156c06 media: i2c: Correct format propagation for st-mipid02
    b98186af3bf8 media: i2c: imx296: fix error checking in imx296_read_temperature()
    ae65238d3f5a media: usb: siano: Fix warning due to null work_func_t function pointer
    1b66bd39af61 media: videodev2.h: Fix struct v4l2_input tuner index comment
    8351261ab42a media: amphion: initiate a drain of the capture queue in dynamic resolution change
    30f900102b5e media: videodev2.h: Fix p_s32 and p_s64 pointer types
    5916e82dfc84 media: common: saa7146: Avoid a leak in vmalloc_to_sg()
    c67eaaaa7d8c media: amphion: drop repeated codec data for vc1g format
    a129ec24f469 media: amphion: drop repeated codec data for vc1l format
    e8d76e4680c2 media: usb: Check az6007_read() return value
    f17af9387102 clk: qcom: gcc-qcm2290: Mark RCGs shared where applicable
    9846d09ed695 clk: qcom: gcc-ipq6018: Use floor ops for sdcc clocks
    f2bbe499787a clk: qcom: camcc-sc7180: Add parent dependency to all camera GDSCs
    63d99af987f3 clk: qcom: mmcc-msm8974: remove oxili_ocmemgx_clk
    4b91e2516b31 clk: qcom: gcc: ipq5332: Use floor ops for SDCC clocks
    9ccc3c166ba2 interconnect: qcom: rpm: Don't use clk_get_optional for bus clocks anymore
    49a1c6023a07 interconnect: qcom: rpm: Rename icc provider num_clocks to num_bus_clocks
    aeb8ec010a29 serial: 8250: omap: Fix freeing of resources on failed register
    307909ae1b4a usb: dwc2: Fix some error handling paths
    1b0a2928d0a9 xhci: Improve the XHCI system resume time
    f849bec6963b USB: Extend pci resume function to handle PM events
    e5dd3979c655 cpufreq: tegra194: Fix an error handling path in tegra194_cpufreq_probe()
    2bef6a1b846a sh: j2: Use ioremap() to translate device tree address into kernel memory
    77b23bd5e264 f2fs: do not allow to defragment files have FI_COMPRESS_RELEASED
    a55fa7ba3711 dt-bindings: power: reset: qcom-pon: Only allow reboot-mode pre-pmk8350
    884756f0203f w1: fix loop in w1_fini()
    fe64b9c6c847 w1: w1_therm: fix locking behavior in convert_t
    b056bd52c8fd x86/efi: Make efi_set_virtual_address_map IBT safe
    1403a899153a arm64: sme: Use STR P to clear FFR context field in streaming SVE mode
    bb62148ebd30 ksmbd: avoid field overflow warning
    b9f3c6febfe0 smb: client: fix shared DFS root mounts with different prefixes
    7546b904dedd smb: client: fix broken file attrs with nodfs mounts
    a5133dbecf5b cifs: do all necessary checks for credits within or before locking
    d017880782cf cifs: prevent use-after-free by freeing the cfile later
    88ece45ab8a0 efi/libstub: Disable PCI DMA before grabbing the EFI memory map
    a8c2d8d32421 kbuild: deb-pkg: remove the CONFIG_MODULES check in buildeb
    6061ac50f1e0 kbuild: builddeb: always make modules_install, to install modules.builtin*
    e079d77347be tools/testing/cxl: Fix command effects for inject/clear poison
    8c6fdfb117fc cxl/region: Fix state transitions after reset failure
    78be41752ac5 cxl/region: Flag partially torn down regions as unusable
    b84a56efb527 cxl/region: Move cache invalidation before region teardown, and before setup
    99c515d032df kbuild: Disable GCOV for *.mod.o
    cb2d6b93a09b kbuild: Fix CFI failures with GCOV
    7e1f98905562 SUNRPC: Fix UAF in svc_tcp_listen_data_ready()
    532da3822a4f btrfs: do not BUG_ON() on tree mod log failure at balance_level()
    8ce9139aea5e btrfs: fix race when deleting free space root from the dirty cow roots list
    3b25cadc7975 mmc: block: ioctl: do write error check for spi
    baf4016ad493 block: increment diskseq on all media change events
    1e83e1db9c26 block: change all __u32 annotations to __be32 in affs_hardblocks.h
    dd976502acb1 block: add overflow checks for Amiga partition support
    ff5dbe898e6d block: fix signed int overflow in Amiga partition support
    ca456dfa515c apparmor: fix: kzalloc perms tables for shared dfas
    773ccad902f6 ALSA: pcm: Fix potential data race at PCM memory allocation helpers
    21d0ab5dc2bf ALSA: jack: Fix mutex call in snd_jack_report()
    84772bc5ca7a ALSA: hda/realtek: Add quirk for Clevo NPx0SNx
    fdfe750bedef ALSA: hda/realtek: Enable mute/micmute LEDs and limit mic boost on EliteBook
    8e246189dc74 hwrng: st - keep clock enabled while hwrng is registered
    e68183e2f232 dax/kmem: Pass valid argument to memory_group_register_static
    60ef1f64d35c dax: Introduce alloc_dev_dax_id()
    7310b84821f0 dax: Fix dax_mapping_release() use after free
    3b4c15171c3c SMB3: Do not send lease break acknowledgment if all file handles have been closed
    9591e55b6c80 NFSv4.1: freeze the session table upon receiving NFS4ERR_BADSESSION
    741cff5f586b NFSv4.2: fix wrong shrinker_id
    ee238856c397 crypto: qat - unmap buffers before free for RSA
    61bfff855343 crypto: qat - unmap buffer before free for DH
    97046c12f7fb ARC: define ASM_NL and __ALIGN(_STR) outside #ifdef __ASSEMBLY__ guard
    8b2e77050b91 modpost: fix off by one in is_executable_section()
    aec344a21244 scripts/mksysmap: Fix badly escaped '$'
    e539c53e3f73 dt-bindings: qcom-qce: Fix compatible combinations for SM8150 and IPQ4019 SoCs
    a4e975d4245a crypto: jitter - correct health test during initialization
    83d83e6edffd crypto: marvell/cesa - Fix type mismatch warning
    8477b033fec8 modpost: fix section mismatch message for R_ARM_{PC24,CALL,JUMP24}
    ec2791b3e500 modpost: fix section mismatch message for R_ARM_ABS32
    caa3bcac6f74 crypto: nx - fix build warnings when DEBUG_FS is not enabled
    0fa2f933f431 modpost: remove broken calculation of exception_table_entry size
    2fc91f156b3f hwrng: virtio - Fix race on data_avail and actual data
    e23972c9d94a vfio/mdev: Move the compat_class initialization to module init
    d1a21644254a PCI: vmd: Fix uninitialized variable usage in vmd_enable_domain()
    d66a530c1034 PCI: endpoint: functions/pci-epf-test: Fix dma_chan direction
    f07d1dcb3620 PCI: endpoint: Fix a Kconfig prompt of vNTB driver
    764b6d8aa77c riscv: hibernate: remove WARN_ON in save_processor_state
    52fbbd37efe1 perf test: Set PERF_EXEC_PATH for script execution
    2509e4d1e0f4 powerpc/mm/dax: Fix the condition when checking if altmap vmemap can cross-boundary
    b43bab8daf6d powerpc/book3s64/mm: Fix DirectMap stats in /proc/meminfo
    489026d57a3c riscv: uprobes: Restore thread.bad_cause
    616464ae2e17 platform/x86:intel/pmc: Update maps for Meteor Lake P/M platforms
    d17d238b617d PCI: qcom: Disable write access to read only registers for IP v2.9.0
    d7649e4d23e1 PCI: qcom: Use DWC helpers for modifying the read-only DBI registers
    88b6ad86a219 riscv: hibernation: Remove duplicate call of suspend_restore_csrs
    cc46085350cc powerpc: update ppc_save_regs to save current r1 in pt_regs
    72990144e17e powerpc/powernv/sriov: perform null check on iov before dereferencing iov
    32a76e5f5fe1 scsi: ufs: core: mcq: Fix the incorrect OCS value for the device command
    5b4af2dbf125 scsi: ufs: core: Remove a ufshcd_add_command_trace() call
    0ffde301f3a6 perf stat: Reset aggr stats for each run
    8a1fa202f47f pinctrl: at91-pio4: check return value of devm_kasprintf()
    06478a293d52 pinctrl: microchip-sgpio: check return value of devm_kasprintf()
    27d9a7585b59 pinctrl: freescale: Fix a memory out of bounds when num_configs is 1
    421cd1544480 powerpc/64s: Fix VAS mm use after free
    f3daf02a41e3 perf tool x86: Fix perf_env memory leak
    2e3cce0cabdc perf tool x86: Consolidate is_amd check into single function
    419aa1b9bba4 platform/x86/dell/dell-rbtn: Fix resources leaking on error path
    0c530479b472 perf tests task_analyzer: Skip tests if no libtraceevent support
    e1748bd615e5 perf tests task_analyzer: Fix bad substitution ${$1}
    feb0710a2272 perf metric: Fix no group check
    b52376bb693d perf dwarf-aux: Fix off-by-one in die_get_varname()
    f9a52a0ea085 platform/x86/intel/pmc/mtl: Put devices in D3 during resume
    7826682b7771 platform/x86/intel/pmc: Add resume callback
    9105734f764e platform/x86: thinkpad_acpi: Fix lkp-tests warnings for platform profiles
    8dd306534d89 perf script: Fix allocation of evsel->priv related to per-event dump files
    4dac25939fd4 powerpc/signal32: Force inlining of __unsafe_save_user_regs() and save_tm_user_regs_unsafe()
    227db6699ca5 powerpc/interrupt: Don't read MSR from interrupt_exit_kernel_prepare()
    5da37177faa8 kcsan: Don't expect 64 bits atomic builtins from 32 bits architectures
    ee16d015d84a pinctrl: npcm7xx: Add missing check for ioremap
    cc76bc8db5ef pinctrl:sunplus: Add check for kmalloc
    a750ee082505 platform/x86: think-lmi: Correct NVME password handling
    ef6fd4d4ec3b platform/x86: think-lmi: Correct System password interface
    7e03cd33eb2e platform/x86: think-lmi: mutex protection around multiple WMI calls
    b6462fafbe9e platform/x86:intel/pmc: Remove Meteor Lake S platform support
    1a434752853e pinctrl: cherryview: Return correct value if pin in push-pull mode
    ef322de03241 perf bench: Add missing setlocale() call to allow usage of %'d style formatting
    db103b83658c pinctrl: tegra: Duplicate pinmux functions table
    49234a401e16 scsi: ufs: core: Fix handling of lrbp->cmd
    1aba31fdb391 scsi: ufs: core: Increase the START STOP UNIT timeout from one to ten seconds
    6fb6b331cdf2 scsi: lpfc: Revise NPIV ELS unsol rcv cmpl logic to drop ndlp based on nlp_state
    5cf374018fc5 PCI: Add pci_clear_master() stub for non-CONFIG_PCI
    0e5279a5c336 scsi: ufs: Declare ufshcd_{hold,release}() once
    8b782acacd72 pinctrl: sunplus: Add check for kmalloc
    989923ece797 PCI: ftpci100: Release the clock resources
    f91d865682de perf evsel: Don't let for_each_group() treat the head of the list as one of its nodes
    d9316899666f PCI: pciehp: Cancel bringup sequence if card is not present
    496f79fe9d21 pinctrl: at91: fix a couple NULL vs IS_ERR() checks
    5ac55531d43a scsi: 3w-xxxx: Add error handling for initialization failure in tw_probe()
    4203722d51af PCI/ASPM: Disable ASPM on MFD function removal to avoid use-after-free
    f7d9d37d3602 platform/x86: lenovo-yogabook: Set default keyboard backligh brightness on probe()
    33858ecc7a06 platform/x86: lenovo-yogabook: Reprobe devices on remove()
    452a43b94920 platform/x86: lenovo-yogabook: Fix work race on remove()
    bdd1eaddd2eb pinctrl: bcm2835: Handle gpiochip_add_pin_range() errors
    271c9b2eb601 scsi: qedf: Fix NULL dereference in error handling
    1c1e48042e32 PCI: vmd: Reset VMD config register between soft reboots
    a98eab570d05 PCI: cadence: Fix Gen2 Link Retraining process
    dbe65261fe13 iommufd: Call iopt_area_contig_done() under the lock
    19d93648142a iommufd: Do not access the area pointer after unlocking
    3373bf97d1e3 ASoC: amd: acp: clear pdm dma interrupt mask
    1464588b5aba ARM: dts: lan966x: kontron-d10: fix SPI CS
    723dec22a335 ARM: dts: lan966x: kontron-d10: fix board reset
    efbbda79b288 clk: Fix memory leak in devm_clk_notifier_register()
    1a0078fd910c ASoC: imx-audmix: check return value of devm_kasprintf()
    1ecdc55e5cd9 ovl: update of dentry revalidate flags after copy up
    9e566a6b1f42 drivers: meson: secure-pwrc: always enable DMA domain
    f8f1d6cee518 clk: clocking-wizard: check return value of devm_kasprintf()
    99c926e63488 clk: ti: clkctrl: check return value of kasprintf()
    9fd4fc509051 clk: keystone: sci-clk: check return value of kasprintf()
    65bb582bda33 clk: si5341: free unused memory on probe failure
    b5bea998a2b0 clk: si5341: check return value of {devm_}kasprintf()
    a9d29dc9ba70 clk: si5341: return error if one synth clock registration fails
    cc01bae3d41b clk: cdce925: check return value of kasprintf()
    7f01290efc69 clk: vc5: check memory returned by kasprintf()
    5c4a865c39b9 clk: mediatek: clk-mt8173-apmixedsys: Fix iomap not released issue
    8c07547b50bc clk: mediatek: clk-mt8173-apmixedsys: Fix return value for of_iomap() error
    42cefcc44acf clk: mediatek: clk-mtk: Grab iomem pointer for divider clocks
    7174300e12ea drm/msm/dpu: correct MERGE_3D length
    4a76910c702b drm/msm/dpu: fix sc7280 and sc7180 PINGPONG done interrupts
    f955651c9448 drm/msm/dpu: Disable pingpong TE on DPU 5.0.0 and above
    82aaea40aa25 drm/msm/dpu: Move autorefresh disable from CMD encoder to pingpong
    d06fc6c07bd3 drm/msm/dpu: Drop unused poll_timeout_wr_ptr PINGPONG callback
    9f40de4df625 drm/amdgpu: Fix usage of UMC fill record in RAS
    0cae3d00303f drm/amdgpu: Fix memcpy() in sienna_cichlid_append_powerplay_table function.
    233e9bc70041 arm64: dts: mt7986: increase bl2 partition on NAND of Bananapi R3
    aaf2d638460a arm64: dts: mediatek: mt8192: Fix CPUs capacity-dmips-mhz
    e9466f96772b arm64: dts: mediatek: Add cpufreq nodes for MT8192
    ca47d0dc0096 drm/msm/dp: Free resources after unregistering them
    2fde37445807 drm/msm/dp: Drop aux devices together with DP controller
    ba3aa378df75 drm/msm/dsi: Remove incorrect references to slice_count
    76870037cd60 drm/msm/dpu: Fix slice_last_group_size calculation
    d28df937e473 drm/msm/dpu: do not enable color-management if DSPPs are not available
    228da1fa1244 ALSA: ac97: Fix possible NULL dereference in snd_ac97_mixer
    5513409e077d arm64: dts: ti: k3-am69-sk: Fix main_i2c0 alias
    0857373fb663 arm64: dts: ti: k3-j784s4: Fix wakeup pinmux range and pinctrl node offsets
    cb23a546ea20 arm64: dts: ti: k3-j784s4-evm: Fix main_i2c0 alias
    dc01703241aa arm64: dts: ti: k3-j721e-beagleboneai64: Fix mailbox node status
    4e59e355f9fc clk: tegra: tegra124-emc: Fix potential memory leak
    f078a65ebf93 clk: clocking-wizard: Fix Oops in clk_wzrd_register_divider()
    b75a0dae88ea clk: bcm: rpi: Fix off by one in raspberrypi_discover_clocks()
    38410af6e45a arm64: dts: qcom: sm8550: Add missing interconnect path to USB HC
    968237d7dbe4 arm64: dts: qcom: sm8250-edo: Panel framebuffer is 2.5k instead of 4k
    5ad3d270816d arm64: dts: qcom: sm8550: Flush RSC sleep & wake votes
    4eccb0576bc2 arm64: dts: qcom: sdm845: Flush RSC sleep & wake votes
    07810010445d arm64: dts: qcom: sdm670: Flush RSC sleep & wake votes
    bbf82306d3b8 arm64: dts: qcom: qdu1000: Flush RSC sleep & wake votes
    47234e19b008 clk: mediatek: fix of_iomap memory leak
    92ce7629a11a clk: imx: clk-imx8mp: improve error handling in imx8mp_clocks_probe()
    d17c16a2b2a6 clk: imx93: fix memory leak and missing unwind goto in imx93_clocks_probe
    d4fa5e47af1e clk: imx: clk-imx8mn: fix memory leak in imx8mn_clocks_probe
    02e54db221bb clk: imx: clk-imxrt1050: fix memory leak in imxrt1050_clocks_probe
    ae86e657d587 clk: imx: composite-8m: Add imx8m_divider_determine_rate
    1635eb05c310 RDMA/bnxt_re: Avoid calling wake_up threads from spin_lock context
    50d77c3739b2 RDMA/bnxt_re: wraparound mbox producer index
    e2cc08870b82 drm/msm/a5xx: really check for A510 in a5xx_gpu_init
    6ffafbdca65d drm/msm/a6xx: don't set IO_PGTABLE_QUIRK_ARM_OUTER_WBWA with coherent SMMU
    bc6dbf34dc4f amdgpu: validate offset_in_bo of drm_amdgpu_gem_va
    87a21a850d22 RDMA/rxe: Fix access checks in rxe_check_bind_mw
    c62adbe98d09 HID: uclogic: Modular KUnit tests should not depend on KUNIT=y
    4968eec706d9 drm/radeon: fix possible division-by-zero errors
    13bd97c3488b drm/amd/display: Fix artifacting on eDP panels when engaging freesync video mode
    ca4da6c91298 soc: mediatek: SVS: Fix MT8192 GPU node name
    069cfe458fef drm/amdkfd: Fix potential deallocation of previously deallocated memory.
    355d3403526f drm/amd/display: Fix a test dml32_rq_dlg_get_rq_reg()
    80d135aeeb1c drm/amd/display: Fix a test CalculatePrefetchSchedule()
    4524cd18e607 clk: Export clk_hw_forward_rate_request()
    ebbdf35a23e9 ARM: dts: BCM5301X: fix duplex-full => full-duplex
    732a1b28df84 hwmon: (pmbus/adm1275) Fix problems with temperature monitoring on ADM1272
    be5baef9e67b hwmon: (gsc-hwmon) fix fan pwm temperature scaling
    e13f413b410c ARM: dts: stm32: fix i2s endpoint format property for stm32mp15xx-dkx
    34cc2d955ee6 accel/habanalabs: fix gaudi2_get_tpc_idle_status() return
    73bd578a6187 ARM: dts: stm32: Fix audio routing on STM32MP15xx DHCOM PDK2
    1f161eef58ff arm64: dts: rockchip: Fix compatible for Bluetooth on rk3566-anbernic
    ef9adbdd17a9 Input: pm8941-powerkey - fix debounce on gen2+ PMICs
    861f5fcf895a arm64: dts: ti: k3-j7200: Fix physical address of pin
    ad1a932ea847 arm64: dts: rockchip: Assign ES8316 MCLK rate on rk3588-rock-5b
    b4e0f8df9ee4 drm/i915: No 10bit gamma on desktop gen3 parts
    be2caaed96c5 drm/i915/display: Make display responsible for probing its own IP
    6cebcb7244eb drm/i915/display: Move display runtime info to display structure
    60ad0bef4ae4 drm/i915: Convert INTEL_INFO()->display to a pointer
    52a4dcf7adf8 drm/i915/display: Move display device info to header under display/
    49f12dcba5bd drm/i915: hide mkwrite_device_info() better
    5e38c05d06f5 drm/i915: Fix limited range csc matrix
    dcb706a93aa9 dt-bindings: arm-smmu: Fix SC8280XP Adreno binding
    09ea1ae4a2ec fbdev: omapfb: lcd_mipid: Fix an error handling path in mipid_spi_probe()
    c5cf611bc2d0 drm/msm/dpu: always clear every individual pending flush mask
    39d4953eb157 drm/msm/dpu: set DSC flush bit correctly at MDP CTL flush register
    d3f8cec5bebc arm64: dts: renesas: ulcb-kf: Remove flow control for SCIF1
    750b4a2f223c ARM: dts: iwg20d-q7-common: Fix backlight pwm specifier
    7683db01d921 RDMA/hns: Fix hns_roce_table_get return value
    2c0445bc8dbd IB/hfi1: Fix wrong mmu_node used for user SDMA packet after invalidate
    71fb1072baba RDMA/irdma: avoid fortify-string warning in irdma_clr_wqes
    7471870af6c1 soc/fsl/qe: fix usb.c build errors
    a1abe77c3db6 ARM: dts: meson8: correct uart_B and uart_C clock references
    995a3881b043 ASoC: es8316: Do not set rate constraints for unsupported MCLKs
    8a2ca32f9df5 ASoC: es8316: Increment max value for ALC Capture Target Volume control
    9a707ac99e43 ARM: dts: qcom: apq8074-dragonboard: Set DMA as remotely controlled
    e88c77ed9a28 memory: brcmstb_dpfe: fix testing array offset after use
    e96627d8cafa ARM: dts: stm32: Shorten the AV96 HDMI sound card name
    d15921c876ca arm64: dts: mediatek: mt8195: Add mediatek,broken-save-restore-fw to cherry
    030f1a8d561e arm64: dts: mediatek: mt8192: Add mediatek,broken-save-restore-fw to asurada
    b43580648240 arm64: dts: mediatek: mt8183: Add mediatek,broken-save-restore-fw to kukui
    f4825ddd79fd arm64: dts: qcom: apq8096: fix fixed regulator name property
    9c6e6c80a476 arm64: dts: qcom: pm7250b: add missing spmi-vadc include
    dcdc7ad503f7 ARM: omap2: fix missing tick_broadcast() prototype
    fddc878c8cba ARM: ep93xx: fix missing-prototype warnings
    004132ef43b9 drm/panel: simple: fix active size for Ampire AM-480272H3TMQW-T01H
    c4644cc1082e drm: bridge: samsung-dsim: Fix PMS Calculator on imx8m[mnp]
    913821b25186 drm/bridge: ti-sn65dsi83: Fix enable/disable flow to meet spec
    bad174e652c1 arm64: dts: qcom: apq8016-sbc: Fix 1.8V power rail on LS expansion
    957e97b51ecf arm64: dts: qcom: apq8016-sbc: Fix regulator constraints
    ad88ee56a3b1 arm64: dts: qcom: sdm845-polaris: add missing touchscreen child node reg
    05b4bdd030da arm64: dts: qcom: sm8550: correct pinctrl unit address
    4846ab444b65 arm64: dts: qcom: sm8550: correct crypto unit address
    e1cb852a9046 arm64: dts: qcom: sm8350: correct USB phy unit address
    8d468bfdd823 arm64: dts: qcom: sm8350: correct PCI phy unit address
    09cc30c3249f arm64: dts: qcom: sm8350: correct DMA controller unit address
    6503a010d600 arm64: dts: qcom: sm6115: correct thermal-sensor unit address
    d82338b3f8b4 arm64: dts: qcom: sdm845: correct camss unit address
    2805d76a3acf arm64: dts: qcom: sdm630: correct camss unit address
    7aa761aad5f5 arm64: dts: qcom: msm8996: correct camss unit address
    8bcc1565662d arm64: dts: qcom: msm8994: correct SPMI unit address
    ed8be836eb12 arm64: dts: qcom: msm8976: correct MMC unit address
    97027b7777e9 arm64: dts: qcom: msm8953: correct WCNSS unit address
    402feaa3abb2 arm64: dts: qcom: msm8953: correct IOMMU unit address
    473024132d51 arm64: dts: qcom: msm8916: correct WCNSS unit address
    e85871a543cf arm64: dts: qcom: msm8916: correct MMC unit address
    16943d473757 arm64: dts: qcom: msm8916: correct camss unit address
    49ef21f3a322 arm64: dts: qcom: ipq6018: correct qrng unit address
    112a5b53d98b arm64: dts: qcom: pm8998: don't use GIC_SPI for SPMI interrupts
    64a724c183e9 ARM: dts: qcom: msm8974: do not use underscore in node name (again)
    941403ad8b6e ARM/musb: omap2: Remove global GPIO numbers from TUSB6010
    fb6ff53562e5 ARM: omap2: Rewrite WLAN quirk to use GPIO descriptors
    b954f4b5f253 ARM: omap2: Get USB hub reset GPIO from descriptor
    ad26fd4e08bf ARM/gpio: Push OMAP2 quirk down into TWL4030 driver
    8ba4b3fa2c1b ARM: omap1: Exorcise the legacy GPIO header
    f93c13d3a73e ARM: omap1: Make serial wakeup GPIOs use descriptors
    7a27d54138b6 ARM: omap1: Fix up the Nokia 770 board device IRQs
    feb0ac796091 ARM/mmc: Convert old mmci-omap to GPIO descriptors
    1a6d8fab9d4a Input: ads7846 - Convert to use software nodes
    de83f3df9b06 ARM: omap1: Remove reliance on GPIO numbers from SX1
    0142c99a06e8 ARM: omap1: Remove reliance on GPIO numbers from PalmTE
    2042e15fd73b ARM: omap1: Drop header on AMS Delta
    b64755e69629 ARM/mfd/gpio: Fixup TPS65010 regression on OMAP1 OSK1
    686a663a3644 drm/bridge: anx7625: Prevent endless probe loop
    aae6dc2cab03 arm64: dts: qcom: qrb4210-rb2: Fix CD gpio for SDHC2
    72dd3cdc9611 ARM: dts: gta04: Move model property out of pinctrl node
    355b82bc7726 clk: renesas: rzg2l: Fix CPG_SIPLL5_CLK1 register write
    552a393f0656 iommu/virtio: Return size mapped for a detached domain
    9455ed7835b5 iommu/virtio: Detach domain on endpoint release
    d5791f3cc107 drm/nouveau: dispnv50: fix missing-prototypes warning
    c4353c4ca8ba drm/msm/dpu: Set DPU_DATA_HCTL_EN for in INTF_SC7180_MASK
    e15009d2d0cf drm/msm/dpu: Use V4.0 PCC DSPP sub-block in SC7[12]80
    eeb66735307b drm/msm/dpu: fix cursor block register bit offset in msm8998 hw catalog
    db4df19bfd8b drm/msm/dsi: don't allow enabling 14nm VCO with unprogrammed rate
    fb1da1d86ef2 drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
    cb893e0b8dda RDMA/bnxt_re: Fix to remove an unnecessary log
    3aa57b906148 RDMA/bnxt_re: Remove a redundant check inside bnxt_re_update_gid
    4f51da7d48cf RDMA/bnxt_re: Use unique names while registering interrupts
    de84f808aa25 RDMA/bnxt_re: Fix to remove unnecessary return labels
    280fa4f026ad RDMA/bnxt_re: Disable/kill tasklet only if it is enabled
    3b4133ef9ee2 hwmon: (f71882fg) prevent possible division by zero
    0a719f0e4b6f clk: imx: scu: use _safe list iterator to avoid a use after free
    8c0a1d3c3b0c arm64: dts: qcom: ipq9574: Update the size of GICC & GICV regions
    09e82cb6f88f drm/bridge: tc358767: Switch to devm MIPI-DSI helpers
    1bd0ab15374a arm64: dts: microchip: sparx5: do not use PSCI on reference boards
    9445e468cf95 bus: ti-sysc: Fix dispc quirk masking bool variables
    d052f8853f86 ARM: dts: stm32: Move ethernet MAC EEPROM from SoM to carrier boards
    2ed5be414424 drm/vkms: Fix RGB565 pixel conversion
    559e23d20a53 drm: Add fixed-point helper to get rounded integer values
    3041ba47427e drm/vkms: isolate pixel conversion functionality
    017786dd1122 ASoC: Intel: sof_sdw: start set codec init function with an adr index
    edd1975f85d1 ASoC: Intel: sof_sdw: remove SOF_SDW_TGL_HDMI for MeteorLake devices
    3d88f9b2d3c9 ASoC: dt-bindings: mediatek,mt8188-afe: correct clock name
    256aace3a5d8 driver: soc: xilinx: use _safe loop iterator to avoid a use after free
    8d03a54a1311 drm/panel: sharp-ls043t1le01: adjust mode settings
    d02b618730c9 drm: sun4i_tcon: use devm_clk_get_enabled in `sun4i_tcon_init_clocks`
    4229dcd355d2 Input: adxl34x - do not hardcode interrupt trigger type
    61b825e1b47f clk: rs9: Fix .driver_data content in i2c_device_id
    d5a58079ba57 clk: vc7: Fix .driver_data content in i2c_device_id
    45f4f86a3c9b clk: vc5: Fix .driver_data content in i2c_device_id
    fae3a7663348 ARM: dts: meson8b: correct uart_B and uart_C clock references
    a8175f0a58e4 ARM: dts: BCM5301X: Drop "clock-names" from the SPI node
    b4dfa2f5c7c7 drm/vram-helper: fix function names in vram helper doc
    7e448ca8cd23 Input: tests - fix input_test_match_device_id test
    11f2abc0907a drm/bridge: tc358768: fix THS_TRAILCNT computation
    7b395f69524d drm/bridge: tc358768: fix TXTAGOCNT computation
    8b40dd957790 drm/bridge: tc358768: fix THS_ZEROCNT computation
    0b096afbc17a drm/bridge: tc358768: fix TCLK_TRAILCNT computation
    62294711b5d2 drm/bridge: tc358768: Add atomic_get_input_bus_fmts() implementation
    2ef6070193ca drm/bridge: tc358768: fix TCLK_ZEROCNT computation
    08180c6b8d1b drm/bridge: tc358768: fix PLL target frequency
    f8d8dd9e56d4 drm/bridge: tc358768: fix PLL parameters computation
    3a2be6a53595 drm/bridge: tc358768: always enable HS video mode
    ca9f55c85379 drm/bridge: ti-sn65dsi83: Fix enable error path
    d7a431e72802 Input: tests - modular KUnit tests should not depend on KUNIT=y
    92b4948fc558 Input: tests - fix use-after-free and refcount underflow in input_test_exit()
    28dc11949357 Input: cyttsp4_core - change del_timer_sync() to timer_shutdown_sync()
    6ce0bc87416e Input: drv260x - sleep between polling GO bit
    1fef2b720171 drm/bridge: it6505: Move a variable assignment behind a null pointer check in receive_timing_debugfs_show()
    d75eddb703f8 drm/i915/guc/slpc: Provide sysfs for efficient freq
    d87d3f9707ca drm/amd/display: Explicitly specify update type per plane info change
    e985e29f5284 radeon: avoid double free in ci_dpm_init()
    12068e0daebb drm/amd/display: fix is_timing_changed() prototype
    8fd83056c5ea drm/amd/display: Add logging for display MALL refresh setting
    3f6be5e1bc74 drm/amd/display: Unconditionally print when DP sink power state fails
    0f4773ce0502 drm/imx/lcdc: fix a NULL vs IS_ERR() bug in probe
    1e4e06b27cd9 netlink: Add __sock_i_ino() for __netlink_diag_dump().
    3f9e79f31e51 net: dsa: avoid suspicious RCU usage for synced VLAN-aware MAC addresses
    b83927b9562d ipvlan: Fix return value of ipvlan_queue_xmit()
    9c959671abc7 netfilter: nf_tables: fix underflow in chain reference counter
    b761dea6b8a2 netfilter: nf_tables: unbind non-anonymous set if rule construction fails
    75a9544ec92a netfilter: nf_conntrack_sip: fix the ct_sip_parse_numerical_param() return value.
    8c0980493bee netfilter: conntrack: dccp: copy entire header to stack buffer, not just basic one
    6adea070d940 lib/ts_bm: reset initial match offset for every block of text
    e5207c1d69b1 net: nfc: Fix use-after-free caused by nfc_llcp_find_local
    aba32b4c5811 sfc: fix crash when reading stats while NIC is resetting
    9b5fd0d08d7e ocfs2: Fix use of slab data with sendpage
    0f46802ed637 net: axienet: Move reset before 64-bit DMA detection
    58fa341327fd gtp: Fix use-after-free in __gtp_encap_destroy().
    414a09badb48 selftests: rtnetlink: remove netdevsim device after ipsec offload test
    536ad56748c7 sch_netem: fix issues in netem_change() vs get_dist_table()
    bc16fc63592c bonding: do not assume skb mac_header is set
    73862118bd9d netlink: do not hard code device address lenth in fdb dumps
    1556ba034b95 netlink: fix potential deadlock in netlink_set_err()
    723006bee372 net: stmmac: fix double serdes powerdown
    9e108c8516ff igc: Work around HW bug causing missing timestamps
    5ed04b95c7ae igc: Retrieve TX timestamp during interrupt handling
    8af2af0ef2fc igc: Check if hardware TX timestamping is enabled earlier
    f4e452c3477d igc: Fix race condition in PTP tx code
    97678c4718fa can: kvaser_pciefd: Set hardware timestamp on transmitted packets
    aca3328e46fe can: kvaser_pciefd: Add function to set skb hwtstamps
    bc3abed79bf3 can: length: fix bitstuffing count
    4033f4e25c6f bpf: Fix bpf socket lookup from tc/xdp to respect socket VRF bindings
    6b23751dc309 bpf: Call __bpf_sk_lookup()/__bpf_skc_lookup() directly via TC hookpoint
    d1c131a8f0c8 bpf: Factor out socket lookup functions for the TC hookpoint.
    122c1028b2e4 wifi: ath9k: convert msecs to jiffies where needed
    516e5634de3a wifi: iwlwifi: mvm: check only affected links
    16e603c36db1 wifi: iwlwifi: mvm: indicate HW decrypt for beacon protection
    32084eaa7479 mmc: Add MMC_QUIRK_BROKEN_SD_CACHE for Kingston Canvas Go Plus from 11/2019
    b44fa6a2045f watchdog/hardlockup: keep kernel.nmi_watchdog sysctl as 0444 if probe fails
    0fdf348651e3 watchdog/perf: adapt the watchdog_perf interface for async model
    f9b02a122b6b watchdog/hardlockup: rename some "NMI watchdog" constants/function
    e263c266781d watchdog/hardlockup: move perf hardlockup checking/panic to common watchdog.c
    a73123174bde watchdog/hardlockup: change watchdog_nmi_enable() to void
    629f2e61e3ed watchdog: remove WATCHDOG_DEFAULT
    4f2b64f6fed5 mm: move mm_count into its own cache line
    b9edd2ba46f4 wifi: ieee80211: Fix the common size calculation for reconfiguration ML
    ecf7090752a1 wifi: cfg80211: fix regulatory disconnect with OCB/NAN
    7eb9dacc39ba wifi: cfg80211: drop incorrect nontransmitted BSS update code
    392b6ad0aedc wifi: cfg80211: rewrite merging of inherited elements
    798472de63af wifi: mac80211: Remove "Missing iftype sband data/EHT cap" spam
    f71d0fc407dd wifi: iwlwifi: pcie: fix NULL pointer dereference in iwl_pcie_irq_rx_msix_handler()
    172a371b60b0 wifi: iwlwifi: pull from TXQs with softirqs disabled
    56b0c09d5180 wifi: iwlwifi: mvm: correctly access HE/EHT sband capa
    726bd484d500 wifi: iwlwifi: mvm: add support for Extra EHT LTF
    cbebaa71dacf wifi: mac80211: add helpers to access sband iftype data
    c36289e3c5e8 wifi: ath11k: Add missing hw_ops->get_ring_selector() for IPQ5018
    5fa5d8a9921d wifi: ath11k: Restart firmware after cold boot calibration for IPQ5018
    9485d7243357 wifi: ath11k: Add missing ops config for IPQ5018 in ath11k_ahb_probe()
    da336c8bc9d2 wifi: ath11k: Add missing check for ioremap
    69b1b7bbaaa9 rtnetlink: extend RTEXT_FILTER_SKIP_STATS to IFLA_VF_INFO
    ff800b0c4797 wifi: iwlwifi: fw: print PC register value instead of address
    3e3c05ab2f06 wifi: iwlwifi: mvm: Handle return value for iwl_mvm_sta_init
    51e34127f221 wifi: mac80211: Fix permissions for valid_links debugfs entry
    ae3c23788158 bpf: Verify scalar ids mapping in regsafe() using check_ids()
    919dcc2e958a bpf: Use scalar ids in mark_chain_precision()
    4351f6996639 wifi: ath9k: Fix possible stall on ath9k_txq_list_has_key()
    a4b5c41534c9 selftests/bpf: Fix invalid pointer check in get_xlated_program()
    e0ca90430d10 memstick r592: make memstick_debug_get_tpc_name() static
    9d409032d91e mmc: mediatek: Avoid ugly error message when SDIO wakeup IRQ isn't used
    aed47599b4d3 kexec: fix a memory leak in crash_shrink_memory()
    0977d6244fd1 watchdog/perf: more properly prevent false positives with turbo modes
    d6d30d4eb117 watchdog/perf: define dummy watchdog_update_hrtimer_threshold() on correct config
    fae50430abe5 selftests: cgroup: fix unexpected failure on test_memcg_low
    4ecf9c147213 ice: handle extts in the miscellaneous interrupt thread
    bf732fbbde8f wifi: rsi: Do not set MMC_PM_KEEP_POWER in shutdown
    b601468539c1 wifi: rsi: Do not configure WoWlan in shutdown hook if not enabled
    6f228aa0d7c4 spi: spi-geni-qcom: Do not do DMA map/unmap inside driver, use framework instead
    f6d60b61b7db soc: qcom: geni-se: Add interfaces geni_se_tx_init_dma() and geni_se_rx_init_dma()
    63b2a26ebd4b selftests/bpf: Fix check_mtu using wrong variable type
    e55f4fac48af wifi: mac80211: recalc min chandef for new STA links
    009c4bfaab44 wifi: iwlwifi: mvm: send time sync only if needed
    6860a1ac54eb tools/resolve_btfids: Fix setting HOSTCFLAGS
    d906d1b940b9 bpf: Make bpf_refcount_acquire fallible for non-owning refs
    f1263730f927 bpf: Fix __bpf_{list,rbtree}_add's beginning-of-node calculation
    8885bfcff915 bpf: Set kptr_struct_meta for node param to list and rbtree insert funcs
    85ed55cffb6e bpf: Remove anonymous union in bpf_kfunc_call_arg_meta
    a1c6a38931fe wifi: ath10k: Trigger STA disconnect after reconfig complete on hardware restart
    00139f8a0702 samples/bpf: xdp1 and xdp2 reduce XDPBUFSIZE to 60
    b8e2885ebccf wifi: rtw88: usb: silence log flooding error message
    be2a546c30fe wifi: ath9k: don't allow to overwrite ENDPOINT0 attributes
    3730b25d2816 wifi: ray_cs: Fix an error handling path in ray_probe()
    eb1adc0d9dfe wifi: wl3501_cs: Fix an error handling path in wl3501_probe()
    eb0eebfddaff wifi: atmel: Fix an error handling path in atmel_probe()
    9af2ef527b8a wifi: orinoco: Fix an error handling path in orinoco_cs_probe()
    cf8f2ced6486 wifi: orinoco: Fix an error handling path in spectrum_cs_probe()
    809e3b6af942 regulator: core: Streamline debugfs operations
    9fc289a4a2b7 regulator: core: Fix more error checking for debugfs_create_dir()
    982522df0d8a regulator: rk808: fix asynchronous probing
    56c144697557 selftests/bpf: Do not use sign-file as testcase
    6aa27775db63 bpf: Fix memleak due to fentry attach failure
    7879707f5118 bpf: Remove bpf trampoline selector
    fd2bb30e18d0 bpftool: JIT limited misreported as negative value on aarch64
    0b1a4ee53e8d nfc: llcp: fix possible use of uninitialized variable in nfc_llcp_send_connect()
    7d555fbb2f0a spi: dw: Round of n_bytes to power of 2
    6d902719dc3e bpf: Don't EFAULT for {g,s}setsockopt with wrong optlen
    31c630e57700 libbpf: fix offsetof() and container_of() to work with CO-RE
    04a4acef03bd sfc: release encap match in efx_tc_flow_free()
    2bcfe6c4009e sctp: add bpf_bypass_getsockopt proto callback
    f22fd486a999 wifi: mwifiex: Fix the size of a memory allocation in mwifiex_ret_802_11_scan()
    9ba1df0514c3 wifi: rtw88: unlock on error path in rtw_ops_add_interface()
    db779efd33e0 wifi: wilc1000: fix for absent RSN capabilities WFA testcase
    055ebc0c1ee0 spi: spi-geni-qcom: Correct CS_TOGGLE bit in SPI_TRANS_CFG
    7c08d1b0d1f7 samples/bpf: Fix buffer overflow in tcp_basertt
    bce2dfae26de wifi: rtw89: fix rtw89_read_chip_ver() for RTL8852B and RTL8851B
    660663763c72 bpf: fix propagate_precision() logic for inner frames
    41ad047df201 bpf: maintain bitmasks across all active frames in __mark_chain_precision
    bd81fbd4221f bpf: improve precision backtrack logging
    fc2778c42f99 bpf: encapsulate precision backtracking bookkeeping
    7e76a302ed06 libbpf: btf_dump_type_data_check_overflow needs to consider BTF_MEMBER_BITFIELD_SIZE
    75acec91aeaa wifi: ath9k: avoid referencing uninit memory in ath9k_wmi_ctrl_rx
    5678b979551b wifi: ath9k: fix AR9003 mac hardware hang check register offset calculation
    c82c1a4dbe2d igc: Enable and fix RX hash usage by netstack
    130ef25f7004 sched/core: Avoid multiple calling update_rq_clock() in __cfsb_csd_unthrottle()
    065c81ae5817 pstore/ram: Add check for kstrdup
    b02c26ccf6aa ima: Fix build warnings
    d19eecffa4a1 evm: Fix build warnings
    f9d43d2bf3eb evm: Complete description of evm_inode_setattr()
    1cea22f58577 locking/atomic: arm: fix sync ops
    9c8a0dd056fa reiserfs: Initialize sec->length in reiserfs_security_init().
    f2832652160c x86/mm: Fix __swp_entry_to_pte() for Xen PV guests
    97f0eabc9cab perf/ibs: Fix interface via core pmu events
    cca42d7bcc16 selftests/ftace: Fix KTAP output ordering
    bded12a58c9e kselftest: vDSO: Fix accumulation of uninitialized ret when CLOCK_REALTIME is undefined
    3461f979d4e8 tools/nolibc: ensure fast64 integer types have 64 bits
    6705a2ab8a66 x86/xen: Set MTRR state when running as Xen PV initial domain
    a23b0c61b777 x86/mtrr: Replace size_or_mask and size_and_mask with a much easier concept
    e170ba743539 x86/hyperv: Set MTRR state when running as SEV-SNP Hyper-V guest
    81a3b5a5dc02 x86/mtrr: Support setting MTRR state for software defined MTRRs
    780091fe14c6 x86/mtrr: Remove physical address size calculation
    29b1da4f90fc rcu/rcuscale: Stop kfree_scale_thread thread(s) after unloading rcuscale
    3b7f0fff95d4 rcu/rcuscale: Move rcu_scale_*() after kfree_scale_cleanup()
    ed621e24bbaa rcutorture: Correct name of use_softirq module parameter
    a6ea37d9a9bd rcu-tasks: Stop rcu_tasks_invoke_cbs() from using never-onlined CPUs
    fa502fbd3fad rcu: Make rcu_cpu_starting() rely on interrupts being disabled
    86daf6b55a5e kunit: tool: undo type subscripts for subprocess.Popen
    95fd35257907 thermal/drivers/qoriq: Only enable supported sensors
    ec932415e735 thermal/drivers/sun8i: Fix some error handling paths in sun8i_ths_probe()
    34832f584bc8 thermal/drivers/qcom/tsens-v0_1: Add mdm9607 correction offsets
    a4f5546a7ceb thermal/drivers/qcom/tsens-v0_1: Fix mdm9607 slope values
    024b46be9eac thermal/drivers/qcom/tsens-v0_1: Add support for MSM8226
    07d48893997e cpufreq: intel_pstate: Fix energy_performance_preference for passive
    3b6e0e4f3153 ARM: 9303/1: kprobes: avoid missing-declaration warnings
    dc2f28e1c7ac PM: domains: Move the verification of in-params from genpd_add_device()
    a6801b38cba9 powercap: RAPL: Fix CONFIG_IOSF_MBI dependency
    fb27405d60fc powercap: RAPL: fix invalid initialization for pl4_supported field
    48a7c3695942 APEI: GHES: correctly return NULL for ghes_get_devices()
    480d56db8dca perf/arm_cspmu: Fix event attribute type
    924c74c69309 perf: arm_cspmu: Set irq affinitiy only if overflow interrupt is used
    b64569897d86 drivers/perf: hisi: Don't migrate perf to the CPU going to teardown
    39b36d9243be x86/tdx: Fix race between set_memory_encrypted() and load_unaligned_zeropad()
    5e9e4b386c48 x86/mm: Allow guest.enc_status_change_prepare() to fail
    dafc70ae6bea drivers/perf: apple_m1: Force 63bit counters for M2 CPUs
    a127be4b853e perf/arm-cmn: Fix DTC reset
    353b83a403bb PM: domains: fix integer overflow issues in genpd_parse_state()
    99744200f28b clocksource/drivers/cadence-ttc: Fix memory leak in ttc_timer_probe
    eb287ef38426 blk-mq: don't insert passthrough request into sw queue
    ad87179a2088 btrfs: fix file_offset for REQ_BTRFS_ONE_ORDERED bios that get split
    82e3a2913bee btrfs: don't treat zoned writeback as being from an async helper thread
    558c1b78d77d btrfs: only call __extent_writepage_io from extent_write_locked_range
    52f788a170e3 btrfs: don't fail writeback when allocating the compression context fails
    0e0e5d0b4768 btrfs: fix range_end calculation in extent_write_locked_range
    6db5fffba531 btrfs: submit a writeback bio per extent_buffer
    aea3cea8ea96 btrfs: return bool from lock_extent_buffer_for_io
    20409d5140a7 btrfs: don't use btrfs_bio_ctrl for extent buffer reading
    110b32eea2a0 btrfs: always read the entire extent_buffer
    19920ea770bb tracing/timer: Add missing hrtimer modes to decode_hrtimer_mode().
    7fe63c29cb05 tick/rcu: Fix bogus ratelimit condition
    c1968bb8a286 posix-timers: Prevent RT livelock in itimer_delete()
    a25bf14dfa69 erofs: fix compact 4B support for 16k block size
    eba69ca6aa2d svcrdma: Prevent page release when nothing was received
    58603214594c irqchip/jcore-aic: Fix missing allocation of IRQ descriptors
    927a892ff238 irqchip/stm32-exti: Fix warning on initialized field overwritten
    32d07a6f5708 splice: don't call file_accessed in copy_splice_read
    2b99ee760e6e irqchip/loongson-eiointc: Fix irq affinity setting during resume
    942e81650b81 block: fix blktrace debugfs entries leakage
    fbbe89866799 md/raid1-10: submit write io directly if bitmap is not enabled
    18ce03c75e4e md/raid1-10: factor out a helper to submit normal write
    b2ac26d2987d md/raid1-10: factor out a helper to add bio to plug
    43c08b756945 md/raid10: fix io loss while replacement replace rdev
    144c7fd008e0 md/raid10: fix null-ptr-deref of mreplace in raid10_sync_request
    e83cb411aa1c md/raid10: fix wrong setting of max_corr_read_errors
    138ad092e9c9 md/raid10: fix overflow of md/safe_mode_delay
    bea301c04611 md/raid10: check slab-out-of-bounds in md_bitmap_get_counter
    2ed9a89192e3 nvme-core: fix dev_pm_qos memleak
    282416eaf5cc nvme-core: add missing fault-injection cleanup
    6ec30a627899 nvme-core: fix memory leak in dhchap_ctrl_secret
    6a5eda501795 nvme-core: fix memory leak in dhchap_secret_store
    e9b824ca7a55 lockd: drop inappropriate svc_get() from locked_get()
    3cace7e4ac7a blk-mq: fix potential io hang by wrong 'wake_batch'
    cef10b632e83 virt: sevguest: Add CONFIG_CRYPTO dependency
    abbce7f82613 blk-cgroup: Reinit blkg_iostat_set after clearing in blkcg_reset_stats()
    fe3592a1fc67 x86/sev: Fix calculation of end address based on number of pages
    3376c4fe2db4 blk-iocost: use spin_lock_irqsave in adjust_inuse_and_calc_cost
    3cfecc78ff8e fsverity: don't use bio_first_page_all() in fsverity_verify_bio()
    636d815cc35a fsverity: use shash API instead of ahash API
    b646da604aaa x86/resctrl: Only show tasks' pid in current pid namespace
    10c2b98a40d9 erofs: kill hooked chains to avoid loops on deduplicated compressed images
    0a29084050fb splice: Fix filemap_splice_read() to use the correct inode
    16398b4638b5 block/rq_qos: protect rq_qos apis with a new lock
    d2e52518a161 block: Fix the type of the second bdev_op_is_zoned_write() argument
    f2c4eff13173 blk-mq: don't queue plugged passthrough requests into scheduler
    79769887fd04 s390/kasan: fix insecure W+X mapping warning
    b953ddcbb1bb fs: pipe: reveal missing function protoypes
    4538616b518d Revert "drm/amd/display: edp do not add non-edid timings"
    f59fcf798719 iio: accel: fxls8962af: fixup buffer scan element type
    04d566faefb6 iio: accel: fxls8962af: errata bug only applicable for FXLS8962AF
    90d8789805d4 iio: adc: ad7192: Fix internal/external clock selection
    30e469ad6a5b iio: adc: ad7192: Fix null ad7192_state pointer access
    17459c67841a iio: addac: ad74413: don't set DIN_SINK for functions other than digital input
    2fb980d751ae dt-bindings: iio: ad7192: Add mandatory reference voltage source
    8b36533ca65d extcon: usbc-tusb320: Unregister typec port on driver removal
    82187460347a phy: tegra: xusb: Clear the driver reference in usb-phy dev
    fd4173920c27 usb: dwc3: gadget: Propagate core init errors to UDC during pullup
    39fddb00547d USB: serial: option: add LARA-R6 01B PIDs
    25e73018b409 start_kernel: Add __no_stack_protector function attribute

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 4d0fc03ef0..35fca3c6f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "917d160a84f61aada28d09f5afc04d6451fa52a0"
-SRCREV_meta ?= "eab54df7b727b239c88d29a29357dbbaca8ca1f7"
+SRCREV_machine ?= "8df85ca490c0935166bf1e37c31a15cfa67fb367"
+SRCREV_meta ?= "6ccd1bc02651f0132a3e56c4fcf8595886de3fcc"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.4.3"
+LINUX_VERSION ?= "6.4.6"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index ca725c42d4..05de2de9ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.4.inc
 
-LINUX_VERSION ?= "6.4.3"
+LINUX_VERSION ?= "6.4.6"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "dee78ad1963cff9c063fba486d43fc9670285883"
-SRCREV_meta ?= "eab54df7b727b239c88d29a29357dbbaca8ca1f7"
+SRCREV_machine ?= "053a6a41fef3617dc142190a52b05e6ba4e13c58"
+SRCREV_meta ?= "6ccd1bc02651f0132a3e56c4fcf8595886de3fcc"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 322ca2a62c..89a584f6eb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "aa7642358697dc9be32c4563a3d950f257a3f2ed"
-SRCREV_machine:qemuarm64 ?= "dee78ad1963cff9c063fba486d43fc9670285883"
-SRCREV_machine:qemuloongarch64 ?= "dee78ad1963cff9c063fba486d43fc9670285883"
-SRCREV_machine:qemumips ?= "8a3ac37b45e7dcc98d28ab3920309340202272d9"
-SRCREV_machine:qemuppc ?= "dee78ad1963cff9c063fba486d43fc9670285883"
-SRCREV_machine:qemuriscv64 ?= "dee78ad1963cff9c063fba486d43fc9670285883"
-SRCREV_machine:qemuriscv32 ?= "dee78ad1963cff9c063fba486d43fc9670285883"
-SRCREV_machine:qemux86 ?= "dee78ad1963cff9c063fba486d43fc9670285883"
-SRCREV_machine:qemux86-64 ?= "dee78ad1963cff9c063fba486d43fc9670285883"
-SRCREV_machine:qemumips64 ?= "144ff37fee7f0499574d5b508e4db82234f38fec"
-SRCREV_machine ?= "dee78ad1963cff9c063fba486d43fc9670285883"
-SRCREV_meta ?= "eab54df7b727b239c88d29a29357dbbaca8ca1f7"
+SRCREV_machine:qemuarm ?= "947101803b09cac13712ffa204c7ece607637847"
+SRCREV_machine:qemuarm64 ?= "053a6a41fef3617dc142190a52b05e6ba4e13c58"
+SRCREV_machine:qemuloongarch64 ?= "053a6a41fef3617dc142190a52b05e6ba4e13c58"
+SRCREV_machine:qemumips ?= "799410b270489281147c70347226ea5cefd97d02"
+SRCREV_machine:qemuppc ?= "053a6a41fef3617dc142190a52b05e6ba4e13c58"
+SRCREV_machine:qemuriscv64 ?= "053a6a41fef3617dc142190a52b05e6ba4e13c58"
+SRCREV_machine:qemuriscv32 ?= "053a6a41fef3617dc142190a52b05e6ba4e13c58"
+SRCREV_machine:qemux86 ?= "053a6a41fef3617dc142190a52b05e6ba4e13c58"
+SRCREV_machine:qemux86-64 ?= "053a6a41fef3617dc142190a52b05e6ba4e13c58"
+SRCREV_machine:qemumips64 ?= "6b9fb788ba68ef4f89af9394eead8222f39b792e"
+SRCREV_machine ?= "053a6a41fef3617dc142190a52b05e6ba4e13c58"
+SRCREV_meta ?= "6ccd1bc02651f0132a3e56c4fcf8595886de3fcc"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "160f4124ea8b4cd6c86867e111fa55e266345a16"
+SRCREV_machine:class-devupstream ?= "79562f63d621517795c125092620cf4e5778ad44"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.4/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.4.3"
+LINUX_VERSION ?= "6.4.6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


