Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617D2C4167D
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:32 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.2938.1702391305445726212
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:28:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=WG987AMv;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-6d0985c70ffso1171214b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391304; x=1702996104; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enilyZxJEAHR9UJ6g5do/1z+k5UyO5voGzxNoulWScg=;
        b=WG987AMvVl0ZxheHOucIDs7s16/3W7XOHHBahxR4ZEJKLJO65s6EvppCsiF6tAE+T/
         tpMUD1XcGgUSMYAkR/9e77uwfEa2TiW7cICbaNrzAOVWy+Dywii9OyffTxdaKdTUWxGB
         Hv2Ec+mBhweTfGvDFjrUAHaFMFysF0IX2Pd3WLRV30JAAg5lFIlG6iUwEXu2CZcO0I79
         Tn8hlB4i3zwtXKyBWGQ9UELI+ZnOLxqJwnqG0mVUzuIJ1G56fRC6l4e8eyUMCcbXmZsm
         SlWD9lZdghI9VoHBaOIJHeDpmf7e339i+vq4p3mLeT04VMM0qyg8DEQ87Ok2m6eA7F2F
         5ztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391304; x=1702996104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enilyZxJEAHR9UJ6g5do/1z+k5UyO5voGzxNoulWScg=;
        b=NDyCnQ9LNROrLuM60HuCmVZDXnPO0smi3tDQ0/7HIfthMq6dvx8AByscPklEZqVvLn
         vLOqE7e2VCzc7H3NQ12dl1+BpNMCPEsWL6eOTAkrX/sdKpYdC1tRZ+Lbc+bBoYx6XEv9
         amZVcpVTC9GDkZck1wxnOO+osq8Bq/4NBhsDm+Ayhn2rv/erH0PSOazJgIKK2GpiOwp7
         69ngHYw8jbVsI/r8RbKN/Li866xOcTRLi52iSxoBZgEPJOAIKsYKwov4Ynbo4Ht3BjIB
         lN4L3HSs5ds4jI13rw7iQ8rm4SosU6qYHnmjINvAE1yscX8GdzLvwmqmAb4o7ocj1+uH
         /DyA==
X-Gm-Message-State: AOJu0YyekxwOkuzm01sparlc4kOQTWyoMGCAVSszDCHgO1nYHVZRRcv1
	uKz7a/69YbCHcbIvxcMa1GfEuXH4E0g6g7EGeGQ=
X-Google-Smtp-Source: AGHT+IHmb/ST6zvW+15UYrB2u8jemrsaMIqHMJH/Zy3aabQMf5IvcVW4bB1s8xLjvPP0pmzaaKLUKg==
X-Received: by 2002:a05:6a20:1b26:b0:191:60f3:8b32 with SMTP id ch38-20020a056a201b2600b0019160f38b32mr945367pzb.76.1702391304352;
        Tue, 12 Dec 2023 06:28:24 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.28.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:28:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 22/29] linux-yocto/6.5: update to v6.5.11
