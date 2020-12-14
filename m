Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web11.36288.1607958575143562768
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 07:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Cx86VP3k;
 spf=pass (domain: gmail.com, ip: 209.85.222.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id 143so15802748qke.10
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 07:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LAaPSTH6lXsv1Het0vSeM9S+VT6YrHJ/YBEau/BZ/tM=;
        b=Cx86VP3kdblUM1TTDY2ah9IE/XOItJ7rUgKqRjWj//su9DK1yFmgkPli5HuwRU3jWu
         7cQxSgsje3lqCqvRi+2TiNJdpN0WPAbLYhOckN505BHiavzmrYGQjA/lIANflnmP5irW
         CJCrlmrnX7w//9R83ggRw9S/AClF5dN5KHnTda6eFrAXCzmPKQ26xGuhq1aUqmS3/o7i
         0JH0shmkHBBMjFxnH0jv7pLCCXVxz+VhyZNxIQsUqtDD6BYu9VV+gFMRAzKQPrt+GVcR
         iYFMGlPbUahOI+Ld+65NWzSzmM6xwT8qZNYpRTtTP/Yj4LJw8BlnulxL7Tlb+qoHcX+Q
         aXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LAaPSTH6lXsv1Het0vSeM9S+VT6YrHJ/YBEau/BZ/tM=;
        b=ElzDo9vC0deHkkWW0T20rK0PgXN3OAPp7rtFNz6G+l8GfbKs+iT1bFrpdTsrzt+Uoh
         MSBJCJW3Os3HWHXZVbndXT/6pldHklK8TiXzbfQ6Si11akl42j5UcXL5ge0NC+sCSAw6
         92OQ56IKFAF0+dAeR7tq32SYqbDy8ldx47MdA6SayJxF5pjv8c5U15ASKrmXXTPG7F3Z
         oweXb4wvUD0p8Q9omhhsknqLuzg4Ko8SwdTjZ1Fx1MKpGCY9IQvoiOkVmlQ0hV4F5Z22
         c/58nPGbJqCUCzAVBsQjAtNIRF24z9V3OLssJolLJNAdwAR/9AVDlBKPU50T1kmAKa8K
         IAAA==
X-Gm-Message-State: AOAM531G1vE0Ghph426ipeD8SivUJ4xMcVKBhq9wVbe+qYp3g38JQeVU
	A4s9y3vy6+OXvxoDZTglIyI=
X-Google-Smtp-Source: ABdhPJy/dYRScjR9bFBMNzeiwwuIpSA6I/5eplh21u9tk7re+0BHFqjuo6sqSNLebADzi3dKx5ySGg==
X-Received: by 2002:a37:4a09:: with SMTP id x9mr28631300qka.316.1607958573689;
        Mon, 14 Dec 2020 07:09:33 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id a194sm13565070qkc.70.2020.12.14.07.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 07:09:32 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/8] linux-yocto/5.4: update to v5.4.82
