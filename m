Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF594C3DA40
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:14 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.7288.1687919413516079580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=cv7Gfq0H;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-668711086f4so350325b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919412; x=1690511412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKb+ffrXu0qUj6pIxkWVWugxOfM9PfjJLt4G7zFDKrM=;
        b=cv7Gfq0HE2FQV7mC806MNSC2X+l/Mymlw/kY9xYtGK4KnqoBj/I9/zLO/2b//JlZGa
         QAAjM4L1Vh4GWJnkAPN7EWtjCmiPKEJtlkj4IS41E4aaLlYGUeVRWuDnvsdZWRlqc8to
         OHmqbSEoAXpAR1txwep6BsF0TIDZYSN/fzMcGfN42iYzgE841E8MJXGQfGNhi/+p4zjK
         hDEAh2pMjH6gq4Ip3x4yimKEJWmubGoJrOQxeT0SAyfVJzknojtW/3NgqZUXlU5HU7At
         NaBBIqFoj9uzRBVS82n2P5Im8jL2qE3O+yg4fn80mMFN+z884+DXMjtDyW9UDNt03NLn
         OU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919412; x=1690511412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fKb+ffrXu0qUj6pIxkWVWugxOfM9PfjJLt4G7zFDKrM=;
        b=X/VY8NQKST9+dNeHc2A2KxiB8TO8XUVqJsLYAS0gCNoV/Ir9P1lbstf9UjyCWj9m6z
         wORZata3GfhyVDJ7HR0Kspr8UsrnjDNgIJMdAiovOQ72n+DT9SwecLpRsy/wJYKKTzij
         +4hK3OzThK6YIfedFA3ESph0r8kn55vJcezBq7cPo+8DOdh33+9Oz9IO7xjP5qhxN4Yo
         fzxDOlCaRoGTlwBnFrTiGuMXEBB4vd4/F9XyUyEQSNfy8R1WiH7rwQGHYbybUEfuiCcK
         eG4ARysENm0Z+VSXP0blgonO2YEm8yKfNa/GdbAh9rmtF1ENoDkaWWjUvm/JEwUfYx87
         a5GQ==
X-Gm-Message-State: AC+VfDzzkppH3C8lBn8p+OSyRPzD9RtWTNbV3yg+ChNsC4b5BtGbmW72
	DKcc1Lc3bUg6RVtzqNPUEdoT8WhNt6Si84jEHALdNg==
X-Google-Smtp-Source: ACHHUZ7jEH1W1aDAJ97WdexKBM4wTZPf0AEK05HlwD5iYzmm2Ur9dP6BM21dZlIv94CKfkuZ5wnz7Q==
X-Received: by 2002:a05:6a00:188e:b0:668:7292:b2bc with SMTP id x14-20020a056a00188e00b006687292b2bcmr49504pfh.10.1687919412431;
        Tue, 27 Jun 2023 19:30:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.30.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:30:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/30] linux-yocto/6.1: update to v6.1.34
