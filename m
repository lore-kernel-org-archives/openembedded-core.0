Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426AFC35274
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 14:25:30 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.51769.1703168721028224858
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 06:25:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SsEjTgm9;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7811c16ce6cso50332585a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 06:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703168720; x=1703773520; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpngCI2AQIJ1a/pTyVqN8Sfl+ucLB4jaU0TQcGCgVKM=;
        b=SsEjTgm9JGICFRVrjnN7T+8b/htPvHRV9rTFXiSbdNZ6HJzrsz90V0YTVzalUqFIka
         HpHKqMmZLidFCcgMvIVt8aQ9e4b1znfkSb0kT+9NEKtLCV6BwExzunQOCfUb6IClyYbk
         E8S8Pg+amh4MKwEVowoyxHAVa6d6rrqEzjqLnN1pW9oVY92yrn5usspCYUBaAff0HBIT
         tj+d/o8VNxrnIahN9q3VrDl8+7fQFrFwNBNugcrRGcGhI/iCFd9jVayKqbMM9DIWHFhY
         09cr+EgaRSWvk76vhqUIb36QKIM3MO0BqWxKNMa5uvpC5VUkb8xebc0RVb4b6HtusTCL
         U7vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703168720; x=1703773520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zpngCI2AQIJ1a/pTyVqN8Sfl+ucLB4jaU0TQcGCgVKM=;
        b=vvURd3z1E63Si/bpHYl7HeXAKrmfFxAZHzx03nIZfM5SOnp40JwcO7ujGrnNwQDRL0
         ZxDdmgcLa+Yzw1Nmf6F3b6Ks2tdJVgsE9ng9f7RVmeednupZ3aWgdQ4V+CUtyRDhAU/b
         b1JQU70Lp9b+AQyBWaWGHfhtWPf0LJCluQyM87YGU2BDhf1K22ksvOn+un0eYpWQ/HcJ
         U+TtzJappYG4d0QBgO1hHuU41wksAXVHYp+7mh9s2Aw64aS5033JbQ5M3XMrbJN/NOAT
         onhAqCMK9TFPf34JEQbYYLbnJKfj4Mk5TXVyRSpurmeCaYLk2lyonhQ7K+x+AVaLz5Nw
         +jNA==
X-Gm-Message-State: AOJu0YwvpKi0kUWiCEvos0tkNjjN0QmAGjewk3Vf/a23q1KdPG9Fezoy
	oOJeZf7xDWZjLRuUru9PGrvgZdqMEexrqHur
X-Google-Smtp-Source: AGHT+IG53SW+Qw/85vykXJeqvZ1wTrwvaoB29ax/6lLbZQquYYxmPt0QNiZ+xYS3yHrmxXeRq8x9HQ==
X-Received: by 2002:a05:620a:2ad6:b0:77f:2dcc:4fa2 with SMTP id bn22-20020a05620a2ad600b0077f2dcc4fa2mr21135238qkb.121.1703168719897;
        Thu, 21 Dec 2023 06:25:19 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g4-20020a37e204000000b0077eff6eece8sm679490qki.62.2023.12.21.06.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 06:25:19 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto/6.1: update to v6.1.68
