Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CEFD1626C
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 13:45:56 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.55472.1728913550213158522
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Oct 2024 06:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D0udHE0/;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7afc5925679so289498385a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 06:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728913549; x=1729518349; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0O8Wu3miYfI2f8GowsVDebxjcDDbK70zF7utotYTpQ=;
        b=D0udHE0/qtmbOtYGNvKaHK6EPB3LVDgMdkHggcwSVdDUmqgnVwGme37RgqKC0Q/nql
         pGzUtwMTAWPbBfvkmELx65YLEzfwM4rePOcrGQGAZb3aG5x4PSML0fUQMdaENFhjWdid
         T1a0Aax9kb7uosMBG9pKkLhENf7nISFQ9C0rcuERtejBH++5PvewrIh7KBfWLMA3aoTd
         yh7sLQn+20vZ/CE/9CeuRtu6yg4s3doqq18O5HJceA5sDNXqQGFOlp2375umIbWs8Q0Z
         rBMECU48wJqIpFn0hjSJarSIgc8n5HwpoONtwvtWqe5waW+tIE+9+5yodWTRWp1cxNcT
         hNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728913549; x=1729518349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0O8Wu3miYfI2f8GowsVDebxjcDDbK70zF7utotYTpQ=;
        b=lYu8D9m0CuSYKfwWUe/dBMRA/vSnjnE+c0cKTve5LOvMSBH2sTXCatPru7rUzMNncQ
         DoCdK794j/pCjeATPxMUBBbCE6/LVYfOtYgI5CQVDU47OkXYLVAyAKh6Nh1cXARjc/1x
         Is12wG0Qtr1zDghxdQ72ECCHNASn+SnRvpPmHnmkeMG6VFnSqLl8lUwyDWhHUoZGCTgP
         UGnt942fBgY2N8bjvKyjgyXZOLUTXWFkMZMTyyftHt3oz/QJo6ueCWs4eFk5kmuCR7fy
         garCWcpLBD7on2tOfFSPEsWuJZM2s86jHnnO4HYicC5c9Lo/pUGPZw7wXbtAwHXxe87H
         AnJw==
X-Gm-Message-State: AOJu0YxvrajTWXDwQkhPlCmgl6iKm6NyyXplTYV5jf1d69l3/1dorvX+
	mf5uW0ZE/AlaNy7hkkzg+7jGiLsIkfd/RPJxEKmW5Z2IDHGR3StWEQRpAg==
X-Google-Smtp-Source: AGHT+IHAjHSDNCbHnRKBCR4yAnSDDP6PEI2hPw85b/ugNFPOva5xwrCBYr8Ebybvazx0U3xcM5cahg==
X-Received: by 2002:a05:620a:1a8a:b0:7ac:de4d:d8a with SMTP id af79cd13be357-7b120fc3e16mr1276731685a.27.1728913548779;
        Mon, 14 Oct 2024 06:45:48 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b1148c71b0sm422617685a.3.2024.10.14.06.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 06:45:48 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-yocto/6.10: update to v6.10.14
