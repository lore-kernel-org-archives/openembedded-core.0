Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.1853.1602011087684408316
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 12:04:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q1nKLCYK;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id de3so4041068qvb.5
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Oct 2020 12:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HZq/c9quICxC/wP3lf6NcmiAs/+azISqts9uyHZYLLA=;
        b=q1nKLCYKltxLbP0wM9g051dMa7m/ioMHDG7hUCq50C+k7Y20GlLb/YYQJ1e0Uc+GQQ
         rAJ9yr+I40BTi5bmbBpHQbuwY8H54hpFtQgZ1HDyNGI8TJVomJNyJ1NE51ZKAOahPxv5
         8hYXw4SJ+r/cyGjHul2X6YJeYtqC0irXjJn4oyRrEwUkAUJhib1y8OUk9OwtvpTYNXb6
         PV7QQvqKg7J2RWbyMM3yYhMpv98FZpQ+5PWoaLXHl7YO3M7dZIWiaOMnlSeMaM7bf+AK
         KRPBT1jOoAx/6E0dkgeHWhI4RFDGhvgCdH48iJGJVk/nfoWZ7wvo0RGmLMxsRghiA8sn
         mFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HZq/c9quICxC/wP3lf6NcmiAs/+azISqts9uyHZYLLA=;
        b=qYDhnXWnHWEPvOguUCYjW2hYu/LJwsrfed7E1UIQwk1isHSYD5pXNoAN924dwEPcdv
         qzeSsAaxFvrdAi+tdFAuYkBd14XgS3oJ14yXgPy09NEHvy5F4JXMsmVAxc5QZkge/p46
         G9Fn+XU9nD86oNXuIasCNTH34wKdDzO2iv4fmVJJRpS2d73n4dCm5X152GHTkCej9aEi
         Z0AeEsuWvhk5q1zOvXalh87EL3xri0vYm5plX0jy7FTs7OUg+Ed4Qas7Mun3Lnk39Ojq
         GnwncZM4sa6kSihYzLiVBKE8RNjCMsPF/WV/0VpMLtzHVw8J5kkTw0iHM9Grbw50sdOZ
         Ix5Q==
X-Gm-Message-State: AOAM532h17jtAdCvYqNJ3442a4jukygELLfMGq4FooRa9q70D7jSE60B
	h5bCeGF02wa6p36qNwuXNjk=
X-Google-Smtp-Source: ABdhPJwnB6KOX1qVJXjYzpm+znAB64ZlxNQdzZpzysiMN9LceNicg92/w3nuCCMySsht+ODV0NJweA==
X-Received: by 2002:a0c:aee0:: with SMTP id n32mr6091850qvd.7.1602011086603;
        Tue, 06 Oct 2020 12:04:46 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id q19sm606604qtj.72.2020.10.06.12.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 12:04:45 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto/5.8: update to v5.8.13
