Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4979C43217
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:17:53 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web12.6436.1640013473051149426
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:17:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=B87Hq1Zc;
 spf=pass (domain: gmail.com, ip: 209.85.222.181,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id 132so9607680qkj.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ea7Sm1DLryfY32eAgj/k7R4UWBWhjjr6pgv9sxxZGMY=;
        b=B87Hq1ZccBPsi52mWPddt196dU9Ccenmv0Rz658+keCubXOFi2Kzw6/cM7DfPwfXfB
         uvhPdvI1j162ghi1lCXTZPBs2uOrXSdj6j92QORjJTw2kQGQEbhc3vyJnJh5YAS3gwRk
         ucUz7EneqWm2ONvAOj+o6gIjzD2B5EraqJ5+doDK3WFksuN6zBWwSXrxQOvtxtN/fJZN
         9RV7zQxlO2ze4tWRBjhzJXdP8hf1aco7wGefAUZLd8sg3ZChH7Vy83RxElXdtpQbDfTU
         tSYqvHH7JX6UxsbXXk/lk4/iRUqqEwWg0kd4aXqQoxuabquJBTJlBgeRZcB6zx/umXFi
         WE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ea7Sm1DLryfY32eAgj/k7R4UWBWhjjr6pgv9sxxZGMY=;
        b=I95jDLcrPFGJOUNaxokPecn8ayxvR9yYux2rwUn9CGbB5meWl93o83JKgLWtSk6GYg
         da676VglUKhj6Cd07dP589MHQN5NcSgikp/w3q+c98VrqTbGJSsM+U2Hgpbj/XdYOzoN
         yrYXPBsyo+7qemUZ7QdtBL6QoOnyzbHrtIf6mXOqwsOx3dujdE3n/1vk8pFcmACMhgN1
         rStX2kodOghlzY0FTxYaPCIKxJusuVYhCt5Rr+ahZS6Zze0+u20mjc5hDE+fShhrN+ii
         xntT4QwGDJAe/k0IXnA+9Hn/WTPPG9GzXisOPaxTXzHp3Fad4rwjG72X4+JD/8XCn51k
         gSxg==
X-Gm-Message-State: AOAM533aP7Cy4FL52FxhOQhUBst8YrRVqOSOeeQUaHGgx4SbNETZ/lS6
	v+8mtOJm7cd5QoytU+FGLmJnZ2N0hr4=
X-Google-Smtp-Source: 
 ABdhPJzvt/8yKq8MR4jtfGXVfs/lKEgZG5+0ThJXeZ58cbxWL98RZjpb9OcFtzqsSWZ6Zk+CckC+Fw==
X-Received: by 2002:a37:cc8:: with SMTP id 191mr5576008qkm.380.1640013472027;
        Mon, 20 Dec 2021 07:17:52 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 i7sm11338634qkn.0.2021.12.20.07.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 07:17:51 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/5.10: update to v5.10.85
Date: Mon, 20 Dec 2021 10:17:44 -0500
Message-Id: 
 <7f196af6dd59a6437ecf6ff1fc8950edee076c52.1640013267.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1640013267.git.bruce.ashfield@gmail.com>
References: <cover.1640013267.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Dec 2021 15:17:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159887

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

e4f2aee6612e Linux 5.10.85
47301c06f602 Documentation/Kbuild: Remove references to gcc-plugin.sh
af5ba49cf705 MAINTAINERS: adjust GCC PLUGINS after gcc-plugin.sh removal
ad13421fd2cd doc: gcc-plugins: update gcc-plugins.rst
9fc17c3af56c kbuild: simplify GCC_PLUGINS enablement in dummy-tools/gcc
d428e5477493 bpf: Add selftests to cover packet access corner cases
0ec0eda3f3c3 misc: fastrpc: fix improper packet size calculation
261d45a4c254 irqchip: nvic: Fix offset for Interrupt Priority Offsets
cd946f0ebe78 irqchip/irq-gic-v3-its.c: Force synchronisation when issuing INVALL
e1c6611f822e irqchip/armada-370-xp: Fix support for Multi-MSI interrupts
8f3ed9deaaac irqchip/armada-370-xp: Fix return value of armada_370_xp_msi_alloc()
d530e9943d64 irqchip/aspeed-scu: Replace update_bits with write_bits.
014c2fa5dc49 csky: fix typo of fpu config macro
ee86d0bad80b iio: accel: kxcjk-1013: Fix possible memory leak in probe and remove
c10c53419d8d iio: ad7768-1: Call iio_trigger_notify_done() on error
0f86c9e818e7 iio: adc: axp20x_adc: fix charging current reporting on AXP22x
af7fbb8c0b54 iio: adc: stm32: fix a current leak by resetting pcsel before disabling vdda
fff92f3712d7 iio: at91-sama5d2: Fix incorrect sign extension
a2545b147d23 iio: dln2: Check return value of devm_iio_trigger_register()
69ae78c1abe7 iio: dln2-adc: Fix lockdep complaint
416383999c66 iio: itg3200: Call iio_trigger_notify_done() on error
bc4d8367ed0d iio: kxsd9: Don't return error code in trigger handler
28ea539a311e iio: ltr501: Don't return error code in trigger handler
db12d9508536 iio: mma8452: Fix trigger reference couting
4e7852911084 iio: stk3310: Don't return error code in interrupt handler
5c4a0f307f2b iio: trigger: stm32-timer: fix MODULE_ALIAS
5de9c5b13062 iio: trigger: Fix reference counting
cbc04c0c9a67 iio: gyro: adxrs290: fix data signedness
fee8be5bde56 xhci: avoid race between disable slot command and host runtime suspend
1b43c9b65f6b usb: core: config: using bit mask instead of individual bits
74b6a6a239aa xhci: Remove CONFIG_USB_DEFAULT_PERSIST to prevent xHCI from runtime suspending
ef284f086dd0 usb: core: config: fix validation of wMaxPacketValue entries
e4de8ca013f0 USB: gadget: zero allocate endpoint 0 buffers
7193ad3e50e5 USB: gadget: detect too-big endpoint 0 requests
63fc70bffa16 selftests/fib_tests: Rework fib_rp_filter_test()
126d1897cbff net/qla3xxx: fix an error code in ql_adapter_up()
5e663bcd9a37 net, neigh: clear whole pneigh_entry at alloc time
ae673832086e net: fec: only clear interrupt of handling queue in fec_enet_rx_queue()
83b16b9c441b net: altera: set a couple error code in probe()
385ffd31ebdb net: cdc_ncm: Allow for dwNtbOutMaxSize to be unset or zero
47322fddb41e tools build: Remove needless libpython-version feature check that breaks test-all fast path
42bea3a1b7f2 dt-bindings: net: Reintroduce PHY no lane swap binding
3f57215f748b Documentation/locking/locktypes: Update migrate_disable() bits.
77d255d28b34 perf tools: Fix SMT detection fast read path
391ca20ea16e Revert "PCI: aardvark: Fix support for PCI_ROM_ADDRESS1 on emulated bridge"
e5b7fb2198ab i40e: Fix NULL pointer dereference in i40e_dbg_dump_desc
347cc9b4d966 mtd: rawnand: fsmc: Fix timing computation
0b2e1fccdf48 mtd: rawnand: fsmc: Take instruction delay into account
57f290572f45 i40e: Fix pre-set max number of queues for VF
eb87117c27e7 i40e: Fix failed opcode appearing if handling messages from VF
82ed3829c937 clk: imx: use module_platform_driver
4d12546cf9e7 RDMA/hns: Do not destroy QP resources in the hw resetting phase
33f320c35d69 RDMA/hns: Do not halt commands during reset until later
4458938b297e ASoC: codecs: wcd934x: return correct value from mixer put
1089dac26c6b ASoC: codecs: wcd934x: handle channel mappping list correctly
83dae68fc00a ASoC: codecs: wsa881x: fix return values from kcontrol put
62e4dc5e130e ASoC: qdsp6: q6routing: Fix return value from msm_routing_put_audio_mixer
2f4764fe3692 ASoC: rt5682: Fix crash due to out of scope stack vars
bdd8129c6605 PM: runtime: Fix pm_runtime_active() kerneldoc comment
661c4412c563 qede: validate non LSO skb length
c4d2d7c935a4 scsi: scsi_debug: Fix buffer size of REPORT ZONES command
1e434d2687e8 scsi: pm80xx: Do not call scsi_remove_host() in pm8001_alloc()
5dfe61147442 block: fix ioprio_get(IOPRIO_WHO_PGRP) vs setuid(2)
5f1f94c26b0d tracefs: Set all files to the same group ownership as the mount option
2ba0738f7117 net: mvpp2: fix XDP rx queues registering
47ffefd88abf aio: fix use-after-free due to missing POLLFREE handling
e4d19740bcca aio: keep poll requests on waitqueue until completed
fc2f636ffc44 signalfd: use wake_up_pollfree()
9f3acee7eac8 binder: use wake_up_pollfree()
8e04c8397bf9 wait: add wake_up_pollfree()
2f8eb4c4c8f6 libata: add horkage for ASMedia 1092
f76580d82c62 can: m_can: Disable and ignore ELO interrupt
703dde112021 can: pch_can: pch_can_rx_normal: fix use after free
2737d0bc21b6 drm/syncobj: Deal with signalled fences in drm_syncobj_find_fence.
17edb38e76d6 clk: qcom: regmap-mux: fix parent clock lookup
172a98224418 mmc: renesas_sdhi: initialize variable properly when tuning
33204825cc2b tracefs: Have new files inherit the ownership of their parent
c520943a00ad nfsd: Fix nsfd startup race (again)
eeb0711801f5 nfsd: fix use-after-free due to delegation race
8b4264c27b82 md: fix update super 1.0 on rdev size change
caf9b352dc58 btrfs: replace the BUG_ON in btrfs_del_root_ref with proper error handling
41b3cc57d626 btrfs: clear extent buffer uptodate when we fail to write it
75490bcbd076 scsi: qla2xxx: Format log strings only if needed
07977a3f3d55 ALSA: pcm: oss: Handle missing errors in snd_pcm_oss_change_params*()
ad45babf7886 ALSA: pcm: oss: Limit the period size to 16MB
02b2b691b77c ALSA: pcm: oss: Fix negative period/buffer sizes
6760e6ddeb48 ALSA: hda/realtek: Fix quirk for TongFang PHxTxX1
7fe903d35492 ALSA: hda/realtek - Add headset Mic support for Lenovo ALC897 platform
3063ee5164e4 ALSA: ctl: Fix copy of updated id with element read/write
c581090228e3 mm: bdi: initialize bdi_min_ratio when bdi is unregistered
06368922f38f KVM: x86: Wait for IPIs to be delivered when handling Hyper-V TLB flush hypercall
2a51edaf5cc5 net/sched: fq_pie: prevent dismantle issue
4b7e90672af8 devlink: fix netns refcount leak in devlink_nl_cmd_reload()
9d683d14f600 IB/hfi1: Correct guard on eager buffer deallocation
2e2edebb5dd6 iavf: Fix reporting when setting descriptor count
aada0b3f3392 iavf: restore MSI state on reset
32a329b731a3 netfilter: conntrack: annotate data-races around ct->timeout
5e39de85b76e udp: using datalen to cap max gso segments
666521b3852d seg6: fix the iif in the IPv6 socket control block
484069b5de9d nfp: Fix memory leak in nfp_cpp_area_cache_add()
b1830ede16f8 bonding: make tx_rebalance_counter an atomic
a59df4ea7155 ice: ignore dropped packets during init
349e83c0cf67 bpf: Fix the off-by-two error in range markings
f26951db84a4 bpf, x86: Fix "no previous prototype" warning
74685aaecef0 vrf: don't run conntrack on vrf with !dflt qdisc
d5cf399a6dc3 selftests: netfilter: add a vrf+conntrack testcase
83ea620a1be8 nfc: fix potential NULL pointer deref in nfc_genl_dump_ses_done
f3d9114ac99f drm/amdkfd: fix boot failure when iommu is disabled in Picasso.
7508a9aa65b9 drm/amdgpu: init iommu after amdkfd device init
ac9db04ee32f drm/amdgpu: move iommu_resume before ip init/resume
fe9dca7dda61 drm/amdgpu: add amdgpu_amdkfd_resume_iommu
5d191b0976b7 drm/amdkfd: separate kfd_iommu_resume from kfd_resume
46dcf66d6e7a drm/amd/amdkfd: adjust dummy functions' placement
dded8d76a7dc x86/sme: Explicitly map new EFI memmap table as encrypted
923f4dc5df67 can: sja1000: fix use after free in ems_pcmcia_add_card()
819251da7178 can: kvaser_pciefd: kvaser_pciefd_rx_error_frame(): increase correct stats->{rx,tx}_errors counter
854a2bede1f0 can: kvaser_usb: get CAN clock frequency from device
2c08271f4ed0 IB/hfi1: Fix leak of rcvhdrtail_dummy_kvaddr
d87c10607b5b IB/hfi1: Fix early init panic
d60dd3685dc9 IB/hfi1: Insure use of smp_processor_id() is preempt disabled
05eb0e4a12b2 nft_set_pipapo: Fix bucket load in AVX2 lookup routine for six 8-bit groups
89f3edc98ffe HID: check for valid USB device for many HID drivers
889c39113f7e HID: wacom: fix problems when device is not a valid USB device
6272b17001e6 HID: bigbenff: prevent null pointer dereference
d877651afd60 HID: add USB_HID dependancy on some USB HID drivers
a7e9c5ddf562 HID: add USB_HID dependancy to hid-chicony
28989ed4d79e HID: add USB_HID dependancy to hid-prodikeys
61144329606c HID: add hid_is_usb() function to make it simpler for USB detection
2298d5edd837 HID: google: add eel USB id
12362cd3a409 HID: quirks: Add quirk for the Microsoft Surface 3 type-cover
cc97d7321595 gcc-plugins: fix gcc 11 indigestion with plugins...
1eee36a5520b gcc-plugins: simplify GCC plugin-dev capability test
518c3f98e57a usb: gadget: uvc: fix multiple opens

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 6390f6f353..8de610bd40 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b964618dbcfd6f010b0204e1b3bf575c2ce17920"
-SRCREV_meta ?= "5bdb3bf9619c5f2b928fc784aa0082d399d83fbb"
+SRCREV_machine ?= "97b3d2f0923ab9e9a9eb47c284006cddb0156146"
+SRCREV_meta ?= "be7b73b2c0e453724d18520ae165b5d474735578"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.84"
+LINUX_VERSION ?= "5.10.85"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index dbe8ae1fa5..f557251ae0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.84"
+LINUX_VERSION ?= "5.10.85"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "93faaef91af9e57e70cadd27338f62a4afce83aa"
-SRCREV_machine ?= "fa8269a92a01127ad6627f751cdac5cdbfd527a6"
-SRCREV_meta ?= "5bdb3bf9619c5f2b928fc784aa0082d399d83fbb"
+SRCREV_machine:qemuarm ?= "615408bf1ba1cbc40750334329f97ea2b56e3d63"
+SRCREV_machine ?= "3bd3c6de33c2efcef6feaa0f2624e8adc900bda7"
+SRCREV_meta ?= "be7b73b2c0e453724d18520ae165b5d474735578"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index dbe17fae6e..dd1ff905c8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "765d9bff031ec7198a3e5359127249df19b8bdfa"
-SRCREV_machine:qemuarm64 ?= "c1bb5868e46a792e176b842aefc98dea2727e5fa"
-SRCREV_machine:qemumips ?= "63624e5dfe27ae4f9caa4a70b12eec4e63a9e557"
-SRCREV_machine:qemuppc ?= "d054e2117a15fe0155fde3878811cf233fca3f83"
-SRCREV_machine:qemuriscv64 ?= "7a88f25e2d0e2dd2da6f0e9cab91e0d097b9e10a"
-SRCREV_machine:qemuriscv32 ?= "7a88f25e2d0e2dd2da6f0e9cab91e0d097b9e10a"
-SRCREV_machine:qemux86 ?= "7a88f25e2d0e2dd2da6f0e9cab91e0d097b9e10a"
-SRCREV_machine:qemux86-64 ?= "7a88f25e2d0e2dd2da6f0e9cab91e0d097b9e10a"
-SRCREV_machine:qemumips64 ?= "d435de927eb2adb0cfcd49572bb71ce7ff31035d"
-SRCREV_machine ?= "7a88f25e2d0e2dd2da6f0e9cab91e0d097b9e10a"
-SRCREV_meta ?= "5bdb3bf9619c5f2b928fc784aa0082d399d83fbb"
+SRCREV_machine:qemuarm ?= "bd67fa7bae301072f17d78b932b833f2f9db6d79"
+SRCREV_machine:qemuarm64 ?= "10e6f0bc97e599902f6c98213945685d0fd4a780"
+SRCREV_machine:qemumips ?= "960862d5d1b51892b7cd621ba9d54f89dc99dc0b"
+SRCREV_machine:qemuppc ?= "5c4c88cb82cbc6aff04ecf12f4c34d0bc5dc90c4"
+SRCREV_machine:qemuriscv64 ?= "299cd9fdd1a66ad4ce643a6536648228669a50fb"
+SRCREV_machine:qemuriscv32 ?= "299cd9fdd1a66ad4ce643a6536648228669a50fb"
+SRCREV_machine:qemux86 ?= "299cd9fdd1a66ad4ce643a6536648228669a50fb"
+SRCREV_machine:qemux86-64 ?= "299cd9fdd1a66ad4ce643a6536648228669a50fb"
+SRCREV_machine:qemumips64 ?= "9e7fb877bb5fe2aaec720cf181e07e2db397e68f"
+SRCREV_machine ?= "299cd9fdd1a66ad4ce643a6536648228669a50fb"
+SRCREV_meta ?= "be7b73b2c0e453724d18520ae165b5d474735578"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.84"
+LINUX_VERSION ?= "5.10.85"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


