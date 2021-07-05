Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
 by mx.groups.io with SMTP id smtpd.web08.505.1625524554282377894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jul 2021 15:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=U77Qb4uG;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.49, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f49.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so19718188otl.3
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jul 2021 15:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=elS/MDf4W5UJbbrTY+WQB3Eg1XPGNYhvS9nnAvcqFig=;
        b=U77Qb4uGAuWBbOqNO7Tks9XEc5AgqsZHSmvQB/U2MkviF/zaem39e6sfHS+QsTD8Ar
         SFIo9mNP2mLqo+aA7G+8EobCo7xER9JJnGXgqSoO0eoajrMBDuFrhN5qqmHpibAL1yWZ
         8CeTRq1PP//CUrzcbwMh8XY+zqlLIVDylZplFUf7zkGgwtZqbDtZXEA6SK1PI+F0oken
         7NNQE8a1A/wAjpLRVQ756kMAZAHo12G3utcHme5IOh3A3bRSnf5XmfqMvFQH77GVkruH
         kghoGKy44CPj+z6OU7ik2WjX9CnWGLd/4CCdkpNMIKV6yY+jJCuw7VtylRShh/VINwNn
         jg6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=elS/MDf4W5UJbbrTY+WQB3Eg1XPGNYhvS9nnAvcqFig=;
        b=OkmqHxxoQ+eONP5FmcE+JllFqyBmOBUvJFLAlrm9BJv4qjkMEvunW5lRAvgjQD6gTu
         kHHV31mf0O+tPwxxthVXYkLFWxskrEcagLewe7q2DRNZF9TUgxfc40VFu+vW3Q+22wsF
         a/BEhMsaMY0Cu4KP+ggCAmagwfZWEvBaEuHuO569BIu+OVjbMb9L9K5IURavjfYsIl9L
         gXIGEuUARAn6+aca764QKtP4MV9OrOA1V8WYfGifTAK3qBqrUA0V71Tdd6Os5S9JJJ1z
         IeQcSY5YFNzlh+DUE+mOdYyhc7aDaqJ0c0YblLnc4J/Ms7eSnPNZwI+oaw1U0u31qJau
         X0/A==
X-Gm-Message-State: AOAM532aZiyYlmSZDvL648c051XEXlnMi3pboaB4r1TRR5/VEsYkaoVE
	ijtqe6YEYNTxDzTuF1dRBCi/BLeCyPG8mULw
X-Google-Smtp-Source: ABdhPJwyY7aq4PoYmikNxOa7SpGErtsta7IhTmp4r+nbe8al2qKIGklZKoOFgJu1n3JH+QWGso8gqA==
X-Received: by 2002:a9d:5e17:: with SMTP id d23mr12055727oti.330.1625524553081;
        Mon, 05 Jul 2021 15:35:53 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id i16sm2870178otp.7.2021.07.05.15.35.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 15:35:52 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/19] linux-yocto/5.4: update to v5.4.124