Date: Thu, 21 Dec 2023 09:25:09 -0500
Message-Id: <3d04726cefa34b1ba48a17c2342720058e70b0a9.1703168370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1703168370.git.bruce.ashfield@gmail.com>
References: <cover.1703168370.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 14:25:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192836

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    ba6f5fb46511 Linux 6.1.68
    f38b4e99e24c drm/i915: Skip some timing checks on BXT/GLK DSI transcoders
    d9ef7b05ccd7 drm/i915/sdvo: stop caching has_hdmi_monitor in struct intel_sdvo
    cf70d62ace90 drm/i915/lvds: Use REG_BIT() & co.
    e6d55cf49399 drm/i915/display: Drop check for doublescan mode in modevalid
    9c322aaf28e8 riscv: Kconfig: Add select ARM_AMBA to SOC_STARFIVE
    189c2a82933c netfilter: nft_set_pipapo: skip inactive elements during set walk
    b4e440cf600e MIPS: Loongson64: Enable DMA noncoherent support
    d52a5178cbdc MIPS: Loongson64: Handle more memory types passed from firmware
    8d18a0158546 MIPS: Loongson64: Reserve vgabios memory on boot
    2b9b2d28a92a KVM: SVM: Update EFER software model on CR0 trap for SEV-ES
    6d6314c3dbac KVM: s390/mm: Properly reset no-dat
    be297475cabc MIPS: kernel: Clear FPU states when setting up kernel threads
    358bd5f436d8 cifs: Fix flushing, invalidation and file size with FICLONE
    18b02e4343e8 cifs: Fix flushing, invalidation and file size with copy_file_range()
    69540c108d72 USB: gadget: core: adjust uevent timing on gadget unbind
    2467f4f8cb7c x86/CPU/AMD: Check vendor in the AMD microcode callback
    0553d5290879 devcoredump: Send uevent once devcd is ready
    74799b43d856 serial: 8250_omap: Add earlycon support for the AM654 UART controller
    d59dafa9eb12 serial: 8250: 8250_omap: Do not start RX DMA on THRI interrupt
    638a6cbacefd serial: 8250: 8250_omap: Clear UART_HAS_RHR_IT_DIS bit
    f434703fb893 serial: sc16is7xx: address RX timeout interrupt errata
    a8027753ab65 ARM: PL011: Fix DMA support
    c909ce57d055 usb: typec: class: fix typec_altmode_put_partner to put plugs
    b12ccef70545 smb: client: fix potential NULL deref in parse_dfs_referrals()
    f48430635b5e Revert "xhci: Loosen RPM as default policy to cover for AMD xHC 1.1"
    9ce109b74875 cifs: Fix non-availability of dedup breaking generic/304
    8e25331ea560 parport: Add support for Brainboxes IX/UC/PX parallel cards
    bee9affd37b9 serial: 8250_dw: Add ACPI ID for Granite Rapids-D UART
    16da1f84f5ef usb: gadget: f_hid: fix report descriptor allocation
    c8bf22e0d049 drm/amdgpu: Update EEPROM I2C address for smu v13_0_0
    87509778718c drm/amdgpu: Add I2C EEPROM support on smu v13_0_6
    4ccb34d4313b drm/amdgpu: simplify amdgpu_ras_eeprom.c
    af6b1f1156fc drm/amdgpu: Return from switch early for EEPROM I2C address
    a3049c9a3013 drm/amdgpu: Remove second moot switch to set EEPROM I2C address
    30289057ef8f drm/amdgpu: Add support for RAS table at 0x40000
    c67c553b4dd9 drm/amdgpu: Decouple RAS EEPROM addresses from chips
    ee9efcdc76af drm/amdgpu: Remove redundant I2C EEPROM address
    a945568638ac drm/amdgpu: Add EEPROM I2C address support for ip discovery
    f549f837b9ac drm/amdgpu: Update ras eeprom support for smu v13_0_0 and v13_0_10
    458affed0619 drm/amdgpu: correct the amdgpu runtime dereference usage count
    41c5dd545e76 drm/amd/amdgpu: Fix warnings in amdgpu/amdgpu_display.c
    613eaee4459d drm/amdgpu: fix memory overflow in the IB test
    1705927a1073 gpiolib: sysfs: Fix error handling on failed export
    4b716fcacd2a x86/sev: Fix kernel crash due to late update to read-only ghcb_version
    06dec254c59a perf: Fix perf_event_validate_size()
    b0c195a825d4 arm64: dts: mt8183: kukui: Fix underscores in node names
    8a3d746c7ec5 arm64: dts: mediatek: add missing space before {
    5656634ce01e parisc: Fix asm operand number out of range build error in bug table
    f9e9e156dbbb parisc: Reduce size of the bug_table on 64-bit kernel by half
    8479f5ca8b6c tracing: Stop current tracer when resizing buffer
    df4aa7e84d00 tracing: Set actual size after ring buffer resize
    07ad456e1c02 ring-buffer: Force absolute timestamp on discard of event
    40421e0cf34e LoongArch: BPF: Don't sign extend function return value
    ebb09d58dfe7 LoongArch: BPF: Don't sign extend memory load operand
    066dcd87b94c misc: mei: client.c: fix problem of return '-EOVERFLOW' in mei_cl_write
    d78789ba2195 misc: mei: client.c: return negative error code in mei_cl_write
    672976c28e1b hwtracing: hisi_ptt: Add dummy callback pmu::read()
    0b80e6af0d90 coresight: etm4x: Remove bogous __exit annotation for some functions
    766b29f6141a coresight: etm4x: Make etm4_remove_dev() return void
    920f84a6e8e9 binder: fix memory leaks of spam and pending work
    18847b6bba36 arm64: dts: mediatek: mt8183-evb: Fix unit_address_vs_reg warning on ntc
    c428285eab3c arm64: dts: mediatek: mt8183: Move thermal-zones to the root node
    bdd7508661fc arm64: dts: mediatek: mt8183: Fix unit address for scp reserved memory
    66398d18565d arm64: dts: mediatek: mt8195: Fix PM suspend/resume with venc clocks
    e1d4f02a68d3 arm64: dts: mediatek: mt8173-evb: Fix regulator-fixed node names
    ff566a8d765f arm64: dts: mediatek: cherry: Fix interrupt cells for MT6360 on I2C7
    6d50aa965650 arm64: dts: mediatek: mt8183-kukui-jacuzzi: fix dsi unnecessary cells properties
    c2adea319187 arm64: dts: mediatek: mt7622: fix memory node warning check
    515d971cd26a md/raid6: use valid sector values to determine if an I/O should wait on the reshape
    4132cc3a3aa9 powercap: DTPM: Fix missing cpufreq_cpu_put() calls
    686cc4de099f mm: fix oops when filemap_map_pmd() without prealloc_pte
    574a6db80f3e hugetlb: fix null-ptr-deref in hugetlb_vma_lock_write
    f5e6958919e0 platform/surface: aggregator: fix recv_buf() return value
    bcd50a3bd637 regmap: fix bogus error on regcache_sync success
    1c1c6d5c7e14 r8169: fix rtl8125b PAUSE frames blasting when suspended
    6a71d7785643 packet: Move reference count in packet_sock to atomic_long_t
    15c251f81442 tracing: Fix a possible race when disabling buffered events
    b00b50091693 tracing: Fix incomplete locking when disabling buffered events
    6e0d6c685b1b tracing: Disable snapshot buffer when stopping instance tracers
    20fd56ca2e6d tracing: Always update snapshot buffer size
    f33d663db004 checkstack: fix printed address
    4c00f01832f2 cgroup_freezer: cgroup_freezing: Check if not frozen
    3907e9cc85ff nilfs2: prevent WARNING in nilfs_sufile_set_segment_usage()
    c344e99dd812 nilfs2: fix missing error check for sb_set_blocksize call
    d2558e726e76 ring-buffer: Test last update in 32bit version of __rb_time_read()
    c4dcc915ea22 ALSA: hda/realtek: Add Framework laptop 16 to quirks
    0675fe3b3234 ALSA: hda/realtek: add new Framework laptop to quirks
    8b23707c8a1e ALSA: hda/realtek: Enable headset on Lenovo M90 Gen5
    dc1141ae5ca2 ALSA: pcm: fix out-of-bounds in snd_pcm_state_names
    bb43c57c3d0b ALSA: usb-audio: Add Pioneer DJM-450 mixer controls
    bfe5a5e2f9e9 io_uring: fix mutex_unlock with unreferenced ctx
    8bba38f7a0d4 nvme-pci: Add sleep quirk for Kingston drives
    f2f57f51b53b io_uring/af_unix: disable sending io_uring over sockets
    515c25be77ba ASoC: amd: yc: Fix non-functional mic on ASUS E1504FA
    0fcfc90c8664 kprobes: consistent rcu api usage for kretprobe holder
    a5325a055f0f rethook: Use __rcu pointer for rethook::handler
    68bc7b200305 iommu: Avoid more races around device probe
    3c796895b4e2 md: don't leave 'MD_RECOVERY_FROZEN' in error path of md_set_readonly()
    5255ded03422 md: introduce md_ro_state
    a38c1e766f4f riscv: fix misaligned access handling of C.SWSP and C.SDSP
    8b41bdcc22da ARM: dts: imx28-xea: Pass the 'model' property
    282b5acd586e ARM: dts: imx7: Declare timers compatible with fsl,imx6dl-gpt
    12ac3b0ab837 ARM: imx: Check return value of devm_kasprintf in imx_mmdc_perf_init
    4d8cc87d1845 scsi: be2iscsi: Fix a memleak in beiscsi_init_wrb_handle()
    bc5b79df6d54 tracing: Fix a warning when allocating buffered events fails
    fc2d811d3101 ARM: dts: imx6ul-pico: Describe the Ethernet PHY clock
    22143a0e5ac2 arm64: dts: imx8mp: imx8mq: Add parkmode-disable-ss-quirk on DWC3
    8dd0e20b41b1 arm64: dts: imx8mq: drop usb3-resume-missing-cas from usb
    188de9839ff2 drm/bridge: tc358768: select CONFIG_VIDEOMODE_HELPERS
    1ff56298ab32 RDMA/irdma: Avoid free the non-cqp_request scratch
    0a929e837527 RDMA/core: Fix umem iterator when PAGE_SIZE is greater then HCA pgsz
    ebcb4e19d3ef ASoC: wm_adsp: fix memleak in wm_adsp_buffer_populate
    2358e53208c0 hwmon: (nzxt-kraken2) Fix error handling path in kraken2_probe()
    3baaba79088b ASoC: codecs: lpass-tx-macro: set active_decimator correct default value
    c11b7e26d2f0 hwmon: (acpi_power_meter) Fix 4.29 MW bug
    19269741c3e2 RDMA/irdma: Fix UAF in irdma_sc_ccq_get_cqe_info()
    439857e2fe4e RDMA/irdma: Refactor error handling in create CQP
    59a022a869b1 RDMA/bnxt_re: Correct module description string
    7ed498095c6d RDMA/rtrs-clt: Remove the warnings for req in_use check
    03095a6440db RDMA/rtrs-clt: Fix the max_send_wr setting
    233c32bcf069 RDMA/rtrs-srv: Destroy path files after making sure no IOs in-flight
    7be574c34dc7 RDMA/rtrs-srv: Free srv_mr iu only when always_invalidate is true
    9dd976c435be RDMA/rtrs-srv: Check return values while processing info request
    3910ccbf25a7 RDMA/rtrs-clt: Start hb after path_up
    1e46485045cd RDMA/rtrs-srv: Do not unconditionally enable irq
    4a8774a63303 ASoC: fsl_sai: Fix no frame sync clock issue on i.MX8MP
    3166c76d1deb arm64: dts: rockchip: Expand reg size of vdec node for RK3399
    aa9ae3dffc34 arm64: dts: rockchip: Expand reg size of vdec node for RK3328
    945bfe4e0b09 RDMA/irdma: Add wait for suspend on SQD
    0b0afd4e1477 RDMA/irdma: Do not modify to SQD on error
    9d005ea01ed0 RDMA/hns: Fix unnecessary err return when using invalid congest control algorithm
    1c9561b438cb tee: optee: Fix supplicant based device enumeration
    5fd29433b29d mm/damon/sysfs: eliminate potential uninitialized variable warning
    b5ca945612b4 drop_monitor: Require 'CAP_SYS_ADMIN' when joining "events" group
    07c8229c022b psample: Require 'CAP_NET_ADMIN' when joining "packets" group
    af39b80173e4 bpf: sockmap, updating the sg structure should also update curr
    008b807fe487 tcp: do not accept ACK of bytes we never sent
    7a63521ed041 netfilter: xt_owner: Fix for unsafe access of sk->sk_socket
    3176160c22d9 netfilter: nf_tables: validate family when identifying table via handle
    96f8654b701f netfilter: nf_tables: bail out on mismatching dynset and set expressions
    c9704c26193c netfilter: nf_tables: fix 'exist' matching on bigendian arches
    0bfbfd9423f3 netfilter: nft_exthdr: add boolean DCCP option matching
    9225a4566bc1 dt-bindings: interrupt-controller: Allow #power-domain-cells
    6b9e78d6c6b9 octeontx2-af: Update Tx link register range
    9be8f66ea857 octeontx2-af: Add missing mcs flr handler call
    d54470adfcc7 octeontx2-af: Fix mcs stats register address
    90773de07391 octeontx2-af: Fix mcs sa cam entries size
    0c8baa37bfa5 octeontx2-af: Adjust Tx credits when MCS external bypass is disabled
    d2689aea4f2e net: hns: fix fake link up on xge port
    217cc7f6a6ac net: hns: fix wrong head when modify the tx feature when sending packets
    87559196c316 net: atlantic: Fix NULL dereference of skb pointer in
    64c78c57e307 ipv4: ip_gre: Avoid skb_pull() failure in ipgre_xmit()
    ce3c5acb594e ionic: Fix dim work handling in split interrupt mode
    a92719900fc6 ionic: fix snprintf format length warning
    c91685ac1bce tcp: fix mid stream window clamp.
    9fc81912fcdb net: bnxt: fix a potential use-after-free in bnxt_init_tc
    0d33871b66f9 iavf: validate tx_coalesce_usecs even if rx_coalesce_usecs is zero
    75fd86e54119 i40e: Fix unexpected MFS warning message
    ba6eb3a77a56 octeontx2-af: fix a use-after-free in rvu_npa_register_reporters
    2c0cbb97b118 xsk: Skip polling event check for unbound socket
    ed7e211b6786 net: stmmac: fix FPE events losing
    1a41ffc4dc6a octeontx2-pf: consider both Rx and Tx packet stats for adaptive interrupt coalescing
    8d034da82563 arcnet: restoring support for multiple Sohard Arcnet cards
    3c323796951a platform/mellanox: Check devm_hwmon_device_register_with_groups() return value
    29d82b366a22 platform/mellanox: Add null pointer checks for devm_kasprintf()
    646f1e9c1978 mlxbf-bootctl: correctly identify secure boot with development keys
    ef91309a570a r8152: Add RTL8152_INACCESSIBLE to r8153_aldps_en()
    d11ef4d3dd37 r8152: Add RTL8152_INACCESSIBLE to r8153_pre_firmware_1()
    284cd311bb48 r8152: Add RTL8152_INACCESSIBLE to r8156b_wait_loading_flash()
    0823990da76f r8152: Add RTL8152_INACCESSIBLE checks to more loops
    3759e735562a r8152: Rename RTL8152_UNPLUG to RTL8152_INACCESSIBLE
    ecb5068f55a8 hv_netvsc: rndis_filter needs to select NLS
    80de965ca52c octeontx2-af: Check return value of nix_get_nixlf before using nixlf
    f565044d1d84 octeontx2-pf: Add missing mutex lock in otx2_get_pauseparam
    a3f5de10b5cf ipv6: fix potential NULL deref in fib6_add()
    e2b202821dd8 platform/x86: wmi: Skip blocks with zero instances
    b536601d0520 of: dynamic: Fix of_reconfig_get_state_change() return value documentation
    76b9ea6f54ed platform/x86: asus-wmi: Move i8042 filter install to shared asus-wmi code
    3453531284cb dt: dt-extract-compatibles: Don't follow symlinks when walking tree
    8a124b9e784b dt: dt-extract-compatibles: Handle cfile arguments in generator function
    cde700ceb0ea x86/tdx: Allow 32-bit emulation by default
    e09d243a518b x86/entry: Do not allow external 0x80 interrupts
    d5f999317e83 x86/entry: Convert INT 0x80 emulation to IDTENTRY
    b8ec27ae221e x86/coco: Disable 32-bit emulation by default on TDX and SEV
    0870f19b54de x86: Introduce ia32_enabled()
    9046665befd6 drm/amdgpu: correct chunk_ptr to a pointer to chunk.
    18209382db64 kconfig: fix memory leak from range properties
    bcc2abaa4095 tg3: Increment tx_dropped in tg3_tso_bug()
    9bbc655e1849 tg3: Move the [rt]x_dropped counters to tg3_napi
    62c6d82bac2b zstd: Fix array-index-out-of-bounds UBSAN warning
    875ee3a09e27 netfilter: ipset: fix race condition between swap/destroy and kernel side add/del/test
    6025052bbf3d i2c: designware: Fix corrupted memory seen in the ISR
    75b5016ce325 hrtimers: Push pending hrtimers away from outgoing CPU earlier
    8ea2b4ba9ba2 vdpa/mlx5: preserve CVQ vringh index

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 93fc6a73e9..5cfc5a7dd8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "40d218ec6d26f4d8de1481ef665e7eafb18f45aa"
-SRCREV_meta ?= "b1742128ddec29743c5f9d5c031a5770ece2b1b6"
+SRCREV_machine ?= "739b3001f20153a66d2723de81faae18cd61892b"
+SRCREV_meta ?= "991713c8765172cb5d18703d15589f3ec6e1b772"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.67"
+LINUX_VERSION ?= "6.1.68"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index e3d3671a32..e19b0ec132 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.67"
+LINUX_VERSION ?= "6.1.68"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "5b9711b24429c3543018411369d7086839169481"
-SRCREV_meta ?= "b1742128ddec29743c5f9d5c031a5770ece2b1b6"
+SRCREV_machine ?= "db1e71dc5c31557828fae0084b0f9cc83882eacd"
+SRCREV_meta ?= "991713c8765172cb5d18703d15589f3ec6e1b772"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 3380604229..1329ccc958 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6b4fd468de656727bb53d6faf7634157a3f80d4b"
-SRCREV_machine:qemuarm64 ?= "5b9711b24429c3543018411369d7086839169481"
-SRCREV_machine:qemuloongarch64 ?= "5b9711b24429c3543018411369d7086839169481"
-SRCREV_machine:qemumips ?= "09c54782be2fdab1a62e547504c28f57160b81fd"
-SRCREV_machine:qemuppc ?= "5b9711b24429c3543018411369d7086839169481"
-SRCREV_machine:qemuriscv64 ?= "5b9711b24429c3543018411369d7086839169481"
-SRCREV_machine:qemuriscv32 ?= "5b9711b24429c3543018411369d7086839169481"
-SRCREV_machine:qemux86 ?= "5b9711b24429c3543018411369d7086839169481"
-SRCREV_machine:qemux86-64 ?= "5b9711b24429c3543018411369d7086839169481"
-SRCREV_machine:qemumips64 ?= "a4b4e1d2daa47b400beb16e7f4aa0e7b650d8649"
-SRCREV_machine ?= "5b9711b24429c3543018411369d7086839169481"
-SRCREV_meta ?= "b1742128ddec29743c5f9d5c031a5770ece2b1b6"
+SRCREV_machine:qemuarm ?= "85915187700314cb7ac70fd33da3e9dfd7c20063"
+SRCREV_machine:qemuarm64 ?= "db1e71dc5c31557828fae0084b0f9cc83882eacd"
+SRCREV_machine:qemuloongarch64 ?= "db1e71dc5c31557828fae0084b0f9cc83882eacd"
+SRCREV_machine:qemumips ?= "24b06ee00fc3b65a24d7e867148b08a85296e67c"
+SRCREV_machine:qemuppc ?= "db1e71dc5c31557828fae0084b0f9cc83882eacd"
+SRCREV_machine:qemuriscv64 ?= "db1e71dc5c31557828fae0084b0f9cc83882eacd"
+SRCREV_machine:qemuriscv32 ?= "db1e71dc5c31557828fae0084b0f9cc83882eacd"
+SRCREV_machine:qemux86 ?= "db1e71dc5c31557828fae0084b0f9cc83882eacd"
+SRCREV_machine:qemux86-64 ?= "db1e71dc5c31557828fae0084b0f9cc83882eacd"
+SRCREV_machine:qemumips64 ?= "d4659a339611a02e4ffc2861e697c1a278707d70"
+SRCREV_machine ?= "db1e71dc5c31557828fae0084b0f9cc83882eacd"
+SRCREV_meta ?= "991713c8765172cb5d18703d15589f3ec6e1b772"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "e7cddbb41b63252ddb5b7f8247da5d0b24adfac5"
+SRCREV_machine:class-devupstream ?= "ba6f5fb465114fcd48ddb2c7a7740915b2289d6b"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.67"
+LINUX_VERSION ?= "6.1.68"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


