Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C97DC77B7F
	for <webhook@archiver.kernel.org>; Sat, 29 Apr 2023 17:21:06 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.51335.1682788865842459532
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Apr 2023 10:21:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=c+uCNYs7;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-246fd87a124so1051875a91.0
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 10:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682788865; x=1685380865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RB0sS9kym/LGIdaFsLckkVcg3EYRW3R0AVN31mQecfU=;
        b=c+uCNYs71fzAHKnRkuj61s7EOmKcqYjmRUSccOi4BLK/uiNS69a/eHXsQ/3VbWDVQ/
         ncD3L0tEQhWUgqcPqBo/4oMOZRJoX+3TLYQy4hxMkhNcMFrVPwlEPXHYZ6KQ8RFwJkHJ
         WtBD2XJtSo8/h6b1XH8MRO2thJa3EfUWNX75f+8EV2TdaZO/Ah8JsGbuE2PrLG2wA3Aq
         WNBfklAT9Ptg2Ca8ipcryh+9dnr+lXlTya+fO4XzKHWcvqDTQjk6YBrQpgPLldUPJCY5
         cQNoURKVnym0GL7svUewZnbOhPi9SByqxL76z4SyhI21QF1yFxh0i0MGglb5XuH1+GFi
         Q4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682788865; x=1685380865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RB0sS9kym/LGIdaFsLckkVcg3EYRW3R0AVN31mQecfU=;
        b=UutQknyx9fDmVoCCnWafN2WWUkvzzHel1aNrLhV9dwK3PnH8qzRX9MOkGvOYFFj9dT
         BHxx7uiuVSRv0PBxz70MPUmLOVyjimlf0LfAdzTZHs68S0SWBrZxLIR0HMXDJuVX4wYM
         QGun0e0mNsrfoGSqkwPNrUr5kJYWJsf7qT98qb70/tpTlcq5n9tNMOFcmAB3rAc5Iezu
         MZhy5Dvu7xpGjYhk9U6xJy2v1+kKA2e2XHgnlisc/0CL2LyZv3VLbqlDRb/zVHtEacOj
         Uj9frnHF1WCQ/scJXd260zlti/Wk5sPeiG0rD3lstUuYbvan33QY6iyTXOp8mk5eQDbb
         1OJw==
X-Gm-Message-State: AC+VfDx/vavaawSHbXiyb517xsjDkaaK49wZiNYW4BlGSJFT77F4G7Mw
	SxLMUor/IqS2lqax8ZLHiQH5tcrhqmEMunXMTZ0=
X-Google-Smtp-Source: ACHHUZ5bgxMhaMdsZAZBRgKGn6iN4OVkEdGkJ9Zf8jCPuLh/yplXLhjdZRnlpkUY7enGjUQvo6WcIQ==
X-Received: by 2002:a17:903:41c4:b0:1a8:1b63:8aee with SMTP id u4-20020a17090341c400b001a81b638aeemr10627557ple.46.1682788864797;
        Sat, 29 Apr 2023 10:21:04 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902d90300b001a6b9c42dbasm15156041plz.88.2023.04.29.10.21.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 10:21:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/13] linux-yocto/5.15: update to v5.15.107