Date: Mon, 14 Oct 2024 09:45:37 -0400
Message-Id: <4353e8c6a91fd5736de438bc8eedc832bf335c5e.1728912923.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1728912923.git.bruce.ashfield@gmail.com>
References: <cover.1728912923.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Oct 2024 13:45:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205776

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.10 to the latest korg -stable release that comprises
the following commits:

    47c2f92131c4 Linux 6.10.14
    aa8086f899a7 perf python: Allow checking for the existence of warning options in clang
    df8d896f8f94 drm/amd/display: enable_hpo_dp_link_output: Check link_res->hpo_dp_link_enc before using it
    e34ddcce0066 perf report: Fix segfault when 'sym' sort key is not used
    8ba850ac0c32 drm/amd/display: Revert Avoid overflow assignment
    a97a22bb688c crypto: octeontx* - Select CRYPTO_AUTHENC
    41e7dd6fb6f8 ALSA: control: Fix leftover snd_power_unref()
    00fb5b23e1c9 vhost/scsi: null-ptr-dereference in vhost_scsi_get_req()
    56e415202b8a rxrpc: Fix a race between socket set up and I/O thread creation
    4a5dac62c172 drm/sched: revert "Always increment correct scheduler score"
    a3ab4e7e10ae Revert "drm/amd/display: Skip Recompute DSC Params if no Stream on Link"
    45b13bbd89cf drm/rockchip: vop: enable VOP_FEATURE_INTERNAL_RGB on RK3066
    ca26e8eed9c1 ACPI: battery: Fix possible crash when unregistering a battery hook
    31ffdcb2b302 ACPI: battery: Simplify battery hook locking
    92bc8647b4d6 r8169: add tally counter fields added with RTL8125
    865310fc5b57 r8169: Fix spelling mistake: "tx_underun" -> "tx_underrun"
    9360b0f5dbcd iio: pressure: bmp280: Fix waiting time for BMP3xx configuration
    a257fd6b4112 iio: pressure: bmp280: Fix regmap for BMP280 device
    5e8419cb858b iio: pressure: bmp280: Use BME prefix for BME280 specifics
    68dc17268d02 iio: pressure: bmp280: Improve indentation and line wrapping
    de4d873a7932 remoteproc: k3-r5: Delay notification of wakeup event
    c1ea59b64cf7 remoteproc: k3-r5: Acquire mailbox handle during probe routine
    207f1c8c86e4 RDMA/mana_ib: use the correct page table index based on hardware page size
    76024ae302c6 net: mana: Add support for page sizes other than 4KB on ARM64
    b4e21431a0db NFSD: Limit the number of concurrent async COPY operations
    d0969746d33b NFSD: Async COPY result needs to return a write verifier
    17c0cbfd2274 sunrpc: change sp_nrthreads from atomic_t to unsigned int.
    49430bda7c68 sched: psi: fix bogus pressure spikes from aggregation race
    272b0e788745 drm/xe: fix UAF around queue destruction
    baa6301d8257 drm/xe: Delete unused GuC submission_state.suspend
    52372cc28bac lib/buildid: harden build ID parsing logic
    ec580d6742c7 build-id: require program headers to be right after ELF header
    1665af776b64 drm/amd/display: Allow backlight to go below `AMDGPU_DM_DEFAULT_MIN_BACKLIGHT`
    8a2f4f156ab4 mm: z3fold: deprecate CONFIG_Z3FOLD
    2aa45f43709b uprobes: fix kernel info leak via "[uprobes]" vma
    94f87d63613a arm64: errata: Expand speculative SSBS workaround once more
    03ddc3ec9600 arm64: cputype: Add Neoverse-N3 definitions
    830a573b87cf kconfig: qconf: fix buffer overflow in debug links
    c0bdc6c6a97c cpufreq: intel_pstate: Make hwp_notify_lock a raw spinlock
    73e441be033d drm/amd/display: Fix system hang while resume with TBT monitor
    945dc25eda88 drm/amd/display: update DML2 policy EnhancedPrefetchScheduleAccelerationFinal DCN35
    c28331512f4e drm/amd/display: Add HDR workaround for specific eDP
    c09c425d25a1 drm/sched: Always increment correct scheduler score
    d607eca401a7 drm/sched: Always wake up correct scheduler in drm_sched_entity_push_job
    48e3cf7af76c drm/sched: Add locking to drm_sched_entity_modify_sched
    ac44fecf0a56 drm/sched: Fix dynamic job-flow control race
    9c8c396ba700 drm/panthor: Don't declare a queue blocked if deferred operations are pending
    ac2ca5e5148a drm/panthor: Fix access to uninitialized variable in tick_ctx_cleanup()
    a3a1c41da56f drm/panthor: Don't add write fences to the shared BOs
    7f23b5fbcddd drm/i915/gem: fix bitwise and logical AND mixup
    c11b0737d0e0 close_range(): fix the logics in descriptor table trimming
    798130704be6 firmware/sysfb: Disable sysfb for firmware buffers with unknown parent
    f753ba8670f4 rtla: Fix the help text in osnoise and timerlat top tools
    3670051acbca tracing/timerlat: Fix duplicated kthread creation due to CPU online/offline
    a0d9c0cd5856 tracing/timerlat: Fix a race during cpuhp processing
    09cb44cc3d3d tracing/timerlat: Drop interface_lock in stop_kthread()
    0a675c6c7e33 tracing/hwlat: Fix a race during cpuhp processing
    1d9af0f544de ceph: fix cap ref leak via netfs init_request
    83fde8356b41 io_uring/net: harden multishot termination case for recv
    540138377b22 mac802154: Fix potential RCU dereference issue in mac802154_scan_worker
    ad7adfb95f64 Bluetooth: hci_event: Align BR/EDR JUST_WORKS paring with LE
    01feafd82a68 net: pcs: xpcs: fix the wrong register that was written back
    765f033f26a9 gpio: davinci: fix lazy disable
    77f88b17387a cpufreq: Avoid a bad reference count on CPU node
    bf0de0f9a054 btrfs: wait for fixup workers before stopping cleaner kthread during umount
    1053475c4af8 btrfs: send: fix invalid clone operation for file that got its size decreased
    4f255c6c3204 btrfs: drop the backref cache during relocation if we commit
    dc02c1440705 btrfs: fix a NULL pointer dereference when failed to start a new trasacntion
    b5885bedfa27 ACPI: resource: Add Asus ExpertBook B2502CVA to irq1_level_low_skip_override[]
    bd0568841b58 ACPI: resource: Add Asus Vivobook X1704VAP to irq1_level_low_skip_override[]
    c500dc3ef5c1 ACPI: resource: Loosen the Asus E1404GAB DMI match to also cover the E1404GA
    9eb7d786c80a ACPI: resource: Remove duplicate Asus E1504GAB IRQ override
    1589c4116810 ACPI: video: Add backlight=native quirk for Dell OptiPlex 5480 AIO
    e4a28489b310 cachefiles: fix dentry leak in cachefiles_open_file()
    2a9d0d2db804 Input: adp5589-keys - fix adp5589_gpio_get_value()
    9a38791ee79b Input: adp5589-keys - fix NULL pointer dereference
    0e774fb34d7b rtc: at91sam9: fix OF node leak in probe() error path
    e297a2bf56d1 net: stmmac: Fix zero-division error when disabling tc cbs
    e9cf96d3d036 tomoyo: fallback to realpath if symlink's pathname does not exist
    33e28acf42ee gso: fix udp gso fraglist segmentation after pull from frag_list
    3fdd8c83e83f net: gso: fix tcp fraglist segmentation after pull from frag_list
    8c9381b31382 vrf: revert "vrf: Remove unnecessary RCU-bh critical section"
    0072322c6fe2 iio: magnetometer: ak8975: Fix reading for ak099xx sensors
    23521aadc6e2 smb3: fix incorrect mode displayed for read-only files
    51cf4e5ad134 smb: client: use actual path when queryfs
    3dd3b564535c clk: qcom: clk-alpha-pll: Fix CAL_L_VAL override for LUCID EVO PLL
    0e2e46d4e5cb clk: qcom: gcc-sc8180x: Fix the sdcc2 and sdcc4 clocks freq table
    6ab44e53a67f media: qcom: camss: Fix ordering of pm_runtime_enable
    1081881be9b1 clk: qcom: gcc-sc8180x: Add GPLL9 support
    a975db8aea15 media: qcom: camss: Remove use_count guard in stop_streaming
    cefa27681fa6 clk: qcom: gcc-sm8250: Do not turn off PCIe GDSCs during gdsc_disable()
    d925e9f7fb5a media: venus: fix use after free bug in venus_remove due to race condition
    9fff37bc82b5 clk: qcom: gcc-sm8150: De-register gcc_cpuss_ahb_clk_src
    0e595d3f9927 clk: samsung: exynos7885: Update CLKS_NR_FSYS after bindings fix
    58cdc0e79ece clk: qcom: clk-rpmh: Fix overflow in BCM vote
    1127647741e4 dt-bindings: clock: qcom: Add GPLL9 support on gcc-sc8180x
    6e9086eba618 media: uapi/linux/cec.h: cec_msg_set_reply_to: zero flags
    a854c234d8f3 clk: qcom: gcc-sm8450: Do not turn off PCIe GDSCs during gdsc_disable()
    eae177533046 media: sun4i_csi: Implement link validate for sun4i_csi subdev
    1aec8446c734 clk: qcom: dispcc-sm8250: use CLK_SET_RATE_PARENT for branch clocks
    89c7fedd0e13 media: videobuf2: Drop minimum allocation requirement of 2 buffers
    afd102bde99d remoteproc: k3-r5: Fix error handling when power-up failed
    7a6c6ccab3d8 clk: rockchip: fix error for unknown clocks
    710fd3d1cdd0 media: ov5675: Fix power on/off delay timings
    617c1b60f3df media: imx335: Fix reset-gpio handling
    89d9a69ae0c6 aoe: fix the potential use-after-free problem in more places
    1b1ba6d62835 riscv: Fix kernel stack size when KASAN is enabled
    f70f801f90c0 drivers/perf: riscv: Align errno for unsupported perf event
    0b8e9f0e43f4 RDMA/mana_ib: use the correct page size for mapping user-mode doorbell page
    51d7f1049234 sysctl: avoid spurious permanent empty tables
    4318998892bf i3c: master: svc: Fix use after free vulnerability in svc_i3c_master Driver Due to Race Condition
    e91d86e8537a NFSD: Fix NFSv4's PUTPUBFH operation
    c76005adfa93 nfsd: map the EBADMSG to nfserr_io to avoid warning
    c1bc9d523695 nfsd: fix delegation_blocked() to block correctly for at least 30 seconds
    d18bb644d6c6 perf hist: Update hist symbol when updating maps
    a2bb1edc4468 perf python: Disable -Wno-cast-function-type-mismatch if present on clang
    dca359db1eb3 exfat: fix memory leak in exfat_load_bitmap()
    c2e629efd6a6 riscv: define ILLEGAL_POINTER_VALUE for 64bit
    d6b7fb7e01f9 sched/core: Clear prev->dl_server in CFS pick fast path
    24dabf0b142c sched/core: Add clearing of ->dl_server in put_prev_task_balance()
    62ee1dae878d sched/deadline: Comment sched_dl_entity::dl_server variable
    2ea0e186c686 arm64: Subscribe Microsoft Azure Cobalt 100 to erratum 3194386
    16e7c0ac7bc3 arm64: fix selection of HAVE_DYNAMIC_FTRACE_WITH_ARGS
    a77fd5c22431 scripts/gdb: fix lx-mounts command error
    912edbfd31c6 scripts/gdb: add iteration function for rbtree
    8ad3ce94c971 scripts/gdb: fix timerlist parsing issue
    46b1edf0536a ocfs2: fix possible null-ptr-deref in ocfs2_set_buffer_uptodate
    f60e94a83db7 ocfs2: fix null-ptr-deref when journal load failed.
    df4f20fc3673 ocfs2: remove unreasonable unlock in ocfs2_read_blocks
    a4346c04d055 ocfs2: cancel dqi_sync_work before freeing oinfo
    9f9a8f3ac65b ocfs2: reserve space for inline xattr before attaching reflink tree
    5af5cd893818 ocfs2: fix uninit-value in ocfs2_get_block()
    ed789ef13079 ocfs2: fix the la space leak when unmounting an ocfs2 volume
    73388659ef0e mm: krealloc: consider spare memory for __GFP_ZERO
    e58e570a88f0 jbd2: correctly compare tids with tid_geq function in jbd2_fc_begin_commit
    3ced0fe6c0ef jbd2: stop waiting for space when jbd2_cleanup_journal_tail() returns error
    06ff97a20b8c resource: fix region_intersects() vs add_memory_driver_managed()
    0d71916694ac drm: omapdrm: Add missing check for alloc_ordered_workqueue
    0efd44eae47a of/irq: Support #msi-cells=<0> in of_msi_get_domain
    c5caf2527fe4 of: address: Report error on resource bounds overflow
    5961191edfc4 drm/rockchip: vop: clear DMA stop bit on RK3066
    1977bef83b70 parisc: Fix stack start for ADDR_NO_RANDOMIZE personality
    348f2b824a47 parisc: Allow mmap(MAP_STACK) memory to automatically expand upwards
    decde7c9fd1b parisc: Fix 64-bit userspace syscall path
    0d80d2b8bf61 ext4: fix off by one issue in alloc_flex_gd()
    e83d426186be ext4: mark fc as ineligible using an handle in ext4_xattr_set()
    b2b7dc103685 ext4: use handle to mark fc as ineligible in __track_dentry_update()
    04b32feef487 ext4: fix fast commit inode enqueueing during a full journal commit
    e0f8f7af8a69 ext4: fix incorrect tid assumption in jbd2_journal_shrink_checkpoint_list()
    33841ebb9f9f ext4: fix incorrect tid assumption in ext4_wait_for_tail_page_commit()
    b63481b3a388 ext4: update orig_path in ext4_find_extent()
    d157fc20ca52 ext4: fix access to uninitialised lock in fc replay path
    fa78fb51d396 ext4: fix timer use-after-free on failed mount
    7633407ca4ab ext4: fix double brelse() the buffer of the extents path
    beb7b66fb489 ext4: aovid use-after-free in ext4_ext_insert_extent()
    3ff710662e8d ext4: drop ppath from ext4_ext_replay_update_ex() to avoid double-free
    40eae11eb476 ext4: fix incorrect tid assumption in __jbd2_log_wait_for_space()
    a9f331f51515 ext4: dax: fix overflowing extents beyond inode size when partially writing
    7091e216e12c ext4: fix incorrect tid assumption in ext4_fc_mark_ineligible()
    870a959d1928 ext4: propagate errors from ext4_find_extent() in ext4_insert_range()
    5d949ea75bb5 ext4: fix slab-use-after-free in ext4_split_extent_at()
    8083a0bcdaea ext4: correct encrypted dentry name hash when not casefolded
    fe192515d293 ext4: no need to continue when the number of entries is 1
    6de827d2059d ALSA: hda/realtek: Add a quirk for HP Pavilion 15z-ec200
    1a87bb170d93 ALSA: hda/realtek: Add quirk for Huawei MateBook 13 KLV-WX9
    787c2b346120 ALSA: hda/realtek: fix mute/micmute LED for HP mt645 G8
    3eef9a4f5b7d ALSA: line6: add hw monitor volume control to POD HD500X
    3751064c3815 ALSA: usb-audio: Add native DSD support for Luxman D-08u
    2376dec1c21a ALSA: usb-audio: Add delay quirk for VIVO USB-C HEADSET
    2894ff782f10 ALSA: core: add isascii() check to card ID generator
    017915575037 ALSA: hda/tas2781: Add new quirk for Lenovo Y990 Laptop
    4a4d08b06901 drm: Consistently use struct drm_mode_rect for FB_DAMAGE_CLIPS
    8800db8d27e4 drm/mediatek: ovl_adaptor: Add missing of_node_put()
    288191fe9d66 parisc: Fix itlb miss handler for 64-bit programs
    3e50d72abe50 drm/v3d: Prevent out of bounds access in performance query extensions
    3b485889fb3f perf/core: Fix small negative period being ignored
    7a2e823a1974 mm, slub: avoid zeroing kmalloc redzone
    b883182a7eaa power: supply: hwmon: Fix missing temp1_max_alarm attribute
    7688586d0562 spi: bcm63xx: Fix missing pm_runtime_disable()
    bcbbd8b45de3 spi: bcm63xx: Fix module autoloading
    8ad8fff75692 dt-bindings: clock: exynos7885: Fix duplicated binding
    7cd1ce71227f memory: tegra186-emc: drop unused to_tegra186_emc()
    411ef1a96fbd firmware: tegra: bpmp: Drop unused mbox_client_to_bpmp()
    cea4f54ad411 ovl: fail if trusted xattrs are needed but caller lacks permission
    18e9c282472a rust: sync: require `T: Sync` for `LockedBy::access`
    315114f46207 i2c: synquacer: Deal with optional PCLK correctly
    fa5f0091b39e i2c: designware: fix controller is holding SCL low while ENABLE bit is disabled
    9d1fa01dd17e i2c: xiic: Fix pm_runtime_set_suspended() with runtime pm enabled
    24781e20fcdf i2c: core: Lock address during client device instantiation
    2423b60a2d6d media: i2c: ar0521: Use cansleep version of gpiod_set_value()
    8ade08a9039a i2c: xiic: Wait for TX empty to avoid missed TX NAKs
    1e03cfffa5fd i2c: qcom-geni: Use IRQF_NO_AUTOEN flag in request_irq()
    fac3c9f7784e i2c: stm32f7: Do not prepare/unprepare clock during runtime suspend/resume
    bbefa2376a5f KVM: arm64: Fix kvm_has_feat*() handling of negative features
    cebc705b097d platform/x86: ISST: Fix the KASAN report slab-out-of-bounds bug
    f08adc5177bd platform/x86: x86-android-tablets: Fix use after free on platform_device_register() errors
    6a1fe876e291 Revert "ALSA: hda: Conditionally use snooping for AMD HDMI"
    b72b40cd784f f2fs: forcibly migrate to secure space for zoned device file pinning
    6f483e0b7b45 f2fs: do FG_GC when GC boosting is required for zoned devices
    a9881ee31f82 f2fs: increase BG GC migration window granularity when boosted for zoned devices
    31a6f6f44c67 f2fs: introduce migration_window_granularity
    1219cbb0b3d1 f2fs: make BG GC more aggressive for zoned devices
    cc1c9708740f selftests: vDSO: fix vdso_config for s390
    1668c4efa7aa selftests: vDSO: fix ELF hash table entry size for s390x
    7270e5f957fa powerpc/vdso: Fix VDSO data access when running in a non-root time namespace
    9f6e7a0512a5 f2fs: fix to don't panic system for no free segment fault injection
    d26056f9f2b8 f2fs: add write priority option based on zone UFS
    f877cda18a28 nvme-tcp: fix link failure for TCP auth
    d729ba02b1de selftests/mm: fix charge_reserved_hugetlb.sh test
    59ff1b61070e selftests: vDSO: fix vDSO symbols lookup for powerpc64
    9189b421a395 selftests: vDSO: fix vdso_config for powerpc
    9d7926a7120b selftests: vDSO: fix vDSO name for powerpc
    6a1ab4a0745e drm/xe: Fix memory leak on xe_alloc_pf_queue failure
    ddf3e1ff1c2a drm/xe: fixup xe_alloc_pf_queue
    84a7fefc2b8c perf: Really fix event_function_call() locking
    8444283facf2 perf callchain: Fix stitch LBR memory leaks
    28f4ec89a9a4 ALSA: control: Fix power_ref lock order for compat code, too
    98ec87b3f90f spi: rpc-if: Add missing MODULE_DEVICE_TABLE
    3312f9c93174 accel/ivpu: Add missing MODULE_FIRMWARE metadata
    e8ecc1175860 selftests: breakpoints: use remaining time to check if suspend succeed
    d6713af2395e kselftest/devices/probe: Fix SyntaxWarning in regex strings for Python3
    b8f27f7c447a spi: s3c64xx: fix timeout counters in flush_fifo
    b0e689bf8727 selftest: hid: add missing run-hid-tools-tests.sh
    1753eaa877da spi: spi-cadence: Fix missing spi_controller_is_target() check
    954313740674 spi: spi-cadence: Fix pm_runtime_set_suspended() with runtime pm enabled
    9b61acfa6f75 spi: spi-imx: Fix pm_runtime_set_suspended() with runtime pm enabled
    c34d1aac8922 EINJ, CXL: Fix CXL device SBDF calculation
    4902a6a0dc59 bpf: Fix a sdiv overflow issue
    2e0f6f33f2aa bpftool: Fix undefined behavior in qsort(NULL, 0, ...)
    11292e2e1899 iomap: handle a post-direct I/O invalidate race in iomap_write_delalloc_release
    40d0abceb479 bpftool: Fix undefined behavior caused by shifting into the sign bit
    6252cb6bde7f ext4: fix i_data_sem unlock order in ext4_ind_migrate()
    8b114f2cc7dd ext4: avoid use-after-free in ext4_ext_show_leaf()
    3e3f232a0520 ext4: ext4_search_dir should return a proper error
    6e39a21ee2b8 bpf: Make the pointer returned by iter next method valid
    3e9c867f98d3 platform/x86: x86-android-tablets: Adjust Xiaomi Pad 2 bottom bezel touch buttons LED
    37ba0bcdc381 platform/mellanox: mlxbf-pmc: fix lockdep warning
    9fd3cde4628b ksmbd: add refcnt to ksmbd_conn struct
    8164e5fd1b23 HID: i2c-hid: ensure various commands do not interfere with each other
    957da521c66a tools/hv: Add memory allocation check in hv_fcopy_start
    c0032486b262 platform/x86: lenovo-ymc: Ignore the 0x0 state
    baf1632d595c drm/amdgpu/gfx10: use rlc safe mode for soft recovery
    bf817cb95e10 drm/amdgpu/gfx11: use rlc safe mode for soft recovery
    df590bff84b9 ovl: fsync after metadata copy-up
    0c3f429d6dea powerpc/pseries: Use correct data types from pseries_hp_errorlog struct
    f586dcfa9d64 of/irq: Refer to actual buffer size in of_irq_parse_one()
    7935f8204acc drm/xe: Drop warn on xe_guc_pc_gucrc_disable in guc pc fini
    13f83a0d5ac2 drm/amdkfd: Check int source id for utcl2 poison event
    8adf4408d482 drm/amd/pm: ensure the fw_info is not null before using it
    a67d874e7a04 drm/xe: Use topology to determine page fault queue size
    93a3f68a0f53 drm/amdgpu/gfx11: enter safe mode before touching CP_INT_CNTL
    2a82c59c8315 drm/amdgpu/gfx9: use rlc safe mode for soft recovery
    17a98c942cb1 drm/amdgpu: Block MMR_READ IOCTL in reset
    c26473000338 drm/radeon/r100: Handle unknown family in r100_cp_init_microcode()
    524e2b97298d scsi: NCR5380: Initialize buffer for MSG IN and STATUS transfers
    07f1dc009a93 perf: Fix event_function_call() locking
    5c990fc52893 drm/amdgpu: fix unchecked return value warning for amdgpu_atombios
    94d26a45d310 drm/amdgpu: fix unchecked return value warning for amdgpu_gfx
    4a98aa0cd5d7 scsi: lpfc: Update PRLO handling in direct attached topology
    e2e033a018d0 scsi: lpfc: Fix unsolicited FLOGI kref imbalance when in direct attached topology
    99a801e2fca3 scsi: lpfc: Validate hdwq pointers before dereferencing in reset/errata paths
    22a22f79a3e9 scsi: aacraid: Rearrange order of struct aac_srb_unit
    ef0487825734 perf,x86: avoid missing caller address in stack traces captured in uprobe
    1e0f4f9f8228 drm/printer: Allow NULL data in devcoredump printer
    bc00d211da4f drm/amd/display: Initialize get_bytes_per_element's default to 1
    26ced9d86240 drm/amd/display: Avoid overflow assignment in link_dp_cts
    677f6e91c667 drm/amdgpu/gfx9: properly handle error ints on all pipes
    578422ddae3d drm/amd/display: Fix index out of bounds in DCN30 color transformation
    2f5da549535b drm/amd/display: Fix index out of bounds in degamma hardware format translation
    f5c3d306de91 drm/amd/display: Fix index out of bounds in DCN30 degamma hardware format translation
    530e29452b95 drm/amd/display: Check link_res->hpo_dp_link_enc before using it
    5b4b13e678b1 drm/amd/display: Check stream before comparing them
    1decf695ce08 drm/amd/display: Check phantom_stream before it is used
    3fc70ae048fe drm/amd/display: Check null-initialized variables
    1f699de6f6e6 drm/stm: ltdc: reset plane transparency after plane disable
    3cb391adb345 platform/x86/amd: pmf: Add quirk for TUF Gaming A14
    1d91a9158e62 platform/x86: touchscreen_dmi: add nanote-next quirk
    7ec4ce28bcf9 HID: multitouch: Add support for Thinkpad X12 Gen 2 Kbd Portfolio
    81d083d693a8 drm/amdkfd: Fix resource leak in criu restore queue
    9270cf786959 drm/amdgpu: enable gfxoff quirk on HP 705G4
    fe19a7c6c03b drm/amdgpu: add raven1 gfxoff quirk
    7c244d5b4828 jfs: Fix uninit-value access of new_ea in ea_buffer
    9773737375b2 drm/msm/adreno: Assign msm_gpu->pdev earlier to avoid nullptrs
    14e5437010d2 scsi: smartpqi: add new controller PCI IDs
    b8ddd0d6f57e scsi: smartpqi: correct stream detection
    cb0eb1055880 jfs: check if leafidx greater than num leaves per dmap tree
    a9603a6f75df jfs: Fix uaf in dbFreeBits
    85dfc405938f jfs: UBSAN: shift-out-of-bounds in dbFindBits
    5ec731ef47f1 drm/amdgpu: add list empty check to avoid null pointer issue
    7af9e6fa63db drm/amd/display: fix double free issue during amdgpu module unload
    9132882eaae4 drm/amd/display: Add null check for 'afb' in amdgpu_dm_plane_handle_cursor_update (v2)
    3f7e533c10db drm/amd/display: Check null pointers before using dc->clk_mgr
    496486950c3d drm/amd/display: Add NULL check for function pointer in dcn32_set_output_transfer_func
    02411e935929 drm/amd/display: Add NULL check for function pointer in dcn20_set_output_transfer_func
    ec6c32b58e6c drm/amd/display: Handle null 'stream_status' in 'planes_changed_for_existing_stream'
    b68c60745482 HID: Ignore battery for all ELAN I2C-HID devices
    8d8c20739719 scsi: smartpqi: Add new controller PCI IDs
    28dda6748a7c ata: sata_sil: Rename sil_blacklist to sil_quirks
    2ab9edd82156 ata: pata_serverworks: Do not use the term blacklist
    54877301a755 drm/amd/display: Use gpuvm_min_page_size_kbytes for DML2 surfaces
    3929e382e475 drm/amd/display: Add null check for top_pipe_to_program in commit_planes_for_stream
    c940627857ee drm/xe/hdcp: Check GSC structure validity
    f0454b3cb058 drm/amd/display: Add NULL check for clk_mgr in dcn32_init_hw
    5443c83eb8fd drm/amd/display: Add NULL check for clk_mgr and clk_mgr->funcs in dcn30_init_hw
    4f47292f488f drm/amd/display: Add null check for head_pipe in dcn32_acquire_idle_pipe_for_head_pipe_in_layer
    390d757621f5 drm/amd/display: Add null check for head_pipe in dcn201_acquire_free_pipe_for_layer
    71f3240f8298 drm/amdkfd: amdkfd_free_gtt_mem clear the correct pointer
    fcdfddaea93f drm/amdgpu: disallow multiple BO_HANDLES chunks in one submit
    65e1d2c29155 drm/amd/display: Check null pointers before using them
    85aa996ecfaa drm/amd/display: Pass non-null to dcn20_validate_apply_pipe_split_flags
    454e5d7e6719 drm/stm: Avoid use-after-free issues with crtc and plane
    c131ba318119 iommu/arm-smmu-v3: Do not use devm for the cd table allocations
    8ab6ef39095e iommu/vt-d: Unconditionally flush device TLB for pasid table updates
    07e4e92f84b7 iommu/vt-d: Fix potential lockup if qi_submit_sync called with 0 count
    1ac538d8a3bb iommu/vt-d: Always reserve a domain ID for identity setup
    92f67ef0d5c5 iommu/arm-smmu-v3: Match Stall behaviour for S2
    7324014b6c02 power: reset: brcmstb: Do not go into infinite loop if reset fails
    ee0824f09fc0 rcuscale: Provide clear error when async specified without primitives
    fdc38780b64a pmdomain: core: Don't hold the genpd-lock when calling dev_pm_domain_set()
    aaadc0cb05c9 fbdev: pxafb: Fix possible use after free in pxafb_task()
    872cd2d029d2 fbdev: efifb: Register sysfs groups through driver core
    3e2f2fec600a hwmon: (nct6775) add G15CF to ASUS WMI monitoring list
    3104bddc666f rcu-tasks: Fix access non-existent percpu rtpcp variable in rcu_tasks_need_gpcb()
    79108bef7f02 ASoC: Intel: boards: always check the result of acpi_dev_get_first_match_dev()
    b51db91a6dd0 x86/syscall: Avoid memcpy() for ia32 syscall_get_arguments()
    c07e212bb2ce selftests/nolibc: avoid passing NULL to printf("%s")
    69a70f5b4817 tools/nolibc: powerpc: limit stack-protector workaround to GCC
    5d07d380be51 ALSA: hdsp: Break infinite MIDI input flush loop
    ad7248a5e925 ALSA: asihpi: Fix potential OOB array access
    d80a99892f7a x86/mm/ident_map: Use gbpages only where full GB page should be mapped.
    ce22c9746d05 x86/kexec: Add EFI config table identity mapping for kexec kernel
    b01ac4e2472e x86/pkeys: Restore altstack access in sigreturn()
    dbcd315824c2 x86/pkeys: Add PKRU as a parameter in signal handling functions
    6702ffb1cc03 tools/x86/kcpuid: Protect against faulty "max subleaf" values
    b7187a16d51c ALSA: control: Take power_ref lock primarily
    393b53d6ff49 ASoC: codecs: wsa883x: Handle reading version failure
    27986154c37a ALSA: usb-audio: Add logitech Audio profile quirk
    3089703ab714 ALSA: usb-audio: Add mixer quirk for RME Digiface USB
    5c3e5f909f05 ALSA: usb-audio: Add quirk for RME Digiface USB
    f27840d0d366 ALSA: usb-audio: Replace complex quirk lines with macros
    9666e593732b ALSA: usb-audio: Define macros for quirk table entries
    327830af6cb4 x86/apic: Remove logical destination mode for 64-bit
    649a5c2ffae7 x86/ioapic: Handle allocation failures gracefully
    f75ea831df52 ALSA: usb-audio: Add input value sanity checks for standard types
    4c7d4c0a8ab7 nfp: Use IRQF_NO_AUTOEN flag in request_irq()
    9c763f95f3be netfs: Cancel dirty folios that have no storage destination
    71267bd4e8c7 wifi: mwifiex: Fix memcpy() field-spanning write warning in mwifiex_cmd_802_11_scan_ext()
    3f1e70b5de01 wifi: mt76: mt7915: hold dev->mt76.mutex while disabling tx worker
    a6d1b64eedbf wifi: mt76: mt7915: add dummy HW offload of IEEE 802.11 fragmentation
    816ddacaac89 crypto: hisilicon - fix missed error branch
    d694ad8b7e50 net: napi: Prevent overflow of napi_defer_hard_irqs
    734916809472 x86/bugs: Fix handling when SRSO mitigation is disabled
    939fea13eddd x86/bugs: Add missing NO_SSB flag
    83c84cdb7557 wifi: rtw89: avoid reading out of bounds when loading TX power FW elements
    ef7ba79690cb net: phy: Check for read errors in SIOCGMIIREG
    0f538d452bbd arm64: trans_pgd: mark PTEs entries as valid to avoid dead kexec()
    0842ddd83939 block: fix integer overflow in BLKSECDISCARD
    f499fd39d41f netdev-genl: Set extack and fix error on napi-get
    27129511a0ee can: netlink: avoid call to do_set_data_bittiming callback with stale can_priv::ctrlmode
    95425df8814f drivers/perf: arm_spe: Use perf_allow_kernel() for permissions
    eb2589d294bb proc: add config & param to block forcing mem writes
    8a0ec84cf0da ACPICA: iasl: handle empty connection_node
    77c2be40bd20 wifi: mac80211: fix RCU list iterations
    cdbf51bfa4b0 wifi: iwlwifi: mvm: avoid NULL pointer dereference
    3807905165af wifi: iwlwifi: allow only CN mcc from WRDD
    14e56ad52d3d wifi: iwlwifi: mvm: use correct key iteration
    0c3445db49d4 tcp: avoid reusing FIN_WAIT2 when trying to find port in connect() process
    b491b54e7abc netpoll: Ensure clean state on setup failures
    0f5b3a38318a crypto: simd - Do not call crypto_alloc_tfm during registration
    7ab21518d1d2 net: atlantic: Avoid warning about potential string truncation
    4f625762f950 nvme-tcp: check for invalidated or revoked key
    b79fb663472c nvme-tcp: sanitize TLS key handling
    f05149cf9a68 nvme-keyring: restrict match length for version '1' identifiers
    b25ec1deb3bc ipv4: Mask upper DSCP bits and ECN bits in NETLINK_FIB_LOOKUP family
    8b46d65d122b wifi: rtw89: correct base HT rate mask for firmware
    b7ace411161f ipv4: Check !in_dev earlier for ioctl(SIOCSIFADDR).
    8d8c2fae5b8c bnxt_en: Extend maximum length of version string by 1 byte
    7260a3c9d311 net: mvpp2: Increase size of queue_name buffer
    2ed7f42dfd3e tipc: guard against string buffer overrun
    a907c113a8b6 ACPICA: check null return of ACPI_ALLOCATE_ZEROED() in acpi_db_convert_to_package()
    34ca57debd0b ACPI: EC: Do not release locks during operation region accesses
    8f496c99120b wifi: rtw88: select WANT_DEV_COREDUMP
    6045ef5b4b00 wifi: ath11k: fix array out-of-bound access in SoC stats
    a4aef827a41c wifi: ath12k: fix array out-of-bound access in SoC stats
    1b120f151871 blk_iocost: fix more out of bound shifts
    b646c4f68a88 ACPI: CPPC: Add support for setting EPP register in FFH
    99f8ee16963f ACPI: video: Add force_vendor quirk for Panasonic Toughbook CF-18
    931691df59bc Bluetooth: btrtl: Set msft ext address filter quirk for RTL8852B
    1a3b9cd3d9fb Bluetooth: btusb: Add Realtek RTL8852C support ID 0x0489:0xe122
    7aab724c602b net: sched: consistently use rcu_replace_pointer() in taprio_change()
    846d5bb4c1e7 wifi: mt76: mt7915: disable tx worker during tx BA session enable/disable
    8323c7766ed2 ACPI: resource: Skip IRQ override on Asus Vivobook Go E1404GAB
    cbcd3e17205a e1000e: avoid failing the system during pm_suspend
    f92b8829c6e7 fs/inode: Prevent dump_mapping() accessing invalid dentry.d_name.name
    ce1c6c03d3bd ACPICA: Fix memory leak if acpi_ps_get_next_field() fails
    964fe89018cf ACPICA: Fix memory leak if acpi_ps_get_next_namepath() fails
    03593dbb0b27 ACPI: PAD: fix crash in exit_round_robin()
    ed706f4b08bb net: hisilicon: hns_mdio: fix OF node leak in probe()
    6d35f9e07bd3 net: hisilicon: hns_dsaf_mac: fix OF node leak in hns_mac_get_info()
    c5688b8d842d net: hisilicon: hip04: fix OF node leak in probe()
    d408889d4b54 net/xen-netback: prevent UAF in xenvif_flush_hash()
    f4dbfda159e4 wifi: cfg80211: Set correct chandef when starting CAC
    09b4cc2990e3 wifi: iwlwifi: mvm: drop wrong STA selection in TX
    c60af8853803 wifi: iwlwifi: mvm: Fix a race in scan abort flow
    fac02a03836d ice: Adjust over allocation of memory in ice_sched_add_root_node() and ice_sched_add_node()
    c84a9a85105d crypto: octeontx2 - Fix authenc setkey
    9e81df799b91 crypto: octeontx - Fix authenc setkey
    da858c06f22f crypto: x86/sha256 - Add parentheses around macros' single arguments
    2c230210ec0a wifi: ath9k_htc: Use __skb_set_length() for resetting urb before resubmit
    37c319503023 wifi: rtw89: avoid to add interface to list twice when SER
    84552e94250d wifi: ath9k: fix possible integer overflow in ath9k_get_et_stats()
    265ccf1ccb48 ALSA: hda/conexant: Fix conflicting quirk for System76 Pangolin
    caecdc0d894a ALSA: gus: Fix some error handling paths related to get_bpos() usage
    2cc5210d8622 tools/rtla: Fix installation from out-of-tree build
    7609b0257cdd cifs: Do not convert delimiter when parsing NFS-style symlinks
    803b3a39cb09 cifs: Fix buffer overflow when parsing NFS reparse points
    16e0267db156 drm/xe: Prevent null pointer access in xe_migrate_copy
    99415b2bf783 drm/xe: Resume TDR after GT reset
    b824de245407 drm/xe: Restore pci state upon resume
    00bba0b9abc1 ASoC: imx-card: Set card.owner to avoid a warning calltrace if SND=m
    0b745827fe26 ALSA: hda/generic: Unconditionally prefer preferred_dacs pairs
    514fb348ad70 drm/panthor: Lock the VM resv before calling drm_gpuvm_bo_obtain_prealloc()
    4934df9e0add cifs: Remove intermediate object of failed create reparse call
    25897ba7875b ALSA: hda/realtek: Fix the push button function for the ALC257
    b042dfe697fa ALSA: mixer_oss: Remove some incorrect kfree_const() usages
    0b7eab6a5812 io_uring: fix memory leak when cache init fail
    ea65be140e27 ASoC: atmel: mchp-pdmc: Skip ALSA restoration if substream runtime is uninitialized
    8a585d553c11 drm/panthor: Fix race when converting group handle to group object
    9ffcca5d7cb8 loop: don't set QUEUE_FLAG_NOMERGES
    8812b6f98fbe i2c: xiic: Try re-initialization on bus busy timeout
    5dfeb9d2f58d i2c: xiic: improve error message when transfer fails to start
    e381b9dadd42 selftest mm/mseal: fix test_seal_mremap_move_dontunmap_anyaddr
    f032e1dac30b sctp: set sk_state back to CLOSED if autobind fails in sctp_listen_start
    fcb864586da6 dt-bindings: net: xlnx,axi-ethernet: Add missing reg minItems
    d973f1ec47f1 iomap: constrain the file range passed to iomap_file_unshare
    f6ca58696749 net/ncsi: Disable the ncsi work before freeing the associated structure
    3d7c7513605c bridge: mcast: Fail MDB get request on empty entry
    efe9cc0f7c02 ppp: do not assume bh is held in ppp_channel_bridge_input()
    4cc0648e9e32 net: test for not too small csum_start in virtio_net_hdr_to_skb()
    4e280a8e1de5 ipv4: ip_gre: Fix drops of small packets in ipgre_xmit
    ae5b144c79d7 net: stmmac: dwmac4: extend timeout for VLAN Tag register busy bit check
    ff1c3cadcf40 net: add more sanity checks to qdisc_pkt_len_init()
    f959cce8a2a0 net: avoid potential underflow in qdisc_pkt_len_init() with UFO
    5b88ee8318f1 net: fec: Reload PTP registers after link-state change
    cf53d7e76f1f net: fec: Restart PPS after link state change
    1097bf16501e net: ethernet: lantiq_etop: fix memory disclosure
    d2ba6bed913b net: Fix gso_features_check to check for both dev->gso_{ipv4_,}max_size
    eb9a7d90f2fd net: Add netif_get_gro_max_size helper for GRO
    ab5d3420a112 net: dsa: improve shutdown sequence
    3d51ab44123f afs: Fix the setting of the server responding flag
    7c53ed6e9d05 afs: Fix missing wire-up of afs_retry_request()
    5afd21347aac Bluetooth: btmrvl: Use IRQF_NO_AUTOEN flag in request_irq()
    78d30ce16fdf Bluetooth: L2CAP: Fix uaf in l2cap_connect
    0cc47233af35 Bluetooth: MGMT: Fix possible crash on mgmt_index_removed
    2bd86f6aed45 selftests: netfilter: Add missing return value
    f839c5cd3482 netfilter: nf_tables: prevent nf_skb_duplicated corruption
    c93cb0ccdc13 selftests: netfilter: Fix nft_audit.sh for newer nft binaries
    34d7525646da net: wwan: qcom_bam_dmux: Fix missing pm_runtime_disable()
    1e353947c853 net: ieee802154: mcr20a: Use IRQF_NO_AUTOEN flag in request_irq()
    740e8370b864 netfilter: uapi: NFTA_FLOWTABLE_HOOK is NLA_NESTED
    0b1672834634 net/mlx5e: Fix crash caused by calling __xfrm_state_delete() twice
    1bcc86cc721b net/mlx5e: Fix NULL deref in mlx5e_tir_builder_alloc()
    8e1ee00910b5 net/mlx5: Added cond_resched() to crdump collection
    ecf310aaf256 net/mlx5: Fix error path in multi-packet WQE transmit
    b28bb7df6225 net: sparx5: Fix invalid timestamps
    785130296de2 ieee802154: Fix build error
    50c0ad1f8d41 drm/i915/dp: Fix colorimetry detection
    9d4f619153ba ceph: remove the incorrect Fw reference check when dirtying pages
    63104c3f527f ceph: fix a memory leak on cap_auths in MDS client
    e65a9af05a0b mailbox: bcm2835: Fix timeout during suspend mode
    227dddb56985 mailbox: rockchip: fix a typo in module autoloading
    64dad5a0597c mailbox: ARM_MHU_V3 should depend on ARM64
    007a7da5b802 drm/amd/display: handle nulled pipe context in DCE110's set_drr()
    8dc05d3f371e drm/amdgpu: Fix get each xcp macro
    3f55757ce2ff drm/i915/dp: Fix AUX IO power enabling for eDP PSR
    40d7d234f642 scsi: pm8001: Do not overwrite PCI queue mapping
    d175d98dfb3e scsi: st: Fix input/output error on empty drive reset
    fa7bc8d95944 jump_label: Fix static_key_slow_dec() yet again
    a248a028bff0 jump_label: Simplify and clarify static_key_fast_inc_cpus_locked()
    85a104aaef1f static_call: Replace pointless WARN_ON() in static_call_module_notify()
    2b494471797b static_call: Handle module init failure correctly in static_call_del_module()
    c4386c5293aa drivers: gpu: drm: msm: registers: improve reproducibility
    915a386c7cff qemux86: add configuration symbol to select values
    62df91b21626 sched/isolation: really align nohz_full with rcu_nocbs
    afe643f5802b clear_warn_once: add a clear_warn_once= boot parameter
    7b016793edbf clear_warn_once: bind a timer to written reset value
    89a5c70f2000 clear_warn_once: expand debugfs to include read support
    8014704c527d tools: Remove some options from CLANG_CROSS_FLAGS
    e9ca44556936 libbpf: Fix build warning on ref_ctr_off
    32fe8c972c36 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    a372ac2b798d perf: x86-32: explicitly include <errno.h>
    a5cb41682777 perf: mips64: Convert __u64 to unsigned long long
    ed8ee9f3d1ae perf: fix bench numa compilation
    6dbb2915e8a7 perf: add SLANG_INC for slang.h
    57f78dddfd93 perf: add sgidefs.h to for mips builds
    130f0306cfba perf: change --root to --prefix for python install
    2520efe95341 perf: add 'libperl not found' warning
    45731b6ae676 perf: force include of <stdbool.h>
    ace10f8dec53 fat: Replace prandom_u32() with get_random_u32()
    64797bdca14e fat: don't use obsolete random32 call in namei_vfat
    2442bae1a645 FAT: Added FAT_NO_83NAME
    7561126bce00 FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    5c51ab959876 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5869720658c9 aufs6: match exports to functions
    e125467cf228 aufs: adjust for v6.9+
    eebcdc6635bf aufs6: correct do_splice_from prototype
    4c5829036c45 aufs: update remove_page to remove_folio
    e8d889d0f434 aufs: i_op: Add handling for au_pin_hdir_set_owner with RT kernel
    3ecd9203de17 aufs: fix v6.7 kernel build compilation
    5e8ee028dbe2 aufs6: adapt to v6.6 i_op->ctime changes
    1132c330feed aufs6: adapt to v6.6
    d3e4ede69603 aufs6: core
    49ec9271f41d aufs6: standalone
    dcc0978da2dd aufs6: mmap
    80e1609b37e7 aufs6: base
    0dbb3f062420 aufs6: kbuild
    ad51078c5ebf yaffs: fix mtime/itime field access
    e5f1d35d6188 yaffs2: update VFS ctime operations to 6.6+
    dd374461adc7 yaffs2: v6.5 fixups
    f5908785d88d yaffs2: Fix miscalculation of devname buffer length
    d1403f0acfdf yaffs2: convert user_namespace to mnt_idmap
    7dae5463b54f yaffs2: replace bdevname call with sprintf
    92d30df4eb56 yaffs2: convert read_page -> readfolio
    6c895bffdf72 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    6801e7d90255 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    aff012190046 yaffs2: v5.12+ build fixups (not runtime tested)
    fb474842c16e yaffs: include blkdev.h
    fe7d745aac94 yaffs: fix misplaced variable declaration
    bee147b2e533 yaffs2: v5.6 build fixups
    22998f589ec2 yaffs2: fix memory leak when /proc/yaffs is read
    ce7d8084a976 yaffs: add strict check when call yaffs_internal_read_super
    adb7202fda95 yaffs: repair yaffs_get_mtd_device
    2852e5c15d4d yaffs: Fix build failure by handling inode i_version with proper atomic API
    1526802a8147 yaffs2: fix memory leak in mount/umount
    6c7827a16aaa yaffs: Avoid setting any ACL releated xattr
    fa3482815542 Yaffs:check oob size before auto selecting Yaffs1
    aaa4843b73ce fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    48e992af6531 yaffs2: adjust to proper location of MS_RDONLY
    f3af7160d8a0 yaffs2: import git revision b4ce1bb (jan, 2020)
    4add698ed6e8 initramfs: allow an optional wrapper script around initramfs generation
    b619a8d54336 vt/conmakehash: improve reproducibility
    c786186aeef3 tools: use basename to identify file in gen-mach-types
    aa3a8e7ceb6e iwlwifi: select MAC80211_LEDS conditionally
    325db54c4be9 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    23a87c6e13aa defconfigs: drop obselete options
    946e5b78ab94 linux-yocto: Handle /bin/awk issues
    9daee1dba585 uvesafb: provide option to specify timeout for task completion
    f68b8683441a uvesafb: print error message when task timeout occurs
    a1595c6b6017 compiler.h: Undef before redefining __attribute_const__
    8086839613c6 vmware: include jiffies.h
    32e79eb3c169 Resolve jiffies wrapping about arp
    f6fabf91b6f2 nfs: Allow default io size to be configured.
    ad2b29f801e9 check console device file on fs when booting
    5194785d545b mount_root: clarify error messages for when no rootfs found
    78b3498cb59a mconf: fix output of cflags and libraries
    9cc6870708d5 menuconfig,mconf-cfg: Allow specification of ncurses location
    f34088ed9c93 modpost: mask trivial warnings
    4784584582f5 kbuild: exclude meta directory from distclean processing
    73072b5fe25a powerpc: serialize image targets
    a120eb200320 arm: serialize build targets
    51d5719ac05b mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    5155f0bb36f0 cpu/amd: inhibit SMP check for qemux86
    e5a5996ee586 x86_64_defconfig: Fix warnings
    1359db75df0c mips: make current_cpu_data preempt safe
    385edf6090c3 mips: vdso: fix 'jalr $t9' crash in vdso code
    968266397319 mips: Kconfig: add QEMUMIPS64 option
    389ce854fde3 4kc cache tlb hazard: tlbp cache coherency
    9cab61199fa8 malta uhci quirks: make allowance for slow 4k(e)c
    80cae3bd9eea arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    41c82709900f drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    59ef4f151a5e arm64: defconfig: cleanup config options
    c5fb425762ed vexpress: Pass LOADADDR to Makefile
    07a8b544d4e9 arm: ARM EABI socketcall
    574f3ae3d2ca ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.10.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.10.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.10.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index 3a26cff924..a1096f6a04 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "fd5cf8bfe549fa46fdcece138885a52ab4d9d729"
