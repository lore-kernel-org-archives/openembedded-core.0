Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27300E748E7
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 19:40:45 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.47412.1696102839841289942
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 12:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=IQ9aXmH7;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.42, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1dcbd8a56d6so7485197fac.1
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 12:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696102839; x=1696707639; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F0yg/Bh2/sn0gWrtejaoXkkdaLlyZsVfbXB4WXlrICI=;
        b=IQ9aXmH7y2eNwV+STj+cTffZAfVP92+RxETQ7dobJs/gjRLpxo/gL8DkxoG5Eb0g0c
         ljd8I0bfXwyX7AEhbET94BEfZ8se8+MugEuNKI5ZXTI0kZh14dDpeii3b8E2v2sQQpU/
         vlpNFdCoYq9pTGhYYfdXespx+3dQdyWRV0UPcUIaXjkyLTbtK6kzoKhaZ3tPqSFl9ijs
         1TkO6wY+YOGrtKPQ/6BXNKEzMaxmI+Slj5EASQ/ycna83i26o5ceWRz6V8uxRL/j5uuq
         RnlzbEliqB1pzfBb+2YsKJEhgvtZCFYYh6d+wVAa+/BPjIy90/nEDP8IKhl+ibY4+J8/
         kvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696102839; x=1696707639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0yg/Bh2/sn0gWrtejaoXkkdaLlyZsVfbXB4WXlrICI=;
        b=S6v26C2P+31Speje5kRyiUYBVU2df0z7DJnrOsWY/o9psHbSYUwfbhGRAqTu2Vq5kW
         NegR30yVDs9kauVHPn0jaAvKo9gL+1Ej28amPB7fATlCgk8/1MLkTKd8lcjzhldrqoUS
         8H/ftFojv8Dg7zGkX+aSa/2TZd3CL6d1QVZFR5ngZsV11a50Aqg5K2f+bWJZx4ZZMzYC
         D3KyHi3Plp4cFZ2N9XQuxG+/4glbtfjCpl935/dqqGIShBV4n+yM68U1tomEON3vQVoC
         Jua9YuJv1r5YvPWQC2/b4rnx5jEhWTWCslp7vCbUI7SGhWLvI6SmQWTMdQ2VwYP34p+m
         kxpA==
X-Gm-Message-State: AOJu0Yz8CpqXS9BJXC+wWXq6pfx3jmZmyM/yn0tHVCZSPtmzAd4wJYrf
	uhSF9ZZwHDVFCTXdwqmtW7R+KMUfTHvF4zqKBEw=
X-Google-Smtp-Source: AGHT+IHe9qIaaEdWoqB0H1/pMOdbTWkE6rTL1Gih0lawndB80gOJ9Z4eE8AlzwpCCSJym6P/im6Tiw==
X-Received: by 2002:a05:6870:2187:b0:1c8:db75:c75e with SMTP id l7-20020a056870218700b001c8db75c75emr9323532oae.47.1696102838564;
        Sat, 30 Sep 2023 12:40:38 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id p2-20020a62ab02000000b006936d053677sm2880011pff.133.2023.09.30.12.40.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 12:40:38 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/13] linux-yocto/5.4: update to v5.4.254
