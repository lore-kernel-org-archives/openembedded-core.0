Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92B4C7EE37
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 15:13:59 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web10.24930.1677683637664143895
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 07:13:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NC5sq7Hn;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d7so14498692qtr.12
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 07:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hiPkmwJ7DBp8wna8NJ2cj4PXfDTMN9PT5fODdoxB9U=;
        b=NC5sq7HnYL2sJAQXxncva74D5fGL17cAuFwXzUcyk8ZVC3IPW4hIBg3Jq+mrzvoOtb
         RiY0JndRd4Qa/N40Q6wVSofD9yB/3OG/2QjoZy5PBnZEOZPqkunXdUUBiwMqa8pyPtDL
         33KKAJ2q09WUO9AO0eee1yMmpyeb+oRJR+4KrP5lyrArPC0CIkHzSMjQWXdtMrYJiMz3
         2XO69o0ethe6XoRP4orHo6CcG9gvlwZSZeSd2WTgsmu4iY0XgvI3X2ql2mio1shPMJUE
         QevNStLx3OYBxldJhssFNQIB+D0aU2Qc/ap5XULRNwBooVXgyHCATS8jbjSHfFuD4cMu
         ++Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hiPkmwJ7DBp8wna8NJ2cj4PXfDTMN9PT5fODdoxB9U=;
        b=FD07g94m7nL9yeYFjEW+TqN1rhC9o5nnka2I1i7AZ/CZo2tDJ0JHvtFAkMf11844GD
         WpX4KK6PAWx8/1wIua5TCqscX5sAVaqtcDcuhxJJNjSlFHoFRIElb1l3N7hRZPKnxsbj
         MsbxzCnoUO+tu3a12ebSFMsBT/DHQ/uo7ewKYO1lZYKYRYh1MudNUHmdVbRqt2wcyl8a
         mjJjecYqFmu+MZ1p477gndKaM1/1KBzW8bOPu9vr3C9m0jOnZQXxrPooq5K7hSrPnwj+
         56ZGhWcyBkPuw4juMIAtDExVJUnn+sZF8IwreehtmRmcxiYqWFC0eo/2ltJVFG760kKd
         sWaw==
X-Gm-Message-State: AO0yUKVlVmSXFIqs3FKEcsNZOw4kmYpzGlm3kX+P05dQqilvYRM+7v6+
	geKaMpKNWYydmAJb2acc6SCWWGCj2swvOg==
X-Google-Smtp-Source: AK7set8b7RW9GV0gr0jnjKZibrrjyIn3rwOI1daUQP9NbgjzMxEkpV+teXSY+itA4Kh8d8xfEs71RQ==
X-Received: by 2002:a05:622a:1052:b0:3bf:c675:3b65 with SMTP id f18-20020a05622a105200b003bfc6753b65mr11812650qte.44.1677683636501;
        Wed, 01 Mar 2023 07:13:56 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id x2-20020ac86b42000000b003b635a5d56csm8472323qts.30.2023.03.01.07.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 07:13:55 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] linux-yocto/6.1: update to v6.1.14
