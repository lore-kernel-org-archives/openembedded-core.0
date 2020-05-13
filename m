Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.7175.1589379881968571360
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2020 07:24:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=p7rMSPa5;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id n14so17472421qke.8
        for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2020 07:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D8AH+qgnpBqxYP3dnsb7lV4Lk3+k1PyFSBNROisB3ZM=;
        b=p7rMSPa5ps77APKRbW+0qGBG1TbtxjiQ5EQwtmutWovk2B1qOPbcui7F3fZAUlcfYH
         Am1gVUUSoJSspQS1Jw4l6Cp91fuuNN571cQtYWkCNfOBf0Ob7LcsSWprf2JlQaXFKkQx
         57J9NCsYIc+B9XLEg4DCaktcowRbMXlb5X2Ih91WF2uA5fh/On2F/vA4LZ+sJ/DF1BY0
         FQgxzBVT5nNQWVExtzryPZCUx8Hn9zilnaO89kROv4o8lpawB+D1W2pCkDejvzMopqKr
         Ee4x3dE18vaLHuPiMDe20aY4k9OcPgWpB9VactssbKEoDARz0O5XV9MXs0gSgLxSSaWZ
         +Dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D8AH+qgnpBqxYP3dnsb7lV4Lk3+k1PyFSBNROisB3ZM=;
        b=BcfK+5rfnVo+e3nx7GJAfKErGdUqqvoaoUG+1CQY+pneOesQ+ybTJdQ4JAQJGgdhSS
         k0TpDmMR6lK1GbshSIr69XJFyFipIuAyvOf2ktsMVLQALgifr50F5i1Plrcf16wG+UNw
         0oN/IdRou0A7k7O5CrNMNZLQioI7pz+E/JxDImSOqF5YEZEIPAknh3lNuW4PQqdRm31e
         nO5dt1RGOr/uqVh3QrhoBWdu5mlXgi+z2sfX3l5pPrwdlR/pNk3Talep+vmDeaAJs7Zi
         6/0s9z03mJuuiiC26wpJV6fhCBAEvekm0r/lPwMXl1fchFvj3pVLg1oWS9IyUSi8SOuv
         GbFg==
X-Gm-Message-State: AOAM531MDOI+kch6jyUESQvcVOvn+U1Iyde9HP1tG3CE1p47I/82N1qx
	cUZc0t+rcQpbQO7YSkEqWPU=
X-Google-Smtp-Source: ABdhPJyeGKwOgn1RhiCj/MYVzWum2/mqNym3+dWtBmjJjLxbBsMvwqS58aCfXdn0uG7XKiUrkkyTkA==
X-Received: by 2002:a37:a943:: with SMTP id s64mr1224398qke.359.1589379880983;
        Wed, 13 May 2020 07:24:40 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id 5sm10138445qkl.101.2020.05.13.07.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2020 07:24:40 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Subject: [PATCH 2/4] linux-yocto/5.4: update to v5.4.40