Date: Tue, 12 Dec 2023 04:27:28 -1000
Message-Id: <fb7733d173258bb951aa924946266bab309362b1.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192226

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    799441832db1 Linux 6.5.11
    dd1756d79179 ASoC: SOF: sof-pci-dev: Fix community key quirk detection
    aab16960e6e7 ALSA: hda: intel-dsp-config: Fix JSL Chromebook quirk detection
    575d3966a7da serial: core: Fix runtime PM handling for pending tx
    9f625a9ec6ad misc: pci_endpoint_test: Add deviceID for J721S2 PCIe EP device support
    fe3545fb7c39 dt-bindings: serial: rs485: Add rs485-rts-active-high
    71a913eb5331 tty: 8250: Add Brainboxes Oxford Semiconductor-based quirks
    7ffbf5db6963 tty: 8250: Add support for Intashield IX cards
    8435b1f55760 tty: 8250: Add support for additional Brainboxes PX cards
    21b8147a36f8 tty: 8250: Fix up PX-803/PX-857
    98f984ff81de tty: 8250: Fix port count of PX-257
    256a534427e9 tty: 8250: Add support for Intashield IS-100
    933dde5b2082 tty: 8250: Add support for Brainboxes UP cards
    a4a09f0ed3cd tty: 8250: Add support for additional Brainboxes UC cards
    ca7f138b2c52 tty: 8250: Remove UC-257 and UC-431
    19d34b73234a tty: n_gsm: fix race condition in status line change on dead connections
    fd277724946d Bluetooth: hci_bcm4377: Mark bcm4378/bcm4387 as BROKEN_LE_CODED
    885108988763 usb: raw-gadget: properly handle interrupted requests
    9ee038590d80 usb: typec: tcpm: Fix NULL pointer dereference in tcpm_pd_svdm()
    de5ac4d46304 usb: typec: tcpm: Add additional checks for contaminant
    80105fc04b44 usb: storage: set 1.50 as the lower bcdDevice for older "Super Top" compatibility
    c99f302ea679 PCI: Prevent xHCI driver from claiming AMD VanGogh USB3 DRD device
    52d89332fbc6 ALSA: usb-audio: add quirk flag to enable native DSD for McIntosh devices
    c75a5e421b07 mmap: fix error paths with dup_anon_vma()
    578c20ab383f mmap: fix vma_iterator in error path of vma_merge()
    cd91606eff46 perf evlist: Avoid frequency mode for the dummy event
    65d457433a08 power: supply: core: Use blocking_notifier_call_chain to avoid RCU complaint
    a58f5fabcab0 rust: types: make `Opaque` be `!Unpin`
    7fba72536eb5 rust: make `UnsafeCell` the outer type in `Opaque`
    07256dc046b1 drm/amd/display: Don't use fsleep for PSR exit waits
    4ec5def87694 ceph_wait_on_conflict_unlink(): grab reference before dropping ->d_lock
    fd652af1e1f9 io_uring: kiocb_done() should *not* trust ->ki_pos if ->{read,write}_iter() failed
    fd318cc5b221 powerpc/mm: Fix boot crash with FLATMEM
    c1d14ab7d666 r8152: Check for unplug in r8153b_ups_en() / r8153c_ups_en()
    b233d39f7e15 r8152: Check for unplug in rtl_phy_patch_request()
    19471af243b2 net: chelsio: cxgb4: add an error code check in t4_load_phy_fw
    17002b8f2606 riscv: dts: thead: set dma-noncoherent to soc bus
    9f0400d31e56 drm/amdgpu: Reserve fences for VM update
    6ca3c25f5472 platform/mellanox: mlxbf-tmfifo: Fix a warning message
    6cca6f997088 netfilter: nf_tables: audit log object reset once per table
    99d311781fe5 LoongArch: Disable WUC for pgprot_writecombine() like ioremap_wc()
    6b43fea5f245 LoongArch: Replace kmap_atomic() with kmap_local_page() in copy_user_highpage()
    c86a4fbc2d5a LoongArch: Export symbol invalid_pud_table for modules building
    74f9c03ecf79 LoongArch: Use SYM_CODE_* to annotate exception handlers
    19fe554e5fcf gpu/drm: Eliminate DRM_SCHED_PRIORITY_UNSET
    4ca54e8b459d drm/amdgpu: Unset context priority is now invalid
    4debab37b1bc ASoC: da7219: Correct the process of setting up Gnd switch in AAD
    22da32b45717 scsi: mpt3sas: Fix in error path
    8377f82beacf fbdev: uvesafb: Call cn_del_callback() at the end of uvesafb_exit()
    0a997e6eeee8 fbdev: omapfb: fix some error codes
    93ff3297b04a drm/ttm: Reorder sys manager cleanup step
    0074d0980bf8 s390/kasan: handle DCSS mapping in memory holes
    652d60ecb7a5 ASoC: codecs: tas2780: Fix log of failed reset via I2C.
    4dd62532e05c ASoC: rt5650: fix the wrong result of key button
    ce5329ee79e5 efi: fix memory leak in krealloc failure handling
    c76be4af694e x86/efistub: Don't try to print after ExitBootService()
    5c4e4f31643d net/mlx5: Bridge, fix peer entry ageing in LAG mode
    ead8d9a6b6ff netfilter: nfnetlink_log: silence bogus compiler warning
    988ed1c96c42 ASoC: soc-dapm: Add helper for comparing widget name
    c68a8c5b50b9 spi: npcm-fiu: Fix UMA reads when dummy.nbytes == 0
    6777f23bca89 fs/ntfs3: Avoid possible memory leak
    b9ec0e799a2d fs/ntfs3: Fix directory element type detection
    0030ccd87a87 fs/ntfs3: Fix NULL pointer dereference on error in attr_allocate_frame()
    3228a2e0e5a7 fs/ntfs3: Fix possible NULL-ptr-deref in ni_readpage_cmpr()
    d408008a881a fs/ntfs3: Do not allow to change label if volume is read-only
    da05aa786c20 fs/ntfs3: Add more info into /proc/fs/ntfs3/<dev>/volinfo
    31baaf864b39 fs/ntfs3: Fix alternative boot searching
    1d7dd485108d fs/ntfs3: Add more attributes checks in mi_enum_attr()
    36ffca949ab2 fs/ntfs3: Use kvmalloc instead of kmalloc(... __GFP_NOWARN)
    28ece3bd8596 fs/ntfs3: Write immediately updated ntfs state
    8d3d7dbdbddd fs/ntfs3: Add ckeck in ni_update_parent()
    78b4576f0e38 fbdev: atyfb: only use ioremap_uc() on i386 and ia64
    83a28f46ed3c Input: synaptics-rmi4 - handle reset delay when using SMBus trsnsport
    a18a7cc55c5b media: i2c: ov8858: Don't set fwnode in the driver
    d4c3cb925e65 powerpc/85xx: Fix math emulation exception
    0cae483a9c8e ata: pata_parport: fit3: implement IDE command set registers
    e2fa6f732a73 ata: pata_parport: add custom version of wait_after_reset
    142ac0fda553 dmaengine: ste_dma40: Fix PM disable depth imbalance in d40_probe
    5976e4ed1405 irqchip/stm32-exti: add missing DT IRQ flag translation
    b65f1eec2d8e irqchip/riscv-intc: Mark all INTC nodes as initialized
    4b0dfa2fc745 can: flexcan: remove the auto stop mode for IMX93
    4bd493ce8d74 arm64: dts: imx93: add the Flex-CAN stop mode by GPR
    92705546718b net: sched: cls_u32: Fix allocation size in u32_init()
    6f9195596a6f ASoC: tlv320adc3xxx: BUG: Correct micbias setting
    31af9e3be3cd ASoC: core: Do not call link_exit() on uninitialized rtd objects
    0716f52fa334 ASoC: fsl-asoc-card: use integer type for fll_id and pll_id
    ac947c0992ef coresight: tmc-etr: Disable warnings for allocation failures
    4dfa1e33d481 ASoC: simple-card: fixup asoc_simple_probe() error handling
    8555438a0d87 ASoC: Intel: sof_sdw: add support for SKU 0B14

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0f56f12e7353f97855befb765ca8c0117736cb96)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.5.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.5.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.5.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
index abe788f03d..0e64802f6a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.5.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "833c5da68398da64271c26188b9e15286e8e725c"
-SRCREV_meta ?= "699ca25eafb4b8244966a27e3bbef3d5891fb7e8"
+SRCREV_machine ?= "a4872c458c13becaa620d5d566627be6c1c96110"
+SRCREV_meta ?= "8368cc1f9d0a6f8681602a918746df3b3932bad6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.5.10"
+LINUX_VERSION ?= "6.5.11"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
index ca1c17a84e..1be3186309 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.5.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.5.inc
 
