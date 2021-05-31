Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web11.43959.1622467013522696552
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 06:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kk3nF5wA;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id eb9so5493222qvb.6
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 06:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yrz1FbhWSj9/WTSpDBL+fFCDaG3pULmCvU9Ctsjbka8=;
        b=Kk3nF5wACPsx6UWnnDalABAu9B4rZ0K/0cI1jzo9Hd0LJ0nhNUJ0pPR9FnKlAiAPLJ
         EyvL4+/CEjKQEtuopKnYw2MuSSpmWGBtrv8R/pTwv/7HgpHMsFNG6oWzU5p6SZ8ezVQg
         Z6+0YBWUL2IvTGBR5rC3lfsb/BC+tudB2QYgbA0IoKRcRAQXmgCED7wz6CkgSyBsp3jU
         zwm7B14aO2tumSkmymomOPQHztbJgnGLGcsZZU+6VFFWl6qWGoogu7ahKBAg2jK20hio
         fX8BQFRrTCMXjhxlSIoF9olvSUeau6RMoyM4zumgILkSl6n3dzcZsBl43MPV8ZJhtLYz
         R/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yrz1FbhWSj9/WTSpDBL+fFCDaG3pULmCvU9Ctsjbka8=;
        b=pitiYrpofTYASbb7B2gycdSJTnONl7edcykVm+YCETx/7QD/W6JLWsev/LYbjOsyyr
         I+N5rWMP60++XQqCkxlWhfYNw08RLHl6PrzhvodROe2geQr+9PUqSyqjV80YZVbRaQ9c
         ov6P0u4uhEsOqkgUfIYMB9Yo5/T2gTb3V15GZeVfCbBbbqyQTqwNTdJEAVz3OBFQt/UU
         QFfopEPkmQgtCI6eC3rxj7bgKVbZlvugK7uS+Wd3GoGQzdYNFpihKZAYt4nfz2pekqIV
         +YzcBT/UBaw4lDUt799RiqhQzGXAz0+KajLrjJRyNpr2tTtBZcWwnBFo5Aa9rxgHS9lf
         uuUg==
X-Gm-Message-State: AOAM5312g3fvSZHnlrZPhPr+mLCqt/qsJDo4VhyWEyqB0wJ7HXwzRMNA
	XxdhcWbPCxGj46f2owAeiKQ=
X-Google-Smtp-Source: ABdhPJynpVOURnvvBNcnz2HK5yJtLiZq2CvlmipJ9U0/0rLWcnOHjF5IeUIdugpELULbVoLptpKCug==
X-Received: by 2002:ad4:5227:: with SMTP id r7mr16736247qvq.41.1622467012640;
        Mon, 31 May 2021 06:16:52 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id u11sm3008622qkk.12.2021.05.31.06.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 06:16:52 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/5.4: update to v5.4.123