Date: Wed, 13 May 2020 10:24:34 -0400
Message-Id: <a974d4acd8b1e23797a5ac506b2a7c1bbd68d8d5.1589378829.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1589378829.git.bruce.ashfield@gmail.com>
References: <cover.1589378829.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    f015b86259a5 Linux 5.4.40
    2852b559afdf PM / devfreq: Add missing locking while setting suspend_freq
    8e054bd6dfc4 udp: document udp_rcv_segment special case for looped packets
    2a03c23b2015 tools headers UAPI: Sync copy of arm64's asm/unistd.h with the kernel sources
    f11664da13b9 Revert "drm/amd/display: setting the DIG_MODE to the correct value."
    c365ff781540 mm/mremap: Add comment explaining the untagging behaviour of mremap()
    8f30c3687f09 libbpf: Fix readelf output parsing for Fedora
    88348bd1f696 cgroup, netclassid: remove double cond_resched
    702d710ffd83 mac80211: add ieee80211_is_any_nullfunc()
    468465fdef4d ACPI: PM: s2idle: Fix comment in acpi_s2idle_prepare_late()
    da283f9be924 platform/x86: GPD pocket fan: Fix error message when temp-limits are out of range
    03f235a5bd3a x86/kvm: fix a missing-prototypes "vmread_error"
    85701f4768a1 ALSA: hda: Match both PCI ID and SSID for driver blacklist
    b8b42c8dcf44 hexagon: define ioremap_uc
    f31c9e904f1d hexagon: clean up ioremap
    1bc508b2d16d mfd: intel-lpss: Use devm_ioremap_uc for MMIO
    78b19f56b952 lib: devres: add a helper function for ioremap_uc
    7a9b738c7511 Revert "software node: Simplify software_node_release() function"
    b8bb9c3192f9 drm/amdgpu: Fix oops when pp_funcs is unset in ACPI event
    3fb4c93dc761 sctp: Fix SHUTDOWN CTSN Ack in the peer restart case
    9da07c4aeaf7 drm/i915: Extend WaDisableDARBFClkGating to icl,ehl,tgl
    d8e0b58fa471 net: systemport: suppress warnings on failed Rx SKB allocations
    5c065ee4a07d net: bcmgenet: suppress warnings on failed Rx SKB allocations
    fd2c9e605269 mac80211: sta_info: Add lockdep condition for RCU list usage
    07fea3d3ef88 lib/mpi: Fix building for powerpc with clang
    bacf98ee0003 tracing: Fix memory leaks in trace_events_hist.c
    c46330d4dabf cifs: do not share tcons with DFS
    84778248e013 scripts/config: allow colons in option strings for sed
    b31e0bd4a97a cifs: protect updating server->dstaddr with a spinlock
    0560b7c3ba48 ASoC: rsnd: Fix "status check failed" spam for multi-SSI
    883d34cdefea ASoC: rsnd: Don't treat master SSI in multi SSI setup as parent
    15de2df38652 net: stmmac: Fix sub-second increment
    8d5a1ddaa9bb net: stmmac: fix enabling socfpga's ptp_ref_clock
    d3539ea43a37 wimax/i2400m: Fix potential urb refcnt leak
    f0d6b056bc18 drm/amdgpu: Correctly initialize thermal controller for GPUs with Powerplay table v0 (e.g Hawaii)
    a09ba140db2f remoteproc: qcom_q6v5_mss: fix a bug in q6v5_probe()
    b2978c307696 ASoC: codecs: hdac_hdmi: Fix incorrect use of list_for_each_entry
    f9c3a17786fd ASoC: rsnd: Fix HDMI channel mapping for multi-SSI mode
    26500b980bf8 ASoC: rsnd: Fix parent SSI start/stop in multi-SSI mode
    5087c7f4e7f2 usb: dwc3: gadget: Properly set maxpacket limit
    ab182c06fc22 ASoC: topology: Fix endianness issue
    ae975c8e1062 ASoC: sgtl5000: Fix VAG power-on handling
    3ea62d49613b selftests/ipc: Fix test failure seen after initial test run
    a5dec15686e9 ASoC: topology: Check return value of soc_tplg_dai_config
    fd8f4a3be50b ASoC: topology: Check return value of pcm_new_ver
    0d452c7e309c ASoC: topology: Check soc_tplg_add_route return value
    76336d4fa881 ASoC: topology: Check return value of soc_tplg_*_create
    db80b7cb17d9 ASoC: topology: Check return value of soc_tplg_create_tlv
    04da88c86c2e drm/bridge: analogix_dp: Split bind() into probe() and real bind()
    336c7260a788 vhost: vsock: kick send_pkt worker once device is started
    592465e6a54b Linux 5.4.39
    eeef0d9fd40d selinux: properly handle multiple messages in selinux_netlink_send()
    1de07eb54ab7 arm64: vdso: Add -fasynchronous-unwind-tables to cflags
    73162ca8156f dmaengine: dmatest: Fix process hang when reading 'wait' parameter
    c753a12c88e8 dmaengine: dmatest: Fix iteration non-stop logic
    d458565e3c02 nfs: Fix potential posix_acl refcnt leak in nfs3_set_acl
    779f155811eb nvme: prevent double free in nvme_alloc_ns() error handling
    57165a241302 Fix use after free in get_tree_bdev()
    c0be115eb22d ALSA: opti9xx: shut up gcc-10 range warning
    3af9be5f5c66 i2c: aspeed: Avoid i2c interrupt status clear race condition.
    501ecc8fc9e5 iommu/amd: Fix legacy interrupt remapping for x2APIC-enabled system
    a0000d228dd3 scsi: target/iblock: fix WRITE SAME zeroing
    de59f2fbe6ca iommu/qcom: Fix local_base status check
    205757f476e8 vfio/type1: Fix VA->PA translation for PFNMAP VMAs in vaddr_get_pfn()
    08e90b299d4e vfio: avoid possible overflow in vfio_iommu_type1_pin_pages
    44e2a98e2b58 i2c: iproc: generate stop event for slave writes
    92c99197815d RDMA/cm: Fix an error check in cm_alloc_id_priv()
    4c499dafdd63 RDMA/cm: Fix ordering of xa_alloc_cyclic() in ib_create_cm_id()
    169b8b62717a RDMA/core: Fix race between destroy and release FD object
    1e12524f09a1 RDMA/core: Prevent mixed use of FDs between shared ufiles
    b7b72a16c5b0 RDMA/siw: Fix potential siw_mem refcnt leak in siw_fastreg_mr()
    7665d88f9d0e RDMA/mlx4: Initialize ib_spec on the stack
    80ba1153bc25 RDMA/mlx5: Set GRH fields in query QP on RoCE
    1f5a2162516e scsi: qla2xxx: check UNLOADING before posting async work
    faa8daca0226 scsi: qla2xxx: set UNLOADING before waiting for session deletion
    4438f397ee4c ARM: dts: imx6qdl-sr-som-ti: indicate powering off wifi is safe
    100cf0ba5b5d dm multipath: use updated MPATHF_QUEUE_IO on mapping for bio-based mpath
    beed763ab934 dm writecache: fix data corruption when reloading the target
    969b9cb1209b dm verity fec: fix hash block number in verity_fec_decode
    c554ab856b66 PM: hibernate: Freeze kernel threads in software_resume()
    8fc24d1029fd PM: ACPI: Output correct message on target power state
    ca662b6014f3 IB/rdmavt: Always return ERR_PTR from rvt_create_mmap_info()
    16cc37b3dc17 dlmfs_file_write(): fix the bogosity in handling non-zero *ppos
    5049385407b4 Drivers: hv: vmbus: Fix Suspend-to-Idle for Generation-2 VM
    95dd3099171e i2c: amd-mp2-pci: Fix Oops in amd_mp2_pci_init() error handling
    ea63e38b29e7 ALSA: pcm: oss: Place the plugin buffer overflow checks correctly
    c867614f196a ALSA: line6: Fix POD HD500 audio playback
    c7577237c228 ALSA: hda/hdmi: fix without unlocked before return
    6426aa65f7ca ALSA: usb-audio: Correct a typo of NuPrime DAC-10 USB ID
    981b7194e82a ALSA: hda/realtek - Two front mics on a Lenovo ThinkCenter
    35a9399714db crypto: caam - fix the address of the last entry of S/G
    ca34751b5819 mmc: meson-mx-sdio: remove the broken ->card_busy() op
    9e3315116f7e mmc: meson-mx-sdio: Set MMC_CAP_WAIT_WHILE_BUSY
    80e99f42608d mmc: sdhci-msm: Enable host capabilities pertains to R1b response
    d8f7e15a65dd mmc: sdhci-pci: Fix eMMC driver strength for BYT-based controllers
    eed4792f9657 mmc: sdhci-xenon: fix annoying 1.8V regulator warning
    31ba94b893b6 mmc: cqhci: Avoid false "cqhci: CQE stuck on" by not open-coding timeout loop
    2b925c4600bf btrfs: transaction: Avoid deadlock due to bad initialization timing of fs_info::journal_info
    67bc5f667a18 btrfs: fix partial loss of prealloc extent past i_size after fsync
    636987650f6b btrfs: fix block group leak when removing fails
    a378abbb8e39 btrfs: fix transaction leak in btrfs_recover_relocation
    e5744821adc9 NFSv4.1: fix handling of backchannel binding in BIND_CONN_TO_SESSION
    6eb95b35fd39 drm/qxl: qxl_release use after free
    c465bc31ed9f drm/qxl: qxl_release leak in qxl_hw_surface_alloc()
    4441fb2ab0fc drm/qxl: qxl_release leak in qxl_draw_dirty_fb()
    f25335a83cf4 drm/amd/display: Fix green screen issue after suspend
    5ec7eb970df4 drm/edid: Fix off-by-one in DispID DTD pixel clock
    ffd99c012a2e dma-buf: Fix SET_NAME ioctl uapi

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index ddd8587dc9..f6acb291fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "129f86f995aac168e041feeda764097593cace75"
-SRCREV_meta ?= "f405543442e6faae2d96b344ed229c3f37268af5"
+SRCREV_machine ?= "5db46f8cf9b485f320287147ce593789ee0b5447"
+SRCREV_meta ?= "4ed477131e6e508d335d70c070eb84a5c3d673e5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.38"
+LINUX_VERSION ?= "5.4.40"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index c841b1c58e..f797aa1df5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.38"
+LINUX_VERSION ?= "5.4.40"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "7fe31c186301aef841d44c92a03ba364c13da2f1"
-SRCREV_machine ?= "6cb5b11e832995945db63a27e999f99e5952b199"
-SRCREV_meta ?= "f405543442e6faae2d96b344ed229c3f37268af5"
+SRCREV_machine_qemuarm ?= "b84f9483ed29096cd9bb6b1922666e8a275dd496"
+SRCREV_machine ?= "29f44c85c379c38f15e544828e7e77b3c008f378"
+SRCREV_meta ?= "4ed477131e6e508d335d70c070eb84a5c3d673e5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index fd8dab1b54..65afdc32fa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "32b7ccec6c9e093f1fb21c2849dc099b735f47b3"
-SRCREV_machine_qemuarm64 ?= "6cb5b11e832995945db63a27e999f99e5952b199"
-SRCREV_machine_qemumips ?= "2f15acf8311f6c77ffe0ec5ab7dc4580d5aad5cd"
-SRCREV_machine_qemuppc ?= "6cb5b11e832995945db63a27e999f99e5952b199"
-SRCREV_machine_qemuriscv64 ?= "6cb5b11e832995945db63a27e999f99e5952b199"
-SRCREV_machine_qemux86 ?= "6cb5b11e832995945db63a27e999f99e5952b199"
-SRCREV_machine_qemux86-64 ?= "6cb5b11e832995945db63a27e999f99e5952b199"
-SRCREV_machine_qemumips64 ?= "dbec39f84a447f9d1df6c9ec27e752fd488f7bb4"
-SRCREV_machine ?= "6cb5b11e832995945db63a27e999f99e5952b199"
-SRCREV_meta ?= "f405543442e6faae2d96b344ed229c3f37268af5"
+SRCREV_machine_qemuarm ?= "cbe84f8dbb7fe4a67a337795d81cca735346f4c8"
+SRCREV_machine_qemuarm64 ?= "29f44c85c379c38f15e544828e7e77b3c008f378"
+SRCREV_machine_qemumips ?= "b0ad6cf1238ec97860a9e26a6da1aa431c5b96fb"
+SRCREV_machine_qemuppc ?= "29f44c85c379c38f15e544828e7e77b3c008f378"
+SRCREV_machine_qemuriscv64 ?= "29f44c85c379c38f15e544828e7e77b3c008f378"
+SRCREV_machine_qemux86 ?= "29f44c85c379c38f15e544828e7e77b3c008f378"
+SRCREV_machine_qemux86-64 ?= "29f44c85c379c38f15e544828e7e77b3c008f378"
+SRCREV_machine_qemumips64 ?= "5247564ab2b897a678ed0cd8fb2905c918fc64df"
+SRCREV_machine ?= "29f44c85c379c38f15e544828e7e77b3c008f378"
+SRCREV_meta ?= "4ed477131e6e508d335d70c070eb84a5c3d673e5"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.38"
+LINUX_VERSION ?= "5.4.40"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

