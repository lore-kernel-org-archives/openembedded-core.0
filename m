Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6F1E748F7
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 16:00:35 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.62423.1696176032021618921
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 09:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zYTurjOQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1c3cbfa40d6so141253215ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 09:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1696176031; x=1696780831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEchTdfrMb/fNNRqXXl6gpmdoimzUNDnY1aakKz+AYM=;
        b=zYTurjOQ8Wsmi1TFnR2HdjGR76GxZzjtEJDAyflJWMhl1I98V4QrGSNamP4wD2jrcG
         ZDnq+cSb2qkx4RSHE0vlGWSBgA1bwBIW1P+3IETKcaDezamneaHSU0dnScA/kjH9mUEr
         gCXjdyJiG2CBFpcnh1I5pq0dCwacKS6VVMVlVe8SPNc3iPA2zosYAN7pvxXa5+RZI35L
         4g8BlaOK81ezoaZ6MWyvmT6HfdOti5Tk5u+rRUFMOn8eGZqdeHroVtE0FJ6r7bDE4W9V
         2TaLoPvnvsPo86xnW8g/iXlUbDBLh4AKcP0hSuSCnkj6OoolCbgmZ5y6hr6SMcMvJjRB
         oTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696176031; x=1696780831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEchTdfrMb/fNNRqXXl6gpmdoimzUNDnY1aakKz+AYM=;
        b=lGhBD7gGi7AlArd+OYBnCPWWWfHTwanMS2awuO8QyWtJrCTaSNWPDNm6o4Mf0hDjO/
         dvVa5GAuh6UQaD4T5XJtj7qjUBoYFNXjGCCxUGGrq1i6s9RKhlidYRlZwqUq+sh0xbNi
         v9OeOwO9p/3560GpHU86R3HXduDpcBGKm+SFFJjqIVI6PHMuNmO3XqmOg5CcQ4pyhe1P
         4fVew0VWZb1gG8NqDOFqp5Hij6zmQsthgLUVYrqx9PRMW9zWFxS6d6bhw9TNohQNk5lt
         VFEXnCx1mS+lktSbmaqa2ayEuIQgUvZXQrKOcl2fccvuDl7r5Ddq+H6A16xuXCe3G/hV
         /qhw==
X-Gm-Message-State: AOJu0YzQmii3YGFjWKwnTfgwn+BSHgfeYeWzT6BrSYZrqjHpnk3co17R
	2BlYAErDFZ4FVCQMxSBO16EnGY+BkskBmCA9mAPFjA==
X-Google-Smtp-Source: AGHT+IG5rgIYol0GHDT6Ul6cm20KUcHaY2yh8XA9soWamzHXaF4ZnFozHiQqRRAvK4KOrKhj1ZpOoQ==
X-Received: by 2002:a17:903:22cd:b0:1c6:2dbb:e5f4 with SMTP id y13-20020a17090322cd00b001c62dbbe5f4mr10486804plg.26.1696176030374;
        Sun, 01 Oct 2023 09:00:30 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c5900c9e8fsm15416967plb.81.2023.10.01.09.00.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 09:00:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 07/23] linux-yocto/5.15: update to v5.15.128
