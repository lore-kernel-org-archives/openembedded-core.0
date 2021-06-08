Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.13322.1623163464165853566
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jun 2021 07:44:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=lIezVFX+;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.44, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f44.google.com with SMTP id 66-20020a9d02c80000b02903615edf7c1aso20476825otl.13
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Jun 2021 07:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=4UjogL6cpW8MO4/s3wGkNQgkNhllaxFWE615MLxf+wU=;
        b=lIezVFX+Jnzctdxp6S/cjAdY+9tOFdtZfj8IY0EfF1f6aGiM7BQtPWk80xnTCaIaCj
         R4v//rCI7mna8SZ0PTEyfgKAzQPC81t9kVUUAHmjglRBA8OU8w7EPuHuUTj+MkQPrYmi
         aYvXeFxlCeueIWyWSDIwFlHM1JOY/h0fw2Pmmv9WnIsF/n9dJ3UYGDjmVZfWIHrPaAI4
         jTQ31mkSNOhEfbIdmlAn3M0P3mNQb0Tessg3+mvWyTV6+D8RCryaEkwhWfYaFr25pxts
         lOyuWkNaRSFvjhgzAEba72nmP/ovK0iTU5dydae/mWNjQ+zTlVpruzHyy7CRvN9RX0x9
         YqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4UjogL6cpW8MO4/s3wGkNQgkNhllaxFWE615MLxf+wU=;
        b=NFjU64flf31OnBCSpLHMygWtlOB5WtrFOtPcog+RxyQLyjQRSWdpXDo1RucmBXlNYa
         qop8o1K37t8SktX4+N80QFKXqusUcvkuQKBjBmkdBzrMDkXmYy9D5DeB7Kw7FK5joBk9
         47Hz1XFj2hrW0XpwUE7tXebQooqp6sHGgTkkzLpVLJ8cELHIlIdM4orOJr76LM6Fp6Wn
         FEr8khoIe+UXr3ssez66pPVbmycDpnhSY6Ig4wxt4W3yBWixQKt8MKevLPTFKP+8hRVa
         tWpUZ3dtl7aLp09rg2GmpEuckPbI7JcGJ25mBXmm0gG9MvIIg/Md4dj6Gvtdx/Pb5yVl
         sxLw==
X-Gm-Message-State: AOAM531/aLyD3wcmQ2XzLMFtjR2tAdpkUL4LghBV5yO/xkMVQ8czxd1W
	FGYxiiYh1JOzt2hEQ4i39W8A54VeUgUVHtYiATg=
X-Google-Smtp-Source: ABdhPJyzLnn6vubBeHS0vNvJNH0wh/K4cyfG05esjwP58OVVUqAejYPL941Yxqjcgy1lVQc0ZbV8ug==
X-Received: by 2002:a05:6830:2415:: with SMTP id j21mr17901055ots.224.1623163462635;
        Tue, 08 Jun 2021 07:44:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id l10sm631979otj.17.2021.06.08.07.44.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 07:44:22 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/6] linux-yocto/5.4: update to v5.4.123
Date: Tue,  8 Jun 2021 04:42:33 -1000
Message-Id: <48ac436adb0b186806b2a2d43945d587c50355f0.1623163071.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1623163071.git.steve@sakoman.com>
References: <cover.1623163071.git.steve@sakoman.com>
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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 881ed7938f84ba89b9bb20ce8e45ef9d85e80cb8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 62124af43b..3643e6af46 100644
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
index bf2e8944c6..7282fbcd6e 100644
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
2.25.1