Date: Mon, 31 May 2021 09:16:46 -0400
Message-Id: <455ef425195be9a6a2326443e3024d711d696ac7.1622466879.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1622466879.git.bruce.ashfield@gmail.com>
References: <cover.1622466879.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    103f1dbea1ae Linux 5.4.123
    af2a4426baf7 NFC: nci: fix memory leak in nci_allocate_device
    45aef101ca44 perf unwind: Set userdata for all __report_module() paths
    2960df32bb72 perf unwind: Fix separate debug info files when using elfutils' libdw's unwinder
    f3d9f09b10e3 usb: dwc3: gadget: Enable suspend events
    3173c7c80785 bpf: No need to simulate speculative domain for immediates
    2b3cc41d500a bpf: Fix mask direction swap upon off reg sign change
    2768f9962231 bpf: Wrap aux data inside bpf_sanitize_info container
    67154cff6258 Linux 5.4.122
    f97257cde764 Bluetooth: SMP: Fail if remote and local public keys are identical
    46b4a9c68572 video: hgafb: correctly handle card detect failure during probe
    3c18dc7de2bc nvmet: use new ana_log_size instead the old one
    a6f5ef8c1717 Bluetooth: L2CAP: Fix handling LE modes by L2CAP_OPTIONS
    d3d648163a03 ext4: fix error handling in ext4_end_enable_verity()
    829203752441 nvme-multipath: fix double initialization of ANA state
    2dea1e9ae5cf tty: vt: always invoke vc->vc_sw->con_resize callback
    cf52b24b172e vt: Fix character height handling with VT_RESIZEX
    971b3fb5b9a6 vgacon: Record video mode changes with VT_RESIZEX
    f0c9d29f232a video: hgafb: fix potential NULL pointer dereference
    44fe392e1adc qlcnic: Add null check after calling netdev_alloc_skb
    4914c67f1a62 leds: lp5523: check return value of lp5xx_read and jump to cleanup code
    171b3c1afaeb ics932s401: fix broken handling of errors when word reading fails
    d14cd329d83b net: rtlwifi: properly check for alloc_workqueue() failure
    533ac32a80c0 scsi: ufs: handle cleanup correctly on devm_reset_control_get error
    9e38cf9c3070 net: stmicro: handle clk_prepare() failure during init
    9d59d4364dfb ethernet: sun: niu: fix missing checks of niu_pci_eeprom_read()
    8f2efd687d19 Revert "niu: fix missing checks of niu_pci_eeprom_read"
    04a064b36576 Revert "qlcnic: Avoid potential NULL pointer dereference"
    6d53d54ff5be Revert "rtlwifi: fix a potential NULL pointer dereference"
    7fb963895513 Revert "media: rcar_drif: fix a memory disclosure"
    6f2e5eb82557 cdrom: gdrom: initialize global variable at init time
    283cd246bcc1 cdrom: gdrom: deallocate struct gdrom_unit fields in remove_gdrom
    7e230e5ed8fd Revert "gdrom: fix a memory leak bug"
    6ef6f8cd1d34 Revert "scsi: ufs: fix a missing check of devm_reset_control_get"
    9c24899f1fae Revert "ecryptfs: replace BUG_ON with error handling code"
    a1f0e2bb4975 Revert "video: imsttfb: fix potential NULL pointer dereferences"
    bd2a12549fc2 Revert "hwmon: (lm80) fix a missing check of bus read in lm80 probe"
    5c463887edb3 Revert "leds: lp5523: fix a missing check of return value of lp55xx_read"
    1cb9f88cde8c Revert "net: stmicro: fix a missing check of clk_prepare"
    6f2a72774f38 Revert "video: hgafb: fix potential NULL pointer dereference"
    3471a221f308 dm snapshot: fix crash with transient storage and zero chunk size
    198ee66478b3 xen-pciback: reconfigure also from backend watch handler
    f1d3c63c3f12 mmc: sdhci-pci-gli: increase 1.8V regulator wait
    d9e9ec363560 drm/amdgpu: update sdma golden setting for Navi12
    e3be683d5e4e drm/amdgpu: update gc golden setting for Navi12
    1f0495355b60 drm/amdgpu: disable 3DCGCG on picasso/raven1 to avoid compute hang
    c11d59e5edba Revert "serial: mvebu-uart: Fix to avoid a potential NULL pointer dereference"
    d55df42ef369 rapidio: handle create_workqueue() failure
    9f2a613e4b0b Revert "rapidio: fix a NULL pointer dereference when create_workqueue() fails"
    cdd91637d4ef uio_hv_generic: Fix a memory leak in error handling paths
    b0fc59e62bf9 ALSA: hda/realtek: Add fixup for HP Spectre x360 15-df0xxx
    c4e7ed4fa1b1 ALSA: hda/realtek: Add fixup for HP OMEN laptop
    2331f2592879 ALSA: hda/realtek: Fix silent headphone output on ASUS UX430UA
    1c783bfa7f8d ALSA: hda/realtek: Add some CLOVE SSIDs of ALC293
    be1f7f30b66b ALSA: hda/realtek: reset eapd coeff to default value for alc287
    b2297d1b9511 ALSA: firewire-lib: fix check for the size of isochronous packet payload
    f95aabb6aed4 Revert "ALSA: sb8: add a check for request_region"
    2ed8227ebd84 ALSA: hda: fixup headset for ASUS GU502 laptop
    7ef36d303592 ALSA: bebob/oxfw: fix Kconfig entry for Mackie d.2 Pro
    844faf4a9675 ALSA: usb-audio: Validate MS endpoint descriptors
    c7456fc35dc8 ALSA: firewire-lib: fix calculation for size of IR context payload
    7981c124e34d ALSA: dice: fix stream format at middle sampling rate for Alesis iO 26
    f72b96ff7935 ALSA: line6: Fix racy initialization of LINE6 MIDI
    048840df6de8 ALSA: intel8x0: Don't update period unless prepared
    a67a88f9e667 ALSA: dice: fix stream format for TC Electronic Konnekt Live at high sampling transfer frequency
    34413f21acea cifs: fix memory leak in smb2_copychunk_range
    20197d327560 btrfs: avoid RCU stalls while running delayed iputs
    845c2b9d99b6 locking/mutex: clear MUTEX_FLAGS if wait_list is empty due to signal
    439ce949ee90 nvmet: seset ns->file when open fails
    670d34d54320 ptrace: make ptrace() fail if the tracee changed its pid unexpectedly
    88128a5054f1 RDMA/uverbs: Fix a NULL vs IS_ERR() bug
    6fa78a6b9a3b platform/x86: dell-smbios-wmi: Fix oops on rmmod dell_smbios
    6e90ff540a7b platform/mellanox: mlxbf-tmfifo: Fix a memory barrier issue
    66abc4ef6a8b RDMA/core: Don't access cm_id after its destruction
    73e25a2d51bb RDMA/mlx5: Recover from fatal event in dual port mode
    8d8b8016e0af scsi: qla2xxx: Fix error return code in qla82xx_write_flash_dword()
    07865459eb62 scsi: ufs: core: Increase the usable queue depth
    a62225d951d7 RDMA/rxe: Clear all QP fields if creation failed
    257f132342ea RDMA/siw: Release xarray entry
    a19bb4c0566c RDMA/siw: Properly check send and receive CQ pointers
    a03676848886 openrisc: Fix a memory leak
    50fd584fbbb3 firmware: arm_scpi: Prevent the ternary sign expansion bug
    b239a0365b93 Linux 5.4.121
    b63a8e5b4a25 scripts: switch explicitly to Python 3
    2cbb484788fe tweewide: Fix most Shebang lines
    252495806968 KVM: arm64: Initialize VCPU mdcr_el2 before loading it
    50e5c93ca647 ipv6: remove extra dev_hold() for fallback tunnels
    b811a8a72366 ip6_tunnel: sit: proper dev_{hold|put} in ndo_[un]init methods
    f5ddecb6a195 sit: proper dev_{hold|put} in ndo_[un]init methods
    cca2a2b340a9 ip6_gre: proper dev_{hold|put} in ndo_[un]init methods
    084a1858e256 net: stmmac: Do not enable RX FIFO overflow interrupts
    94600a8300c7 lib: stackdepot: turn depot_lock spinlock to raw_spinlock
    5233f4465e22 block: reexpand iov_iter after read/write
    48744773d63e ALSA: hda: generic: change the DAC ctl name for LO+SPK or LO+HP
    0ce1a72ac9b0 gpiolib: acpi: Add quirk to ignore EC wakeups on Dell Venue 10 Pro 5055
    b3252a87a811 drm/amd/display: Fix two cursor duplication when using overlay
    6cc777c6acbb bridge: Fix possible races between assigning rx_handler_data and setting IFF_BRIDGE_PORT bit
    c5946eb52b73 scsi: target: tcmu: Return from tcmu_handle_completions() if cmd_id not found
    e39a105abbe5 ceph: fix fscache invalidation
    13bc6bda6a1e scsi: lpfc: Fix illegal memory access on Abort IOCBs
    e69c7c149199 riscv: Workaround mcount name prior to clang-13
    cd3ab0ac0a54 scripts/recordmcount.pl: Fix RISC-V regex for clang
    cfa65174402f ARM: 9075/1: kernel: Fix interrupted SMC calls
    a5923afb6149 um: Disable CONFIG_GCOV with MODULES
    2fe3fbcc53b8 um: Mark all kernel symbols as local
    cec4c3810ba3 Input: silead - add workaround for x86 BIOS-es which bring the chip up in a stuck state
    29da2bab24e9 Input: elants_i2c - do not bind to i2c-hid compatible ACPI instantiated devices
    bbd7ba95bb06 ACPI / hotplug / PCI: Fix reference count leak in enable_slot()
    64f8e9526e31 ARM: 9066/1: ftrace: pause/unpause function graph tracer in cpu_suspend()
    41dd2ede9536 dmaengine: dw-edma: Fix crash on loading/unloading driver
    b003a4923628 PCI: thunder: Fix compile testing
    a05fb4ac72fb virtio_net: Do not pull payload in skb->head
    0d08bbce231b xsk: Simplify detection of empty and full rings
    323deebaa2d0 pinctrl: ingenic: Improve unreachable code generation
    e57e2dd9bbdd isdn: capi: fix mismatched prototypes
    7958cdd64cdf cxgb4: Fix the -Wmisleading-indentation warning
    acb4faa5f577 usb: sl811-hcd: improve misleading indentation
    eabb93e34425 kgdb: fix gcc-11 warning on indentation
    b806b41bf55d x86/msr: Fix wr/rdmsr_safe_regs_on_cpu() prototypes

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index ddf1e7354b..a55d84f2ba 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "5c7a781b20543c57a49ffc6fabac59cb769bd895"
-SRCREV_meta ?= "76aa6f85d62f7fc05c4b3e371fafe74290fc2238"
+SRCREV_machine ?= "c279b45a44858da788a13f23130ed06663e77c57"
+SRCREV_meta ?= "aa019cb8e4af653d6e136f1b8720884b97ddde49"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.120"
+LINUX_VERSION ?= "5.4.123"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 9045dade6e..cf8e81e0f3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.120"
+LINUX_VERSION ?= "5.4.123"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "0e1e637fa02afed13331ed27345233fb3969134b"
-SRCREV_machine ?= "0695891aff8c530c4a4ded7f17d6a262a15a0043"
-SRCREV_meta ?= "76aa6f85d62f7fc05c4b3e371fafe74290fc2238"
+SRCREV_machine_qemuarm ?= "445028ae9ec9a904122bb5c60995def98d2b1ddc"
+SRCREV_machine ?= "edc1395a32f99faaebc6b48769c4bd02a8b074be"
+SRCREV_meta ?= "aa019cb8e4af653d6e136f1b8720884b97ddde49"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 31d26cebc1..ddd019861d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "56b22a7df23bba68edae26b7edd742f298703f54"
-SRCREV_machine_qemuarm64 ?= "0695891aff8c530c4a4ded7f17d6a262a15a0043"
-SRCREV_machine_qemumips ?= "58a596a8a9547627afb002264cf2f2084c9856ac"
-SRCREV_machine_qemuppc ?= "0695891aff8c530c4a4ded7f17d6a262a15a0043"
-SRCREV_machine_qemuriscv64 ?= "0695891aff8c530c4a4ded7f17d6a262a15a0043"
-SRCREV_machine_qemux86 ?= "0695891aff8c530c4a4ded7f17d6a262a15a0043"
-SRCREV_machine_qemux86-64 ?= "0695891aff8c530c4a4ded7f17d6a262a15a0043"
-SRCREV_machine_qemumips64 ?= "f24f74364767d24f7b1a4967c162af693897ee51"
-SRCREV_machine ?= "0695891aff8c530c4a4ded7f17d6a262a15a0043"
-SRCREV_meta ?= "76aa6f85d62f7fc05c4b3e371fafe74290fc2238"
+SRCREV_machine_qemuarm ?= "c292705386cfec860dad5e1dee74f22407fb7f94"
+SRCREV_machine_qemuarm64 ?= "edc1395a32f99faaebc6b48769c4bd02a8b074be"
+SRCREV_machine_qemumips ?= "d4c949dc0b88dba72f9f94a18fd994aa8482ff8e"
+SRCREV_machine_qemuppc ?= "edc1395a32f99faaebc6b48769c4bd02a8b074be"
+SRCREV_machine_qemuriscv64 ?= "edc1395a32f99faaebc6b48769c4bd02a8b074be"
+SRCREV_machine_qemux86 ?= "edc1395a32f99faaebc6b48769c4bd02a8b074be"
+SRCREV_machine_qemux86-64 ?= "edc1395a32f99faaebc6b48769c4bd02a8b074be"
+SRCREV_machine_qemumips64 ?= "417e8e4e101314f02439a88c78d4cf2ab98df209"
+SRCREV_machine ?= "edc1395a32f99faaebc6b48769c4bd02a8b074be"
+SRCREV_meta ?= "aa019cb8e4af653d6e136f1b8720884b97ddde49"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.120"
+LINUX_VERSION ?= "5.4.123"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