Date: Sat, 29 Apr 2023 07:20:27 -1000
Message-Id: <84efe52ea8b1c28614200683289e589211c35b44.1682788726.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682788726.git.steve@sakoman.com>
References: <cover.1682788726.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Apr 2023 17:21:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180550

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    4fdad925aa1a Linux 5.15.107
    c862d7debe55 bpftool: Print newline before '}' for struct with padding only fields
    1585f3fc24b5 ocfs2: fix freeing uninitialized resource on ocfs2_dlm_shutdown
    b97e4100be37 kbuild: fix single directory build
    326b80bd2267 mm: take a page reference when removing device exclusive entries
    1fc9263ad795 drm/bridge: lt9611: Fix PLL being unable to lock
    4bdf1514b426 mm/swap: fix swap_info_struct race between swapoff and get_swap_pages()
    cbe5f7fed7f7 ring-buffer: Fix race while reader and writer are on the same page
    23ed5af5767a drm/nouveau/disp: Support more modes by checking with lower bpc
    6f2180c5273a drm/panfrost: Fix the panfrost_mmu_map_fault_addr() error path
    a184df0de132 mm: vmalloc: avoid warn_alloc noise caused by fatal signal
    d88d7a9fcf20 ASoC: hdac_hdmi: use set_stream() instead of set_tdm_slots()
    33d5d4e67a0e tracing: Free error logs of tracing instances
    c74065da695e can: isotp: isotp_ops: fix poll() to not report false EPOLLOUT events
    4fe1d9b6231a can: j1939: j1939_tp_tx_dat_new(): fix out-of-bounds memory access
    0af8fae81d8b fs: drop peer group ids under namespace lock
    33a503b7c339 ftrace: Fix issue that 'direct->addr' not restored in modify_ftrace_direct()
    20c5e10950e9 ftrace: Mark get_lock_parent_ip() __always_inline
    a007b7dc19de perf/core: Fix the same task check in perf_event_set_output
    8417eb9aaf1e cifs: sanitize paths in cifs_update_super_prepath.
    df23c702d11c smb3: lower default deferred close timeout to address perf regression
    1d9cad9c5873 smb3: allow deferred close timeout to be configurable
    5e5c5f472972 scsi: iscsi_tcp: Check that sock is valid before iscsi_set_param()
    ae73c4dd48f2 scsi: qla2xxx: Fix memory leak in qla2x00_probe_one()
    c8c17991dab0 iio: adc: ad7791: fix IRQ flags
    bc61cce6a658 coresight-etm4: Fix for() loop drvdata->nr_addr_cmp range bug
    97302eb6ca48 coresight: etm4x: Do not access TRCIDR1 for identification
    fd23e9bbfccc ALSA: hda/realtek: Add quirk for Clevo X370SNW
    f204f38212dc ksmbd: do not call kvmalloc() with __GFP_NORETRY | __GFP_NO_WARN
    091b3e31275b dt-bindings: serial: renesas,scif: Fix 4th IRQ for 4-IRQ SCIFs
    d540aea451ab nilfs2: fix sysfs interface lifetime
    92684e02654c nilfs2: fix potential UAF of struct nilfs_sc_info in nilfs_segctor_thread()
    ba3a88b444cd tty: serial: fsl_lpuart: avoid checking for transfer complete when UARTCTRL_SBK is asserted in lpuart32_tx_empty
    ad142624ccc3 tty: serial: sh-sci: Fix Rx on RZ/G2L SCI
    1184bd5c5ee4 tty: serial: sh-sci: Fix transmit end interrupt handler
    1f49173be32d iio: light: cm32181: Unregister second I2C client if present
    77593b4e963c iio: dac: cio-dac: Fix max DAC write value check for 12-bit
    73742a446e08 iio: adc: ti-ads7950: Set `can_sleep` flag for GPIO chip
    7a1e21d26104 iio: adis16480: select CONFIG_CRC32
    4d3841fe16c4 USB: serial: option: add Quectel RM500U-CN modem
    7151d2af0656 USB: serial: option: add Telit FE990 compositions
    e1aa1c1bc51f usb: typec: altmodes/displayport: Fix configure initial pin assignment
    9cd66aa2fa04 USB: serial: cp210x: add Silicon Labs IFS-USB-DATACABLE IDs
    f8d59e2a36ac usb: dwc3: pci: add support for the Intel Meteor Lake-S
    11453332fa40 usb: cdnsp: Fixes error: uninitialized symbol 'len'
    83637720ea20 xhci: also avoid the XHCI_ZERO_64B_REGS quirk with a passthrough iommu
    1122474b757a usb: xhci: tegra: fix sleep in atomic call
    f5c5934580e7 kbuild: refactor single builds of *.ko
    e62d179b9177 gve: Secure enough bytes in the first TX desc for all TCP pkts
    40c6802d7dae ethtool: reset #lanes when lanes is omitted
    4eada1dabdfb ice: Reset FDIR counter in FDIR init stage
    391d28c0e38c ice: fix wrong fallback logic for FDIR
    e215928a510c NFSD: callback request does not use correct credential for AUTH_SYS
    bbca64f2052e sunrpc: only free unix grouplist after RCU settles
    ca7c3b4ae03e net: stmmac: fix up RX flow hash indirection table when setting channels
    3a997c0d2341 net: ethernet: ti: am65-cpsw: Fix mdio cleanup in probe
    0ae8cdf0153c gpio: davinci: Add irq chip flag to skip set wake
    1c19a42b2863 platform/x86: think-lmi: Clean up display of current_value on Thinkstation
    cccdb30935c8 platform/x86: think-lmi: Fix memory leaks when parsing ThinkStation WMI strings
    b9396d991abe platform/x86: think-lmi: Fix memory leak when showing current settings
    d65ff2fe877c ipv6: Fix an uninit variable access bug in __ip6_make_skb()
    926c8299ac3d net: qrtr: Do not do DEL_SERVER broadcast after DEL_CLIENT
    667eb99cf7c1 sctp: check send stream number after wait_for_sndbuf
    9692e16b5991 net: dsa: mv88e6xxx: Reset mv88e6393x force WD event bit
    5d1007e81fb6 net: don't let netpoll invoke NAPI if in xmit context
    e150a5c9f44c icmp: guard against too small mtu
    a64160124d5a NFSD: Avoid calling OPDESC() with ops->opnum == OP_ILLEGAL
    b9ba5906c420 net: qrtr: Fix a refcount bug in qrtr_recvmsg()
    3ef52e4bcfd7 net: qrtr: combine nameservice into main module
    30c5a016a37a wifi: mac80211: fix invalid drv_sta_pre_rcu_remove calls for non-uploaded sta
    32a8dc8d9ebe KVM: s390: pv: fix external interruption loop not always detected
    fcd6c7476e43 pwm: sprd: Explicitly set .polarity in .get_state()
    a8ab13c73259 pwm: cros-ec: Explicitly set .polarity in .get_state()
    c373e49fbb87 Drivers: vmbus: Check for channel allocation before looking up relids
    b50cd6789dbb gpio: GPIO_REGMAP: select REGMAP instead of depending on it
    0a473f834393 bpf: hash map, avoid deadlock with suitable hash mask
    543d66a54dbf serial: exar: Add support for Sealevel 7xxxC serial cards
    7773bb08e8b6 serial: 8250_exar: derive nr_ports from PCI ID for Acces I/O cards
    c73db89da686 iavf/iavf_main: actually log ->src mask when talking about it
    b2d29830db30 iavf: return errno code instead of status code
    cdf3f5ef1893 platform/x86: int3472/discrete: Ensure the clk/power enable pins are in output mode
    7798cd69cfc3 platform/x86: int3472: Split into 2 drivers
    5cc70e78bbcc RDMA/irdma: Do not request 2-level PBLEs for CQ alloc
    c22ac849aabb NFSD: pass range end to vfs_fsync_range() instead of count
    34a14759d90c NFSD: Fix sparse warning
    8059e200259e ocfs2: fix memory leak in ocfs2_mount_volume()
    b613d8dcdff3 ocfs2: rewrite error handling of ocfs2_fill_super
    05abe9c0bf38 ocfs2: ocfs2_mount_volume does cleanup job before return error

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 214643f386a3e4f226acd25903cde14a2c0a7376)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 32fa7c9c07..de74f3b816 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8f08817edd40a17f6653c1d83334e7ce80d63120"
-SRCREV_meta ?= "c115a945a64f98eed4cf20a90dbf3043e99c97b9"
+SRCREV_machine ?= "17de8839ffeb953a58b32a1d9ef13675864f4f00"
+SRCREV_meta ?= "c0c3836249b3a2fd02ad30ae54637a2bed54107b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.106"
+LINUX_VERSION ?= "5.15.107"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index c511486d23..78d655b110 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.106"
+LINUX_VERSION ?= "5.15.107"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e0157de1c901f48dcdcae0e0ce7ae20798617a5e"
-SRCREV_meta ?= "c115a945a64f98eed4cf20a90dbf3043e99c97b9"
+SRCREV_machine ?= "9f7b6a8032cef0df7e4c4b2e2d185d21924127c5"
+SRCREV_meta ?= "c0c3836249b3a2fd02ad30ae54637a2bed54107b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 3c6aec60b2..5195735f92 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "e65b22cbbc83e9d36e8e1ec344e7774c70e8e570"
-SRCREV_machine:qemuarm64 ?= "b996e66c4b696160d196ff6f5204ea125a39c1e9"
-SRCREV_machine:qemumips ?= "4f6deb38925508846a45bc33de0bf35b4113c946"
-SRCREV_machine:qemuppc ?= "1b715c2fa0c9224df807807695a1048386c5a355"
-SRCREV_machine:qemuriscv64 ?= "686a68a75222a0fadc1f829334596b02534dcb42"
-SRCREV_machine:qemuriscv32 ?= "686a68a75222a0fadc1f829334596b02534dcb42"
-SRCREV_machine:qemux86 ?= "686a68a75222a0fadc1f829334596b02534dcb42"
-SRCREV_machine:qemux86-64 ?= "686a68a75222a0fadc1f829334596b02534dcb42"
-SRCREV_machine:qemumips64 ?= "6465e8e14e57d6725cbee376f3a2cb9361d29688"
-SRCREV_machine ?= "686a68a75222a0fadc1f829334596b02534dcb42"
-SRCREV_meta ?= "c115a945a64f98eed4cf20a90dbf3043e99c97b9"
+SRCREV_machine:qemuarm ?= "cafbf3840cb619fa324fa4222ceec63787409f77"
+SRCREV_machine:qemuarm64 ?= "3ec37a5997470f25ca0a443ad8afee62a3201edc"
+SRCREV_machine:qemumips ?= "e0561aff7c1b9e04452e02cd2e5786525b7ac03b"
+SRCREV_machine:qemuppc ?= "4f3c3cb71e1ac3b1ba29c2d0e5b62f5b8a78e720"
+SRCREV_machine:qemuriscv64 ?= "bbc363b82b92d99e0e29b0d5c9810d2636b54f9e"
+SRCREV_machine:qemuriscv32 ?= "bbc363b82b92d99e0e29b0d5c9810d2636b54f9e"
+SRCREV_machine:qemux86 ?= "bbc363b82b92d99e0e29b0d5c9810d2636b54f9e"
+SRCREV_machine:qemux86-64 ?= "bbc363b82b92d99e0e29b0d5c9810d2636b54f9e"
+SRCREV_machine:qemumips64 ?= "5eba919cd8b3ca2e7ca047e49adf98c344e9998e"
+SRCREV_machine ?= "bbc363b82b92d99e0e29b0d5c9810d2636b54f9e"
+SRCREV_meta ?= "c0c3836249b3a2fd02ad30ae54637a2bed54107b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "d86dfc4d95cd218246b10ca7adf22c8626547599"
+SRCREV_machine:class-devupstream ?= "4fdad925aa1a320c2f32bf956ed29100c7fdc464"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.106"
+LINUX_VERSION ?= "5.15.107"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


