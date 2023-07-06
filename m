Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2B2EB64DD
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:07:10 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.26504.1688656021464743573
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Jul 2023 08:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=hbX7eMEl;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1b8062c1ee1so4923685ad.3
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688656020; x=1691248020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/8A9eaJv4hYrLX9MU2lOL3k3KcXhog1FwIu4oL+gDY=;
        b=hbX7eMElxgVaq2126tLtKwBXW1AN5xoAxke715e4KljUiw1jmLbJjTVUq+IjC2g8qx
         /UvYIsJ6uZXD3utwBLLxmCHkuv2Dnn7VTGbi8T98/Vg1dMj2ozOn2xI2kaktJ7bmUGbU
         jBXmVuBuogiC9HBmLyRovG/OSJA9HDDs+0IdiRAY+8sMkKYFlPMNZZ0XOV+Fnx+SAICa
         wum3wkKztfx0coXo0968psf6BVdgh6OcphXc7nzy8Yrj/xyiPFn1aahfLwUBmsU//wkG
         2NSnKAO6DjLGZrOvDjNDryEgnT+usTewxOsMSFjmyBh3RaQX9erhyXfHakr9wIlaySsR
         zhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688656020; x=1691248020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/8A9eaJv4hYrLX9MU2lOL3k3KcXhog1FwIu4oL+gDY=;
        b=IegeiwUyIaY0to2vmm7feauNJ/cccudBvbAmhM33MF2pPjPHO5N8+A35Kkt/3xyDc/
         c5OMaR6LRMEx+nrUB63Bh/xPSjEzBpGVOQKsVcGOhRoMUEA6rvjNSMK9d5viI3Ai3Jhi
         FQKfOKs0k1kc8BzKiPm3UA9MlzRQX6MgPN6PL6eEAiZjTbLImbPwip3ZNTpWNef+9lgd
         2cpYMT7lbWAnYBIi8Dt1BGwxTAF+W+pvAzXR7XAB9a+EwJL5D/tyND98Bver+yUGpvNf
         4ZV7xb6s8c4iSR8c8NCzI8eaahqQb+SisQOm9J/z1alNBnelvxyEFIdFKytkHhQVlWqu
         Kekw==
X-Gm-Message-State: ABy/qLYLIlHhH7LCGalX4mPXQCuz7EbPTQ42VQo48t36YHYXfywAZjvG
	qy2s4Z40gHXG2XlH+mNQHVtV3BaFlGAubXSgu3s=
X-Google-Smtp-Source: APBJJlGoofggP/xnk/GLm3jedsyHUayNFtq2dugl5WYxuZliaiGWsmlEyf0GV0zogOeY/7Yhis1vZA==
X-Received: by 2002:a17:902:a510:b0:1b8:b768:8bf4 with SMTP id s16-20020a170902a51000b001b8b7688bf4mr2174819plq.19.1688656020400;
        Thu, 06 Jul 2023 08:07:00 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jj7-20020a170903048700b001b3df3ae3f8sm1534159plb.281.2023.07.06.08.06.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:06:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 10/28] linux-yocto/5.15: update to v5.15.117
