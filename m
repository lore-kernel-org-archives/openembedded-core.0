Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D9BC04FFE
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 03:00:25 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.web11.4326.1714705218553600413
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 20:00:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QhAaIGBG;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6a0a7cf89deso27894536d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 20:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714705217; x=1715310017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FuPdsZnw3llLJ4h+qb+MkwojrydT4kSb1+5hibqRUMM=;
        b=QhAaIGBGXFLCn0vO4//pmso7q5w+9a/BI8adEHrWAqQvSivI0QFOeQa69kL/n1flcV
         TtCGs217JmlqOXa/SEcU7Aeyv+depf0fEq4NEgG5P0bID776VzttE5HnZbk57yJ1LT2G
         Tml90sMrIxtQgGWtVplbGystBSD0JAAN7uOJzExa3CUzOdLXJHbAihJrn3q4bapPCN1c
         KMITUr+w3DoNSnA2EO10T5WeKa3AWZXVfLPRivJH2/u5czfSiEn8lSOPQaXRRg5KZb2y
         9+sO3DWoTQ5UcrqM+WgqAai7UgMpp3c5n6OqY+UYjk8DUUR9MjHDCh5cD3yyBnukS3NG
         QgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714705217; x=1715310017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FuPdsZnw3llLJ4h+qb+MkwojrydT4kSb1+5hibqRUMM=;
        b=ipJzYl3WL5/nl5AzE+rg3XH7C8Oh3mTAY7k1SqtLp84cMOpS31A9Tw3aahNDQs7VqY
         mItPwknoBw3k2TbhZkRRaA4UTieZ9U5J4JDMa8jybaiLcl0P7CgZDjrEDBH5yRebaGfw
         JiMxXWquP/z03v0HDXK55jFALDDneWwoZjeu+umuiRbNoLHKACeto/bwuqaTQYpnyiHL
         7+tag8h1uJFKau/zLpnuz85TsFLko3Do9hMJIBTXGw1SUrXsiYQdUcPBNVZh4+RKF35z
         F2UDaErof4+xDcPGZdvLish5hUn4H5x5pSvV5KRe//wSW17PDPufzdksFHWymNkGLsbP
         KXZw==
X-Gm-Message-State: AOJu0YzfpGoXeo5O2cP1A6i7KUbvUVOlSH8SDf1/e1Dk7ZnTAElcsAih
	aN6zrV4dAVOd5XpkMtIpZxFlZAS2gVgn99uj60d5wuAJRd9bBy3K6Mrxcw==
X-Google-Smtp-Source: AGHT+IHIElhI6kSv+TGLJw8ZjKb8HfEF+UqiPeIX1jULbl0/nkZsNA1PiXROmSBoTHuE4rb0veKrOQ==
X-Received: by 2002:a05:6214:1314:b0:6a0:583b:8cc5 with SMTP id pn20-20020a056214131400b006a0583b8cc5mr1601626qvb.33.1714705217387;
        Thu, 02 May 2024 20:00:17 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id mi5-20020a056214558500b006a0fa96013asm839357qvb.138.2024.05.02.20.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 20:00:16 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 01/10] linux-yocto/6.1: update to v6.1.79