Date: Wed,  1 Mar 2023 10:13:43 -0500
Message-Id: <ac8cb5bc73b00d40436c12a2794a7fa278dbed49.1677683523.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677683523.git.bruce.ashfield@gmail.com>
References: <cover.1677683523.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 15:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177940

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    7d54cb2c26da Linux 6.1.14
    de41a146f98e bpf: add missing header file include
    a1bc22d04dcf randstruct: disable Clang 15 support
    0a1394e07c5d ext4: Fix function prototype mismatch for ext4_feat_ktype
    30b3075be48b platform/x86: nvidia-wmi-ec-backlight: Add force module parameter
    16f118699259 platform/x86/amd/pmf: Add depends on CONFIG_POWER_SUPPLY
    09e7816c61cd audit: update the mailing list in MAINTAINERS
    2c97c5bc0b6f wifi: mwifiex: Add missing compatible string for SD8787
    729bad73c01f sh: define RUNTIME_DISCARD_EXIT
    af3fae1cb282 s390: define RUNTIME_DISCARD_EXIT to fix link error with GNU ld < 2.36
    a783d7f7cb95 powerpc/vmlinux.lds: Don't discard .rela* for relocatable builds
    9c87fd4a3044 powerpc/vmlinux.lds: Define RUNTIME_DISCARD_EXIT
    bffd0bbf8c55 arch: fix broken BuildID for arm64 and riscv
    3e3e4d234d46 arm64: remove special treatment for the link order of head.o
    48e9a752ce40 riscv: remove special treatment for the link order of head.o
    f977340022ad Bluetooth: btusb: Add more device IDs for WCN6855
    9d80f3e60043 x86/static_call: Add support for Jcc tail-calls
    c51a456b4179 x86/alternatives: Teach text_poke_bp() to patch Jcc.d32 instructions
    75c066485bcb x86/alternatives: Introduce int3_emulate_jcc()
    684db631a157 uaccess: Add speculation barrier to copy_from_user()
    173cadcece76 nfp: ethtool: fix the bug of setting unsupported port speed
    05c91c039139 nfp: ethtool: support reporting link modes
    fd2dba8b4a35 powerpc/64s/radix: Fix RWX mapping with relocated kernel
    05197a0916f5 selftests: kvm: move declaration at the beginning of main()
    0e2dba8c0ebe KVM: x86: fix deadlock for KVM_XEN_EVTCHN_RESET
    44610f4c3093 drm/i915: Remove __maybe_unused from mtl_info
    185ffdeb772c spi: mediatek: Enable irq before the spi registration
    5260618d5783 powerpc: dts: t208x: Disable 10G on MAC1 and MAC2
    a169ff38abd0 can: kvaser_usb: hydra: help gcc-13 to figure out cmd_len
    63fada296062 KVM: VMX: Execute IBPB on emulated VM-exit when guest has IBRS
    a51ed3943eba KVM: SVM: Skip WRMSR fastpath on VM-Exit if next RIP isn't valid
    896143c4333d KVM: x86: Fail emulation during EMULTYPE_SKIP on any exception
    3fab7adc2f65 docs: perf: Fix PMU instance name of hisi-pcie-pmu
    80cf2b219ebc spi: mediatek: Enable irq when pdata is ready
    e933c28aa5cd scsi: hisi_sas: Fix SATA devices missing issue during I_T nexus reset
    8ec73f41504b scsi: libsas: Add smp_ata_check_ready_type()
    38c5d24d8723 random: always mix cycle counter in add_latent_entropy()
    afec25854ca7 sched/psi: Stop relying on timer_pending() for poll_work rescheduling
    104cf4cc127b clk: mxl: syscon_node_to_regmap() returns error pointers
    65e53eaad077 powerpc: dts: t208x: Mark MAC1 and MAC2 as 10G
    3391bea3d6b8 clk: mxl: Fix a clk entry by adding relevant flags
    77fee59653c6 clk: mxl: Add option to override gate clks
    005b9a123c97 clk: mxl: Remove redundant spinlocks
    811bdf228e72 clk: mxl: Switch from direct readl/writel based IO to regmap based IO
    0deb50618944 drm/edid: Fix minimum bpc supported with DSC1.2 for HDMI sink
    0076bded9663 wifi: rtl8xxxu: gen2: Turn on the rate control
    441961c43150 wifi: ath11k: fix warning in dma_free_coherent() of memory chunks while recovery
    2af157c9c8f3 drm/etnaviv: don't truncate physical page address
    1ac8758e0272 Linux 6.1.13
    4419cb8e5b0f net: sched: sch: Fix off by one in htb_activate_prios()
    0c89a43beb87 ASoC: SOF: Intel: hda-dai: fix possible stream_tag leak
    02f81e0256d0 nvme-pci: refresh visible attrs for cmb attributes
    70fdd9831a5f alarmtimer: Prevent starvation by small intervals and SIG_IGN
    cfc2faf3a6fe perf/x86: Refuse to export capabilities for hybrid PMUs
    747ca7c8a0c7 kvm: initialize all of the kvm_debugregs structure before sending it to userspace
    9ca0910b2def KVM: x86/pmu: Disable vPMU support on hybrid CPUs (host PMUs)
    8017a161e84e nvme-rdma: stop auth work after tearing down queues in error recovery
    e94e1ea596f0 nvme-tcp: stop auth work after tearing down queues in error recovery
    513e4b876ec5 net/sched: tcindex: search key must be 16 bits
    49f04300d495 i40e: Add checking for null for nlmsg_find_attr()
    974cfed82cc9 mm: extend max struct page size for kmsan
    eaba8521fd20 mm/gup: add folio to list when folio_isolate_lru() succeed
    f16e2f7c52d0 ipv6: Fix tcp socket connection with DSCP.
    22e6dc065323 ipv6: Fix datagram socket connection with DSCP.
    b6eabfb05c3d ixgbe: add double of VLAN header when computing the max MTU
    55c96c5e8e08 igb: Fix PPS input and output using 3rd and 4th SDP
    39f797719d5c igb: conditionalize I2C bit banging on external thermal sensor support
    c376227845ee net: mpls: fix stale pointer if allocation fails during device rename
    54b6082aec17 tipc: fix kernel warning when sending SYN message
    863a7de987f0 net: use a bounce buffer for copying skb->mark
    92573c6d20c4 net: stmmac: Restrict warning on disabling DMA store and fwd mode
    ac6e733f81f8 tracing: Make trace_define_field_ext() static
    b444fcc306a7 bnxt_en: Fix mqprio and XDP ring checking logic
    c9d483a82848 net: stmmac: fix order of dwmac5 FlexPPS parametrization sequence
    e336a9e08618 net: openvswitch: fix possible memory leak in ovs_meter_cmd_set()
    b6d204731178 net/sched: act_ctinfo: use percpu stats
    02df3170c04a net/usb: kalmia: Don't pass act_len in usb_bulk_msg error path
    229461ff0f43 dccp/tcp: Avoid negative sk_forward_alloc by ipv6_pinfo.pktoptions.
    736281d45907 ice: xsk: Fix cleaning of XDP_TX frames
    bd662ba56187 net/sched: tcindex: update imperfect hash filters respecting rcu
    b70ec9872910 sctp: sctp_sock_filter(): avoid list_entry() on possibly empty list
    b7ec3971f183 net: ethernet: ti: am65-cpsw: Add RX DMA Channel Teardown Quirk
    ec9938d1b56e net: bgmac: fix BCM5358 support by setting correct flags
    5fbf79841b3f i40e: add double of VLAN header when computing the max MTU
    6d9f1ff81a89 ixgbe: allow to increase MTU to 3K with XDP enabled
    a813e55c1086 ice: fix lost multicast packets in promisc mode
    2fc3ff76e96f drm/i915/gen11: Wa_1408615072/Wa_1407596294 should be on GT list
    e105b5e0d703 drm/vc4: Fix YUV plane handling when planes are in different buffers
    fcc6266d0da4 drm/vc4: crtc: Increase setup cost in core clock calculation to handle extreme reduced blanking
    b5aa09a0d4b7 revert "squashfs: harden sanity check in squashfs_read_xattr_id_table"
    3d16f4d7a1bc net: Fix unwanted sign extension in netdev_stats_to_stats64()
    2578123d5bdb Revert "mm: Always release pages to the buddy allocator in memblock_free_late()."
    0ed7b542c21c coredump: Move dump_emit_page() to kill unused warning
    7f9f6c54da87 freezer,umh: Fix call_usermode_helper_exec() vs SIGKILL
    854e1ecff266 gpio: sim: fix a memory leak
    54806cb7516c mm/migrate: fix wrongly apply write bit after mkdirty on sparc64
    d4d9bdc6946d mm/filemap: fix page end in filemap_get_read_batch
    fd71c8d3b005 mm/MADV_COLLAPSE: set EAGAIN on unexpected page refcount
    a8ef5109f93c nilfs2: fix underflow in second superblock position calculations
    0047bcac7af7 hugetlb: check for undefined shift on 32 bit architectures
    c6879a4dcefe sched/psi: Fix use-after-free in ep_remove_wait_queue()
    bd302d7db300 ata: libata-core: Disable READ LOG DMA EXT for Samsung MZ7LH
    939640b99743 ata: ahci: Add Tiger Lake UP{3,4} AHCI controller
    6f07db9550a6 ALSA: hda/realtek: Enable mute/micmute LEDs and speaker support for HP Laptops
    789597ef058d ALSA: hda/realtek: fix mute/micmute LEDs don't work for a HP platform.
    9755eefe8ae0 ALSA: hda/realtek - fixed wrong gpio assigned
    c1de4def2e88 ALSA: hda/conexant: add a new hda codec SN6180
    e0089167543e ALSA: hda: Fix codec device field initializan
    82645bf4ed02 mmc: mmc_spi: fix error handling in mmc_spi_probe()
    f855d31bb38d mmc: sdio: fix possible resource leaks in some error paths
    0de3e53eab95 mmc: meson-gx: fix SDIO mode if cap_sdio_irq isn't set
    459980cc1448 mmc: jz4740: Work around bug on JZ4760(B)
    0a127ac97240 drm/vmwgfx: Do not drop the reference to the handle too soon
    14a14da042dd drm/vmwgfx: Stop accessing buffer objects which failed init
    020eccac747e drm/amd/display: Fail atomic_check early on normalize_zpos error
    dbe3529e816e drm/amd/amdgpu: fix warning during suspend
    8da6df028d53 drm: Disable dynamic debug as broken
    f1d91f0e9d5a fbdev: Fix invalid page access after closing deferred I/O devices
    eb80a7f34f3a vmxnet3: move rss code block under eop descriptor
    af126acf01a1 aio: fix mremap after fork null-deref
    86e3baf6a6a2 mm: shrinkers: fix deadlock in shrinker debugfs
    b184caaf62aa kasan: fix Oops due to missing calls to kasan_arch_is_ready()
    50b21bba3626 of: reserved_mem: Have kmemleak ignore dynamically allocated reserved mem
    421eea6b41ad selftests: mptcp: userspace: fix v4-v6 test in v6.1
    66ec619e4591 ceph: blocklist the kclient when receiving corrupted snap trace
    eb253f83d403 ceph: move mount state enum to super.h
    b9f21e40135a platform/x86: touchscreen_dmi: Add Chuwi Vi8 (CWI501) DMI match
    b4e79d0c7f9b drm/amd/display: Properly handle additional cases where DCN is not supported
    fc64b04297a0 drm/amdgpu: Enable vclk dclk node for gc11.0.3
    e9cbb2b0d9f6 drm/amdgpu: enable HDP SD for gfx 11.0.3
    488770cbddd8 drm/amd/display: Reset DMUB mailbox SW state after HW reset
    383e32fa274a drm/amd/display: Unassign does_plane_fit_in_mall function from dcn3.2
    7dbd205349f1 drm/amd/display: Adjust downscaling limits for dcn314
    0c42622a573b drm/amd/display: Add missing brackets in calculation
    53fb698a8a28 nvme: clear the request_queue pointers on failure in nvme_alloc_io_tag_set
    84ea5242b723 nvme: clear the request_queue pointers on failure in nvme_alloc_admin_tag_set
    fd646ac5403f nvme-fc: fix a missing queue put in nvmet_fc_ls_create_association
    f1eb22d0ff06 s390/decompressor: specify __decompress() buf len to avoid overflow
    f6415c9c9a0b net: sched: sch: Bounds check priority
    5252655127c7 net: ethernet: mtk_eth_soc: Avoid truncating allocation
    07a0e6d20106 drm/nouveau/devinit/tu102-: wait for GFW_BOOT_PROGRESS == COMPLETED
    b266c2e72ef3 fscache: Use clear_and_wake_up_bit() in fscache_create_volume_work()
    63c12d00d856 powerpc/64: Fix perf profiling asynchronous interrupt handlers
    07c53834ec27 net: stmmac: do not stop RX_CLK in Rx LPI state for qcs404 SoC
    15aa6a4274fb selftest: net: Improve IPV6_TCLASS/IPV6_HOPLIMIT tests apparmor compatibility
    ad549f06e3de net/rose: Fix to not accept on connected socket
    5d2cc32c1c10 vdpa: ifcvf: Do proper cleanup if IFCVF init fails
    2ad95cb1af7a tools/virtio: fix the vringh test for virtio ring changes
    925b1c909d11 ASoC: cs42l56: fix DT probe
    749985988148 bpf, sockmap: Don't let sock_map_{close,destroy,unhash} call itself
    22fcbb7802b9 ASoC: amd: yc: Add Xiaomi Redmi Book Pro 15 2022 into DMI table
    427ca2530da8 ALSA: hda: Do not unset preset when cleaning up codec
    544062e65f44 selftests/bpf: Verify copy_register_state() preserves parent/live fields
    2cd6e872d88d ASoC: Intel: sof_ssp_amp: always set dpcm_capture for amplifiers
    c2241c6c8e21 ASoC: Intel: sof_nau8825: always set dpcm_capture for amplifiers
    0a0754ca3c7c ASoC: Intel: sof_cs42l42: always set dpcm_capture for amplifiers
    f40f3dd00576 ASoC: Intel: sof_rt5682: always set dpcm_capture for amplifiers
    44bec0e7bf0a ALSA: usb-audio: Add FIXED_RATE quirk for JBL Quantum610 Wireless
    ad5716dea7d8 ASoC: SOF: sof-audio: start with the right widget type
    591d69e47a58 ASoC: amd: yc: Add DMI support for new acer/emdoor platforms
    d8c594da79bc btrfs: lock the inode in shared mode before starting fiemap
    f2e0134b43be btrfs: move the auto defrag code to defrag.c
    3fbcd42b3e66 mptcp: fix locking for in-kernel listener creation
    c4fcda0def04 mptcp: deduplicate error paths on endpoint creation
    03edc4a27dad mptcp: fix locking for setsockopt corner-case
    94ed108bf18c mptcp: sockopt: make 'tcp_fastopen_connect' generic

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++---
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index d83fa28164..2b3cfdeacc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3f8b7b19642bbcf9a170cb1d0edc881f0ca9b72b"
-SRCREV_meta ?= "6c723fc4d35fbdb277e28d0072f8117e43679528"
+SRCREV_machine ?= "eb88226488a4e1ecee5653a0c060e9f6172ec72b"
+SRCREV_meta ?= "e8d08fc4c02c80ef13d4e540f70364c27f8a310c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "6.1.12"
+LINUX_VERSION ?= "6.1.14"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index a0b9e2d28f..7e372bce49 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "6.1.12"
+LINUX_VERSION ?= "6.1.14"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "d855e638945ed4223775c19f4eb203381c3bc24c"
-SRCREV_meta ?= "6c723fc4d35fbdb277e28d0072f8117e43679528"
+SRCREV_machine ?= "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98a"
+SRCREV_meta ?= "e8d08fc4c02c80ef13d4e540f70364c27f8a310c"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 988718f212..be31a22524 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -14,25 +14,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "96685a4bde4e1642af2413a7b78ee5ea4d544e81"
-SRCREV_machine:qemuarm64 ?= "d855e638945ed4223775c19f4eb203381c3bc24c"
+SRCREV_machine:qemuarm ?= "129155997616e25e7221ed259fa75282e46a00b6"
+SRCREV_machine:qemuarm64 ?= "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98a"
 SRCREV_machine:qemuloongarch64 ?= "1caf99d56881e1510afca553cd4a057f80479973"
