Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F148E728F3
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:15:46 +0000 (UTC)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
 by mx.groups.io with SMTP id smtpd.web10.28102.1696018542069733443
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:15:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SLxySejq;
 spf=pass (domain: gmail.com, ip: 209.85.221.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-499e2dd41ccso5104151e0c.1
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696018541; x=1696623341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W5IDZD9YeuGZKn8BMah4ZIdqS1McKHpO8LJR4qX+vFI=;
        b=SLxySejqZD54IdgGkZe1bJcvzCLDUpPKMNNEQw771ns2jrR9CxP1Ld5F2iT3ZyPWe+
         qyz35ouJxZrEd2HEKkgen94BfSazh0WmvrnDIef4KDGCivNs2HNCn1hV1B/w/HZCWzFT
         8MMS78Csr3jfJax9ZDVAq9EG0OmUs1O/a97yL0p42ZgNxuqstm3jIMYfrt7S6HtBXLVR
         UeRkK9BCjhLKDqJtfBSgXicrEn+P/CK2yJ5hlN8Fp88B/ftI83l+qwnPceEk1RrYubbF
         mZlKQ1Rw88pjEEWtScNuxcHCDIRhQyrhrnxC8gqKxmfnfLF86dvLBAQoAdDbJar/XCAy
         J51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696018541; x=1696623341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W5IDZD9YeuGZKn8BMah4ZIdqS1McKHpO8LJR4qX+vFI=;
        b=YsDa/dD4RwzUETJ+KLUmCFmc069n+BbXhavm4PIwGqGMjCN5vzeE74ztI668IFwQQc
         hugDw0Uq3fU9Ve6MimtMdhSkvcS2GRRlGa6qCBi/hdiQV/t1YiaHtqT9ak9ZPUBfStSO
         D9uGNCONhG0AXLrPH/olB+QqlqjPDunSv7/zCT9mDD1EN7YwHVr9QYKY/QGyIXUMMSF8
         cnpjpwkIGjxFzaUzGZWPWMNDcQVOWEqVxAhjU4KOSCXFzHfaPTB67+M7fhAoEOxQmQfg
         /N/IhwFnVksgwXlSb1ZXjutFnhPKGeo9DBrLAUlUHXlaWXOUfAqA46k2wNRJddnS+NNt
         3jRQ==
X-Gm-Message-State: AOJu0Ywc/aCxBeJZ9oaKnrHMawP6cEmJU2L+GMFQOF1LZewPjaFIO8e5
	G+X8xvFGXY+XUcCxNS/KSvm4bAuvdEKK/A==
X-Google-Smtp-Source: AGHT+IFFkFD8rgPZ9cbJ9ZvBeAEo2RDsMAsGW5y7pLztL/FCI5CdWUuycB8WIqYZ7oZRlwhoLD2DUQ==
X-Received: by 2002:a1f:cd87:0:b0:48d:13e5:1376 with SMTP id d129-20020a1fcd87000000b0048d13e51376mr4615120vkg.10.1696018540807;
        Fri, 29 Sep 2023 13:15:40 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id y22-20020ac87c96000000b0041957506ca9sm2616656qtv.15.2023.09.29.13.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:15:40 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/5] linux-yocto/5.10: update to v5.10.192