-LINUX_VERSION ?= "6.5.10"
+LINUX_VERSION ?= "6.5.11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "16b52743d64980d531e120aec62c9220b695a269"
-SRCREV_meta ?= "699ca25eafb4b8244966a27e3bbef3d5891fb7e8"
+SRCREV_machine ?= "ddd6dc84db4e5db7a0fee112cc7b1a52995e81e8"
+SRCREV_meta ?= "8368cc1f9d0a6f8681602a918746df3b3932bad6"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.5.bb b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
index 43ab8c2776..2ac3bc6afe 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.5.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.5.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.5/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.5/standard/base"
 KBRANCH:qemumips64 ?= "v6.5/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "eb2eba60c726fd5c0257422e55117f46f792f72e"
-SRCREV_machine:qemuarm64 ?= "e709bc7ca85655ff5317fbcf4c8cb69365b6fc40"
-SRCREV_machine:qemuloongarch64 ?= "128116621dee1ddbc7cf5f58cddc708d7b823600"
-SRCREV_machine:qemumips ?= "0524fc1380569f39eb5473cc8344ce2e4e78a82d"
-SRCREV_machine:qemuppc ?= "0b23c1d5705f5efa91b3757377ec284b1d42a84a"
-SRCREV_machine:qemuriscv64 ?= "128116621dee1ddbc7cf5f58cddc708d7b823600"
-SRCREV_machine:qemuriscv32 ?= "128116621dee1ddbc7cf5f58cddc708d7b823600"
-SRCREV_machine:qemux86 ?= "128116621dee1ddbc7cf5f58cddc708d7b823600"
-SRCREV_machine:qemux86-64 ?= "128116621dee1ddbc7cf5f58cddc708d7b823600"
-SRCREV_machine:qemumips64 ?= "b63329018323409369e952c84ac6481e68a9b6af"
-SRCREV_machine ?= "128116621dee1ddbc7cf5f58cddc708d7b823600"
-SRCREV_meta ?= "699ca25eafb4b8244966a27e3bbef3d5891fb7e8"
+SRCREV_machine:qemuarm ?= "650162631e214a1f5dd07566245df299ee89f2c3"
+SRCREV_machine:qemuarm64 ?= "2618fc22ebc89c444e2b9b7647ca56e20ddc54f2"
+SRCREV_machine:qemuloongarch64 ?= "74791bad5376c0b615bb1c68026dc826c2405483"
+SRCREV_machine:qemumips ?= "b087920fa750313ed71e34ae39bf03c53d3308dc"
+SRCREV_machine:qemuppc ?= "ffcbdde1cfbbc800ee89ab53918a04e190cc586a"
+SRCREV_machine:qemuriscv64 ?= "74791bad5376c0b615bb1c68026dc826c2405483"
+SRCREV_machine:qemuriscv32 ?= "74791bad5376c0b615bb1c68026dc826c2405483"
+SRCREV_machine:qemux86 ?= "74791bad5376c0b615bb1c68026dc826c2405483"
+SRCREV_machine:qemux86-64 ?= "74791bad5376c0b615bb1c68026dc826c2405483"
+SRCREV_machine:qemumips64 ?= "367dfdd491f461fb94db8463c443007669b64a65"
+SRCREV_machine ?= "74791bad5376c0b615bb1c68026dc826c2405483"
+SRCREV_meta ?= "8368cc1f9d0a6f8681602a918746df3b3932bad6"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "43a868577dfcd9be6930453dc5ec557ab2e9ad89"
+SRCREV_machine:class-devupstream ?= "799441832db16b99e400ccbec55db801e6992819"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.5/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.5;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.5.10"
+LINUX_VERSION ?= "6.5.11"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


