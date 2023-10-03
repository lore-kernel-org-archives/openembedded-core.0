Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31041E8FDAF
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 19:37:21 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.119.1696361831138559515
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Oct 2023 12:37:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=SwTv2ZxK;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-54290603887so852051a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 12:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696361830; x=1696966630; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LCwhEypj68g6L87O4kfZu5UxMr3TCMfW4ID0/PgF+1M=;
        b=SwTv2ZxK+NbDBLko0hbC7rWO43BtAer2mqWXBPg9hp9BWeYEk1BHX5YEl/VVWORAjn
         6vAoAz3chx3NHLxaiAyA21lRE2Mjb2/ykonPE0kjMT8WienxBw/pQetRbUSUYhxcO6uM
         T6EjAKTfLv3D1azqOvJEW0mp/s2gpdThY5RMrV01XWmyfQSgxswh/u/UJMr2huCP9PDA
         fjKmrt6Nj7zdrhN0jgaYQaf2y1ctRnk5ATiXW3mk3IgapYW0dhiAiqve0hkLZMjl+i4e
         1BgSqyl5d5rI2SgeZvDBRrKgIEBwGZIiA2IY397VHGi5JRfr+khEAPE8lrdwk5KUYqq2
         yKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361830; x=1696966630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCwhEypj68g6L87O4kfZu5UxMr3TCMfW4ID0/PgF+1M=;
        b=jASpaaKn5JqaPWZ+9zHtI5X4p0hmkmaJ+6kDmo4Nu+Jajfn3K3dDpdNkKko/YgAVGE
         ppMC9+Pg4HAs4PDtfyTrgZYhbJlTwUSLv9vV28eT8uTSykpQyp16z8GbfNp0LS9R51aJ
         90NU5BHlv2Q4AR5jnvDgj6EWuqrZnhQwGok9dPFXCT/hnIMPBpPnfZVVMuc7gGgQ8Hc9
         zNsIOnd7ujVoDBBSF+dN6FZDDjm/W/Kqzs5FPA3asGfPfzG7tbJd9xjT0le+M3CUL+VP
         pTH/zsXfTDUgOWCjThP6dL5iNNTeZPpAadPJ04Gb4METt1lDeqMiPtV/fhdtipwBzN5g
         QVqQ==
X-Gm-Message-State: AOJu0YzRKLGoIlWuyQcSVy+VckRnfB28R6Ae77+NQEed7gTsJ3O+N2x7
	BnesbTeFWMDK2DmBhK3AtapsvEfN8W0o33ddUlc=
X-Google-Smtp-Source: AGHT+IEwjD9Xp2OGzbi0cfGxFCgKDtlcq//2ncpW76Bu3rL0Eff2CfyQJRDdt+mhxE+TvXlkPiHg6g==
X-Received: by 2002:a17:90a:1547:b0:278:fe18:b7dc with SMTP id y7-20020a17090a154700b00278fe18b7dcmr297690pja.31.1696361829553;
        Tue, 03 Oct 2023 12:37:09 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id 23-20020a17090a031700b0025dc5749b4csm9333642pje.21.2023.10.03.12.37.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:37:09 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/10] linux-yocto/5.10: update to v5.10.197
