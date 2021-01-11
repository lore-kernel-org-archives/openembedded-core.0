Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.27035.1610325973765868835
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Jan 2021 16:46:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=C/yXNhzV;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id g15so11515757pgu.9
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Jan 2021 16:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=o6hl/0VqIxrB2EnfnlrfQUY3nUvAPV0UTI2+Bf77GxE=;
        b=C/yXNhzVGiPc0qiYya694FBPrL3lQnTjmSssHG7DVuJLdOYaFqp7l2MDphjDyR8wES
         AUa7JVr3LSGXJdcVc9bD060IACiBh3ZiYQFdgXHHw4cd62yDjpUgddlSVB/bE3acWCX9
         +YRwn9Zw9kSnSq9emTJWeOxHJvvr9EuZPtnitD8fJIFIVpQr/heT6KSNWjMXalxzSO6I
         7EddWyAKZWsCtcteJPXXWB60xKOKPbLSn5jLnKgJ0qbyOKUTAo6f5r8PI6Ufk7dlROEt
         zqP4XiYB6QGHQgjsCSmowb/4UiBXFFEzlUMQ/omux558WV9axAC873m0EIs7insfg39G
         pOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=o6hl/0VqIxrB2EnfnlrfQUY3nUvAPV0UTI2+Bf77GxE=;
        b=ETipLiVzc8dGq0ic1Xkwithiux2Tk48zwFfKRyy5FhqUI+jyharZS+kYUgRuSjFfAz
         qR3383Qwj0ctNw5jMelJ6xveE8lU6GxHhpGwAVa0ARDvN/Sa/zmo7xDv+DpewVkJVZMp
         FpVwHZf3QHp3mxNivNi6laaZcYGXW6sBM3mHTOFJC/I1TydSF+e0U42cQSdhV/2ndSzJ
         GVyeVZO4p+sJX/epUVQSr74AQu33EVySxK9ylQ0m4s2NVghwZso1Uma3c37YPGYVLILu
         QEf0indDjRvD5+liRm7P1UsofyxtS4oD3VwiFEufZALmxKyXMmP45issraxjiixdrFi6
         /YHA==
X-Gm-Message-State: AOAM532nS9MQe3Z3TrTsuHG84q23vf3SMeEcLBq/F5ZTdTzmWxa/DPtf
	g+tdmRjXxQ1Q/rIap7/Hypf2fasQMG+pDAwn44o=
X-Google-Smtp-Source: ABdhPJzXUvYxIrVFUAKX7BkMMUtuFJzLUt2V4XAiiIEVxgYk9h3HvoXDYeS3ZWBRZqYaJQiOiv23Wg==
X-Received: by 2002:a63:5351:: with SMTP id t17mr17213865pgl.176.1610325972765;
        Sun, 10 Jan 2021 16:46:12 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id v125sm17729079pgv.6.2021.01.10.16.46.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 16:46:12 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 02/12] linux-yocto/5.4: update to v5.4.85
