Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071B6CF6498
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:57:46 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.45277.1727661459041028102
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:57:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=DTKoN0+u;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7e6afa8baeaso3307090a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661458; x=1728266258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJ7H9the464jJ92p4UnqordIWzQYG24cwaKNQBSvjcc=;
        b=DTKoN0+u6XqsU3NuInpHXt7EvD43oHwnmSR2tDKhK+1j3hNX/aT93oyaH+Qa2TEju3
         4JxK+a2DuY0jHfLgemolQ2IQn6D0AHB1Lw13PvORwav9EWx+SsOBtSZW1tD75aQFE6pb
         BMQMeKDkLtxaAB/Ux26cVDyXv+qY3aU6yRG9oUT5pG3NHVY+pq8HrwovWzuS/1M07pqt
         OI2nQzuRpXkpfTBemIkhpYK+b1bzc/FJcsWqT4KKqxfhOULI96MEKwzqetDzFC3Hm0Mx
         4MEg/fzATITxI4svuWd60FS05mBMmAfGvlgmfu6+xcvhMSFRW5UjFiUMqRsD/ym6uN43
         /mmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661458; x=1728266258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJ7H9the464jJ92p4UnqordIWzQYG24cwaKNQBSvjcc=;
        b=tUcLyPYaT/QwR9UfrpkYHKUW5AMrRUstInccUcE8CSmUI6UKUU7JVg9xYLy/aKwCnB
         MYYwepQxA/kwjNcoPqsxdz/Ihjc1JHOWZ6eO9zDqlI/pGCc7f5bUS/BJD9raFK8Drew3
         UCdbWkrPvtUgegH9YuBdnF9slvBfNKoqmSH1ZRI9CZa7NvDoZgsBv28rReo5eNYdfbV2
         YhtjH4hHfQAIa/5dSl7nG26MYhaUuYj6yOrOr21SuIZZbi/r1kepdtWwgeaOYRvvLe2c
         v08HrCX3tGOgL3wwynnE/Jf8w5H246rqrBWZBGQPC9Yl65qgLPTczbPgtlUxyShxyMB0
         hNgA==
X-Gm-Message-State: AOJu0YxxU8CBXoGG2CEee7PDW3kVWl80Lz5Ra3GoH7vFuKZwvBO5mldO
	lEBhrewE2xwa8hfh3GFjrXke5v8vGhbjCoeoM5fknSlsFPaW+rXxy+flSuvVWhtB4L4uua9TL9a
	7ghc=
X-Google-Smtp-Source: AGHT+IFGjlGHlreRtW6xQKIBC2+Fc9Sq+BZgptiPWs/i4egeHDkrXjm8lGoz/hIpCirMAuFnkOZ8Yw==
X-Received: by 2002:a17:90a:69e4:b0:2c9:81fd:4c27 with SMTP id 98e67ed59e1d1-2e0b89e218fmr12601758a91.14.1727661457898;
        Sun, 29 Sep 2024 18:57:37 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.57.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:57:37 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 05/27] linux-yocto/6.6: update to v6.6.40
