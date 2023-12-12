Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D88AC35274
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 14:28:02 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.2915.1702391277379615767
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Dec 2023 06:27:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=AYzomVQm;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6cef5220d07so1621371b3a.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 06:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1702391276; x=1702996076; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+nKTbQbUX0v4rylLPIbA5aUvpgabtmUbHTleebjG/w=;
        b=AYzomVQmot+3fbofyMoW2W0V9PHEgfbcxn+dAVpBnpMNTaszTKI6pOeme5g/CAX6Ub
         o/wFS6vbS46KQoVLQHHUY1WX0zf3ds+5lxT2+4n9cwvKIDYwbcpZ9P9gM1Kf2Hp36jYY
         bKmPxxDXjs6YuyNElY0mc+XWpROb9ujhpFGcQVKYmcnXv0q+FAfrRzQhKPGrNfGfX3Pe
         MFEvOmlzoa/93uJw3BDzC3+Prerx0/5PNAsdAfbS4xmiIq3B482RO9RIxh1UXq4FVZsw
         JhMrELj2HY1MolER24FxiGqDJFUkv7V7NjV+dQcTIWca7rVYFk2QArogFClZ3blfOzm6
         89Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702391276; x=1702996076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9+nKTbQbUX0v4rylLPIbA5aUvpgabtmUbHTleebjG/w=;
        b=OhAgMK//OJ8vN/8MAYqIlZha7L2hzkkOXXbn0VDwc3HO4Jw+dEdqag4k4Z1lnuSs21
         d6rG+JU0Yuob0A1MiEcJDzOldOHj2KG/rlsGuWXLkMVbublB7tCqVnMYAUNr686fzZMJ
         hmqMrAwU5C8kHlvhdoNSQtT41sQDyiG9fwrwa98RSxgd2aQqoak6vDryoIhJtjgwiWri
         ZrWglU76xXrqIc0z8LgjV1DZLo5h1PszkI3LcAP7vqfNIIZMCllT53ReFYW1hd3Kp5O7
         HB0PL7yPBy/c69wXmuK9ecS0xxQSAVBl+kFUpix7x9qePavYzjR6E5X6BC8jNnhbV6NM
         0mog==
X-Gm-Message-State: AOJu0Yy1BupBoze1sXxCxV4BGmUWuSb+1JkSok3CxDV4kXbjugniWHwP
	tuJPss8pweD6HXUog4qbc2aUFdfDR5/rR+vcEzU=
X-Google-Smtp-Source: AGHT+IGoFLNrAAClnWl/mjrrMVx3sXamcYYqF2rH5yftAFEPdbPpE/UlY6Zs/d9MDiMhtOnxSfHU+Q==
X-Received: by 2002:a05:6a20:3942:b0:190:4ca:8c05 with SMTP id r2-20020a056a20394200b0019004ca8c05mr3833978pzg.100.1702391275919;
        Tue, 12 Dec 2023 06:27:55 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id n23-20020a056a000d5700b006cbb40669b1sm8188928pfv.23.2023.12.12.06.27.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 06:27:55 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 07/29] linux-yocto/6.1: update to v6.1.59
