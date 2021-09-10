Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web08.9690.1631282882367599848
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 07:08:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JY0GAtNA;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id ay33so2018281qkb.10
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 07:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YjqEjI41hyI5GWQanFDn/vqOguWhjrDhDAidXb/ur8Q=;
        b=JY0GAtNAwwfD2jz8yr3lxjYL3pPZdXgOfeTlIgNyZDYZuvYhED7/S2JyZA1245+mfx
         R6tyEUH2prWpFjVWsddcsPuCfNG152VHtMYPReeL22aAXES73Iu6s/VnK5BAabV1mM8A
         8CD7DTQLUSfN2JV0DsZU8maTPt7QZU1UgaRayC0e4aSzxUSl/m+WdYYlRY4IbwXPIzlE
         bkwB8opADWFtYZQ84QiOGCbfTCnb48EtXZ0LvCKskFSWDmERiuNu4FKAgUv2jXo9vtNu
         jXSnLwoVfW3/9bySy5LACgfcaig8Z/GP7X5dALAwyOz0PbTgBKdBbEbpaG37OGjrEviF
         9Vnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YjqEjI41hyI5GWQanFDn/vqOguWhjrDhDAidXb/ur8Q=;
        b=xtZ1qhaDxWqs0smxIcbGrqt6jx6ES8vtGiZBPzPNjKfzjoD4IyQ053mSshdRKFflpM
         JyopRlJBJt4yqLxdGC/zoIP+oZ852CSM/z6mUPA9NUfUy23CP8Uf3o8Zv5/11eyLQVM4
         Xqgd1DgbwdxX7+l6Lo/cdg5CwHUiueyAMcHmNYGQU4T7kvm7HNxbYA9xdzyb+4PHpB8F
         v54Umhm2whj8d3oC/xcu2YOaok+eLSG/XrFxrC/y3QbDHXbk8aJO3Y8vxnY7uMXoLY+0
         sNXNfgNsWBTrBDA3Vu1ivfOV19Uvq//Jexb00xRcclzMWT0ywmNH2z74jViZJl8tYHHD
         UnfA==
X-Gm-Message-State: AOAM532eQvUdicN/twPwNyho2YT8AHjDxkYo6fz/beZ1sHIPEa/9AUlr
	dQm1axWKBGDZ2nzn7QQ3kdnM6Qd2aOyLSw==
X-Google-Smtp-Source: ABdhPJzuAY8UJgw+k8ObMZTeWwFbBc1dTMHBlXN4D4qLnJh8q2wcC6djPbf3xsv1TAmdAkRlx0lhSA==
X-Received: by 2002:a05:620a:1446:: with SMTP id i6mr8055019qkl.361.1631282881331;
        Fri, 10 Sep 2021 07:08:01 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id i16sm3128240qtq.52.2021.09.10.07.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 07:08:00 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/5.13: update to v5.13.13