Date: Mon,  5 Jul 2021 12:34:42 -1000
Message-Id: <6edeff686b4cd644f27b370b36273dec79365af0.1625511812.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1625511812.git.steve@sakoman.com>
References: <cover.1625511812.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    70154d2f82a9 Linux 5.4.124
    23c7e3235a3a usb: core: reduce power-on-good delay time of root hub
    241abccc8a33 neighbour: Prevent Race condition in neighbour subsytem
    3c36980ba681 net: hso: bail out on interrupt URB allocation failure
    1bd48a2af84e Revert "Revert "ALSA: usx2y: Fix potential NULL pointer dereference""
    866648d965f0 net: hns3: check the return of skb_checksum_help()
    72cda5259f5e drivers/net/ethernet: clean up unused assignments
    776fba1486be i915: fix build warning in intel_dp_get_link_status()
    c561d83be40f drm/i915/display: fix compiler warning about array overrun
    e3d5ff235ec5 MIPS: ralink: export rt_sysc_membase for rt2880_wdt.c
    86a62df8f4d4 MIPS: alchemy: xxs1500: add gpio-au1000.h header file
    2221f233cc9e sch_dsmark: fix a NULL deref in qdisc_reset()
    a052751302b7 net: ethernet: mtk_eth_soc: Fix packet statistics support for MT7628/88
    162b11831f77 ALSA: usb-audio: scarlett2: snd_scarlett_gen2_controls_create() can be static
    3bfb58517d06 ipv6: record frag_max_size in atomic fragments in input path
    8bb1077448d4 net: lantiq: fix memory corruption in RX ring
    fda8f74d3975 scsi: libsas: Use _safe() loop in sas_resume_port()
    cf20c704a26e ixgbe: fix large MTU request from VF
    7a143b92d1dc bpf: Set mac_len in bpf_skb_change_head
    272729d56b2d ASoC: cs35l33: fix an error code in probe()
    3ee1d6e23108 staging: emxx_udc: fix loop in _nbu2ss_nuke()
    0bf49b3c8d8b cxgb4: avoid accessing registers when clearing filters
    68b5fc6ec52f gve: Correct SKB queue index validation.
    4f4752e4d8db gve: Upgrade memory barrier in poll routine
    821149ee88c2 gve: Add NULL pointer checks when freeing irqs.
    6abd1d1983f2 gve: Update mgmt_msix_idx if num_ntfy changes
    13c4d8986125 gve: Check TX QPL was actually assigned
    37d697759958 mld: fix panic in mld_newpack()
    b0fb74377891 bnxt_en: Include new P5 HV definition in VF check.
    f7b5b4e26bf5 net: bnx2: Fix error return code in bnx2_init_board()
    7a79654b9076 net: hso: check for allocation failure in hso_create_bulk_serial_device()
    48da4c0577fe net: sched: fix tx action reschedule issue with stopped queue
    515e7c595d84 net: sched: fix tx action rescheduling issue during deactivation
    1c25c7621fb7 net: sched: fix packet stuck problem for lockless qdisc
    a04790d104e2 tls splice: check SPLICE_F_NONBLOCK instead of MSG_DONTWAIT
    5c01181700ab openvswitch: meter: fix race when getting now_ms.
    5bfdc481d812 net: mdio: octeon: Fix some double free issues
    2e0fba911ca7 net: mdio: thunder: Fix a double free issue in the .remove function
    20255d41ac56 net: fec: fix the potential memory leak in fec_enet_init()
    41f7f37ddefe net: really orphan skbs tied to closing sk
    694f68527e75 vfio-ccw: Check initialized flag in cp_init()
    d5e4479228b5 ASoC: cs42l42: Regmap must use_single_read/write
    87803141fb3e net: dsa: fix error code getting shifted with 4 in dsa_slave_get_sset_count
    4450f733dc3d net: netcp: Fix an error message
    de2bf5de17be drm/amd/amdgpu: fix a potential deadlock in gpu reset
    7398c2aab4da drm/amdgpu: Fix a use-after-free
    dde2656e0bbb drm/amd/amdgpu: fix refcount leak
    f6d92ebb3eaf drm/amd/display: Disconnect non-DP with no EDID
    63c61d89660a SMB3: incorrect file id in requests compounded with open
    07160b004a0b platform/x86: touchscreen_dmi: Add info for the Mediacom Winpad 7.0 W700 tablet
    d1dcd53a45e1 platform/x86: intel_punit_ipc: Append MODULE_DEVICE_TABLE for ACPI
    feb5d3618a18 platform/x86: hp-wireless: add AMD's hardware id to the supported list
    0ed102453aa1 btrfs: do not BUG_ON in link_to_fixup_dir
    a10371342903 openrisc: Define memory barrier mb
    fed34fb07c4b scsi: BusLogic: Fix 64-bit system enumeration error for Buslogic
    55575c08502f btrfs: return whole extents in fiemap
    a3dea6dc1e14 brcmfmac: properly check for bus register errors
    26fb7a61de4e Revert "brcmfmac: add a check for the status of usb_register"
    d4bab5d15bf5 net: liquidio: Add missing null pointer checks
    6ba750549671 Revert "net: liquidio: fix a NULL pointer dereference"
    d771def6c305 media: gspca: properly check for errors in po1030_probe()
    44b17737b7aa Revert "media: gspca: Check the return value of write_bridge for timeout"
    f6068eadc1d2 media: gspca: mt9m111: Check write_bridge for timeout
    f19375e9a8f2 Revert "media: gspca: mt9m111: Check write_bridge for timeout"
    193c790eccfc media: dvb: Add check on sp8870_readreg return
    2d5e27f0e031 Revert "media: dvb: Add check on sp8870_readreg"
    5b3a68a1cf37 ASoC: cs43130: handle errors in cs43130_probe() properly
    7e4ac4e151f1 Revert "ASoC: cs43130: fix a NULL pointer dereference"
    3aa60a0335ea libertas: register sysfs groups properly
    e0c75f951f81 Revert "libertas: add checks for the return value of sysfs_create_group"
    6c52bc7482e3 dmaengine: qcom_hidma: comment platform_driver_register call
    e829b7253e4d Revert "dmaengine: qcom_hidma: Check for driver register failure"
    4bc94e60d787 isdn: mISDN: correctly handle ph_info allocation failure in hfcsusb_ph_info
    6b8872d4972f Revert "isdn: mISDN: Fix potential NULL pointer dereference of kzalloc"
    85b2c436a143 ath6kl: return error code in ath6kl_wmi_set_roam_lrssi_cmd()
    b74d4ae8f538 Revert "ath6kl: return error code in ath6kl_wmi_set_roam_lrssi_cmd()"
    a34338fcaad6 isdn: mISDNinfineon: check/cleanup ioremap failure correctly in setup_io
    d3d74e622e63 Revert "isdn: mISDNinfineon: fix potential NULL pointer dereference"
    5dc20457707b Revert "ALSA: usx2y: Fix potential NULL pointer dereference"
    ea4c563657d7 Revert "ALSA: gus: add a check of the status of snd_ctl_add"
    70bf2a067915 char: hpet: add checks after calling ioremap
    07d2945a3551 Revert "char: hpet: fix a missing check of ioremap"
    b1da7ad9ad58 net: caif: remove BUG_ON(dev == NULL) in caif_xmit
    e8dee217eca8 Revert "net/smc: fix a NULL pointer dereference"
    22049c3d40f0 net: fujitsu: fix potential null-ptr-deref
    ebb533ce35b5 Revert "net: fujitsu: fix a potential NULL pointer dereference"
    e50a9f2548a5 serial: max310x: unregister uart driver in case of failure and abort
    e5d3e4b6104c Revert "serial: max310x: pass return value of spi_register_driver"
    047aefd62220 Revert "ALSA: sb: fix a missing check of snd_ctl_add"
    bec840232fed Revert "media: usb: gspca: add a missed check for goto_low_power"
    e44a9941937d gpio: cadence: Add missing MODULE_DEVICE_TABLE
    e0c7f6cce1cf platform/x86: hp_accel: Avoid invoking _INI to speed up resume
    bd7a3b3ed9e3 perf jevents: Fix getting maximum number of fds
    77ac90814b4e i2c: sh_mobile: Use new clock calculation formulas for RZ/G2E
    04cc05e3716a i2c: i801: Don't generate an interrupt on bus reset
    45488e77e014 i2c: s3c2410: fix possible NULL pointer deref on read message after write
    e00da6510b3b net: dsa: sja1105: error out on unsupported PHY mode
    ce5355f140a7 net: dsa: fix a crash if ->get_sset_count() fails
    4fe4e1f48ba1 net: dsa: mt7530: fix VLAN traffic leaks
    15d1cc4b4b58 spi: spi-fsl-dspi: Fix a resource leak in an error handling path
    64d17ec9f1de tipc: skb_linearize the head skb when reassembling msgs
    d1f76dfadaf8 tipc: wait and exit until all work queues are done
    bdd37028a026 Revert "net:tipc: Fix a double free in tipc_sk_mcast_rcv"
    5e01d87b108c net/mlx4: Fix EEPROM dump support
    4fd3213e5354 net/mlx5e: Fix nullptr in add_vlan_push_action()
    df61870c4b1d net/mlx5e: Fix multipath lag activation
    4ce2bf20b4a6 drm/meson: fix shutdown crash when component not probed
    0787efc1a359 NFSv4: Fix v4.0/v4.1 SEEK_DATA return -ENOTSUPP when set NFS_V4_2 config
    785917316b25 NFS: Don't corrupt the value of pg_bytes_written in nfs_do_recoalesce()
    1fc5f4eb9d31 NFS: Fix an Oopsable condition in __nfs_pageio_add_request()
    e411df81cd86 NFS: fix an incorrect limit in filelayout_decode_layout()
    f76e76555682 fs/nfs: Use fatal_signal_pending instead of signal_pending
    fe201316ac36 Bluetooth: cmtp: fix file refcount when cmtp_attach_device fails
    977c34b50e6b spi: spi-geni-qcom: Fix use-after-free on unbind
    b95fb96e6339 net: usb: fix memory leak in smsc75xx_bind
    b94afae0fa7a usb: gadget: udc: renesas_usb3: Fix a race in usb3_start_pipen()
    6b5bfb8ce56d usb: dwc3: gadget: Properly track pending and queued SG
    2cd572cc45b5 thermal/drivers/intel: Initialize RW trip to THERMAL_TEMP_INVALID
    78e80f9c4e96 USB: serial: pl2303: add device id for ADLINK ND-6530 GC
    f485e4dcbe44 USB: serial: ftdi_sio: add IDs for IDS GmbH Products
    8217f3c7f6cc USB: serial: option: add Telit LE910-S1 compositions 0x7010, 0x7011
    eddf691bab0f USB: serial: ti_usb_3410_5052: add startech.com device id
    915452f40e2f serial: rp2: use 'request_firmware' instead of 'request_firmware_nowait'
    1d8071879a2b serial: sh-sci: Fix off-by-one error in FIFO threshold register setting
    3986ba109dad serial: tegra: Fix a mask operation that is always true
    2c835fede13e USB: usbfs: Don't WARN about excessively large memory allocations
    84af0c28ed1b USB: trancevibrator: fix control-request direction
    bc8b9d8c0465 serial: 8250_pci: handle FL_NOIRQ board flag
    f75a5b9907e8 serial: 8250_pci: Add support for new HPE serial device
    72fa5c26936a iio: adc: ad7793: Add missing error code in ad7793_setup()
    f49149964d24 iio: adc: ad7124: Fix potential overflow due to non sequential channel numbers
    7e5cac90430c iio: adc: ad7124: Fix missbalanced regulator enable / disable on error.
    2c9085b0fa04 iio: adc: ad7768-1: Fix too small buffer passed to iio_push_to_buffers_with_timestamp()
    bd877887e479 iio: gyro: fxas21002c: balance runtime power in error path
    657f6a33f871 staging: iio: cdc: ad7746: avoid overwrite of num_channels
    12fb557863f8 mei: request autosuspend after sending rx flow control
    eb78fa5a3815 thunderbolt: dma_port: Fix NVM read buffer bounds and offset issue
    36b5ff1db1a4 misc/uss720: fix memory leak in uss720_probe
    66a2a494ac48 serial: core: fix suspicious security_locked_down() call
    48a9b7957bb2 Documentation: seccomp: Fix user notification documentation
    c7c6a316a887 kgdb: fix gcc-11 warnings harder
    01c57232a1cb selftests/gpio: Fix build when source tree is read only
    d93532a4873d selftests/gpio: Move include of lib.mk up
    1e20cdb93889 selftests/gpio: Use TEST_GEN_PROGS_EXTENDED
    03aeefb46f07 drm/amdgpu/vcn2.5: add cancel_delayed_work_sync before power gate
    f0780e96a6e2 drm/amdgpu/vcn2.0: add cancel_delayed_work_sync before power gate
    9351c5192b88 drm/amdgpu/vcn1: add cancel_delayed_work_sync before power gate
    d65ec240b3e4 dm snapshot: properly fix a crash when an origin has no snapshots
    b06fe1124369 ath10k: Validate first subframe of A-MSDU before processing the list
    aee0121afee5 ath10k: Fix TKIP Michael MIC verification for PCIe
    124ce717f6b2 ath10k: drop MPDU which has discard flag set by firmware for SDIO
    405d08dda2f9 ath10k: drop fragments with multicast DA for SDIO
    96d4d82652fa ath10k: drop fragments with multicast DA for PCIe
    6bf449a34c0d ath10k: add CCMP PN replay protection for fragmented frames for PCIe
    cbc470aa3f93 mac80211: extend protection against mixed key and fragment cache attacks
    88664d5e5dc9 mac80211: do not accept/forward invalid EAPOL frames
    bbc06191e36e mac80211: prevent attacks on TKIP/WEP as well
    c8b3a6150dc8 mac80211: check defrag PN against current frame
    1b3774e58e47 mac80211: add fragment cache to sta_info
    fb1b24f94d1c mac80211: drop A-MSDUs on old ciphers
    fa00d4928eaf cfg80211: mitigate A-MSDU aggregation attacks
    5fe9fae1220e mac80211: properly handle A-MSDUs that start with an RFC 1042 header
    14f29a67f404 mac80211: prevent mixed key and fragment cache attacks
    b90cf214e2bb mac80211: assure all fragments are encrypted
    4302a6fdec60 net: hso: fix control-request directions
    60d171c477e9 proc: Check /proc/$pid/attr/ writes against file opener
    7f4d9d2f0be7 perf scripts python: exported-sql-viewer.py: Fix warning display
    cb08c8d591cb perf scripts python: exported-sql-viewer.py: Fix Array TypeError
    9044d06150d0 perf scripts python: exported-sql-viewer.py: Fix copy to clipboard from Top Calls by elapsed Time report
    21e2eb6a950c perf intel-pt: Fix transaction abort handling
    854216d7ec10 perf intel-pt: Fix sample instruction bytes
    044bbe8b92ab iommu/vt-d: Fix sysfs leak in alloc_iommu()
    aba3c7795f51 NFSv4: Fix a NULL pointer dereference in pnfs_mark_matching_lsegs_return()
    f2a35ade2274 cifs: set server->cipher_type to AES-128-CCM for SMB3.0
    5c81a4e24cf1 ALSA: usb-audio: scarlett2: Improve driver startup messages
    26314d278423 ALSA: usb-audio: scarlett2: Fix device hang with ehci-pci
    6fc2850259e6 ALSA: hda/realtek: Headphone volume is controlled by Front mixer

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d91ec7d1b47d026149c488cfe1fd0af831b8fad6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 3643e6af46..bad4b7fdc1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c279b45a44858da788a13f23130ed06663e77c57"
-SRCREV_meta ?= "aa019cb8e4af653d6e136f1b8720884b97ddde49"
+SRCREV_machine ?= "c538f43c5caae421d4cd56782dc8213c3ea7cbb4"
+SRCREV_meta ?= "669bba3f8ad5c588063f3a8be4fca46c309b0714"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.123"
+LINUX_VERSION ?= "5.4.124"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index cf8e81e0f3..bb4b24ac0d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.123"
+LINUX_VERSION ?= "5.4.124"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "445028ae9ec9a904122bb5c60995def98d2b1ddc"
-SRCREV_machine ?= "edc1395a32f99faaebc6b48769c4bd02a8b074be"
-SRCREV_meta ?= "aa019cb8e4af653d6e136f1b8720884b97ddde49"
+SRCREV_machine_qemuarm ?= "5c655b0a0cf0aed21db20fc2e7fdc2cd1bea7def"
+SRCREV_machine ?= "2487a0dd8891bcdb43b6ab2b46e3a41909ef7b1a"
+SRCREV_meta ?= "669bba3f8ad5c588063f3a8be4fca46c309b0714"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 7282fbcd6e..4af56daf7b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c292705386cfec860dad5e1dee74f22407fb7f94"
-SRCREV_machine_qemuarm64 ?= "edc1395a32f99faaebc6b48769c4bd02a8b074be"
-SRCREV_machine_qemumips ?= "d4c949dc0b88dba72f9f94a18fd994aa8482ff8e"
-SRCREV_machine_qemuppc ?= "edc1395a32f99faaebc6b48769c4bd02a8b074be"
-SRCREV_machine_qemuriscv64 ?= "edc1395a32f99faaebc6b48769c4bd02a8b074be"
-SRCREV_machine_qemux86 ?= "edc1395a32f99faaebc6b48769c4bd02a8b074be"
-SRCREV_machine_qemux86-64 ?= "edc1395a32f99faaebc6b48769c4bd02a8b074be"
-SRCREV_machine_qemumips64 ?= "417e8e4e101314f02439a88c78d4cf2ab98df209"
-SRCREV_machine ?= "edc1395a32f99faaebc6b48769c4bd02a8b074be"
-SRCREV_meta ?= "aa019cb8e4af653d6e136f1b8720884b97ddde49"
+SRCREV_machine_qemuarm ?= "1c6a92761a897497f1a265e41fbc5a71e77c9599"
+SRCREV_machine_qemuarm64 ?= "2487a0dd8891bcdb43b6ab2b46e3a41909ef7b1a"
+SRCREV_machine_qemumips ?= "bd70ff3bfca60803be364d3c6a45ab64da9fe1e1"
+SRCREV_machine_qemuppc ?= "2487a0dd8891bcdb43b6ab2b46e3a41909ef7b1a"
+SRCREV_machine_qemuriscv64 ?= "2487a0dd8891bcdb43b6ab2b46e3a41909ef7b1a"
+SRCREV_machine_qemux86 ?= "2487a0dd8891bcdb43b6ab2b46e3a41909ef7b1a"
+SRCREV_machine_qemux86-64 ?= "2487a0dd8891bcdb43b6ab2b46e3a41909ef7b1a"
+SRCREV_machine_qemumips64 ?= "f67e90b460cfafbb8a7a9e73c95587321f784351"
+SRCREV_machine ?= "2487a0dd8891bcdb43b6ab2b46e3a41909ef7b1a"
+SRCREV_meta ?= "669bba3f8ad5c588063f3a8be4fca46c309b0714"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.123"
+LINUX_VERSION ?= "5.4.124"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1