Date: Thu,  2 May 2024 23:00:06 -0400
Message-Id: <20240503030015.374078-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 03:00:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198956

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.1 to the latest korg -stable release that comprises
the following commits:

    81e1dc2f7001 Linux 6.1.79
    6fd24675188d mlxsw: spectrum_acl_tcam: Fix stack corruption
    9020513afafe fs/ntfs3: Add null pointer checks
    d028cc6d235f arm64: Subscribe Microsoft Azure Cobalt 100 to ARM Neoverse N2 errata
    c5d83ac2bf6c dm: limit the number of targets and parameter size area
    13f79a002602 nilfs2: replace WARN_ONs for invalid DAT metadata block requests
    6589f0f72f8e nilfs2: fix potential bug in end_buffer_async_write
    058d1c56167e of: property: Add in-ports/out-ports support to of_graph_get_port_parent()
    24ec7504a08a sched/membarrier: reduce the ability to hammer on sys_membarrier
    d3a5f798bc86 kbuild: Drop -Wdeclaration-after-statement
    3c6cc62ce126 locking: Introduce __cleanup() based infrastructure
    579cfab21b59 apparmor: Free up __cleanup() name
    43ec3c888653 dmaengine: ioat: Free up __cleanup() name
    a160c3293a1c userfaultfd: fix mmap_changing checking in mfill_atomic_hugetlb
    f3e975828636 bpf: Remove trace_printk_lock
    95b7476f6f68 bpf: Do cleanup in bpf_bprintf_cleanup only when needed
    f7bbad9561f3 bpf: Add struct for bin_args arg in bpf_bprintf_prepare
    989b0ff35fe5 net: prevent mss overflow in skb_segment()
    380aeff204b9 smb: client: fix parsing of SMB3.1.1 POSIX create context
    1ae3c59355dc smb: client: fix potential OOBs in smb2_parse_contexts()
    270325fb3154 RDMA/irdma: Ensure iWarp QP queue memory is OS paged aligned
    e1c1bdaa3879 hrtimer: Ignore slack time for RT tasks in schedule_hrtimeout_range()
    51a8f31b939c nfsd: don't take fi_lock in nfsd_break_deleg_cb()
    e4cf8941664c nfsd: fix RELEASE_LOCKOWNER
    23027309b099 parisc: Fix random data corruption from exception handler
    ebc442c6403d netfilter: ipset: Missing gc cancellations fixed
    653bc5e6d999 netfilter: ipset: fix performance regression in swap operation
    e7d2e87abc6f block: fix partial zone append completion handling in req_bio_endio()
    bb44477d4506 crypto: lib/mpi - Fix unexpected pointer access in mpi_ec_init
    c6feb7f41728 wifi: mwifiex: fix uninitialized firmware_stat
    0a9e80354911 arm64: dts: qcom: sm8150: fix USB SS wakeup
    c0e41c8756ef arm64: dts: qcom: sdm845: fix USB SS wakeup
    2488e0e4bc23 arm64: dts: qcom: msm8916: Make blsp_dma controlled-remotely
    9c84d580de3c arm64: dts: qcom: msm8916: Enable blsp_dma by default
    475369350157 bus: moxtet: Add spi device table
    1b7b597a69bb wifi: mwifiex: add extra delay for firmware ready
    48b348232070 wifi: mwifiex: Support SD8978 chipset
    5447e64acce8 ARM: dts: imx6q-apalis: add can power-up delay on ixora board
    4bf19cef220a md: bypass block throttle for superblock update
    9a163479ddc4 selftests/mm: Update va_high_addr_switch.sh to check CPU for la57 flag
    84df059d2468 selftests/mm: ksm_tests should only MADV_HUGEPAGE valid memory
    944900fe2736 tls: fix NULL deref on tls_sw_splice_eof() with empty record
    0a371ed6f2c1 xfrm: Silence warnings triggerable by bad packets
    cf3c8916866c xfrm: Use xfrm_state selector for BEET input
    1e4432d463f3 tracing: Inform kmemleak of saved_cmdlines allocation
    c7f9c3e94e61 fs/proc: do_task_stat: move thread_group_cputime_adjusted() outside of lock_task_sighand()
    9359ff1a4501 pmdomain: core: Move the unused cleanup to a _sync initcall
    4dd684d4bb3c can: j1939: Fix UAF in j1939_sk_match_filter during setsockopt(SO_J1939_FILTER)
    aedda066d717 can: j1939: prevent deadlock by changing j1939_socks_lock to rwlock
    8a72a4689a8d can: netlink: Fix TDCO calculation using the old data bittiming
    08c194882376 of: property: fix typo in io-channels
    79081197b4e2 mm: hugetlb pages should not be reserved by shmat() if SHM_NORESERVE
    2e2c07104b49 fs,hugetlb: fix NULL pointer dereference in hugetlbs_fill_super
    f3f98d7d84b3 ceph: prevent use-after-free in encode_cap_msg()
    309ef7de5d84 hv_netvsc: Register VF in netvsc_probe if NET_DEVICE_REGISTER missed
    4888754f3dd0 net: ethernet: ti: cpsw_new: enable mac_managed_pm to fix mdio
    5140c4d5f4fd s390/qeth: Fix potential loss of L3-IP@ in case of network issues
    058fbaf7716b net: ethernet: ti: cpsw: enable mac_managed_pm to fix mdio
    95de4ad173ca fs: relax mount_setattr() permission checks
    3ff3e6a9363a tools/rtla: Fix Makefile compiler options for clang
    4ee28d5a4f57 tools/rtla: Fix uninitialized bucket/data->bucket_size warning
    5ccb527b66e6 tools/rtla: Exit with EXIT_SUCCESS when help is invoked
    771b74ce9212 tools/rtla: Replace setting prio with nice for SCHED_OTHER
    d627693e5a55 tools/rtla: Remove unused sched_getattr() function
    fcf62f94ad80 ASoC: amd: yc: Add DMI quirk for Lenovo Ideapad Pro 5 16ARP8
    00f9fcc0a109 mmc: sdhci-pci-o2micro: Fix a warm reboot issue that disk can't be detected by BIOS
    09fad23a1a32 zonefs: Improve error handling
    ce2b826582f5 irqchip/gic-v3-its: Fix GICv4.1 VPE affinity update
    659311f59318 irqchip/irq-brcmstb-l2: Add write memory barrier before exit
    783912cbce88 wifi: mac80211: reload info pointer in ieee80211_tx_dequeue()
    6c84dbe8f8fa wifi: cfg80211: fix wiphy delayed work queueing
    685fc1711cda nfp: flower: prevent re-adding mac index for bonded port
    57b8478c103a nfp: use correct macro for LengthSelect in BAR config
    8731fe001a60 crypto: ccp - Fix null pointer dereference in __sev_platform_shutdown_locked
    8494ba2c9ea0 nilfs2: fix hang in nilfs_lookup_dirty_data_buffers()
    9c9c68d64fd3 nilfs2: fix data corruption in dsync block recovery for small block sizes
    35076e3fb4b8 ALSA: hda/conexant: Add quirk for SWS JS201D
    53e8abc14e57 ALSA: hda/realtek: fix mute/micmute LED For HP mt645
    a943c7fbdfeb mmc: slot-gpio: Allow non-sleeping GPIO ro
    eae748df18ed io_uring/net: fix multishot accept overflow handling
    aedcefae6c18 x86/mm/ident_map: Use gbpages only where full GB page should be mapped.
    3863ca052216 KVM: x86/pmu: Fix type length error when reading pmu->fixed_ctr_ctrl
    627339cccdc9 x86/fpu: Stop relying on userspace for info to fault in xsave buffer
    8b4025679e56 x86/Kconfig: Transmeta Crusoe is CPU family 5, not 6
    c194adaa8a4c powerpc/pseries: fix accuracy of stolen time
    42422f8f8c52 powerpc/cputable: Add missing PPC_FEATURE_BOOKE on PPC64 Book-E
    76d3ad7d0264 powerpc/64: Set task pt_regs->link to the LR value on scv entry
    5e2f407646fa serial: max310x: prevent infinite while() loop in port startup
    0046dd2e9ff6 serial: max310x: fail probe if clock crystal is unstable
    7971a029eb23 serial: max310x: improve crystal stable clock detection
    5d89c48337c7 serial: max310x: set default value when reading clock ready bit
    c96ce4903b62 nfp: flower: fix hardware offload for the transfer layer port
    ef3d50e884d4 ring-buffer: Clean ring_buffer_poll_wait() error return
    48a8ccccffba hv_netvsc: Fix race condition between netvsc_probe and netvsc_remove
    3ca5a3cdc0c1 drm/amd/display: Preserve original aspect ratio in create stream
    e70123fdbe82 drm/amd/display: Increase frame-larger-than for all display_mode_vba files
    8c22b23a2778 drm/prime: Support page array >= 4GB
    fc811d88fb4e drm/msm: Wire up tlb ops
    ba5f95788345 xfrm: Remove inner/outer modes from input path
    01e9f82058e2 xfrm: Remove inner/outer modes from output path
    7505a0ce0858 ksmbd: free aux buffer if ksmbd_iov_pin_rsp_read fails
    9f6087851ec6 media: rc: bpf attach/detach requires write permission
    b79e15569d1a iio: imu: bno055: serdev requires REGMAP
    9e105dd8c070 iio: imu: adis: ensure proper DMA alignment
    18cbe28671e2 iio: adc: ad_sigma_delta: ensure proper DMA alignment
    77ba1a86ef22 iio: accel: bma400: Fix a compilation problem
    4f10423c0e34 iio: commom: st_sensors: ensure proper DMA alignment
    359f220d0e75 iio: core: fix memleak in iio_device_register_sysfs
    176256ff8abf iio: magnetometer: rm3100: add boundary check for the value read from RM3100_REG_TMRC
    c794117a3369 staging: iio: ad5933: fix type mismatch regression
    65bf19f55a87 tracing: Fix wasted memory in saved_cmdlines logic
    ac894a1e19b9 ext4: avoid bb_free and bb_fragments inconsistency in mb_free_blocks()
    185eab30486b ext4: fix double-free of blocks due to wrong extents moved_len
    4ab56381ac26 misc: fastrpc: Mark all sessions as invalid in cb_remove
    90e09c016d72 binder: signal epoll threads of self-work
    f33789ca65d5 ALSA: hda/realtek: fix mute/micmute LEDs for HP ZBook Power
    6c65eb988d4a ALSA: hda/cs8409: Suppress vmaster control for Dolphin models
    a6bc85847272 ASoC: codecs: wcd938x: handle deferred probe
    d27f6d6eacac ALSA: hda/realtek: Enable headset mic on Vaio VJFE-ADL
    5953f2c7f84d modpost: Add '.ltext' and '.ltext.*' to TEXT_SECTIONS
    064cb9dd10ff um: Fix adding '-no-pie' for clang
    36fbcadc208e modpost: Include '.text.*' in TEXT_SECTIONS
    519b7da44ee4 linux/init: remove __memexit* annotations
    999ecc936a99 modpost: Don't let "driver"s reference .exit.*
    a5767decf743 modpost: propagate W=1 build option to modpost
    6286435cd06c xen-netback: properly sync TX responses
    55e891f4a272 net: stmmac: do not clear TBS enable bit on link up/down
    56440799fc46 net: hsr: remove WARN_ONCE() in send_hsr_supervision_frame()
    5c0c5ffaed73 nfc: nci: free rx_data_reassembly skb on NCI device cleanup
    76690354e6ac kbuild: Fix changing ELF file type for output of gen_btf for big endian
    38acb2e9be54 ALSA: hda/realtek: Apply headset jack quirk for non-bass alc287 thinkpads
    e1aae84f42ec firewire: core: correct documentation of fw_csr_string() kernel API
    d0302e2a5732 lsm: fix the logic in security_inode_getsecctx()
    dc3890441c9e drm/virtio: Set segment size for virtio_gpu device
    ff70e6ff6fc2 Revert "drm/amd: flush any delayed gfxoff on suspend entry"
    6bb22ac1d11d scsi: Revert "scsi: fcoe: Fix potential deadlock on &fip->ctlr_lock"
    75500e7ba2a2 media: Revert "media: rkisp1: Drop IRQF_SHARED"
    e373bfc8ec3d mptcp: check addrs list in userspace_pm_get_local_id
    d288d2e3e65a mptcp: drop the push_pending field
    d50d031919b2 selftests: mptcp: increase timeout to 30 min
    fc0e9cff9db0 selftests: mptcp: add missing kconfig for NF Mangle
    2c7337ec22bc selftests: mptcp: add missing kconfig for NF Filter in v6
    66e142fbe13f selftests: mptcp: add missing kconfig for NF Filter
    6673d9f1c2cd mptcp: fix data re-injection from stale subflow
    7857e35ef10e mptcp: get rid of msk->subflow
    3e409fb74007 modpost: trim leading spaces when processing source files list
    491528935c9c i2c: i801: Fix block process call transactions
    0e01ccadfdf7 i2c: pasemi: split driver into two separate modules
    4297217bcf1f powerpc/kasan: Limit KASAN thread size increase to 32KB
    c12920ff9b57 irqchip/loongson-eiointc: Use correct struct type in eiointc_domain_alloc()
    083870b029c0 i2c: qcom-geni: Correct I2C TRE sequence
    7190353835b4 cifs: fix underflow in parse_server_interfaces()
    0c09912dd838 powerpc/kasan: Fix addr error caused by page alignment
    2aaa9239c981 driver core: fw_devlink: Improve detection of overlapping cycles
    be76ad74a43f media: ir_toy: fix a memleak in irtoy_tx
    6616d3c4f828 interconnect: qcom: sc8180x: Mark CO0 BCM keepalive
    57e2e42ccd3c usb: dwc3: gadget: Fix NULL pointer dereference in dwc3_gadget_suspend
    0ecc97c81e3a usb: f_mass_storage: forbid async queue when shutdown happen
    2888258144e0 USB: hub: check for alternate port before enabling A_ALT_HNP_SUPPORT
    9f754d009483 usb: ucsi_acpi: Fix command completion handling
    d31b886ed6a5 usb: ulpi: Fix debugfs directory leak
    3fd6c16ec78d usb: ucsi: Add missing ppm_lock
    711beb8acf5d iio: hid-sensor-als: Return 0 for HID_USAGE_SENSOR_TIME_TIMESTAMP
    e5c6c8ef3e4d HID: wacom: Do not register input devices until after hid_hw_start
    b71a906a72dd HID: wacom: generic: Avoid reporting a serial of '0' to userspace
    d7d7a0e3b6f5 HID: i2c-hid-of: fix NULL-deref on failed power up
    ea09996b3711 ALSA: hda/realtek: Enable Mute LED on HP Laptop 14-fq0xxx
    b23c431e5052 ALSA: hda/realtek: Fix the external mic not being recognised for Acer Swift 1 SF114-32
    f00e8d0fccf6 parisc: Prevent hung tasks when printing inventory on serial console
    607385d75a0b ASoC: amd: yc: Add DMI quirk for MSI Bravo 15 C7VF
    30884a44e0ce dm-crypt, dm-verity: disable tasklets
    221da504a55b scsi: storvsc: Fix ring buffer size calculation
    16b1025eaa8f mm/writeback: fix possible divide-by-zero in wb_dirty_limits(), again
    36be97e9eb53 tracing/trigger: Fix to return error if failed to alloc snapshot
    76a42074d0b8 scs: add CONFIG_MMU dependency for vfree_atomic()
    7a245b8a2fa9 i40e: Fix waiting for queues of all VSIs to be disabled
    1c981792e4cc i40e: Do not allow untrusted VF to remove administratively set MAC
    c638b4afc750 MIPS: Add 'memory' clobber to csum_ipv6_magic() inline assembler
    4b02c89327f7 nouveau/svm: fix kvcalloc() argument order
    20f378f92971 net: sysfs: Fix /sys/class/net/<iface> path for statistics
    1f0d7792e902 ASoC: rt5645: Fix deadlock in rt5645_jack_detect_work()
    251145e50437 spi: ppc4xx: Drop write-only variable
    727cdd2f3dca net: tls: fix returned read length with async decrypt
    20b4ed034872 net: tls: fix use-after-free with partial reads and async decrypt
    7a3ca06d04d5 tls: fix race between async notify and socket close
    2c6841c88201 net: tls: factor out tls_*crypt_async_wait()
    d55eb0b495a9 tls: extract context alloc/initialization out of tls_set_sw_offload
    5ad627faed13 tls/sw: Use splice_eof() to flush
    b9357489c46c lan966x: Fix crash when adding interface under a lag
    65ded4eb2206 net: openvswitch: limit the number of recursions from action sets
    68614f1865a0 of: property: Improve finding the supplier of a remote-endpoint property
    4bd106ac1c38 wifi: iwlwifi: uninitialized variable in iwl_acpi_get_ppag_table()
    72d4600a6eb8 wifi: iwlwifi: Fix some error codes
    e5ed6c922537 KVM: selftests: Fix a semaphore imbalance in the dirty ring logging test
    b3557a3697ae KVM: selftests: Clear dirty ring states between two modes in dirty_log_test
    0cf05064008c of: unittest: Fix compile in the non-dynamic case
    0f081fcfaac3 driver core: Fix device_link_flag_is_sync_state_only()
    02f2b95b00bf btrfs: don't drop extent_map for free space inode on write error
    7ba7f9ed88a1 btrfs: reject encoded write if inode has nodatasum flag set
    4d6b2e17b550 btrfs: don't reserve space for checksums when writing to nocow files
    dfd1f44e4958 btrfs: send: return EOPNOTSUPP on unknown flags
    f98913c07cd8 btrfs: forbid deleting live subvol qgroup
    66b317a2fc45 btrfs: do not ASSERT() if the newly created subvolume already got read
    a1a7b9589574 btrfs: forbid creating subvol qgroups
    e717aecd2a43 btrfs: do not delete unused block group if it may be used soon
    84b576ad44ea btrfs: add and use helper to check if block group is used
    3af7236d6dbf update workarounds for gcc "asm goto" issue
    f70efe54b97e work around gcc bugs with 'asm goto' with outputs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index cbf8a18d30..4731848569 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8c4c2f0278e1c64eb5e95bfb23d6322e81090b3d"