Date: Thu,  6 Jul 2023 05:06:13 -1000
Message-Id: <79a6eb479bee6caabf22e3ed9e8b2793bdde836c.1688655871.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688655871.git.steve@sakoman.com>
References: <cover.1688655871.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Jul 2023 15:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183963

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    471e639e59d1 Linux 5.15.117
    ef876dd25830 Revert "staging: rtl8192e: Replace macro RTL_PCI_DEVICE with PCI_DEVICE"
    6cfe9ddb6aa6 xfs: verify buffer contents when we skip log replay
    b5a52009d90e Revert "debugobject: Ensure pool refill (again)"
    3cc6805547d5 ext4: only check dquot_initialize_needed() when debugging
    86ebb5b5344d Revert "ext4: don't clear SB_RDONLY when remounting r/w until quota is re-enabled"
    9945284195a9 vhost_vdpa: support PACKED when setting-getting vring_base
    17882a3556ce vhost: support PACKED when setting-getting vring_base
    d18688ff423a vduse: avoid empty string for dev name
    952d1e4cbc26 riscv: fix kprobe __user string arg print fault issue
    62958e78b757 eeprom: at24: also select REGMAP
    66b99b3bd7b1 i2c: sprd: Delete i2c adapter in .remove's error path
    58648a533a89 firmware: arm_ffa: Set handle field to zero in memory descriptor
    e1ab7ed7925d i2c: mv64xxx: Fix reading invalid status value in atomic mode
    003421fc430c arm64: dts: imx8mn-beacon: Fix SPI CS pinmux
    2a4f0ad59d3d ASoC: mediatek: mt8195: fix use-after-free in driver remove path
    cc4a2c0b1efa ASoC: mediatek: mt8195-afe-pcm: Convert to platform remove callback returning void
    036bba96bf5e arm64: dts: imx8-ss-dma: assign default clock rate for lpuarts
    d97c8306a9af arm64: dts: imx8qm-mek: correct GPIOs for USDHC2 CD and WP signals
    2212344664fb arm64: dts: qcom: sc7180-lite: Fix SDRAM freq for misidentified sc7180-lite boards
    c589ba11da5a ASoC: codecs: wsa881x: do not set can_multi_write flag
    980011869a2a ARM: dts: at91: sama7g5ek: fix debounce delay property for shdwc
    ac817e26f9df usb: usbfs: Use consistent mmap functions
    35d9f521bcc8 usb: usbfs: Enforce page requirements for mmap
    64e4a3b25338 pinctrl: meson-axg: add missing GPIOA_18 gpio group
    4124536ad924 rbd: get snapshot context after exclusive lock is ensured to be held
    1af3b16b6240 rbd: move RBD_OBJ_FLAG_COPYUP_ENABLED flag setting
    2326488a9648 tee: amdtee: Add return_origin to 'struct tee_cmd_load_ta'
    0a8e5a6166dc Bluetooth: hci_qca: fix debugfs registration
    2a7e918e2280 Bluetooth: Fix use-after-free in hci_remove_ltk/hci_remove_irk
    36482bf16fde s390/dasd: Use correct lock while counting channel queue length
    fd03b5575c8a ceph: fix use-after-free bug for inodes when flushing capsnaps
    e022640b1fee can: j1939: avoid possible use-after-free when j1939_can_rx_register fails
    67eb5a5153ab can: j1939: change j1939_netdev_lock type to mutex
    e2a6db7cab74 can: j1939: j1939_sk_send_loop_abort(): improved error queue handling in J1939 Socket
    4ce28f3ab368 drm/amd/pm: Fix power context allocation in SMU13
    2984dbacf68e drm/amdgpu: fix xclk freq on CHIP_STONEY
    77558dd16502 drm/amd/pm: conditionally disable pcie lane switching for some sienna_cichlid SKUs
    4b1bf594604c drm/i915/gt: Use the correct error value when kernel_context() fails
    17c01feed6ba ALSA: hda/realtek: Add Lenovo P3 Tower platform
    800e4c5b36bb ALSA: hda/realtek: Add a quirk for HP Slim Desktop S01
    9dab648ccd01 ALSA: hda/realtek: Add quirk for Clevo NS50AU
    cd67fdd3cc1b Input: fix open count when closing inhibited device
    2545d1b4d14f Input: psmouse - fix OOB access in Elantech protocol
    ed263c550fbd Input: xpad - delete a Razer DeathAdder mouse VID/PID entry
    5db4229b1427 batman-adv: Broken sync while rescheduling delayed work
    aedad6c7fbaf bnxt_en: Implement .set_port / .unset_port UDP tunnel callbacks
    a94401de2bc2 bnxt_en: Query default VLAN before VNIC setup on a VF
    cf0a3e94674d bnxt_en: Don't issue AP reset during ethtool's reset operation
    40d074f7e490 lib: cpu_rmap: Fix potential use-after-free in irq_cpu_rmap_release()
    b6b1799c37c3 bpf: Add extra path pointer check to d_path helper
    a242c6a92ce6 net: sched: fix possible refcount leak in tc_chain_tmplt_add()
    d7c69f7b8383 net: sched: act_police: fix sparse errors in tcf_police_dump()
    e7e0f9497421 net: sched: move rtm_tca_policy declaration to include file
    c5e0a2f49c5a drm/i915/selftests: Add some missing error propagation
    234f0337b439 drm/i915/selftests: Stop using kthread_stop()
    1f942073e164 drm/i915/selftests: Increase timeout for live_parallel_switch
    3604ab1519ef rfs: annotate lockless accesses to RFS sock flow table
    2501f5a95511 rfs: annotate lockless accesses to sk->sk_rxhash
    dd5296e3b21b ipv6: rpl: Fix Route of Death.
    eab6cda0bfd7 netfilter: ipset: Add schedule point in call_ad().
    7b053b2e8c96 netfilter: conntrack: fix NULL pointer dereference in nf_confirm_cthelper
    34d67ecf3dcc selftests/bpf: Fix sockopt_sk selftest
    01363bf8efe5 selftests/bpf: Verify optval=NULL case
    7e74801e1bfb wifi: cfg80211: fix locking in sched scan stop work
    6c25c96a4634 qed/qede: Fix scheduling while atomic
    668c3f9514f0 Bluetooth: L2CAP: Add missing checks for invalid DCID
    53c056ccda02 Bluetooth: Fix l2cap_disconnect_req deadlock
    c16e79e27e90 drm/i915: Use 18 fast wake AUX sync len
    567873901a92 drm/i915: Explain the magic numbers for AUX SYNC/precharge length
    dd40bcc357fe net/sched: fq_pie: ensure reasonable TCA_FQ_PIE_QUANTUM values
    9d66ffd8ac9e net: enetc: correct the statistics of rx bytes
    8db1acf2b131 net/smc: Avoid to access invalid RMBs' MRs in SMCRv1 ADD LINK CONT
    9b001a7d1e1a net/ipv6: fix bool/int mismatch for skip_notify_on_dev_down
    c85bee3a4ae1 bpf: Fix UAF in task local storage
    54c8aea7e888 net: dsa: lan9303: allow vid != 0 in port_fdb_{add|del} methods
    ab0eca3f5455 neighbour: fix unaligned access to pneigh_entry
    bdcc42186dd9 wifi: mt76: mt7615: fix possible race in mt7615_mac_sta_poll
    7b0c76354a6a afs: Fix setting of mtime when creating a file/dir/symlink
    8ef72e783065 spi: qup: Request DMA before enabling clocks
    f0e84db82ed3 platform/surface: aggregator: Allow completion work-items to be executed in parallel
    547da248321a blk-iocost: avoid 64-bit division in ioc_timer_fn
    3b07425c3dea f2fs: fix iostat lock protection
    b85fb01a761a bonding (gcc13): synchronize bond_{a,t}lb_xmit() types
    0dfc81a283d4 i40e: fix build warning in ice_fltr_add_mac_to_list()
    2e12542c19c2 i40e: use int for i40e_status
    81f552df075f i40e: Remove string printing for i40e_status
    d13f56d4b265 sfc (gcc13): synchronize ef100_enqueue_skb()'s return type
    a9ad05e35412 remove the sx8 block driver
    c7cf7760b9b5 gcc-plugins: Reorganize gimple includes for GCC 13
    8d00b4e329b7 ata: ahci: fix enum constants for gcc-13

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit e2c1d5814c659ffea6d1c1c658890a7a6fdb779a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 32eb5b8351..6f392deb06 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c24198eab94f04755689cf431a434932396e56f6"
-SRCREV_meta ?= "ae5766055d47d5675065e386ffa286b212a352c0"
+SRCREV_machine ?= "23c35cbe4ce993fc3b566f733820bc46ef715972"
+SRCREV_meta ?= "3fe1658766cb7c35799c501ff46b85d773bee417"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.116"
+LINUX_VERSION ?= "5.15.117"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 259db4b41f..cc424833c0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.116"
+LINUX_VERSION ?= "5.15.117"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "7002dac746495520fb193cb13b1afd83fe4dd2cb"
-SRCREV_meta ?= "ae5766055d47d5675065e386ffa286b212a352c0"
+SRCREV_machine ?= "9d2b9c97c40afeb83f842bc7b2759bb3a2d2a19d"
+SRCREV_meta ?= "3fe1658766cb7c35799c501ff46b85d773bee417"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 0d86a84415..fb904c493e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "846212e7d5354df9f5a061cac6fff98c2d2ca218"
-SRCREV_machine:qemuarm64 ?= "c15cb294c24733e9f1f73c5efccaacec7e0ad534"
-SRCREV_machine:qemumips ?= "9268ce3666b74e3da988ee8476b5908a11208b59"
-SRCREV_machine:qemuppc ?= "8a029153e24092cc00d18f888f22bc03e73a2860"
-SRCREV_machine:qemuriscv64 ?= "ec5cfb5e4ec277f8d0a728032047639192072107"
-SRCREV_machine:qemuriscv32 ?= "ec5cfb5e4ec277f8d0a728032047639192072107"
-SRCREV_machine:qemux86 ?= "ec5cfb5e4ec277f8d0a728032047639192072107"
-SRCREV_machine:qemux86-64 ?= "ec5cfb5e4ec277f8d0a728032047639192072107"
-SRCREV_machine:qemumips64 ?= "ea7f77e865a06b2431f06bc8cbf320c9e5e71642"
-SRCREV_machine ?= "ec5cfb5e4ec277f8d0a728032047639192072107"
-SRCREV_meta ?= "ae5766055d47d5675065e386ffa286b212a352c0"
+SRCREV_machine:qemuarm ?= "1bf5d396bdb59d790e28ee0002d45fe974023e99"
+SRCREV_machine:qemuarm64 ?= "96c8889c7cf3da5210f20f68efdd0a9ff35b1f19"
+SRCREV_machine:qemumips ?= "3d65f1de77e2b0c0736503979fa9308d385d19f0"
+SRCREV_machine:qemuppc ?= "c3ec0c3928575af062554bc94d49e1e582dc5416"
+SRCREV_machine:qemuriscv64 ?= "7a7b177c86db237df76dd87e5515233aac96232b"
+SRCREV_machine:qemuriscv32 ?= "7a7b177c86db237df76dd87e5515233aac96232b"
+SRCREV_machine:qemux86 ?= "7a7b177c86db237df76dd87e5515233aac96232b"
+SRCREV_machine:qemux86-64 ?= "7a7b177c86db237df76dd87e5515233aac96232b"
+SRCREV_machine:qemumips64 ?= "58aa8e851acd14dec6c2769637d5e09d796315d9"
+SRCREV_machine ?= "7a7b177c86db237df76dd87e5515233aac96232b"
+SRCREV_meta ?= "3fe1658766cb7c35799c501ff46b85d773bee417"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "7349e40704a0209a2af8b37fa876322209de9684"
+SRCREV_machine:class-devupstream ?= "471e639e59d128f4bf58000a118b2ceca3893f98"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.116"
+LINUX_VERSION ?= "5.15.117"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