Date: Sun, 29 Sep 2024 18:57:00 -0700
Message-Id: <ce98d567662ace9f7899c15c49be6350356805d5.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205067

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    1a515bd58d15 Linux 6.6.40
    69bed24c8213 Revert "usb: xhci: prevent potential failure in handle_tx_event() for Transfer events without TRB"
    2ced7518a03d Linux 6.6.39
    95b1362540b7 nilfs2: fix incorrect inode allocation from reserved inodes
    9ac895a881b2 null_blk: Do not allow runt zone with zone capacity smaller then zone size
    1ba66b121100 drm/amdgpu: silence UBSAN warning
    49458c09755e ALSA: ump: Set default protocol when not given explicitly
    d4b55b137965 spi: cadence: Ensure data lines set to low during dummy-cycle period
    056478b4321b nfc/nci: Add the inconsistency check between the input data length and count
    9db55f64386d kbuild: fix short log for AS in link-vmlinux.sh
    5502c1f1d0d7 nvmet: fix a possible leak when destroy a ctrl during qp establishment
    f61cea47ad6f platform/x86: touchscreen_dmi: Add info for the EZpad 6s Pro
    487dc376a83c platform/x86: touchscreen_dmi: Add info for GlobalSpace SolT IVW 11.6" tablet
    fc525ed8cb0f regmap-i2c: Subtract reg size from max_write
    b955b47905ed nvme: adjust multiples of NVME_CTRL_PAGE_SIZE in offset
    9258d795978f connector: Fix invalid conversion in cn_proc.h
    39d31edcf95a dma-mapping: benchmark: avoid needless copy_to_user if benchmark fails
    e6e1eda06b70 nvme-multipath: find NUMA path only for online numa-node
    8f174c5db1e0 vhost-scsi: Handle vhost_vq_work_queue failures for events
    4d1de71e630b ALSA: hda/realtek: Enable headset mic of JP-IK LEAP W502 with ALC897
    aa8b1d6073c1 fs/ntfs3: Mark volume as dirty if xattr is broken
    92e494a7568b i2c: pnx: Fix potential deadlock warning from del_timer_sync() call in isr
    3aeea9e1277c clk: mediatek: mt8183: Only enable runtime PM on mt8183-mfgcfg
    66b6da0cc64c clk: qcom: clk-alpha-pll: set ALPHA_EN bit for Stromer Plus PLLs
    0fcb94e0ee89 clk: qcom: gcc-sm6350: Fix gpll6* & gpll7 parents
    583bea0902a9 media: dw2102: fix a potential buffer overflow
    28d0ecc52f6c ima: Avoid blocking in RCU read-side critical section
    cecffd9e3c46 arm64: dts: rockchip: Fix the DCDC_REG2 minimum voltage on Quartz64 Model B
    f1313ea92f82 bnx2x: Fix multiple UBSAN array-index-out-of-bounds
    7a8b1cfcb25b net: stmmac: dwmac-qcom-ethqos: fix error array size
    45a4aef06355 mtd: rawnand: rockchip: ensure NVDDR timings are rejected
    dbbc4cf0d5c1 mtd: rawnand: Bypass a couple of sanity checks during NAND identification
    70bb95e034fd mtd: rawnand: Fix the nand_read_data_op() early check
    0fd8ce12f97c mtd: rawnand: Ensure ECC configuration is propagated to upper layers
    c6036baea4ba powerpc/64s: Fix unnecessary copy to 0 when kernel is booted at address 0
    d10e3c39001e powerpc/pseries: Fix scv instruction crash with kexec
    14c78d69dbca clk: sunxi-ng: common: Don't call hw_to_ccu_common on hw without common
    ba02424852d2 clk: qcom: gcc-ipq9574: Add BRANCH_HALT_VOTED flag
    33de7c47a19a drm: panel-orientation-quirks: Add quirk for Valve Galileo
    004b7fe6ca8c drm/amdgpu/atomfirmware: silence UBSAN warning
    744b229f0913 drm/nouveau: fix null pointer dereference in nouveau_connector_get_modes
    f6620df12cb6 Revert "mm/writeback: fix possible divide-by-zero in wb_dirty_limits(), again"
    dd0aa13fda82 fsnotify: Do not generate events for O_PATH file descriptors
    07ce8ad4eb60 can: kvaser_usb: Explicitly initialize family in leafimx driver_info struct
    e2d8aa4c7635 Bluetooth: qca: Fix BT enable failure again for QCA6390 after warm reboot
    a635d93ad99b Bluetooth: hci_bcm4377: Fix msgid release
    155d9c9ed129 scsi: mpi3mr: Use proper format specifier in mpi3mr_sas_port_add()
    72aa369e4e62 f2fs: Add inline to f2fs_build_fault_attr() stub
    f8e960be923f btrfs: fix adding block group to a reclaim list and the unused list during reclaim
    bd16a7ee339a mm: avoid overflows in dirty throttling logic
    79ad410c5b58 mm: optimize the redundant loop of mm_update_owner_next()
    3ab40870edb8 nilfs2: add missing check for inode numbers on directory entries
    9194f8ca5752 nilfs2: fix inode number range checks
    991f036cabc3 Revert "igc: fix a log entry using uninitialized netdev"
    9bdd0bf23ffe platform/x86: toshiba_acpi: Fix quickstart quirk handling
    69787793e7f0 cpu: Fix broken cmdline "nosmp" and "maxcpus=0"
    b0a41715ed23 gpiolib: of: add polarity quirk for TSC2005
    f8b55a465b0e mlxsw: core_linecards: Fix double memory deallocation in case of invalid INI file
    76965648fe68 inet_diag: Initialize pad field in struct inet_diag_req_v2
    4116ec648354 selftests: make order checking verbose in msg_zerocopy selftest
    946ba4e645b0 selftests: fix OOM in msg_zerocopy selftest
    b75e33eae866 bonding: Fix out-of-bounds read in bond_option_arp_ip_targets_set()
    55a40406aac5 netfilter: nf_tables: unconditionally flush pending work before notifier
    7692c9b6baac riscv: kexec: Avoid deadlock in kexec crash path
    5ed821a8e9d3 wifi: wilc1000: fix ies_len type in connect path
    dee87316b5f5 gpio: mmio: do not calculate bgpio_bits via "ngpios"
    e3af5b14e763 net: ntb_netdev: Move ntb_netdev_rx_handler() to call netif_rx() from __netif_rx()
    9edc7a83cd40 net: txgbe: initialize num_q_vectors for MSI/INTx interrupts
    702b17f72de2 net: allow skb_datagram_iter to be called from any context
    895f5633a036 gpiolib: of: fix lookup quirk for MIPS Lantiq
    e536e6efa65f e1000e: Fix S0ix residency on corporate systems
    f4513867bae5 KVM: s390: fix LPSWEY handling
    8c2debdd170e tcp_metrics: validate source addr length
    4970e48f83db bluetooth/hci: disallow setting handle bigger than HCI_CONN_HANDLE_MAX
    045669710464 Bluetooth: ISO: Check socket flag instead of hcon
    38263088b845 Bluetooth: Ignore too large handle values in BIG
    1ae31b357a77 Bluetooth: hci_event: Fix setting of unicast qos interval
    a9f4a9b27fde net/mlx5e: Add mqprio_rl cleanup and free in mlx5e_priv_cleanup()
    3e3551f87029 net/mlx5: E-switch, Create ingress ACL when needed
    8a7fc2362d6d UPSTREAM: tcp: fix DSACK undo in fast recovery to call tcp_try_to_open()
    9e8f0c53a535 net: phy: phy_device: Fix PHY LED blinking code comment
    617075792b7c mac802154: fix time calculation in ieee802154_configure_durations()
    abe067dc3a66 vhost_task: Handle SIGKILL by flushing work and exiting
    f5bb72196f49 vhost: Release worker mutex during flushes
    a86f9633f70a vhost: Use virtqueue mutex for swapping worker
    76d7b869b3b9 tools/power turbostat: Remember global max_die_id
    3ee21e14c8c3 cdrom: rearrange last_media_change check to avoid unintentional overflow
    e130d4fc196b btrfs: scrub: initialize ret in scrub_simple_mirror() to fix compilation warning
    90a01aefb84b s390/pkey: Wipe sensitive data on failure
    d0bbbf31462a jffs2: Fix potential illegal address access in jffs2_free_inode
    b5f1844c0561 serial: imx: Raise TX trigger level to 8
    586b41060113 scsi: mpi3mr: Sanitise num_phys
    44958ca9e400 f2fs: check validation of fault attrs in f2fs_build_fault_attr()
    7e5471b5efeb bpf: Avoid uninitialized value in BPF_CORE_READ_BITFIELD
    92160970bfe8 igc: fix a log entry using uninitialized netdev
    c80d53c484e8 selftests/net: fix uninitialized variables
    ee123d5655f7 powerpc/xmon: Check cpu id in commands "c#", "dp#" and "dx#"
    4e40bc50daae kunit: Fix timeout message
    6a3cacf6d3cf orangefs: fix out-of-bounds fsid access
    7c91479c6f83 powerpc/64: Set _IO_BASE to POISON_POINTER_DELTA not 0 for CONFIG_PCI=n
    e0cd887ad86e i2c: i801: Annotate apanel_addr as __ro_after_init
    8ac224e9371d media: dvb-frontends: tda10048: Fix integer overflow
    29ce81f97991 media: s2255: Use refcount_t instead of atomic_t for num_channels
    0f9d21eca4ac media: dvb-frontends: tda18271c2dd: Remove casting during div
    3f25b5f16354 net: dsa: mv88e6xxx: Correct check for empty list
    79ef1a5593fd thermal/drivers/mediatek/lvts_thermal: Check NULL ptr on lvts_data
    547cb9931406 wifi: mt76: mt7996: add sanity checks for background radar trigger
    ff6b26be1303 wifi: mt76: replace skb_put with skb_put_zero
    9a24eb8010c2 usb: xhci: prevent potential failure in handle_tx_event() for Transfer events without TRB
    c727e46f0cc8 Input: ff-core - prefer struct_size over open coded arithmetic
    50c6c51972e9 firmware: dmi: Stop decoding on broken entry
    58405d6eff39 sctp: prefer struct_size over open coded arithmetic
    864a02425045 riscv: Apply SiFive CIP-1200 workaround to single-ASID sfence.vma
    af19067bd58f media: dw2102: Don't translate i2c read into write
    3fac5aecb593 drm/amdgpu: fix the warning about the expression (int)size - len
    7e0fbceae1e6 drm/amdgpu: fix uninitialized scalar variable warning
    8e5cbc820ab4 drm/amd/display: Fix uninitialized variables in DM
    95ad20ee3c4e drm/amd/display: Skip finding free audio for unknown engine_id
    96bf81cc1bd0 drm/amd/display: Check pipe offset before setting vblank
    9933eca6ada0 drm/amd/display: Check index msg_id before read or write
    e55077badb90 drm/amdgpu: Initialize timestamp for some legacy SOCs
    855ae72c2031 drm/amdgpu: Using uninitialized value *size when calling amdgpu_vce_cs_reloc
    646e13f0a65b drm/amdgpu: Fix uninitialized variable warnings
    5c217253c76c media: mediatek: vcodec: Only free buffer VA that is not NULL
    b502d4a08875 crypto: aead,cipher - zeroize key buffer after use
    1ee644460fe8 RISC-V: KVM: Fix the initial sample period value
    e7d193073a22 selftests/bpf: dummy_st_ops should reject 0 for non-nullable params
    a1a629fc373c selftests/bpf: do not pass NULL for non-nullable params in dummy_st_ops
    264451a364db selftests/bpf: adjust dummy_st_ops_success to detect additional error
    b6ded5316ec5 scsi: qedf: Make qedf_execute_tmf() non-preemptible
    b8c5f635997f IB/core: Implement a limit on UMAD receive List
    c15bb7c940be media: dvb-usb: dib0700_devices: Add missing release_firmware()
    47abb68e1734 media: dvb: as102-fe: Fix as10x_register_addr packing
    0f37946c62c4 powerpc: Avoid nmi_enter/nmi_exit in real mode interrupt.
    04d531b9a187 drm/lima: fix shared irq handling on driver remove
    7fc8d9a525b5 crypto: hisilicon/debugfs - Fix debugfs uninit process issue
    3ead19aa341d leds: an30259a: Use devm_mutex_init() for mutex initialization
    7d2a6abec028 locking/mutex: Introduce devm_mutex_init()
    f71bb11887ba cpu/amd: inhibit SMP check for qemux86
    c31365597a17 powerpc/uaccess: Fix build errors seen with GCC 13/14
    64ebf485c56b usb: dwc3: core: remove lock of otg mode during gadget suspend/resume to avoid deadlock
    7c76aad68f6d kselftest: Add a ksft_perror() helper
    06644f0d7193 drm/tilcdc: Set preferred depth
    ff7ae7b32324 crypto: jitter - add RCT/APT support for different OSRs
    50cd24ddb6f0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    58e5c91d6701 x86/alternatives: Disable interrupts and sync when optimizing NOPs in place
    c878fd2d4c79 x86/alternatives: Sync core before enabling interrupts
    c2d64b9f52b6 qemux86: add configuration symbol to select values
    630c33229e6d sched/isolation: really align nohz_full with rcu_nocbs
    0e5e0f68e2e6 clear_warn_once: add a clear_warn_once= boot parameter
    46934791b902 clear_warn_once: bind a timer to written reset value
    cdee9e38ff32 clear_warn_once: expand debugfs to include read support
    82b562b81841 tools: Remove some options from CLANG_CROSS_FLAGS
    36dc380b776b libbpf: Fix build warning on ref_ctr_off
    9e3e1fe20982 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    e497a4a5da65 perf: x86-32: explicitly include <errno.h>
    7b57ddd89565 perf: mips64: Convert __u64 to unsigned long long
    1cfc19423dc7 perf: fix bench numa compilation
    98bc2815fade perf: add SLANG_INC for slang.h
    17209a70b9b3 perf: add sgidefs.h to for mips builds
    9cd4258d910a perf: change --root to --prefix for python install
    8110a4f26628 perf: add 'libperl not found' warning
    bc89d5e08f77 perf: force include of <stdbool.h>
    4f6c760cc876 fat: Replace prandom_u32() with get_random_u32()
    bc53117b12b2 fat: don't use obsolete random32 call in namei_vfat
    30b2236ab378 FAT: Added FAT_NO_83NAME
    cef98d22b4ed FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    0bbd7daba9e1 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5883fc340084 aufs6: adapt to v6.6 i_op->ctime changes
    c4342d979bf2 aufs6: fix magic.mk include path
    35266bc2dc81 aufs6: adapt to v6.6
    8edede4e98be aufs6: core
    712248233ebe aufs6: standalone
    3b71a8a848d8 aufs6: mmap
    3e2924871f37 aufs6: base
    7f4907a93101 aufs6: kbuild
    d2f7b03e4aa7 yaffs2: update VFS ctime operations to 6.6+
    bcd6cfcd1aa0 yaffs2: v6.5 fixups
    cc615704b5f5 yaffs2: Fix miscalculation of devname buffer length
    8ef2e22dcf91 yaffs2: convert user_namespace to mnt_idmap
    c9c749f9f7d3 yaffs2: replace bdevname call with sprintf
    395b01cdc39d yaffs2: convert read_page -> readfolio
    d98b07e43ba6 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    613c6d50fdbe yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    622c4648936f yaffs2: v5.12+ build fixups (not runtime tested)
    7562133d4090 yaffs: include blkdev.h
    dbd44252cd59 yaffs: fix misplaced variable declaration
    c223a10b1ac0 yaffs2: v5.6 build fixups
    90f6007cfbf4 yaffs2: fix memory leak when /proc/yaffs is read
    37ee169c5ea1 yaffs: add strict check when call yaffs_internal_read_super
    b6e007b8abb6 yaffs: repair yaffs_get_mtd_device
    fb98f65a466a yaffs: Fix build failure by handling inode i_version with proper atomic API
    51e0aac75ea2 yaffs2: fix memory leak in mount/umount
    2b74a0cae7b0 yaffs: Avoid setting any ACL releated xattr
    ff4130a9c376 Yaffs:check oob size before auto selecting Yaffs1
    ba95b409c67c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    8fa35eba9056 yaffs2: adjust to proper location of MS_RDONLY
    1eb5deaad8c4 yaffs2: import git revision b4ce1bb (jan, 2020)
    4dce67c1e8c8 initramfs: allow an optional wrapper script around initramfs generation
    2f603d83fcc4 pnmtologo: use relocatable file name
    664a6a0a484b tools: use basename to identify file in gen-mach-types
    9de64bc0c185 lib/build_OID_registry: fix reproducibility issues
    ae9b80797295 vt/conmakehash: improve reproducibility
    a972323151bd iwlwifi: select MAC80211_LEDS conditionally
    15d2adcc0198 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5556a6c04b19 arm64/perf: Fix wrong cast that may cause wrong truncation
    5552dc768ffc defconfigs: drop obselete options
    00fe4152df31 arm64/perf: fix backtrace for AAPCS with FP enabled
    3888d0652edf linux-yocto: Handle /bin/awk issues
    3d55d299f23a uvesafb: provide option to specify timeout for task completion
    23c068c080be uvesafb: print error message when task timeout occurs
    edbfc939266e compiler.h: Undef before redefining __attribute_const__
    c99ae7e2a19a vmware: include jiffies.h
    572d84d928c8 Resolve jiffies wrapping about arp
    fdcd47cac843 nfs: Allow default io size to be configured.
    927d48801098 check console device file on fs when booting
    57cc27f821dd mount_root: clarify error messages for when no rootfs found
    1b53d82a8152 mconf: fix output of cflags and libraries
    1811da09f42c menuconfig,mconf-cfg: Allow specification of ncurses location
    83c2e0c6eb1f modpost: mask trivial warnings
    6de673039484 kbuild: exclude meta directory from distclean processing
    6decd32815f5 powerpc: serialize image targets
    f6b683b38318 arm: serialize build targets
    e798b09ebf57 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    dc8a1e5a88f8 x86_64_defconfig: Fix warnings
    68491e5f72b6 powerpc/ptrace: Disable array-bounds warning with gcc8
    d71ebfce3004 powerpc: Disable attribute-alias warnings from gcc8
    62f50884b8b1 powerpc: kexec fix for powerpc64
    da6871c62c37 powerpc: Add unwind information for SPE registers of E500 core
    f161c880c11d mips: make current_cpu_data preempt safe
    5e94a8247ce7 mips: vdso: fix 'jalr $t9' crash in vdso code
    19e36714b1c7 mips: Kconfig: add QEMUMIPS64 option
    e2e537db3cbd 4kc cache tlb hazard: tlbp cache coherency
    aee9870611e5 malta uhci quirks: make allowance for slow 4k(e)c
    881948cd1517 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    98ec1963fcb7 arm64: defconfig: cleanup config options
    f1727c537ba8 vexpress: Pass LOADADDR to Makefile
    4474c32dc24a arm: ARM EABI socketcall
    75e31a2b70fd ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ce7ce269f1b1157c907b96cba17daf8cff643746)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index d95a102160..e5674044f4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d2157fa7a1fa4a9fe1787c632d5deb380f2c6c17"