Date: Tue,  3 Oct 2023 09:36:47 -1000
Message-Id: <e5690db43930efb6166fe398776eac044ce56048.1696361593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696361593.git.steve@sakoman.com>
References: <cover.1696361593.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Oct 2023 19:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188657

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    393e225fe8ff Linux 5.10.197
    242c5740dd17 ext4: fix rec_len verify error
    8768583b2509 scsi: pm8001: Setup IRQs on resume
    f4fffa1abb7f scsi: megaraid_sas: Fix deadlock on firmware crashdump
    3753e568d67f ata: libata: disallow dev-initiated LPM transitions to unsupported states
    993bb01d228b i2c: aspeed: Reset the i2c controller when timeout occurs
    f5e303fce3be tracefs: Add missing lockdown check to tracefs_create_dir()
    96afb318ae5d nfsd: fix change_info in NFSv4 RENAME replies
    b3183f5f05cd tracing: Have option files inc the trace array ref count
    ec7eb8b06481 tracing: Have current_trace inc the trace array ref count
    bb3e295a388c drm/amd/display: enable cursor degamma for DCN3+ DRM legacy gamma
    2cdcf6481cb3 mm/filemap: fix infinite loop in generic_file_buffered_read()
    0c5d5f8e0d2b proc: fix a dentry lock race between release_task and lookup
    8db844077ec9 net/sched: Retire rsvp classifier
    7a8f285cb58e drm/amdgpu: fix amdgpu_cs_p1_user_fence
    7390bb377b5f btrfs: release path before inode lookup during the ino lookup ioctl
    3d379dd109f8 btrfs: fix lockdep splat and potential deadlock after failure running delayed items
    c6422e6f173d ovl: fix incorrect fdput() on aio completion
    68308b0a33ed attr: block mode changes of symlinks
    634444dea898 md/raid1: fix error: ISO C90 forbids mixed declarations
    7be3a38f0e37 samples/hw_breakpoint: fix building without module unloading
    d20beafaa69b x86/boot/compressed: Reserve more memory for page tables
    7635020b9bd4 scsi: lpfc: Fix the NULL vs IS_ERR() bug for debugfs_create_file()
    f99005237684 selftests: tracing: Fix to unmount tracefs for recovering environment
    ae889fffae52 scsi: qla2xxx: Fix NULL vs IS_ERR() bug for debugfs_create_dir()
    82910aa5501d drm: gm12u320: Fix the timeout usage for usb_bulk_msg()
    df380d6f5c06 btrfs: compare the correct fsid/metadata_uuid in btrfs_validate_super
    ab90a3930d39 btrfs: add a helper to read the superblock metadata_uuid
    cc87d2bb391c btrfs: move btrfs_pinned_by_swapfile prototype into volumes.h
    e16f5f8cab65 perf tools: Add an option to build without libbfd
    c56095812721 perf jevents: Make build dependency on test JSONs
    4954c5a05494 mtd: rawnand: brcmnand: Fix ECC level field setting for v7.2 controller
    b87d03ed6ab7 mtd: rawnand: brcmnand: Allow SoC to provide I/O operations
    5df582915851 kobject: Add sanity check for kset->kobj.ktype in kset_register()
    a3efb2b57e9d media: pci: ipu3-cio2: Initialise timing struct to avoid a compiler warning
    f354456f8df1 serial: cpm_uart: Avoid suspicious locking
    bbe3ff47bf09 scsi: target: iscsi: Fix buffer overflow in lio_target_nacl_info_show()
    6d3a1dd10537 usb: gadget: fsl_qe_udc: validate endpoint index for ch9 udc
    890d10e6b72f media: pci: cx23885: replace BUG with error return
    2ae53dd15eef media: tuners: qt1010: replace BUG_ON with a regular error
    578b67614ae0 media: dvb-usb-v2: gl861: Fix null-ptr-deref in gl861_i2c_master_xfer
    a9def3e9718a media: az6007: Fix null-ptr-deref in az6007_i2c_xfer()
    4a9763d2bc4a media: anysee: fix null-ptr-deref in anysee_master_xfer
    c7e5ac737db2 media: af9005: Fix null-ptr-deref in af9005_i2c_xfer
    97fdbdb75034 media: dw2102: Fix null-ptr-deref in dw2102_i2c_transfer()
    6c01ef65de0b media: dvb-usb-v2: af9035: Fix null-ptr-deref in af9035_i2c_master_xfer
    9f3b2b666833 powerpc/pseries: fix possible memory leak in ibmebus_bus_init()
    756747d4b439 jfs: fix invalid free of JFS_IP(ipimap)->i_imap in diUnmount
    6f8b34458948 fs/jfs: prevent double-free in dbUnmount() after failed jfs_remount()
    4bff1d95ba62 ext2: fix datatype of block number in ext2_xattr_set2()
    7993cfc04148 md: raid1: fix potential OOB in raid1_remove_disk()
    5933cd61399c bus: ti-sysc: Configure uart quirks for k3 SoC
    5475b8bea148 drm/exynos: fix a possible null-pointer dereference due to data race in exynos_drm_crtc_atomic_disable()
    d51d6c42d1e5 ALSA: hda: intel-dsp-cfg: add LunarLake support
    fcfb71848e9e samples/hw_breakpoint: Fix kernel BUG 'invalid opcode: 0000'
    9726e8dcabae drm/bridge: tc358762: Instruct DSI host to generate HSE packets
    672205c6f2d1 wifi: mac80211_hwsim: drop short frames
    5bf52e431c83 netfilter: ebtables: fix fortify warnings in size_entry_mwt()
    f6f0a687546e alx: fix OOB-read compiler warning
    acf0019b93a6 mmc: sdhci-esdhc-imx: improve ESDHC_FLAG_ERR010450
    c7a8813d91f9 tpm_tis: Resend command to recover from data transfer errors
    0fc7147c6943 crypto: lib/mpi - avoid null pointer deref in mpi_cmp_ui()
    03385b243bad wifi: wil6210: fix fortify warnings
    269eb4e1d5ea wifi: mwifiex: fix fortify warning
    08fdbe379022 wifi: ath9k: fix printk specifier
    268a10c9eb0f wifi: ath9k: fix fortify warnings
    8c19ddc21566 crypto: lrw,xts - Replace strlcpy with strscpy
    cfca20009bff devlink: remove reload failed checks in params get/set callbacks
    020ecfa7b676 hw_breakpoint: fix single-stepping when using bpf_overflow_handler
    bfc747fe0725 ACPI: video: Add backlight=native DMI quirk for Apple iMac12,1 and iMac12,2
    dc01bfdc3d91 perf/smmuv3: Enable HiSilicon Erratum 162001900 quirk for HIP08/09
    560014aefb70 ACPI: video: Add backlight=native DMI quirk for Lenovo Ideapad Z470
    3f72fdb20f6d scftorture: Forgive memory-allocation failure if KASAN
    55887adc76e1 rcuscale: Move rcu_scale_writer() schedule_timeout_uninterruptible() to _idle()
    f8bab887a4ae kernel/fork: beware of __put_task_struct() calling context
    625c12dc04a6 ACPICA: Add AML_NO_OPERAND_RESOLVE flag to Timer
    a6f4129378ca locks: fix KASAN: use-after-free in trace_event_raw_event_filelock_lock
    b7c3cf2f6c42 btrfs: output extra debug info if we failed to find an inline backref
    69ddafc7a7af autofs: fix memory leak of waitqueues in autofs_catatonic_mode
    ff0bfa8f23eb Linux 5.10.196
    2cc1f4986233 Revert "configfs: fix a race in configfs_lookup()"
    5452d1be676c Linux 5.10.195
    d653c35de087 parisc: Drop loops_per_jiffy from per_cpu struct
    1d02ef8c8a1f drm/amd/display: Fix a bug when searching for insert_above_mpcc
    2e18493c4214 kcm: Fix error handling for SOCK_DGRAM in kcm_sendmsg().
    606a0d8ff674 ixgbe: fix timestamp configuration code
    6edf82223fab ipv6: fix ip6_sock_set_addr_preferences() typo
    a5096cc6e783 net/tls: do not free tls_rec on async operation in bpf_exec_tx_verdict()
    03be4412d31e platform/mellanox: mlxbf-tmfifo: Drop jumbo frames
    687031788fb1 platform/mellanox: mlxbf-tmfifo: Drop the Rx packet if no more descriptors
    33db24ad811b kcm: Fix memory leak in error path of kcm_sendmsg()
    ed584f1e72d7 r8152: check budget for r8152_poll()
    1e90a93ac484 hsr: Fix uninit-value access in fill_frame_info()
    75f2de75c118 net: ethernet: mtk_eth_soc: fix possible NULL pointer dereference in mtk_hwlro_get_fdir_all()
    61054a8ddb17 net: ethernet: mvpp2_main: fix possible OOB write in mvpp2_ethtool_get_rxnfc()
    d1c6c93c27a4 net/smc: use smc_lgr_list.lock to protect smc_lgr_list.list iterate in smcr_port_add
    fcb9e879a53e kselftest/runner.sh: Propagate SIGTERM to runner child
    d94aac13a102 selftests/kselftest/runner/run_one(): allow running non-executable files
    7c8ddcdab1b9 net: ipv4: fix one memleak in __inet_del_ifa()
    15dabd02a975 bus: mhi: host: Skip MHI reset if device is in RDDM
    de20747ee610 ARM: dts: BCM5301X: Extend RAM to full 256MB for Linksys EA6500 V2
    81d06d1919c9 ARM: dts: samsung: exynos4210-i9100: Fix LCD screen's physical size
    61fa6a16bb94 scsi: qla2xxx: Flush mailbox commands on chip reset
    b5775b8530b9 scsi: qla2xxx: Fix crash in PCIe error handling
    41a660c204ea scsi: qla2xxx: Consolidate zio threshold setting for both FCP & NVMe
    5c069bce2d67 scsi: qla2xxx: If fcport is undergoing deletion complete I/O with retry
    e7ed3585d092 arm64: sdei: abort running SDEI handlers during crash
    0b55460c312e ACPI: APEI: explicit init of HEST and GHES in apci_init()
    c6dc2a2e11c2 perf hists browser: Fix the number of entries for 'e' key
    c07e4a4ef36a perf tools: Handle old data in PERF_RECORD_ATTR
    b52a33a9079c perf hists browser: Fix hierarchy mode header
    d72b01d9f96f drm/amd/display: prevent potential division by zero errors
    d68f639ddec4 mtd: rawnand: brcmnand: Fix potential false time out warning
    d00b03126651 mtd: rawnand: brcmnand: Fix potential out-of-bounds access in oob write
    c839a24d6ef7 mtd: rawnand: brcmnand: Fix crash during the panic_write
    e76cef3dcdb8 btrfs: use the correct superblock to compare fsid in btrfs_validate_super
    f2873a18c235 btrfs: don't start transaction when joining with TRANS_JOIN_NOSTART
    3856e7b11810 fuse: nlookup missing decrement in fuse_direntplus_link
    1d21b03f7738 ata: pata_ftide010: Add missing MODULE_DESCRIPTION
    35a3dec703bb ata: sata_gemini: Add missing MODULE_DESCRIPTION
    b1d63e2bbd5b ext4: add correct group descriptors and reserved GDT blocks to system zone
    6612d5b5350d sh: boards: Fix CEU buffer size passed to dma_declare_coherent_memory()
    97ef9ba7df1c net: hns3: fix the port information display when sfp is absent
    780f60dde296 netfilter: nfnetlink_osf: avoid OOB read
    e89a361d99f6 net: dsa: sja1105: fix -ENOSPC when replacing the same tc-cbs too many times
    94a3117efff8 net: dsa: sja1105: fix bandwidth discrepancy between tc-cbs software and offload
    e90e70343b24 ip_tunnels: use DEV_STATS_INC()
    2539b28a2b1f idr: fix param name in idr_alloc_cyclic() doc
    0878052579cb s390/zcrypt: don't leak memory if dev_set_name() fails
    d878011b5d93 igb: Change IGB_MIN to allow set rx/tx value between 64 and 80
    417b11433eb1 igbvf: Change IGBVF_MIN to allow set rx/tx value between 64 and 80
    9444881a375d igc: Change IGC_MIN to allow set rx/tx value between 64 and 80
    46f02fc7f6fb kcm: Destroy mutex in kcm_exit_net()
    746a8df5e4d2 net: sched: sch_qfq: Fix UAF in qfq_dequeue()
    31e08e7fa6a3 af_unix: Fix data race around sk->sk_err.
    90e32f81f9cc af_unix: Fix data-races around sk->sk_shutdown.
    cf29b42766ad af_unix: Fix data-race around unix_tot_inflight.
    b401d7e485b0 af_unix: Fix data-races around user->unix_inflight.
    98e12d075c7f net: ipv6/addrconf: avoid integer underflow in ipv6_create_tempaddr
    d47bc5023e54 veth: Fixing transmit return status for dropped packets
    ab9796f43cfc igb: disable virtualization features on 82580
    160fdb4116e7 ipv4: ignore dst hint for multipath routes
    29039819c662 drm/i915/gvt: Drop unused helper intel_vgpu_reset_gtt()
    23d2651372bd drm/i915/gvt: Save/restore HW status to support GVT suspend/resume
    895dc4c47171 net: read sk->sk_family once in sk_mc_loop()
    8edced38dbe5 ipv4: annotate data-races around fi->fib_dead
    ab5c26dc5392 sctp: annotate data-races around sk->sk_wmem_queued
    94d527c3759d net/sched: fq_pie: avoid stalls in fq_pie_timer()
    a2d9d884e84b pwm: lpc32xx: Remove handling of PWM channels
    6909e28cf387 watchdog: intel-mid_wdt: add MODULE_ALIAS() to allow auto-load
    aec02fba99f8 perf top: Don't pass an ERR_PTR() directly to perf_session__delete()
    28df38af326d x86/virt: Drop unnecessary check on extended CPUID level in cpu_has_svm()
    23ec6fc52c14 perf annotate bpf: Don't enclose non-debug code with an assert()
    934d29b9fa91 backlight: gpio_backlight: Drop output GPIO direction check for initial power state
    84f99532152b kconfig: fix possible buffer overflow
    6cc6f79b931f NFSv4/pnfs: minor fix for cleanup path in nfs4_get_device_info
    4185605cd0f7 NFS: Fix a potential data corruption
    2ccab9f82772 soc: qcom: qmi_encdec: Restrict string length in decode
    bf27518fb93f clk: qcom: gcc-mdm9615: use proper parent for pll0_vote clock
    972acd701b19 clk: imx: pll14xx: dynamically configure PLL for 393216000/361267200Hz
    921453672846 dt-bindings: clock: xlnx,versal-clk: drop select:false
    690a22d6c581 pinctrl: cherryview: fix address_space_handler() argument
    b02d1fb74e8b parisc: led: Reduce CPU overhead for disk & lan LED computation
    3add85c962ab parisc: led: Fix LAN receive and transmit LEDs
    2a1cf9fe09d9 lib/test_meminit: allocate pages up to order MAX_ORDER
    6bfa28f441da drm/ast: Fix DRAM init on AST2200
    4aade6c9100a fbdev/ep93xx-fb: Do not assign to struct fb_info.dev
    db8b5a2254c3 scsi: qla2xxx: Remove unsupported ql2xenabledif option
    fd48544f3e03 scsi: qla2xxx: Turn off noisy message log
    931fadf9728d scsi: qla2xxx: Fix erroneous link up failure
    3694f18beaa1 scsi: qla2xxx: fix inconsistent TMF timeout
    4d7da12483e9 scsi: qla2xxx: Fix deletion race condition
    f271e3d64b8b io_uring: break iopolling on signal
    9faa6d0677ec io_uring: break out of iowq iopoll on teardown
    208858d4b08a io_uring: always lock in io_apoll_task_func
    6ffab754d220 net/ipv6: SKB symmetric hash should incorporate transport ports
    26f9ccb7a043 udf: initialize newblock to 0
    06494cd473e0 md/md-bitmap: remove unnecessary local variable in backlog_store()
    5103216b863f tracing: Zero the pipe cpumask on alloc to avoid spurious -EBUSY
    1c4c9191b3f8 usb: typec: tcpci: clear the fault status bit
    beba5051dd34 USB: core: Fix oversight in SuperSpeed initialization
    9d241c5d9a9b USB: core: Fix race by not overwriting udev->descriptor in hub_port_init()
    6ceffc2ecf3d USB: core: Change usb_get_device_descriptor() API
    3cef18d13f37 USB: core: Unite old scheme and new scheme descriptor reads
    38e1f2ee82ba usb: typec: bus: verify partner exists in typec_altmode_attention
    b97e3c5e9768 cpufreq: brcmstb-avs-cpufreq: Fix -Warray-bounds bug
    a1d2e2c670a3 crypto: stm32 - fix loop iterating through scatterlist for DMA
    54d03dc5d1c3 s390/ipl: add missing secure/has_secure file to ipl type 'unknown'
    dc2f60de9a7d pstore/ram: Check start of empty przs during init
    5b1f71c0b95a fsverity: skip PKCS#7 parser when keyring is empty
    a9864e126b73 net: handle ARPHRD_PPP in dev_is_mac_header_xmit()
    c681d477c03d X.509: if signature is unsupported skip validation
    4b8a938e329a dccp: Fix out of bounds access in DCCP error handler
    a4f4a5b41a13 dlm: fix plock lookup when using multiple lockspaces
    9f73fd6972bc parisc: Fix /proc/cpuinfo output for lscpu
    1f03e6dd194e procfs: block chmod on /proc/thread-self/comm
    9a0b35dc3aa0 Revert "PCI: Mark NVIDIA T4 GPUs to avoid bus reset"
    3d8d13a174ef ntb: Fix calculation ntb_transport_tx_free_entry()
    c028e90e0de1 ntb: Clean up tx tail index on link down
    3cfdc448e8bf ntb: Drop packets when qp link is down
    ffed0c8fcf04 scsi: mpt3sas: Perform additional retries if doorbell read returns 0
    bf67d43f07b5 Revert "scsi: qla2xxx: Fix buffer overrun"
    27dfaf2ee05e media: dvb: symbol fixup for dvb_attach()
    5a85727239a2 arm64: csum: Fix OoB access in IP checksum code for negative lengths
    b24bebcea556 xtensa: PMU: fix base address for the newer hardware
    8594605a0446 backlight/lv5207lp: Compare against struct fb_info.device
    e2c77841cd8d backlight/bd6107: Compare against struct fb_info.device
    35c56c48737f backlight/gpio_backlight: Compare against struct fb_info.device
    13264260eb66 ARM: OMAP2+: Fix -Warray-bounds warning in _pwrdm_state_switch()
    5c5f02e16b91 ipmi_si: fix a memleak in try_smi_init()
    5d27baee6cd9 scsi: core: Fix the scsi_set_resid() documentation
    8c90c4e61929 printk: ringbuffer: Fix truncating buffer size min_t cast
    61b918dfb675 ALSA: pcm: Fix missing fixup call in compat hw_refine ioctl
    ab192e5e5d3b PM / devfreq: Fix leak in devfreq_dev_release()
    3e39008e9e30 igb: set max size RX buffer when store bad packet is enabled
    8836c266201c skbuff: skb_segment, Call zero copy functions before using skbuff frags
    5541827d13cf netfilter: xt_sctp: validate the flag_info count
    a1b711c370f5 netfilter: xt_u32: validate user space input
    83091f8ac03f netfilter: ipset: add the missing IP_SET_HASH_WITH_NET0 macro for ip_set_hash_netportnet.c
    1186eaffd87e igmp: limit igmpv3_newpack() packet size to IP_MAX_MTU
    504bb3fc66aa virtio_ring: fix avail_wrap_counter in virtqueue_add_packed
    ea374bdf2374 cpufreq: Fix the race condition while updating the transition_task of policy
    27b75c7203fc dmaengine: ste_dma40: Add missing IRQ check in d40_probe
    cfe215a04a21 um: Fix hostaudio build errors
    eb33921806fc mtd: rawnand: fsmc: handle clk prepare error in fsmc_nand_resume()
    40d8f9bffed0 mtd: spi-nor: Check bus width while setting QE bit
    71ac2ffd7f80 rpmsg: glink: Add check for kstrdup
    268fce6ec2e0 phy/rockchip: inno-hdmi: do not power on rk3328 post pll on reg write
    6739746f4b81 phy/rockchip: inno-hdmi: round fractal pixclock in rk3328 recalc_rate
    88813bd9bbb7 phy/rockchip: inno-hdmi: use correct vco_div_5 macro on rk3328
    3a890f993b6c mtd: rawnand: brcmnand: Fix mtd oobsize
    c5d30d6aa83d tracing: Fix race issue between cpu buffer write and swap
    ee519526d58c x86/speculation: Mark all Skylake CPUs as vulnerable to GDS
    15ec7cb55e7d HID: multitouch: Correct devm device reference for hidinput input_dev name
    e38a6f12685d HID: logitech-dj: Fix error handling in logi_dj_recv_switch_to_dj_mode()
    bdb3cd9dffdf RDMA/siw: Correct wrong debug message
    d006f2cb3c68 RDMA/siw: Balance the reference of cep->kref in the error path
    aa950b9835f2 Revert "IB/isert: Fix incorrect release of isert connection"
    9baf2278b3ee amba: bus: fix refcount leak
    0c6c0280f740 serial: tegra: handle clk prepare error in tegra_uart_hw_init()
    9cce8ef7a6fa scsi: fcoe: Fix potential deadlock on &fip->ctlr_lock
    356da2d5c084 scsi: core: Use 32-bit hostnum in scsi_host_lookup()
    629079f502fb cgroup:namespace: Remove unused cgroup_namespaces_init()
    3534ae5f171b media: ov2680: Fix regulators being left enabled on ov2680_power_on() errors
    a427ce197e75 media: ov2680: Fix vflip / hflip set functions
    cd7a0e391eb5 media: ov2680: Fix ov2680_bayer_order()
    faf1408a68c8 media: ov2680: Remove auto-gain and auto-exposure controls
    e1552a0b990b media: i2c: ov2680: Set V4L2_CTRL_FLAG_MODIFY_LAYOUT on flips
    2d29ce41de4d media: ov5640: Enable MIPI interface in ov5640_set_power_mipi()
    44c71cbe7c5a USB: gadget: f_mass_storage: Fix unused variable warning
    8f7de8215804 media: go7007: Remove redundant if statement
    3183b0cab7b5 iommu/vt-d: Fix to flush cache of PASID directory table
    4136094df53f iommu/qcom: Disable and reset context bank before programming
    b374b039e066 fsi: aspeed: Reset master errors after CFAM reset
    f8949c06c735 IB/uverbs: Fix an potential error pointer dereference
    10bd5f8ceb3e driver core: test_async: fix an error code
    19138f8cc651 dma-buf/sync_file: Fix docs syntax
    e621dbeb9f91 coresight: tmc: Explicit type conversions to prevent integer overflow
    d7f21ef741a5 scsi: qedf: Do not touch __user pointer in qedf_dbg_fp_int_cmd_read() directly
    1198a0e93587 scsi: qedf: Do not touch __user pointer in qedf_dbg_debug_cmd_read() directly
    d86d85e23e8a scsi: qedf: Do not touch __user pointer in qedf_dbg_stop_io_on_error_cmd_read() directly
    4ede2ee95b41 x86/APM: drop the duplicate APM_MINOR_DEV macro
    9a26aaea6c21 serial: sprd: Fix DMA buffer leak issue
    6232bd4dca91 serial: sprd: Assign sprd_port after initialized to avoid wrong access
    6d65079c69dc scsi: qla4xxx: Add length check when parsing nlattrs
    b65b13d01b28 scsi: be2iscsi: Add length check when parsing nlattrs
    4df82c6d6e7d scsi: iscsi: Add strlen() check in iscsi_if_set{_host}_param()
    18d49266dd6e scsi: iscsi: Add length check for nlattr payload
    3ef17ca47690 scsi: iscsi: Rename iscsi_set_param() to iscsi_if_set_param()
    8356a3ba1083 scsi: RDMA/srp: Fix residual handling
    cc2d5cdb19e3 usb: phy: mxs: fix getting wrong state with mxs_phy_is_otg_host()
    5a6f480b2ecc media: mediatek: vcodec: Return NULL if no vdec_fb is found
    43c69dc9a327 media: rkvdec: increase max supported height for H.264
    1e5eac0022f4 scsi: hisi_sas: Fix normally completed I/O analysed as failed
    b6aca9f5ab29 scsi: hisi_sas: Fix warnings detected by sparse
    0d383e555fa6 scsi: hisi_sas: Modify v3 HW SATA completion error processing
    634220605198 scsi: hisi_sas: Modify v3 HW SSP underflow error processing
    d84e5d445af1 scsi: libsas: Introduce more SAM status code aliases in enum exec_status
    519b9e3e5ce7 scsi: hisi_sas: Print SAS address for v3 hw erroneous completion print
    5e5a528c29f0 media: cx24120: Add retval check for cx24120_message_send()
    d13a84874a2e media: dvb-usb: m920x: Fix a potential memory leak in m920x_i2c_xfer()
    656423cc56bd media: dib7000p: Fix potential division by zero
    61bc9293da19 drivers: usb: smsusb: fix error handling code in smsusb_init_device
    d8a8f75fce04 media: v4l2-core: Fix a potential resource leak in v4l2_fwnode_parse_link()
    5865926da24e media: i2c: tvp5150: check return value of devm_kasprintf()
    6dff92b3fe2f media: ad5820: Drop unsupported ad5823 from i2c_ and of_device_id tables
    9d82a58d2af5 NFSv4.2: fix handling of COPY ERR_OFFLOAD_NO_REQ
    7bc36ac6713e NFS: Guard against READDIR loop when entry names exceed MAXNAMELEN
    3f1a2b0b2d57 NFSD: da_addr_body field missing in some GETDEVICEINFO replies
    aaeac3a6b119 fs: lockd: avoid possible wrong NULL parameter
    6d5361618988 jfs: validate max amount of blocks before allocation.
    f08944e3c696 powerpc/iommu: Fix notifiers being shared by PCI and VIO buses
    46ff3bd14b6d nfs/blocklayout: Use the passed in gfp flags
    953c54dfdc5d powerpc/pseries: Rework lppaca_shared_proc() to avoid DEBUG_PREEMPT
    e46cc0e42f3f powerpc: Don't include lppaca.h in paca.h
    9837d6a483cf wifi: ath10k: Use RMW accessors for changing LNKCTL
    924d1ab98706 net/mlx5: Use RMW accessors for changing LNKCTL
    37eecd50856a drm/radeon: Use RMW accessors for changing LNKCTL
    ead3dbc92bd4 drm/amdgpu: Use RMW accessors for changing LNKCTL
    2f8269ca8062 powerpc/perf: Convert fsl_emb notifier to state machine callbacks
    d45bf1528b7c powerpc/fadump: reset dump area size if fadump memory reserve fails
    ad83d83dd891 vfio/type1: fix cap_migration information leak
    d8f5613c5c6c clk: imx: composite-8m: fix clock pauses when set_rate would be a no-op
    0d81a0546b19 clk: imx8mp: fix sai4 clock
    69795c689e7b PCI/ASPM: Use RMW accessors for changing LNKCTL
    f647b8fe55b1 PCI: pciehp: Use RMW accessors for changing LNKCTL
    ae52f8ba4596 pinctrl: mcp23s08: check return value of devm_kasprintf()
    ef8e561ddb33 PCI: Mark NVIDIA T4 GPUs to avoid bus reset
    344c16a8441e clk: qcom: reset: Use the correct type of sleep/delay based on length
    289f5a88f14a clk: qcom: gcc-sm8250: Fix gcc_sdcc2_apps_clk_src
    b3a80429b1cf clk: qcom: gcc-sm8250: use ARRAY_SIZE instead of specifying num_parents
    245759d987b6 ext4: correct grp validation in ext4_mb_good_group
    2aefe3ae098d clk: qcom: gcc-sc7180: Fix up gcc_sdcc2_apps_clk_src
    74a5f9755aa8 clk: qcom: gcc-sc7180: use ARRAY_SIZE instead of specifying num_parents
    2640d3be822c clk: sunxi-ng: Modify mismatched function name
    c1ff788f731d drivers: clk: keystone: Fix parameter judgment in _of_pll_clk_init()
    13623b966bb6 ipmi:ssif: Fix a memory leak when scanning for an adapter
    6128288d8f55 ipmi:ssif: Add check for kstrdup
    8917591d7247 ALSA: ac97: Fix possible error value of *rac97
    cd062ebe0cb3 of: unittest: Fix overlay type in apply/revert check
    ca7634e5491b bus: ti-sysc: Fix cast to enum warning
    43f561e809aa drm/mediatek: Fix potential memory leak if vmap() fail
    265515548610 bus: ti-sysc: Fix build warning for 64-bit build
    98ef243d5900 audit: fix possible soft lockup in __audit_inode_child()
    69800bc5d7fd drm/msm/a2xx: Call adreno_gpu_init() earlier
    7fcbaf4bdb75 drm/amd/pm: fix variable dereferenced issue in amdgpu_device_attr_create()
    9b89db24c6b2 smackfs: Prevent underflow in smk_set_cipso()
    9f4017cac70c firmware: meson_sm: fix to avoid potential NULL pointer dereference
    815e42029f6e drm/msm/mdp5: Don't leak some plane state
    a21e73a6d8e0 drm: xlnx: zynqmp_dpsub: Add missing check for dma_set_mask
    524f23b08290 ima: Remove deprecated IMA_TRUSTED_KEYRING Kconfig
    e2d1c9b39721 drm/panel: simple: Add missing connector type and pixel format for AUO T215HVN01
    c02917e70a05 drm/armada: Fix off-by-one error in armada_overlay_get_property()
    f41c65f8d05b of: unittest: fix null pointer dereferencing in of_unittest_find_node_by_name()
    883fdbbdbe93 drm/tegra: dpaux: Fix incorrect return value of platform_get_irq
    5f0994e3f271 drm/tegra: Remove superfluous error messages around platform_get_irq()
    4a61d72585af md/md-bitmap: hold 'reconfig_mutex' in backlog_store()
    8563d52a4f61 md/bitmap: don't set max_write_behind if there is no write mostly device
    a15f309eb99c drm/amdgpu: Update min() to min_t() in 'amdgpu_info_ioctl'
    8e766a94ec2d arm64: dts: qcom: sdm845: Fix the min frequency of "ice_core_clk"
    36d3e4dedb86 arm64: dts: qcom: sdm845: Add missing RPMh power domain to GCC
    0eea279e01fe ARM: dts: BCM53573: Fix Ethernet info for Luxul devices
    ed4e48de8962 drm: adv7511: Fix low refresh rate register for ADV7533/5
    61ccdd21679e ARM: dts: samsung: s5pv210-smdkv210: correct ethernet reg addresses (split)
    e9875d2f2507 ARM: dts: s5pv210: add dummy 5V regulator for backlight on SMDKv210
    c4c72bf42f48 ARM: dts: s5pv210: adjust node names to DT spec
    bbcea0924b83 ARM: dts: samsung: s3c6410-mini6410: correct ethernet reg addresses (split)
    a2d6c5e8e703 ARM: dts: s3c64xx: align pinctrl with dtschema
    3f0d83994e98 x86/mm: Fix PAT bit missing from page protection modify mask
    b56309c77d76 drm/etnaviv: fix dumping of active MMU context
    8303282409b3 ARM: dts: BCM53573: Use updated "spi-gpio" binding properties
    031ab0f10e3b ARM: dts: BCM53573: Add cells sizes to PCIe node
    8415d803d840 ARM: dts: BCM53573: Drop nonexistent #usb-cells
    cfc4a78e7054 ARM: dts: BCM53573: Describe on-SoC BCM53125 rev 4 switch
    36d958ad4088 ARM: dts: BCM5301X: Harmonize EHCI/OHCI DT nodes name
    826ef1576996 drm/amdgpu: avoid integer overflow warning in amdgpu_device_resize_fb_bar()
    967cbc8a23e5 arm64: dts: qcom: msm8996: Add missing interrupt to the USB2 controller
    71d2d9aa2bd8 soc: qcom: ocmem: Fix NUM_PORTS & NUM_MACROS macros
    1356531e9249 soc: qcom: ocmem: Add OCMEM hardware version print
    4bf179f53694 ASoC: stac9766: fix build errors with REGMAP_AC97
    86d89987f099 quota: fix dqput() to follow the guarantees dquot_srcu should provide
    af4ff4748985 quota: add new helper dquot_active()
    905e316e5e99 quota: rename dquot_active() to inode_quota_active()
    a5da2849db58 quota: factor out dquot_write_dquot()
    53805176ec6a drm/bridge: tc358764: Fix debug print parameter order
    abd1c17ef4fb netrom: Deny concurrent connect().
    b08cc6c0396f net/sched: sch_hfsc: Ensure inner classes have fsc curve
    ab04c731a198 hwmon: (tmp513) Fix the channel number in tmp51x_is_visible()
    db7a3531662c mlxsw: i2c: Limit single transaction buffer size
    3d36ba3f7e77 mlxsw: i2c: Fix chunk size setting in output mailbox buffer
    7cc9e1dcc1af net: arcnet: Do not call kfree_skb() under local_irq_disable()
    d4f79aa9ee34 wifi: ath9k: use IS_ERR() with debugfs_create_dir()
    50f89daf9e62 Bluetooth: btusb: Do not call kfree_skb() under spin_lock_irqsave()
    bef85d58f770 wifi: mwifiex: avoid possible NULL skb pointer dereference
    cfce1973ffe0 wifi: ath9k: protect WMI command response buffer replacement with a lock
    ee72b2b1f57e wifi: ath9k: fix races between ath9k_wmi_cmd and ath9k_wmi_ctrl_rx
    91d92d897560 samples/bpf: fix broken map lookup probe
    08a6e99a334d wifi: mwifiex: Fix missed return in oob checks failed path
    0c4240d23db5 wifi: mwifiex: fix memory leak in mwifiex_histogram_read()
    0fe11dd3fe05 fs: ocfs2: namei: check return value of ocfs2_add_entry()
    d8f5415d4d49 lwt: Check LWTUNNEL_XMIT_CONTINUE strictly
    a97f221651fc lwt: Fix return values of BPF xmit ops
    97ccf9f19580 hwrng: iproc-rng200 - Implement suspend and resume calls
    49729fc47289 crypto: caam - fix unchecked return value error
    7a97044477c9 ice: ice_aq_check_events: fix off-by-one check when filling buffer
    9b812dcf2b1e selftests/bpf: Clean up fmod_ret in bench_rename test script
    88bc7122dba2 net: tcp: fix unexcepted socket die when snd_wnd is 0
    e87da6a0ac6e Bluetooth: Fix potential use-after-free when clear keys
    6668886ebecc Bluetooth: nokia: fix value check in nokia_bluetooth_serdev_probe()
    625bf86bf53e crypto: api - Use work queue in crypto_destroy_instance
    7545292d87db crypto: stm32 - Properly handle pm_runtime_get failing
    323084d77d1f selftests/bpf: fix static assert compilation issue for test_cls_*.c
    a8d69658437c wifi: mwifiex: fix error recovery in PCIE buffer descriptor management
    3fe3923d092e wifi: mwifiex: Fix OOB and integer underflow when rx packets
    5120d93c24bb can: gs_usb: gs_usb_receive_bulk_callback(): count RX overflow errors also in case of OOM
    1d6c3017cea5 spi: tegra20-sflash: fix to check return value of platform_get_irq() in tegra_sflash_probe()
    ca7ee1b75c36 wifi: mt76: testmode: add nla_policy for MT76_TM_ATTR_TX_LENGTH
    791a12102e51 bpf: reject unhashed sockets in bpf_sk_assign
    4d271804f536 udp: re-score reuseport groups when connected sockets are present
    e6e11cbaa1f1 regmap: rbtree: Use alloc_flags for memory allocations
    1d210321de6d hwrng: nomadik - keep clock enabled while hwrng is registered
    f24152c20972 tcp: tcp_enter_quickack_mode() should be static
    b275f0ae3598 bpf: Clear the probe_addr for uprobe
    514116de91c4 bpftool: Use a local bpf_perf_event_value to fix accessing its fields
    920b2f99bcbd cpufreq: powernow-k8: Use related_cpus instead of cpus in driver.exit()
    133a1f45b9a6 x86/efistub: Fix PCI ROM preservation in mixed mode
    3de36b8b9bc5 s390/paes: fix PKEY_TYPE_EP11_AES handling for secure keyblobs
    e06326ff3aae s390/pkey: fix/harmonize internal keyblob headers
    08b1803bfc73 perf/imx_ddr: don't enable counter0 if none of 4 counters are used
    c0e1f9bddcea x86/decompressor: Don't rely on upper 32 bits of GPRs being preserved
    0682fc175c82 selftests/resctrl: Close perf value read fd on errors
    f399938a917d selftests/resctrl: Unmount resctrl FS if child fails to run benchmark
    bf1f7aeb5780 selftests/resctrl: Don't leak buffer in fill_cache()
    3ee719b3a026 OPP: Fix passing 0 to PTR_ERR in _opp_attach_genpd()
    066fbd8bc981 refscale: Fix uninitalized use of wait_queue_head_t
    ac96370db7e1 selftests/harness: Actually report SKIP for signal tests
    ac5a73b5d933 tmpfs: verify {g,u}id mount options correctly
    644e93a79056 fs: Fix error checking for d_hash_and_lookup()
    731f39e4a12b eventfd: prevent underflow for eventfd semaphores
    755e86f28ab9 eventfd: Export eventfd_ctx_do_read()
    6b5d585e2302 reiserfs: Check the return value from __getblk()
    5101e2c8a567 Revert "net: macsec: preserve ingress frame ordering"
    ca8f04553ecb udf: Handle error when adding extent to a file
    4ac54312f623 udf: Check consistency of Space Bitmap Descriptor
    42714d3d7097 net: Avoid address overwrite in kernel_connect
    4ded72985bb0 platform/mellanox: Fix mlxbf-tmfifo not handling all virtio CONSOLE notifications
    0c0547d2a60a tracing: Introduce pipe_cpumask to avoid race on trace_pipes
    99d8d419dd29 ALSA: seq: oss: Fix racy open/close of MIDI devices
    21f47cc15ae1 scsi: storvsc: Always set no_report_opcodes
    5cbc749d11f7 sctp: handle invalid error codes without calling BUG()
    2bdd081a7d7c bnx2x: fix page fault following EEH recovery
    d11a4542889d netlabel: fix shift wrapping bug in netlbl_catmap_setlong()
    7dd6ef1cedca scsi: qedi: Fix potential deadlock on &qedi_percpu->p_work_lock
    7a1a7f40adf2 idmaengine: make FSL_EDMA and INTEL_IDMA64 depends on HAS_IOMEM
    d399b6ce1ae6 net: usb: qmi_wwan: add Quectel EM05GV2
    bb8a4a36321d vmbus_testing: fix wrong python syntax for integer value comparison
    0ff30413a738 clk: fixed-mmio: make COMMON_CLK_FIXED_MMIO depend on HAS_IOMEM
    0111b7bb5143 kprobes: Prohibit probing on CFI preamble symbol
    654e3d27791c security: keys: perform capable check only on privileged operations
    b23cbd3c2518 ata: pata_arasan_cf: Use dev_err_probe() instead dev_err() in data_xfer()
    331d85f0bc6e ovl: Always reevaluate the file signature for IMA
    357badc01add drm/amd/display: Exit idle optimizations before attempt to access PHY
    de0cdcceaab3 platform/x86: huawei-wmi: Silence ambient light sensor
    8964b32a67e5 platform/x86: intel: hid: Always call BTNL ACPI method
    6b953ee81a45 ASoC: atmel: Fix the 8K sample parameter in I2SC master
    37121461dd47 ASoc: codecs: ES8316: Fix DMIC config
    bc2b0d4d37f1 fs/nls: make load_nls() take a const parameter
    0a584c077967 s390/dasd: fix hanging device after request requeue
    0c96df6913d4 s390/dasd: use correct number of retries for ERP requests
    a5fd143673f3 m68k: Fix invalid .section syntax
    f7700e987f6a vxlan: generalize vxlan_parse_gpe_hdr and remove unused args
    b7cd83cfff56 ethernet: atheros: fix return value check in atl1c_tso_csum()
    16c113426755 ASoC: da7219: Check for failure reading AAD IRQ events
    afa2dbd7d13b ASoC: da7219: Flush pending AAD IRQ when suspending
    efa372af6bfe 9p: virtio: make sure 'offs' is initialized in zc_request
    2f13007fbe66 media: pci: cx23885: fix error handling for cx23885 ATSC boards
    92704dd05521 media: pulse8-cec: handle possible ping error
    9d9cdc32bfce phy: qcom-snps-femto-v2: use qcom_snps_hsphy_suspend/resume error code
    a8ba2b695955 ARM: dts: imx: Set default tuning step for imx7d usdhc
    678a88ac02e5 ARM: dts: imx: Adjust dma-apbh node name
    6895499b2239 ARM: dts: imx7s: Drop dma-apb interrupt-names
    614c27dfdee0 ARM: dts: imx: update sdma node name format
    d45e2a3d2e4f ASoC: rt5682: Fix a problem with error handling in the io init function of the soundwire
    977baccbbd4e pinctrl: amd: Don't show `Invalid config param` errors
    f1d637b63d8a nilfs2: fix WARNING in mark_buffer_dirty due to discarded buffer reuse
    0e11bb5ad33d nilfs2: fix general protection fault in nilfs_lookup_dirty_data_buffers()
    734c6d3dc7b0 fsi: master-ast-cf: Add MODULE_FIRMWARE macro
    da5dc81ed2b5 firmware: stratix10-svc: Fix an NULL vs IS_ERR() bug in probe
    9fda2319018c serial: sc16is7xx: fix bug when first setting GPIO direction
    2f982ce208fe serial: sc16is7xx: fix broken port 0 uart init
    bd0ed45dd661 serial: qcom-geni: fix opp vote on shutdown
    c709c7ca020a configfs: fix a race in configfs_lookup()
    746b363bef41 Bluetooth: btsdio: fix use after free bug in btsdio_remove due to race condition
    b074fb0fa02e staging: rtl8712: fix race condition
    65bfaf5f9dea HID: wacom: remove the battery when the EKR is off
    542c61470732 usb: chipidea: imx: improve logic if samsung,picophy-* parameter is 0
    5c4996c22970 usb: dwc3: meson-g12a: do post init to fix broken usb after resumption
    d44fa38193c2 USB: serial: option: add FOXCONN T99W368/T99W373 product
    df6696e42e68 USB: serial: option: add Quectel EM05G variant (0x030e)
    f71b0b4a497e modules: only allow symbol_get of EXPORT_SYMBOL_GPL modules
    92de8497c342 rtc: ds1685: use EXPORT_SYMBOL_GPL for ds1685_rtc_poweroff
    1aeb76ffdfc0 net: enetc: use EXPORT_SYMBOL_GPL for enetc_phc_index
    d90e5956c0cc mmc: au1xmmc: force non-modular build and remove symbol_get usage
    c1112a2b54ce ARM: pxa: remove use of symbol_get()
    8c599aa78ce5 erofs: ensure that the post-EOF tails are all zeroed

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 8736873d65..b61c0a98c9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d68870980bca82eec6f5040ccb404717c0cac622"
-SRCREV_meta ?= "6ccf38515d9fbb6a468c2b1e470cd47599c6cf4e"
+SRCREV_machine ?= "361bd6dc8f750afb690d28fd9aab33d116b38f68"
+SRCREV_meta ?= "080adc96faafd98d2370b009338fcad42cf8e5fd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.194"
+LINUX_VERSION ?= "5.10.197"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 4ee674f35e..6e98407a7b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.194"
+LINUX_VERSION ?= "5.10.197"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "31f6d39bde4a241280ff357f0f052e56af1332e8"
-SRCREV_machine ?= "a9ebc91a4f1376324425811eee0a6628553d7d6e"
-SRCREV_meta ?= "6ccf38515d9fbb6a468c2b1e470cd47599c6cf4e"
+SRCREV_machine:qemuarm ?= "c27508f48245090385d55b192f866b6ad60a79f7"
+SRCREV_machine ?= "3050ddb1d59017a62d3d7d589a11d168be86b6a3"
+SRCREV_meta ?= "080adc96faafd98d2370b009338fcad42cf8e5fd"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index e4d7443df2..adb4aa69a0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -14,23 +14,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "bd08a530f711f7b511d70fc142169ceed446cfdb"
-SRCREV_machine:qemuarm64 ?= "8edb39e7f3399ef6f97a416069777d0230ad68bc"
-SRCREV_machine:qemumips ?= "582345c4ecdf0ba60551d25aa87656c2a039ad55"
-SRCREV_machine:qemuppc ?= "f00b3a49bc6e9ca12497cf50080c391e59696d06"
-SRCREV_machine:qemuriscv64 ?= "cf4ea7f5063f864ebc3dbc2b87ea4e550f24f803"
-SRCREV_machine:qemuriscv32 ?= "cf4ea7f5063f864ebc3dbc2b87ea4e550f24f803"
-SRCREV_machine:qemux86 ?= "cf4ea7f5063f864ebc3dbc2b87ea4e550f24f803"
-SRCREV_machine:qemux86-64 ?= "cf4ea7f5063f864ebc3dbc2b87ea4e550f24f803"
-SRCREV_machine:qemumips64 ?= "5b4830e32f3bd6fd82e93f60bf2e5da462419d31"
-SRCREV_machine ?= "cf4ea7f5063f864ebc3dbc2b87ea4e550f24f803"
-SRCREV_meta ?= "6ccf38515d9fbb6a468c2b1e470cd47599c6cf4e"
+SRCREV_machine:qemuarm ?= "28db2d5b2451e2c6b055dcd65bbe2fa581fa1538"
+SRCREV_machine:qemuarm64 ?= "3f6544c8ee1330484b5c341dcac662ef73836a0e"
+SRCREV_machine:qemumips ?= "7643ee350375086f23ddffbe1613150ce988dce5"
+SRCREV_machine:qemuppc ?= "9320f948b72a073ab0c27f0ca884842bb8eed036"
+SRCREV_machine:qemuriscv64 ?= "4eedb5d32121ace6ad137e7d01b22f94c592923e"
+SRCREV_machine:qemuriscv32 ?= "4eedb5d32121ace6ad137e7d01b22f94c592923e"
+SRCREV_machine:qemux86 ?= "4eedb5d32121ace6ad137e7d01b22f94c592923e"
+SRCREV_machine:qemux86-64 ?= "4eedb5d32121ace6ad137e7d01b22f94c592923e"
+SRCREV_machine:qemumips64 ?= "a3f4193c0ed91cbcfaed2e6cc984eb4906e511e0"
+SRCREV_machine ?= "4eedb5d32121ace6ad137e7d01b22f94c592923e"
+SRCREV_meta ?= "080adc96faafd98d2370b009338fcad42cf8e5fd"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.194"
+LINUX_VERSION ?= "5.10.197"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


