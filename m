Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.25043.1588520675217929004
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 08:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ueSMd9B7;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id w18so7159330qvs.3
        for <openembedded-core@lists.openembedded.org>; Sun, 03 May 2020 08:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P5yzidk/lZAgWJjqbz1KEwto6eCUAW7IpksSy+Ocl9o=;
        b=ueSMd9B7PT/nExSeYggrDC1QIonELfyjZgdR0g8tmdRBlTsfFEdod0288AvJ9Vz+Rh
         Ne+L34+otOkuuYbrD7QsCkDn43QPfQ3zMJ5ScPZQMSJkNh0FbSDdthk/ceAIIgMsLf0g
         /zTwJa7VbXTLEnBaCOH0o11Or2afMDYChWRxwom/jlOAdcESzZ62KCHKOsZwgCIx7hoz
         8oqY/TYnfTCzINeMYnbaF8GWVcUT6F5lTFFIY/7QXvlvCk5/8uQM2bhW7Pu5bAD9AMM9
         w0wapMTrLp5EscAmiHs/sWSXv7RUMw6YtyGsslasoX49eCl/kF+0XRHudy3eYy7m5aab
         uBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P5yzidk/lZAgWJjqbz1KEwto6eCUAW7IpksSy+Ocl9o=;
        b=YxuYDHyGNuY40PJtR0Dzr2BF5lENQjn/lrPIZIHTqd4wJO68rhss1AWyuHlH8rEQ99
         Nz1yt9nO8fz3ccsSLUs6TM5+fT4z5/AHrW9+vXYSRmMCK1A/7ShgYxY+Df7doloGQoiA
         F80XDIS62KggbcgjGv9KI5vfMeRWC7TKYs3nvEfmb4rnG2qYvmr/Awtb0LjwHEuaTqpv
         tJAEqoDzoJ+dgxnQ5qtRQNeYdSuahR8HjHAsKzPkvQmsR9hYiJxSnKZysoHMnuJ7M7Oy
         ABOln2oWWMWl8rsi0rAemfvhrZN+TXfRTa2qtAlV+4YW5Lbnm3E4eujvvLHLccVKUTOl
         v12g==
X-Gm-Message-State: AGi0Pubyw2P+acrJqtJmhDyapSbunh0tZgnSjsACqlq2aiRFHSsqnAhO
	sKIzioqGkKQkzyJROlFINFs=
X-Google-Smtp-Source: APiQypL2EUy6G8gEIfnXXXwnTtOkZI7lWLW1BYMwxsTmVhdhZfBXuTP1crhHKwNa2cIzuyl6pAx9sw==
X-Received: by 2002:a0c:90e7:: with SMTP id p94mr13032045qvp.219.1588520674174;
        Sun, 03 May 2020 08:44:34 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id p4sm7771506qkg.48.2020.05.03.08.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 08:44:33 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	steve@sakoman.com