Date: Tue,  6 Oct 2020 15:04:34 -0400
Message-Id: <b11c2eebc30981b4dff93e0d513c36660ce97898.1602010969.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1602010968.git.bruce.ashfield@gmail.com>
References: <cover.1602010968.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.8 to the latest korg -stable release that comprises
the following commits:

    cdcec6869074 Linux 5.8.13
    510c51ff61e3 clocksource/drivers/timer-ti-dm: Do reset before enable
    af56dabe31d1 dm: fix bio splitting and its bio completion order for regular IO
    8b76d62a9986 KVM: arm64: Assume write fault on S1PTW permission fault on instruction fetch
    3bd50397031b io_uring: ensure open/openat2 name is cleaned on cancelation
    4545633b037b s390/zcrypt: Fix ZCRYPT_PERDEV_REQCNT ioctl
    862f8bb32f4f mm: don't rely on system state to detect hot-plug operations
    b8fdce317826 mm: replace memmap_context by meminit_context
    2a4b8662dd4f mm/gup: fix gup_fast with dynamic page table folding
    488b66f91a2d mm, THP, swap: fix allocating cluster for swapfile by mistake
    3907be9020ee dmabuf: fix NULL pointer dereference in dma_buf_release()
    22dd2387ee81 MIPS: Loongson2ef: Disable Loongson MMI instructions
    464b2d4cba99 media: cec-adap.c: don't use flush_scheduled_work()
    d242377a12af btrfs: fix overflow when copying corrupt csums for a message
    22ee6b8fda41 btrfs: fix put of uninitialized kobject after seed device delete
    913d4c0dcdba kprobes: tracing/kprobes: Fix to kill kprobes on initmem after boot
    247c62ebdfae kprobes: Fix to check probe enabled before disarm_kprobe_ftrace()
    a1ab267999b8 lib/bootconfig: Fix to remove tailing spaces after value
    dce326c2b35b lib/bootconfig: Fix a bug of breaking existing tree nodes
    6540544b78f8 mt76: mt7615: use v1 MCU API on MT7615 to fix issues with adding/removing stations
    f176cd6084b2 s390/dasd: Fix zero write for FBA devices
    e3a23511638a tracing: fix double free
    c321af82cae2 lib/string.c: implement stpcpy
    3396e0ad33da ALSA: hda/realtek: Enable front panel headset LED on Lenovo ThinkStation P520
    ad0643252831 ALSA: hda/realtek - Couldn't detect Mic if booting with headset plugged
    7a08dbd8764c ALSA: usb-audio: Add delay quirk for H570e USB headsets
    fdf44bc9f55d scsi: lpfc: Fix initial FLOGI failure due to BBSCN not supported
    ade8f2c5ff7a x86/ioapic: Unbreak check_timer()
    e45e8ddf3cfc x86/irq: Make run_on_irqstack_cond() typesafe
    ba1c60853057 arch/x86/lib/usercopy_64.c: fix __copy_user_flushcache() cache writeback
    9d6bd4901bbd mm: validate pmd after splitting
    15f6c3869c6c KVM: SVM: Add a dedicated INVD intercept routine
    ef4f69a46824 KVM: x86: Reset MMU context if guest toggles CR4.SMAP or CR4.PKE
    8a8354700cb2 spi: bcm-qspi: Fix probe regression on iProc platforms
    fce9400de340 regulator: axp20x: fix LDO2/4 description
    2f24ab64b8cc MIPS: Add the missing 'CPU_1074K' into __get_cpu_type()
    7b7b64dda978 PM / devfreq: tegra30: Disable clock on error in probe
    324f8ff1e09b MIPS: Loongson-3: Fix fp register access if MSA enabled
    482082d22a41 net/mlx5e: mlx5e_fec_in_caps() returns a boolean
    93e864762dcb regmap: fix page selection for noinc writes
    de74a520081f regmap: fix page selection for noinc reads
    2e00a8682cb5 SUNRPC: Fix svc_flush_dcache()
    96c45a01f443 io_uring: fix openat/openat2 unified prep handling
    21aaa0fc9b94 ALSA: asihpi: fix iounmap in error handler
    0c9fadf3a3c2 mac80211: fix 80 MHz association to 160/80+80 AP on 6 GHz
    7c094f2da8be cfg80211: fix 6 GHz channel conversion
    3414cdb97ce1 mac80211: do not disable HE if HT is missing on 2.4 GHz
    a8241c165aea lib80211: fix unmet direct dependendices config warning when !CRYPTO
    bf75119ad09d bpf: Fix a rcu warning for bpffs map pretty-print
    5ed1d040d0cc batman-adv: mcast: fix duplicate mcast packets from BLA backbone to mesh
    5ae4340c6782 batman-adv: mcast: fix duplicate mcast packets in BLA backbone from mesh
    c7f13870d54a batman-adv: mcast: fix duplicate mcast packets in BLA backbone from LAN
    06dd1ca3b637 nvme-tcp: fix kconfig dependency warning when !CRYPTO
    a9bc6ff7d24a xsk: Fix number of pinned pages/umem size discrepancy
    e4e1b0f1fdea batman-adv: Add missing include for in_interrupt()
    38c2ce543647 RDMA/core: Fix ordering of CQ pool destruction
    9003be1fb4d0 spi: spi-fsl-dspi: use XSPI mode instead of DMA for DPAA2 SoCs
    a634ff2bb06a hv_netvsc: Switch the data path at the right time during hibernation
    086ca81d03c3 drm/sun4i: sun8i-csc: Secondary CSC register correction
    1fc50966df11 igc: Fix not considering the TX delay for timestamps
    df1aefc64878 igc: Fix wrong timestamp latency numbers
    60b4cd514ca4 net: qed: RDMA personality shouldn't fail VF load
    1c89c047143e net: qede: Disable aRFS for NPAR and 100G
    0f5479c614a4 net: qed: Disable aRFS for NPAR and 100G
    c0560d7cfa3c drm/vc4/vc4_hdmi: fill ASoC card owner
    3305c8444ee9 tools/libbpf: Avoid counting local symbols in ABI check
    c86dff4cd392 bpf: Fix clobbering of r2 in bpf_gen_ld_abs
    36133c2c75f4 mac802154: tx: fix use-after-free
    d5bc41a812ee netfilter: nft_meta: use socket user_ns to retrieve skuid and skgid
    b47342e6341d netfilter: conntrack: nf_conncount_init is failing with IPv6 disabled
    e38f49e00baf netfilter: ctnetlink: fix mark based dump filtering regression
    24c4f2ae019b netfilter: ctnetlink: add a range check for l3/l4 protonum
    e49aff08701c batman-adv: mcast/TT: fix wrongly dropped or rerouted packets
    27f214ea565b atm: eni: fix the missed pci_disable_device() for eni_init_one()
    c50fd3ecb3f7 libbpf: Fix build failure from uninitialized variable warning
    a5307da48a93 batman-adv: bla: fix type misuse for backbone_gw hash indexing
    120333e77b20 mwifiex: Increase AES key storage size to 256 bits
    ab7eeefd46b5 clocksource/drivers/h8300_timer8: Fix wrong return value in h8300_8timer_init()
    bdcc262d50da ieee802154/adf7242: check status of adf7242_read_reg
    59a84157c5a5 ieee802154: fix one possible memleak in ca8210_dev_com_init
    9a04354bdb3a riscv: Fix Kendryte K210 device tree
    b05a20baaa2f i2c: mediatek: Send i2c master code at more than 1MHz
    337e96e14843 objtool: Fix noreturn detection for ignored functions
    953fc770d069 i2c: core: Call i2c_acpi_install_space_handler() before i2c_acpi_register_devices()
    55e8cc72415c drm/amd/display: Don't log hdcp module warnings in dmesg
    a42f8e6ba427 drm/amdgpu/dc: Require primary plane to be enabled whenever the CRTC is
    5535013c64fb drm/amd/display: update nv1x stutter latencies
    d3adac3cfbdb drm/amd/display: Don't use DRM_ERROR() for DTM add topology
    8f85ebcc0e9d drm/amdkfd: fix a memory leak issue
    3f9f1a29290c EDAC/ghes: Check whether the driver is on the safe list correctly
    3c98a2f74a07 lockdep: fix order in trace_hardirqs_off_caller()
    8cf6f7188ad2 s390/init: add missing __init annotations
    b7b5742eb70b i2c: aspeed: Mask IRQ status to relevant bits
    af5681dfa0aa RISC-V: Take text_mutex in ftrace_init_nop()
    5a73735ee5b2 clk: versatile: Add of_node_put() before return statement
    39f785132eee ASoC: Intel: bytcr_rt5640: Add quirk for MPMAN Converter9 2-in-1
    700fefbe8c67 ASoC: wm8994: Ensure the device is resumed in wm89xx_mic_detect functions
    2e1e2b748af2 ASoC: wm8994: Skip setting of the WM8994_MICBIAS register for WM1811
    ad22ff03adc6 ASoC: pcm3168a: ignore 0 Hz settings
    0b2f403ff302 device_cgroup: Fix RCU list debugging warning

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.8.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index 9f05701c83..3d6d750c86 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "24e4d6489a5e552339cf9318bcaa06a546bdfde1"
-SRCREV_meta ?= "1e2680147ee76ca61b252f6d72060322a7bd0564"
+SRCREV_machine ?= "5981001bf03f0d0c1cf641a2287ab6368baf628a"
+SRCREV_meta ?= "34775c20bc4f4ac32ac7eded79f9dc8ca77e4277"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.8.12"
+LINUX_VERSION ?= "5.8.13"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 4376cfeea0..764264f637 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.8.12"
+LINUX_VERSION ?= "5.8.13"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "a8bcb5d14b88693c25688993de78421bbd36ae93"
-SRCREV_machine ?= "24e4d6489a5e552339cf9318bcaa06a546bdfde1"
-SRCREV_meta ?= "1e2680147ee76ca61b252f6d72060322a7bd0564"
+SRCREV_machine_qemuarm ?= "627cc1717f47c4d9bc9d58f88b1764990d982a99"
+SRCREV_machine ?= "5981001bf03f0d0c1cf641a2287ab6368baf628a"
+SRCREV_meta ?= "34775c20bc4f4ac32ac7eded79f9dc8ca77e4277"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index 51506ffa49..f80ae2359b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.8/standard/base"
 KBRANCH_qemux86-64 ?= "v5.8/standard/base"
 KBRANCH_qemumips64 ?= "v5.8/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ff081e4197575b15a59e24695c306fca8cbdee19"
