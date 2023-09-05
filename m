Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B2CCCA0FF8
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 14:37:23 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web11.23200.1693924640931486879
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Sep 2023 07:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=OfBih9JL;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-76da22c090dso155319785a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 07:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693924640; x=1694529440; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3k5sXhX6qPLcW8XKjNFb6zeY6aFxiqK+EDoqNxTH08=;
        b=OfBih9JLREC2EF8sWAhLv/5tra1CbnkQpNiWYHhUdzGu1VoSDfDontNxQ0u6RnX0Z+
         G06SsfX6KpEyOQOlRM5TWjNaeln/ldtcHMoMDNUiqFStwZBplr1xtJbzl5PadSf9aons
         VfBnO2h66LfUicExxsn814QVDsaBQlEsDcv7pNaG9OkbNGQaoYzZiNndwuXEVnBr19Aq
         ynRsfCP7yVF1BpJ6/bS5XvasJIlu3I9tGRiepy0V5OTNWiPtOvdF40N05pmDzSRiHlfA
         46PhTDlc9B6dmMNFUcGqDify+WbpetqstXIhCv7noZUh/WxulWl/nfRx+Tgu/h0fONbp
         aBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693924640; x=1694529440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3k5sXhX6qPLcW8XKjNFb6zeY6aFxiqK+EDoqNxTH08=;
        b=A540K9msvE8Ip6w231AqFQfoP5AqfDiAHsTndeMkpUMMWjeC1yW8MzHIIRbSWVRc+f
         +G50ofBgeo0bq+d0Jzp6OMpvhmMqGJj/OIQ/+mc1gjqlofa0UwjgMxWaVFnYfrDJ4W/W
         8h5t7QKn2aMMSrCvqX4x9OwTcVFO0IGRQE7DrbkWTnPtUd9QwoIpYCPIAgT/qfPTmtoF
         7MYYJaQ/SsSmYAt64fde/5KL14bujGYw3GEAThCtAfH5Z4SGHrhUvoslNschetjX3Rc+
         KLJGQJi+auH17LTUe92JcPM6LAMsl23fL/imzJ430w6hHVh8yiEjvi3SIbh2OwTuL/FN
         jXYQ==
X-Gm-Message-State: AOJu0YzgGdNNUdbapw+kymVO5XYsNKwnnQuNoVQB5ea7WQMhVR0H/40K
	KTSe+Lu/9xHh7HJiLV+h62DoQhkSUPvauA==
X-Google-Smtp-Source: AGHT+IG1V61i9cHk/yP8eWXZNLzvXDpsVjqpjaGE3aBBDdgAiIsTtW4JEQ4rO47z0fliNElKbCJbnA==
X-Received: by 2002:a05:620a:667:b0:76d:acd1:447b with SMTP id a7-20020a05620a066700b0076dacd1447bmr11335318qkh.41.1693924639760;
        Tue, 05 Sep 2023 07:37:19 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id f9-20020a05620a15a900b0076ee82f7726sm4066227qkk.132.2023.09.05.07.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 07:37:19 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-yocto/6.4: update to v6.4.12