-SRCREV_meta ?= "ea5365f818fb6031ec97b8ae7a88bb83001b901e"
+SRCREV_machine ?= "d99f54f4ced57500fd5c346afcfa79ff8bab6a61"
+SRCREV_meta ?= "1a5f3ae5c51d6698be51e36bf547433564338b18"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.78"
+LINUX_VERSION ?= "6.1.79"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 3f100b579f..178ab5b7d3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.78"
+LINUX_VERSION ?= "6.1.79"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d025fe8c17718aa4c837bfafee0f3aa0f830bc75"
-SRCREV_meta ?= "ea5365f818fb6031ec97b8ae7a88bb83001b901e"
+SRCREV_machine ?= "2ca50ef474eea7ab53d9f769b1502c7c9d4f28cc"
+SRCREV_meta ?= "1a5f3ae5c51d6698be51e36bf547433564338b18"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 982996b9a8..ec84d2614c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "2f7e672f9677d3cc448ec7e004763f76f95c7fe0"
-SRCREV_machine:qemuarm64 ?= "d025fe8c17718aa4c837bfafee0f3aa0f830bc75"
-SRCREV_machine:qemuloongarch64 ?= "d025fe8c17718aa4c837bfafee0f3aa0f830bc75"
-SRCREV_machine:qemumips ?= "f6c42d90dab94077c1c8b6b7eb77d6ca85eab07e"
-SRCREV_machine:qemuppc ?= "ff10270b2748ad74c93ef0abf8e76a464665c23d"
-SRCREV_machine:qemuriscv64 ?= "d025fe8c17718aa4c837bfafee0f3aa0f830bc75"
-SRCREV_machine:qemuriscv32 ?= "d025fe8c17718aa4c837bfafee0f3aa0f830bc75"
-SRCREV_machine:qemux86 ?= "d025fe8c17718aa4c837bfafee0f3aa0f830bc75"
-SRCREV_machine:qemux86-64 ?= "d025fe8c17718aa4c837bfafee0f3aa0f830bc75"
-SRCREV_machine:qemumips64 ?= "01b545e3fd1f9ea66d812e281de06b07c861dd69"
-SRCREV_machine ?= "d025fe8c17718aa4c837bfafee0f3aa0f830bc75"
-SRCREV_meta ?= "ea5365f818fb6031ec97b8ae7a88bb83001b901e"
+SRCREV_machine:qemuarm ?= "4c6c7312e0e95f7b076f86ef1d791c78d82ddeee"
+SRCREV_machine:qemuarm64 ?= "2ca50ef474eea7ab53d9f769b1502c7c9d4f28cc"
+SRCREV_machine:qemuloongarch64 ?= "2ca50ef474eea7ab53d9f769b1502c7c9d4f28cc"
+SRCREV_machine:qemumips ?= "b2a27a5acb88b991bc6d822f9fdc308d5a108583"
+SRCREV_machine:qemuppc ?= "ef1506156c8b381a51c4937c43bca036170df29e"
+SRCREV_machine:qemuriscv64 ?= "2ca50ef474eea7ab53d9f769b1502c7c9d4f28cc"
+SRCREV_machine:qemuriscv32 ?= "2ca50ef474eea7ab53d9f769b1502c7c9d4f28cc"
+SRCREV_machine:qemux86 ?= "2ca50ef474eea7ab53d9f769b1502c7c9d4f28cc"
+SRCREV_machine:qemux86-64 ?= "2ca50ef474eea7ab53d9f769b1502c7c9d4f28cc"
+SRCREV_machine:qemumips64 ?= "3a17a35babd86c4bc9121469801a04248bf7ae99"
+SRCREV_machine ?= "2ca50ef474eea7ab53d9f769b1502c7c9d4f28cc"
+SRCREV_meta ?= "1a5f3ae5c51d6698be51e36bf547433564338b18"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "8b4118fabd6eb75fed19483b04dab3a036886489"
+SRCREV_machine:class-devupstream ?= "81e1dc2f70014b9523dd02ca763788e4f81e5bac"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.78"
+LINUX_VERSION ?= "6.1.79"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


