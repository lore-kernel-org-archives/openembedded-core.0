Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web12.57676.1595862630856381032
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:10:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PBDAQw4B;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.66, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f66.google.com with SMTP id il6so3787926pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2020 08:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=81G3CMqHth9g0P5KAXGTpVK7VTl1vWyZUvtuB/uxA2k=;
        b=PBDAQw4B8Lz91T+DM/Byu2vWasNCgdmiO0BhxW/f84oAzrcYb7af3fP1cbygTsQ+ns
         OPdiD93lto3AOY2rDa9qwJitT1uR03Hephoco9rJohT1JcfgrPdOT/sirhnuIz5zK20w
         LKG76Ec9BwEI6p5x5OpnyE7Nv4ZqTHI527JvKrcEIymRamNZFPp/CXfX8FtzQL5Woeh6
         ZqJ7mX5OxuNaVBWu7wOopsUoF8TwHUh8xuCZKzqiAi71c3IKaMc2B9riNQfHcv2TLxoi
         zLW9U3tdo8vB6GDkUq/7KMJRLTpoA2drI9qdpzfP1lBhJC9r292JdcszHePhwmlvFzwq
         l4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=81G3CMqHth9g0P5KAXGTpVK7VTl1vWyZUvtuB/uxA2k=;
        b=MHk2/XcDFJ1+C1UR7x8lGeQ5LKkWJcvEOUjxaUp2p1fp5T09UwoxRIVIwAcNbWST5y
         SKlORznyv+6VBZEO+LEdiZmZIvVIc1ySR/gcdzbJx7Sk+8hGDK+Yp3XNqCZmOWUzg1Gu
         choUf2MyXg+Sq/HwLf+DJiPKCMms/QBck/Lw1QdMSsKdgc9q1BGgnbNvB5YL5WYBAMJ4
         2fxdKj0qLCJiHZ1fi2Vietsrf9hiICx1zcWqbjeqBFXseMNtIKHZB0CRG7Jihn2WZ7J/
         8HVj9fnxyEjfzikKrnBBCwv6/xev8YrOoTfDYYyj6h35a6sZErK61zG5ITaJZgZLQvlQ
         bEOw==
X-Gm-Message-State: AOAM532QmNyb7DMqwLUXAzzklZ2lJR/gssPo1ZQyUXNiq0ZWCmkRGhbj
	TEQIO/2D09V+pupo7FVoSqGqNW7x1H4=
X-Google-Smtp-Source: ABdhPJwfwa4m9gAkw8VvFsoBV2BQeVtpDG3XJA5/kMsvsoxOCCqBvjPp43G9+Qy2jCVoAckuRmoV2w==
X-Received: by 2002:a17:90a:7483:: with SMTP id p3mr19084440pjk.64.1595862629566;
        Mon, 27 Jul 2020 08:10:29 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id p127sm14929495pfb.17.2020.07.27.08.10.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 08:10:28 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/18] linux-yocto/5.4: update to v5.4.51