Date: Sat, 30 Sep 2023 09:40:08 -1000
Message-Id: <d6d1a9c20536d9f8abc60419eec93fec66496964.1696102675.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696102675.git.steve@sakoman.com>
References: <cover.1696102675.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 19:40:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188476

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    fd2a1d1f32ea Linux 5.4.254
    e7711f15ed6b sch_netem: fix issues in netem_change() vs get_dist_table()
    3c3ffd6a3cf7 alpha: remove __init annotation from exported page_is_ram()
    e12fac07f61c scsi: core: Fix possible memory leak if device_add() fails
    cea09922f5f7 scsi: snic: Fix possible memory leak if device_add() fails
    12162414a7c1 scsi: 53c700: Check that command slot is not NULL
    048ebc9a28fb scsi: storvsc: Fix handling of virtual Fibre Channel timeouts
    ecb1fbe2879f scsi: core: Fix legacy /proc parsing buffer overflow
    979822844209 netfilter: nf_tables: report use refcount overflow
    137e25f0906e nvme-rdma: fix potential unbalanced freeze & unfreeze
    ab32fbe3fe70 nvme-tcp: fix potential unbalanced freeze & unfreeze
    756c024698f4 btrfs: set cache_block_group_error if we find an error
    fa7bc2684a05 btrfs: don't stop integrity writeback too early
    0a3b5893c6b1 ibmvnic: Handle DMA unmapping of login buffs in release functions
    d66a27113ebb net/mlx5: Allow 0 for total host VFs
    d7b2df974299 dmaengine: mcf-edma: Fix a potential un-allocated memory access
    e913d89445e3 wifi: cfg80211: fix sband iftype data lookup for AP_VLAN
    c2145b18740c IB/hfi1: Fix possible panic during hotplug remove
    9d469552c9d2 drivers: net: prevent tun_build_skb() to exceed the packet size limit
    67eebc7a9217 dccp: fix data-race around dp->dccps_mss_cache
    ef8810965f0c bonding: Fix incorrect deletion of ETH_P_8021AD protocol vid from slaves
    9c7deea5afcc net/packet: annotate data-races around tp->status
    60d9662f39f5 mISDN: Update parameter type of dsp_cmx_send()
    dd72849bce27 selftests/rseq: Fix build with undefined __weak
    302d848188d6 drm/nouveau/disp: Revert a NULL check inside nouveau_connector_get_modes
    ed8dcd9543b8 x86: Move gds_ucode_mitigated() declaration to header
    6b342b1f3b01 x86/mm: Fix VDSO and VVAR placement on 5-level paging machines
    91a5e755e11f x86/cpu/amd: Enable Zenbleed fix for AMD Custom APU 0405
    14254212b431 usb: common: usb-conn-gpio: Prevent bailing out if initial role is none
    25038d3f16b9 usb: dwc3: Properly handle processing of pending events
    044f4446e06b usb-storage: alauda: Fix uninit-value in alauda_check_media()
    b97dad01c121 binder: fix memory leak in binder_init()
    182f0e71ff34 iio: cros_ec: Fix the allocation size for cros_ec_command
    d2c539c216cc nilfs2: fix use-after-free of nilfs_root in dirtying inodes via iput
    655716938d14 x86/pkeys: Revert a5eff7259790 ("x86/pkeys: Add PKRU value to init_fpstate")
    ea1b4c31161f radix tree test suite: fix incorrect allocation size for pthreads
    aa0bfe169d29 drm/nouveau/gr: enable memory loads on helper invocation on all channels
    8a489b0bc87c dmaengine: pl330: Return DMA_PAUSED when transaction is paused
    7c62508d6b91 ipv6: adjust ndisc_is_useropt() to also return true for PIO
    0a67c1262162 mmc: moxart: read scr register without changing byte order
    4b4223f7d26d Linux 5.4.253
    9e5374875f96 Revert "driver core: Annotate dev_err_probe() with __must_check"
    ca33c0704151 drivers: core: fix kernel-doc markup for dev_err_probe()
    04ece65d9bad driver code: print symbolic error code
    f2c1b4f9c157 driver core: Annotate dev_err_probe() with __must_check
    2e8fc2ddffee ARM: dts: nxp/imx6sll: fix wrong property name in usbphy node
    a1ba8725577b ARM: dts: imx6sll: fixup of operating points
    6c71d73945d2 ARM: dts: imx: add usb alias
    66579ee141a5 ARM: dts: imx: Align L2 cache-controller nodename with dtschema
    3b454fb938e1 ARM: dts: imx6sll: Make ssi node name same as other platforms
    03b119d900fd arm64: dts: stratix10: fix incorrect I2C property for SCL signal
    72c946246e21 ceph: defer stopping mdsc delayed_work
    f82fe11a30ae ceph: use kill_anon_super helper
    82edffead586 ceph: show tasks waiting on caps in debugfs caps file
    632023a2b3ac PM: sleep: wakeirq: fix wake irq arming
    d7f34e2cdd12 PM / wakeirq: support enabling wake-up irq after runtime_suspend called
    9cbffa33749a selftests/rseq: Play nice with binaries statically linked against glibc 2.35+
    13553469bdbd selftests/rseq: check if libc rseq support is registered
    a65e7b4b31ca powerpc/mm/altmap: Fix altmap boundary check
    f8cf0f83cf04 mtd: rawnand: omap_elm: Fix incorrect type in assignment
    2af8ed119722 test_firmware: return ENOMEM instead of ENOSPC on failed memory allocation
    0f68b0f8eb5a test_firmware: prevent race conditions by a correct implementation of locking
    040cdadf9fdc ext2: Drop fragment support
    0336b42456e4 fs: Protect reconfiguration of sb read-write from racing writes
    a05ac5d00eb7 net: usbnet: Fix WARNING in usbnet_start_xmit/usb_submit_urb
    a2da00d1ea1a Bluetooth: L2CAP: Fix use-after-free in l2cap_sock_ready_cb
    0a44ceba77c3 fs/sysv: Null check to prevent null-ptr-deref bug
    1202deb153d6 net: tap_open(): set sk_uid from current_fsuid()
    1d53ea776760 net: tun_chr_open(): set sk_uid from current_fsuid()
    ae9cf40873d3 mtd: rawnand: meson: fix OOB available bytes for ECC
    8deaaf4be175 mtd: spinand: toshiba: Fix ecc_get_status
    eacb19bd7cd2 USB: zaurus: Add ID for A-300/B-500/C-700
    5107f9e8db60 libceph: fix potential hang in ceph_osdc_notify()
    6f14228e82fe scsi: zfcp: Defer fc_rport blocking until after ADISC response
    a490c2e8927e tcp_metrics: fix data-race in tcpm_suck_dst() vs fastopen
    6d49ed957d77 tcp_metrics: annotate data-races around tm->tcpm_net
    fc566cf344d8 tcp_metrics: annotate data-races around tm->tcpm_vals[]
    76b47daba7cd tcp_metrics: annotate data-races around tm->tcpm_lock
    38661fe6d001 tcp_metrics: annotate data-races around tm->tcpm_stamp
    96f14d689dc5 tcp_metrics: fix addr_same() helper
    0438e60a00d4 ip6mr: Fix skb_under_panic in ip6mr_cache_report()
    5b3dbedb8d4a net: dcb: choose correct policy to parse DCB_ATTR_BCN
    363c56f97122 net: ll_temac: fix error checking of irq_of_parse_and_map()
    7928f81443f6 net: ll_temac: Switch to use dev_err_probe() helper
    97d8a0bbda6b driver core: add device probe log helper
    227b8ce59cd3 bpf: sockmap: Remove preempt_disable in sock_map_sk_acquire
    1c8262f31fd2 net/sched: cls_route: No longer copy tcf_result on update to avoid use-after-free
    83e3d4b0ae37 net/sched: cls_fw: No longer copy tcf_result on update to avoid use-after-free
    be785808db32 net/sched: cls_u32: No longer copy tcf_result on update to avoid use-after-free
    b705759a1a25 net: add missing data-race annotation for sk_ll_usec
    95dd65f29070 net: add missing data-race annotations around sk->sk_peek_off
    8a6dddcb47a6 net: add missing READ_ONCE(sk->sk_rcvbuf) annotation
    ec4b7532d70b net: add missing READ_ONCE(sk->sk_sndbuf) annotation
    9cd3adc26e53 net: add missing READ_ONCE(sk->sk_rcvlowat) annotation
    481186cad78f net: annotate data-races around sk->sk_max_pacing_rate
    1774250a20d7 mISDN: hfcpci: Fix potential deadlock on &hc->lock
    42b28808070e net: sched: cls_u32: Fix match key mis-addressing
    1b047dc9108e perf test uprobe_from_different_cu: Skip if there is no gcc
    ad46d4861ed3 rtnetlink: let rtnl_bridge_setlink checks IFLA_BRIDGE_MODE length
    80381ecf2933 net/mlx5e: fix return value check in mlx5e_ipsec_remove_trailer()
    800d8c96bf99 net/mlx5: DR, fix memory leak in mlx5dr_cmd_create_reformat_ctx
    4730c0a1131c KVM: s390: fix sthyi error handling
    d2fb0969262c word-at-a-time: use the same return type for has_zero regardless of endianness
    be4d2b456206 loop: Select I/O scheduler 'none' from inside add_disk()
    11e929c38029 perf: Fix function pointer case
    1db90f97d719 arm64: Fix bit-shifting UB in the MIDR_CPU_MODEL() macro
    f41cab7a4653 arm64: Add AMPERE1 to the Spectre-BHB affected list
    6e4aa8c89034 ASoC: cs42l51: fix driver to properly autoload with automatic module loading
    cf8ecd6ea680 net/sched: sch_qfq: account for stab overhead in qfq_enqueue
    0e0f324c259d btrfs: fix race between quota disable and quota assign ioctls
    4f8f86bc5d33 btrfs: qgroup: return ENOTCONN instead of EINVAL when quotas are not enabled
    8c1d1f3a33e5 btrfs: qgroup: remove one-time use variables for quota_root checks
    c8b1499e420e cpufreq: intel_pstate: Drop ACPI _PSS states table patching
    f331413e1cf1 ACPI: processor: perflib: Avoid updating frequency QoS unnecessarily
    511851c87031 ACPI: processor: perflib: Use the "no limit" frequency QoS
    81cd6ceee7ce dm cache policy smq: ensure IO doesn't prevent cleaner policy progress
    e3efc4767a46 ASoC: wm8904: Fill the cache for WM8904_ADC_TEST_0 register
    00748bc586a4 s390/dasd: fix hanging device after quiesce/resume
    73e872466ddc virtio-net: fix race between set queues and probe
    6db2a3c5c201 btrfs: check if the transaction was aborted at btrfs_wait_for_commit()
    5adbd7ccd430 irq-bcm6345-l1: Do not assume a fixed block to cpu mapping
    a0019e13a9e9 tpm_tis: Explicitly check for error code
    d1c6e68003d3 btrfs: check for commit error at btrfs_attach_transaction_barrier()
    ee2eed8306b3 hwmon: (nct7802) Fix for temp6 (PECI1) processed even if PECI1 disabled
    5373a1aa91b2 staging: ks7010: potential buffer overflow in ks_wlan_set_encode_ext()
    352e0cae4cce Documentation: security-bugs.rst: clarify CVE handling
    e331a88ea56b Documentation: security-bugs.rst: update preferences when dealing with the linux-distros group
    fd21197af575 Revert "usb: xhci: tegra: Fix error check"
    e0c92c329131 usb: xhci-mtk: set the dma max_seg_size
    3f39d58a0c1a USB: quirks: add quirk for Focusrite Scarlett
    8f86b1b3b539 usb: ohci-at91: Fix the unhandle interrupt when resume
    640cb5f5e4b4 usb: dwc3: don't reset device side if dwc3 was configured as host-only
    a7d080cf4fab usb: dwc3: pci: skip BYT GPIO lookup table for hardwired phy
    5fc6ace75ceb Revert "usb: dwc3: core: Enable AutoRetry feature in the controller"
    80d40a3d6d45 can: gs_usb: gs_can_close(): add missing set of CAN state to CAN_STATE_STOPPED
    58f0affb3c47 USB: serial: simple: sort driver entries
    43ee3cf0c783 USB: serial: simple: add Kaufmann RKS+CAN VCP
    bcf1fc781ea1 USB: serial: option: add Quectel EC200A module support
    3ec7c5ef6021 USB: serial: option: support Quectel EM060K_128
    da7ebd86cd2e serial: sifive: Fix sifive_serial_console_setup() section
    d674cb90a9ef serial: 8250_dw: Preserve original value of DLF register
    cdcc35e64541 tracing: Fix warning in trace_buffered_event_disable()
    d7b20279244f ring-buffer: Fix wrong stat of cpu_buffer->read
    f6e1e569ac97 ata: pata_ns87415: mark ns87560_tf_read static
    53c06e0d15ee dm raid: fix missing reconfig_mutex unlock in raid_ctr() error paths
    9ebcca93bd41 block: Fix a source code comment in include/uapi/linux/blkzoned.h
    c0aad2fe1b9f ASoC: fsl_spdif: Silence output on stop
    3bd1b4793b01 drm/msm: Fix IS_ERR_OR_NULL() vs NULL check in a5xx_submit_in_rb()
    4970f72f810c drm/msm/adreno: Fix snapshot BINDLESS_DATA size
    5200bd7e6096 drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
    4990f529b745 RDMA/mlx4: Make check for invalid flags stricter
    74843851d418 benet: fix return value check in be_lancer_xmit_workarounds()
    07d9723cef28 net/sched: mqprio: Add length check for TCA_MQPRIO_{MAX/MIN}_RATE64
    2eb617529458 net/sched: mqprio: add extack to mqprio_parse_nlattr()
    29c5eb0ffac7 net/sched: mqprio: refactor nlattr parsing to a separate function
    17afc24d20c9 platform/x86: msi-laptop: Fix rfkill out-of-sync on MSI Wind U100
    504177c84f04 team: reset team's flags when down link is P2P device
    a3bb02598db9 bonding: reset bond's flags when down link is P2P device
    d87d67c8bdd1 tcp: Reduce chance of collisions in inet6_hashfn().
    458294ee1537 ipv6 addrconf: fix bug where deleting a mngtmpaddr can create a new temporary address
    a249705862d7 ethernet: atheros: fix return value check in atl1e_tso_csum()
    195e806b2afb phy: hisilicon: Fix an out of bounds check in hisi_inno_phy_probe()
    27b63e8b8552 vxlan: calculate correct header length for GPE
    5e98318c632d i40e: Fix an NULL vs IS_ERR() bug for debugfs_create_dir()
    6b1ee62ecbf1 ext4: fix to check return value of freeze_bdev() in ext4_shutdown()
    65bd66a794bf keys: Fix linking a duplicate key to a keyring's assoc_array
    c1df96689fe1 uapi: General notification queue definitions
    ea64c727f201 scsi: qla2xxx: Array index may go out of bound
    5e387df414f9 scsi: qla2xxx: Fix inconsistent format argument type in qla_os.c
    629628738078 pwm: meson: fix handling of period/duty if greater than UINT_MAX
    7ae4671a868e pwm: meson: Simplify duplicated per-channel tracking
    8abacc57af7b pwm: meson: Remove redundant assignment to variable fin_freq
    680e1455b828 ftrace: Fix possible warning on checking all pages used in ftrace_process_locs()
    05ff1d355e0b ftrace: Store the order of pages allocated in ftrace_page
    e3098e52bf5a ftrace: Check if pages were allocated before calling free_pages()
    aad84a978841 ftrace: Add information on number of page groups allocated
    bd020c7763d6 fs: dlm: interrupt posix locks only when process is killed
    f61d5752aed0 dlm: rearrange async condition return
    ed092c495e29 dlm: cleanup plock_op vs plock_xop
    a50ad9f8c06c PCI/ASPM: Avoid link retraining race
    e50434e33de9 PCI/ASPM: Factor out pcie_wait_for_retrain()
    7411202a0fee PCI/ASPM: Return 0 or -ETIMEDOUT from pcie_retrain_link()
    8eb15ff216c1 ext4: Fix reusing stale buffer heads from last failed mounting
    0204319de8ea ext4: rename journal_dev to s_journal_dev inside ext4_sb_info
    356056cbe667 btrfs: fix extent buffer leak after tree mod log failure at split_node()
    63008dab58ad btrfs: fix race between quota disable and relocation
    0a55f346e0e5 btrfs: qgroup: catch reserved space leaks at unmount time
    b070f29a6143 bcache: Fix __bch_btree_node_alloc to make the failure behavior consistent
    38a6dd2b68f9 bcache: remove 'int n' from parameter list of bch_bucket_alloc_set()
    edb81d6e1e50 gpio: tps68470: Make tps68470_gpio_output() always set the initial value
    34e71f7d3a03 jbd2: Fix wrongly judgement for buffer head removing while doing checkpoint
    937cb20746c8 jbd2: recheck chechpointing non-dirty buffer
    acc9a81f7cb2 jbd2: remove redundant buffer io error checks
    05d440d0f5da jbd2: fix kernel-doc markups
    b41fa1ed91de jbd2: fix incorrect code style

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 8bb9b8792d..38ffa5cce8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0d4b4bdf319c66188fed945ed84d55b63467a1cc"
-SRCREV_meta ?= "c068a3afc1a9d73b177643195e6b5546e6141efe"
+SRCREV_machine ?= "f2579170aa90e502fb972bdb87c150c909735056"
+SRCREV_meta ?= "b05cf0166411efabc3704035e61c93d8a299d702"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.252"
+LINUX_VERSION ?= "5.4.254"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index a9e59473f8..ce8f4ddfea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.252"
+LINUX_VERSION ?= "5.4.254"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "29ae0b5c67d29249bf00cb8eaaae5914d928bbd6"
-SRCREV_machine ?= "22f4db08b470bae35d90149956de4cdcd6b4c6ea"
-SRCREV_meta ?= "c068a3afc1a9d73b177643195e6b5546e6141efe"
+SRCREV_machine_qemuarm ?= "cb6922c0bf40c0171473ffad3e3c734af7535f9e"
+SRCREV_machine ?= "7121dcf1e4579162b3c5586cbdef005b155f2d00"
+SRCREV_meta ?= "b05cf0166411efabc3704035e61c93d8a299d702"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index f9afeb0acd..fc2a34dbcf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -13,16 +13,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9a096c043b453855252aece3716d50fdf4111a77"
-SRCREV_machine_qemuarm64 ?= "25499e5c52ebb2111a3dd7dd863937f56cf2a39d"
-SRCREV_machine_qemumips ?= "12e990899599d1aac8dd8007a8864db68135d6f0"
-SRCREV_machine_qemuppc ?= "19d91ad471bb87a464520283e58d5ff83c7151fa"
-SRCREV_machine_qemuriscv64 ?= "2adacd3242d46ddaff62e5a4695b98edf01cccc5"
-SRCREV_machine_qemux86 ?= "2adacd3242d46ddaff62e5a4695b98edf01cccc5"
-SRCREV_machine_qemux86-64 ?= "2adacd3242d46ddaff62e5a4695b98edf01cccc5"
-SRCREV_machine_qemumips64 ?= "854f6bee15babf95445644cba59691cd45173180"
-SRCREV_machine ?= "2176ac775b5360b26e8cab0f8c1607853af76633"
-SRCREV_meta ?= "c068a3afc1a9d73b177643195e6b5546e6141efe"
+SRCREV_machine_qemuarm ?= "b48a097e3afc2c3cb75439a138ad62aac1f611de"
+SRCREV_machine_qemuarm64 ?= "30e9b327db697ba836406fd892dd2461dcc52978"
+SRCREV_machine_qemumips ?= "1404c8a0c15cd302e99cb766cf117f53ec9d12d4"
+SRCREV_machine_qemuppc ?= "8ddc9d98289ff9e0dd92a5ac4a1ab9395286c426"
+SRCREV_machine_qemuriscv64 ?= "b8f66b4961995b49af6b392be1a28132afe0f9a6"
+SRCREV_machine_qemux86 ?= "b8f66b4961995b49af6b392be1a28132afe0f9a6"
+SRCREV_machine_qemux86-64 ?= "b8f66b4961995b49af6b392be1a28132afe0f9a6"
+SRCREV_machine_qemumips64 ?= "c64d8a92d051687aaf05990475254ad795d5105d"
+SRCREV_machine ?= "b8f66b4961995b49af6b392be1a28132afe0f9a6"
+SRCREV_meta ?= "b05cf0166411efabc3704035e61c93d8a299d702"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -31,7 +31,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.252"
+LINUX_VERSION ?= "5.4.254"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


