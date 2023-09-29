Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1775E728EE
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:05:05 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.27817.1696017903635221080
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:05:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nm2LQUWD;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-77063481352so45755585a.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696017902; x=1696622702; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ioyi9nuIo0Rt/z5SqAlgJK1pY8qmVfrKJS8i+6E7vFc=;
        b=Nm2LQUWDHfaesHKCKeFPVaQPF2pBE9/JzK4Ds1xWpwJnHU5pfCQ9rz+8ytW9gQcFFV
         5F3hCQGQEutpoUPLmk3ZAcY0b+gugOwqPE0rOxVCrr+28Ztv8OLSXXH629mYlS8i2fKP
         bbHspFefbmK6yxm2LGub43qoSB3ZijsnFxA4YBQX5Aw++4stHO2L+7Uv8gJcoI57ZzrI
         OY1Joat47c8xxiowYNOfJimLLc8pLwQ2L3RR57tJYpTxTx9KlR+2xmbkNnu8Xn5aZpfB
         Gji1HXAoow9ZpTpTyWPQlkvUiMpeTEiwdqvMFF5NNZbgTTbPY6gw9jXmgE+ON5ac7KXi
         qEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696017902; x=1696622702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ioyi9nuIo0Rt/z5SqAlgJK1pY8qmVfrKJS8i+6E7vFc=;
        b=UfjHHpcrFEM323iUswxYhkvvjItnTZK3XzB7u9DvEvCKeUiNdjs4Ez4HTmjW1bFBFR
         WMo/VWreBEGT6E7VNpQkJ+4+BdaiQ4FoIxbJ0Yx0UnA2UQh9N00k7UtCeDt7Hta88UAK
         Mauh8I2tKFNgmd5wYGYt5Nj4H6MD47l+hn+1zi1ldFi2HhpOicdwaS25aqVXMScQNltU
         G+IAArcCnJLP9WgL/1FH+VnvyumhWhDogzRjT/o8nJo2YSSRTm88VPoaQbPDeFRHY+ur
         3l1eGtBS3HNEyDlXWGteOTnbQwrTkInXvhca5PV8T3FFRJnk+YIzCWcHm6SRa6cw70dm
         XO2g==
X-Gm-Message-State: AOJu0YzUxrN+7Xi83MjbDfu74yIhdPYZRNuUSoSzZofvEVhghSBEhF7V
	RKVNh514Aig8StXfAdxbm1s6nv6XKLaCqw==
X-Google-Smtp-Source: AGHT+IGW+sZjnHOh+N7Nzo90Jb9tBXA0zwh8Iki89exSuXZYDhDVdj4uiVtKvBWd88o6u0jt2SSnxA==
X-Received: by 2002:a0c:e308:0:b0:656:33c7:dfff with SMTP id s8-20020a0ce308000000b0065633c7dfffmr6615070qvl.10.1696017902292;
        Fri, 29 Sep 2023 13:05:02 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t28-20020a0cb39c000000b0065cffe12ae9sm2115848qve.36.2023.09.29.13.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:05:01 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/10] linux-yocto/6.1: update to v6.1.55
