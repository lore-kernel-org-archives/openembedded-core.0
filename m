Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D35EED62D
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 17:30:34 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.53848.1726162228740762663
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 10:30:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BZr5rjl3;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6c3552ce7faso10694036d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 10:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726162228; x=1726767028; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w3Jr6rFJd8K6+aPW5FcgTzik/W1ruuqtqra1kfGzO0A=;
        b=BZr5rjl3/Qns4bK9pY0IKmye0PiN5Y5mzeyAWfxignmDH8jhjJ/I8Ixp9nzaq97oqO
         VFT0tFQSNl+sy1vc+86pBNv+tC6rseGZ1TjgzU3bjWawDp4+yfSox16iTsMsb5e9nHzc
         1A5KtpjN54jqlxhk2LSvNZpS/Wu49TR2OSSb3que57ZuShsnl9dT5RoZjQtMwIl9ewg2
         3LoyqfDzypyW/mYVUDVXBW+NEAcIfHsSbKvxY6/jUA6GG7MTrivdWKMPl94yknWsrvCk
         YhRCmCOIyzsTGJ2t2csuASnZFexCymLGL0QoCHY6epbJwLV6+3w7VsG9+gQq3FKwHh+S
         P85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726162228; x=1726767028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w3Jr6rFJd8K6+aPW5FcgTzik/W1ruuqtqra1kfGzO0A=;
        b=aT7RPG9Y2acVLMvMxvLaJEGrR3mRowd4FalD5ES9DYAhrkdeKu/v6HJx4w0eBSAl9b
         M6LjmG/6y19/LiZ+NcPhFH3FnH86yd5ib8tCx4uwxuZekmZW2mSoWHFd4XwfuCiJk0Y6
         Bl22YYPfF7qTb5Oi2tx78J/4r5wd/jmESxWt0VxYnufA6DD/7cJ0tvDhWS5zgyWY/ROq
         SF68pJFIM20LVe+6CabZ32Y+9AnkNzaI5Owcw6Z9wsdC2f+qzqvUuQ1XW1hGD9vRxXz5
         a+0DxQ57GTVQ61qdC9uAMo4r/7IKSvyPGU9Gi226aA1Odkb8DC+iDnncJuCdrKBmb0Iy
         LT0Q==
X-Gm-Message-State: AOJu0YzDPMfkH4BArZSDyIVaLsLiGYnjDwwCArKqWP7RsmfBXpzAa6+Q
	SZIoa5+BO8jcNlOnSarx0U1z6WQQqf0rbmaCqISV3NMsZryHO9TeLHGeD72K4h4=
X-Google-Smtp-Source: AGHT+IGYZmORF1lV5EMb85XS2qsnN8TL+VkeOBrDpj+YbpFQ2FKSc1DS6tuixB9jHyQHg/NOLaws8w==
X-Received: by 2002:a05:6214:4697:b0:6c3:61c3:5d47 with SMTP id 6a1803df08f44-6c573b20da2mr73620876d6.17.1726162226017;
        Thu, 12 Sep 2024 10:30:26 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c53477427asm56340356d6.112.2024.09.12.10.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 10:30:25 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/6.6: update to v6.6.50