Date: Tue, 12 Dec 2023 04:27:13 -1000
Message-Id: <9bfdc8fdd0a2901e29eedc90b425a59794f9a7a4.1702391115.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702391115.git.steve@sakoman.com>
References: <cover.1702391115.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Dec 2023 14:28:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192211

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    7d24402875c7 Linux 6.1.59
    eb26fa974c77 ALSA: hda/realtek - Fixed two speaker platform
    54357fcafa73 powerpc/64e: Fix wrong test in __ptep_test_and_clear_young()
    0afcc9d4a16d powerpc/8xx: Fix pte_access_permitted() for PAGE_NONE
    9a995e11b23f dmaengine: mediatek: Fix deadlock caused by synchronize_irq()
    01b19fc6621d dmaengine: idxd: use spin_lock_irqsave before wait_event_lock_irq
    5b784489c815 x86/alternatives: Disable KASAN in apply_alternatives()
    033c0d5101e5 usb: cdnsp: Fixes issue with dequeuing not queued requests
    49fbc18378ae usb: gadget: ncm: Handle decoding of multiple NTB's in unwrap call
    e5588fb39152 usb: gadget: udc-xilinx: replace memcpy with memcpy_toio
    71d323072af7 usb: typec: ucsi: Clear EVENT_PENDING bit if ucsi_send_command fails
    4d85f1ce6ca4 usb: typec: altmodes/displayport: Signal hpd low when exiting mode
    bc6725085925 counter: microchip-tcb-capture: Fix the use of internal GCLK logic
    0e3953b57735 counter: chrdev: fix getting array extensions
    9f6b391b0486 scsi: ufs: core: Correct clear TM error log
    97306abdeaca pinctrl: avoid unsafe code pattern in find_pinctrl()
    d67b5a2b97b6 dma-buf: add dma_fence_timestamp helper
    cb8f1dd1b73c cgroup: Remove duplicates in cgroup v1 tasks file
    57e7696b7852 usb: typec: ucsi: Use GET_CAPABILITY attributes data to set power supply scope
    062f16c4dd69 nfp: flower: avoid rmmod nfp crash issues
    1db0724a01b5 mctp: perform route lookups under a RCU read-side lock
    60c3e7a00db9 tee: amdtee: fix use-after-free vulnerability in amdtee_close_session
    862aa9818153 Input: goodix - ensure int GPIO is in input for gpio_count == 1 && gpio_int_idx == 0 case
    fbfb99ac5d4a Input: i8042 - add Fujitsu Lifebook E5411 to i8042 quirk table
    9c6a11a05bc7 Input: xpad - add PXN V900 support
    211f71c1c0a7 Input: psmouse - fix fast_reconnect function for PS/2 mode
    2efe67c581a2 Input: powermate - fix use-after-free in powermate_config_complete
    4d6c1845cba2 ceph: fix type promotion bug on 32bit systems
    9f43481c0d85 ceph: fix incorrect revoked caps assert in ceph_fill_file_size()
    086d885c200d libceph: use kernel_connect()
    8ac2689502f9 powerpc/47x: Fix 47x syscall return crash
    434e3522b9bd thunderbolt: Restart XDomain discovery handshake after failure
    5d206a77d48a thunderbolt: Check that lane 1 is in CL0 before enabling lane bonding
    0cf7ee2cc6e6 thunderbolt: Workaround an IOMMU fault on certain systems with Intel Maple Ridge
    23122e0c0e5d mcb: remove is_added flag from mcb_device struct
    125f495fa66a x86/cpu: Fix AMD erratum #1485 on Zen4-based CPUs
    386398949765 perf/x86/lbr: Filter vsyscall addresses
    55b51187d257 ksmbd: not allow to open file if delelete on close bit is set
    ac2d5e70fbb1 ACPI: EC: Add quirk for the HP Pavilion Gaming 15-dk1xxx
    7aac2f2c0036 ACPI: resource: Skip IRQ override on ASUS ExpertBook B1402CBA
    f0410917561c drm/amd/display: Don't set dpms_off for seamless boot
    a61d905a8687 drm/amdgpu: add missing NULL check
    0fb82afee55f drm/atomic-helper: relax unregistered connector check
    5bab10496324 arm64: dts: mediatek: mt8195-demo: update and reorder reserved memory regions
    f17e00fb0c9f arm64: dts: mediatek: mt8195-demo: fix the memory size to 8GB
    ff42d244b372 iio: addac: Kconfig: update ad74413r selections
    7d4ff34b6c33 iio: pressure: ms5611: ms5611_prom_is_valid false negative bug
    b166ce527540 iio: pressure: dps310: Adjust Timeout Settings
    e93a7677f0ba iio: admv1013: add mixer_vgate corner cases
    8ab33ae244a9 iio: dac: ad3552r: Correct device IDs
    a6bd5e165382 iio: adc: imx8qxp: Fix address for command buffer registers
    92426b1f5f89 iio: imu: bno055: Fix missing Kconfig dependencies
    187939163b97 iio: pressure: bmp280: Fix NULL pointer exception
    88a204cc0c3d usb: musb: Modify the "HWVers" register address
    fecb419c62c6 usb: musb: Get the musb_qh poniter after musb_giveback
    fb9895ab9533 usb: hub: Guard against accesses to uninitialized BOS descriptors
    1edbf4b2850e usb: cdns3: Modify the return value of cdns_set_active () to void when CONFIG_PM_SLEEP is disabled
    357191036889 usb: dwc3: Soft reset phy on probe for host
    ea9ae69b0e11 net: usb: dm9601: fix uninitialized variable use in dm9601_mdio_read
    c5bfe67d9fa1 usb: xhci: xhci-ring: Use sysdev for mapping bounce buffer
    f049b10affc5 dmaengine: stm32-mdma: set in_flight_bytes in case CRQA flag is set
    721dbbabf14b dmaengine: stm32-mdma: use Link Address Register to compute residue
    fe15819408bc dmaengine: stm32-dma: fix residue in case of MDMA chaining
    1e3b981a25db dmaengine: stm32-dma: fix stm32_dma_prep_slave_sg in case of MDMA chaining
    8e7dfe9c2ac8 dmaengine: stm32-mdma: abort resume if no ongoing transfer
    0796c534242d tcp: enforce receive buffer memory limits by allowing the tcp window to shrink
    55027c1d99db workqueue: Override implicit ordered attribute in workqueue_apply_unbound_cpumask()
    853dda54ba59 nfc: nci: assert requested protocol is valid
    684accd26dff pinctrl: renesas: rzn1: Enable missing PINMUX
    f05befe5c441 net/smc: Fix pos miscalculation in statistics
    e4f2611f07c8 net: nfc: fix races in nfc_llcp_sock_get() and nfc_llcp_sock_get_sn()
    ab8075d3a4a8 net/mlx5e: Again mutually exclude RX-FCS and RX-port-timestamp
    04753d5ae209 ixgbe: fix crash with empty VF macvlan list
    89be6ad344f7 net/mlx5e: macsec: use update_pn flag instead of PN comparation
    a698195f3a60 net: phy: mscc: macsec: reject PN update requests
    0d86ad068c3e net: macsec: indicate next pn update when offloading
    50bce6a051e8 net: refine debug info in skb_checksum_help()
    30ca523f287e bpf: Fix verifier log for async callback return values
    e1f1e3cc5b3c drm/vmwgfx: fix typo of sizeof argument
    5bfc5a28b53f riscv, bpf: Sign-extend return values
    72ae13954633 riscv, bpf: Factor out emit_call for kernel and bpf context
    30a835460293 xen-netback: use default TX queue size for vifs
    469bef81293f mlxsw: fix mlxsw_sp2_nve_vxlan_learning_set() return type
    217efe32a452 ieee802154: ca8210: Fix a potential UAF in ca8210_probe
    6f6fa8061f75 ravb: Fix use-after-free issue in ravb_tx_timeout_work()
    3f9295ad7f94 ravb: Fix up dma_free_coherent() call in ravb_remove()
    cfe535ee694d arm64: dts: mediatek: mt8195: Set DSU PMU status to fail
    53c6dc71bf35 can: sun4i_can: Only show Kconfig if ARCH_SUNXI is set
    789d125c0ebb can: isotp: isotp_sendmsg(): fix TX state detection and wait behavior
    881050b25b1d net: dsa: qca8k: fix potential MDIO bus conflict when accessing internal PHYs via management frames
    6f901f8448c6 phy: lynx-28g: serialize concurrent phy_set_mode_ext() calls to shared registers
    e173d9a2e548 phy: lynx-28g: lock PHY while performing CDR lock workaround
    e52c81a9e370 phy: lynx-28g: cancel the CDR check work item on the remove path
    5f9d0edff203 drm/msm/dp: Add newlines to debug printks
    61b595ede9e3 drm/msm/dpu: change _dpu_plane_calc_bw() to use u64 to avoid overflow
    3979a9e572a3 drm/msm/dsi: fix irq_of_parse_and_map() error checking
    3de09684defa drm/msm/dsi: skip the wait for video mode done if not applicable
    82cb81ea9688 drm/msm/dp: do not reinitialize phy unless retry during link training
    6c18c386fd13 pinctrl: nuvoton: wpcm450: fix out of bounds write
    37157830a97f ALSA: hda/realtek - ALC287 merge RTK codec with CS CS35L41 AMP
    171b791cc231 ALSA: hda/realtek - ALC287 I2S speaker platform support
    a8b85e47e311 ALSA: hda/realtek: Add quirk for mute LEDs on HP ENVY x360 15-eu0xxx
    e225f67d49ff ALSA: hda/realtek: Add quirk for HP Victus 16-d1xxx to enable mute LED
    8f7bb2b77bc4 ASoC: fsl_sai: Don't disable bitclock for i.MX8MP
    aacc508dd37d ASoC: fsl_sai: MCLK bind with TX/RX enable bit
    8276d65cf7ad ASoC: Use of_property_read_bool() for boolean properties
    8611606c765d ASoC: Intel: soc-acpi: Add entry for sof_es8336 in MTL match table.
    4a250b349287 ASoC: Intel: sof_sdw: add support for SKU 0B14
    307bbbbb940d ASoC: Intel: soc-acpi: Add entry for HDMI_In capture support in MTL match table
    988fba279db0 ASoC: simple-card-utils: fixup simple_util_startup() error handling
    e3353ad7db52 ASoC: SOF: amd: fix for firmware reload failure after playback
    2aa53213b661 ALSA: hda/realtek: Change model for Intel RVP board
    4cb0984557b9 ALSA: usb-audio: Fix microphone sound on Nexigo webcam.
    0f44423e355e ALSA: usb-audio: Fix microphone sound on Opencomm2 Headset
    3746b878efde KEYS: trusted: Remove redundant static calls usage
    b86ac71abbc0 irqchip: renesas-rzg2l: Fix logic to clear TINT interrupt source
    d6844187507a dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Update description for '#interrupt-cells' property
    f4eaaa30d007 arm64: dts: qcom: sm8150: extend the size of the PDC resource
    020958c946c0 net: prevent address rewrite in kernel_bind()
    8fcdf7da9d4b ata: libata-scsi: Disable scsi device manage_system_start_stop
    abc918831a08 ASoC: amd: yc: Fix non-functional mic on Lenovo 82YM
    12a820a9923c quota: Fix slow quotaoff
    fd72ac9556a4 HID: logitech-hidpp: Fix kernel crash on receiver USB disconnect
    87aa3ca49746 scsi: Do not rescan devices with a suspended queue
    342f321af833 platform/x86: hp-wmi:: Mark driver struct with __refdata to prevent section mismatch warning
    af21c9119a37 platform/x86: think-lmi: Fix reference leak
    1c8f6c7b8375 perf/arm-cmn: Fix the unhandled overflow status of counter 4 to 7
    3aade96e0c93 RDMA/cxgb4: Check skb value for failure to allocate
    f175665385fe drm/i915: Don't set PIPE_CONTROL_FLUSH_L3 for aux inval
    f2060a3a5961 mptcp: fix delegated action races
    b67d7b1bfc46 net: mana: Fix TX CQE error handling
    adc4d740ad9e Linux 6.1.58
    38fd36728f40 lib/test_meminit: fix off-by-one error in test_pages()
    ff74bdc83847 Revert "NFS: Fix error handling for O_DIRECT write scheduling"
    b0cee281c433 Revert "NFS: Fix O_DIRECT locking issues"
    ebf5841ac1ed Revert "NFS: More O_DIRECT accounting fixes for error paths"
    506cf335d95a Revert "NFS: Use the correct commit info in nfs_join_page_group()"
    e8db8b55815d Revert "NFS: More fixes for nfs_direct_write_reschedule_io()"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dfe38212221373737ac8a8a243976bd627524eea)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 0272a8a59e..388b3bc9aa 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "a3ae026c0673c043e1fd3374e488a78b29249534"
