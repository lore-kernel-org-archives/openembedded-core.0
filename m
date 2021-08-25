Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web09.17364.1629907714272274158
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 09:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q8cy3JRJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id g11so225157qvd.2
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bgO4yhA+hKbZtDjedqlPu9Qty9jF+rJl2orX40XsZ6E=;
        b=Q8cy3JRJsxBF9hjyVIJoDi25ODLym8cnHLUN8Bq7RCCSA3feRwQy+NuyMDOoz3bZwR
         ZkSJiKQMhA5KtEpzlsL0UIm1kMVoIPPTkhqbMxCz3FkLRSucx483GlWgmoW3L1gNHGbl
         mSHHIixRALTG25/ChdRGibLgAC4aaByb5nObsRQ64SNEyvK3sMgMKw2Kp98wRY4XBYPd
         PnX7wDziZyZvoMqJwGoub/qHJFjaf/YIg4KFI6aJGvN1Jh0+DEc5Xoq/YjrE3I4gzln9
         qpzIIZWhiOxHR8paJRk99IA9si5tUMOBT6vlbAyO2OiGc3U40Y9vBp/1ywqtpo7BkXkw
         t2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bgO4yhA+hKbZtDjedqlPu9Qty9jF+rJl2orX40XsZ6E=;
        b=OBtUeu7/Aaxb9o5a+rG+REoo+j5sURv7G56IMOgPKfCJAx8Y9XomX7dLWLS8QEYIQ/
         j5e3+Q92KeDO7iJbcbNa7LwNP23uB8JoSbuP6MiHWdsmMm7WlH8mtD9fjf/Fn8sSvOaa
         jtZxtuzlklUkA8th5cxTIoNNg1vIsAx79F30dnrb304FaS9FE2p2xZdB/X4ujygi5Krl
         X42OLBi6x+dMyeBDvm+0gtal8UaVP4DHbT8eLKrqPbFVR/6by6O+Eg1PgMZ/v5+hb6ox
         isQc/kwCrWPLi/2zr5qkJeXz3x2UYg/kPbUShsUrwn7T1+dDiazFGY/UWSZZmBC38yCX
         a9zA==
X-Gm-Message-State: AOAM5315dX5NqtVI9YNw7omTIQgSPR/6twA5JLACfD04Cctz0jAg5gMx
	agT5YsbbVQz/EhhfYTOkqkk=
X-Google-Smtp-Source: ABdhPJwhJaTl8bxBWG1+wTpjvgGd7z2E10htAMJr1BoqIO3H9CQEdr1u9zehhsMbX6OuAGu5whld3g==
X-Received: by 2002:a05:6214:965:: with SMTP id do5mr45801874qvb.0.1629907713305;
        Wed, 25 Aug 2021 09:08:33 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id e25sm277812qka.83.2021.08.25.09.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 09:08:32 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org,
	steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] linux-yocto/5.4: update to v5.4.142