Date: Fri, 10 Sep 2021 10:07:55 -0400
Message-Id: <5940af3ea1d81d1ef7c32c966fc0537a2129aa37.1631282594.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1631282594.git.bruce.ashfield@gmail.com>
References: <cover.1631282594.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.13 to the latest korg -stable release that comprises
the following commits:

    7aeadb5bb82a Linux 5.13.13
    2ff626b14003 fs: warn about impending deprecation of mandatory locks
    a57b2a703e44 io_uring: fix xa_alloc_cycle() error return value check
    515b6124df6a hugetlb: don't pass page cache pages to restore_reserve_on_error
    371fb63d0926 kfence: fix is_kfence_address() for addresses below KFENCE_POOL_SIZE
    9690e6ffac0b mm/hwpoison: retry with shake_page() for unhandlable pages
    59e5c9ecdeb0 mm,hwpoison: make get_hwpoison_page() call get_any_page()
    e4e8c58cc78e mm: memcontrol: fix occasional OOMs due to proportional memory.low reclaim
    2d1704c3fe30 riscv: Fix a number of free'd resources in init_resources()
    8c5beac92d0e ASoC: intel: atom: Fix breakage for PCM buffer address setup
    8f4eb032a019 ALSA: hda/realtek: Limit mic boost on HP ProBook 445 G8
    59734f7eaaa4 PCI: Increase D3 delay for AMD Renoir/Cezanne XHCI
    00609919ec4d powerpc/32s: Fix random crashes by adding isync() after locking/unlocking KUEP
    33bd5804ac66 powerpc/32s: Refactor update of user segment registers
    efe40fdb6d30 powerpc/32s: Move setup_{kuep/kuap}() into {kuep/kuap}.c
    534a0bc7c87a usb: typec: tcpm: Fix VDMs sometimes not being forwarded to alt-mode drivers
    21d6e237bcc2 s390/pci: fix use after free of zpci_dev
    fe2edb82e5be ALSA: hda/via: Apply runtime PM workaround for ASUS B23E
    41f0262ffb44 tracing: Apply trace filters on all output channels
    f7c707f8ec18 btrfs: prevent rename2 from exchanging a subvol with a directory from different parents
    ddd7fff18986 mmc: sdhci-iproc: Set SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN on BCM2711
    f41b4c30fb73 mmc: sdhci-iproc: Cap min clock frequency on BCM2711
    70063522ee90 opp: Drop empty-table checks from _put functions
    30392f88dace ALSA: hda/realtek: Enable 4-speaker output for Dell XPS 15 9510 laptop
    da8495661fe9 io_uring: only assign io_uring_enter() SQPOLL error in actual error case
    501449420a42 io_uring: fix code style problems
    606f36948a9a ipack: tpci200: fix memory leak in the tpci200_register
    d09bfebbdf22 ipack: tpci200: fix many double free issues in tpci200_pci_probe
    c1001de019ef slimbus: ngd: reset dma setup during runtime pm
    c8f6e68a95c2 slimbus: ngd: set correct device for pm
    28b55e58b864 slimbus: messaging: check for valid transaction id
    e0e46e209e9d slimbus: messaging: start transaction ids from 1 instead of zero
    65a4722bb931 tracing / histogram: Fix NULL pointer dereference on strcmp() on NULL event name
    0ce48083d843 tracing: define needed config DYNAMIC_FTRACE_WITH_ARGS
    2152ee71c164 ALSA: hda - fix the 'Capture Switch' value change notifications
    8681e95da50b cfi: Use rcu_read_{un}lock_sched_notrace
    82d1ea87b9d5 arm64: clean vdso & vdso32 files
    03c33905ee88 clk: qcom: gdsc: Ensure regulator init state matches GDSC state
    95e5238a2fba clk: imx6q: fix uart earlycon unwork
    2fcb62673120 mmc: sdhci-msm: Update the software timeout value for sdhc
    87762c77c39f mmc: mmci: stm32: Check when the voltage switch procedure should be done
    fffcf7fc898a mmc: dw_mmc: Fix hang on data CRC error
    7179eac5556e iommu/dma: Fix leak in non-contiguous API
    b89542f4a60b net: dpaa2-switch: disable the control interface on error path
    5d547d83abb2 Revert "flow_offload: action should not be NULL when it is referenced"
    260b1eb312a0 iavf: Fix ping is lost after untrusted VF had tried to change MAC
    ea1cf8a6d966 i40e: Fix ATR queue selection
    1d9d64cad2fe PCI/sysfs: Use correct variable for the legacy_mem sysfs object
    f21adfddafdf r8152: fix the maximum number of PLA bp for RTL8153C
    5809f8d9b7c0 r8152: fix writing USB_BP2_EN
    dedbf29c6b36 mptcp: full fully established support after ADD_ADDR
    828c3a32238c mptcp: fix memory leak on address flush
    11c79e1615a4 net: mscc: ocelot: allow forwarding from bridge ports to the tag_8021q CPU port
    751f4b539afb drm/amd/display: Use DCN30 watermark calc for DCN301
    e0f2d91e0869 drm/i915: Tweaked Wa_14010685332 for all PCHs
    678b67771cef drm/i915: Skip display interruption setup when display is not available
    936eca018fee iommu/vt-d: Fix incomplete cache flush in intel_pasid_tear_down_entry()
    4e4f3cb41d68 net: usb: asix: refactor asix_read_phy_addr() and handle errors on return
    cf4c1661c40e ovs: clear skb->tstamp in forwarding path
    9581895b37fe net: mdio-mux: Handle -EPROBE_DEFER correctly
    b2973b87ba11 net: mdio-mux: Don't ignore memory allocation errors
    0e805b74cd13 sch_cake: fix srchost/dsthost hashing mode
    ac161cf77818 ixgbe, xsk: clean up the resources in ixgbe_xsk_pool_enable error path
    7af09aeddbae net: qlcnic: add missed unlock in qlcnic_83xx_flash_read32
    39af3583c8fb mac80211: fix locking in ieee80211_restart_work()
    0de9c4de5ca1 virtio-net: use NETIF_F_GRO_HW instead of NETIF_F_LRO
    9213ce667258 vrf: Reset skb conntrack connection on VRF rcv
    a5607b1d8e34 bnxt_en: Add missing DMA memory barriers
    020761f49efb bnxt_en: Disable aRFS if running on 212 firmware
    1a2798f36805 ptp_pch: Restore dependency on PCI
    010d7ad77e2d net: 6pack: fix slab-out-of-bounds in decode_data
    47d43f06fd87 soc: fsl: qe: fix static checker warning
    5eb70221eb03 bnxt: count Tx drops
    40c767494e15 bnxt: make sure xmit_more + errors does not miss doorbells
    781279257968 bnxt: disable napi before canceling DIM
    7edc1a0deca8 bnxt: don't lock the tx queue from napi poll
    a89ba11b263b bpf: Clear zext_dst of dead insns
    3d7f5031f870 drm/mediatek: Add component_del in OVL and COLOR remove function
    e5f25a6ea31a drm/mediatek: Add AAL output size configuration
    88e35118e7c9 vdpa/mlx5: Fix queue type selection logic
    c903a1fd0968 vdpa/mlx5: Avoid destroying MR on empty iotlb
    29236481a883 vDPA/ifcvf: Fix return value check for vdpa_alloc_device()
    080d65ba644f vp_vdpa: Fix return value check for vdpa_alloc_device()
    434887c6ac41 vdpa_sim: Fix return value check for vdpa_alloc_device()
    83f6738578b3 vhost: Fix the calculation in vhost_overflow()
    dcd6c72344f3 bus: ti-sysc: Fix error handling for sysc_check_active_timer()
    8a821b88b1a6 vhost-vdpa: Fix integer overflow in vhost_vdpa_process_iotlb_update()
    6caaf9fcb7b4 virtio: Protect vqs list access
    b380dfb298da dccp: add do-while-0 stubs for dccp_pr_debug macros
    5238de0459c0 cpufreq: armada-37xx: forbid cpufreq for 1.2 GHz variant
    ed6b6c758b67 soc: fsl: qe: convert QE interrupt controller to platform_device
    b39db8c4397d mtd: rawnand: Fix probe failure due to of_get_nand_secure_regions()
    dd53a5f93b2e mt76: fix enum type mismatch
    c442bd5a0e20 arm64: dts: qcom: sdm845-oneplus: fix reserved-mem
    ae19ca1cb3f0 arm64: dts: qcom: msm8994-angler: Disable cont_splash_mem
    1c4678cb01ee cpufreq: arm_scmi: Fix error path when allocation failed
    731825e59e1d iommu: Check if group is NULL before remove device
    02491c3d81ef arm64: dts: qcom: msm8992-bullhead: Fix cont_splash_mem mapping
    aa9cac63e49c arm64: dts: qcom: msm8992-bullhead: Remove PSCI
    6fed550393b8 arm64: dts: qcom: c630: fix correct powerdown pin for WSA881x
    73bb2572339d mtd: rawnand: Add a check in of_get_nand_secure_regions()
    85f5d3d0bc2e kyber: make trace_block_rq call consistent with documentation
    a6488cc30f01 drm/amd/display: workaround for hard hang on HPD on native DP
    a4ebe05cd99e drm/amd/display: Fix Dynamic bpp issue with 8K30 with Navi 1X
    5fd92907a473 spi: cadence-quadspi: Fix check condition for DTR ops
    d6080ac32e3e perf/x86: Fix out of bound MSR access
    cae49c93c71c net: usb: lan78xx: don't modify phy_device state concurrently
    d45f37c6120e net: usb: pegasus: Check the return value of get_geristers() and friends;
    e5f45fdefd8d ARM: dts: nomadik: Fix up interrupt controller node names
    56dcfd2e0145 qede: fix crash in rmmod qede while automatic debug collection
    0620a81e8040 drm/amdgpu: fix the doorbell missing when in CGPG issue for renoir.
    c6751ce1a2a4 scsi: core: Fix capacity set to zero after offlinining device
    87820c748fda scsi: core: Avoid printing an error if target_alloc() returns -ENXIO
    7bbfccc78e0e scsi: scsi_dh_rdac: Avoid crash during rdac_bus_attach()
    f57f3722788e scsi: megaraid_mm: Fix end of loop tests for list_for_each_entry()
    fa3c19ceaa8b scsi: pm80xx: Fix TMF task completion race condition
    c589360bd3a9 dmaengine: of-dma: router_xlate to return -EPROBE_DEFER if controller is not yet available
    d09867c795c3 ARM: dts: am43x-epos-evm: Reduce i2c0 bus speed for tps65218
    38df50afe852 net: xfrm: Fix end of loop tests for list_for_each_entry
    1718285e1419 spi: spi-mux: Add module info needed for autoloading
    7c6e26d59bfb dmaengine: usb-dmac: Fix PM reference leak in usb_dmac_probe()
    fcd998a0536e dmaengine: xilinx_dma: Fix read-after-free bug when terminating transfers
    d9aee1535e7b USB: core: Fix incorrect pipe calculation in do_proc_control()
    08fb58a2c3dc USB: core: Avoid WARNings for 0-length descriptor requests
    261d195d5fe6 io_uring: Use WRITE_ONCE() when writing to sq_flags
    e8daa0dd99c9 mtd: cfi_cmdset_0002: fix crash when erasing/writing AMD cards

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.13.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.13.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.13.bb | 24 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
index e59536cc3d..02c9c41eb1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.13.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1c1c5e42a518434b8c24d511aae442ac19386977"
+SRCREV_machine ?= "5bf65aebc58699c42d96c1b70ce51e2568222f7b"
 SRCREV_meta ?= "c38435a3cacf424fa686ecac9a95ef8349b83bb3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.13.12"