-SRCREV_meta ?= "699cd9b4a63953c9334f635d7c19add5d0957b93"
+SRCREV_machine ?= "3e91e02b6041d6720a5cf2f64323bb9b73f20765"
+SRCREV_meta ?= "83eed9befe28696b06fc5cc7bb31d81b27a7f325"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.10.13"
+LINUX_VERSION ?= "6.10.14"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
index c493d1d914..50a461149d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.10.inc
 
-LINUX_VERSION ?= "6.10.13"
+LINUX_VERSION ?= "6.10.14"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "ef209b71b02e80280883cd74bcdecec0a52de608"
-SRCREV_meta ?= "699cd9b4a63953c9334f635d7c19add5d0957b93"
+SRCREV_machine ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
+SRCREV_meta ?= "83eed9befe28696b06fc5cc7bb31d81b27a7f325"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index 5c8a51ca5c..81898a4328 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.10/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.10/standard/base"
 KBRANCH:qemumips64 ?= "v6.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "2b4b41e2f9c5569729e1686449c68fa12eb4d270"
-SRCREV_machine:qemuarm64 ?= "ef209b71b02e80280883cd74bcdecec0a52de608"
-SRCREV_machine:qemuloongarch64 ?= "ef209b71b02e80280883cd74bcdecec0a52de608"
-SRCREV_machine:qemumips ?= "a659b440ff6f9325136c3ebce78f2507ace768b0"
-SRCREV_machine:qemuppc ?= "ef209b71b02e80280883cd74bcdecec0a52de608"
-SRCREV_machine:qemuriscv64 ?= "ef209b71b02e80280883cd74bcdecec0a52de608"
-SRCREV_machine:qemuriscv32 ?= "ef209b71b02e80280883cd74bcdecec0a52de608"
-SRCREV_machine:qemux86 ?= "ef209b71b02e80280883cd74bcdecec0a52de608"
-SRCREV_machine:qemux86-64 ?= "ef209b71b02e80280883cd74bcdecec0a52de608"
-SRCREV_machine:qemumips64 ?= "dbf6eab8fb21784a4e8010a5b7045681e2bb06de"
-SRCREV_machine ?= "ef209b71b02e80280883cd74bcdecec0a52de608"
-SRCREV_meta ?= "699cd9b4a63953c9334f635d7c19add5d0957b93"
+SRCREV_machine:qemuarm ?= "e118779b7d6c0be1ebdf9a1f7c4401a7a2daffe1"
+SRCREV_machine:qemuarm64 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
+SRCREV_machine:qemuloongarch64 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
+SRCREV_machine:qemumips ?= "59775dda87d79c59035b222fd453ff38a2950653"
+SRCREV_machine:qemuppc ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
+SRCREV_machine:qemuriscv64 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
+SRCREV_machine:qemuriscv32 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
+SRCREV_machine:qemux86 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
+SRCREV_machine:qemux86-64 ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
+SRCREV_machine:qemumips64 ?= "61cac1396fe9250a4b7a5cc6ae3deb9dda4290c3"
+SRCREV_machine ?= "bbe3d1be4e9c03765cb4f93155eabfc0724d3bee"
+SRCREV_meta ?= "83eed9befe28696b06fc5cc7bb31d81b27a7f325"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "0202c63cba31e9b3d59b8204db3cda3cdd209f15"
+SRCREV_machine:class-devupstream ?= "47c2f92131c47a37ea0e3d8e1a4e4c82a9b473d4"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.10/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.10.13"
+LINUX_VERSION ?= "6.10.14"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