Date: Tue, 27 Jun 2023 16:29:27 -1000
Message-Id: <d082765fed01c0f1162f062ed360fef53a864735.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1687919241.git.steve@sakoman.com>
References: <cover.1687919241.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183520

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    ca87e77a2ef8 Linux 6.1.34
    1aaa74177f06 Revert "staging: rtl8192e: Replace macro RTL_PCI_DEVICE with PCI_DEVICE"
    a7e9c2e40708 wifi: rtw88: correct PS calculation for SUPPORTS_DYNAMIC_PS
    8fafd871558f wifi: rtw89: correct PS calculation for SUPPORTS_DYNAMIC_PS
    5b2438f0a7e5 ext4: only check dquot_initialize_needed() when debugging
    77eed67ba24e Revert "ext4: don't clear SB_RDONLY when remounting r/w until quota is re-enabled"
    543c12c2644e ksmbd: check the validation of pdu_size in ksmbd_conn_handler_loop
    8f2984233c87 ksmbd: fix out-of-bound read in parse_lease_state()
    bf12d7fb63b3 ksmbd: fix out-of-bound read in deassemble_neg_contexts()
    fb322da83ce5 vhost_vdpa: support PACKED when setting-getting vring_base
    b839b65456f5 vhost: support PACKED when setting-getting vring_base
    6c5a69c5dd53 vduse: avoid empty string for dev name
    7e48d635f274 riscv: fix kprobe __user string arg print fault issue
    14e4f37e46e6 soundwire: stream: Add missing clear of alloc_slave_rt
    e17734900a88 eeprom: at24: also select REGMAP
    67180e079b32 riscv: mm: Ensure prot of VM_WRITE and VM_EXEC must be readable
    e4b76cd7713c i2c: sprd: Delete i2c adapter in .remove's error path
    c53f2e8462f3 gpio: sim: fix memory corruption when adding named lines and unnamed hogs
    410689432880 firmware: arm_ffa: Set handle field to zero in memory descriptor
    f24cb5a04270 i2c: mv64xxx: Fix reading invalid status value in atomic mode
    8e64012c0348 arm64: dts: imx8mn-beacon: Fix SPI CS pinmux
    b64bbe8b1a45 blk-mq: fix blk_mq_hw_ctx active request accounting
    c3d87d415f7c ASoC: simple-card-utils: fix PCM constraint error check
    c0f9f799bac6 ASoC: mediatek: mt8195: fix use-after-free in driver remove path
    50f2160afbb8 ASoC: mediatek: mt8195-afe-pcm: Convert to platform remove callback returning void
    370711d7f0c1 arm64: dts: imx8-ss-dma: assign default clock rate for lpuarts
    efe115560a29 arm64: dts: imx8qm-mek: correct GPIOs for USDHC2 CD and WP signals
    5a607e53f208 arm64: dts: qcom: sc7180-lite: Fix SDRAM freq for misidentified sc7180-lite boards
    037449ce1c04 ASoC: codecs: wsa881x: do not set can_multi_write flag
    8b13854f26f2 ASoC: codecs: wsa883x: do not set can_multi_write flag
    58ab8a0ff81d ARM: dts: at91: sama7g5ek: fix debounce delay property for shdwc
    4b8ebe5393ed ARM: at91: pm: fix imbalanced reference counter for ethernet devices
    c97f30d215d8 arm64: dts: qcom: sc8280xp: Flush RSC sleep & wake votes
    df9bc25d13c1 mm: page_table_check: Ensure user pages are not slab pages
    08378f0314ce mm: page_table_check: Make it dependent on EXCLUSIVE_SYSTEM_RAM
    3901170529a7 usb: usbfs: Use consistent mmap functions
    80e29f11be69 usb: usbfs: Enforce page requirements for mmap
    42a7314f2b84 pinctrl: meson-axg: add missing GPIOA_18 gpio group
    fdeb7129298b soc: qcom: icc-bwmon: fix incorrect error code passed to dev_err_probe()
    30c26b985c3e virtio_net: use control_buf for coalesce params
    222a6bc8a7c6 rbd: get snapshot context after exclusive lock is ensured to be held
    d647ee673c4d rbd: move RBD_OBJ_FLAG_COPYUP_ENABLED flag setting
    939f00e4825d tee: amdtee: Add return_origin to 'struct tee_cmd_load_ta'
    d088bea08ac0 Bluetooth: hci_qca: fix debugfs registration
    e5ae01fd46a3 Bluetooth: fix debugfs registration
    a5490d6a742c Bluetooth: Fix use-after-free in hci_remove_ltk/hci_remove_irk
    1e1e2ee0cf7f s390/dasd: Use correct lock while counting channel queue length
    6f5c0eec89fc ceph: fix use-after-free bug for inodes when flushing capsnaps
    443cf752f73b selftests: mptcp: update userspace pm subflow tests
    8f0ba8ec18f5 selftests: mptcp: update userspace pm addr tests
    3fa051b18fc6 mptcp: update userspace pm infos
    9b7fa33fda0f mptcp: add address into userspace pm list
    d80a36ad400e mptcp: only send RM_ADDR in nl_cmd_remove
    e0b04a9f97dd can: j1939: avoid possible use-after-free when j1939_can_rx_register fails
    8a46c4a2bcd7 can: j1939: change j1939_netdev_lock type to mutex
    db15e90a8c3b can: j1939: j1939_sk_send_loop_abort(): improved error queue handling in J1939 Socket
    727964650a12 wifi: iwlwifi: mvm: Fix -Warray-bounds bug in iwl_mvm_wait_d3_notif()
    8953be60ec33 drm/amd/display: Reduce sdp bw after urgent to 90%
    8695a443ad8f drm/amd/pm: Fix power context allocation in SMU13
    8e143bae25cd drm/amdgpu: change reserved vram info print
    34419aa0b448 drm/amdgpu: fix xclk freq on CHIP_STONEY
    416ba40ff3c4 drm/amd/pm: conditionally disable pcie lane switching for some sienna_cichlid SKUs
    8d42c563e4dd drm/i915/gt: Use the correct error value when kernel_context() fails
    b40b34913280 ALSA: hda/realtek: Add quirks for Asus ROG 2024 laptops using CS35L41
    b1acff11b674 ALSA: hda/realtek: Add Lenovo P3 Tower platform
    63211350630b ALSA: hda/realtek: Add a quirk for HP Slim Desktop S01
    0df0097ea2d5 ALSA: ice1712,ice1724: fix the kcontrol->id initialization
    caad8a0a10c3 ALSA: hda/realtek: Add quirk for Clevo NS50AU
    3454490e0396 ALSA: cmipci: Fix kctl->id initialization
    c35034fd6446 ALSA: gus: Fix kctl->id initialization
    1f6c520932bc ALSA: ymfpci: Fix kctl->id initialization
    be0b9b7a6d77 ALSA: hda: Fix kctl->id initialization
    c8a46f39dd27 Input: fix open count when closing inhibited device
    f9172a0bb57d Input: psmouse - fix OOB access in Elantech protocol
    00b59734f504 Input: xpad - delete a Razer DeathAdder mouse VID/PID entry
    32c2c234bc2f batman-adv: Broken sync while rescheduling delayed work
    f9b9c8469621 bnxt_en: Implement .set_port / .unset_port UDP tunnel callbacks
    abc706231372 bnxt_en: Prevent kernel panic when receiving unexpected PHC_UPDATE event
    5ce24936d560 bnxt_en: Skip firmware fatal error recovery if chip is not accessible
    5fc86a4580da bnxt_en: Query default VLAN before VNIC setup on a VF
    53a0c6d5c929 bnxt_en: Don't issue AP reset during ethtool's reset operation
    5df74018d1e6 net: bcmgenet: Fix EEE implementation
    d4925800a49c lib: cpu_rmap: Fix potential use-after-free in irq_cpu_rmap_release()
    c5a17f3247bd drm/amdgpu: fix Null pointer dereference error in amdgpu_device_recover_vram
    dbc880567adf bpf: Add extra path pointer check to d_path helper
    06177b92902d net: sched: fix possible refcount leak in tc_chain_tmplt_add()
    e582ceda5a16 net: sched: act_police: fix sparse errors in tcf_police_dump()
    60f39768efa5 net: sched: move rtm_tca_policy declaration to include file
    76eef453a675 drm/i915/selftests: Add some missing error propagation
    4e7f1f6da79e drm/i915/selftests: Stop using kthread_stop()
    9d9a38b5639f net: sched: add rcu annotations around qdisc->qdisc_sleeping
    8a74ea37e1ab rfs: annotate lockless accesses to RFS sock flow table
    3d9eface2eee rfs: annotate lockless accesses to sk->sk_rxhash
    f8e6aa0e6056 tcp: gso: really support BIG TCP
    251b5d68ac47 ipv6: rpl: Fix Route of Death.
    65f2def20662 netfilter: nf_tables: out-of-bound check in chain blob
    fea199dbf6c1 netfilter: ipset: Add schedule point in call_ad().
    f057da51c076 netfilter: conntrack: fix NULL pointer dereference in nf_confirm_cthelper
    1f26ea49a5c0 netfilter: nft_bitwise: fix register tracking
    81e11b6c1ad0 selftests/bpf: Fix sockopt_sk selftest
    1ba03535451f selftests/bpf: Verify optval=NULL case
    0d18f8b90b8a wifi: cfg80211: fix locking in sched scan stop work
    4a64e92846fa qed/qede: Fix scheduling while atomic
    79c975514cf1 wifi: mac80211: don't translate beacon/presp addrs
    4dd40fec5bf2 wifi: mac80211: mlme: fix non-inheritence element
    8b6ab4bfba6f wifi: cfg80211: reject bad AP MLD address
    434cf4fbee4e wifi: mac80211: use correct iftype HE cap
    3e8a7573ff9f Bluetooth: L2CAP: Add missing checks for invalid DCID
    66b3f7425a9c Bluetooth: ISO: don't try to remove CIG if there are bound CIS left
    9c7e51b94709 Bluetooth: Fix l2cap_disconnect_req deadlock
    17aac1200222 Bluetooth: hci_sync: add lock to protect HCI_UNREGISTER
    5f285409c91b drm/i915: Use 18 fast wake AUX sync len
    7bf7bebdc20d drm/i915: Explain the magic numbers for AUX SYNC/precharge length
    1d37434ffc13 net/sched: fq_pie: ensure reasonable TCA_FQ_PIE_QUANTUM values
    a22c0a034630 net: enetc: correct rx_bytes statistics of XDP
    b3fc768a746b net: enetc: correct the statistics of rx bytes
    7a5cdd4bc1c3 net/smc: Avoid to access invalid RMBs' MRs in SMCRv1 ADD LINK CONT
    76e38e6e1b35 net/ipv6: fix bool/int mismatch for skip_notify_on_dev_down
    3849e7fcea20 bpf: Fix elem_size not being set for inner maps
    d7612a922b21 bpf: Fix UAF in task local storage
    9166225c3b2d net/ipv4: ping_group_range: allow GID from 2147483648 to 4294967294
    332f36a09c4c net: dsa: lan9303: allow vid != 0 in port_fdb_{add|del} methods
    8af3119388c4 neighbour: fix unaligned access to pneigh_entry
    898c9a0ee715 bpf, sockmap: Avoid potential NULL dereference in sk_psock_verdict_data_ready()
    e783f639b8fb wifi: mt76: mt7615: fix possible race in mt7615_mac_sta_poll
    84c699681a29 afs: Fix setting of mtime when creating a file/dir/symlink
    fb7058dd0249 spi: qup: Request DMA before enabling clocks
    ec2e12b14aa0 platform/surface: aggregator_tabletsw: Add support for book mode in KIP subsystem
    24845da026b8 platform/surface: aggregator: Allow completion work-items to be executed in parallel
    31c3de5f7b70 spi: mt65xx: make sure operations completed before unloading
    097acf0aa622 net: sfp: fix state loss when updating state_hw_mask
    ec3ce2c7cf8d scsi: megaraid_sas: Add flexible array member for SGLs

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c90a7f3d93b5dd980ad68d0e59540f564da57aa5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 1033d307f4..faf447dd33 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2993cbe41f0f859331c81d6ec8001b094f53cb9e"
-SRCREV_meta ?= "db25e51e2006721528f5e7bcd8f4501592bd74fe"
+SRCREV_machine ?= "aa7b426ca83f0b523a1d2cfef21dca13bd6ce6d9"
+SRCREV_meta ?= "ebdf12f7412436a72a81f748083979968097b9e6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.33"
+LINUX_VERSION ?= "6.1.34"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 2be9eb9c36..9ba8e60993 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.33"
+LINUX_VERSION ?= "6.1.34"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
-SRCREV_meta ?= "db25e51e2006721528f5e7bcd8f4501592bd74fe"
+SRCREV_machine ?= "78b6c1da5b5f0924c0c71b9f6097b17ce1ee049e"
+SRCREV_meta ?= "ebdf12f7412436a72a81f748083979968097b9e6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 3645932520..9be25291e3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "93797f49c15b6ce9656a607626437e76a3b6c6da"
-SRCREV_machine:qemuarm64 ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
-SRCREV_machine:qemuloongarch64 ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
-SRCREV_machine:qemumips ?= "1279631d08d52a5b20044404da4b01205ba4b725"
-SRCREV_machine:qemuppc ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
-SRCREV_machine:qemuriscv64 ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
-SRCREV_machine:qemuriscv32 ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
-SRCREV_machine:qemux86 ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
-SRCREV_machine:qemux86-64 ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
-SRCREV_machine:qemumips64 ?= "3b25f845f704021fbe223ef48ab22ff5fa3886b9"
-SRCREV_machine ?= "947f660bde07ee4111bc96d08b142a6ce3753d38"
-SRCREV_meta ?= "db25e51e2006721528f5e7bcd8f4501592bd74fe"
+SRCREV_machine:qemuarm ?= "61c096d5618d7e8d8612e8c38ea1a731af12f59d"
+SRCREV_machine:qemuarm64 ?= "78b6c1da5b5f0924c0c71b9f6097b17ce1ee049e"
+SRCREV_machine:qemuloongarch64 ?= "78b6c1da5b5f0924c0c71b9f6097b17ce1ee049e"
+SRCREV_machine:qemumips ?= "af474dba4331363e7b5c0e1317a985461de3650c"
+SRCREV_machine:qemuppc ?= "78b6c1da5b5f0924c0c71b9f6097b17ce1ee049e"
+SRCREV_machine:qemuriscv64 ?= "78b6c1da5b5f0924c0c71b9f6097b17ce1ee049e"
+SRCREV_machine:qemuriscv32 ?= "78b6c1da5b5f0924c0c71b9f6097b17ce1ee049e"
+SRCREV_machine:qemux86 ?= "78b6c1da5b5f0924c0c71b9f6097b17ce1ee049e"
+SRCREV_machine:qemux86-64 ?= "78b6c1da5b5f0924c0c71b9f6097b17ce1ee049e"
+SRCREV_machine:qemumips64 ?= "cceb143eb0f4ea878af749da5ddfefc6eb2761d7"
+SRCREV_machine ?= "78b6c1da5b5f0924c0c71b9f6097b17ce1ee049e"
+SRCREV_meta ?= "ebdf12f7412436a72a81f748083979968097b9e6"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "2f3918bc53fb998fdeed8683ddc61194ceb84edf"
+SRCREV_machine:class-devupstream ?= "ca87e77a2ef8b298aa9f69658d5898e72ee450fe"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.33"
+LINUX_VERSION ?= "6.1.34"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