-SRCREV_meta ?= "2ea9ff717ef4924299295edc441c23fab24a93e6"
+SRCREV_machine ?= "a1cc143cd640beb4c378a16345e25853224b5522"
+SRCREV_meta ?= "221d09d9fea4885f4e86d1fc2e83c5767bed4b27"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.38"
+LINUX_VERSION ?= "6.6.40"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 0b3dd4d735..bdd24847f6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.38"
+LINUX_VERSION ?= "6.6.40"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "371a13177d24bf76ce6c5074d2d745896ef0c526"
-SRCREV_meta ?= "2ea9ff717ef4924299295edc441c23fab24a93e6"
+SRCREV_machine ?= "12524ba963715d599cd28515eb8814476b6bf1d9"
+SRCREV_meta ?= "221d09d9fea4885f4e86d1fc2e83c5767bed4b27"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index a300651c13..60b865e870 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "47eb5131c7040017eeebdf16249899875dba22ef"
-SRCREV_machine:qemuarm64 ?= "371a13177d24bf76ce6c5074d2d745896ef0c526"
-SRCREV_machine:qemuloongarch64 ?= "371a13177d24bf76ce6c5074d2d745896ef0c526"
-SRCREV_machine:qemumips ?= "0b1fefb914311dc537509785fe4f0f18a63893d5"
-SRCREV_machine:qemuppc ?= "371a13177d24bf76ce6c5074d2d745896ef0c526"
-SRCREV_machine:qemuriscv64 ?= "371a13177d24bf76ce6c5074d2d745896ef0c526"
-SRCREV_machine:qemuriscv32 ?= "371a13177d24bf76ce6c5074d2d745896ef0c526"
-SRCREV_machine:qemux86 ?= "371a13177d24bf76ce6c5074d2d745896ef0c526"
-SRCREV_machine:qemux86-64 ?= "371a13177d24bf76ce6c5074d2d745896ef0c526"
-SRCREV_machine:qemumips64 ?= "f512122c65a6e1cab7053e80e0b6965a7f15a7ae"
-SRCREV_machine ?= "371a13177d24bf76ce6c5074d2d745896ef0c526"
-SRCREV_meta ?= "2ea9ff717ef4924299295edc441c23fab24a93e6"
+SRCREV_machine:qemuarm ?= "e48711f52106a87019e70c1ec6a403bc62cb2031"
+SRCREV_machine:qemuarm64 ?= "12524ba963715d599cd28515eb8814476b6bf1d9"
+SRCREV_machine:qemuloongarch64 ?= "12524ba963715d599cd28515eb8814476b6bf1d9"
+SRCREV_machine:qemumips ?= "c15bdaca7c985d396b0a6e6f1a6e6cf43190e85f"
+SRCREV_machine:qemuppc ?= "12524ba963715d599cd28515eb8814476b6bf1d9"
+SRCREV_machine:qemuriscv64 ?= "12524ba963715d599cd28515eb8814476b6bf1d9"
+SRCREV_machine:qemuriscv32 ?= "12524ba963715d599cd28515eb8814476b6bf1d9"
+SRCREV_machine:qemux86 ?= "12524ba963715d599cd28515eb8814476b6bf1d9"
+SRCREV_machine:qemux86-64 ?= "12524ba963715d599cd28515eb8814476b6bf1d9"
+SRCREV_machine:qemumips64 ?= "71f1727de6e7677b4028c9d8ac55349cac396d18"
+SRCREV_machine ?= "12524ba963715d599cd28515eb8814476b6bf1d9"
+SRCREV_meta ?= "221d09d9fea4885f4e86d1fc2e83c5767bed4b27"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "2928631d5304b8fec48bad4c7254ebf230b6cc51"
+SRCREV_machine:class-devupstream ?= "1a515bd58d1584e2eba85567e16c58dfb82edf32"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.38"
+LINUX_VERSION ?= "6.6.40"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