Date: Mon, 14 Dec 2020 10:09:21 -0500
Message-Id: <087233acd38b6bcefb95bc6c477e66e624ea3761.1607958349.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1607958349.git.bruce.ashfield@gmail.com>
References: <cover.1607958349.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    ec274ecd62f9 Linux 5.4.82
    4460a7c979ee RDMA/i40iw: Address an mmap handler exploit in i40iw
    07434172c58b tracing: Remove WARN_ON in start_thread()
    6ad995b851cb Input: i8042 - add ByteSpeed touchpad to noloop table
    dfe5d9a8307e Input: xpad - support Ardwiino Controllers
    c38a7023c00a ALSA: usb-audio: US16x08: fix value count for level meters
    8cd76dacd3dc net/mlx5: Fix wrong address reclaim when command interface is down
    2598dd80b801 net/mlx5: DR, Proper handling of unsupported Connect-X6DX SW steering
    8f92330b0873 net/sched: act_mpls: ensure LSE is pullable before reading it
    1086f789060a net: openvswitch: ensure LSE is pullable before reading it
    ba203b92a829 net: skbuff: ensure LSE is pullable before decrementing the MPLS ttl
    892e08e0b4f3 net: mvpp2: Fix error return code in mvpp2_open()
    7c3894f695e4 chelsio/chtls: fix a double free in chtls_setkey()
    178da08f9b5b vxlan: fix error return code in __vxlan_dev_create()
    5405a299b8c1 net: pasemi: fix error return code in pasemi_mac_open()
    dc469f423654 cxgb3: fix error return code in t3_sge_alloc_qset()
    8bfe5b73b185 net/x25: prevent a couple of overflows
    187a6daf5db4 net: ip6_gre: set dev->hard_header_len when using header_ops
    a6cd76132872 geneve: pull IP header before ECN decapsulation
    2b714b607f24 inet_ecn: Fix endianness of checksum update when setting ECT(1)
    9a3cce1ceee4 ibmvnic: Fix TX completion error handling
    40caea31dd56 ibmvnic: Ensure that SCRQ entry reads are correctly ordered
    d126c30eb30d chelsio/chtls: fix panic during unload reload chtls
    8a1bb298f75f dt-bindings: net: correct interrupt flags in examples
    af0b082e16fb ipv4: Fix tos mask in inet_rtm_getroute()
    4615228a50f9 netfilter: bridge: reset skb->pkt_type after NF_INET_POST_ROUTING traversal
    294de8933adb sched/fair: Fix unthrottle_cfs_rq() for leaf_cfs_rq list
    c4405cdf96f4 ima: extend boot_aggregate with kernel measurements
    733729d3e0e4 staging/octeon: fix up merge error
    6dd37fdc9550 bonding: wait for sysfs kobject destruction before freeing struct slave
    beead010654d usbnet: ipheth: fix connectivity with iOS 14
    f057c4d226f1 tun: honor IOCB_NOWAIT flag
    538008749df2 tcp: Set INET_ECN_xmit configuration in tcp_reinit_congestion_control
    9a62c8229cff sock: set sk_err to ee_errno on dequeue from errq
    7f0ddd41e289 rose: Fix Null pointer dereference in rose_send_frame()
    f2f25bc79782 net/tls: Protect from calling tls_dev_del for TLS RX twice
    a6300aedf862 net/tls: missing received data after fast remote close
    a15beea80e72 net/af_iucv: set correct sk_protocol for child sockets
    9414855a1305 ipv6: addrlabel: fix possible memory leak in ip6addrlbl_net_init
    99b5382bffd5 devlink: Hold rtnl lock while reading netdev attributes
    42af416d7146 Linux 5.4.81
    cd7343987376 ASoC: Intel: Skylake: Automatic DMIC format configuration according to information from NHLT
    6ebb6af62721 ASoC: Intel: Multiple I/O PCM format support for pipe
    b2b05b04d44d ASoC: Intel: Skylake: Await purge request ack on CNL
    a28144d62ddc ASoC: Intel: Allow for ROM init retry on CNL platforms
    4029a29f93ef ASoC: Intel: Skylake: Shield against no-NHLT configurations
    754df2d3349d ASoC: Intel: Skylake: Enable codec wakeup during chip init
    6de661f146a2 ASoC: Intel: Skylake: Select hda configuration permissively
    422c4938f704 ASoC: Intel: Skylake: Remove superfluous chip initialization
    23b093a2c4f9 USB: core: Fix regression in Hercules audio card
    cc54f8b8e1cd x86/resctrl: Add necessary kernfs_put() calls to prevent refcount leak
    d0c4c5a89f5b x86/resctrl: Remove superfluous kernfs_get() calls to prevent refcount leak
    e799c00a745e x86/speculation: Fix prctl() when spectre_v2_user={seccomp,prctl},ibpb
    f753e1c02a2e x86/mce: Do not overwrite no_way_out if mce_end() fails
    62405223bafd irqchip/exiu: Fix the index of fwspec for IRQ type
    f69d749d5f7f usb: gadget: Fix memleak in gadgetfs_fill_super
    cad7b76a6129 USB: quirks: Add USB_QUIRK_DISCONNECT_SUSPEND quirk for Lenovo A630Z TIO built-in usb-audio card
    c775935dfd1e usb: gadget: f_midi: Fix memleak in f_midi_alloc
    e1a2a3043cc2 USB: core: Change %pK for __user pointers to %px
    84d04d722b6a spi: bcm2835aux: Restore err assignment in bcm2835aux_spi_probe
    5849e7dc560b perf probe: Fix to die_entrypc() returns error correctly
    27193c41d0db perf stat: Use proper cpu for shadow stats
    dc4d672a3fb5 can: m_can: fix nominal bitiming tseg2 min for version >= 3.1
    1f076cc1de82 can: m_can: m_can_open(): remove IRQF_TRIGGER_FALLING from request_threaded_irq()'s flags
    dd8ab85fd88e RDMA/hns: Bugfix for memory window mtpt configuration
    e69f384e22f1 RDMA/hns: Fix retry_cnt and rnr_cnt when querying QP
    49b26b969474 platform/x86: toshiba_acpi: Fix the wrong variable assignment
    fbd3f1d6ef2f platform/x86: thinkpad_acpi: Send tablet mode switch at wakeup time
    405fd2180583 can: gs_usb: fix endianess problem with candleLight firmware
    11420c32c1b4 efi: EFI_EARLYCON should depend on EFI
    0d245cbd939a efivarfs: revert "fix memory leak in efivarfs_create()"
    abae897f283b arm64: tegra: Wrong AON HSP reg property size
    5c4c6b2be717 optee: add writeback to valid memory type
    6d371c3e70d7 ibmvnic: fix NULL pointer dereference in ibmvic_reset_crq
    382383538f68 ibmvnic: fix NULL pointer dereference in reset_sub_crq_queues
    a447dbb44d44 net: ena: set initial DMA width to avoid intel iommu issue
    7869696d6c1e nfc: s3fwrn5: use signed integer for parsing GPIO numbers
    1a831f889db3 i40e: Fix removing driver while bare-metal VFs pass traffic
    676857f78c1a IB/mthca: fix return value of error branch in mthca_init_cq()
    22f821fa5cbb powerpc/64s: Fix allnoconfig build since uaccess flush
    ae6e75b8c6d6 ibmvnic: notify peers when failover and migration happen
    7b4e9fcf5ec3 ibmvnic: fix call_netdevice_notifiers in do_reset
    993e42d0f7d6 s390/qeth: fix tear down of async TX buffers
    ef0f6e36a6d4 s390/qeth: fix af_iucv notification race
    bb6c548934c9 s390/qeth: make af_iucv TX notification call more robust
    f29dfa2bf6c7 cxgb4: fix the panic caused by non smac rewrite
    0410aeb9e04c bnxt_en: Release PCI regions when DMA mask setup fails during probe.
    db49200b1dad video: hyperv_fb: Fix the cache type when mapping the VRAM
    d1a7fb15673e bnxt_en: fix error return code in bnxt_init_board()
    22e10c6bbefc bnxt_en: fix error return code in bnxt_init_one()
    11b62fd00c62 scsi: ufs: Fix race between shutdown and runtime resume flow
    559ab6fb7b66 ARM: dts: dra76x: m_can: fix order of clocks
    1bef5f25a692 arch: pgtable: define MAX_POSSIBLE_PHYSMEM_BITS where needed
    95b1f326315b batman-adv: set .owner to THIS_MODULE
    f5672b83fc2d iwlwifi: mvm: write queue_sync_state only for sync
    f32a1065c930 phy: tegra: xusb: Fix dangling pointer on probe failure
    acea5424d9d2 ARM: OMAP2+: Manage MPU state properly for omap_enter_idle_coupled()
    6f87d79ef40d bus: ti-sysc: Fix bogus resetdone warning on enable for cpsw
    e8060ddddc9f net: dsa: mv88e6xxx: Wait for EEPROM done after HW reset
    1f5531bb9720 xtensa: uaccess: Add missing __user to strncpy_from_user() prototype
    3753a62d5760 perf/x86: fix sysfs type mismatches
    fd81f0711d9c scsi: target: iscsi: Fix cmd abort fabric stop race
    8814c070e783 scsi: libiscsi: Fix NOP race condition
    070a9a046d6d dmaengine: pl330: _prep_dma_memcpy: Fix wrong burst size
    8a2ae7fa5d5c vhost scsi: fix cmd completion race
    4940816604e3 nvme: free sq/cq dbbuf pointers when dbbuf set fails
    01968f9af006 proc: don't allow async path resolution of /proc/self components
    830f4aa73a69 HID: Add Logitech Dinovo Edge battery quirk
    4d070afa1080 HID: logitech-hidpp: Add HIDPP_CONSUMER_VENDOR_KEYS quirk for the Dinovo Edge
    204dbc26f14e x86/xen: don't unbind uninitialized lock_kicker_irq
    d6b5dc5429f1 dmaengine: xilinx_dma: use readl_poll_timeout_atomic variant
    54b01ded1e92 HID: add HID_QUIRK_INCREMENT_USAGE_ON_DUPLICATE for Gamevice devices
    cd7ea86a4a64 staging: ralink-gdma: fix kconfig dependency bug for DMA_RALINK
    b3701c29a468 HID: hid-sensor-hub: Fix issue with devices with no report ID
    8f68a28c9ecc Input: i8042 - allow insmod to succeed on devices without an i8042 controller
    dbe67dcf97cf HID: add support for Sega Saturn
    3845b2117f6d HID: cypress: Support Varmilo Keyboards' media hotkeys
    604912c2b20e HID: ite: Replace ABS_MISC 120/121 events with touchpad on/off keypresses
    8a35be6c38aa HID: uclogic: Add ID for Trust Flex Design Tablet
    733e6db9736d arm64: pgtable: Ensure dirty bit is preserved across pte_wrprotect()
    b456de294ee4 arm64: pgtable: Fix pte_accessible()
    8b4d82d8dbff trace: fix potenial dangerous pointer
    4a301b05cf61 KVM: x86: Fix split-irqchip vs interrupt injection window request
    b7d2e45cf613 KVM: x86: handle !lapic_in_kernel case in kvm_cpu_*_extint
    6276d38cce87 KVM: arm64: vgic-v3: Drop the reporting of GICR_TYPER.Last for userspace
    45b5f4b1b40b KVM: PPC: Book3S HV: XIVE: Fix possible oops when accessing ESB page
    214e6af4217a cifs: fix a memleak with modefromsid
    56f639aa0b5d smb3: Handle error case during offload read path
    afa51221b911 smb3: Avoid Mid pending list corruption
    1b63215666c0 smb3: Call cifs reconnect from demultiplex thread
    f923044a6c72 wireless: Use linux/stddef.h instead of stddef.h
    a6676b0fa09f btrfs: fix lockdep splat when reading qgroup config on mount
    6ea14731ac4c btrfs: don't access possibly stale fs_info data for printing duplicate device
    12aedea58281 btrfs: tree-checker: add missing returns after data_ref alignment checks
    0115a2613397 btrfs: tree-checker: add missing return after error in root_item
    6ec51459df71 netfilter: clear skb->next in NF_HOOK_LIST()
    ee791835b3ec ipv4: use IS_ENABLED instead of ifdef
    9d16996369fd spi: bcm2835: Fix use-after-free on unbind
    b606031bbfed spi: bcm-qspi: Fix use-after-free on unbind

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 8bc93bf438..2bd41965a6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1ab0814d41526c27888888188d884884c8b4a52d"
-SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
+SRCREV_machine ?= "65a53ac9134b9736ae67afc5fb02049f4908d8e3"
+SRCREV_meta ?= "e872ef155c596e4cc2f68405d85ab6f2b0303c28"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.80"
+LINUX_VERSION ?= "5.4.82"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 3b462d5872..67157b1685 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.80"
+LINUX_VERSION ?= "5.4.82"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "9a4d015ce467549f5f587a5001cd333ea7182aa2"
-SRCREV_machine ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
-SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
+SRCREV_machine_qemuarm ?= "0c335c490cfe932664f2e40c791efa387f769df5"
+SRCREV_machine ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
+SRCREV_meta ?= "e872ef155c596e4cc2f68405d85ab6f2b0303c28"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 456875a7b5..4d60d0a557 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "9c4e95c4439a84d2472404af630659ee3ac880e8"
-SRCREV_machine_qemuarm64 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
-SRCREV_machine_qemumips ?= "07747fd48470e60ea2323df735795d9d44b74edc"
-SRCREV_machine_qemuppc ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
-SRCREV_machine_qemuriscv64 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
-SRCREV_machine_qemux86 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
-SRCREV_machine_qemux86-64 ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
-SRCREV_machine_qemumips64 ?= "f8d0d215cf1a02a1e2915b8d57fb8f9f29e5dc49"
-SRCREV_machine ?= "6f1adec8376dc0bbf423afa02d7d9fa12b73d5b5"
-SRCREV_meta ?= "72a1fe336d7a8cead351b894c266a205f23f213c"
+SRCREV_machine_qemuarm ?= "844ffab23aca849f9f4cf89866229e079fc7aa11"
+SRCREV_machine_qemuarm64 ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
+SRCREV_machine_qemumips ?= "7937b24594ecce307971a3b2871fc1286055d0c4"
+SRCREV_machine_qemuppc ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
+SRCREV_machine_qemuriscv64 ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
+SRCREV_machine_qemux86 ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
+SRCREV_machine_qemux86-64 ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
+SRCREV_machine_qemumips64 ?= "0ba329b53891de44e4ef8d2ca8a948e1c6a5866c"
+SRCREV_machine ?= "53e9ea9bf3868442be0b1aef4e7624ec8143f10b"
+SRCREV_meta ?= "e872ef155c596e4cc2f68405d85ab6f2b0303c28"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.80"
+LINUX_VERSION ?= "5.4.82"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

