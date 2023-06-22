Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665D0EB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 21:39:00 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.23637.1687469931620619708
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 14:38:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=raHqsu6j;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-62ffcc309bfso56049336d6.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 14:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687469931; x=1690061931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNZWc37VPh4wdiyEyShXstD8EoGhmyXenNSDdn3gygE=;
        b=raHqsu6jQKQas3la4n7FcWWEj+ScgYI8jN1HYIrtVgrtRdEJEpF8d16eub4ofTgAOF
         xcw0c9/sRvAdaTv0Bu+7EoXal/8ldf7v8j/ir1dkPdMx8JUqa+deAzQGQI109L4qfckF
         i3n/34tSAKq0tIny+nCho4YkMSLTewv4r3TaNzduMLZQbh2rErAd7p/GPY1R4u6hvpAe
         6d7yl8D4sTwPj8yA7SLU8aLGgpHZs+5bWZqNfHZ4N7qceq6sc5UwwfJ6MnNaSceJEL10
         1EqWpLOYDSV9/gng6TnGs2dkL7CBWuuNP7w8dZ/XNLcTxosVYqZSsPVS15lqw1keYBny
         txjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687469931; x=1690061931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNZWc37VPh4wdiyEyShXstD8EoGhmyXenNSDdn3gygE=;
        b=B+BA47aP+wRImaiF78eq9u24YOgwGS/awVRyGFWD8Tz4OoXZY3pPDVdMpq+aDodrzt
         86Mh+8nkM3JJ1HzFoUn67oEc1tVkXSiB/Wj19YugpJImWEeYQirrBxyUtWTqtXTMelcn
         cjpQbUHTqd4dvz9BXnJ2FwwQzygR7lj7gIdZPSmuHMVziww2bBDJzfAnxdJ4iJjd98Z2
         mG0+oB2C8e/NkTbfJULQI+clCJOZVcbU9J3EdlDeBXSPyMqjY+nZamv7ZXtHBjA8MwVe
         h7VBOgtQTmWgEiZtWoUq2YC5ZPQuMz8FJWYWOHxdqpTyrORqwjJ9MD2WSoooFokpBIdD
         X39w==
X-Gm-Message-State: AC+VfDxhEelfdNuEW9UrBmuw7Bx14rm9XKcArij2ZIIC4MuqP4TXfHce
	RpCZ01544lyHzIjXuNHv7ck9MECTFtF1Hw==
X-Google-Smtp-Source: ACHHUZ6QGsvHUp9iSe4YDoJb4NsIz5c7ETWO+oUzfT1TRwGJACaVqAkT9rxFMBioXDNqIM/MsFHDUg==
X-Received: by 2002:a05:6214:2468:b0:5ef:865f:e5c9 with SMTP id im8-20020a056214246800b005ef865fe5c9mr30203745qvb.29.1687469930598;
        Thu, 22 Jun 2023 14:38:50 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id x7-20020ac87ec7000000b003f6b98018casm4061651qtj.77.2023.06.22.14.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 14:38:50 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] linux-yocto/6.1: update to v6.1.35