Subject: [PATCH 1/5] linux-yocto/5.4: update to v5.4.28
Date: Sun,  3 May 2020 11:44:26 -0400
Message-Id: <5e818d6a0f51e9587534348370503aa33b8f264d.1588520452.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1588520452.git.bruce.ashfield@gmail.com>
References: <cover.1588520452.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    462afcd6e7ea Linux 5.4.28
    7b2cdbd67ff0 staging: greybus: loopback_test: fix potential path truncations
    8e79f440edb5 staging: greybus: loopback_test: fix potential path truncation
    58ffe6b0245e drm/bridge: dw-hdmi: fix AVI frame colorimetry
    c965a0299c61 nvmet-tcp: set MSG_MORE only if we actually have more to send
    d3eb4daa333f arm64: smp: fix crash_smp_send_stop() behaviour
    6080e0a9d107 arm64: smp: fix smp_send_stop() behaviour
    c61417fef99a ALSA: hda/realtek: Fix pop noise on ALC225
    163489b64361 futex: Unbreak futex hashing
    553d46b07dc4 futex: Fix inode life-time issue
    66f28e110565 x86/mm: split vmalloc_sync_all()
    9dfed456e1eb page-flags: fix a crash at SetPageError(THP_SWAP)
    32991c960d0b mm, slub: prevent kmalloc_node crashes and memory leaks
    623515739282 mm: slub: be more careful about the double cmpxchg of freelist
    8e709bbe41d6 epoll: fix possible lost wakeup on epoll_ctl() path
    69f434a05fb4 mm: do not allow MADV_PAGEOUT for CoW pages
    c3f54f0a68bf mm/hotplug: fix hot remove failure in SPARSEMEM|!VMEMMAP case
    61cfbcce9e09 mm, memcg: throttle allocators based on ancestral memory.high
    77c4bc4bf612 mm, memcg: fix corruption on 64-bit divisor in memory.high throttling
    ceca26903bd7 memcg: fix NULL pointer dereference in __mem_cgroup_usage_unregister_event
    2439259c32c8 stm class: sys-t: Fix the use of time_after()
    f7ef7a020f3b drm/lease: fix WARNING in idr_destroy
    b4e798cab8e9 drm/amd/amdgpu: Fix GPR read from debugfs (v2)
    eaa7fe20231a btrfs: fix log context list corruption after rename whiteout error
    039547fbd1e8 xhci: Do not open code __print_symbolic() in xhci trace events
    ac9d3279514c arm64: compat: Fix syscall number of compat_clock_getres
    70ca8a95df81 rtc: max8907: add missing select REGMAP_IRQ
    eba75a365f55 modpost: move the namespace field in Module.symvers last
    69a9b971406f intel_th: pci: Add Elkhart Lake CPU support
    3bdc0f68a170 intel_th: Fix user-visible error codes
    97097054a1f0 intel_th: msu: Fix the unexpected state warning
    07c70054ba24 staging/speakup: fix get_word non-space look-ahead
    35da67a8a50c staging: greybus: loopback_test: fix poll-mask build breakage
    fbe68a636982 staging: rtl8188eu: Add device id for MERCUSYS MW150US v2
    5f9579641df2 kbuild: Disable -Wpointer-to-enum-cast
    0f5be2f69e89 CIFS: fiemap: do not return EINVAL if get nothing
    48a9bc9534f3 mmc: sdhci-cadence: set SDHCI_QUIRK2_PRESET_VALUE_BROKEN for UniPhier
    8aafd5a0c63c mmc: sdhci-of-at91: fix cd-gpios for SAMA5D2
    0c4e0f0d2e51 mmc: rtsx_pci: Fix support for speed-modes that relies on tuning
    dbb328d1a87d iio: light: vcnl4000: update sampling periods for vcnl4040
    c3540b094edb iio: light: vcnl4000: update sampling periods for vcnl4200
    7ad22950caf5 iio: adc: at91-sama5d2_adc: fix differential channels in triggered mode
    4d71a4f76179 iio: adc: stm32-dfsdm: fix sleep in atomic context
    a79f53a2f5af iio: magnetometer: ak8974: Fix negative raw values in sysfs
    6387b4002357 iio: accel: adxl372: Set iio_chan BE
    3c69b794f96e iio: trigger: stm32-timer: disable master mode when stopping
    eb5f46b0cc55 iio: st_sensors: remap SMO8840 to LIS2DH12
    69399842e4a9 iio: chemical: sps30: fix missing triggered buffer dependency
    51d590fadc14 tty: fix compat TIOCGSERIAL checking wrong function ptr
    a754de70f6d6 tty: fix compat TIOCGSERIAL leaking uninitialized memory
    279cdccb6dc7 ALSA: pcm: oss: Remove WARNING from snd_pcm_plug_alloc() checks
    07ec940ceda5 ALSA: pcm: oss: Avoid plugin buffer overflow
    59e4624e664c ALSA: seq: oss: Fix running status after receiving sysex
    f439c2ece795 ALSA: seq: virmidi: Fix running status after receiving sysex
    e2f1c2d0b6db ALSA: hda/realtek - Enable the headset of Acer N50-600 with ALC662
    f0e819900968 ALSA: hda/realtek - Enable headset mic of Acer X2660G with ALC662
    2d994c9cefc4 ALSA: line6: Fix endless MIDI read loop
    64ab82cf614f USB: cdc-acm: fix rounding error in TIOCSSERIAL
    9ed83da8cd97 USB: cdc-acm: fix close_delay and closing_wait units in TIOCSSERIAL
    186b9564cf5e usb: typec: ucsi: displayport: Fix a potential race during registration
    ff1d876e9f4f usb: typec: ucsi: displayport: Fix NULL pointer dereference
    7b5aab752efc usb: xhci: apply XHCI_SUSPEND_DELAY to AMD XHCI controller 1022:145c
    6e1167db8d21 USB: serial: pl2303: add device-id for HP LD381
    ade2ca96e7a6 usb: host: xhci-plat: add a shutdown
    bace91138933 USB: serial: option: add ME910G1 ECM composition 0x110b
    2601053cafb4 usb: quirks: add NO_LPM quirk for RTL8153 based ethernet adapters
    d742e9874048 USB: Disable LPM on WD19's Realtek Hub
    712d9c2e92ea Revert "drm/fbdev: Fallback to non tiled mode if all tiles not present"
    c71986d18dea binderfs: use refcount for binder control devices too
    169bf660646a parse-maintainers: Mark as executable
    4db2f87e15c8 block, bfq: fix overwrite of bfq_group pointer in bfq_find_set_group()
    5d33ba6f385f xenbus: req->err should be updated before req->state
    7a79e217e3a5 xenbus: req->body should be updated before req->state
    25c3f96370a1 drm/amd/display: fix dcc swath size calculations on dcn1
    46c5b0d8dfbb drm/amd/display: Clear link settings on MST disable connector
    e53a333014a3 drm/amdgpu: clean wptr on wb when gpu recovery
    b557b2f00682 riscv: Fix range looking for kernel image memblock
    1c2106d2d9c1 riscv: Force flat memory model with no-mmu
    0bc9de1b1c1b spi: spi_register_controller(): free bus id on error paths
    af7dd05d7c8f ASoC: stm32: sai: manage rebind issue
    a3f349393eed riscv: avoid the PIC offset of static percpu data in module beyond 2G limits
    1804cdf99fdb dm integrity: use dm_bio_record and dm_bio_restore
    2e7e6de9ae38 dm bio record: save/restore bi_end_io and bi_integrity
    886a8fb13d0c altera-stapl: altera_get_note: prevent write beyond end of 'key'
    2c4e36033ace drivers/perf: arm_pmu_acpi: Fix incorrect checking of gicc pointer
    1002a094e066 drivers/perf: fsl_imx8_ddr: Correct the CLEAR bit definition
    0f6ae2cba3b8 drm/exynos: hdmi: don't leak enable HDMI_EN regulator if probe fails
    53138bea67b2 drm/exynos: dsi: fix workaround for the legacy clock name
    41f88dc1adcc drm/exynos: dsi: propagate error value and silence meaningless warning
    0c30297dddc0 spi/zynqmp: remove entry that causes a cs glitch
    b8ba4d74f9f3 spi: pxa2xx: Add CS control clock quirk
    416e1f433c70 ARM: dts: dra7: Add "dma-ranges" property to PCIe RC DT nodes
    74219d52d4e7 cifs: add missing mount option to /proc/mounts
    ddd8b3ed509a cifs: fix potential mismatch of UNC paths
    a7393e6f2ecf powerpc: Include .BTF section
    9eee3e21a59d spi: qup: call spi_qup_pm_resume_runtime before suspending
    1d4f214c8820 ARM: dts: dra7-l4: mark timer13-16 as pwm capable
    5f657e5303d3 phy: ti: gmii-sel: do not fail in case of gmii
    ee1245396b6e phy: ti: gmii-sel: fix set of copy-paste errors
    4d9020c3d802 drm/mediatek: Find the cursor plane instead of hard coding it
    61c895d0f726 spi: spi-omap2-mcspi: Support probe deferral for DMA channels
    f9f635c04769 locks: reinstate locks_delete_block optimization
    384e15fc4226 locks: fix a potential use-after-free problem when wakeup a waiter

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 9e74ec17af..bc0c30986d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "79037ae58e6b0dfd0c63d4a0e131f1bd5efe7e53"
-SRCREV_meta ?= "bee554e595e49c963900d1c78c01ab2d041382e7"
+SRCREV_machine ?= "79b7c0fa5b69a99037cafa959077c4bbb46ebddd"
+SRCREV_meta ?= "32041dcb06c23ae4d2e9872c284b8c0500f3d5a4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.27"
+LINUX_VERSION ?= "5.4.28"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index ba5e668d73..5a86edac60 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.27"
+LINUX_VERSION ?= "5.4.28"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "5c2d35eeb4be0e8bae4cf5ee0733e41ff1262ff3"
-SRCREV_machine ?= "03142acba06e8b33888410a518358a626dceb720"
-SRCREV_meta ?= "bee554e595e49c963900d1c78c01ab2d041382e7"
+SRCREV_machine_qemuarm ?= "044058d79ab16a29429ce0163496da599bd83c33"
+SRCREV_machine ?= "5ebd77b70931f1fec5dbae6ca9168b0471e9083e"
+SRCREV_meta ?= "32041dcb06c23ae4d2e9872c284b8c0500f3d5a4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 25e933d683..13b8085547 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "ab849248b45403c7d6f1fb8e8f57840cc2880618"
-SRCREV_machine_qemuarm64 ?= "03142acba06e8b33888410a518358a626dceb720"
-SRCREV_machine_qemumips ?= "967a1708cbbfe1b524dc28f04fa5e0d79a270bf5"
-SRCREV_machine_qemuppc ?= "03142acba06e8b33888410a518358a626dceb720"
-SRCREV_machine_qemuriscv64 ?= "03142acba06e8b33888410a518358a626dceb720"
-SRCREV_machine_qemux86 ?= "03142acba06e8b33888410a518358a626dceb720"
-SRCREV_machine_qemux86-64 ?= "03142acba06e8b33888410a518358a626dceb720"
-SRCREV_machine_qemumips64 ?= "d3e850da830241c424d557a6a072527e09e784ab"
-SRCREV_machine ?= "03142acba06e8b33888410a518358a626dceb720"
-SRCREV_meta ?= "bee554e595e49c963900d1c78c01ab2d041382e7"
+SRCREV_machine_qemuarm ?= "f7412afb66c40e1c9944f115bc499fc395520c7c"
+SRCREV_machine_qemuarm64 ?= "5ebd77b70931f1fec5dbae6ca9168b0471e9083e"
+SRCREV_machine_qemumips ?= "4aba5a90caa5dd43098e3317e121497e4ce4bcaa"
+SRCREV_machine_qemuppc ?= "5ebd77b70931f1fec5dbae6ca9168b0471e9083e"
+SRCREV_machine_qemuriscv64 ?= "5ebd77b70931f1fec5dbae6ca9168b0471e9083e"
+SRCREV_machine_qemux86 ?= "5ebd77b70931f1fec5dbae6ca9168b0471e9083e"
+SRCREV_machine_qemux86-64 ?= "5ebd77b70931f1fec5dbae6ca9168b0471e9083e"
+SRCREV_machine_qemumips64 ?= "a72caa2030fa17491f4013025b598f76b7efe39b"
+SRCREV_machine ?= "5ebd77b70931f1fec5dbae6ca9168b0471e9083e"
+SRCREV_meta ?= "32041dcb06c23ae4d2e9872c284b8c0500f3d5a4"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.27"
+LINUX_VERSION ?= "5.4.28"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