-SRCREV_machine_qemuarm64 ?= "24e4d6489a5e552339cf9318bcaa06a546bdfde1"
-SRCREV_machine_qemumips ?= "c20c585e0dafe9346e32c528d31151b14e352753"
-SRCREV_machine_qemuppc ?= "24e4d6489a5e552339cf9318bcaa06a546bdfde1"
-SRCREV_machine_qemuriscv64 ?= "24e4d6489a5e552339cf9318bcaa06a546bdfde1"
-SRCREV_machine_qemux86 ?= "24e4d6489a5e552339cf9318bcaa06a546bdfde1"
-SRCREV_machine_qemux86-64 ?= "24e4d6489a5e552339cf9318bcaa06a546bdfde1"
-SRCREV_machine_qemumips64 ?= "23d67f72236c159d4a0d36bedac900883690005e"
-SRCREV_machine ?= "24e4d6489a5e552339cf9318bcaa06a546bdfde1"
-SRCREV_meta ?= "1e2680147ee76ca61b252f6d72060322a7bd0564"
+SRCREV_machine_qemuarm ?= "41542e01d0deb5a38c190809f4fd01a442769938"
+SRCREV_machine_qemuarm64 ?= "5981001bf03f0d0c1cf641a2287ab6368baf628a"
+SRCREV_machine_qemumips ?= "36e642d5b6c5b1d05f6172a75df172ad8fefc30b"
+SRCREV_machine_qemuppc ?= "5981001bf03f0d0c1cf641a2287ab6368baf628a"
+SRCREV_machine_qemuriscv64 ?= "5981001bf03f0d0c1cf641a2287ab6368baf628a"
+SRCREV_machine_qemux86 ?= "5981001bf03f0d0c1cf641a2287ab6368baf628a"
+SRCREV_machine_qemux86-64 ?= "5981001bf03f0d0c1cf641a2287ab6368baf628a"
+SRCREV_machine_qemumips64 ?= "5538a54afd2525803729c85a40609cae292cb242"
+SRCREV_machine ?= "5981001bf03f0d0c1cf641a2287ab6368baf628a"
+SRCREV_meta ?= "34775c20bc4f4ac32ac7eded79f9dc8ca77e4277"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.8.12"
+LINUX_VERSION ?= "5.8.13"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