Date: Fri, 29 Sep 2023 16:04:49 -0400
Message-Id: <febef2b8a6d45e0e3a74664795d78ab6151ae3ed.1696017123.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696017123.git.bruce.ashfield@gmail.com>
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 20:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188424

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    d23900f974e0 Linux 6.1.55
    0db211ec0f1d interconnect: Teach lockdep about icc_bw_lock order
    b93aeb6352b0 net/sched: Retire rsvp classifier
    4c6bb9158179 drm/amdgpu: fix amdgpu_cs_p1_user_fence
    45ea58f9dbf8 Revert "memcg: drop kmem.limit_in_bytes"
    4422080e777e drm/amd/display: fix the white screen issue when >= 64GB DRAM
    97d4186c3503 ext4: fix rec_len verify error
    89365b624af5 scsi: pm8001: Setup IRQs on resume
    c2cb422dca0b scsi: megaraid_sas: Fix deadlock on firmware crashdump
    890e1e5dd8ba ata: libahci: clear pending interrupt status
    a3517ee1d4e6 ata: libata: disallow dev-initiated LPM transitions to unsupported states
    30057f4add41 i2c: aspeed: Reset the i2c controller when timeout occurs
    8b0f7d55b22e tracefs: Add missing lockdown check to tracefs_create_dir()
    dcf3caeee432 nfsd: fix change_info in NFSv4 RENAME replies
    978b86fbdb2a selinux: fix handling of empty opts in selinux_fs_context_submount()
    2617afde0c3d tracing: Have option files inc the trace array ref count
    6dc57c3a1d13 tracing: Have current_trace inc the trace array ref count
    a46bf337a20f tracing: Increase trace array ref count on enable and filter files
    0c2982b01501 tracing: Have event inject files inc the trace array ref count
    d65553fe5281 tracing: Have tracing_max_latency inc the trace array ref count
    1f89e6daf2b0 btrfs: check for BTRFS_FS_ERROR in pending ordered assert
    50e385d98b2a btrfs: release path before inode lookup during the ino lookup ioctl
    52932bbc6d4b btrfs: fix a compilation error if DEBUG is defined in btree_dirty_folio
    32247b9526bf btrfs: fix lockdep splat and potential deadlock after failure running delayed items
    d7b2abd87d1f dm: don't attempt to queue IO under RCU protection
    216eae7d7dea Revert "drm/amd: Disable S/G for APUs when 64GB or more host memory"
    98ea94f1627b md: Put the right device in md_seq_next
    f07c0bc27b0e nvme: avoid bogus CRTO values
    6a1d1365fafe io_uring/net: fix iter retargeting for selected buf
    e7dcf8339a0f ovl: fix incorrect fdput() on aio completion
    17854d92fa4a ovl: fix failed copyup of fileattr on a symlink
    6a84939cc7dd attr: block mode changes of symlinks
    3494a0066d8a Revert "SUNRPC: Fail faster on bad verifier"
    ba4f28a1d362 md/raid1: fix error: ISO C90 forbids mixed declarations
    2076b4b677c3 samples/hw_breakpoint: fix building without module unloading
    0dea06849924 x86/purgatory: Remove LTO flags
    2074cb608cb5 x86/boot/compressed: Reserve more memory for page tables
    038249ee7264 panic: Reenable preemption in WARN slowpath
    6069b9d8056d scsi: lpfc: Fix the NULL vs IS_ERR() bug for debugfs_create_file()
    1cd41d1669bc scsi: target: core: Fix target_cmd_counter leak
    dd8fce4e2da5 riscv: kexec: Align the kexeced kernel entry
    e9b8e266105a x86/ibt: Suppress spurious ENDBR
    03425393f41c selftests: tracing: Fix to unmount tracefs for recovering environment
    bc912eed8a1a scsi: qla2xxx: Fix NULL vs IS_ERR() bug for debugfs_create_dir()
    cbf226355ee3 drm: gm12u320: Fix the timeout usage for usb_bulk_msg()
    64561352c0f2 nvmet-tcp: pass iov_len instead of sg->length to bvec_set_page()
    5ee5c928dbb6 nvmet: use bvec_set_page to initialize bvecs
    00cf1dc13c1f block: factor out a bvec_set_page helper
    2174731a17b0 btrfs: compare the correct fsid/metadata_uuid in btrfs_validate_super
    31242daa108b btrfs: add a helper to read the superblock metadata_uuid
    44751b057c24 MIPS: Use "grep -E" instead of "egrep"
    8332311cd02a misc: fastrpc: Fix incorrect DMA mapping unmap request
    5a5641755ca8 misc: fastrpc: Prepare to dynamic dma-buf locking specification
    b4539ff7a48d dma-buf: Add unlocked variant of attachment-mapping functions
    6ca28642dd9a printk: Consolidate console deferred printing
    13ebf3ff08b0 printk: Keep non-panic-CPUs out of console lock
    ee42bfc791aa interconnect: Fix locking for runpm vs reclaim
    48aebbe801e7 kobject: Add sanity check for kset->kobj.ktype in kset_register()
    240571c49f76 media: pci: ipu3-cio2: Initialise timing struct to avoid a compiler warning
    91f400233edc usb: chipidea: add workaround for chipidea PEC bug
    8e3556f2f497 usb: ehci: add workaround for chipidea PORTSC.PEC bug
    48c135c30ad2 misc: open-dice: make OPEN_DICE depend on HAS_IOMEM
    a3c9315a8c78 serial: cpm_uart: Avoid suspicious locking
    4738bf8b2d36 scsi: target: iscsi: Fix buffer overflow in lio_target_nacl_info_show()
    6c440fec96af tools: iio: iio_generic_buffer: Fix some integer type and calculation
    826e9c91a203 usb: gadget: fsl_qe_udc: validate endpoint index for ch9 udc
    bbc9c3652708 usb: cdns3: Put the cdns set active part outside the spin lock
    96a0bf5827e7 media: pci: cx23885: replace BUG with error return
    257092cb544c media: tuners: qt1010: replace BUG_ON with a regular error
    b2a019ec8b33 scsi: lpfc: Abort outstanding ELS cmds when mailbox timeout error is detected
    dfcd3c010209 media: dvb-usb-v2: gl861: Fix null-ptr-deref in gl861_i2c_master_xfer
    6ab7ea4e17d6 media: az6007: Fix null-ptr-deref in az6007_i2c_xfer()
    14b94154a723 media: anysee: fix null-ptr-deref in anysee_master_xfer
    abb6fd93e05e media: af9005: Fix null-ptr-deref in af9005_i2c_xfer
    08dfcbd03b2b media: dw2102: Fix null-ptr-deref in dw2102_i2c_transfer()
    0143f282b15f media: dvb-usb-v2: af9035: Fix null-ptr-deref in af9035_i2c_master_xfer
    8ba9d91c8f21 media: mdp3: Fix resource leaks in of_find_device_by_node
    b78796126f80 PCI: fu740: Set the number of MSI vectors
    9318c3ae155b PCI: vmd: Disable bridge window for domain reset
    96f27ff73220 powerpc/pseries: fix possible memory leak in ibmebus_bus_init()
    ee378f45a70d ARM: 9317/1: kexec: Make smp stop calls asynchronous
    09066c19d945 PCI: dwc: Provide deinit callback for i.MX
    4de3a603010e jfs: fix invalid free of JFS_IP(ipimap)->i_imap in diUnmount
    2f7a36448f51 fs/jfs: prevent double-free in dbUnmount() after failed jfs_remount()
    035bc86fbf2b ext2: fix datatype of block number in ext2_xattr_set2()
    4f7d853b4590 md: raid1: fix potential OOB in raid1_remove_disk()
    4e547968a6e4 bus: ti-sysc: Configure uart quirks for k3 SoC
    4c743c1dd2ee drm/mediatek: dp: Change logging to dev for mtk_dp_aux_transfer()
    edddbdb8122e drm/exynos: fix a possible null-pointer dereference due to data race in exynos_drm_crtc_atomic_disable()
    a101b1bdd24a drm/amd/display: Blocking invalid 420 modes on HDMI TMDS for DCN314
    2c0f5b6972eb drm/amd/display: Blocking invalid 420 modes on HDMI TMDS for DCN31
    506d2ee72af2 drm/amd/display: Use DTBCLK as refclk instead of DPREFCLK
    2d027da82a96 ALSA: hda: intel-dsp-cfg: add LunarLake support
    cc4553c14fbb ASoC: Intel: sof_sdw: Update BT offload config for soundwire config
    d843bcc7adc9 ASoC: SOF: topology: simplify code to prevent static analysis warnings
    2ec715bf8816 drm/amd/display: Fix underflow issue on 175hz timing
    4630c27c5529 samples/hw_breakpoint: Fix kernel BUG 'invalid opcode: 0000'
    306c7903de14 arm64: dts: qcom: sm8250-edo: correct ramoops pmsg-size
    41ff904a7c46 arm64: dts: qcom: sm8150-kumano: correct ramoops pmsg-size
    23f9d0c67199 arm64: dts: qcom: sm6350: correct ramoops pmsg-size
    03499a685773 arm64: dts: qcom: sm6125-pdx201: correct ramoops pmsg-size
    766cc11e854e drm/edid: Add quirk for OSVR HDK 2.0
    8178dac6ee2c drm/bridge: tc358762: Instruct DSI host to generate HSE packets
    d5feaef143b6 libbpf: Free btf_vmlinux when closing bpf_object
    b9a175e3b250 wifi: mac80211_hwsim: drop short frames
    7e1cda5cf07f wifi: mac80211: check for station first in client probe
    d7b0fe3487d2 wifi: cfg80211: ocb: don't leave if not joined
    676a42341013 wifi: cfg80211: reject auth/assoc to AP with our address
    28b07e30bc14 netfilter: ebtables: fix fortify warnings in size_entry_mwt()
    7ae7a1378a11 wifi: mac80211: check S1G action frame size
    1c27b73ffa90 alx: fix OOB-read compiler warning
    a13c1f6c324a mmc: sdhci-esdhc-imx: improve ESDHC_FLAG_ERR010450
    b62e8838e988 tpm_tis: Resend command to recover from data transfer errors
    c2b226f223fb netlink: convert nlk->flags to atomic flags
    06e2b5ad72b6 Bluetooth: Fix hci_suspend_sync crash
    d3ad023a39f1 crypto: lib/mpi - avoid null pointer deref in mpi_cmp_ui()
    e5d94c98a72f net/ipv4: return the real errno instead of -EINVAL
    d5372a1f0cdf net: Use sockaddr_storage for getsockopt(SO_PEERNAME).
    ab0ae0af0a2d can: sun4i_can: Add support for the Allwinner D1
    4eb79abf910a can: sun4i_can: Add acceptance register quirk
    f04b40cb70a5 wifi: wil6210: fix fortify warnings
    5c8bbb79c7cb mt76: mt7921: don't assume adequate headroom for SDIO headers
    4f621fe1acac wifi: mwifiex: fix fortify warning
    2640a8e54f84 wifi: ath9k: fix printk specifier
    1800a27a3dba wifi: ath9k: fix fortify warnings
    5760a72b3060 ice: Don't tx before switchdev is fully configured
    ad58d7ebbf93 crypto: lrw,xts - Replace strlcpy with strscpy
    ac70101e5b94 devlink: remove reload failed checks in params get/set callbacks
    a0300edca5df selftests/nolibc: fix up kernel parameters support
    1ea7e4780727 ACPI: x86: s2idle: Catch multiple ACPI_TYPE_PACKAGE objects
    dc1d81ee9312 hw_breakpoint: fix single-stepping when using bpf_overflow_handler
    d42d342d3132 perf/imx_ddr: speed up overflow frequency of cycle
    9d9b5cbc12f4 perf/smmuv3: Enable HiSilicon Erratum 162001900 quirk for HIP08/09
    4cb0612cf260 ACPI: video: Add backlight=native DMI quirk for Lenovo Ideapad Z470
    9f10b4eb1b21 scftorture: Forgive memory-allocation failure if KASAN
    83ed0cdb6ae0 rcuscale: Move rcu_scale_writer() schedule_timeout_uninterruptible() to _idle()
    3b1107abdc2c kernel/fork: beware of __put_task_struct() calling context
    e1f686930ee4 ACPICA: Add AML_NO_OPERAND_RESOLVE flag to Timer
    34bff6d85001 locks: fix KASAN: use-after-free in trace_event_raw_event_filelock_lock
    28062cd6eda0 btrfs: output extra debug info if we failed to find an inline backref
    726deae613bc autofs: fix memory leak of waitqueues in autofs_catatonic_mode
    a356197db198 Linux 6.1.54
    77b49370a261 drm/amd/display: Fix a bug when searching for insert_above_mpcc
    3ce9925584c6 MIPS: Only fiddle with CHECKFLAGS if `need-compiler'
    e5b28ce127a6 kcm: Fix error handling for SOCK_DGRAM in kcm_sendmsg().
    a47db2caae27 ixgbe: fix timestamp configuration code
    6f0d85d501ab tcp: Fix bind() regression for v4-mapped-v6 non-wildcard address.
    63830afece93 tcp: Fix bind() regression for v4-mapped-v6 wildcard address.
    489ced24c7ca tcp: Factorise sk_family-independent comparison in inet_bind2_bucket_match(_addr_any).
    82f9af464e01 ipv6: Remove in6addr_any alternatives.
    8b6556c4c4e3 ipv6: fix ip6_sock_set_addr_preferences() typo
    d5d315cf7687 net: macb: fix sleep inside spinlock
    7aa720c350c7 net: macb: Enable PTP unicast
    7f4116c6f984 net/tls: do not free tls_rec on async operation in bpf_exec_tx_verdict()
    f72497c521c9 platform/mellanox: NVSW_SN2201 should depend on ACPI
    9d392695f323 platform/mellanox: mlxbf-pmc: Fix reading of unprogrammed events
    3f16330a4869 platform/mellanox: mlxbf-pmc: Fix potential buffer overflows
    3a45dcfb4d3c platform/mellanox: mlxbf-tmfifo: Drop jumbo frames
    30c8bbe1edba platform/mellanox: mlxbf-tmfifo: Drop the Rx packet if no more descriptors
    16989de75497 kcm: Fix memory leak in error path of kcm_sendmsg()
    2323397e5877 r8152: check budget for r8152_poll()
    44c8ffd482cc net: dsa: sja1105: block FDB accesses that are concurrent with a switch reset
    e74bd1b229cb net: dsa: sja1105: serialize sja1105_port_mcast_flood() with other FDB accesses
    d766cf9ddb97 net: dsa: sja1105: fix multicast forwarding working only for last added mdb entry
    538e7fe66c46 net: dsa: sja1105: propagate exact error code from sja1105_dynamic_config_poll_valid()
    9a3e7eca2b5b net: dsa: sja1105: hide all multicast addresses from "bridge fdb show"
    66e79c2f3a93 net:ethernet:adi:adin1110: Fix forwarding offload
    c281948cebcc net: ethernet: adi: adin1110: use eth_broadcast_addr() to assign broadcast address
    61866f7d814e hsr: Fix uninit-value access in fill_frame_info()
    ff5faed5f548 net: ethernet: mtk_eth_soc: fix possible NULL pointer dereference in mtk_hwlro_get_fdir_all()
    349638f7e5d3 net: ethernet: mvpp2_main: fix possible OOB write in mvpp2_ethtool_get_rxnfc()
    9dbbc87d5b61 net: stmmac: fix handling of zero coalescing tx-usecs
    70c8d17007dc net/smc: use smc_lgr_list.lock to protect smc_lgr_list.list iterate in smcr_port_add
    ef5d546b9d4f selftests: Keep symlinks, when possible
    cdd61a27fb0a kselftest/runner.sh: Propagate SIGTERM to runner child
    980f84454798 net: ipv4: fix one memleak in __inet_del_ifa()
    9acb294ebdfe kunit: Fix wild-memory-access bug in kunit_free_suite_set()
    cb30ff2adb10 drm/amdgpu: register a dirty framebuffer callback for fbcon
    b53fee19ec5e drm/amd/display: Remove wait while locked
    2d7a6fcb1f23 drm/amd/display: always switch off ODM before committing more streams
    c29bfda64b44 perf hists browser: Fix the number of entries for 'e' key
    f4618f131629 perf tools: Handle old data in PERF_RECORD_ATTR
    be69e8c8f5c2 perf test shell stat_bpf_counters: Fix test on Intel
    cb0940640d51 perf hists browser: Fix hierarchy mode header
    ec5409612255 MIPS: Fix CONFIG_CPU_DADDI_WORKAROUNDS `modules_install' regression
    60b5ef4cf82c KVM: SVM: Skip VMSA init in sev_es_init_vmcb() if pointer is NULL
    12645e623f28 KVM: SVM: Set target pCPU during IRTE update if target vCPU is running
    5b2b0535fa7a KVM: nSVM: Load L1's TSC multiplier based on L1 state, not L2 state
    6c1ecfea1daf KVM: nSVM: Check instead of asserting on nested TSC scaling support
    5c18ace750e4 KVM: SVM: Get source vCPUs from source VM for SEV-ES intrahost migration
    ba82001e4118 KVM: SVM: Don't inject #UD if KVM attempts to skip SEV guest insn
    3988692acc92 KVM: SVM: Take and hold ir_list_lock when updating vCPU's Physical ID entry
    ff536a96687c drm/amd/display: prevent potential division by zero errors
    e1769b1dfcae drm/amd/display: enable cursor degamma for DCN3+ DRM legacy gamma
    3388ca3a38a5 mtd: rawnand: brcmnand: Fix ECC level field setting for v7.2 controller
    31d42146fa6f mtd: rawnand: brcmnand: Fix potential false time out warning
    7c6ba20a0b9a mtd: spi-nor: Correct flags for Winbond w25q128
    45fe4ad7f439 mtd: rawnand: brcmnand: Fix potential out-of-bounds access in oob write
    a7e118fcc8b4 mtd: rawnand: brcmnand: Fix crash during the panic_write
    8bf2d4ca521d drm/mxsfb: Disable overlay plane in mxsfb_plane_overlay_atomic_disable()
    09974a1352d3 btrfs: use the correct superblock to compare fsid in btrfs_validate_super
    b692f7d1576b btrfs: zoned: re-enable metadata over-commit for zoned mode
    08daa38ca212 btrfs: set page extent mapped after read_folio in relocate_one_page
    91f6a538d625 btrfs: don't start transaction when joining with TRANS_JOIN_NOSTART
    f933a1c43b68 btrfs: free qgroup rsv on io failure
    cdc3ba292df8 btrfs: fix start transaction qgroup rsv double free
    59c38f050d9b btrfs: zoned: do not zone finish data relocation block group
    ef819c2f8e8a fuse: nlookup missing decrement in fuse_direntplus_link
    6694be119f63 ata: pata_ftide010: Add missing MODULE_DESCRIPTION
    ae73b94ad771 ata: sata_gemini: Add missing MODULE_DESCRIPTION
    1605f2709017 ata: pata_falcon: fix IO base selection for Q40
    cdd0d707357c ata: ahci: Add Elkhart Lake AHCI controller
    e93bc372dbc0 hwspinlock: qcom: add missing regmap config for SFPB MMIO implementation
    0649dc0af93a lib: test_scanf: Add explicit type cast to result initialization in test_number_prefix()
    980b592c6087 f2fs: avoid false alarm of circular locking
    1c64dbe8fa35 f2fs: flush inode if atomic file is aborted
    1fb3f1bbfdb5 ext4: fix memory leaks in ext4_fname_{setup_filename,prepare_lookup}
    03393857a95b ext4: add correct group descriptors and reserved GDT blocks to system zone
    20108975ec51 jbd2: correct the end of the journal recovery scan range
    dbafe636db41 jbd2: check 'jh->b_transaction' before removing it from checkpoint
    c5f23305f8b1 jbd2: fix checkpoint cleanup performance regression
    6ea18981bb8a dmaengine: sh: rz-dmac: Fix destination and source data size setting
    de43bc17987d clocksource/drivers/arm_arch_timer: Disable timer before programming CVAL
    f2953184bf19 ARC: atomics: Add compiler barrier to atomic operations...
    8eea0afbcc9d net/mlx5: Free IRQ rmap and notifier on kernel shutdown
    017a05805368 Multi-gen LRU: avoid race in inc_min_seq()
    69561478400c sh: boards: Fix CEU buffer size passed to dma_declare_coherent_memory()
    9cd5cf0bfeaf net: hns3: remove GSO partial feature bit
    136806771864 net: hns3: fix the port information display when sfp is absent
    9bd9afd55c52 net: hns3: fix invalid mutex between tc qdisc and dcb ets command issue
    d76436e26943 net: hns3: fix debugfs concurrency issue between kfree buffer and read
    b5087697130a net: hns3: fix byte order conversion issue in hclge_dbg_fd_tcam_read()
    5c28780f4232 net: hns3: fix tx timeout issue
    7bb8d52b4271 netfilter: nfnetlink_osf: avoid OOB read
    d9ebfc0f2137 netfilter: nftables: exthdr: fix 4-byte stack OOB write
    6cf0d1d5a50b bpf: Assign bpf_tramp_run_ctx::saved_run_ctx before recursion check.
    04f92e67b35d bpf: Invoke __bpf_prog_exit_sleepable_recur() on recursion in kern_sys_bpf().
    a12f15d1f863 bpf: Remove prog->active check for bpf_lsm and bpf_iter
    5f09b79e99ad net: dsa: sja1105: complete tc-cbs offload support on SJA1110
    ec9f203ad7f3 net: dsa: sja1105: fix -ENOSPC when replacing the same tc-cbs too many times
    483f0e3975df net: dsa: sja1105: fix bandwidth discrepancy between tc-cbs software and offload
    54b59bc18d19 ip_tunnels: use DEV_STATS_INC()
    175f290dc937 idr: fix param name in idr_alloc_cyclic() doc
    147d8da33a2c s390/zcrypt: don't leak memory if dev_set_name() fails
    ccb048dae8ff igb: Change IGB_MIN to allow set rx/tx value between 64 and 80
    74b98c61c9c6 igbvf: Change IGBVF_MIN to allow set rx/tx value between 64 and 80
    30acc4f954a0 igc: Change IGC_MIN to allow set rx/tx value between 64 and 80
    e2e2c839d827 octeontx2-af: Fix truncation of smq in CN10K NIX AQ enqueue mbox handler
    e30388b80d23 kcm: Destroy mutex in kcm_exit_net()
    a18349dc8d91 net: sched: sch_qfq: Fix UAF in qfq_dequeue()
    2100bbf55e56 af_unix: Fix data race around sk->sk_err.
    ce3aa88ceccd af_unix: Fix data-races around sk->sk_shutdown.
    2d8933ca863e af_unix: Fix data-race around unix_tot_inflight.
    b9cdbb38e030 af_unix: Fix data-races around user->unix_inflight.
    923877254f00 bpf, sockmap: Fix skb refcnt race after locking changes
    71fb38b222cf net: phy: micrel: Correct bit assignments for phy_device flags
    aa8fd3a63691 net: ipv6/addrconf: avoid integer underflow in ipv6_create_tempaddr
    e752860bbc3c veth: Fixing transmit return status for dropped packets
    a47ad6d226dc gve: fix frag_list chaining
    24b1e835db34 igb: disable virtualization features on 82580
    7ddfe350e255 ipv6: ignore dst hint for multipath routes
    0b2ee66411fe ipv4: ignore dst hint for multipath routes
    b7d25ac3627a mptcp: annotate data-races around msk->rmem_fwd_alloc
    787c5829681b net: annotate data-races around sk->sk_forward_alloc
    f1175881ddd9 net: use sk_forward_alloc_get() in sk_get_meminfo()
    bd9bd085c681 drm/i915/gvt: Drop unused helper intel_vgpu_reset_gtt()
    2b7510bb92c1 drm/i915/gvt: Put the page reference obtained by KVM's gfn_to_pfn()
    f5738399ed96 drm/i915/gvt: Verify pfn is "valid" before dereferencing "struct page"
    6436973164ea xsk: Fix xsk_diag use-after-free error during socket cleanup
    d92c34348b37 net: fib: avoid warn splat in flow dissector
    9036b6342fcd net: read sk->sk_family once in sk_mc_loop()
    5aaa7ee23203 ipv4: annotate data-races around fi->fib_dead
    471f534971d9 sctp: annotate data-races around sk->sk_wmem_queued
    f39b49077abe net/sched: fq_pie: avoid stalls in fq_pie_timer()
    47f72ee50226 smb: propagate error code of extract_sharename()
    60e3318e3e90 cifs: use fs_context for automounts
    84d577923450 blk-throttle: consider 'carryover_ios/bytes' in throtl_trim_slice()
    fd2420905c8e blk-throttle: use calculate_io/bytes_allowed() for throtl_trim_slice()
    8017a27cec32 drm/i915: mark requests for GuC virtual engines to avoid use-after-free
    0686336f7383 perf test stat_bpf_counters_cgrp: Enhance perf stat cgroup BPF counter test
    66b23e7b0822 perf test stat_bpf_counters_cgrp: Fix shellcheck issue about logical operators
    523f6268e865 pwm: lpc32xx: Remove handling of PWM channels
    fa5392873639 watchdog: intel-mid_wdt: add MODULE_ALIAS() to allow auto-load
    032cd8ce89a4 perf top: Don't pass an ERR_PTR() directly to perf_session__delete()
    adeb9f392d07 perf vendor events: Drop STORES_PER_INST metric event for power10 platform
    6ade9094b477 perf vendor events: Drop some of the JSON/events for power10 platform
    b7cbcafb6d04 perf vendor events: Update the JSON/events descriptions for power10 platform
    6a43e0d62311 x86/virt: Drop unnecessary check on extended CPUID level in cpu_has_svm()
    6522397e7502 perf annotate bpf: Don't enclose non-debug code with an assert()
    e62e740009cc Input: tca6416-keypad - fix interrupt enable disbalance
    a7345501a3bd Input: tca6416-keypad - always expect proper IRQ number in i2c client
    d7add2001991 backlight: gpio_backlight: Drop output GPIO direction check for initial power state
    9de7eb95bbe8 pwm: atmel-tcb: Fix resource freeing in error path and remove
    c42256a283d6 pwm: atmel-tcb: Harmonize resource allocation order
    b9734e8505bd pwm: atmel-tcb: Convert to platform remove callback returning void
    62dd514c34be perf trace: Really free the evsel->priv area
    e5dee8222d7c perf trace: Use zfree() to reduce chances of use after free
    eb17c3d0055b Input: iqs7222 - configure power mode before triggering ATI
    8ab594223950 kconfig: fix possible buffer overflow
    39c29d075352 mailbox: qcom-ipcc: fix incorrect num_chans counting
    36201d559b47 gfs2: low-memory forced flush fixes
    694e43f22c5b gfs2: Switch to wait_event in gfs2_logd
    c4807163e2d4 tpm_crb: Fix an error handling path in crb_acpi_add()
    46d3bc902b03 kbuild: do not run depmod for 'make modules_sign'
    390275d7a863 kbuild: rpm-pkg: define _arch conditionally
    31cf7853a940 net: deal with integer overflows in kmalloc_reserve()
    2b39866f0a38 net: factorize code in kmalloc_reserve()
    36974c3a5438 net: remove osize variable in __alloc_skb()
    5f7676fdaf42 net: add SKB_HEAD_ALIGN() helper
    8b4d0f3890c8 bus: mhi: host: Skip MHI reset if device is in RDDM
    fd9a8ad2cfa7 NFSv4/pnfs: minor fix for cleanup path in nfs4_get_device_info
    dac14a1dbe20 NFS: Fix a potential data corruption
    1bb9546c7aed clk: qcom: mss-sc7180: fix missing resume during probe
    017e60a215d8 clk: qcom: q6sstop-qcs404: fix missing resume during probe
    eab2ece5e4b5 clk: qcom: lpasscc-sc7280: fix missing resume during probe
    5310f712157a clk: qcom: dispcc-sm8450: fix runtime PM imbalance on probe errors
    f6250ecb7fbb soc: qcom: qmi_encdec: Restrict string length in decode
    c4e1204bd714 clk: qcom: gcc-mdm9615: use proper parent for pll0_vote clock
    5b3b0f7f7363 clk: imx: pll14xx: align pdiv with reference manual
    871244f8efe8 clk: imx: pll14xx: dynamically configure PLL for 393216000/361267200Hz
    311db21d4a1f dt-bindings: clock: xlnx,versal-clk: drop select:false
    54e5ff4af78b pinctrl: cherryview: fix address_space_handler() argument
    9c8fc05bd4d0 cifs: update desired access while requesting for directory lease
    db5d5673ab7e parisc: led: Reduce CPU overhead for disk & lan LED computation
    ff2c44f0118d parisc: led: Fix LAN receive and transmit LEDs
    421855d0d24d lib/test_meminit: allocate pages up to order MAX_ORDER
    84a212a72c84 mm: hugetlb_vmemmap: fix a race between vmemmap pmd split
    21ef9e11205f memcg: drop kmem.limit_in_bytes
    0f7339056893 send channel sequence number in SMB3 requests after reconnects
    22ec50d7b524 arm64: dts: renesas: rzg2l: Fix txdv-skew-psec typos
    df2d596e7e9c clk: qcom: turingcc-qcs404: fix missing resume during probe
    b83ae66d8265 ASoC: tegra: Fix SFC conversion for few rates
    3c9881fd220a drm/ast: Fix DRAM init on AST2200
    c0341bddd6cc clk: qcom: camcc-sc7180: fix async resume during probe
    f83c1b13f815 fbdev/ep93xx-fb: Do not assign to struct fb_info.dev
    a0b4a0666bea null_blk: fix poll request timeout handling
    f55797084931 scsi: qla2xxx: Fix firmware resource tracking
    3a9d4db2d2e0 scsi: qla2xxx: Error code did not return to upper layer
    c7355cbb9c1b scsi: qla2xxx: Fix smatch warn for qla_init_iocb_limit()
    974887e1d689 scsi: qla2xxx: Flush mailbox commands on chip reset
    98643561d853 scsi: qla2xxx: Remove unsupported ql2xenabledif option
    1f0e3814adc7 scsi: qla2xxx: Fix TMF leak through
    e6aabf0654cc scsi: qla2xxx: Fix session hang in gnl
    addaa136f10b scsi: qla2xxx: Turn off noisy message log
    01e3440ce021 scsi: qla2xxx: Fix erroneous link up failure
    ddb8fa05981c scsi: qla2xxx: Fix command flush during TMF
    6e44a7e2a0bc scsi: qla2xxx: fix inconsistent TMF timeout
    cd06c45b326e scsi: qla2xxx: Fix deletion race condition
    820010cfe5f8 scsi: qla2xxx: Limit TMF to 8 per function
    faf7e224b4fa scsi: qla2xxx: Adjust IOCB resource on qpair create
    98d3e7c5f757 drm/virtio: Conditionally allocate virtio_gpu_fence
    3e8b9b06de9d io_uring: Don't set affinity on a dying sqpoll thread
    9704cfcf1fa9 io_uring/sqpoll: fix io-wq affinity when IORING_SETUP_SQPOLL is used
    605d055452e7 io_uring: break out of iowq iopoll on teardown
    b04f22b68643 io_uring/net: don't overflow multishot accept
    5afbf7fdb730 io_uring: revert "io_uring fix multishot accept ordering"
    fd459200ff81 io_uring: always lock in io_apoll_task_func
    f36791596176 Multi-gen LRU: fix per-zone reclaim
    a73d04c46052 mm: multi-gen LRU: rename lrugen->lists[] to lrugen->folios[]
    7164d74aae1c net/ipv6: SKB symmetric hash should incorporate transport ports

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.1.inc               | 24 ++++++++++++----
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 4 files changed, 38 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
index 94a312b311..898d8aa720 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.1.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-09-15 17:26:47.557521+00:00 for version 6.1.53
+# Generated at 2023-09-26 03:36:35.968438+00:00 for version 6.1.55
 
 python check_kernel_cve_status_version() {
-    this_version = "6.1.53"
+    this_version = "6.1.55"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4794,7 +4794,7 @@ CVE_STATUS[CVE-2023-25012] = "cpe-stable-backport: Backported in 6.1.16"
 
 CVE_STATUS[CVE-2023-2513] = "fixed-version: Fixed from version 6.0rc1"
 
-# CVE-2023-25775 has no known resolution
+CVE_STATUS[CVE-2023-25775] = "cpe-stable-backport: Backported in 6.1.53"
 
 CVE_STATUS[CVE-2023-2598] = "fixed-version: only affects 6.3rc1 onwards"
 
@@ -4850,7 +4850,7 @@ CVE_STATUS[CVE-2023-3106] = "fixed-version: Fixed from version 4.8rc7"
 
 # CVE-2023-31082 has no known resolution
 
-# CVE-2023-31083 has no known resolution
+# CVE-2023-31083 needs backporting (fixed from 6.6rc1)
 
 # CVE-2023-31084 needs backporting (fixed from 6.4rc3)
 
@@ -4964,7 +4964,7 @@ CVE_STATUS[CVE-2023-3611] = "cpe-stable-backport: Backported in 6.1.40"
 
 # CVE-2023-3640 has no known resolution
 
-# CVE-2023-37453 has no known resolution
+CVE_STATUS[CVE-2023-37453] = "fixed-version: only affects 6.3rc1 onwards"
 
 # CVE-2023-37454 has no known resolution
 
@@ -4996,6 +4996,12 @@ CVE_STATUS[CVE-2023-38432] = "cpe-stable-backport: Backported in 6.1.36"
 
 CVE_STATUS[CVE-2023-3863] = "cpe-stable-backport: Backported in 6.1.39"
 
+CVE_STATUS[CVE-2023-3865] = "cpe-stable-backport: Backported in 6.1.36"
+
+CVE_STATUS[CVE-2023-3866] = "cpe-stable-backport: Backported in 6.1.36"
+
+CVE_STATUS[CVE-2023-3867] = "cpe-stable-backport: Backported in 6.1.40"
+
 CVE_STATUS[CVE-2023-4004] = "cpe-stable-backport: Backported in 6.1.42"
 
 # CVE-2023-4010 has no known resolution
@@ -5024,6 +5030,8 @@ CVE_STATUS[CVE-2023-4207] = "cpe-stable-backport: Backported in 6.1.45"
 
 CVE_STATUS[CVE-2023-4208] = "cpe-stable-backport: Backported in 6.1.45"
 
+# CVE-2023-4244 needs backporting (fixed from 6.5rc7)
+
 CVE_STATUS[CVE-2023-4273] = "cpe-stable-backport: Backported in 6.1.45"
 
 CVE_STATUS[CVE-2023-4385] = "fixed-version: Fixed from version 5.19rc1"
@@ -5044,5 +5052,9 @@ CVE_STATUS[CVE-2023-4611] = "fixed-version: only affects 6.4rc1 onwards"
 
 # CVE-2023-4622 needs backporting (fixed from 6.5rc1)
 
-# CVE-2023-4623 has no known resolution
+CVE_STATUS[CVE-2023-4623] = "cpe-stable-backport: Backported in 6.1.53"
+
+# CVE-2023-4881 needs backporting (fixed from 6.6rc1)
+
+# CVE-2023-4921 needs backporting (fixed from 6.6rc1)
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 4168a936bb..fd04c4c17a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "af2faa46d440ee11170ba8233eec0f818988f256"
-SRCREV_meta ?= "59e0fce122a66f7dcaf7a2a8294d81c4b78197dc"
+SRCREV_machine ?= "4b3040c1dc13aaac356ad4ef45a8926118c732d0"
+SRCREV_meta ?= "943c6fe5dac329c7e1c30d602788f409e692b3a8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.53"
+LINUX_VERSION ?= "6.1.55"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 80a3f06eee..818c650368 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.53"
+LINUX_VERSION ?= "6.1.55"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "51f0e0b74445fb47b6544b26667f9d58b2017695"
-SRCREV_meta ?= "59e0fce122a66f7dcaf7a2a8294d81c4b78197dc"
+SRCREV_machine ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
+SRCREV_meta ?= "943c6fe5dac329c7e1c30d602788f409e692b3a8"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 61f3e532fb..a942d0c540 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b11af7d1c8b4337347747977173c878e7672eb15"
-SRCREV_machine:qemuarm64 ?= "51f0e0b74445fb47b6544b26667f9d58b2017695"
-SRCREV_machine:qemuloongarch64 ?= "51f0e0b74445fb47b6544b26667f9d58b2017695"
-SRCREV_machine:qemumips ?= "81af09853cc4318fad59e780c830c9cc8ccdc898"
-SRCREV_machine:qemuppc ?= "51f0e0b74445fb47b6544b26667f9d58b2017695"
-SRCREV_machine:qemuriscv64 ?= "51f0e0b74445fb47b6544b26667f9d58b2017695"
-SRCREV_machine:qemuriscv32 ?= "51f0e0b74445fb47b6544b26667f9d58b2017695"
-SRCREV_machine:qemux86 ?= "51f0e0b74445fb47b6544b26667f9d58b2017695"
-SRCREV_machine:qemux86-64 ?= "51f0e0b74445fb47b6544b26667f9d58b2017695"
-SRCREV_machine:qemumips64 ?= "6ec5ef2f6fa90a5823e131805845738453bc553a"
-SRCREV_machine ?= "51f0e0b74445fb47b6544b26667f9d58b2017695"
-SRCREV_meta ?= "59e0fce122a66f7dcaf7a2a8294d81c4b78197dc"
+SRCREV_machine:qemuarm ?= "cf771f6d6bc0344e048bdbf7d23d3aacbe3556d0"
+SRCREV_machine:qemuarm64 ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
+SRCREV_machine:qemuloongarch64 ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
+SRCREV_machine:qemumips ?= "4be1dcc270e6ddeea513af01d91ea3b48ec82470"
+SRCREV_machine:qemuppc ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
+SRCREV_machine:qemuriscv64 ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
+SRCREV_machine:qemuriscv32 ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
+SRCREV_machine:qemux86 ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
+SRCREV_machine:qemux86-64 ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
+SRCREV_machine:qemumips64 ?= "aa0e978c979b84d620ad21132cfdbbf857be3878"
+SRCREV_machine ?= "644e73fa089ade30c0db7bd54be960be92546ba2"
+SRCREV_meta ?= "943c6fe5dac329c7e1c30d602788f409e692b3a8"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "09045dae0d902f9f78901a26c7ff1714976a38f9"
+SRCREV_machine:class-devupstream ?= "d23900f974e0fb995b36ef47283a5aa74ca25f51"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.53"
+LINUX_VERSION ?= "6.1.55"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


