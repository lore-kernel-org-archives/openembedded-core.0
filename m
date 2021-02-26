Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.9970.1614349562434827414
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Feb 2021 06:26:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=egCz1yR1;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.182, mailfrom: steve@sakoman.com)
Received: by mail-il1-f182.google.com with SMTP id q9so8163666ilo.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Feb 2021 06:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=VXdhHr7Ot6welaIJj0qQKC3nL4rvlX8qBBlN7V4JbFY=;
        b=egCz1yR1f9LlpRRfy/oyQANbLk5RQz3G4O7qO0iPrlaOT154ynT0k0rcy90wFzfYKN
         jgyWglv5Yr+H6vPLxA0ogDHbu1bWzHhh3viQuq2OOzWItseff5O+uKtxDB9t9u3wKrx9
         Sa1Lz6CU4up7wTYdHBJBCaOoTUQckrc7q4LiqXKqlRLdTCXwJ4kssBs2wWL3EDAXXpYj
         TeWy18zeSrG2bjuHP9M5GGafnw1mxEJzJKfsdrcBKks067sGRX627M02XGel4wiep8Ya
         2f08ceom7FL6WAMjGs7tGVFhgRx29JWp/EVyp/DfB3WFCXMgltvcvvol77ExBaF0e1MA
         onzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VXdhHr7Ot6welaIJj0qQKC3nL4rvlX8qBBlN7V4JbFY=;
        b=id/D9vtoht1QzIF3oYaWu5CUq4DVhtsOtGzSUekVIanzTQwG5xeErAmTCKVKpxJ/KR
         gIsPIzrdsxxnYJCCv4b+3priV5MOZegaM5qARewvWyOxok0/B+dZhB6ijctA5juxX24d
         TVQzumT7u3hlClUsw/jMk/s/RMQriMYrDhwaRfVJogbPgSPFyQg1jQryVTYAb6Qmtg0b
         Mfeu0a49f1YZXhsb2Tyyp4TIvIFSVtMs1z6cr9yVBv4l4lINL7eXS8LpU2bmuPPj1Zh9
         MpObRuTR7Hnwegv8OnfRxZL9mBfao3W+sRrt+nbVVMGczQf6/oVCIqHwWYWSh9reKIAZ
         FXPA==
X-Gm-Message-State: AOAM532aqAT3LwZ3Ug8BoXubfDcQCcMtVWRziHc54MhkePV3XdcPx51W
	S4FWLgoKgtld/Sx2lIKj5rO1cfMcWG/+Vs82
X-Google-Smtp-Source: ABdhPJwBPLjmH+egTUSksZKzjpSLvZTjJ2jVtd1uRtwiK6ZEH42+4jOxXDlTBj2lLqea8HjEQjuWCA==
X-Received: by 2002:a05:6e02:1a0f:: with SMTP id s15mr2750570ild.244.1614349561191;
        Fri, 26 Feb 2021 06:26:01 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id i3sm5383377ioq.13.2021.02.26.06.25.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:26:00 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/40] linux-yocto/5.4: update to v5.4.96