Date: Fri, 29 Sep 2023 16:15:34 -0400
Message-Id: <20230929201536.3517331-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929201536.3517331-1-bruce.ashfield@gmail.com>
References: <20230929201536.3517331-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 20:15:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188439

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    1599cb60bace Linux 5.10.192
    0e8139f92304 x86/srso: Correct the mitigation status when SMT is disabled
    23e59874657c objtool/x86: Fixup frame-pointer vs rethunk
    26e3f7690cda x86/retpoline,kprobes: Fix position of thunk sections with CONFIG_LTO_CLANG
    88e16ce7f8a6 x86/srso: Disable the mitigation on unaffected configurations
    69712baf2495 x86/CPU/AMD: Fix the DIV(0) initial fix attempt
    62ebfeb0dcf7 x86/retpoline: Don't clobber RFLAGS during srso_safe_ret()
    91b349289ef1 x86/static_call: Fix __static_call_fixup()
    d2be58f9215a x86/srso: Explain the untraining sequences a bit more
    06597b650beb x86/cpu: Cleanup the untrain mess
    e0f50b0e4186 x86/cpu: Rename srso_(.*)_alias to srso_alias_\1
    0676a392539b x86/cpu: Rename original retbleed methods
    8b0ff83e8ad3 x86/cpu: Clean up SRSO return thunk mess
    20e24c8b4c2a x86/ibt: Add ANNOTATE_NOENDBR
    bbbe1b23c7e6 objtool: Add frame-pointer-specific function ignore
    bd3d12e6fda0 x86/alternative: Make custom return thunk unconditional
    043d3bfe0a72 x86/cpu: Fix up srso_safe_ret() and __x86_return_thunk()
    d5b3c88d153c x86/cpu: Fix __x86_return_thunk symbol type
    5962f64ed2b6 mmc: f-sdh30: fix order of function calls in sdhci_f_sdh30_remove
    98c7fe38c41e net: fix the RTO timer retransmitting skb every 1ms if linear option is enabled
    9aead733f5e0 virtio-net: set queues after driver_ok
    c080cee93030 af_unix: Fix null-ptr-deref in unix_stream_sendpage().
    7aa165d761e7 netfilter: set default timeout to 3 secs for sctp shutdown send and recv state
    e62de63c63f3 mmc: block: Fix in_flight[issue_type] value error
    9022e9e62db9 mmc: wbsd: fix double mmc_free_host() in wbsd_init()
    6e74926ede96 cifs: Release folio lock on fscache read hit.
    a04ac0c31881 ALSA: usb-audio: Add support for Mythware XA001AU capture and playback interfaces.
    bd70d0b28010 serial: 8250: Fix oops for port->pm on uart_change_pm()
    03a7f213af46 ALSA: hda/realtek - Remodified 3k pull low procedure
    b7d1c719842d ASoC: meson: axg-tdm-formatter: fix channel slot allocation
    e761b7e90ac9 ASoC: rt5665: add missed regulator_bulk_disable
    d23dd85903c9 arm64: dts: rockchip: Disable HS400 for eMMC on ROCK Pi 4
    70626b93d6eb arm64: dts: rockchip: sort nodes/properties on rk3399-rock-4
    7ba9ac0b5a90 arm64: dts: rockchip: fix regulator name on rk3399-rock-4
    fba59a4b55ae arm64: dts: rockchip: add SPDIF node for ROCK Pi 4
    77806f63c317 arm64: dts: rockchip: add ES8316 codec for ROCK Pi 4
    1411c3e86e66 arm64: dts: rockchip: use USB host by default on rk3399-rock-pi-4
    eb5b1e932c18 arm64: dts: rockchip: fix supplies on rk3399-rock-pi-4
    73990370d63d bus: ti-sysc: Flush posted write on enable before reset
    0a593e8a9d24 net: do not allow gso_size to be set to GSO_BY_FRAGS
    51bc052db86d sock: Fix misuse of sk_under_memory_pressure()
    773075d38a2f net: dsa: mv88e6xxx: Wait for EEPROM done before HW reset
    0a9040dedec2 i40e: fix misleading debug logs
    abe68922d774 team: Fix incorrect deletion of ETH_P_8021AD protocol vid from slaves
    526d42c558f5 net: phy: broadcom: stub c45 read/write for 54810
    a7653eaea0a5 netfilter: nft_dynset: disallow object maps
    49f57a9087d1 ipvs: fix racy memcpy in proc_do_sync_threshold
    c8d0d3811e20 drm/panel: simple: Fix AUO G121EAN01 panel timings according to the docs
    86517421f470 selftests: mirror_gre_changes: Tighten up the TTL test match
    614811692e21 xfrm: add forgotten nla_policy for XFRMA_MTIMER_THRESH
    bd30aa9c7feb xfrm: add NULL check in xfrm_update_ae_params
    0b4d69539fde ip_vti: fix potential slab-use-after-free in decode_session6
    ec23b25e5687 ip6_vti: fix slab-use-after-free in decode_session6
    bafa23638081 xfrm: fix slab-use-after-free in decode_session6
    0f89909c80a9 net: xfrm: Amend XFRMA_SEC_CTX nla_policy structure
    8b92d03cfcec net: af_key: fix sadb_x_filter validation
    7e50815d2903 net: xfrm: Fix xfrm_address_filter OOB read
    549e4e167a4d i2c: designware: Handle invalid SMBus block data response length value
    bd7bef82ce0e btrfs: fix BUG_ON condition in btrfs_cancel_balance
    483d713ba2f6 tty: serial: fsl_lpuart: Clear the error flags by writing 1 for lpuart32 platforms
    869ce5e59845 tty: n_gsm: fix the UAF caused by race condition in gsm_cleanup_mux
    0ba7f969be59 powerpc/rtas_flash: allow user copy to flash block cache objects
    c5f59de36202 fbdev: mmp: fix value check in mmphw_probe()
    268cc9bc54bd i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
    3ff54d904faf virtio-mmio: don't break lifecycle of vm_dev
    b1fe05cc5126 virtio-mmio: Use to_virtio_mmio_device() to simply code
    3b76d9263679 tracing/probes: Fix to update dynamic data counter if fetcharg uses it
    265a979dedb1 tracing/probes: Have process_fetch_insn() take a void * instead of pt_regs
    a89054535368 mmc: meson-gx: fix deferred probing
    e8a41b4a5008 mmc: meson-gx: use devm_mmc_alloc_host
    50ed76c9e09b mmc: core: add devm_mmc_alloc_host
    d523ce6f51f1 mmc: sunxi: fix deferred probing
    939a12f29a4b mmc: bcm2835: fix deferred probing
    01dfc61f72a8 USB: dwc3: qcom: fix NULL-deref on suspend
    3e2b5d66e926 usb: cdns3: fix NCM gadget RX speed 20x slow than expection at iMX8QM
    f5c11b45f3f9 usb: cdns3: allocate TX FIFO size according to composite EP number
    a461bcfb36d6 usb: gadget: udc: core: Introduce check_config to verify USB configuration
    a64f5fe493b5 irqchip/mips-gic: Use raw spinlock for gic_lock
    0704666c570d irqchip/mips-gic: Get rid of the reliance on irq_cpu_online()
    372f1752b745 bus: mhi: host: Range check CHDBOFF and ERDBOFF
    77944a6f3cf8 bus: mhi: Move host MHI code to "host" directory
    f73891261566 bus: mhi: Add MMIO region length to controller structure
    1cacbb711e32 bus: mhi: Add MHI PCI support for WWAN modems
    436b4232533a iio: addac: stx104: Fix race condition when converting analog-to-digital
    aeecd8d97da7 iio: addac: stx104: Fix race condition for stx104_write_raw()
    f6576d4851fa iio: adc: stx104: Implement and utilize register structures
    9d1609824554 iio: adc: stx104: Utilize iomap interface
    d2ba1f40fc09 dt-bindings: iio: add AD74413R
    c5e580831b2d iio: add addac subdirectory
    bb70fdbfa272 IMA: allow/fix UML builds
    66a3b2a12138 ring-buffer: Do not swap cpu_buffer during resize process
    dd5a12cdf20c powerpc/kasan: Disable KCOV in KASAN code
    9f9eed451176 ALSA: hda: fix a possible null-pointer dereference due to data race in snd_hdac_regmap_sync()
    7a21c2e474ae ALSA: hda/realtek: Add quirks for Unis H3C Desktop B760 & Q760
    b870b9a47fdb drm/amdgpu: Fix potential fence use-after-free v2
    f19add5c7760 Bluetooth: btusb: Add MT7922 bluetooth ID for the Asus Ally
    2958cf9f805b Bluetooth: L2CAP: Fix use-after-free
    04bb8af40a77 pcmcia: rsrc_nonstatic: Fix memory leak in nonstatic_release_resource_db()
    7c5b2649f6a3 gfs2: Fix possible data races in gfs2_show_options()
    e8f3d96051c1 usb: chipidea: imx: add missing USB PHY DPDM wakeup setting
    7a3a7c6fa0dc usb: chipidea: imx: don't request QoS for imx8ulp
    2caeb722f0ea media: platform: mediatek: vpu: fix NULL ptr dereference
    99d6afa19d6d usb: gadget: u_serial: Avoid spinlock recursion in __gs_console_push
    e52de26cb374 media: v4l2-mem2mem: add lock to protect parameter num_rdy
    5c094ca99482 FS: JFS: Check for read-only mounted filesystem in txBegin
    2a3f20efe6c9 FS: JFS: Fix null-ptr-deref Read in txBegin
    e778c8b0a9b6 MIPS: dec: prom: Address -Warray-bounds warning
    911b48eec451 fs: jfs: Fix UBSAN: array-index-out-of-bounds in dbAllocDmapLev
    4503f6fc95d6 udf: Fix uninitialized array access for some pathnames
    a2966e0436dd ovl: check type and offset of struct vfsmount in ovl_entry
    73311dd83185 RDMA/mlx5: Return the firmware result upon destroying QP/RQ
    19312bc3ff67 HID: add quirk for 03f0:464a HP Elite Presenter Mouse
    04bd3a362d2f drm/amdgpu: install stub fence into potential unused fence pointers
    04e774fb6789 dma-remap: use kvmalloc_array/kvfree for larger dma memory remap
    cbaebbba722c quota: fix warning in dqgrab()
    8a4f4d47b82f quota: Properly disable quotas when add_dquot_ref() fails
    df907501ba54 iopoll: Call cpu_relax() in busy loops
    940ccc291cca ASoC: Intel: sof_sdw: Add support for Rex soundwire
    b2882c51e6d0 ARM: dts: imx6dl: prtrvt, prtvt7, prti6q, prtwd2: fix USB related warnings
    dbe0f607f84c PCI: tegra194: Fix possible array out of bounds access
    10459ffd56ad ASoC: Intel: sof_sdw: add quirk for LNL RVP
    9f4dd39696c8 ASoC: Intel: sof_sdw: add quirk for MTL RVP
    751c5b6a2315 ALSA: emu10k1: roll up loops in DSP setup code for Audigy
    e6825b30d37f drm/radeon: Fix integer overflow in radeon_cs_parser_init
    e6c0a9728e3a net/mlx5: Skip clock update work when device is in error state
    81cc91bba42b net/mlx5: Move all internal timer metadata into a dedicated struct
    ba2e27e5100d net/mlx5: Refactor init clock function
    e77ef787415b macsec: use DEV_STATS_INC()
    ecf0e627fbbb macsec: Fix traffic counters/statistics
    b630367a608d mmc: sdhci-f-sdh30: Replace with sdhci_pltfm

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 09eb7d1d17..eb10643530 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5204a0cb3d9b9a5512aad3f5e2483311b8834bb2"
-SRCREV_meta ?= "f16f63fae82fd0565f9314a61ae6be1d0509eb24"
+SRCREV_machine ?= "b56fef81989515b6107c389373158235efa26138"
+SRCREV_meta ?= "d660385f970bb5c61304176c107a4958db9304e8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.191"
+LINUX_VERSION ?= "5.10.192"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 4afb182d18..255a79288a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.191"
+LINUX_VERSION ?= "5.10.192"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "cb953c5b7e239e63ec26076f412644875ae00f2c"
-SRCREV_machine ?= "e6837b01492363eeec6fb51e8ea923e046594f1d"
-SRCREV_meta ?= "f16f63fae82fd0565f9314a61ae6be1d0509eb24"
+SRCREV_machine:qemuarm ?= "31f6d39bde4a241280ff357f0f052e56af1332e8"
+SRCREV_machine ?= "a9ebc91a4f1376324425811eee0a6628553d7d6e"
+SRCREV_meta ?= "d660385f970bb5c61304176c107a4958db9304e8"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index e7289360df..a77469ef98 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "e8c5b2165b5bfcef1358cd6fa70368fc174ac2f4"
-SRCREV_machine:qemuarm64 ?= "d8165863c5d9467c555ef97318193595242b85a7"
-SRCREV_machine:qemumips ?= "54bad1b3d7ed3c3cf1ccb98ee21ae2ed059c20b0"
-SRCREV_machine:qemuppc ?= "7ab0ce8ef9f6f1b4c12f3594b1f410f84ef35bfa"
-SRCREV_machine:qemuriscv64 ?= "c723f1548ae98a23895a85e67466df935d09e594"
-SRCREV_machine:qemuriscv32 ?= "c723f1548ae98a23895a85e67466df935d09e594"
-SRCREV_machine:qemux86 ?= "c723f1548ae98a23895a85e67466df935d09e594"
-SRCREV_machine:qemux86-64 ?= "c723f1548ae98a23895a85e67466df935d09e594"
-SRCREV_machine:qemumips64 ?= "702fe224e3553677ba09d28e45b7eaee31c667f4"
-SRCREV_machine ?= "c723f1548ae98a23895a85e67466df935d09e594"
-SRCREV_meta ?= "f16f63fae82fd0565f9314a61ae6be1d0509eb24"
+SRCREV_machine:qemuarm ?= "6d1f4e2827227663603efe419dc601860608862b"
+SRCREV_machine:qemuarm64 ?= "8edb39e7f3399ef6f97a416069777d0230ad68bc"
+SRCREV_machine:qemumips ?= "c37227bf802d3c489639a031f1cd8ee9e51ba044"
+SRCREV_machine:qemuppc ?= "f00b3a49bc6e9ca12497cf50080c391e59696d06"
+SRCREV_machine:qemuriscv64 ?= "11b247211e00c610587b27a762e4814f56723958"
+SRCREV_machine:qemuriscv32 ?= "11b247211e00c610587b27a762e4814f56723958"
+SRCREV_machine:qemux86 ?= "11b247211e00c610587b27a762e4814f56723958"
+SRCREV_machine:qemux86-64 ?= "11b247211e00c610587b27a762e4814f56723958"
+SRCREV_machine:qemumips64 ?= "0c17abc2a99b68c19099df5b61653729f6d17f76"
+SRCREV_machine ?= "11b247211e00c610587b27a762e4814f56723958"
+SRCREV_meta ?= "d660385f970bb5c61304176c107a4958db9304e8"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.191"
+LINUX_VERSION ?= "5.10.192"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