Date: Thu, 12 Sep 2024 13:30:22 -0400
Message-Id: <20240912173023.3993510-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 17:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204456

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    ad07a29023ce Linux 6.6.50
    9d24eaa21731 i2c: Use IS_REACHABLE() for substituting empty ACPI functions
    f5e9a22d19bb virtio_net: Fix napi_skb_cache_put warning
    d8915d271630 media: uvcvideo: Enforce alignment of frame and interval
    e3a95f29647a drm/amd/display: Skip wbscl_set_scaler_filter if filter is null
    e50bec62acae drm/amd/display: Check BIOS images before it is used
    67cf14c04ff0 drm/amd/display: use preferred link settings for dp signal only
    800a5ab673c4 drm/amd/display: Correct the defined value for AMDGPU_DMUB_NOTIFICATION_MAX
    154a50bf4221 drm/amd/display: added NULL check at start of dc_validate_stream
    da696cbb4794 drm/amd/display: Don't use fsleep for PSR exit waits on dmub replay
    381113ef01e2 drm/amdgpu: add lock in kfd_process_dequeue_from_device
    ddfe95f2e1fc drm/amdgpu: add lock in amdgpu_gart_invalidate_tlb
    494b42f35fc2 drm/amdgpu: add skip_hw_access checks for sriov
    2e91ea29622c block: remove the blk_flush_integrity call in blk_integrity_unregister
    72f022ebb9de driver: iio: add missing checks on iio_info's callback access
    6290d3f5883d f2fs: fix to do sanity check on blocks for inline_data inode
    862b19f0b1c2 wifi: cfg80211: make hash table duplicates more survivable
    63ca5b467011 hwmon: (k10temp) Check return value of amd_smn_read()
    20bf2920a869 dmaengine: altera-msgdma: properly free descriptor in msgdma_free_descriptor
    cd3851ef3f7d dmaengine: altera-msgdma: use irq variant of spin_lock/unlock while invoking callbacks
    9d567126474e drm/bridge: tc358767: Check if fully initialized before signalling HPD event via IRQ
    d9612c66af36 gfs2: Revert "Add quota_change type"
    d93a2f86b0a9 crypto: stm32/cryp - call finalize with bh disabled
    68957f511ba4 drm/meson: plane: Add error handling
    ae9018e3f61b net/mlx5e: SHAMPO, Fix incorrect page release
    0b722b813c7d platform/chrome: cros_ec_lpc: MEC access can use an AML mutex
    4be9fd15c3c8 smack: tcp: ipv4, fix incorrect labeling
    4c1145144c94 regmap: spi: Fix potential off-by-one when calculating reserved size
    54a11ce4ff2a drm/amdgu: fix Unintentional integer overflow for mall size
    69f397e60c3b net: remove NULL-pointer net parameter in ip_metrics_convert
    fc1b1e135c3f fsnotify: clear PARENT_WATCHED flags lazily
    3b9f2d9301ae usb: typec: ucsi: Fix null pointer dereference in trace
    73ec94aac593 usbip: Don't submit special requests twice
    f576acf75227 media: v4l2-cci: Always assign *val
    37d9fd31347e rcu/nocb: Remove buggy bypass lock contention mitigation
    f9a9cf96c3d4 pwm: xilinx: Fix u32 overflow issue in 32-bit width PWM mode.
    04e787f836e2 ionic: fix potential irq name truncation
    fd867e74fa4d RDMA/efa: Properly handle unexpected AQ completions
    220725de5aa5 soc: qcom: smem: Add qcom_smem_bust_hwspin_lock_by_host()
    a6978d1b7bb8 hwspinlock: Introduce hwspin_lock_bust()
    e51077ad1bf4 wifi: mac80211: check ieee80211_bss_info_change_notify() against MLD
    7cdb51585589 PCI: al: Check IORESOURCE_BUS existence during probe
    ea37096a6a92 cpufreq: scmi: Avoid overflow of target_freq in fast switch
    0bd1be7e84f5 wifi: iwlwifi: remove fw_running op
    0798e4330b54 drm/amdgpu: update type of buf size to u32 for eeprom functions
    cdc65b5f9998 drm/kfd: Correct pinned buffer handling at kfd restore and validate process
    1107129305c1 wifi: rtw89: ser: avoid multiple deinit on same CAM
    7e8d106ca98a drm/amd/pm: check negtive return for table entries
    7d265772e44d drm/amdgpu: the warning dereferencing obj for nbio_v7_4
    025798f44b8d drm/amd/pm: check specific index for smu13
    d0230b372068 drm/amd/pm: check specific index for aldebaran
    4ab720b6aa1e drm/amdgpu: fix the waring dereferencing hive
    0aad97bf6d0b drm/amdgpu: fix dereference after null check
    d116bb921e8b drm/amdgpu: Fix the warning division or modulo by zero
    58350786dbbd drm/amdgpu/pm: Check input value for CUSTOM profile mode setting on legacy SOCs
    eba7c58b7a83 wifi: ath11k: initialize 'ret' in ath11k_qmi_load_file_target_mem()
    17d89c79181e wifi: ath12k: initialize 'ret' in ath12k_qmi_load_file_target_mem()
    59f742e55a46 apparmor: fix possible NULL pointer dereference
    f163ba83e607 drm/amdkfd: Reconcile the definition and use of oem_id in struct kfd_topology_device
    d0a43bf367ed drm/amdgpu: fix mc_data out-of-bounds read warning
    f2b7a9f3839e drm/amdgpu: fix ucode out-of-bounds read warning
    f9267972490f drm/amdgpu: Fix out-of-bounds read of df_v1_7_channel_number
    e6ea3b8fe398 drm/amdkfd: Check debug trap enable before write dbg_ev_file
    a60d1f7ff62e drm/amdgpu: Fix out-of-bounds write warning
    f71ef2bb69dd drm/amdgpu: Fix the uninitialized variable warning
    3ad44174a576 drm/amdgpu/pm: Fix uninitialized variable agc_btc_response
    3e04fa97077d drm/amdgpu/pm: Fix uninitialized variable warning for smu10
    97667de35ba7 drm/amd/pm: fix uninitialized variable warnings for vangogh_ppt
    4dfec5f5501a drm/amd/amdgpu: Check tbo resource pointer
    4003bac78438 drm/amd/display: Fix index may exceed array range within fpu_update_bw_bounding_box
    8406158a5464 drm/amd/display: Skip inactive planes within ModeSupportAndSystemConfiguration
    3dc6bb57dab3 drm/amd/display: Ensure index calculation will not overflow
    94b0689984dd drm/amd/display: Fix Coverity INTEGER_OVERFLOW within decide_fallback_link_setting_max_bw_policy
    af43ed726fa5 drm/amd/display: Spinlock before reading event
    313d3dd4ca0e drm/amd/display: Fix Coverity INTEGER_OVERFLOW within dal_gpio_service_create
    13faa9d401a5 drm/amd/display: Fix Coverity INTERGER_OVERFLOW within construct_integrated_info
    cb63090a17d3 drm/amd/display: Check msg_id before processing transcation
    21f9cb44f8c6 drm/amd/display: Check num_valid_sets before accessing reader_wm_sets[]
    8b5ccf3d0119 drm/amd/display: Add array index check for hdcp ddc access
    48e0b68e2360 drm/amd/display: Check index for aux_rd_interval before using
    94cb77700fa4 drm/amd/display: Stop amdgpu_dm initialize when stream nums greater than 6
    08e7755f754e drm/amd/display: Check gpio_id before used as array index
    30e60db4296c drm/amdgpu: avoid reading vf2pf info size from FB
    1a2c89396ddc drm/amd/pm: fix uninitialized variable warnings for vega10_hwmgr
    f1e261ced9bc drm/amd/pm: fix the Out-of-bounds read warning
    4711b1347cb9 drm/amd/pm: Fix negative array index read
    59dd0d4b3326 drm/amd/pm: fix warning using uninitialized value of max_vid_step
    1dbce92f3250 drm/amd/pm: fix uninitialized variable warning for smu8_hwmgr
    fc0cb02efdfb drm/amd/pm: fix uninitialized variable warning
    a2f2beaba783 drm/amdgpu/pm: Check the return value of smum_send_msg_to_smc
    da22d1b98d9d drm/amdgpu: fix overflowed array index read warning
    d2fe7ac613a1 drm/amd/display: Assign linear_pitch_alignment even for VM
    761964b756c6 drm/amdgpu: Fix uninitialized variable warning in amdgpu_afmt_acr
    3d2e1b82558b mptcp: pr_debug: add missing \n at the end
    a088190f3fbf mptcp: avoid duplicated SUB_CLOSED events
    1f4ca105abb5 selftests: mptcp: join: stop transfer when check is done (part 2.2)
    5803af655fd5 selftests: mptcp: join: disable get and dump addr checks
    81f2e73e73fb selftests: mptcp: join: test for flush/re-add endpoints
    f9ca09beedda selftests: mptcp: join: check re-re-adding ID 0 signal
    a417ef47a665 selftests: mptcp: join: validate event numbers
    b66609e9aa7c selftests: mptcp: add mptcp_lib_events helper
    0a37a0ec0d7d selftests: mptcp: join: check re-adding init endp with != id
    43ca9a10d052 selftests: mptcp: join: check re-using ID of unused ADD_ADDR
    a95e3e702ce4 selftests: mptcp: add explicit test case for remove/readd
    8863e430e6dc selftests: mptcp: join: cannot rm sf if closed
    a17d1419126b selftests: mptcp: declare event macros in mptcp_lib
    485bb1981a2e selftests: mptcp: userspace pm get addr tests
    1b8af4ba00b2 selftests: mptcp: dump userspace addrs list
    05867195c96f selftests: mptcp: userspace pm create id 0 subflow
    2a72ceb86359 mptcp: pm: fix RM_ADDR ID for the initial subflow
    0229074a5170 mptcp: make pm_remove_addrs_and_subflows static
    489f245e00f0 ASoC: codecs: ES8326: button detect issue
    2eb143e0962c ASoC: amd: yc: Support mic on Lenovo Thinkpad E14 Gen 6
    cc300463aa06 net: usb: qmi_wwan: add MeiG Smart SRM825L
    2ea1fab2df6c dma-debug: avoid deadlock between dma debug vs printk and netconsole
    b1322bc32a34 i2c: Fix conditional for substituting empty ACPI functions
    8b28f8c5d124 spi: hisi-kunpeng: Add validation for the minimum value of speed_hz
    533e175c82ad ASoC: amd: yc: Support mic on HP 14-em0002la
    77e5d743a8cf smb: client: fix FSCTL_GET_REPARSE_POINT against NetApp
    ad3bc43e7296 net/mlx5: DR, Fix 'stack guard page was hit' error in dr_rule
    f8b39e2da7d9 ALSA: seq: ump: Explicitly reset RPN with Null RPN
    9062e98473a9 ALSA: seq: ump: Transmit RPN/NRPN message at each MSB/LSB data reception
    7c34c6894779 ALSA: seq: ump: Use the common RPN/bank conversion context
    4ed4e84939ac ALSA: ump: Explicitly reset RPN with Null RPN
    5a494fdbfc63 ALSA: ump: Transmit RPN/NRPN message at each MSB/LSB data reception
    bd819563d5c3 ALSA: hda/conexant: Mute speakers at suspend / shutdown
    8f11fbe1199b ALSA: hda/generic: Add a helper to mute speakers at suspend/shutdown
    9b090ccd80cc btrfs: tree-checker: validate dref root and objectid
    02c19d769d2b scsi: ufs: core: Bypass quick recovery if force reset is needed
    8d1af5c6af5c scsi: ufs: core: Check LSDBS cap when !mcq
    512bd0cd535b drm: panel-orientation-quirks: Add quirk for OrangePi Neo
    d5618eaea886 drm/fb-helper: Don't schedule_work() to flush frame buffer during panic()
    18abb2787b53 x86/syscall: Mark exit[_group] syscall handlers __noreturn
    2879d995e569 pnmtologo: sync with 6.6
    43ea1c5e6eb3 lib/build_OID_registry: take -stable reproducibility changes
    35046aea43c8 bpftool: Fix undefined bpf macro for unix socket
    9a558d4b8621 tools/resolve_btfids: Fix comparison of distinct pointer types warning in resolve_btfids
    42b2eec2e503 bpftool: Query only cgroup-related attach types
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
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 9463f4d567..2c8725f27a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0f1484ece355a9a9c3f5f45178cf6dadbf08c923"
-SRCREV_meta ?= "3cc947053b7450290cae875946754959171687da"
+SRCREV_machine ?= "f1958988835e4b36462e9a7762001b695989288c"
+SRCREV_meta ?= "c82d4e5d08201d0259c29a4d15ce1e72fc63c65f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.49"
+LINUX_VERSION ?= "6.6.50"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index ac1f1755fe..ce20fbc07d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.49"
+LINUX_VERSION ?= "6.6.50"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "06e8675c342253e9aaf9c7b7ebf2f4493dc6f247"
-SRCREV_meta ?= "3cc947053b7450290cae875946754959171687da"
+SRCREV_machine ?= "10604010520101e717ca658ada47b394a46e1539"
+SRCREV_meta ?= "c82d4e5d08201d0259c29a4d15ce1e72fc63c65f"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index efd7725169..4a7ba85a45 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -21,25 +21,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "7393c01d34b5c539f34e340024daa4bace20f5bd"
-SRCREV_machine:qemuarm64 ?= "06e8675c342253e9aaf9c7b7ebf2f4493dc6f247"
-SRCREV_machine:qemuloongarch64 ?= "06e8675c342253e9aaf9c7b7ebf2f4493dc6f247"
-SRCREV_machine:qemumips ?= "7bfe885f1a43718ff5a3c5be2f0c0f5b173910c1"
-SRCREV_machine:qemuppc ?= "06e8675c342253e9aaf9c7b7ebf2f4493dc6f247"
-SRCREV_machine:qemuriscv64 ?= "06e8675c342253e9aaf9c7b7ebf2f4493dc6f247"
-SRCREV_machine:qemuriscv32 ?= "06e8675c342253e9aaf9c7b7ebf2f4493dc6f247"
-SRCREV_machine:qemux86 ?= "06e8675c342253e9aaf9c7b7ebf2f4493dc6f247"
-SRCREV_machine:qemux86-64 ?= "06e8675c342253e9aaf9c7b7ebf2f4493dc6f247"
-SRCREV_machine:qemumips64 ?= "8f47e7c0df83299b256c09441385236693402c71"
-SRCREV_machine ?= "06e8675c342253e9aaf9c7b7ebf2f4493dc6f247"
-SRCREV_meta ?= "3cc947053b7450290cae875946754959171687da"
+SRCREV_machine:qemuarm ?= "36f604ad9d400626d19666688399af0d0ae93e53"
+SRCREV_machine:qemuarm64 ?= "10604010520101e717ca658ada47b394a46e1539"
+SRCREV_machine:qemuloongarch64 ?= "10604010520101e717ca658ada47b394a46e1539"
+SRCREV_machine:qemumips ?= "8ca27eda30aa6ceb72b61c784ebb057de07201ae"
+SRCREV_machine:qemuppc ?= "10604010520101e717ca658ada47b394a46e1539"
+SRCREV_machine:qemuriscv64 ?= "10604010520101e717ca658ada47b394a46e1539"
+SRCREV_machine:qemuriscv32 ?= "10604010520101e717ca658ada47b394a46e1539"
+SRCREV_machine:qemux86 ?= "10604010520101e717ca658ada47b394a46e1539"
+SRCREV_machine:qemux86-64 ?= "10604010520101e717ca658ada47b394a46e1539"
+SRCREV_machine:qemumips64 ?= "72b65c64c2fd2b4d252b4a93642acc268ca2f006"
+SRCREV_machine ?= "10604010520101e717ca658ada47b394a46e1539"
+SRCREV_meta ?= "c82d4e5d08201d0259c29a4d15ce1e72fc63c65f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "df1a7cc5e00ffb5d330f10483a4d5974f5941d78"
+SRCREV_machine:class-devupstream ?= "ad07a29023cebd40848fce81e6732d671ede5fe6"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -47,7 +47,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.49"
+LINUX_VERSION ?= "6.6.50"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


