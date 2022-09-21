Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59402ECAAD8
	for <webhook@archiver.kernel.org>; Wed, 21 Sep 2022 20:24:34 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web12.11400.1663791872618541237
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 13:24:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J6K4UNS8;
 spf=pass (domain: gmail.com, ip: 209.85.222.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id s9so4838875qkg.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Sep 2022 13:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=LKFrgTsPvNgLjrkGOoZkaGIAunjwVipG1Hu7FKjEkPc=;
        b=J6K4UNS88W3IIHzmwd8v/hY8PbY8IqaH3DAzW46D52pSurfHjIK4lxJVwl/SOZGm05
         yfDMHdeHYr+R3HPOqVl6ywecX8+uOwJ0q1lg/u+QFXIWCNyh7XigtpZXJeeDPQsO7MvU
         67HUN1rVx4vx7DAqqd2NExym6o9RFW4zrhH6uthY1k4IPr3etUkgs8KkJJj5qtGYJqPy
         0jBWwDiY1lT5GDkG6wAkQOCyF9EwyGQ3DjoaTZM3IMfBU/Efxs/wxPmkkN/lXXFq1MRm
         vgMvzFBlgolv9O765fUKhqNVYw+tLTsNPlOiQdoAoTJZegu6urg1/McaC+6TjOZAFGNh
         NlSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=LKFrgTsPvNgLjrkGOoZkaGIAunjwVipG1Hu7FKjEkPc=;
        b=Fq2EWxGTdzGpDnJYpAnq0cSzvg/tNuEhgwksL5A9LofEHVT7tAzgv5AW52Jkt3LUP+
         iwvOqe/QEL/XHB6aM7jZWI4rhhlwgadC2SmIGd3je8nMZc2gbCdiwEiZLrGHEh1jV9Xt
         U7cO2wfGQijnIJB8EbFHsk7Ikbki56YGaMvFYgRGql2rJcsVW+sPriz9Bevt65r7ISol
         XdnMUGnvRzr3b+FYWyguejMNowc8FPoulh8EOmwef+pdOpUt1KF64tbeMvlJc+6R7wdD
         +gZkohCXzA0ibCfbjD6ojL9gPGTEmdZK9uqgIF79CMnR/TOYDc7qxXGy/vKDi5N0YyLd
         Wc+A==
X-Gm-Message-State: ACrzQf0ulVIE9FazXCiEn00pFHtGwXAWHsJfByYUR0IVcDXhvOivZHZs
	rseL+dWpEn0b9XPWcDRbA1XeSu2VreE=
X-Google-Smtp-Source: 
 AMsMyM6Y08Y1BM4a9yWv5/0ohLENXkXlvZ0vZcxODbj1PxDZcAlBPfeH4qdM25nG2bbqAueNGigyBA==
X-Received: by 2002:a05:620a:1312:b0:6ce:5f1b:b05f with SMTP id
 o18-20020a05620a131200b006ce5f1bb05fmr20693179qkj.360.1663791871404;
        Wed, 21 Sep 2022 13:24:31 -0700 (PDT)
Received: from build.lan
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 w13-20020a05620a444d00b006cbd92ca141sm2569428qkp.133.2022.09.21.13.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 13:24:31 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2][dunfell] linux-yocto/5.4: update to v5.4.213
Date: Wed, 21 Sep 2022 16:24:28 -0400
Message-Id: <20220921202428.28788-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20220921202428.28788-1-bruce.ashfield@gmail.com>
References: <20220921202428.28788-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Sep 2022 20:24:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170959

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    7e17397001a9 Linux 5.4.213
    077041e486fe MIPS: loongson32: ls1c: Fix hang during startup
    4e8d7039cf52 x86/nospec: Fix i386 RSB stuffing
    64f9755b408b sch_sfb: Also store skb len before calling child enqueue
    9d3237b5906c tcp: fix early ETIMEDOUT after spurious non-SACK RTO
    19816a021468 nvme-tcp: fix UAF when detecting digest errors
    a4f0d34580b6 RDMA/mlx5: Set local port to one when accessing counters
    3df71e11a477 ipv6: sr: fix out-of-bounds read when setting HMAC data.
    e7f78835d551 RDMA/siw: Pass a pointer to virt_to_page()
    5332a0945148 i40e: Fix kernel crash during module removal
    d488e2baf2ef tipc: fix shift wrapping bug in map_get()
    279c7668e354 sch_sfb: Don't assume the skb is still around after enqueueing to child
    a2f0ff5beee5 afs: Use the operation issue time instead of the reply time for callbacks
    8077a50c8cce rxrpc: Fix an insufficiently large sglist in rxkad_verify_packet_2()
    36f7b71f8ad8 netfilter: nf_conntrack_irc: Fix forged IP logic
    323b6847e509 netfilter: br_netfilter: Drop dst references before setting.
    367a655f074b RDMA/hns: Fix supported page size
    57b2897ec3ff soc: brcmstb: pm-arm: Fix refcount leak and __iomem leak bugs
    87fe1703bada RDMA/cma: Fix arguments order in net device validation
    d80ad9991198 regulator: core: Clean up on enable failure
    c108e2035151 ARM: dts: imx6qdl-kontron-samx6i: remove duplicated node
    e192a08f6534 smb3: missing inode locks in punch hole
    59c6902a96b4 cgroup: Fix threadgroup_rwsem <-> cpus_read_lock() deadlock
    13d67aadb1c9 cgroup: Elide write-locking threadgroup_rwsem when updating csses on an empty subtree
    059516952cc9 cgroup: Optimize single thread migration
    d0e7be0dc9f2 scsi: lpfc: Add missing destroy_workqueue() in error path
    5682c94644fd scsi: mpt3sas: Fix use-after-free warning
    8d66989b5f7b nvmet: fix a use-after-free
    9fc8c5fa4230 debugfs: add debugfs_lookup_and_remove()
    0d895d2bb120 kprobes: Prohibit probes in gate area
    0492798bf8df ALSA: usb-audio: Fix an out-of-bounds bug in __snd_usb_parse_audio_interface()
    e275cf331824 ALSA: aloop: Fix random zeros in capture data when using jiffies timer
    45321a7d02b7 ALSA: emu10k1: Fix out of bounds access in snd_emu10k1_pcm_channel_alloc()
    adbbc1a8c5ac drm/amdgpu: mmVM_L2_CNTL3 register not initialized correctly
    e1955cdd3122 fbdev: chipsfb: Add missing pci_disable_device() in chipsfb_pci_init()
    fcab25a6b0ac arm64: cacheinfo: Fix incorrect assignment of signed error value to unsigned fw_level
    a3714415c449 parisc: Add runtime check to prevent PA2.0 kernels on PA1.x machines
    dcf54e6cae9e parisc: ccio-dma: Handle kmalloc failure in ccio_init_resources()
    c72d97146fc5 drm/radeon: add a force flush to delay work when radeon
    ae2c6cc8fb21 drm/amdgpu: Check num_gfx_rings for gfx v9_0 rb setup.
    bca46f2295fa drm/gem: Fix GEM handle release errors
    bd2a3bff310e scsi: megaraid_sas: Fix double kfree()
    944f276cbce4 USB: serial: ch341: fix disabled rx timer on older devices
    f0003ab97a07 USB: serial: ch341: fix lost character on LCR updates
    d288c6383a8e usb: dwc3: disable USB core PHY management
    9c670d0bb144 usb: dwc3: fix PHY disable sequence
    9ab0c653ef03 btrfs: harden identification of a stale device
    4e5ba186d9cf drm/i915/glk: ECS Liva Q2 needs GLK HDMI port timing quirk
    3af1316df747 ALSA: seq: Fix data-race at module auto-loading
    4fa63d526c87 ALSA: seq: oss: Fix data-race for max_midi_devs access
    82a86f82bc67 net: mac802154: Fix a condition in the receive path
    d228b897b813 ip: fix triggering of 'icmp redirect'
    66689c5c02ac wifi: mac80211: Don't finalize CSA in IBSS mode if state is disconnected
    1142f04f920c driver core: Don't probe devices after bus_type.match() probe deferral
    bb87fe79bc2c usb: gadget: mass_storage: Fix cdrom data transfers on MAC-OS
    df1875084898 USB: core: Prevent nested device-reset calls
    87b47c7f9f95 s390: fix nospec table alignments
    b604e79fba12 s390/hugetlb: fix prepare_hugepage_range() check for 2 GB hugepages
    33f8f8302473 usb-storage: Add ignore-residue quirk for NXP PN7462AU
    e2e153bb6d69 USB: cdc-acm: Add Icom PMR F3400 support (0c26:0020)
    8ef85884f441 usb: dwc2: fix wrong order of phy_power_on and phy_init
    08f27a242898 usb: typec: altmodes/displayport: correct pin assignment for UFP receptacles
    1abdc68b49c7 USB: serial: option: add support for Cinterion MV32-WA/WB RmNet mode
    3cd8e3448eac USB: serial: option: add Quectel EM060K modem
    b988c14d7c82 USB: serial: option: add support for OPPO R11 diag port
    234fd17306cb USB: serial: cp210x: add Decagon UCA device id
    0143b573612f xhci: Add grace period after xHC start to prevent premature runtime suspend.
    c7e5a90eee5f thunderbolt: Use the actual buffer in tb_async_error()
    cb2684e906f9 gpio: pca953x: Add mutex_lock for regcache sync in PM
    7756eb1ed124 hwmon: (gpio-fan) Fix array out of bounds access
    979fe68b2e39 clk: bcm: rpi: Fix error handling of raspberrypi_fw_get_rate
    389a45dc06dd Input: rk805-pwrkey - fix module autoloading
    1929a5275ecb clk: core: Fix runtime PM sequence in clk_core_unprepare()
    577b32abfd51 Revert "clk: core: Honor CLK_OPS_PARENT_ENABLE for clk gate ops"
    582e87c6bbf2 clk: core: Honor CLK_OPS_PARENT_ENABLE for clk gate ops
    5d4acadcdf26 drm/i915/reg: Fix spelling mistake "Unsupport" -> "Unsupported"
    bc37b0570220 usb: dwc3: qcom: fix use-after-free on runtime-PM wakeup
    30d0901b307f binder: fix UAF of ref->proc caused by race condition
    b30dd08fd5aa USB: serial: ftdi_sio: add Omron CS1W-CIF31 device id
    f8632b8bb53e misc: fastrpc: fix memory corruption on open
    ec186b9f4aa2 misc: fastrpc: fix memory corruption on probe
    0d90ef874966 iio: adc: mcp3911: use correct formula for AD conversion
    d186c65599bf Input: iforce - wake up after clearing IFORCE_XMIT_RUNNING flag
    a6b7e8d97530 tty: serial: lpuart: disable flow control while waiting for the transmit engine to complete
    1cf1930369c9 vt: Clear selection before changing the font
    214877169e5b powerpc: align syscall table for ppc32
    d0aac7146e96 staging: rtl8712: fix use after free bugs
    a65a2a33c6d0 serial: fsl_lpuart: RS485 RTS polariy is inverse
    ae5e8d0baa0a net/smc: Remove redundant refcount increase
    47e679431613 Revert "sch_cake: Return __NET_XMIT_STOLEN when consuming enqueued skb"
    91ecfbcd8dc1 tcp: annotate data-race around challenge_timestamp
    f8a94fdf0288 sch_cake: Return __NET_XMIT_STOLEN when consuming enqueued skb
    0946ff31d1a8 kcm: fix strp_init() order and cleanup
    02986e1bb63e ethernet: rocker: fix sleep in atomic context bug in neigh_timer_handler
    fffa19b5e58c net: sched: tbf: don't call qdisc_put() while holding tree lock
    e1ba258dac0b Revert "xhci: turn off port power in shutdown"
    2dca3c61269b wifi: cfg80211: debugfs: fix return type in ht40allow_map_read()
    bed12d7531df ieee802154/adf7242: defer destroy_workqueue call
    ddc6e823218f iio: adc: mcp3911: make use of the sign bit
    630a97e4da75 platform/x86: pmc_atom: Fix SLP_TYPx bitfield mask
    765497cc748d drm/msm/dsi: Fix number of regulators for msm8996_dsi_cfg
    fced8363b460 drm/msm/dsi: fix the inconsistent indenting
    83b25f9eb243 net: dp83822: disable false carrier interrupt
    007541bc27c2 Revert "mm: kmemleak: take a full lowmem check in kmemleak_*_phys()"
    96f09cd54472 fs: only do a memory barrier for the first set_buffer_uptodate()
    d51e1682faec net: mvpp2: debugfs: fix memory leak when using debugfs_lookup()
    f4c4637a3836 wifi: iwlegacy: 4965: corrected fix for potential off-by-one overflow in il4965_rs_fill_link_cmd()
    8028ff4cdbb3 efi: capsule-loader: Fix use-after-free in efi_capsule_write

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index e87dd0d1b3..1a0e6d7b67 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c556c2548cdba599081f205c0d348ef9cdfbfb2b"
-SRCREV_meta ?= "742e90e101505d9ef997208bad6f615afe2667e8"
+SRCREV_machine ?= "03cd66d9814a26fff4681d3a053654848e519fd6"
+SRCREV_meta ?= "2f18e629f78da51cacf531bed58a83568724a376"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.212"
+LINUX_VERSION ?= "5.4.213"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index fc2c9c17e3..0f71051d0f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.212"
+LINUX_VERSION ?= "5.4.213"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "51e50e76cfccbfb39009601a7c89e7052072c99f"
-SRCREV_machine ?= "391047ed21fe4ffac33e43cb92fa12e92e5d8295"
-SRCREV_meta ?= "742e90e101505d9ef997208bad6f615afe2667e8"
+SRCREV_machine_qemuarm ?= "284fd0f6e11db890ad6cfd246a2c47521db4a05f"
+SRCREV_machine ?= "6d8cf8757864e674bb8f55b6ff68de5e3387d110"
+SRCREV_meta ?= "2f18e629f78da51cacf531bed58a83568724a376"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 337f88ebc4..d60a44e4a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "84a3c56b36218e845c993852034ea4e4c6d42db3"
-SRCREV_machine_qemuarm64 ?= "5d810784589f1ea9ad5ef6ff691416554ffee602"
-SRCREV_machine_qemumips ?= "06badf213e521b91b2dcf20a2bad9fbe473d7c97"
-SRCREV_machine_qemuppc ?= "2d5004f2508564b86f4ebf7016dce08db9d53a8c"
-SRCREV_machine_qemuriscv64 ?= "56c4c8f337cc40e9c04acd03169ab89b260a1899"
-SRCREV_machine_qemux86 ?= "56c4c8f337cc40e9c04acd03169ab89b260a1899"
-SRCREV_machine_qemux86-64 ?= "56c4c8f337cc40e9c04acd03169ab89b260a1899"
-SRCREV_machine_qemumips64 ?= "3219060186d590af2bcb0b65fc0e448fdcbde2cb"
-SRCREV_machine ?= "56c4c8f337cc40e9c04acd03169ab89b260a1899"
-SRCREV_meta ?= "742e90e101505d9ef997208bad6f615afe2667e8"
+SRCREV_machine_qemuarm ?= "bcf3f5cf5f1bcfac1df54a2a9f19c92a49fc7538"
+SRCREV_machine_qemuarm64 ?= "fea87c9d80c7531f85f69fee97cf9500403cef6b"
+SRCREV_machine_qemumips ?= "f1d654a16a5b5a3bbc9288936827628a4a4553a2"
+SRCREV_machine_qemuppc ?= "f6bbc9d216fd3cef1df3ced215b0b22503c48906"
+SRCREV_machine_qemuriscv64 ?= "c0b728020967728840c39994e472db7ed7b727cf"
+SRCREV_machine_qemux86 ?= "c0b728020967728840c39994e472db7ed7b727cf"
+SRCREV_machine_qemux86-64 ?= "c0b728020967728840c39994e472db7ed7b727cf"
+SRCREV_machine_qemumips64 ?= "841245c9bd427e2e7cc786b92cecaf4390e5dd52"
+SRCREV_machine ?= "c0b728020967728840c39994e472db7ed7b727cf"
+SRCREV_meta ?= "2f18e629f78da51cacf531bed58a83568724a376"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.212"
+LINUX_VERSION ?= "5.4.213"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


