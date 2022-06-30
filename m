Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16F8ACCA47F
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 19:17:13 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.29321.1656616626464234028
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 12:17:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=femha4hq;
 spf=pass (domain: gmail.com, ip: 209.85.219.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id n15so607270qvh.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jun 2022 12:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F3QjW0eOq/ciZjhq3Oa4VaMadZxdm8H4JVBtVvxXyFo=;
        b=femha4hqqalpe6fYpjrYOKzbc+FLGsIG3TnP0G7UQysdsCuX1pQTwqTjwYFa2qPh1K
         F/YMFwg3OV+gQID3bhky7ZzOqJMGqamnPNvWd9b3F1Rys27wokqJd1K7vKQO6yrSOSS7
         lMW/0VvhWPpoErQMG8jxmYpq3HiMVqQVx6cyrnDl2ImEWb1NnvPEGyFJ1E/LQdyH0Ecs
         tcxlY3Pb5dXxAr8Kd3g67gZark+XIyNtv5X8360NkACMH5V8ZlbdswSd+NpON3J4CbcJ
         peBzzE39mvbdMLTcFTXWYjumqlj3blUcFxYH5q99+sqTBSv7NEkcMsUYvSMmKIBcnDED
         7/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F3QjW0eOq/ciZjhq3Oa4VaMadZxdm8H4JVBtVvxXyFo=;
        b=KVlg8RiSd2WeYIhOz2hc3GuD9A1+f8a54XHgOilAjGmOnM+zuDTilXjPMy1SJN5z/g
         HChEqfRaVQpklulhV2UxvUxYpTHS+5daXpix/yzkySUcya6hQnu4ZmvRrDAw/D+4ASy3
         HLsI8xjOmnuOBhHsqEjxEhrO9u8XSPlScv6Jgihm0MeS1C1PQy7RX/KHaPx94UcUV8M5
         hihXaTuJv+iZioA60icDZCHOVN4Sq0c5QG7rSH2eO9KTcmYASCLeVW00u7yKHPDTHtiz
         OM/UoWTgUFj/X5fTEy5QGcZnMN0LNg4McCKwS+IbGDmYko1MLpUBLt5wKtyi/aTnfk/x
         sF9g==
X-Gm-Message-State: AJIora/EAZ33ID3hlJHT/eebPM+Ai+zYRPt5CP79MKkPf9G4lraSBUA8
	37lSZkRZx4aHkpUVBXxX/JZnb5h0dQ5oJg==
X-Google-Smtp-Source: 
 AGRyM1s/bcWWwITfR7Q2xYb2sXYo9Op4UFQuqSl0VmS1jThg2E0f1hEqLT5ftgD8Xwn4GvB5rzmVOw==
X-Received: by 2002:ad4:596d:0:b0:470:7f34:fa13 with SMTP id
 eq13-20020ad4596d000000b004707f34fa13mr14167276qvb.55.1656616624065;
        Thu, 30 Jun 2022 12:17:04 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 c4-20020a05620a268400b006aee03a95dfsm15818291qkp.124.2022.06.30.12.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 12:17:03 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/7] linux-yocto/5.15: update to v5.15.48
Date: Thu, 30 Jun 2022 15:16:51 -0400
Message-Id: 
 <8ca1463f5053dd185e4ba8ecb9f1b174bbbccb99.1656616115.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1656616115.git.bruce.ashfield@gmail.com>