Date: Tue,  5 Sep 2023 10:37:09 -0400
Message-Id: <a7d68fd98ce0b0593eb5e94659f870bc72afe71d.1693924532.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693924532.git.bruce.ashfield@gmail.com>
References: <cover.1693924532.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 14:37:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187219

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    05d8970cca01 Linux 6.4.12
    b237550e1f1b net: fix the RTO timer retransmitting skb every 1ms if linear option is enabled
    4a3fcfc3b517 af_unix: Fix null-ptr-deref in unix_stream_sendpage().
    cdd01bada273 ASoC: SOF: intel: hda: Clean up link DMA for IPC3 during stop
    c1fc26cc6637 Revert "perf report: Append inlines to non-DWARF callchains"
    5b6284759656 drm/amdgpu: keep irq count in amdgpu_irq_disable_all
    6ccbdc0a018e drm/amd/pm: skip the RLC stop when S0i3 suspend for SMU v13.0.4/11
    04ee31fb4861 drm/amd/display: disable RCO for DCN314
    0469cd57d5da ASoC: amd: vangogh: select CONFIG_SND_AMD_ACP_CONFIG
    0fbdf79d003c drm/amdgpu/pm: fix throttle_status for other than MP1 11.0.7
    11c187026cce drm/amdgpu: skip fence GFX interrupts disable/enable for S0ix
    333f1edde0ad drm/amd: flush any delayed gfxoff on suspend entry
    fcb4a0bd819b drm/i915/sdvo: fix panel_type initialization
    19a213d106a1 Revert "Revert "drm/amdgpu/display: change pipe policy for DCN 2.0""
    d3ffc25912d6 Revert "drm/edid: Fix csync detailed mode parsing"
    a79aebe5bb68 drm/qxl: fix UAF on handle creation
    5c10ce0d815f mmc: sunplus: Fix error handling in spmmc_drv_probe()
    741a951f4192 mmc: sunplus: fix return value check of mmc_add_host()
    43a181a53c1a mmc: block: Fix in_flight[issue_type] value error
    62507bca734f mmc: wbsd: fix double mmc_free_host() in wbsd_init()
    cc3fa629bf13 mmc: f-sdh30: fix order of function calls in sdhci_f_sdh30_remove
    c65a1be58f09 dt-bindings: pinctrl: qcom,sa8775p-tlmm: add gpio function constant
    ceecb1bcaf7a media: uvcvideo: Fix menu count handling for userspace XU mappings
    531c6ed342d9 blk-crypto: dynamically allocate fallback profile
    8a33c9e15b7d arm64/ptrace: Ensure that the task sees ZT writes on first use
    e01af8e26c23 arm64/ptrace: Ensure that SME is set up for target when writing SSVE state
    44463c32622f arm64: dts: rockchip: Fix Wifi/Bluetooth on ROCK Pi 4 boards
    901ace2effdf virtio-net: Zero max_tx_vq field for VIRTIO_NET_CTRL_MQ_HASH_CONFIG case
    aa402a3b553b regulator: da9063: better fix null deref with partial DT
    abcd2a0b4f58 smb: client: fix null auth
    b8e7ee1d9c6b parisc: Fix CONFIG_TLB_PTLOCK to work with lightweight spinlock checks
    7a9fb689c1a1 cifs: Release folio lock on fscache read hit.
    8bd9786a1b57 ALSA: usb-audio: Add support for Mythware XA001AU capture and playback interfaces.
    375806616f8c serial: 8250: Fix oops for port->pm on uart_change_pm()
    258b867f40f0 riscv: uaccess: Return the number of bytes effectively not copied
    3f0605239fa2 riscv: correct riscv_insn_is_c_jr() and riscv_insn_is_c_jalr()
    761cf8f7a922 riscv: entry: set a0 = -ENOSYS only when syscall != -1
    4039f5e9e9d9 ALSA: hda/realtek - Remodified 3k pull low procedure
    d9a5ad4477d2 soc: aspeed: socinfo: Add kfree for kstrdup
    776133d21391 soc: aspeed: uart-routing: Use __sysfs_match_string
    7c315e716ba3 pinctrl: qcom: Add intr_target_width field to support increased number of interrupt targets
    44f3d2d2ae44 ALSA: hda/realtek: Add quirks for HP G11 Laptops
    cf2983df94de ASoC: meson: axg-tdm-formatter: fix channel slot allocation
    5de8e85b6734 ASoC: rt5665: add missed regulator_bulk_disable
    f163dc22e339 arm64: dts: imx93: Fix anatop node size
    5fb0d35fac3f ASoC: max98363: don't return on success reading revision ID
    66f202b1dcb6 ARM: dts: imx: Set default tuning step for imx6sx usdhc
    fe4d623f2e1b arm64: dts: imx8mm: Drop CSI1 PHY reference clock configuration
    a1aab731f0c8 ARM: dts: imx: Set default tuning step for imx7d usdhc
    969d3e64ebe7 ARM: dts: imx: Adjust dma-apbh node name
    506f787bd717 ARM: dts: imx6: phytec: fix RTC interrupt level
    0e67e84a2847 arm64: dts: rockchip: Disable HS400 for eMMC on ROCK 4C+
    749e4dbb3c96 arm64: dts: rockchip: Disable HS400 for eMMC on ROCK Pi 4
    59de878d1185 arm64: dts: qcom: qrb5165-rb5: fix thermal zone conflict
    28b634c9b328 bus: ti-sysc: Flush posted write on enable before reset
    24f0d69da35d ice: Block switchdev mode when ADQ is active and vice versa
    7d25579fb978 qede: fix firmware halt over suspend and resume
    e3636862f559 net: do not allow gso_size to be set to GSO_BY_FRAGS
    07ec025d7125 sock: Fix misuse of sk_under_memory_pressure()
    7575a3f1443c sfc: don't fail probe if MAE/TC setup fails
    80b707ac5d03 sfc: don't unregister flow_indr if it was never registered
    612b57e85162 sfc: add fallback action-set-lists for TC offload
    ff4ad046da4e net: dsa: mv88e6xxx: Wait for EEPROM done before HW reset
    872feeecd08c drm/nouveau/disp: fix use-after-free in error handling of nouveau_connector_create
    9a5d622b54dc net/mlx5e: XDP, Fix fifo overrun on XDP_REDIRECT
    8896f8498538 i40e: fix misleading debug logs
    62b46d6010f3 iavf: fix FDIR rule fields masks validation
    881faff9e548 net: openvswitch: reject negative ifindex
    1ac37294f952 team: Fix incorrect deletion of ETH_P_8021AD protocol vid from slaves
    6095d0c396a9 net: phy: broadcom: stub c45 read/write for 54810
    8e249f8ffe16 netfilter: nft_dynset: disallow object maps
    c26cc57f41c6 netfilter: nf_tables: GC transaction race with netns dismantle
    3bdf400a1ad1 netfilter: nf_tables: fix GC transaction races with netns and netlink event exit path
    6650bebaa564 ipvs: fix racy memcpy in proc_do_sync_threshold
    c050b4c998f1 netfilter: set default timeout to 3 secs for sctp shutdown send and recv state
    156369a702c3 netfilter: nf_tables: don't fail inserts if duplicate has expired
    83ff16e449a6 netfilter: nf_tables: deactivate catchall elements in next generation
    a8f303445a5e netfilter: nf_tables: fix false-positive lockdep splat
    d410a96e5cb8 accel/qaic: Clean up integer overflow checking in map_user_pages()
    df45c3e46cdb accel/qaic: Fix slicing memory leak
    a0d348c61d08 net: veth: Page pool creation error handling for existing pools only
    62312e2f6466 octeon_ep: cancel queued works in probe error path
    067a5ec70ee1 octeon_ep: cancel ctrl_mbox_task after intr_poll_task
    1c5cc171ab10 octeon_ep: cancel tx_timeout_task later in remove sequence
    7757c240bf0e octeon_ep: fix timeout value for waiting on mbox response
    e6cf72c0330c net: macb: In ZynqMP resume always configure PS GTR for non-wakeup source
    8890f5b665a0 drm/i915/guc/slpc: Restore efficient freq earlier
    37e8031e134d drm/panel: simple: Fix AUO G121EAN01 panel timings according to the docs
    e75311fa503d selftests: mirror_gre_changes: Tighten up the TTL test match
    59f3d9198db7 net: phy: fix IRQ-based wake-on-lan over hibernate / power off
    2361c766093b net: pcs: Add missing put_device call in miic_create
    3c8608fb8d87 virtio-net: set queues after driver_ok
    c8ce01aad133 xfrm: don't skip free of empty state in acquire policy
    757eaa5d7625 xfrm: delete offloaded policy
    a9020514f175 xfrm: add forgotten nla_policy for XFRMA_MTIMER_THRESH
    53df4be4f522 xfrm: add NULL check in xfrm_update_ae_params
    78e397a43e1c ip_vti: fix potential slab-use-after-free in decode_session6
    c070688bfbe7 ip6_vti: fix slab-use-after-free in decode_session6
    86f15300a226 xfrm: fix slab-use-after-free in decode_session6
    21a3a70cf3ea xfrm: Silence warnings triggerable by bad packets
    6d1e6152778c net: xfrm: Amend XFRMA_SEC_CTX nla_policy structure
    66e1cd1b06c0 net: af_key: fix sadb_x_filter validation
    5713c7ca31f5 net: xfrm: Fix xfrm_address_filter OOB read
    e854497f5acf x86/srso: Correct the mitigation status when SMT is disabled
    dc4d07ddc4ff x86/retpoline,kprobes: Skip optprobe check for indirect jumps with retpolines and IBT
    aadb82bb7c65 x86/retpoline,kprobes: Fix position of thunk sections with CONFIG_LTO_CLANG
    51fc0a886211 x86/srso: Disable the mitigation on unaffected configurations
    1251b96d79fc x86/CPU/AMD: Fix the DIV(0) initial fix attempt
    48a558fbe848 x86/retpoline: Don't clobber RFLAGS during srso_safe_ret()
    92588f22a2a6 x86/static_call: Fix __static_call_fixup()
    37e6d8509c19 objtool/x86: Fixup frame-pointer vs rethunk
    c70e2efa972b x86/srso: Explain the untraining sequences a bit more
    04103096c1c3 x86/cpu/kvm: Provide UNTRAIN_RET_VM
    9588fd887886 x86/cpu: Cleanup the untrain mess
    ee621dddfe0f x86/cpu: Rename srso_(.*)_alias to srso_alias_\1
    5c510151d769 x86/cpu: Rename original retbleed methods
    4f0d18c28fcb x86/cpu: Clean up SRSO return thunk mess
    06bcb3dadce7 x86/alternative: Make custom return thunk unconditional
    2d4d8761e314 objtool/x86: Fix SRSO mess
    1e7b3334d180 x86/cpu: Fix up srso_safe_ret() and __x86_return_thunk()
    7047af224197 x86/cpu: Fix __x86_return_thunk symbol type
    385f438b5807 i2c: designware: Handle invalid SMBus block data response length value
    b2ef640ff40d i2c: designware: Correct length byte validation logic
    c4b460b5fa92 btrfs: only subtract from len_to_oe_boundary when it is tracking an extent
    8add2a9644e4 btrfs: fix replace/scrub failure with metadata_uuid
    ae81329f7de3 btrfs: fix BUG_ON condition in btrfs_cancel_balance
    b43a4c99d878 btrfs: fix incorrect splitting in btrfs_drop_extent_map_range
    5441532ffc9c btrfs: fix infinite directory reads
    c5be9bc0dff6 tty: serial: fsl_lpuart: Clear the error flags by writing 1 for lpuart32 platforms
    f40e70d7f40b tty: n_gsm: fix the UAF caused by race condition in gsm_cleanup_mux
    1c37d5101e40 smb3: display network namespace in debug information
    98085d20c49c vdpa: Enable strict validation for netlinks ops
    ea65e8b5e6b1 vdpa: Add max vqp attr to vdpa_nl_policy for nlattr length check
    ccb533b7070a vdpa: Add queue index attr to vdpa_nl_policy for nlattr length check
    645d17e06c50 vdpa: Add features attr to vdpa_nl_policy for nlattr length check
    6acb8a453388 powerpc/rtas_flash: allow user copy to flash block cache objects
    1ced17e05dc6 media: mtk-jpeg: Set platform driver data earlier
    92010480edc9 fbdev: mmp: fix value check in mmphw_probe()
    cd4ffdf56791 blk-cgroup: hold queue_lock when removing blkg->q_node
    3c38774dbaaa i2c: tegra: Fix i2c-tegra DMA config option processing
    4c07b591014e i2c: hisi: Only handle the interrupt of the driver's transfer
    64d83e2c2fcb i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
    4f210ab49736 rust: macros: vtable: fix `HAS_*` redefinition (`gen_const_name`)
    6b67a6d2e506 cifs: fix potential oops in cifs_oplock_break
    8671f8bdc7c0 vdpa/mlx5: Delete control vq iotlb in destroy_mr only when necessary
    bfb5564d969e vdpa/mlx5: Fix mr->initialized semantics
    fa450621efab virtio-vdpa: Fix cpumask memory leak in virtio_vdpa_find_vqs()
    a44a443dd12d vduse: Use proper spinlock for IRQ injection
    2dcb368fe5a8 virtio-mmio: don't break lifecycle of vm_dev
    049a8ae7f818 regulator: qcom-rpmh: Fix LDO 12 regulator for PM8550
    7569c4294ba6 btrfs: fix use-after-free of new block group that became unused
    5d19abcffd84 btrfs: move out now unused BG from the reclaim list
    02e52d7daaa3 ring-buffer: Do not swap cpu_buffer during resize process
    f2b06472be43 Bluetooth: MGMT: Use correct address for memcpy()
    3cecad9f4b81 powerpc/kasan: Disable KCOV in KASAN code
    3447bfd9d5d1 ALSA: hda/realtek: Add quirk for ASUS ROG GZ301V
    6e8d944d9e60 ALSA: hda/realtek: Add quirk for ASUS ROG G614Jx
    345fa36353da ALSA: hda/realtek: Amend G634 quirk to enable rear speakers
    cd7bee74ed63 ALSA: hda/realtek: Add quirk for ASUS ROG GA402X
    485cbcb5089d ALSA: hda/realtek: Add quirk for ASUS ROG GX650P
    b32e40379e5b ALSA: hda: fix a possible null-pointer dereference due to data race in snd_hdac_regmap_sync()
    472b6955ec2c ALSA: hda/realtek: Add quirks for Unis H3C Desktop B760 & Q760
    ec904a70e02a fs/ntfs3: Alternative boot if primary boot is corrupted
    209b0468acea fs/ntfs3: Mark ntfs dirty when on-disk struct is corrupted
    c5d39f001526 fs: ntfs3: Fix possible null-pointer dereferences in mi_read()
    1474098b590a fs/ntfs3: Return error for inconsistent extended attributes
    64fab8bce523 fs/ntfs3: Enhance sanity check while generating attr_list
    f5db29ce2502 drm/amdgpu: Fix potential fence use-after-free v2
    6eb77ac68f7a ceph: try to dump the msgs when decoding fails
    c68268e1ba8a Bluetooth: btusb: Add MT7922 bluetooth ID for the Asus Ally
    255be6815029 Bluetooth: L2CAP: Fix use-after-free
    552a15a0b4dd watchdog: sp5100_tco: support Hygon FCH/SCH (Server Controller Hub)
    9860921ab452 firewire: net: fix use after free in fwnet_finish_incoming_packet()
    3ab42eba15a1 thunderbolt: Limit Intel Barlow Ridge USB3 bandwidth
    9f1bd1392336 thunderbolt: Add Intel Barlow Ridge PCI ID
    fd53a1f28fab pcmcia: rsrc_nonstatic: Fix memory leak in nonstatic_release_resource_db()
    42077d4de49e gfs2: Fix possible data races in gfs2_show_options()
    d7b9e07ed765 usb: chipidea: imx: add missing USB PHY DPDM wakeup setting
    97ce5c4e7e5e usb: chipidea: imx: turn off vbus comparator when suspend
    15494054b51f usb: chipidea: imx: don't request QoS for imx8ulp
    000dd3a768e9 xhci: get rid of XHCI_PLAT quirk that used to prevent MSI setup
    84ee48939551 thunderbolt: Read retimer NVM authentication status prior tb_retimer_set_inbound_sbtx()
    4d299e6e0ac3 media: platform: mediatek: vpu: fix NULL ptr dereference
    61c7abd743b0 usb: gadget: uvc: queue empty isoc requests if no video buffer is available
    e20a23b34245 usb: gadget: u_serial: Avoid spinlock recursion in __gs_console_push
    0d353e6cd313 media: camss: set VFE bpl_alignment to 16 for sdm845 and sm8250
    e01ea1c4191e media: v4l2-mem2mem: add lock to protect parameter num_rdy
    09b490f3bb2a led: qcom-lpg: Fix resource leaks in for_each_available_child_of_node() loops
    9eb0bd1eeaac serial: stm32: Ignore return value of uart_remove_one_port() in .remove()
    759ffc164d95 cifs: fix session state check in reconnect to avoid use-after-free issue
    eb79f8dfba34 smb: client: fix warning in cifs_smb3_do_mount()
    c4f7f31b3a0e Revert "[PATCH] uml: export symbols added by GCC hardened"
    2356f03d50c1 HID: intel-ish-hid: ipc: Add Arrow Lake PCI device ID
    12f415a07490 ASoC: SOF: core: Free the firmware trace before calling snd_sof_shutdown()
    49698f5f3c3e drm/amd/display: Enable dcn314 DPP RCO
    49d5f97be648 drm/amd/display: Skip DPP DTO update if root clock is gated
    48c9a6f964a0 RDMA/bnxt_re: consider timeout of destroy ah as success.
    04704c201bb0 RDMA/mlx5: Return the firmware result upon destroying QP/RQ
    a3a96bf843c3 drm/amdgpu: unmap and remove csa_va properly
    8fd4d6d3619a drm/amd/display: Apply 60us prefetch for DCFCLK <= 300Mhz
    dcfd5a3ecf91 drm/amd/display: Remove v_startup workaround for dcn3+
    aa9e9ba5748c drm/amdgpu: install stub fence into potential unused fence pointers
    f03bcd68082f iommu/amd: Introduce Disable IRTE Caching Support
    45c5f38073ef HID: logitech-hidpp: Add USB and Bluetooth IDs for the Logitech G915 TKL Keyboard
    cfe5e5d87e93 HID: i2c-hid: goodix: Add support for "goodix,no-reset-during-suspend" property
    b5f4d1915090 dt-bindings: input: goodix: Add "goodix,no-reset-during-suspend" property
    973e0890e526 accel/habanalabs: fix mem leak in capture user mappings
    7f59afa93ffc accel/habanalabs: add pci health check during heartbeat
    4503b78fe6cd dma-remap: use kvmalloc_array/kvfree for larger dma memory remap
    aa09a767b3ae ASoC: SOF: Intel: fix SoundWire/HDaudio mutual exclusion
    848149e899c3 iopoll: Call cpu_relax() in busy loops
    b1079090c9c2 ASoC: Intel: sof_sdw: Add support for Rex soundwire
    09c98d0de748 ASoC: Intel: sof_sdw: add quick for Dell SKU 0BDA
    6fc290c768fc ASoC: Intel: sof_sdw_rt_sdca_jack_common: test SOF_JACK_JDSRC in _exit
    a2394961ca96 ARM: dts: imx6dl: prtrvt, prtvt7, prti6q, prtwd2: fix USB related warnings
    9376002694e3 RDMA/mana_ib: Use v2 version of cfg_rx_steer_req to enable RX coalescing
    1260703fbc87 ASoC: amd: vangogh: Add check for acp config flags in vangogh platform
    c212c2b01db2 drm: rcar-du: remove R-Car H3 ES1.* workarounds
    a6e0079b14f0 arm64: dts: qcom: ipq5332: add QFPROM node
    04fe3b825282 drm/stm: ltdc: fix late dereference check
    7235fb8db5e7 ASoC: SOF: amd: Add pci revision id check
    a740b0c82f16 ASoC: cs35l56: Move DSP part string generation so that it is done only once
    de8d025da18e PCI: tegra194: Fix possible array out of bounds access
    2bb7ffec12b6 ASoC: Intel: sof_sdw: add quirk for LNL RVP
    0755560e39ad ASoC: Intel: sof_sdw: add quirk for MTL RVP
    f15682b9d366 Revert "drm/amd/display: disable SubVP + DRR to prevent underflow"
    8d8c96efcec9 drm/amdgpu: fix memory leak in mes self test
    c3deb091398e drm/amdgpu: Fix integer overflow in amdgpu_cs_pass1
    756d674117f5 drm/amdgpu: fix calltrace warning in amddrm_buddy_fini
    4bea16716950 drm/scheduler: set entity to NULL in drm_sched_entity_pop_job()
    dd2e5d3f806b drm/amd/display: Update DTBCLK for DCN32
    86fd1f1ec4dd net: phy: at803x: fix the wol setting functions
    b129b7537a56 net: phy: at803x: Use devm_regulator_get_enable_optional()
    0ba71114c3af crypto, cifs: fix error handling in extract_iter_to_sg()

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.4.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.4.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.4.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
index 7dd3f36325..3a9d647e84 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.4.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7b9505550d7a84a1f30b9af8b90aafc8dde37023"
-SRCREV_meta ?= "97bba4db5ff86eae2ca28a8bf0cb8cbfa44cbbe4"
+SRCREV_machine ?= "d21f733f32e333301c41302269e97f8a2c23d35e"
+SRCREV_meta ?= "e470f033e5577e2e9bb256ce3b419541c4829364"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.4.11"
+LINUX_VERSION ?= "6.4.12"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
index baeca1a968..a54a698be9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.4.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.4.inc
 