Date: Wed, 25 Aug 2021 12:08:31 -0400
Message-Id: <20210825160831.34634-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    c15b830f7c1c Linux 5.4.142
    a17f2f2c8949 KVM: nSVM: always intercept VMLOAD/VMSAVE when nested (CVE-2021-3656)
    7c1c96ffb658 KVM: nSVM: avoid picking up unsupported bits from L2 in int_ctl (CVE-2021-3653)
    456fd889227f iommu/vt-d: Fix agaw for a supported 48 bit guest address width
    5b5f855a793c vmlinux.lds.h: Handle clang's module.{c,d}tor sections
    e9b2b2b29ca8 ceph: take snap_empty_lock atomically with snaprealm refcount change
    95ff775df6ec ceph: clean up locking annotation for ceph_get_snap_realm and __lookup_snap_realm
    1d8c232afb03 ceph: add some lockdep assertions around snaprealm handling
    a6ff0f3f9f90 KVM: VMX: Use current VMCS to query WAITPKG support for MSR emulation
    ec25d05e1893 PCI/MSI: Protect msi_desc::masked for multi-MSI
    48d2439c6f2a PCI/MSI: Use msi_mask_irq() in pci_msi_shutdown()
    386ead1d3598 PCI/MSI: Correct misleading comments
    76d81dec16d0 PCI/MSI: Do not set invalid bits in MSI mask
    6b4bcbf13390 PCI/MSI: Enforce MSI[X] entry updates to be visible
    4495a41fbcd7 PCI/MSI: Enforce that MSI-X table entry is masked for update
    1866c8f6d43c PCI/MSI: Mask all unused MSI-X entries
    3b4220c2bf35 PCI/MSI: Enable and mask MSI-X early
    0c8dea3fd55c genirq/timings: Prevent potential array overflow in __irq_timings_store()
    4dfe80927102 genirq/msi: Ensure deactivation on teardown
    e3e54a930073 x86/resctrl: Fix default monitoring groups reporting
    a6b594ad7419 x86/ioapic: Force affinity setup before startup
    db5e2666946a x86/msi: Force affinity setup before startup
    eda32c21882c genirq: Provide IRQCHIP_AFFINITY_PRE_STARTUP
    06b347743608 x86/tools: Fix objdump version check again
    74451dd8bfca powerpc/kprobes: Fix kprobe Oops happens in booke
    b74145d858a8 nbd: Aovid double completion of a request
    ad9550114d4c vsock/virtio: avoid potential deadlock when vsock device remove
    b9cd73cce50a xen/events: Fix race in set_evtchn_to_irq
    4d3c5c319b19 net: igmp: increase size of mr_ifc_count
    721ff564cc6a tcp_bbr: fix u32 wrap bug in round logic if bbr_init() called after 2B packets
    2ce8a68a312c net: linkwatch: fix failure to restore device state across suspend/resume
    33597972a2e9 net: bridge: fix memleak in br_add_if()
    f6eee53beb07 net: dsa: sja1105: fix broken backpressure in .port_fdb_dump
    1e6a570d3786 net: dsa: lantiq: fix broken backpressure in .port_fdb_dump
    564f6bbd0ed6 net: dsa: lan9303: fix broken backpressure in .port_fdb_dump
    a9243455e874 net: igmp: fix data-race in igmp_ifc_timer_expire()
    ed957c77b391 net: Fix memory leak in ieee802154_raw_deliver
    13a381b8bc22 net: dsa: microchip: Fix ksz_read64()
    991117eeeee8 drm/meson: fix colour distortion from HDR set during vendor u-boot
    e114f15de881 net/mlx5: Fix return value from tracer initialization
    f99aa76bb83c psample: Add a fwd declaration for skbuff
    9dc8e396c12e iavf: Set RSS LUT and key in reset handle path
    23436edae3c9 net: sched: act_mirred: Reset ct info when mirror/redirect skb
    9636fbfe7bdd ppp: Fix generating ifname when empty IFLA_IFNAME is specified
    1c31ee907fde net: phy: micrel: Fix link detection on ksz87xx switch"
    dfeb64f6e2ce platform/x86: pcengines-apuv2: Add missing terminating entries to gpio-lookup tables
    699db2bb96ad platform/x86: pcengines-apuv2: revert wiring up simswitch GPIO as LED
    af7f1539cfb1 net: dsa: mt7530: add the missing RxUnicast MIB counter
    d353a61860a2 ASoC: cs42l42: Fix LRCLK frame start edge
    b036452082f3 netfilter: nf_conntrack_bridge: Fix memory leak when error
    cd36a36ea4ea ASoC: cs42l42: Remove duplicate control for WNF filter frequency
    eb789cc9179f ASoC: cs42l42: Fix inversion of ADC Notch Switch control
    6a3381336398 ASoC: cs42l42: Don't allow SND_SOC_DAIFMT_LEFT_J
    55e86f07b85e ASoC: cs42l42: Correct definition of ADC Volume control
    22d2e3c6a1b8 ieee802154: hwsim: fix GPF in hwsim_new_edge_nl
    5bac8c2a3087 ieee802154: hwsim: fix GPF in hwsim_set_edge_lqi
    ddcf807fbb70 libnvdimm/region: Fix label activation vs errors
    bc97fde4c668 ACPI: NFIT: Fix support for virtual SPA ranges
    a753e3f33405 ceph: reduce contention in ceph_check_delayed_caps()
    aa04486c419d i2c: dev: zero out array used for i2c reads from userspace
    c18b28e5ade8 ASoC: intel: atom: Fix reference to PCM buffer address
    aab3fa544647 ASoC: xilinx: Fix reference to PCM buffer address
    60e2854acf3b iio: adc: Fix incorrect exit of for-loop
    bcac5225923b iio: humidity: hdc100x: Add margin to the conversion time
    da7cb80905ec iio: adc: ti-ads7950: Ensure CS is deasserted after reading channels

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 53e6982619..69958c5631 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "e823f31a48749bf1d01a86c274fcec87fae1e5ba"
-SRCREV_meta ?= "71f799f448d405a35d88ecee0aba3ec2b198d542"
+SRCREV_machine ?= "b872fc896dcc555149f26c5dd683f7e6394852d6"
+SRCREV_meta ?= "719be4bd6c3c7575e7942dc016e3c3bb028f163d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.141"
+LINUX_VERSION ?= "5.4.142"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 44a033d5cb..0178d172f8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.141"
+LINUX_VERSION ?= "5.4.142"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "63d08f6ee3425e9d94eccf3a75a9ec4e474df916"
-SRCREV_machine ?= "05b2de44f781a297be454242d77f619189dfc6f4"
-SRCREV_meta ?= "71f799f448d405a35d88ecee0aba3ec2b198d542"
+SRCREV_machine_qemuarm ?= "4addf3f9e4f68bc7c03ea19ad95f2a4836ac9873"
+SRCREV_machine ?= "964802684eb1495bd1c5f625307b6d41515a3e9a"
+SRCREV_meta ?= "719be4bd6c3c7575e7942dc016e3c3bb028f163d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 0e41d734df..7e35e082fb 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "91a35a54a7b2d4d558b3f8b24c39657a3ff71c7c"
-SRCREV_machine_qemuarm64 ?= "a8edc7f1b004c6fb56d142fba3e688ba2a051b54"
-SRCREV_machine_qemumips ?= "4f1c4fc19e8d2cb994dac34fb8bb32a7c776b318"
-SRCREV_machine_qemuppc ?= "7bb64db24c2b7bd2b6656036009bd71618eb125d"
-SRCREV_machine_qemuriscv64 ?= "13fa9f66484db2492ee09667f45ad3e52e5b35ac"
-SRCREV_machine_qemux86 ?= "13fa9f66484db2492ee09667f45ad3e52e5b35ac"
-SRCREV_machine_qemux86-64 ?= "13fa9f66484db2492ee09667f45ad3e52e5b35ac"
-SRCREV_machine_qemumips64 ?= "931ad0c17451151dd3ddfb27dc2e33965f90ce86"
-SRCREV_machine ?= "13fa9f66484db2492ee09667f45ad3e52e5b35ac"
-SRCREV_meta ?= "71f799f448d405a35d88ecee0aba3ec2b198d542"
+SRCREV_machine_qemuarm ?= "9b1b66b01c88cf5035d148f37c70b8215c8fde15"
+SRCREV_machine_qemuarm64 ?= "e91700bf8d8130226679954a8137c5f3fd54b81d"
+SRCREV_machine_qemumips ?= "332bc089f06636156b9d5b2a04228c03c680c6d0"
+SRCREV_machine_qemuppc ?= "1bf103767b96923aa6ca76e9e095b04c13ce93cd"
+SRCREV_machine_qemuriscv64 ?= "108b8b822e7bbba492deafe60ee86839291c3250"
+SRCREV_machine_qemux86 ?= "108b8b822e7bbba492deafe60ee86839291c3250"
+SRCREV_machine_qemux86-64 ?= "108b8b822e7bbba492deafe60ee86839291c3250"
+SRCREV_machine_qemumips64 ?= "7b31f99f9e245d029de7fb9e3480f7b00f846b8f"
+SRCREV_machine ?= "108b8b822e7bbba492deafe60ee86839291c3250"
+SRCREV_meta ?= "719be4bd6c3c7575e7942dc016e3c3bb028f163d"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.141"
+LINUX_VERSION ?= "5.4.142"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