References: <cover.1656616115.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jun 2022 19:17:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167437

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    e1dd58c995da Linux 5.15.48
    147ae04a7c52 x86/speculation/mmio: Print SMT warning
    59d665a709b0 KVM: x86/speculation: Disable Fill buffer clear within guests
    ebd0f558b480 x86/speculation/mmio: Reuse SRBDS mitigation for SBDS
    30120b433c1f x86/speculation/srbds: Update SRBDS mitigation selection
    531eb5fe3171 x86/speculation/mmio: Add sysfs reporting for Processor MMIO Stale Data
    2044838ab228 x86/speculation/mmio: Enable CPU Fill buffer clearing on idle
    407d97b99f27 x86/bugs: Group MDS, TAA & Processor MMIO Stale Data mitigations
    d74f4eb1ddf0 x86/speculation/mmio: Add mitigation for Processor MMIO Stale Data
    8b9521e71179 x86/speculation: Add a common function for MD_CLEAR mitigation update
    d822b10f97f6 x86/speculation/mmio: Enumerate Processor MMIO Stale Data bug
    1fcc3d646f0b Documentation: Add documentation for Processor MMIO Stale Data
    3a0f70149324 Linux 5.15.47
    f7019562f142 xsk: Fix possible crash when multiple sockets are created
    90385f2b65d0 tcp: fix tcp_mtup_probe_success vs wrong snd_cwnd
    cfe3dd8bd526 dmaengine: idxd: add missing callback function to support DMA_INTERRUPT
    fb5e51c0aa97 iov_iter: fix build issue due to possible type mis-match
    7f36e2e13e29 zonefs: fix handling of explicit_open option on mount
    9e4810b4e1ab PCI: qcom: Fix pipe clock imbalance
    42c0160d27f6 net/sched: act_police: more accurate MTU policing
    4c106eb89534 md/raid0: Ignore RAID0 layout if the second zone has only one device
    51e557272482 random: account for arch randomness in bits
    e59a120f2d43 random: mark bootloader randomness code as __init
    ce49b94ddb70 random: avoid checking crng_ready() twice in random_init()
    32ca45300fd9 drm/ast: Create threshold values for AST2600
    82a2059a11b4 powerpc/mm: Switch obsolete dssall to .long
    2a0165d27897 powerpc/32: Fix overread/overwrite of thread_struct via ptrace
    2b7d9fd0f372 drm/amdgpu: update VCN codec support for Yellow Carp
    cab7cd86f9e8 drm/atomic: Force bridge self-refresh-exit on CRTC switch
    142bebf827b3 drm/bridge: analogix_dp: Support PSR-exit to disable transition
    84280ab2245c powerpc: Don't select HAVE_IRQ_EXIT_ON_IRQ_STACK
    3a7a81f4835d vduse: Fix NULL pointer dereference on sysfs access
    614ad9d24f9c Input: bcm5974 - set missing URB_NO_TRANSFER_DMA_MAP urb flag
    3eb91b7bc252 ixgbe: fix unexpected VLAN Rx in promisc mode on VF
    dc2673462e3d ixgbe: fix bcast packets Rx on VF after promisc removal
    a5989ae3c53b nfc: st21nfca: fix incorrect sizing calculations in EVT_TRANSACTION
    f444ecd3f57f nfc: st21nfca: fix memory leaks in EVT_TRANSACTION handling
    73b28763050f nfc: st21nfca: fix incorrect validating logic in EVT_TRANSACTION
    bafbc134f5b0 writeback: Fix inode->i_io_list not be protected by inode->i_lock error
    cba7c76ea1e1 net: openvswitch: fix misuse of the cached connection on tuple changes
    50ca4e7f91ff net: phy: dp83867: retrigger SGMII AN when link change
    0efa89742fd8 mmc: block: Fix CQE recovery reset success
    63af49e0881c ata: libata-transport: fix {dma|pio|xfer}_mode sysfs files
    0dcc35c1c23a KEYS: trusted: tpm2: Fix migratable logic
    0cd4a1766759 cifs: fix reconnect on smb3 mount types
    7aa4b31291f1 cifs: return errors during session setup during reconnects
    700484081ea7 ALSA: hda/realtek: Add quirk for HP Dev One
    0179650a13f9 ALSA: hda/realtek: Fix for quirk to enable speaker output on the Lenovo Yoga DuetITL 2021
    7fea196ccb4e ALSA: hda/conexant - Fix loopback issue with CX20632
    04f79360c69a ALSA: usb-audio: Set up (implicit) sync for Saffire 6
    2ee0b454fda7 ALSA: usb-audio: Skip generic sync EP parse for secondary EP
    8fe1ee581846 scripts/gdb: change kernel config dumping method
    d3e38fdf9e10 vringh: Fix loop descriptors check in the indirect cases
    f293dfc18404 nodemask: Fix return values to be unsigned
    b2d359f09588 drm/amd/pm: use bitmap_{from,to}_arr32 where appropriate
    dc105d20122d cifs: version operations for smb20 unneeded when legacy support disabled
    12eb4e7db22a s390/gmap: voluntarily schedule during key setting
    c4ba982bd508 nbd: fix io hung while disconnecting device
    71c142f910da nbd: fix race between nbd_alloc_config() and module removal
    cbeafa7a79d0 nbd: call genl_unregister_family() first in nbd_cleanup()
    38d432f4b391 jump_label,noinstr: Avoid instrumentation for JUMP_LABEL=n builds
    0853f905e48b x86/cpu: Elide KCSAN for cpu_has() and friends
    4adc7d7ee640 modpost: fix undefined behavior of is_arm_mapping_symbol()
    5877390da911 um: line: Use separate IRQs per line
    e0199ce728fb drm/amd/pm: Fix missing thermal throttler status
    7b7fba107b2c drm/radeon: fix a possible null pointer dereference
    10ef82d6e0af drm/amd/display: Check if modulo is 0 before dividing.
    1daf72982efe ceph: flush the mdlog for filesystem sync
    cc983cf9ee39 ceph: allow ceph.dir.rctime xattr to be updatable
    729fea8aaf2c Revert "net: af_key: add check for pfkey_broadcast in function pfkey_process"
    2cd1adcb8c08 scsi: myrb: Fix up null pointer access on myrb_cleanup()
    b5a0f17b03df md: protect md_unregister_thread from reentrancy
    0b4a66eb96de watchdog: wdat_wdt: Stop watchdog when rebooting the system
    e369420e1234 kernfs: Separate kernfs_pr_cont_buf and rename_lock.
    d21ffa548737 serial: msm_serial: disable interrupts in __msm_console_write()
    f36e754a1f0b staging: rtl8712: fix uninit-value in r871xu_drv_init()
    95b0f54f8a89 staging: rtl8712: fix uninit-value in usb_read8() and friends
    55bfe858d019 clocksource/drivers/sp804: Avoid error on multiple instances
    368e68ad6da4 extcon: Modify extcon device to be created after driver data is set
    4785574f0caf extcon: Fix extcon_get_extcon_dev() error handling
    e7686d80fc3c misc: rtsx: set NULL intfdata when probe fails
    89401b5e9cf3 soundwire: qcom: adjust autoenumeration timeout
    547ebdc200b8 usb: dwc2: gadget: don't reset gadget's driver->bus
    98cf0cd959ef sysrq: do not omit current cpu when showing backtrace of all active CPUs
    bc8fceda3b89 char: xillybus: fix a refcount leak in cleanup_dev()
    feb0fb39695b USB: hcd-pci: Fully suspend across freeze/thaw cycle
    d88875387219 drivers: usb: host: Fix deadlock in oxu_bus_suspend()
    2cbfc38df580 drivers: tty: serial: Fix deadlock in sa1100_set_termios()
    3592cfd8b848 USB: host: isp116x: check return value after calling platform_get_resource()
    fef451f0fbbe drivers: staging: rtl8192e: Fix deadlock in rtllib_beacons_stop()
    042915c1bfed drivers: staging: rtl8192u: Fix deadlock in ieee80211_beacons_stop()
    04a8e39c8c9b thunderbolt: Use different lane for second DisplayPort tunnel
    5f9b2e4ca88c tty: Fix a possible resource leak in icom_probe
    8a95696bdc0e tty: synclink_gt: Fix null-pointer-dereference in slgt_clean()
    ae60744d5fad drivers: staging: rtl8192bs: Fix deadlock in rtw_joinbss_event_prehandle()
    f89f6c3ebf69 drivers: staging: rtl8723bs: Fix deadlock in rtw_surveydone_event_callback()
    b10e1171341c lkdtm/usercopy: Expand size of "out of frame" object
    3692f17e7036 iio: st_sensors: Add a local lock for protecting odr
    8eb42d6d10f8 staging: rtl8712: fix a potential memory leak in r871xu_drv_init()
    9f9ed31de4dd iio: dummy: iio_simple_dummy: check the return value of kstrdup()
    bd08704b8a4d iov_iter: Fix iter_xarray_get_pages{,_alloc}()
    614d81bba75d nfp: flower: restructure flow-key for gre+vlan combination
    f1fec5ccbe70 drm: imx: fix compiler warning with gcc-12
    9c1fb2e93844 tcp: use alloc_large_system_hash() to allocate table_perturb
    9b18f01a5120 net: dsa: mv88e6xxx: use BMSR_ANEGCOMPLETE bit for filling an_complete
    e31d9ba16986 net: altera: Fix refcount leak in altera_tse_mdio_create
    e6b6f98fc760 ip_gre: test csum_start instead of transport header
    356f3d808e77 net/mlx5: fs, fail conflicting actions
    0e92af67f051 net/mlx5: Rearm the FW tracer after each tracer event
    d2ebc436aab9 net/mlx5: Fix mlx5_get_next_dev() peer device matching
    65a5ea7cb9c7 net/mlx5: Lag, filter non compatible devices
    1084716f76c8 net: ipv6: unexport __init-annotated seg6_hmac_init()
    85a055c03691 net: xfrm: unexport __init-annotated xfrm4_protocol_init()
    59fa94cddf9e net: mdio: unexport __init-annotated mdio_bus_init()
    6dda4426fa77 SUNRPC: Fix the calculation of xdr->end in xdr_get_next_encode_buffer()
    71afd0ceb5b0 xsk: Fix handling of invalid descriptors in XSK TX batching API
    761b4fa75205 i40e: xsk: Move tmp desc array from driver to pool
    403659df77b6 net/mlx4_en: Fix wrong return value on ioctl EEPROM query failure
    54d6802c4d83 net: dsa: lantiq_gswip: Fix refcount leak in gswip_gphy_fw_list
    3f4d5e727aea bpf, arm64: Clear prog->jited_len along prog->jited
    c926ae58f24f af_unix: Fix a data-race in unix_dgram_peer_wake_me().
    39475043ffbc stmmac: intel: Fix an error handling path in intel_eth_pci_probe()
    40e6078fcf18 xen: unexport __init-annotated xen_xlate_map_ballooned_pages()
    23cb1fef93d2 netfilter: nf_tables: bail out early if hardware offload is not supported
    e33d9bd563e7 netfilter: nf_tables: memleak flow rule from commit path
    fb2962f9a1b4 netfilter: nf_tables: release new hooks on unsupported flowtable flags
    888312dc297a ata: pata_octeon_cf: Fix refcount leak in octeon_cf_probe
    77b68c59f6c9 netfilter: nf_tables: always initialize flowtable hook list in transaction
    ea26bf5eca14 SUNRPC: Trap RDMA segment overflows
    7a60594efdd5 powerpc/kasan: Force thread size increase with KASAN
    f275989ad041 netfilter: nf_tables: delete flowtable hooks via transaction list
    73629859a997 netfilter: nf_tables: use kfree_rcu(ptr, rcu) to release hooks in clean_net path
    bf65364cd74c netfilter: nat: really support inet nat without l3 address
    291efcb6ff49 drm/bridge: ti-sn65dsi83: Handle dsi_lanes == 0 as invalid
    fde5ff6ab6c7 drm/bridge: sn65dsi83: Fix an error handling path in sn65dsi83_probe()
    a3fc8051ee06 xprtrdma: treat all calls not a bcall when bc_serv is NULL
    21c6ee673401 f2fs: fix to tag gcing flag on page during file defragment
    b382115016c8 m68knommu: fix undefined reference to `mach_get_rtc_pll'
    4211742f0f9e RISC-V: use memcpy for kexec_file mode
    ca02b9675532 video: fbdev: pxa3xx-gcu: release the resources correctly in pxa3xx_gcu_probe/remove()
    e4cf9982ff3e video: fbdev: hyperv_fb: Allow resolutions with size > 64 MB for Gen1
    d4c2a041ed3b NFSv4: Don't hold the layoutget locks across multiple RPC calls
    7b5488f4721f dmaengine: zynqmp_dma: In struct zynqmp_dma_chan fix desc_size data type
    ed9b34f616f9 m68knommu: fix undefined reference to `_init_sp'
    40426b4f08bc m68knommu: set ZERO_PAGE() to the allocated zeroed page
    015e9831547e i2c: cadence: Increase timeout per message if necessary
    99c09b298e47 f2fs: remove WARN_ON in f2fs_is_valid_blkaddr
    fb0f1c5eb8d6 iommu/arm-smmu-v3: check return value after calling platform_get_resource()
    98dd53a92825 iommu/arm-smmu: fix possible null-ptr-deref in arm_smmu_device_probe()
    6eb85cbd9ef8 tracing: Avoid adding tracer option before update_tracer_options
    9b534640a2c6 tracing: Fix sleeping function called from invalid context on RT kernel
    c1c62c5fa9a3 tracing: Make tp_printk work on syscall tracepoints
    e8864a3c9da9 bootconfig: Make the bootconfig.o as a normal object file
    1699ec1bfb59 mips: cpc: Fix refcount leak in mips_cpc_default_phys_base
    0a0539c524fa dmaengine: idxd: set DMA_INTERRUPT cap bit
    340cf8272540 perf c2c: Fix sorting in percent_rmt_hitm_cmp()
    29357883a891 driver core: Fix wait_for_device_probe() & deferred_probe_timeout interaction
    92a930fcf425 tipc: check attribute length for bearer name
    0fcb0b131cc9 scsi: sd: Fix potential NULL pointer dereference
    73647a1f92d1 afs: Fix infinite loop found by xfstest generic/676
    0c6cd71caa7c gpio: pca953x: use the correct register address to do regcache sync
    cedca5b2f08b regulator: mt6315-regulator: fix invalid allowed mode
    66e2bf4b2cef s390/mcck: isolate SIE instruction when setting CIF_MCCK_GUEST flag
    a96cae49dcbb octeontx2-af: fix error code in is_valid_offset()
    9983f49a994e vdpa: ifcvf: set pci driver data in probe
    88cd23214620 tcp: tcp_rtx_synack() can be called from process context
    f7ca1989fd21 net: sched: add barrier to fix packet stuck problem for lockless qdisc
    4ddcfb7870cf net/mlx5e: Update netdev features after changing XDP state
    a6d0af6d329d net/mlx5: correct ECE offset in query qp output
    e5a1557906da net/mlx5: CT: Fix header-rewrite re-use for tupels
    4a333ec73dee net/mlx5e: TC NIC mode, fix tc chains miss table
    29e0872acbd1 net/mlx5: Don't use already freed action pointer
    e3b9204c08a7 virtio: pci: Fix an error handling path in vp_modern_probe()
    655aafaa80ca vdpa: Fix error logic in vdpa_nl_cmd_dev_get_doit
    4a45a7dcc55e block: make bioset_exit() fully resilient against being called twice
    06cb7e134f8f sfc: fix wrong tx channel offset with efx_separate_tx_channels
    5567d69b95b9 sfc: fix considering that all channels have TX queues
    7768d102b143 nfp: only report pause frame configuration for physical device
    3308676ec525 tcp: add accessors to read/set tp->snd_cwnd
    4d481469137d net/smc: fixes for converting from "struct smc_cdc_tx_pend **" to "struct smc_wr_tx_pend_priv *"
    6005d36fbc82 riscv: read-only pages should not be writable
    33a5c6009ab8 block: take destination bvec offsets into account in bio_copy_data_iter
    f95e24bf19e2 bpf: Fix probe read error in ___bpf_prog_run()
    d03edc02a752 selftests/bpf: fix stacktrace_build_id with missing kprobe/urandom_read
    8969c3b1051e selftests/bpf: fix selftest after random: Urandom_read tracepoint removal
    5ff2514e4fb5 ubi: ubi_create_volume: Fix use-after-free when volume creation failed
    f61b9c8760af ubi: fastmap: Fix high cpu usage of ubi_bgt by making sure wl_pool not empty
    ecc53e585965 jffs2: fix memory leak in jffs2_do_fill_super
    a53131a69515 modpost: fix removing numeric suffixes
    c1df9cb756e5 net: dsa: mv88e6xxx: Fix refcount leak in mv88e6xxx_mdios_register
    a4b7ef3b1598 net: ethernet: ti: am65-cpsw-nuss: Fix some refcount leaks
    b24ca1cf8462 net: ethernet: mtk_eth_soc: out of bounds read in mtk_hwlro_get_fdir_entry()
    1e853f235a01 net: sched: fixed barrier to prevent skbuff sticking in qdisc backlog
    a67b46468ae9 s390/crypto: fix scatterwalk_unmap() callers in AES-GCM
    8a04477f3be9 clocksource/drivers/oxnas-rps: Fix irq_of_parse_and_map() return value
    f3274083975b ASoC: fsl_sai: Fix FSL_SAI_xDR/xFR definition
    460aa288c5cd blk-mq: don't touch ->tagset in blk_mq_get_sq_hctx
    7a4afd8a003d watchdog: ts4800_wdt: Fix refcount leak in ts4800_wdt_probe
    5487a135c903 watchdog: rti-wdt: Fix pm_runtime_get_sync() error checking
    df6de52b80aa driver core: fix deadlock in __device_attach
    cdf1a683a015 driver: base: fix UAF when driver_attach failed
    40960520a940 bus: ti-sysc: Fix warnings for unbind for serial
    fdffa4ad8f6b firmware: dmi-sysfs: Fix memory leak in dmi_sysfs_register_handle
    002949a3aedb serial: stm32-usart: Correct CSIZE, bits, and parity
    8137c0e48bca serial: st-asc: Sanitize CSIZE and correct PARENB for CS7
    c11c1cdd4f0e serial: sifive: Sanitize CSIZE and c_iflag
    b1ca16ac17ad serial: sh-sci: Don't allow CS5-6
    da689ae549c5 serial: txx9: Don't allow CS5-6
    954a7194b164 serial: rda-uart: Don't allow CS5-6
    899c5aabd0a9 serial: digicolor-usart: Don't allow CS5-6
    899938f18093 serial: cpm_uart: Fix build error without CONFIG_SERIAL_CPM_CONSOLE
    8303f34e733f serial: 8250_fintek: Check SER_RS485_RTS_* only with RS485
    4c96e6aeacf5 serial: meson: acquire port->lock in startup()
    9a63ef418a4e tty: n_gsm: Fix packet data hex dump output
    80dfe1798aa0 tty: n_gsm: Don't ignore write return value in gsmld_output()
    029983ea88e5 staging: r8188eu: add check for kzalloc
    e1928887219b rtc: ftrtc010: Fix error handling in ftrtc010_rtc_probe
    49f698e22052 rtc: ftrtc010: Use platform_get_irq() to get the interrupt
    865051de2d9e rtc: mt6397: check return value after calling platform_get_resource()
    fb60291c0fde ARM: dts: aspeed: ast2600-evb: Enable RX delay for MAC0/MAC1
    604e35f70475 clocksource/drivers/riscv: Events are stopped during CPU suspend
    aab25b669cb9 soc: rockchip: Fix refcount leak in rockchip_grf_init
    a6061695bb2b extcon: ptn5150: Add queue work sync before driver release
    cf824b95c12a ksmbd: fix reference count leak in smb_check_perm_dacl()
    fffde6d1c679 coresight: cpu-debug: Replace mutex with mutex_trylock on panic notifier
    fd18fb38d6a4 soundwire: intel: prevent pm_runtime resume prior to system suspend
    b3983b1042e4 export: fix string handling of namespace in EXPORT_SYMBOL_NS
    cbf9172eb657 serial: sifive: Report actual baud base rather than fixed 115200
    5157979d8c79 power: supply: axp288_fuel_gauge: Drop BIOS version check from "T3 MRD" DMI quirk
    90e2993c8d88 phy: qcom-qmp: fix pipe-clock imbalance on power-on failure
    ede251293753 misc/pvpanic: Convert regular spinlock into trylock on panic path
    ee94d7468679 pvpanic: Fix typos in the comments
    d2ba56d55cea rpmsg: qcom_smd: Fix returning 0 if irq_of_parse_and_map() fails
    276f7c6165bf iio: adc: sc27xx: Fine tune the scale calibration values
    31f3f2a598f6 iio: adc: sc27xx: fix read big scale voltage not right
    7c7bc8b82fff iio: proximity: vl53l0x: Fix return value check of wait_for_completion_timeout
    79f83f388ba3 iio: adc: stmpe-adc: Fix wait_for_completion_timeout return value check
    4ff1449e8fd9 rpmsg: virtio: Fix the unregistration of the device rpmsg_ctrl
    b94d40c792de rpmsg: virtio: Fix possible double free in rpmsg_virtio_add_ctrl_dev()
    eaf37bb6b4f7 rpmsg: virtio: Fix possible double free in rpmsg_probe()
    12452c776090 usb: typec: mux: Check dev_set_name() return value
    3b687b407179 firmware: stratix10-svc: fix a missing check on list iterator
    c25feda42f14 misc: fastrpc: fix an incorrect NULL check on list iterator
    c8eb1ea6e839 usb: dwc3: pci: Fix pm_runtime_get_sync() error checking
    1c6e5dc3b639 usb: dwc3: gadget: Replace list_for_each_entry_safe() if using giveback
    603efacb71e3 rpmsg: qcom_smd: Fix irq_of_parse_and_map() return value
    c49c6a1bf02d pwm: raspberrypi-poe: Fix endianness in firmware struct
    2c0079979df6 pwm: lp3943: Fix duty calculation in case period was clamped
    52e848568aa3 staging: fieldbus: Fix the error handling path in anybuss_host_common_probe()
    10243224fd45 usb: musb: Fix missing of_node_put() in omap2430_probe
    09ad026dac0e USB: storage: karma: fix rio_karma_init return
    90ab34df6654 usb: usbip: add missing device lock on tweak configuration cmd
    51422046be50 usb: usbip: fix a refcount leak in stub_probe()
    433a689cadea remoteproc: imx_rproc: Ignore create mem entry for resource table
    b62bbf8a4753 tty: serial: fsl_lpuart: fix potential bug when using both of_alias_get_id and ida_simple_get
    923d34ce069e serial: 8250_aspeed_vuart: Fix potential NULL dereference in aspeed_vuart_probe
    c84fa729f8db tty: n_tty: Restore EOF push handling behavior
    f307bdb67018 tty: serial: owl: Fix missing clk_disable_unprepare() in owl_uart_probe
    da64f419d7f7 tty: goldfish: Use tty_port_destroy() to destroy port
    20e75f3c6e09 lkdtm/bugs: Don't expect thread termination without CONFIG_UBSAN_TRAP
    1aeeca2b8397 lkdtm/bugs: Check for the NULL pointer after calling kmalloc
    1deb5f87053e iio: adc: ad7124: Remove shift from scan_type
    b34163bf9967 staging: greybus: codecs: fix type confusion of list iterator variable
    9d919665a089 pcmcia: db1xxx_ss: restrict to MIPS_DB1XXX boards

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index d5f021af48..c81c47e290 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "23374f7aa07401ca2d34ca395472da35c669b126"
-SRCREV_meta ?= "6b9da9c15f1c04c1b22ef4b10d68303df2d4a470"
+SRCREV_machine ?= "9474b2c18a66a8172c2a13c9e83f02bd72e3df1d"
+SRCREV_meta ?= "8828a8e63fc50647e3f714a8a87a95c6d3e5b391"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.46"
+LINUX_VERSION ?= "5.15.48"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 7a7518164c..b82aa62da9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.46"
+LINUX_VERSION ?= "5.15.48"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "95b2ba04f3faff2d7f9326e43691c0c5ac36bbf9"
-SRCREV_meta ?= "6b9da9c15f1c04c1b22ef4b10d68303df2d4a470"
+SRCREV_machine ?= "59aca7a6181799d691277b32cc202cf5ac997683"
+SRCREV_meta ?= "8828a8e63fc50647e3f714a8a87a95c6d3e5b391"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 0112f8a649..91106223df 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "718d6e78d83aa36b177d207f2379d4ce7fff11a4"
-SRCREV_machine:qemuarm64 ?= "ad1628ba58a32df261f2219ed7ae8469446b0e0a"
-SRCREV_machine:qemumips ?= "9a408c87b3b08d47246d6c04ee9de8828c315d54"
-SRCREV_machine:qemuppc ?= "9360ffdc0172bfa039fb01f1c739b1740af8486d"
-SRCREV_machine:qemuriscv64 ?= "7d6bb4300a230d090a6c7a375128b75e95470e94"
-SRCREV_machine:qemuriscv32 ?= "7d6bb4300a230d090a6c7a375128b75e95470e94"
-SRCREV_machine:qemux86 ?= "7d6bb4300a230d090a6c7a375128b75e95470e94"
-SRCREV_machine:qemux86-64 ?= "7d6bb4300a230d090a6c7a375128b75e95470e94"
-SRCREV_machine:qemumips64 ?= "439653a76bb6dcc3dfb6fdc8d8dad83ff3659d46"
-SRCREV_machine ?= "7d6bb4300a230d090a6c7a375128b75e95470e94"
-SRCREV_meta ?= "6b9da9c15f1c04c1b22ef4b10d68303df2d4a470"
+SRCREV_machine:qemuarm ?= "3e17faed75180f7affdd91e64206e0bbae384099"
+SRCREV_machine:qemuarm64 ?= "fd047e27b9e51cf93e3a8a4ccb3999cca4709741"
+SRCREV_machine:qemumips ?= "f7515b17b0527fe060c102df0fea6ff82da1489b"
+SRCREV_machine:qemuppc ?= "5aa3abf07bfd44ffda1a7759e3996bfaee9ad4ec"
+SRCREV_machine:qemuriscv64 ?= "4ec79de9ce697cea8c9aa2e2781e5a464ba2ccf0"
+SRCREV_machine:qemuriscv32 ?= "4ec79de9ce697cea8c9aa2e2781e5a464ba2ccf0"
+SRCREV_machine:qemux86 ?= "4ec79de9ce697cea8c9aa2e2781e5a464ba2ccf0"
+SRCREV_machine:qemux86-64 ?= "4ec79de9ce697cea8c9aa2e2781e5a464ba2ccf0"
+SRCREV_machine:qemumips64 ?= "6b35c884701422bd1ce0821ce316993483283d6a"
+SRCREV_machine ?= "4ec79de9ce697cea8c9aa2e2781e5a464ba2ccf0"
+SRCREV_meta ?= "8828a8e63fc50647e3f714a8a87a95c6d3e5b391"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "aed23654e8ed2cc776ae26a87ef773ff38b48d7f"
+SRCREV_machine:class-devupstream ?= "e1dd58c995daf8b632344b61df9d3cbed26454dc"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.46"
+LINUX_VERSION ?= "5.15.48"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