Date: Thu, 22 Jun 2023 17:38:47 -0400
Message-Id: <20230622213847.927277-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622213847.927277-1-bruce.ashfield@gmail.com>
References: <20230622213847.927277-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 21:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183291

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    e84a4e368abe Linux 6.1.35
    a76d4933c38e kbuild: Update assembler calls to use proper flags and language target
    5abcd2c18dbb MIPS: Prefer cc-option for additions to cflags
    1d485ddcba85 MIPS: Move '-Wa,-msoft-float' check from as-option to cc-option
    d51d258997e5 x86/boot/compressed: prefer cc-option for CFLAGS additions
    bdd22f2aa131 scsi: target: core: Fix error path in target_setup_session()
    741c96715fb7 neighbour: delete neigh_lookup_nodev as not used
    26435338f9dd net/sched: act_api: add specific EXT_WARN_MSG for tc action
    ab1bbd79f48e Revert "net/sched: act_api: move TCA_EXT_WARN_MSG to the correct hierarchy"
    8f3759981104 net/sched: act_api: move TCA_EXT_WARN_MSG to the correct hierarchy
    4b4cae8e4b37 drm/amdgpu: Don't set struct drm_driver.output_poll_changed
    c6cbb4e1c10c rcu/kvfree: Avoid freeing new kfree_rcu() memory after old grace period
    8d842af30bc2 parisc: Delete redundant register definitions in <asm/assembly.h>
    616aba553640 afs: Fix vlserver probe RTT handling
    34dc1eed9918 octeon_ep: Add missing check for ioremap
    35d848164fec selftests/ptp: Fix timestamp printf format for PTP_SYS_OFFSET
    6ab77b3b852d net: tipc: resize nlattr array to correct size
    d24c96581775 dm: don't lock fs when the map is NULL during suspend or resume
    010179208c66 sfc: fix XDP queues mode with legacy IRQ
    23efdbfa8eef net: macsec: fix double free of percpu stats
    4ea1f3344472 net: lapbether: only support ethernet devices
    59f0c7bec3ca net: dsa: felix: fix taprio guard band overflow at 10Mbps with jumbo frames
    3626e93cd841 net/sched: cls_api: Fix lockup on flushing explicitly created chain
    fa285d799d1d ext4: drop the call to ext4_error() from ext4_get_group_info()
    d7d6e830cd0f cifs: fix lease break oops in xfstest generic/098
    e8119d4d1611 selftests: forwarding: hw_stats_l3: Set addrgenmode in a separate step
    ea3f336f717a net/sched: qdisc_destroy() old ingress and clsact Qdiscs before grafting
    ac57be24dcf1 net/sched: Refactor qdisc_graft() for ingress and clsact Qdiscs
    096c00ea80db sched: add new attr TCA_EXT_WARN_MSG to report tc extact message
    e568e0e16830 selftests/tc-testing: Fix SFB db test
    700d7bf300c1 selftests/tc-testing: Fix Error: failed to find target LOG
    8a086daf20a8 selftests/tc-testing: Fix Error: Specified qdisc kind is unknown.
    62aecf23f3d1 drm/nouveau: add nv_encoder pointer check for NULL
    fb725beca62d drm/nouveau/dp: check for NULL nv_connector->native_mode
    a5acbe4ea5d0 drm/bridge: ti-sn65dsi86: Avoid possible buffer overflow
    90748be0f4f3 drm/nouveau: don't detect DSM for non-NVIDIA device
    835457c0d608 net: phylink: use a dedicated helper to parse usgmii control word
    fabf9cb41334 net: phylink: report correct max speed for QUSGMII
    df7477a8bdcb igb: fix nvm.ops.read() error handling
    9710e5c30bd4 igc: Fix possible system crash when loading module
    c6612bf33ebe igc: Clean the TX buffer and TX descriptor ring
    fe289f8fee9a sctp: fix an error code in sctp_sf_eat_auth()
    0b8ae7d6e4ad ipvlan: fix bound dev checking for IPv6 l3s mode
    33bd6b76ac77 net: ethtool: correct MAX attribute value for stats
    277fbf63b34a IB/isert: Fix incorrect release of isert connection
    f77965f48792 IB/isert: Fix possible list corruption in CMA handler
    4e55c9abe947 IB/isert: Fix dead lock in ib_isert
    1def2a94f4ee RDMA/mlx5: Fix affinity assignment
    8618f8f72389 IB/uverbs: Fix to consider event queue closing also upon non-blocking mode
    4dc0b367c390 RDMA/cma: Always set static rate to 0 for RoCE
    ec6d49687d2b RDMA/mlx5: Create an indirect flow table for steering anchor
    3a83145b660c RDMA/mlx5: Initiate dropless RQ for RAW Ethernet functions
    c764fed5e544 octeontx2-af: fix lbk link credits on cn10k
    7c6d50414649 octeontx2-af: fixed resource availability check
    b4a3cae58cd8 iavf: remove mask from iavf_irq_enable_queues()
    26256aa7edcd RDMA/rxe: Fix the use-before-initialization error of resp_pkts
    b0b3848e0363 RDMA/rxe: Removed unused name from rxe_task struct
    e83bc9388627 wifi: mac80211: take lock before setting vif links
    170ceadf4a57 wifi: cfg80211: fix link del callback to call correct handler
    49f3a79f03bd wifi: mac80211: fix link activation settings order
    07f9cc229b44 net/sched: cls_u32: Fix reference counter leak leading to overflow
    c9411f014e5c octeontx2-af: Fix promiscuous mode
    5cf38fbc82ba net/sched: act_pedit: Parse L3 Header for L4 offset
    fb25478f6699 net/sched: act_pedit: remove extra check for key type
    b4e5d0c4cf07 net/sched: simplify tcf_pedit_act
    300be9f1dc4b igb: Fix extts capture value format for 82580/i354/i350
    a4a912aee14e ping6: Fix send to link-local addresses with VRF.
    381d49ec68ca net: enetc: correct the indexes of highest and 2nd highest TCs
    4aaa3b730d16 netfilter: nf_tables: incorrect error path handling with NFT_MSG_NEWRULE
    bec51844f9ba ice: Fix XDP memory leak when NIC is brought up and down
    8fddf3f05156 netfilter: nfnetlink: skip error delivery on batch in case of ENOMEM
    55b7a00f3422 netfilter: nf_tables: integrate pipapo into commit protocol
    839d38d3b0aa spi: fsl-dspi: avoid SCK glitches with continuous transfers
    485792480660 spi: cadence-quadspi: Add missing check for dma_set_mask
    2906e0d75b50 RDMA/rxe: Fix ref count error in check_rkey()
    7617a59f0056 RDMA/rxe: Fix packet length checks
    00b276bc7b62 RDMA/rtrs: Fix rxe_dealloc_pd warning
    77226c9785f8 RDMA/rtrs: Fix the last iu->buf leak in err path
    03285557deb6 usb: dwc3: gadget: Reset num TRBs before giving back the request
    7bee7f13c039 USB: dwc3: fix use-after-free on core driver unbind
    307fe59490bd USB: dwc3: qcom: fix NULL-deref on suspend
    d8195536ce26 usb: gadget: udc: core: Prevent soft_connect_store() race
    3c048d42c305 usb: gadget: udc: core: Offload usb_udc_vbus_handler processing
    3a1882841f64 usb: typec: Fix fast_role_swap_current show function
    2bf8ea2e9e39 usb: typec: ucsi: Fix command cancellation
    b352f7b6a646 serial: lantiq: add missing interrupt ack
    04b3145db225 USB: serial: option: add Quectel EM061KGL series
    03b5964a2825 clk: pxa: fix NULL pointer dereference in pxa3xx_clk_update_accr
    5532962c9ed2 thunderbolt: Mask ring interrupt on Intel hardware as well
    d799f73d5d44 thunderbolt: dma_test: Use correct value for absent rings when creating paths
    081b5f1ebc73 thunderbolt: Do not touch CL state configuration during discovery
    1eb0eff7da97 ALSA: hda/realtek: Add a quirk for Compaq N14JP6
    21863dc45aed drm/amdgpu: add missing radeon secondary PCI ID
    6f5b5ce9397d drm/amd/pm: workaround for compute workload type on some skus
    b69a10df9003 drm/amd: Tighten permissions on VBIOS flashing attributes
    b2706d862b65 drm/amd: Make sure image is written to trigger VBIOS image update flow
    ee8c6580c310 drm/amd/display: edp do not add non-edid timings
    2cb6026df193 net: usb: qmi_wwan: add support for Compal RXM-G1
    5d1fdfb3d185 drm/amdgpu: vcn_4_0 set instance 0 init sched score to 1
    f6d74371ce15 RDMA/uverbs: Restrict usage of privileged QKEYs
    5a144bad3e75 nouveau: fix client work fence deletion race
    33965ac34091 net: ethernet: stmicro: stmmac: fix possible memory leak in __stmmac_open
    bfaf388d3599 dm thin: fix issue_discard to pass GFP_NOIO to __blkdev_issue_discard
    088ad777eeae dm thin metadata: check fail_io before using data_sm
    1886db9a4ee1 ALSA: usb-audio: Add quirk flag for HEM devices to enable native DSD playback
    029e0f1f7521 ALSA: usb-audio: Fix broken resume due to UAC3 power state
    9e1c7968a275 btrfs: can_nocow_file_extent should pass down args->strict from callers
    4e9da0cda149 btrfs: fix iomap_begin length for nocow writes
    4389fb6b6a9d btrfs: do not ASSERT() on duplicated global roots
    7e23b1ec720a powerpc/purgatory: remove PGO flags
    352f62431ad3 riscv/purgatory: remove PGO flags
    2cf6e32e86ea x86/purgatory: remove PGO flags
    013027918a4e kexec: support purgatories with .text.hot sections
    c9c3163c7ab9 io_uring/net: save msghdr->msg_control for retries
    cffaa97ffb67 LoongArch: Fix perf event id calculation
    ad64865722b6 nilfs2: reject devices with insufficient block count
    69caea4eed1c nilfs2: fix possible out-of-bounds segment allocation in resize ioctl
    8f47a9665aee nilfs2: fix incomplete buffer cleanup in nilfs_btnode_abort_change_key()
    3d4bc38f716c nios2: dts: Fix tse_mac "max-frame-size" property
    447f325497dc zswap: do not shrink if cgroup may not zswap
    9f17645f8528 ocfs2: check new file size on fallocate call
    534b4bbc8589 ocfs2: fix use-after-free when unmounting read-only filesystem
    3a340c63c0c3 epoll: ep_autoremove_wake_function should use list_del_init_careful
    6d304091e091 wifi: cfg80211: fix double lock bug in reg_wdev_chan_valid()
    b11f953a61e9 wifi: cfg80211: fix locking in regulatory disconnect
    9a9adc42a590 irqchip/gic: Correctly validate OF quirk descriptors
    22efb27a21b6 NVMe: Add MAXIO 1602 to bogus nid list.
    c9c205945033 io_uring: unlock sqd->lock before sq thread release CPU
    8ca9880735b0 drm:amd:amdgpu: Fix missing buffer object unlock in failure path
    41c383c49657 xen/blkfront: Only check REQ_FUA for writes
    75955d698636 ASoC: dwc: move DMA init to snd_soc_dai_driver probe()
    7e57a56374aa ASoC: cs35l41: Fix default regmap values for some registers
    424fc902728c mips: Move initrd_start check after initrd address sanitisation.
    dd035c08ee96 MIPS: Alchemy: fix dbdma2
    34dd1a90ab64 MIPS: Restore Au1300 support
    048ad52d528e MIPS: unhide PATA_PLATFORM
    3d48ea53c44b parisc: Flush gatt writes and adjust gatt mask in parisc_agp_mask_memory()
    e522a12e4892 parisc: Improve cache flushing for PCXL in arch_sync_dma_for_cpu()
    0b09b35cae86 ASoC: Intel: avs: Add missing checks on FE startup
    5daa27bcb31d ASoC: Intel: avs: Account for UID of ACPI device
    c33fded7f17f ASoC: soc-pcm: test if a BE can be prepared
    0a9b2164b7d8 btrfs: handle memory allocation failure in btrfs_csum_one_bio
    e9a5175d5e83 btrfs: scrub: try harder to mark RAID56 block groups read-only
    c45aed74318e drm: panel-orientation-quirks: Change Air's quirk to support Air Plus
    2d9144c0ca82 power: supply: Fix logic checking if system is running from battery
    808e103ebac9 irqchip/meson-gpio: Mark OF related data as maybe unused
    0cdb593c2fe9 irqchip/gic-v3: Disable pseudo NMIs on Mediatek devices w/ firmware issues
    bf8324676b1c regulator: Fix error checking for debugfs_create_dir
    c94be1f039c3 platform/x86: asus-wmi: Ignore WMI events with codes 0x7B, 0xC0
    cdf9cfc1bbd7 PCI/DPC: Quirk PIO log size for Intel Ice Lake Root Ports
    22358b9c418c power: supply: Ratelimit no data debug output
    a7620312a082 selftests: gpio: gpio-sim: Fix BUG: test FAILED due to recent change
    79a0a3695e01 tools: gpio: fix debounce_period_us output of lsgpio
    cc1444a36398 ARM: dts: vexpress: add missing cache properties
    398bf0d67bcc power: supply: bq27xxx: Use mod_delayed_work() instead of cancel() + schedule()
    66a88d04cf5d power: supply: sc27xx: Fix external_power_changed race
    e3d2bdca180b power: supply: ab8500: Fix external_power_changed race
    628e40a225a0 of: overlay: Fix missing of_node_put() in error case of init_overlay_changeset()
    e01fc7caac9c ksmbd: validate smb request protocol id
    fec79e4f7df5 EDAC/qcom: Get rid of hardcoded register offsets
    4b3ec6b6ff24 qcom: llcc/edac: Fix the base address used for accessing LLCC banks
    314e973f36a5 cgroup: fix missing cpus_read_{lock,unlock}() in cgroup_transfer_tasks()
    c68b4db58138 cgroup: always put cset in cgroup_css_set_put_fork
    7a2e2ca9ad21 cgroup: bpf: use cgroup_lock()/cgroup_unlock() wrappers
    6111f0add6ff test_firmware: prevent race conditions by a correct implementation of locking
    aa2dfdc4ed25 test_firmware: Use kstrtobool() instead of strtobool()
    100cd6d0e563 x86/head/64: Switch to KERNEL_CS as soon as new GDT is installed

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index faf447dd33..54ead24ded 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "aa7b426ca83f0b523a1d2cfef21dca13bd6ce6d9"
-SRCREV_meta ?= "ebdf12f7412436a72a81f748083979968097b9e6"
+SRCREV_machine ?= "6f370bf9127713eccdfb3cf009c46ef4852aec28"
+SRCREV_meta ?= "b358c237cf493dcf5af1760fc4632ede32e1ff2e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.34"
+LINUX_VERSION ?= "6.1.35"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 9ba8e60993..fd2e2511d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.34"
+LINUX_VERSION ?= "6.1.35"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "78b6c1da5b5f0924c0c71b9f6097b17ce1ee049e"
-SRCREV_meta ?= "ebdf12f7412436a72a81f748083979968097b9e6"
+SRCREV_machine ?= "682b17e1d76bc4364fcc9864f39c31c855b5f5df"
+SRCREV_meta ?= "b358c237cf493dcf5af1760fc4632ede32e1ff2e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index d74c903c0b..1838a1e031 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "61c096d5618d7e8d8612e8c38ea1a731af12f59d"
-SRCREV_machine:qemuarm64 ?= "78b6c1da5b5f0924c0c71b9f6097b17ce1ee049e"
-SRCREV_machine:qemuloongarch64 ?= "78b6c1da5b5f0924c0c71b9f6097b17ce1ee049e"
-SRCREV_machine:qemumips ?= "af474dba4331363e7b5c0e1317a985461de3650c"
-SRCREV_machine:qemuppc ?= "78b6c1da5b5f0924c0c71b9f6097b17ce1ee049e"
-SRCREV_machine:qemuriscv64 ?= "78b6c1da5b5f0924c0c71b9f6097b17ce1ee049e"
-SRCREV_machine:qemuriscv32 ?= "78b6c1da5b5f0924c0c71b9f6097b17ce1ee049e"
-SRCREV_machine:qemux86 ?= "78b6c1da5b5f0924c0c71b9f6097b17ce1ee049e"
-SRCREV_machine:qemux86-64 ?= "78b6c1da5b5f0924c0c71b9f6097b17ce1ee049e"
-SRCREV_machine:qemumips64 ?= "cceb143eb0f4ea878af749da5ddfefc6eb2761d7"
-SRCREV_machine ?= "78b6c1da5b5f0924c0c71b9f6097b17ce1ee049e"
-SRCREV_meta ?= "ebdf12f7412436a72a81f748083979968097b9e6"
+SRCREV_machine:qemuarm ?= "915f4d2237d1c8e23eb67eda0b8e9b24373a80b4"
+SRCREV_machine:qemuarm64 ?= "682b17e1d76bc4364fcc9864f39c31c855b5f5df"
+SRCREV_machine:qemuloongarch64 ?= "682b17e1d76bc4364fcc9864f39c31c855b5f5df"
+SRCREV_machine:qemumips ?= "1aad3fa2eba5594fb4e779fc53fef6046d833c91"
+SRCREV_machine:qemuppc ?= "682b17e1d76bc4364fcc9864f39c31c855b5f5df"
+SRCREV_machine:qemuriscv64 ?= "682b17e1d76bc4364fcc9864f39c31c855b5f5df"
+SRCREV_machine:qemuriscv32 ?= "682b17e1d76bc4364fcc9864f39c31c855b5f5df"
+SRCREV_machine:qemux86 ?= "682b17e1d76bc4364fcc9864f39c31c855b5f5df"
+SRCREV_machine:qemux86-64 ?= "682b17e1d76bc4364fcc9864f39c31c855b5f5df"
+SRCREV_machine:qemumips64 ?= "53e7685d6da27e112397e71c27a0bce0fc9313a9"
+SRCREV_machine ?= "682b17e1d76bc4364fcc9864f39c31c855b5f5df"
+SRCREV_meta ?= "b358c237cf493dcf5af1760fc4632ede32e1ff2e"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "ca87e77a2ef8b298aa9f69658d5898e72ee450fe"
+SRCREV_machine:class-devupstream ?= "e84a4e368abe42cf359fe237f0238820859d5044"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.34"
+LINUX_VERSION ?= "6.1.35"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