-SRCREV_meta ?= "8aa5efbc5e5361efc8b11c5aec9b967085613a0b"
+SRCREV_machine ?= "a2e879055edc5c20cb585075883a1f14f843236a"
+SRCREV_meta ?= "a7bfe6ed5d665b094b3e2d30c4cd94dece2c75f3"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.57"
+LINUX_VERSION ?= "6.1.59"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index b05f3107af..3c795ffd7a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.57"
+LINUX_VERSION ?= "6.1.59"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "8a449d3428e673be0bdb504dadb666b4ad7208e3"
-SRCREV_meta ?= "8aa5efbc5e5361efc8b11c5aec9b967085613a0b"
+SRCREV_machine ?= "01744abc399e713f4e64b19d6a7eb6d0cd867667"
+SRCREV_meta ?= "a7bfe6ed5d665b094b3e2d30c4cd94dece2c75f3"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 062fde84a4..faf7b24361 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "0ef61a389975a4019142c5f1e6608e6cc0a0df29"
-SRCREV_machine:qemuarm64 ?= "8a449d3428e673be0bdb504dadb666b4ad7208e3"
-SRCREV_machine:qemuloongarch64 ?= "8a449d3428e673be0bdb504dadb666b4ad7208e3"
-SRCREV_machine:qemumips ?= "d15ee28355bed16d59dd7d56259d2132e5c1c4ad"
-SRCREV_machine:qemuppc ?= "8a449d3428e673be0bdb504dadb666b4ad7208e3"
-SRCREV_machine:qemuriscv64 ?= "8a449d3428e673be0bdb504dadb666b4ad7208e3"
-SRCREV_machine:qemuriscv32 ?= "8a449d3428e673be0bdb504dadb666b4ad7208e3"
-SRCREV_machine:qemux86 ?= "8a449d3428e673be0bdb504dadb666b4ad7208e3"
-SRCREV_machine:qemux86-64 ?= "8a449d3428e673be0bdb504dadb666b4ad7208e3"
-SRCREV_machine:qemumips64 ?= "e740b68e38e55ca342ab3b70fa2f965c5a86758b"
-SRCREV_machine ?= "8a449d3428e673be0bdb504dadb666b4ad7208e3"
-SRCREV_meta ?= "8aa5efbc5e5361efc8b11c5aec9b967085613a0b"
+SRCREV_machine:qemuarm ?= "0dc67474b3a4cff025b88860144d744ddc84c42f"
+SRCREV_machine:qemuarm64 ?= "01744abc399e713f4e64b19d6a7eb6d0cd867667"
+SRCREV_machine:qemuloongarch64 ?= "01744abc399e713f4e64b19d6a7eb6d0cd867667"
+SRCREV_machine:qemumips ?= "bbebdd05a604e925644c544881a2c6254fe914dd"
+SRCREV_machine:qemuppc ?= "01744abc399e713f4e64b19d6a7eb6d0cd867667"
+SRCREV_machine:qemuriscv64 ?= "01744abc399e713f4e64b19d6a7eb6d0cd867667"
+SRCREV_machine:qemuriscv32 ?= "01744abc399e713f4e64b19d6a7eb6d0cd867667"
+SRCREV_machine:qemux86 ?= "01744abc399e713f4e64b19d6a7eb6d0cd867667"
+SRCREV_machine:qemux86-64 ?= "01744abc399e713f4e64b19d6a7eb6d0cd867667"
+SRCREV_machine:qemumips64 ?= "5df71878658d6ba9b9e61d7bc2a67cd57c2022f1"
+SRCREV_machine ?= "01744abc399e713f4e64b19d6a7eb6d0cd867667"
+SRCREV_meta ?= "a7bfe6ed5d665b094b3e2d30c4cd94dece2c75f3"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "082280fe94a09462c727fb6e7b0c982efb36dede"
+SRCREV_machine:class-devupstream ?= "7d24402875c75ca6e43aa27ae3ce2042bde259a4"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.57"
+LINUX_VERSION ?= "6.1.59"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