Date: Sun, 10 Jan 2021 14:45:43 -1000
Message-Id: <c9908ddd3c0600376897de588f635c19535a8d22.1610325804.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1610325804.git.steve@sakoman.com>
References: <cover.1610325804.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    19d1c763e849 Linux 5.4.85
    484ac6279ad2 x86/resctrl: Fix incorrect local bandwidth when mba_sc is enabled
    eb3f42cf5e67 x86/resctrl: Remove unused struct mbm_state::chunks_bw
    c4f909407015 membarrier: Explicitly sync remote cores when SYNC_CORE is requested
    a840e37ef800 Revert "selftests/ftrace: check for do_sys_openat2 in user-memory test"
    aa17a20d640d KVM: mmu: Fix SPTE encoding of MMIO generation upper half
    bb07f4c93e62 serial: 8250_omap: Avoid FIFO corruption caused by MDR1 access
    14482dc42c28 ALSA: pcm: oss: Fix potential out-of-bounds shift
    c94a31c19225 USB: sisusbvga: Make console support depend on BROKEN
    4ad8fc6cce01 USB: UAS: introduce a quirk to set no_write_same
    397d0ae4cb90 xhci-pci: Allow host runtime PM as default for Intel Alpine Ridge LP
    32c820e016b4 xhci: Give USB2 ports time to enter U3 in bus suspend
    5828ae0c1920 ALSA: usb-audio: Fix control 'access overflow' errors from chmap
    e72a55ea7168 ALSA: usb-audio: Fix potential out-of-bounds shift
    56339afa39e5 USB: add RESET_RESUME quirk for Snapscan 1212
    52c2ada6fe5e USB: dummy-hcd: Fix uninitialized array use in init()
    497993377bca ktest.pl: If size of log is too big to email, email error message
    a8d28a541500 net: stmmac: delete the eee_ctrl_timer after napi disabled
    ee08543f4598 net: stmmac: dwmac-meson8b: fix mask definition of the m250_sel mux
    5ae78c6926cc net: ll_temac: Fix potential NULL dereference in temac_probe()
    717a140a3635 net/mlx4_en: Handle TX error CQE
    d0363dcabbd1 lan743x: fix for potential NULL pointer dereference with bare card
    d4107a0f8802 net/mlx4_en: Avoid scheduling restart task if it is already running
    add880d788f0 tcp: fix cwnd-limited bug for TSO deferral where we send nothing
    5189c070a0d7 tcp: select sane initial rcvq_space.space for big MSS
    318d90218b21 net: stmmac: free tx skb buffer in stmmac_resume()
    d8d39e13668a bridge: Fix a deadlock when enabling multicast snooping
    cb327f83cf5e enetc: Fix reporting of h/w packet counters
    408c8213ee97 udp: fix the proto value passed to ip_protocol_deliver_rcu for the segments
    f7a756fc7cb9 net: hns3: remove a misused pragma packed
    2ef23e860e76 vrf: packets with lladdr src needs dst at input with orig_iif when needs strict
    cae90bd22cff net: bridge: vlan: fix error return code in __vlan_add()
    2e6a15b0b3d4 mac80211: mesh: fix mesh_pathtbl_init() error path
    1fe6b822b335 ipv4: fix error return code in rtm_to_fib_config()
    8b4f08f28015 ptrace: Prevent kernel-infoleak in ptrace_get_syscall_info()
    8a866bdbbac2 Linux 5.4.84
    c2c5dc84ac51 compiler.h: fix barrier_data() on clang
    69dc72f058c9 mm/zsmalloc.c: drop ZSMALLOC_PGTABLE_MAPPING
    3349f1e4cf6d x86/apic/vector: Fix ordering in vector assignment
    e3c1d51868f3 x86/membarrier: Get rid of a dubious optimization
    6346ed69bc7c x86/mm/mem_encrypt: Fix definition of PMD_FLAGS_DEC_WP
    258d646f006b scsi: be2iscsi: Revert "Fix a theoretical leak in beiscsi_create_eqs()"
    7d5fc53439a1 proc: use untagged_addr() for pagemap_read addresses
    6472d3ae6ef5 kbuild: avoid static_assert for genksyms
    0cd7084a2a03 drm/i915/display/dp: Compute the correct slice count for VDSC on DP
    60c1c68fae5e mmc: block: Fixup condition for CMD13 polling for RPMB requests
    974aa59837ed pinctrl: amd: remove debounce filter setting in IRQ type setting
    457f5289b7e7 Input: i8042 - add Acer laptops to the i8042 reset list
    cf596f3906e9 Input: cm109 - do not stomp on control URB
    d2d113aca34f ktest.pl: Fix incorrect reboot for grub2bls
    181088e37b1d can: m_can: m_can_dev_setup(): add support for bosch mcan version 3.3.0
    38b1dbc1229c platform/x86: touchscreen_dmi: Add info for the Irbis TW118 tablet
    2fa99f6f8f60 platform/x86: intel-vbtn: Support for tablet mode on HP Pavilion 13 x360 PC
    21aa2d1f2bfb platform/x86: acer-wmi: add automatic keyboard background light toggle key as KEY_LIGHTS_TOGGLE
    010e6e816f54 platform/x86: thinkpad_acpi: Add BAT1 is primary battery quirk for Thinkpad Yoga 11e 4th gen
    4778a11e0500 platform/x86: thinkpad_acpi: Do not report SW_TABLET_MODE on Yoga 11e
    eb5e28ffe39a arm64: tegra: Disable the ACONNECT for Jetson TX2
    c7e271337402 soc: fsl: dpio: Get the cpumask through cpumask_of(cpu)
    37aa8318ed43 spi: spi-nxp-fspi: fix fspi panic by unexpected interrupts
    864fbeab8c99 irqchip/gic-v3-its: Unconditionally save/restore the ITS state on suspend
    47fac0ccf775 ibmvnic: skip tx timeout reset while in resetting
    c0450df6d0f7 interconnect: qcom: qcs404: Remove GPU and display RPM IDs
    adad2bc9f303 scsi: ufs: Make sure clk scaling happens only when HBA is runtime ACTIVE
    b184e9800867 ARC: stack unwinding: don't assume non-current task is sleeping
    8ed74a012206 arm64: dts: broadcom: clear the warnings caused by empty dma-ranges
    acac3f7d7d22 powerpc: Drop -me200 addition to build flags
    8012a30b9e16 iwlwifi: mvm: fix kernel panic in case of assert during CSA
    c90527770b88 iwlwifi: pcie: set LTR to avoid completion timeout
    d411a07d6c04 arm64: dts: rockchip: Assign a fixed index to mmc devices on rk3399 boards.
    0e6cae4e8181 iwlwifi: pcie: limit memory read spin time
    591afbc97c18 x86/lib: Change .weak to SYM_FUNC_START_WEAK for arch/x86/lib/mem*_64.S
    018b05e0f05b Kbuild: do not emit debug info for assembly with LLVM_IAS=1

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
(cherry picked from commit 3dd19af60e5e4059ce7c7a67ff16fba1cb00de80)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 451a088f84..5d2b2d14bf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7bc8ae3fc04fdc06192d39d725cb18d4c0b78d9f"
-SRCREV_meta ?= "a1b2d188bdfc855ff9dff770480a24cecf66285d"
+SRCREV_machine ?= "baf3ccf7c7cfaf9515d8c8b3b639d7bbb0564594"
+SRCREV_meta ?= "1c358e19696827b594de26a221f110fc2647dfa8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.83"
+LINUX_VERSION ?= "5.4.85"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 0d29f8f63c..fea9ae26c1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.83"
+LINUX_VERSION ?= "5.4.85"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "2b6db4fbe53a1986c0249bc663d8ce7d99cbf19c"
-SRCREV_machine ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
-SRCREV_meta ?= "a1b2d188bdfc855ff9dff770480a24cecf66285d"
+SRCREV_machine_qemuarm ?= "f7f4bcebdd599197cde6f1d1985cb1ef1f3e8a54"
+SRCREV_machine ?= "4f2b484a791fac88262922aa26ddd5ac3df9720f"
+SRCREV_meta ?= "1c358e19696827b594de26a221f110fc2647dfa8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 330744969c..9ed1811098 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "78231a4abb434782470d272690b7792b7dc1c1c6"
-SRCREV_machine_qemuarm64 ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
-SRCREV_machine_qemumips ?= "adca343488d22623848ba206071cc0fa67b79b6a"
-SRCREV_machine_qemuppc ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
-SRCREV_machine_qemuriscv64 ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
-SRCREV_machine_qemux86 ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
-SRCREV_machine_qemux86-64 ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
-SRCREV_machine_qemumips64 ?= "75c7340de480587c3a6650b46be7b1a2f71501a9"
-SRCREV_machine ?= "21f1b92bddf5f6678f2c28da8d1a8a8160e39cf1"
-SRCREV_meta ?= "a1b2d188bdfc855ff9dff770480a24cecf66285d"
+SRCREV_machine_qemuarm ?= "888fe3a6f7776f5732c3c4cf4c862447e646c25e"
+SRCREV_machine_qemuarm64 ?= "4f2b484a791fac88262922aa26ddd5ac3df9720f"
+SRCREV_machine_qemumips ?= "459ad51fb16465be3d291217a10bcb9d055f5775"
+SRCREV_machine_qemuppc ?= "4f2b484a791fac88262922aa26ddd5ac3df9720f"
+SRCREV_machine_qemuriscv64 ?= "4f2b484a791fac88262922aa26ddd5ac3df9720f"
+SRCREV_machine_qemux86 ?= "4f2b484a791fac88262922aa26ddd5ac3df9720f"
+SRCREV_machine_qemux86-64 ?= "4f2b484a791fac88262922aa26ddd5ac3df9720f"
+SRCREV_machine_qemumips64 ?= "7eff01977ef77715ebc3e5a126534c39fe4ac918"
+SRCREV_machine ?= "4f2b484a791fac88262922aa26ddd5ac3df9720f"
+SRCREV_meta ?= "1c358e19696827b594de26a221f110fc2647dfa8"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.83"
+LINUX_VERSION ?= "5.4.85"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1

