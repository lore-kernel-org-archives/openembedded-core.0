Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web11.525.1625524559660052051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 15:35:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=baXFKaQm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.54, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f54.google.com with SMTP id m18-20020a9d4c920000b029048b4f23a9bcso7723499otf.9
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 15:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6EzoM8CegCPu8gOzY5sUGYCTKUkkPV4vWs56Hd3dOuc=;
        b=baXFKaQm9luwbIXyH+5TRgacaFIY6useXaMJ5B47AIhYOtO2azQEhcwPtoHJDs3Ubu
         ulJHadA4x0ejKGul80NDMEbW9qIjQj8aO3K/MSC3SCwPvNbAxRqlQ/TNkQiwUCNeSiPZ
         nXDhrzBJDm5eavp62q/JjGjS95r13HpqJVV82++e2k8qBbWzRuCwKtN5oHzHbvFXbsCm
         cwZvR5pQL8hSDKqd44OqrCVDfRAzWrBqTFT0K6/cLMp3cOCBykfsOyeK5Nd8J2z+IGn0
         b4OSJQGlwSSHdchpXvb+OJJQWvxclF271Uq6ETZNU1PQtR64AVQHAjAG+krKNGuPIvhD
         Masg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6EzoM8CegCPu8gOzY5sUGYCTKUkkPV4vWs56Hd3dOuc=;
        b=eY3alVBNQ4B9F+UKd5qXx7bzxn3RkHD3sWV4cxYKfy7cTUhQRAO5grDs64W3TXhZmS
         c6xTWJq+lUppmHXYdNfg62r1xRYFvRzEIjakBdq0pve79a94KUT/ftQI7mxN+VQ/mKnO
         HpOT2qtZAG7IEjY6fOUY9MZf1iqLb9QhmEVMRXg5GO14dQtwunUIsY6CXvOmoHDmKOVA
         E+cJAWe/JqKne31Tl00iYddIo07cH71C8QEh0TIXTqFCN2s39E2eTz5POAtK+dZsnS+T
         rrIUyIjYEph3arO1r92+wJRSDrPJevPbJQffnKcR2YVjIQzMo206oVbPqmYLCxWU2XZl
         vDQA==
X-Gm-Message-State: AOAM533tw6njDEmifhR/IKg4Ck4lkOFAe2GYQcq15r4XukhDQ0v5s7S1
	FuQQLiuZ/pU8+tZdtRFqiw165FCc4sWzd4y+
X-Google-Smtp-Source: ABdhPJwwREdIKtKI1cTNszso10fxBGCJqLn3v+iD1MEVdTmsGJsvYmtIxSbomGx/RSS7tOPqNv+yGw==
X-Received: by 2002:a9d:5d01:: with SMTP id b1mr12113982oti.158.1625524558535;
        Mon, 05 Jul 2021 15:35:58 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id i16sm2870178otp.7.2021.07.05.15.35.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 15:35:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/19] linux-yocto/5.4: update to v5.4.125