Date: Sun,  1 Oct 2023 05:59:54 -1000
Message-Id: <3ad11a93139845060e970045a03f6476da5e5795.1696175813.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696175813.git.steve@sakoman.com>
References: <cover.1696175813.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 16:00:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188496

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    5ddfe5cc8716 Linux 5.15.128
    9080f4fcc202 x86/srso: Correct the mitigation status when SMT is disabled
    484eefc6ff9c objtool/x86: Fixup frame-pointer vs rethunk
    55f1cbeaa159 x86/retpoline,kprobes: Fix position of thunk sections with CONFIG_LTO_CLANG
    fa24cd0fbcb7 x86/srso: Disable the mitigation on unaffected configurations
    aa0777ce0d3d x86/CPU/AMD: Fix the DIV(0) initial fix attempt
    bbe585239d4f x86/retpoline: Don't clobber RFLAGS during srso_safe_ret()
    19f23d16b0e0 x86/static_call: Fix __static_call_fixup()
    df6495f203a7 x86/srso: Explain the untraining sequences a bit more
    43548590ad7e x86/cpu: Cleanup the untrain mess
    035e906bfc93 x86/cpu: Rename srso_(.*)_alias to srso_alias_\1
    19c1c0499650 x86/cpu: Rename original retbleed methods
    f77dbb90962b x86/cpu: Clean up SRSO return thunk mess
    f624ce6c7fc2 x86/ibt: Add ANNOTATE_NOENDBR
    f1171d455d94 objtool: Add frame-pointer-specific function ignore
    08f7cfd44f77 x86/alternative: Make custom return thunk unconditional
    0d810eff090c x86/cpu: Fix up srso_safe_ret() and __x86_return_thunk()
    8089aae6020e x86/cpu: Fix __x86_return_thunk symbol type
    5b28fda5fdee mmc: f-sdh30: fix order of function calls in sdhci_f_sdh30_remove
    e8c5081da2cc net: fix the RTO timer retransmitting skb every 1ms if linear option is enabled
    431db3f48c28 virtio-net: set queues after driver_ok
    d39fc9b94dc0 af_unix: Fix null-ptr-deref in unix_stream_sendpage().
    9a4d8dc706c2 arm64: dts: rockchip: Disable HS400 for eMMC on ROCK Pi 4
    6b64974e02ea exfat: check if filename entries exceeds max filename length
    6065b3017107 netfilter: set default timeout to 3 secs for sctp shutdown send and recv state
    a00c5d2c208b drm/amd: flush any delayed gfxoff on suspend entry
    d578c919deb7 drm/qxl: fix UAF on handle creation
    ff09f9e671ff mmc: block: Fix in_flight[issue_type] value error
    b803fedb6e50 mmc: wbsd: fix double mmc_free_host() in wbsd_init()
    961f7ce16223 cifs: Release folio lock on fscache read hit.
    cc3f194f46e7 ALSA: usb-audio: Add support for Mythware XA001AU capture and playback interfaces.
    18e27df4f2b4 serial: 8250: Fix oops for port->pm on uart_change_pm()
    e9b8ee715dbc riscv: uaccess: Return the number of bytes effectively not copied
    b2a331abcb03 ALSA: hda/realtek - Remodified 3k pull low procedure
    dfb9676ed25b soc: aspeed: socinfo: Add kfree for kstrdup
    c5ac7522a8db ASoC: meson: axg-tdm-formatter: fix channel slot allocation
    fd346ef1cd2d ASoC: rt5665: add missed regulator_bulk_disable
    e878458d820c ARM: dts: imx: Set default tuning step for imx6sx usdhc
    430c29a54e4a arm64: dts: qcom: qrb5165-rb5: fix thermal zone conflict
    03522d73a498 bus: ti-sysc: Flush posted write on enable before reset
    578371ce0d7f net: do not allow gso_size to be set to GSO_BY_FRAGS
    5fc4fd3f3eb8 sock: Fix misuse of sk_under_memory_pressure()
    fc3d82d295d1 net: dsa: mv88e6xxx: Wait for EEPROM done before HW reset
    f11c2802e143 i40e: fix misleading debug logs
    5ba2b936f3e1 iavf: fix FDIR rule fields masks validation
    ae6834689fd6 team: Fix incorrect deletion of ETH_P_8021AD protocol vid from slaves
    0ffbc341cfae net: phy: broadcom: stub c45 read/write for 54810
    bf221e5e4b19 netfilter: nft_dynset: disallow object maps
    9177869b85dd ipvs: fix racy memcpy in proc_do_sync_threshold
    1adaec4758d1 netfilter: nf_tables: deactivate catchall elements in next generation
    82109740d610 netfilter: nf_tables: fix false-positive lockdep splat
    b2f6d73395cb drm/panel: simple: Fix AUO G121EAN01 panel timings according to the docs
    7207ee323afa selftests: mirror_gre_changes: Tighten up the TTL test match
    c2a6ffe3f1a3 net: phy: fix IRQ-based wake-on-lan over hibernate / power off
    8e5e967348ca xfrm: add forgotten nla_policy for XFRMA_MTIMER_THRESH
    075448a2eb75 xfrm: add NULL check in xfrm_update_ae_params
    e1e04cc2ef2c ip_vti: fix potential slab-use-after-free in decode_session6
    a1639a82ce14 ip6_vti: fix slab-use-after-free in decode_session6
    44b3d4096700 xfrm: fix slab-use-after-free in decode_session6
    a465ace883ac net: xfrm: Amend XFRMA_SEC_CTX nla_policy structure
    fed1cd2cd3aa net: af_key: fix sadb_x_filter validation
    1960f468078b net: xfrm: Fix xfrm_address_filter OOB read
    080dedb1cad8 i2c: designware: Handle invalid SMBus block data response length value
    416c538684bd i2c: designware: Correct length byte validation logic
    b966e9e1e250 btrfs: fix BUG_ON condition in btrfs_cancel_balance
    77698e6ff6f0 tty: serial: fsl_lpuart: Clear the error flags by writing 1 for lpuart32 platforms
    2a5234464383 tty: n_gsm: fix the UAF caused by race condition in gsm_cleanup_mux
    8ef25fb13494 powerpc/rtas_flash: allow user copy to flash block cache objects
    bb70e2b70f8d fbdev: mmp: fix value check in mmphw_probe()
    184f1b68bb99 i2c: hisi: Only handle the interrupt of the driver's transfer
    c4e671dae50e i2c: bcm-iproc: Fix bcm_iproc_i2c_isr deadlock issue
    b99f490ea87e cifs: fix potential oops in cifs_oplock_break
    a5ae5a81bc19 vduse: Use proper spinlock for IRQ injection
    5b7d5c2dd664 virtio-mmio: don't break lifecycle of vm_dev
    edf3b5aadb25 btrfs: move out now unused BG from the reclaim list
    170773563ef6 ARM: dts: nxp/imx6sll: fix wrong property name in usbphy node
    4ffbfe1c980f ARM: dts: imx6sll: fixup of operating points
    e2ff5cf681a8 mmc: sunxi: fix deferred probing
    f93e8c5a7bd9 mmc: bcm2835: fix deferred probing
    4eeba5d476fe USB: dwc3: fix use-after-free on core driver unbind
    a78fe5c9d8d5 USB: dwc3: qcom: fix NULL-deref on suspend
    8a6b7534020d tty: serial: fsl_lpuart: reduce RX watermark to 0 on LS1028A
    701bb5fee7c3 tty: serial: fsl_lpuart: make rx_watermark configurable for different platforms
    fa254ab7d02d tty: serial: fsl_lpuart: Add i.MXRT1050 support
    20351ddb1f41 usb: dwc3: gadget: Improve dwc3_gadget_suspend() and dwc3_gadget_resume()
    31a0e60fe16b USB: dwc3: gadget: drop dead hibernation code
    d9e004104e45 usb: dwc3: Fix typos in gadget.c
    2fa487a94667 usb: dwc3: Remove DWC3 locking during gadget suspend/resume
    7dfb384e76ee usb: dwc3: gadget: Synchronize IRQ between soft connect/disconnect
    d3c82f24ee69 drm/amd/display: fix access hdcp_workqueue assert
    0ba6c7ba081e drm/amd/display: phase3 mst hdcp for multiple displays
    99c444d3c3c4 drm/amd/display: save restore hdcp state when display is unplugged from mst hub
    4f1beb75f652 ARM: dts: aspeed: asrock: Correct firmware flash SPI clocks
    f84c2ca3490c igc: read before write to SRRCTL register
    9fa82f031af8 iio: addac: stx104: Fix race condition when converting analog-to-digital
    d31d04ec404c iio: addac: stx104: Fix race condition for stx104_write_raw()
    89a007f3a383 iio: stx104: Move to addac subdirectory
    cadf8f2d7c9d iio: adc: stx104: Implement and utilize register structures
    6089d354346f iio: adc: stx104: Utilize iomap interface
    565b96d9a7ab iio: add addac subdirectory
    49b830d75f03 ring-buffer: Do not swap cpu_buffer during resize process
    6657ecbcc39c powerpc/kasan: Disable KCOV in KASAN code
    8703b26387e1 ALSA: hda: fix a possible null-pointer dereference due to data race in snd_hdac_regmap_sync()
    5ed4dbc13726 ALSA: hda/realtek: Add quirks for Unis H3C Desktop B760 & Q760
    c7d8b5f46f06 fs/ntfs3: Mark ntfs dirty when on-disk struct is corrupted
    3a00ec562f8c fs: ntfs3: Fix possible null-pointer dereferences in mi_read()
    e7799bb4dbe2 fs/ntfs3: Enhance sanity check while generating attr_list
    ef568da1fd84 drm/amdgpu: Fix potential fence use-after-free v2
    5720c7e185d4 Bluetooth: btusb: Add MT7922 bluetooth ID for the Asus Ally
    548a6b64b3c0 Bluetooth: L2CAP: Fix use-after-free
    302d04596364 watchdog: sp5100_tco: support Hygon FCH/SCH (Server Controller Hub)
    2ea70379e4f4 firewire: net: fix use after free in fwnet_finish_incoming_packet()
    97fd1c8e9c5a pcmcia: rsrc_nonstatic: Fix memory leak in nonstatic_release_resource_db()
    85e888150075 gfs2: Fix possible data races in gfs2_show_options()
    eafb79d2448a usb: chipidea: imx: add missing USB PHY DPDM wakeup setting
    7bdb4c963049 usb: chipidea: imx: don't request QoS for imx8ulp
    25decbbb66e4 thunderbolt: Read retimer NVM authentication status prior tb_retimer_set_inbound_sbtx()
    776b34615a29 media: platform: mediatek: vpu: fix NULL ptr dereference
    cb174344bf85 usb: gadget: u_serial: Avoid spinlock recursion in __gs_console_push
    1676748aa290 media: v4l2-mem2mem: add lock to protect parameter num_rdy
    985086704267 smb: client: fix warning in cifs_smb3_do_mount()
    a3f252436e57 ovl: check type and offset of struct vfsmount in ovl_entry
    1a650d3ccd79 RDMA/mlx5: Return the firmware result upon destroying QP/RQ
    9631d88503ab HID: add quirk for 03f0:464a HP Elite Presenter Mouse
    4921792e04f2 drm/amdgpu: install stub fence into potential unused fence pointers
    fd41646d4350 HID: logitech-hidpp: Add USB and Bluetooth IDs for the Logitech G915 TKL Keyboard
    ff10cd3e9b3a dma-remap: use kvmalloc_array/kvfree for larger dma memory remap
    e9ce774052ee ASoC: SOF: Intel: fix SoundWire/HDaudio mutual exclusion
    7d53d1e4765c iopoll: Call cpu_relax() in busy loops
    ca66e9dd98ef ARM: dts: imx6dl: prtrvt, prtvt7, prti6q, prtwd2: fix USB related warnings
    cc1590830859 PCI: tegra194: Fix possible array out of bounds access
    e2d10f1de1fa net: tls: avoid discarding data on record close
    9a15ca893909 net/tls: Multi-threaded calls to TX tls_dev_del
    2d93157b7e2d net/tls: Perform immediate device ctx cleanup when possible
    51222e1c77a1 macsec: use DEV_STATS_INC()
    3d64a232e4d9 macsec: Fix traffic counters/statistics
    396a1921406a selftests: forwarding: tc_actions: Use ncat instead of nc
    d61a0886d336 selftests: forwarding: tc_actions: cleanup temporary files when test is aborted
    a798977df6d0 mmc: sdhci-f-sdh30: Replace with sdhci_pltfm

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 293b2f75a8..aac789f1f6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "cd3c15788f1201a674f47d50fcdb91f9d65cd05d"
-SRCREV_meta ?= "8616f066cc7ad4e305c11cdad0aa9a1a8a1f6c8c"
+SRCREV_machine ?= "6035f480ffca194cd0565a718d73ea675c0ff20a"
+SRCREV_meta ?= "3a5b0494e4760dd7afec9618e572a14e5ff87456"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "5.15.127"
+LINUX_VERSION ?= "5.15.128"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index 0a9d97159d..c2b14290d3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.127"
+LINUX_VERSION ?= "5.15.128"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "6329aba667477365f72d896b53c492bfba1b1609"
-SRCREV_meta ?= "8616f066cc7ad4e305c11cdad0aa9a1a8a1f6c8c"
+SRCREV_machine ?= "9617ac269548314043e14de79f663e6d805a534a"
+SRCREV_meta ?= "3a5b0494e4760dd7afec9618e572a14e5ff87456"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index f1ce090e22..17faabd65b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "64a535013a41c2b18d6b7a6dd675ecd3d69d57bb"
-SRCREV_machine:qemuarm64 ?= "27a44fe9e1e971534af059b04af8846034d3a5e6"
-SRCREV_machine:qemumips ?= "a0ae788ca9ce2f9b26f12fb99b1f5835a7544a4e"
-SRCREV_machine:qemuppc ?= "61253ef36689575bfcd9423cb1df3b565a59ef37"
-SRCREV_machine:qemuriscv64 ?= "211e091f3737d6c0850b218f9b3f26816be7e321"
-SRCREV_machine:qemuriscv32 ?= "211e091f3737d6c0850b218f9b3f26816be7e321"
-SRCREV_machine:qemux86 ?= "211e091f3737d6c0850b218f9b3f26816be7e321"
-SRCREV_machine:qemux86-64 ?= "211e091f3737d6c0850b218f9b3f26816be7e321"
-SRCREV_machine:qemumips64 ?= "7b2aad0f77dbb1ffb558bc7215bd9d3856ab0f75"
-SRCREV_machine ?= "211e091f3737d6c0850b218f9b3f26816be7e321"
-SRCREV_meta ?= "8616f066cc7ad4e305c11cdad0aa9a1a8a1f6c8c"
+SRCREV_machine:qemuarm ?= "4a0228c3af6ce6776b3b8d63422cbdfe42794f08"
+SRCREV_machine:qemuarm64 ?= "9bf77a387c75c5b40a93bd1c252fa2f8057ec35b"
+SRCREV_machine:qemumips ?= "747b0a4f90c11f9225623c4147d783eacc817236"
+SRCREV_machine:qemuppc ?= "997cb3bb3f0ac601c062e6c206c4fbff158cab16"
+SRCREV_machine:qemuriscv64 ?= "769094f9068a8a2e8a25aade15b06397bcb2f074"
+SRCREV_machine:qemuriscv32 ?= "769094f9068a8a2e8a25aade15b06397bcb2f074"
+SRCREV_machine:qemux86 ?= "769094f9068a8a2e8a25aade15b06397bcb2f074"
+SRCREV_machine:qemux86-64 ?= "769094f9068a8a2e8a25aade15b06397bcb2f074"
+SRCREV_machine:qemumips64 ?= "8ea0652d340b59490387640bbb57669be5f8b47c"
+SRCREV_machine ?= "769094f9068a8a2e8a25aade15b06397bcb2f074"
+SRCREV_meta ?= "3a5b0494e4760dd7afec9618e572a14e5ff87456"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "f6f7927ac664ba23447f8dd3c3dfe2f4ee39272f"
+SRCREV_machine:class-devupstream ?= "5ddfe5cc87167343bd4c17f776de7b7aa1475b0c"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.127"
+LINUX_VERSION ?= "5.15.128"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