Date: Fri, 26 Feb 2021 04:23:55 -1000
Message-Id: <14091ce0927d1077ecb1b0f807ec6208bbf5ed1f.1614348990.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1614348990.git.steve@sakoman.com>
References: <cover.1614348990.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    d4716ee8751b Linux 5.4.96
    b1a1c262e4b0 workqueue: Restrict affinity change to rescuer
    5b1e4fc2984e kthread: Extract KTHREAD_IS_PER_CPU
    2d7ca4a84b58 objtool: Don't fail on missing symbol table
    88240f7ac221 drm/amd/display: Change function decide_dp_link_settings to avoid infinite looping
    53c10bbf9186 drm/amd/display: Update dram_clock_change_latency for DCN2.1
    c6eb3dfdac44 selftests/powerpc: Only test lwm/stmw on big endian
    805e9cdb5793 nvme: check the PRINFO bit before deciding the host buffer length
    8e59209d53c9 udf: fix the problem that the disc content is not displayed
    2d1593543418 ALSA: hda: Add Cometlake-R PCI ID
    c03ecc192c8e scsi: ibmvfc: Set default timeout to avoid crash during migration
    02cc1ee3e8d1 mac80211: fix fast-rx encryption check
    efd061fc77f3 ASoC: SOF: Intel: hda: Resume codec to do jack detection
    e0f1ba38f788 scsi: fnic: Fix memleak in vnic_dev_init_devcmd2
    935fa0d5a5c5 scsi: libfc: Avoid invoking response handler twice if ep is already completed
    335bbffdd90c scsi: scsi_transport_srp: Don't block target in failfast state
    b1f680ffc25b x86: __always_inline __{rd,wr}msr()
    d1aed452c05f platform/x86: intel-vbtn: Support for tablet mode on Dell Inspiron 7352
    c99ac7213638 platform/x86: touchscreen_dmi: Add swap-x-y quirk for Goodix touchscreen on Estar Beauty HD tablet
    6f705e80fb87 phy: cpcap-usb: Fix warning for missing regulator_disable
    fd4c12f31209 net_sched: gen_estimator: support large ewma log
    27afc7128345 btrfs: backref, use correct count to resolve normal data refs
    66bcf5f6f989 btrfs: backref, only search backref entries from leaves of the same root
    c3089b06d6fe btrfs: backref, don't add refs from shared block when resolving normal backref
    21a0c97fb27c btrfs: backref, only collect file extent items matching backref offset
    1960c3d40b69 tcp: make TCP_USER_TIMEOUT accurate for zero window probes
    55cb8e232f9a arm64: Do not pass tagged addresses to __is_lm_address()
    b28387cf8f1c arm64: Fix kernel address detection of __is_lm_address()
    11084836e5fb ACPI: thermal: Do not call acpi_thermal_check() directly
    1410d2b68207 Revert "Revert "block: end bio with BLK_STS_AGAIN in case of non-mq devs and REQ_NOWAIT""
    5e8776df14fa ibmvnic: Ensure that CRQ entry read are correctly ordered
    bc4e7277cc93 net: switchdev: don't set port_obj_info->handled true when -EOPNOTSUPP
    9edebe46010c net: dsa: bcm_sf2: put device node before return
    e89428970c23 Linux 5.4.95
    e7aeca61cb9b tcp: fix TLP timer not set when CA_STATE changes from DISORDER to OPEN
    3e93b9efc3bb team: protect features update by RCU to avoid deadlock
    489e35c6829a ASoC: topology: Fix memory corruption in soc_tplg_denum_create_values()
    9a4d367b2783 NFC: fix possible resource leak
    c929c76e98b0 NFC: fix resource leak when target index is invalid
    b2f4a59a2216 rxrpc: Fix memory leak in rxrpc_lookup_local
    6d25d788efa4 iommu/vt-d: Don't dereference iommu_device if IOMMU_API is not built
    66f4f98ee363 iommu/vt-d: Gracefully handle DMAR units with no supported address widths
    0551a2fd456c selftests: forwarding: Specify interface when invoking mausezahn
    e4405451dd6e nvme-multipath: Early exit if no path is available
    64a4ec1850f7 can: dev: prevent potential information leak in can_fill_info()
    4dc2395d8f14 net/mlx5e: Reduce tc unsupported key print level
    a66705277baf net/mlx5e: E-switch, Fix rate calculation for overflow
    dbc13deeec6a net/mlx5: Fix memory leak on flow table creation error flow
    02ef126a002d igc: fix link speed advertising
    873d1a4740d6 i40e: acquire VSI pointer only after VF is initialized
    cf9276211563 mac80211: pause TX while changing interface type
    46c67a4c1a76 iwlwifi: pcie: reschedule in long-running memory reads
    563daf7c0f4a iwlwifi: pcie: use jiffies for memory read spin time limit
    f39fce916a7b pNFS/NFSv4: Fix a layout segment leak in pnfs_layout_process()
    a3c5fec1e09f ASoC: Intel: Skylake: skl-topology: Fix OOPs ib skl_tplg_complete
    748c2cd57615 RDMA/cxgb4: Fix the reported max_recv_sge value
    72797bfc5f77 firmware: imx: select SOC_BUS to fix firmware build
    347feca03881 ARM: dts: imx6qdl-kontron-samx6i: fix i2c_lcd/cam default status
    f7c6e6c9b62c arm64: dts: ls1028a: fix the offset of the reset register
    78fc9ef35d18 xfrm: Fix wraparound in xfrm_policy_addr_delta()
    f5e7db4fcd38 selftests: xfrm: fix test return value override issue in xfrm_policy.sh
    dac256de1fe2 xfrm: fix disable_xfrm sysctl when used on xfrm interfaces
    a7edea0fe85a xfrm: Fix oops in xfrm_replay_advance_bmp
    deb8d5dfeb63 netfilter: nft_dynset: add timeout extension to template
    347a1a20b195 ARM: imx: build suspend-imx6.S with arm instruction set
    61bdab3d770b xen-blkfront: allow discard-* nodes to be optional
    65543408f257 tee: optee: replace might_sleep with cond_resched
    ad3d896ef55c drm/i915: Check for all subplatform bits
    59546420c51b drm/nouveau/svm: fail NOUVEAU_SVM_INIT ioctl on unsupported devices
    37ef9b59f479 mt7601u: fix rx buffer refcounting
    77771158182f mt7601u: fix kernel crash unplugging the device
    2c4f52b9cddf arm64: dts: broadcom: Fix USB DMA address translation for Stingray
    6aceac245059 leds: trigger: fix potential deadlock with libata
    2c7b4b25293a xen: Fix XenStore initialisation for XS_LOCAL
    632a7728da9b KVM: Forbid the use of tagged userspace addresses for memslots
    ba668a507788 KVM: x86: get smi pending status correctly
    ff5f6de29faf KVM: nVMX: Sync unsync'd vmcs02 state to vmcs12 on migration
    2fc14cafefb3 KVM: x86/pmu: Fix UBSAN shift-out-of-bounds warning in intel_pmu_refresh()
    c547d39feb65 KVM: x86/pmu: Fix HW_REF_CPU_CYCLES event pseudo-encoding in intel_arch_events[]
    e1ae9aab8029 btrfs: fix possible free space tree corruption with online conversion
    d30cb3d348b8 drivers: soc: atmel: add null entry at the end of at91_soc_allowed_list[]
    082dc611fdc8 drivers: soc: atmel: Avoid calling at91_soc_init on non AT91 SoCs
    53fd4e4003a6 PM: hibernate: flush swap writer after marking
    7f9a267c67af s390/vfio-ap: No need to disable IRQ after queue reset
    9077bc37d2d1 net: usb: qmi_wwan: added support for Thales Cinterion PLSx3 modem family
    8aba60ebcfc3 wext: fix NULL-ptr-dereference with cfg80211's lack of commit()
    720032d3dc84 ARM: dts: imx6qdl-gw52xx: fix duplicate regulator naming
    b24dc0aa7e9b media: rc: ensure that uevent can be read directly after rc device register
    5d6fd0357057 ALSA: hda/via: Apply the workaround generically for Clevo machines
    f78803928481 ALSA: hda/realtek: Enable headset of ASUS B1400CEPE with ALC256
    8de2109f4670 kernel: kexec: remove the lock operation of system_transition_mutex
    93603a27fc31 ACPI: sysfs: Prefer "compatible" modalias
    587c6b75d7fd nbd: freeze the queue while we're adding connections
    b8fcb8f53995 IPv6: reply ICMP error if the first fragment don't include all headers
    1f58e378a17e ICMPv6: Add ICMPv6 Parameter Problem, code 3 definition

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b39a6de2c1175e4554c688a44c905c24367fa57a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index a9634c330a..918887620d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "84a6ec1f97d6b6afebe3514e772536342a4189fc"
-SRCREV_meta ?= "e120076c07e69166ebeac0eee011c085bbde2139"
+SRCREV_machine ?= "d713e8f61a93d8f6e8c1960b2478f19ba616f1e1"
+SRCREV_meta ?= "ab2e5b4ded74e18c58efd99ca6f1661a4f299255"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.94"
+LINUX_VERSION ?= "5.4.96"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index bd21c619c9..63e452641c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.94"
+LINUX_VERSION ?= "5.4.96"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "768311f24c5d817e7cb9ee0803790ee284e9ff30"
-SRCREV_machine ?= "31db2b47ac7d8508080fbb7344399b501216de66"
-SRCREV_meta ?= "e120076c07e69166ebeac0eee011c085bbde2139"
+SRCREV_machine_qemuarm ?= "7ddf91d07b54aaf7d9160375b7a084dd115684b1"
+SRCREV_machine ?= "621e232db8554748a51c80f522ec759303cde5d2"
+SRCREV_meta ?= "ab2e5b4ded74e18c58efd99ca6f1661a4f299255"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 9c044dc06c..12066f72b1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "17b04c3b496d6a89d5de8ef97ce8c2675ac19814"
-SRCREV_machine_qemuarm64 ?= "31db2b47ac7d8508080fbb7344399b501216de66"
-SRCREV_machine_qemumips ?= "4b4534a5bb1e765574349baf31dddceb521e6bec"
-SRCREV_machine_qemuppc ?= "31db2b47ac7d8508080fbb7344399b501216de66"
-SRCREV_machine_qemuriscv64 ?= "31db2b47ac7d8508080fbb7344399b501216de66"
-SRCREV_machine_qemux86 ?= "31db2b47ac7d8508080fbb7344399b501216de66"
-SRCREV_machine_qemux86-64 ?= "31db2b47ac7d8508080fbb7344399b501216de66"
-SRCREV_machine_qemumips64 ?= "a3b16f0dc7b90e68e5a7d38e0ab70cbe290ec9a6"
-SRCREV_machine ?= "31db2b47ac7d8508080fbb7344399b501216de66"
-SRCREV_meta ?= "e120076c07e69166ebeac0eee011c085bbde2139"
+SRCREV_machine_qemuarm ?= "e35ee9d9faf9994d4987746db31e9122732d4066"
+SRCREV_machine_qemuarm64 ?= "621e232db8554748a51c80f522ec759303cde5d2"
+SRCREV_machine_qemumips ?= "76bd925d349e98d13f23aed590d3cdb811beea7d"
+SRCREV_machine_qemuppc ?= "621e232db8554748a51c80f522ec759303cde5d2"
+SRCREV_machine_qemuriscv64 ?= "621e232db8554748a51c80f522ec759303cde5d2"
+SRCREV_machine_qemux86 ?= "621e232db8554748a51c80f522ec759303cde5d2"
+SRCREV_machine_qemux86-64 ?= "621e232db8554748a51c80f522ec759303cde5d2"
+SRCREV_machine_qemumips64 ?= "6da088d17f3a6038e01627b47e499899be55f6e2"
+SRCREV_machine ?= "621e232db8554748a51c80f522ec759303cde5d2"
+SRCREV_meta ?= "ab2e5b4ded74e18c58efd99ca6f1661a4f299255"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.94"
+LINUX_VERSION ?= "5.4.96"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1