-SRCREV_machine:qemumips ?= "9ecebe9ac613fb9347e0fc0d932432571bc6c951"
-SRCREV_machine:qemuppc ?= "d855e638945ed4223775c19f4eb203381c3bc24c"
-SRCREV_machine:qemuriscv64 ?= "d855e638945ed4223775c19f4eb203381c3bc24c"
-SRCREV_machine:qemuriscv32 ?= "d855e638945ed4223775c19f4eb203381c3bc24c"
-SRCREV_machine:qemux86 ?= "d855e638945ed4223775c19f4eb203381c3bc24c"
-SRCREV_machine:qemux86-64 ?= "d855e638945ed4223775c19f4eb203381c3bc24c"
-SRCREV_machine:qemumips64 ?= "bfd40de0f8fa3500b51b32e55be0a01723ee31e5"
-SRCREV_machine ?= "d855e638945ed4223775c19f4eb203381c3bc24c"
-SRCREV_meta ?= "6c723fc4d35fbdb277e28d0072f8117e43679528"
+SRCREV_machine:qemumips ?= "aa98067af82a03ef5223e9c116506030a732eb24"
+SRCREV_machine:qemuppc ?= "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98a"
+SRCREV_machine:qemuriscv64 ?= "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98a"
+SRCREV_machine:qemuriscv32 ?= "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98a"
+SRCREV_machine:qemux86 ?= "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98a"
+SRCREV_machine:qemux86-64 ?= "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98a"
+SRCREV_machine:qemumips64 ?= "dfe8ca1dc8dcd94f4959923650ccc6d84e94dc50"
+SRCREV_machine ?= "b05ca3429c1eef8cfff0b5638c8a5bb708b4e98a"
+SRCREV_meta ?= "e8d08fc4c02c80ef13d4e540f70364c27f8a310c"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "129c15b606278f9254a16013f7e5a94a128d9bcd"
+SRCREV_machine:class-devupstream ?= "7d54cb2c26dad1264ecca85992bfe8984df4b7b5"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -40,7 +40,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.12"
+LINUX_VERSION ?= "6.1.14"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