-LINUX_VERSION ?= "6.4.11"
+LINUX_VERSION ?= "6.4.12"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9753b4497951a5bd1a921e784532257d26a8b008"
-SRCREV_meta ?= "97bba4db5ff86eae2ca28a8bf0cb8cbfa44cbbe4"
+SRCREV_machine ?= "8d7f22bfccbb65c1c13ec9e295b5af5a37755213"
+SRCREV_meta ?= "e470f033e5577e2e9bb256ce3b419541c4829364"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.4.bb b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
index 23af9167a5..84d66d8bc5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.4.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.4/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.4/standard/base"
 KBRANCH:qemumips64 ?= "v6.4/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "d4dbcad8e827ce8e71a29b69acc19f4d3f689119"
-SRCREV_machine:qemuarm64 ?= "9753b4497951a5bd1a921e784532257d26a8b008"
-SRCREV_machine:qemuloongarch64 ?= "9753b4497951a5bd1a921e784532257d26a8b008"
-SRCREV_machine:qemumips ?= "3bab6247ffb07f9de6bdb388854461d0ab7bc7dd"
-SRCREV_machine:qemuppc ?= "9753b4497951a5bd1a921e784532257d26a8b008"
-SRCREV_machine:qemuriscv64 ?= "9753b4497951a5bd1a921e784532257d26a8b008"
-SRCREV_machine:qemuriscv32 ?= "9753b4497951a5bd1a921e784532257d26a8b008"
-SRCREV_machine:qemux86 ?= "9753b4497951a5bd1a921e784532257d26a8b008"
-SRCREV_machine:qemux86-64 ?= "9753b4497951a5bd1a921e784532257d26a8b008"
-SRCREV_machine:qemumips64 ?= "de0569e0860973391d16074bbe9366afb15594bf"
-SRCREV_machine ?= "9753b4497951a5bd1a921e784532257d26a8b008"
-SRCREV_meta ?= "97bba4db5ff86eae2ca28a8bf0cb8cbfa44cbbe4"
+SRCREV_machine:qemuarm ?= "5f3231da12226c3a1f30a6074691adeb50e87e29"
+SRCREV_machine:qemuarm64 ?= "8d7f22bfccbb65c1c13ec9e295b5af5a37755213"
+SRCREV_machine:qemuloongarch64 ?= "8d7f22bfccbb65c1c13ec9e295b5af5a37755213"
+SRCREV_machine:qemumips ?= "cd6f4d29a436519a02fb03788ffcd1b537311e74"
+SRCREV_machine:qemuppc ?= "8d7f22bfccbb65c1c13ec9e295b5af5a37755213"
+SRCREV_machine:qemuriscv64 ?= "8d7f22bfccbb65c1c13ec9e295b5af5a37755213"
+SRCREV_machine:qemuriscv32 ?= "8d7f22bfccbb65c1c13ec9e295b5af5a37755213"
+SRCREV_machine:qemux86 ?= "8d7f22bfccbb65c1c13ec9e295b5af5a37755213"
+SRCREV_machine:qemux86-64 ?= "8d7f22bfccbb65c1c13ec9e295b5af5a37755213"
+SRCREV_machine:qemumips64 ?= "c66efea0d1d1d36395ee98abe1d912b6b4b42885"
+SRCREV_machine ?= "8d7f22bfccbb65c1c13ec9e295b5af5a37755213"
+SRCREV_meta ?= "e470f033e5577e2e9bb256ce3b419541c4829364"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "eb3cdb587879a7794c7f649011c565d7a94f3e2e"
+SRCREV_machine:class-devupstream ?= "05d8970cca014b96c06c3730ae084f08087f13dd"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.4/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.4;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.4.11"
+LINUX_VERSION ?= "6.4.12"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