Date: Mon, 27 Jul 2020 05:09:46 -1000
Message-Id: <aee5754b848fea174d27e2af9d88134680c4ec30.1595862361.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1595862361.git.steve@sakoman.com>
References: <cover.1595862361.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    1c54d3c15afa Linux 5.4.51
    8ba1913cd6ba efi: Make it possible to disable efivar_ssdt entirely
    43986c32ee00 dm zoned: assign max_io_len correctly
    215e562251bb x86/resctrl: Fix memory bandwidth counter width for AMD
    d827fe702e07 mm, compaction: make capture control handling safe wrt interrupts
    64a94c550c44 mm, compaction: fully assume capture is not NULL in compact_zone_order()
    2a9278ac9c55 irqchip/gic: Atomically update affinity
    7ba23593cbc5 dma-buf: Move dma_buf_release() from fops to dentry_ops
    4ae695a05516 drm/amdgpu/atomfirmware: fix vram_info fetching for renoir
    2b8c0876bf71 drm/amdgpu: use %u rather than %d for sclk/mclk
    94de85d16b0c drm/amd/display: Only revalidate bandwidth on medium and fast updates
    032343ed6927 MIPS: Add missing EHB in mtc0 -> mfc0 sequence for DSPen
    2e859b14da39 MIPS: lantiq: xway: sysctrl: fix the GPHY clock alias names
    71a20b798da3 cifs: Fix the target file was deleted when rename failed.
    49dae9bed7dd SMB3: Honor 'handletimeout' flag for multiuser mounts
    7ab27439fec7 SMB3: Honor lease disabling for multiuser mounts
    0d5824aea7a0 SMB3: Honor persistent/resilient handle flags for multiuser mounts
    d56787683c61 SMB3: Honor 'seal' flag for multiuser mounts
    e0ed5a36fb3a Revert "ALSA: usb-audio: Improve frames size computation"
    fe05e114d0fd nfsd: apply umask on fs without ACL support
    4ee7f1d2f1c9 spi: spi-fsl-dspi: Fix external abort on interrupt in resume or exit paths
    9d60af5c3bb3 i2c: mlxcpld: check correct size of maximum RECV_LEN packet
    b460fc9d0525 i2c: algo-pca: Add 0x78 as SCL stuck low status for PCA9665
    a632f91f7a9c samples/vfs: avoid warning in statx override
    cd62eeb31512 nvme: fix a crash in nvme_mpath_add_disk
    c64141c68f72 nvme: fix identify error status silent ignore
    7d3f489e61b6 SMB3: Honor 'posix' flag for multiuser mounts
    8964c93436ad virtio-blk: free vblk-vqs in error path of virtblk_probe()
    f795a88eade5 drm: sun4i: hdmi: Remove extra HPD polling
    c84138b3c162 nfsd: fix nfsdfs inode reference count leak
    2571e1735602 nfsd4: fix nfsdfs reference count loop
    31ec38ec9cd5 thermal/drivers/rcar_gen3: Fix undefined temperature if negative
    a65bde001008 thermal/drivers/mediatek: Fix bank number settings on mt8183
    c9426817eac7 hwmon: (acpi_power_meter) Fix potential memory leak in acpi_power_meter_add()
    3e7bd7e10639 hwmon: (max6697) Make sure the OVERT mask is set correctly
    0465f54c5cc4 cxgb4: fix SGE queue dump destination buffer context
    6bcb00d08361 cxgb4: use correct type for all-mask IP address comparison
    f68bda772639 cxgb4: fix endian conversions for L4 ports in filters
    180fbf10a26d cxgb4: parse TC-U32 key values and masks natively
    0dc4dd433b94 cxgb4: use unaligned conversion for fetching timestamp
    8a1b8e64204e RDMA/counter: Query a counter before release
    53e9b62672f7 rxrpc: Fix afs large storage transmission performance drop
    60d7de28e0ca drm/msm/dpu: fix error return code in dpu_encoder_init
    cc0f67835302 crypto: af_alg - fix use-after-free in af_alg_accept() due to bh_lock_sock()
    5d6b46a94dbb tpm: Fix TIS locality timeout problems
    563e9491f0a3 selftests: tpm: Use /bin/sh instead of /bin/bash
    1f98a9ed5799 kgdb: Avoid suspicious RCU usage warning
    e6b2e3b5e16e nvme-multipath: fix bogus request queue reference put
    5e9523d7e8cd nvme-multipath: fix deadlock due to head->lock
    ad69fbe1d262 nvme-multipath: fix deadlock between ana_work and scan_work
    c4f007d3dbdd nvme-multipath: set bdi capabilities once
    8f4aa3a6de24 s390/debug: avoid kernel warning on too large number of pages
    517326aaf41e tools lib traceevent: Handle __attribute__((user)) in field names
    6f3b8c269d88 tools lib traceevent: Add append() function helper for appending strings
    3dca0a299ff4 usb: usbtest: fix missing kfree(dev->buf) in usbtest_disconnect
    0ff5b1b50d5c rxrpc: Fix race between incoming ACK parser and retransmitter
    fe688b144c14 mm/slub: fix stack overruns with SLUB_STATS
    f459e8fc7c69 mm/slub.c: fix corrupted freechain in deactivate_slab()
    542d541c1edd sched/debug: Make sd->flags sysctl read-only
    ab9ee18f4646 usbnet: smsc95xx: Fix use-after-free after removal
    58ab86e58b55 EDAC/amd64: Read back the scrub rate PCI register on F15h
    d0e533584a05 mm: fix swap cache node allocation mask
    1c4404efcf2c io_uring: make sure async workqueue is canceled on exit

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 60ee8b2bc14af7bf5b69d00c5d6293f09125407c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index a4b593b96d..22a0dc997e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6415a4e7c405526f97049ede833f52127a5ce7a1"
-SRCREV_meta ?= "416566e1f01c3c02ca5b3a03d0943df387d521f0"
+SRCREV_machine ?= "a1e1e3cbe42d8a08de5a3e3daaa2b389e352fe77"
+SRCREV_meta ?= "caafbdfe382bf22a4786d871af097acd49d0867a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.50"
+LINUX_VERSION ?= "5.4.51"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 0622d33835..86e133f9f2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.50"
+LINUX_VERSION ?= "5.4.51"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "1a8a14e45f01cfee926c5b35d2d67e6f1a7eebfc"
-SRCREV_machine ?= "94667198aabf869571bdff5291a24956796faddf"
-SRCREV_meta ?= "416566e1f01c3c02ca5b3a03d0943df387d521f0"
+SRCREV_machine_qemuarm ?= "d4c9ad88abadd22f7b2785e8a101523fe9a74dc0"
+SRCREV_machine ?= "fed60f1c8e56095647fa8497270ecacea4c45dbc"
+SRCREV_meta ?= "caafbdfe382bf22a4786d871af097acd49d0867a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 2476b3502c..e79793b5f0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "99743105f331e90852ccb9e72ce26134dbcafec6"
-SRCREV_machine_qemuarm64 ?= "94667198aabf869571bdff5291a24956796faddf"
-SRCREV_machine_qemumips ?= "886870e5abaeaaf753fb50a1e5be56336c44c642"
-SRCREV_machine_qemuppc ?= "94667198aabf869571bdff5291a24956796faddf"
-SRCREV_machine_qemuriscv64 ?= "94667198aabf869571bdff5291a24956796faddf"
-SRCREV_machine_qemux86 ?= "94667198aabf869571bdff5291a24956796faddf"
-SRCREV_machine_qemux86-64 ?= "94667198aabf869571bdff5291a24956796faddf"
-SRCREV_machine_qemumips64 ?= "7548abbb409eeef6f0575eed25231090f902559e"
-SRCREV_machine ?= "94667198aabf869571bdff5291a24956796faddf"
-SRCREV_meta ?= "416566e1f01c3c02ca5b3a03d0943df387d521f0"
+SRCREV_machine_qemuarm ?= "601e67d37274e4a0890bcdbe6660c2dbd08d3b97"
+SRCREV_machine_qemuarm64 ?= "fed60f1c8e56095647fa8497270ecacea4c45dbc"
+SRCREV_machine_qemumips ?= "c8543a84037b88da45d0d825216187b42d0c509a"
+SRCREV_machine_qemuppc ?= "fed60f1c8e56095647fa8497270ecacea4c45dbc"
+SRCREV_machine_qemuriscv64 ?= "fed60f1c8e56095647fa8497270ecacea4c45dbc"
+SRCREV_machine_qemux86 ?= "fed60f1c8e56095647fa8497270ecacea4c45dbc"
+SRCREV_machine_qemux86-64 ?= "fed60f1c8e56095647fa8497270ecacea4c45dbc"
+SRCREV_machine_qemumips64 ?= "c741fec6daabb449d08c9f96052be1477fe3c968"
+SRCREV_machine ?= "fed60f1c8e56095647fa8497270ecacea4c45dbc"
+SRCREV_meta ?= "caafbdfe382bf22a4786d871af097acd49d0867a"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.50"
+LINUX_VERSION ?= "5.4.51"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1