Date: Mon,  5 Jul 2021 12:34:43 -1000
Message-Id: <9c3b82eec2c9e7263898a812d82089831564cf6d.1625511812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625511812.git.steve@sakoman.com>
References: <cover.1625511812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    3909e2374335 Linux 5.4.125
    d99029e6aab6 neighbour: allow NUD_NOARP entries to be forced GCed
    8e0bb29446d1 i2c: qcom-geni: Suspend and resume the bus during SYSTEM_SLEEP_PM ops
    bdc17b2f8264 xen-pciback: redo VF placement in the virtual topology
    defcc2b5e54a lib/lz4: explicitly support in-place decompression
    97e814e6b5cd x86/kvm: Disable all PV features on crash
    9084fe1b3572 x86/kvm: Disable kvmclock on all CPUs on shutdown
    7620a669111b x86/kvm: Teardown PV features on boot CPU as well
    f82030a586a1 KVM: arm64: Fix debug register indexing
    2295e87a5e39 KVM: SVM: Truncate GPR value for DR and CR accesses in !64-bit mode
    0450af01ae7e btrfs: fix unmountable seed device after fstrim
    3b7f3cab1d47 mm/filemap: fix storing to a THP shadow entry
    0a890e220954 XArray: add xas_split
    03a390d8796d XArray: add xa_get_order
    fd8e06a7a723 mm: add thp_order
    f192885f7cee bnxt_en: Remove the setting of dev_port.
    14fd3da3e8d3 mm, hugetlb: fix simple resv_huge_pages underflow on UFFDIO_COPY
    6d4da27bd9ef btrfs: fixup error handling in fixup_inode_link_counts
    dad974d2494a btrfs: return errors from btrfs_del_csums in cleanup_ref_head
    0fd9149a82e3 btrfs: fix error handling in btrfs_del_csums
    295859a55549 btrfs: mark ordered extent and inode with error if we fail to finish
    12ca65539b04 x86/apic: Mark _all_ legacy interrupts when IO/APIC is missing
    b0c0d8b5bf94 drm/amdgpu: make sure we unpin the UVD BO
    24c06e5452c3 drm/amdgpu: Don't query CE and UE errors
    5d4c4b06ed9f nfc: fix NULL ptr dereference in llcp_sock_getname() after failed connect
    cc2edb99ea60 ocfs2: fix data corruption by fallocate
    2cd6eedfa634 pid: take a reference when initializing `cad_pid`
    fe4e0bd4c26c usb: dwc2: Fix build in periphal-only mode
    920697b004e4 ext4: fix bug on in ext4_es_cache_extent as ext4_split_extent_at failed
    52fc8f05c158 ARM: dts: imx6q-dhcom: Add PU,VDD1P1,VDD2P5 regulators
    2cac47eed455 ARM: dts: imx6dl-yapp4: Fix RGMII connection to QCA8334 switch
    d349ff008cb3 ALSA: hda: Fix for mute key LED for HP Pavilion 15-CK0xx
    0afd601d8e0a ALSA: timer: Fix master timer notification
    d65bc969ec8b HID: multitouch: require Finger field to mark Win8 reports as MT
    368c5d45a87e HID: magicmouse: fix NULL-deref on disconnect
    142d5ca797a9 HID: i2c-hid: Skip ELAN power-on command after reset
    4d94f530cd24 net: caif: fix memory leak in cfusbl_device_notify
    f52f4fd67264 net: caif: fix memory leak in caif_device_notify
    c97cdb70b72d net: caif: add proper error handling
    64824f626c0c net: caif: added cfserl_release function
    b6f97555c71f Bluetooth: use correct lock to prevent UAF of hdev object
    8d3d0ac73a4a Bluetooth: fix the erroneous flush_work() order
    28efacc21d2a tipc: fix unique bearer names sanity check
    9ac67fdf64e0 tipc: add extack messages for bearer/media failure
    0fa160a75748 bus: ti-sysc: Fix flakey idling of uarts and stop using swsup_sidle_act
    22ea29c39717 ARM: dts: imx: emcon-avari: Fix nxp,pca8574 #gpio-cells
    5b97dd983255 ARM: dts: imx7d-pico: Fix the 'tuning-step' property
    55fa22d1d8b2 ARM: dts: imx7d-meerkat96: Fix the 'tuning-step' property
    3a559111bd10 arm64: dts: zii-ultra: fix 12V_MAIN voltage
    f78c28a0dda1 arm64: dts: ls1028a: fix memory node
    3616dd03bc43 i40e: add correct exception tracing for XDP
    adfd6355fc8b i40e: optimize for XDP_REDIRECT in xsk path
    06f667dba42e i2c: qcom-geni: Add shutdown callback for i2c
    de37510ec67d ice: Allow all LLDP packets from PF to Tx
    bafd0a7461f0 ice: Fix VFR issues for AVF drivers that expect ATQLEN cleared
    3583ab29177c ice: write register with correct offset
    7ba7fa78a92d ipv6: Fix KASAN: slab-out-of-bounds Read in fib6_nh_flush_exceptions
    112533f50c7e ixgbevf: add correct exception tracing for XDP
    b5cc02c6986f ieee802154: fix error return code in ieee802154_llsec_getparams()
    4ca8aa37cb43 ieee802154: fix error return code in ieee802154_add_iface()
    66f3ab065b70 netfilter: nfnetlink_cthelper: hit EBUSY on updates if size mismatches
    da8d31e80ff4 netfilter: nft_ct: skip expectations for confirmed conntrack
    14c0381e2639 ACPICA: Clean up context mutex during object deletion
    8e8678936f0d net/sched: act_ct: Fix ct template allocation for zone 0
    385e1861f31b HID: i2c-hid: fix format string mismatch
    279e2136dd21 HID: pidff: fix error return code in hid_pidff_init()
    c8a95cb0c02d ipvs: ignore IP_VS_SVC_F_HASHED flag when adding service
    087b803a5b49 vfio/platform: fix module_put call in error flow
    60dcad10e2c7 samples: vfio-mdev: fix error handing in mdpy_fb_probe()
    870973918b2a vfio/pci: zap_vma_ptes() needs MMU
    5da371c3fdfb vfio/pci: Fix error return code in vfio_ecap_init()
    a4ed60297770 efi: cper: fix snprintf() use in cper_dimm_err_location()
    bc8f6647a73c efi: Allow EFI_MEMORY_XP and EFI_MEMORY_RO both to be cleared
    2986fdd3211f netfilter: conntrack: unregister ipv4 sockopts on error unwind
    90870b45fc62 hwmon: (dell-smm-hwmon) Fix index values
    0338fa4af9f3 nl80211: validate key indexes for cfg80211_registered_device
    e9487a498753 ALSA: usb: update old-style static const declaration
    aaa41b3094ea net: usb: cdc_ncm: don't spew notifications
    96a40c3fa3d3 btrfs: tree-checker: do not error out if extent ref hash doesn't match

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ac4206f38bba852b1171419ad72a6e1c75ccec4c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index bad4b7fdc1..29f50a8952 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c538f43c5caae421d4cd56782dc8213c3ea7cbb4"
-SRCREV_meta ?= "669bba3f8ad5c588063f3a8be4fca46c309b0714"
+SRCREV_machine ?= "08b154b1c1f1c85db88295a4169dff6826c2e383"
+SRCREV_meta ?= "656383210d369bbd49a7a278c6c7c7313f0df825"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.124"
+LINUX_VERSION ?= "5.4.125"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index bb4b24ac0d..6c93e2b163 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.124"
+LINUX_VERSION ?= "5.4.125"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "5c655b0a0cf0aed21db20fc2e7fdc2cd1bea7def"
-SRCREV_machine ?= "2487a0dd8891bcdb43b6ab2b46e3a41909ef7b1a"
-SRCREV_meta ?= "669bba3f8ad5c588063f3a8be4fca46c309b0714"
+SRCREV_machine_qemuarm ?= "35f9751972b9fba920b1666228a35e5ce0b04440"
+SRCREV_machine ?= "bcd119e358de95fb4b8ff6d560e5dab8b8a5ecee"
+SRCREV_meta ?= "656383210d369bbd49a7a278c6c7c7313f0df825"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 4af56daf7b..3be58b2040 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "1c6a92761a897497f1a265e41fbc5a71e77c9599"
-SRCREV_machine_qemuarm64 ?= "2487a0dd8891bcdb43b6ab2b46e3a41909ef7b1a"
-SRCREV_machine_qemumips ?= "bd70ff3bfca60803be364d3c6a45ab64da9fe1e1"
-SRCREV_machine_qemuppc ?= "2487a0dd8891bcdb43b6ab2b46e3a41909ef7b1a"
-SRCREV_machine_qemuriscv64 ?= "2487a0dd8891bcdb43b6ab2b46e3a41909ef7b1a"
-SRCREV_machine_qemux86 ?= "2487a0dd8891bcdb43b6ab2b46e3a41909ef7b1a"
-SRCREV_machine_qemux86-64 ?= "2487a0dd8891bcdb43b6ab2b46e3a41909ef7b1a"
-SRCREV_machine_qemumips64 ?= "f67e90b460cfafbb8a7a9e73c95587321f784351"
-SRCREV_machine ?= "2487a0dd8891bcdb43b6ab2b46e3a41909ef7b1a"
-SRCREV_meta ?= "669bba3f8ad5c588063f3a8be4fca46c309b0714"
+SRCREV_machine_qemuarm ?= "b523a950c926e2d7475768b504e46fa618a3b891"
+SRCREV_machine_qemuarm64 ?= "bcd119e358de95fb4b8ff6d560e5dab8b8a5ecee"
+SRCREV_machine_qemumips ?= "bff59892e827bc85e85fef518305007a787812aa"
+SRCREV_machine_qemuppc ?= "bcd119e358de95fb4b8ff6d560e5dab8b8a5ecee"
+SRCREV_machine_qemuriscv64 ?= "bcd119e358de95fb4b8ff6d560e5dab8b8a5ecee"
+SRCREV_machine_qemux86 ?= "bcd119e358de95fb4b8ff6d560e5dab8b8a5ecee"
+SRCREV_machine_qemux86-64 ?= "bcd119e358de95fb4b8ff6d560e5dab8b8a5ecee"
+SRCREV_machine_qemumips64 ?= "e25b97140f5d46ac437cd8a1d9ecc235cbf462b5"
+SRCREV_machine ?= "bcd119e358de95fb4b8ff6d560e5dab8b8a5ecee"
+SRCREV_meta ?= "656383210d369bbd49a7a278c6c7c7313f0df825"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.124"
+LINUX_VERSION ?= "5.4.125"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1