+LINUX_VERSION ?= "5.13.13"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
index 201f7efcbb..bd30c487f9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.13.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.13.12"
+LINUX_VERSION ?= "5.13.13"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "c0183d7ce4d9aa263ec9c8f8b7dc8f6df4302095"
-SRCREV_machine ?= "a4458dd292e90a28566ef9283a15c435c11bca2d"
+SRCREV_machine:qemuarm ?= "bb0d6a8b8094712620955b574757d3286add7696"
+SRCREV_machine ?= "2f126a0a69284d24a8d367abe6985cd525596a6b"
 SRCREV_meta ?= "c38435a3cacf424fa686ecac9a95ef8349b83bb3"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.13.bb b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
index f20d7b18b3..0cdc51b6c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.13.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.13.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.13/standard/base"
 KBRANCH:qemux86-64 ?= "v5.13/standard/base"
 KBRANCH:qemumips64 ?= "v5.13/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "7bf87cf7827b03e8eca31063b118ebc11d5c5ee5"
-SRCREV_machine:qemuarm64 ?= "448966e7f96755f3b735a43c3d3895cb29c0e76e"
-SRCREV_machine:qemumips ?= "6fd77ca515af94b780f49d6403a0bafdee1c60c2"
-SRCREV_machine:qemuppc ?= "14ecf9f266afdcfd8ca9308ed90f4a7a5a2adcd0"
-SRCREV_machine:qemuriscv64 ?= "49ec738aa7f6a59d11b46f61dea82965018f3124"
-SRCREV_machine:qemuriscv32 ?= "49ec738aa7f6a59d11b46f61dea82965018f3124"
-SRCREV_machine:qemux86 ?= "49ec738aa7f6a59d11b46f61dea82965018f3124"
-SRCREV_machine:qemux86-64 ?= "49ec738aa7f6a59d11b46f61dea82965018f3124"
-SRCREV_machine:qemumips64 ?= "95713ce4053b8acd170fc99503f9b076e5f3cec3"
-SRCREV_machine ?= "49ec738aa7f6a59d11b46f61dea82965018f3124"
+SRCREV_machine:qemuarm ?= "1ba4dc7805cc92639acabfb0151f43c0b076c982"
+SRCREV_machine:qemuarm64 ?= "370a8e98fbc5ec6da6630edd765a900baf61d0d9"
+SRCREV_machine:qemumips ?= "76ac48cc6e9f3320d7358e979389584bfc513bd1"
+SRCREV_machine:qemuppc ?= "8fc360f43d203e3577416b4ca48d8dfe7f1f85b8"
+SRCREV_machine:qemuriscv64 ?= "4f742215802dad4a6457e2ef2cad96ef037d666c"
+SRCREV_machine:qemuriscv32 ?= "4f742215802dad4a6457e2ef2cad96ef037d666c"
+SRCREV_machine:qemux86 ?= "4f742215802dad4a6457e2ef2cad96ef037d666c"
+SRCREV_machine:qemux86-64 ?= "4f742215802dad4a6457e2ef2cad96ef037d666c"
+SRCREV_machine:qemumips64 ?= "9e06c12d9b1294cd17c24da363ec93e66d5ed5a6"
+SRCREV_machine ?= "4f742215802dad4a6457e2ef2cad96ef037d666c"
 SRCREV_meta ?= "c38435a3cacf424fa686ecac9a95ef8349b83bb3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
@@ -31,7 +31,7 @@ SRCREV_meta ?= "c38435a3cacf424fa686ecac9a95ef8349b83bb3"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "f428e49b8cb1fbd9b4b4b29ea31b6991d2ff7de1"
+SRCREV_machine:class-devupstream ?= "7aeadb5bb82ad21ffbcd54c81d77727b7a05e6c1"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.13/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.13;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.13.12"
+LINUX_VERSION ?= "5.13.13"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

