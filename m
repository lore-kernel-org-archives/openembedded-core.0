Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5583DC7EE2E
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 16:49:45 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.53989.1685378979237509603
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 09:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SQyAO+3t;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6237faa8677so18006526d6.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 09:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685378978; x=1687970978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J2uL8w284rbNY6WYH8UAE9cA+qRC2JlL3JC7Opdikrs=;
        b=SQyAO+3tU6Ja6yYzl7f4hqHb5zwbXTokTD27wJjwAnomNGst3zqcq/9vFl96LbTtk+
         6SUk7a/Kuwqv8O7jInfddTHB6xwjJrzOZPuj5V+CzadNC7dkkLNZC4zE2YCeWpKv/MVw
         nmOAe7HYkw5+QeHbQv16ElTJayJQKTL+KWZgylAE7kMeUgsjr8RiSzhOa1ESasuDZCPi
         rRUK5KxopBhXtLHhzdSZ9tHeB/HqmMuP60DjwvnFUWeUsHCzv37ADbgLeIts6IqYBJyO
         0Nr9Zacqkjv0JJlFBsoh1M/v07pd/v58aJU+LD///iSwPCL2jk+lCCPN/4VMeLE31B5l
         IEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685378978; x=1687970978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J2uL8w284rbNY6WYH8UAE9cA+qRC2JlL3JC7Opdikrs=;
        b=Sb00FMnGEEWfvZnnZvyfbsgIXZV5lfQZo4MTT9dxQKVhFhymRKsOFcFB6D4aQ5yD+x
         027PhRUmHExzP/aZCHRF7QRmHLyLUbG/9XtUsDlyUfA4RbiP/AvHI15pLDIyons/hM9S
         o1d5t3SPvphmnmKsPVSTWEV7tUCIaExDWFrVC89Eg5ZRwQTgEa14XEOciL/2ll0z3nlQ
         PjcHWQaHeWDw/veWxo8SSaSVYnLAngbqP6RZglEFPh2TOg1Iry3V0skOS11rSCumHWIi
         R0tRZLa8PYSlcbUvgtDjwPXPw49/LwFarGVjG19i4f2+XnjXls/3v7klLHcAicVahZ5x
         L5Pg==
X-Gm-Message-State: AC+VfDzNXQBVfUAVSs90jqSgZkPPon6T/tsuUUSpM80yBCyGcF0PNbLL
	7x5Q0Ab/FzcAoQxrOlIB9dgCbfFFp8X7Uw==
X-Google-Smtp-Source: ACHHUZ7zO+CB5e0rOcdLLB+3Dw9NaDW18OvEQgAt21jB0VzAFPj8SMMzbhN+yxEbYp411eZXeNphFw==
X-Received: by 2002:a05:6214:4107:b0:626:2870:7e0b with SMTP id kc7-20020a056214410700b0062628707e0bmr2690664qvb.57.1685378978164;
        Mon, 29 May 2023 09:49:38 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id qf2-20020a0562144b8200b0062621e3b511sm1159219qvb.74.2023.05.29.09.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 09:49:37 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [kirkstone 2/5] linux-yocto/5.10: update to v5.10.177
Date: Mon, 29 May 2023 12:49:32 -0400
Message-Id: <20230529164935.3511435-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230529164935.3511435-1-bruce.ashfield@gmail.com>
References: <20230529164935.3511435-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 16:49:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181882

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    387078f9030c Linux 5.10.177
    34a02011c5d1 hsr: ratelimit only when errors are printed
    7c414f6f06e9 gfs2: Always check inode size of inline inodes
    3392d67af0a4 ext4: fix kernel BUG in 'ext4_write_inline_data_end()'
    b4781477f397 libbpf: Fix btf_dump's packed struct determination
    7ad30ad8c684 selftests/bpf: Add few corner cases to test padding handling of btf_dump
    e5a16bcb131c libbpf: Fix BTF-to-C converter's padding logic
    b9f7422dd94a selftests/bpf: Test btf dump for struct with padding only fields
    f1c17475a9dc zonefs: Fix error message in zonefs_file_dio_append()
    b51e4422952b btrfs: scan device in non-exclusive mode
    3eeff8d26c6d s390/uaccess: add missing earlyclobber annotations to __clear_user()
    7051d51f1241 drm/amd/display: Add DSC Support for Synaptics Cascaded MST Hub
    79815326a516 drm/etnaviv: fix reference leak when mmaping imported buffer
    a484f8bec8ee rcu: Fix rcu_torture_read ftrace event
    08bfd05987df xtensa: fix KASAN report for show_stack
    8ada1b5c8b43 ALSA: hda/realtek: Add quirk for Lenovo ZhaoYang CF4620Z
    3b6992bdf09d ALSA: usb-audio: Fix regression on detection of Roland VS-100
    0044721f4f95 ALSA: hda/conexant: Partial revert of a quirk for Lenovo
    3d328a17c8cb NFSv4: Fix hangs when recovering open state after a server reboot
    80a4200d51e5 powerpc: Don't try to copy PPR for task with NULL pt_regs
    12c2612e18ca pinctrl: at91-pio4: fix domain name assignment
    25065ed83b5f pinctrl: amd: Disable and mask interrupts on resume
    fbf3fe7f7bc3 net: phy: dp83869: fix default value for tx-/rx-internal-delay
    b3d7a4478ce0 xen/netback: don't do grant copy across page boundary
    5f6347034341 btrfs: fix race between quota disable and quota assign ioctls
    ba5deb64ddde Input: goodix - add Lenovo Yoga Book X90F to nine_bytes_report DMI table
    26a32a212bc5 cifs: fix DFS traversal oops without CONFIG_CIFS_DFS_UPCALL
    63bbe24b99f9 cifs: prevent infinite recursion in CIFSGetDFSRefer()
    8b3d7ad3e8f1 Input: focaltech - use explicitly signed char type
    449a1a61f7f1 Input: alps - fix compatibility with -funsigned-char
    988061d09972 pinctrl: ocelot: Fix alt mode for ocelot
    ed3439a8c4fe net: dsa: mv88e6xxx: Enable IGMP snooping on user ports only
    8104c795517c bnxt_en: Add missing 200G link speed reporting
    62850a076353 bnxt_en: Fix typo in PCI id to device description string mapping
    f524d1e55013 i40e: fix registers dump after run ethtool adapter self test
    fa7fafedc9fd net: ipa: compute DMA pool size properly
    96e34c88000f ALSA: ymfpci: Fix BUG_ON in probe function
    688b1178c443 ALSA: ymfpci: Fix assignment in if condition
    ee17dea3072d s390/vfio-ap: fix memory leak in vfio_ap device driver
    ab2a55907823 can: bcm: bcm_tx_setup(): fix KMSAN uninit-value in vfs_write
    9b22e0cfc4d7 net: stmmac: don't reject VLANs when IFF_PROMISC is set
    f032e125149d net/net_failover: fix txq exceeding warning
    1025c471517b regulator: Handle deferred clk
    69ed49a7b881 r8169: fix RTL8168H and RTL8107E rx crc error
    3907fcb5a439 ptp_qoriq: fix memory leak in probe()
    6ff4a54c0218 scsi: megaraid_sas: Fix crash after a double completion
    059c3a7a3d6d sfc: ef10: don't overwrite offload features at NIC reset
    4a81e2da7297 mtd: rawnand: meson: invalidate cache on polling ECC bit
    47a449ec09b4 mips: bmips: BCM6358: disable RAC flush for TP1
    ac63f78d9aca ca8210: Fix unsigned mac_len comparison with zero in ca8210_skb_tx()
    8b1269b709c9 tracing: Fix wrong return in kprobe_event_gen_test.c
    038765a095fd tools/power turbostat: Fix /dev/cpu_dma_latency warnings
    5ec5680dc656 fbdev: au1200fb: Fix potential divide by zero
    ce5551db3629 fbdev: lxfb: Fix potential divide by zero
    c2be7f80562d fbdev: intelfb: Fix potential divide by zero
    78eb964805f9 fbdev: nvidia: Fix potential divide by zero
    1f2a94baee43 sched_getaffinity: don't assume 'cpumask_size()' is fully initialized
    6eaa2254cc5e fbdev: tgafb: Fix potential divide by zero
    baef27176ea5 ALSA: hda/ca0132: fixup buffer overrun at tuning_ctl_set()
    fcf80111a4f6 ALSA: asihpi: check pao in control_message()
    b94ffa287415 net: hsr: Don't log netdev_err message on unknown prp dst node
    74d6d33f3695 md: avoid signed overflow in slot_store()
    10941fd5c3e1 fsverity: don't drop pagecache at end of FS_IOC_ENABLE_VERITY
    0b9493b504fc dm crypt: avoid accessing uninitialized tasklet
    b2d19565478f bus: imx-weim: fix branch condition evaluates to a garbage value
    1635a062fa0e drm/meson: fix missing component unbind on bind errors
    794a6cea2268 drm/meson: Fix error handling when afbcd.ops->init fails
    f7385e0886cd kcsan: avoid passing -g for test
    46ae204069e7 kernel: kcsan: kcsan_test: build without structleak plugin
    a5ce0a559b66 usb: dwc3: gadget: Add 1ms delay after end transfer command without IOC
    ddb1973e6765 usb: dwc3: gadget: move cmd_endtransfer to extra function
    01e4c9c03de8 NFSD: fix use-after-free in __nfs42_ssc_open()
    34ef9cd887d5 KVM: fix memoryleak in kvm_init()
    a6d345c3a31e xfs: don't reuse busy extents on extent trim
    cb61e1e36fb3 xfs: shut down the filesystem if we screw up quota reservation
    91d7a4bd5656 ocfs2: fix data corruption after failed write
    d4a5181ba1b1 sched/fair: Sanitize vruntime of entity being migrated
    dfdcda25fb5e sched/fair: sanitize vruntime of entity being placed
    66ff37993dd7 dm crypt: add cond_resched() to dmcrypt_write()
    c68f08cc7456 dm stats: check for and propagate alloc_percpu failure
    1eaa2b7ae90c i2c: xgene-slimpro: Fix out-of-bounds bug in xgene_slimpro_i2c_xfer()
    85b637feee1e firmware: arm_scmi: Fix device node validation for mailbox transport
    f632a90f8e39 tee: amdtee: fix race condition in amdtee_open_session
    4ede0da36c2f drm/i915: Preserve crtc_state->inherited during state clearing
    d5329a06b4cb drm/i915/active: Fix missing debug object activation
    d18db946cc6a nilfs2: fix kernel-infoleak in nilfs_ioctl_wrap_copy()
    560437bba14d wifi: mac80211: fix qos on mesh interfaces
    a6adfe9bbd6a usb: ucsi: Fix NULL pointer deref in ucsi_connector_change()
    09671cfc2b22 usb: chipidea: core: fix possible concurrent when switch role
    073ce98aa3a6 usb: chipdea: core: fix return -EINVAL if request role is the same with current role
    5a36b601aff3 usb: cdns3: Fix issue with using incorrect PCI device function
    aae6d1bf4d8e dm thin: fix deadlock when swapping to thin device
    4d2626e10709 igb: revert rtnl_lock() that causes deadlock
    e66f3039c792 fsverity: Remove WQ_UNBOUND from fsverity read workqueue
    33f341c1fc60 usb: gadget: u_audio: don't let userspace block driver unbind
    1f01027c51eb usb: dwc2: fix a devres leak in hw_enable upon suspend resume
    dce128421554 scsi: core: Add BLIST_SKIP_VPD_PAGES for SKhynix H28U74301AMR
    f7a4ce351426 cifs: empty interface list when server doesn't support query interfaces
    8beb18c25bef sh: sanitize the flags on sigreturn
    87e800e3dc77 net: usb: qmi_wwan: add Telit 0x1080 composition
    27d4ce4aa3bb net: usb: cdc_mbim: avoid altsetting toggling for Telit FE990
    ddfc06179338 scsi: storvsc: Handle BlockSize change in Hyper-V VHD/VHDX file
    3e0a423a55a7 scsi: lpfc: Avoid usage of list iterator variable after loop
    f9a937f75ba2 scsi: ufs: core: Add soft dependency on governor_simpleondemand
    522314863f78 scsi: hisi_sas: Check devm_add_action() return value
    799d29a447dc scsi: target: iscsi: Fix an error message in iscsi_check_key()
    8c42442887db selftests/bpf: check that modifier resolves after pointer
    df1da53a7e98 m68k: Only force 030 bus error if PC not in exception table
    7df72bedbdd1 ca8210: fix mac_len negative array access
    3d8fafc5308f HID: cp2112: Fix driver not registering GPIO IRQ chip as threaded
    082b8240a66a riscv: Bump COMMAND_LINE_SIZE value to 1024
    2d6c2dee59a3 thunderbolt: Use const qualifier for `ring_interrupt_index`
    06e04b450bb4 thunderbolt: Use scale field when allocating USB3 bandwidth
    32fa53c27ea3 uas: Add US_FL_NO_REPORT_OPCODES for JMicron JMS583Gen 2
    231cfa78ec5b scsi: qla2xxx: Perform lockless command completion in abort path
    f73a88df19b7 hwmon (it87): Fix voltage scaling for chips with 10.9mV ADCs
    33c2fa39fb9e hwmon: fix potential sensor registration fail if of_node is missing
    f86ff88a1548 platform/chrome: cros_ec_chardev: fix kernel data leak from ioctl
    da3d3fdfb4d5 Bluetooth: btsdio: fix use after free bug in btsdio_remove due to unfinished work
    fce0e47e9ec5 Bluetooth: L2CAP: Fix responding with wrong PDU type
    77a61df0a0e6 Bluetooth: L2CAP: Fix not checking for maximum number of DCID
    65ceb170749b Bluetooth: btqcomsmd: Fix command timeout after setting BD address
    7aa3d03e1b30 net: mdio: thunder: Add missing fwnode_handle_put()
    94ef1715d263 gve: Cache link_speed value from device
    3c72445dadc3 nvme-tcp: fix nvme_tcp_term_pdu to match spec
    73db80dcdc20 net/sonic: use dma_mapping_error() for error check
    f8cec30541f5 erspan: do not use skb_mac_header() in ndo_start_xmit()
    19aa85b9df48 atm: idt77252: fix kmemleak when rmmod idt77252
    5eadc8032829 net/mlx5: E-Switch, Fix an Oops in error handling code
    265101aea4c0 net/mlx5: Read the TC mapping of all priorities on ETS query
    18cead61e437 net/mlx5: Fix steering rules cleanup
    a4bbab27c4bf bpf: Adjust insufficient default bpf_jit_limit
    a44e98abcca4 keys: Do not cache key in task struct if key is requested from kernel thread
    ec23a669deca bootconfig: Fix testcase to increase max node
    56e0bc4a72a0 net/ps3_gelic_net: Use dma_mapping_error
    3d5a97283e2a net/ps3_gelic_net: Fix RX sk_buff length
    cb5879efde4f net: qcom/emac: Fix use after free bug in emac_remove due to race condition
    d04dac7fae75 net: mdio: fix owner field for mdio buses registered using device-tree
    1b333766ea7a net: phy: Ensure state transitions are processed from phy_stop()
    bfeeb3aaad4e xirc2ps_cs: Fix use after free bug in xirc2ps_detach
    39c3b9dd481c qed/qed_sriov: guard against NULL derefs from qed_iov_get_vf_info
    33d1603a38e0 net: usb: smsc95xx: Limit packet length to skb->len
    c09cdf6eb815 scsi: scsi_dh_alua: Fix memleak for 'qdata' in alua_activate()
    a3ada13f20fd i2c: imx-lpi2c: check only for enabled interrupt flags
    bde2e73d5232 igc: fix the validation logic for taprio's gate list
    d3e4844c1829 igbvf: Regard vf reset nack as success
    fe3850c72a72 intel/igbvf: free irq on the error path in igbvf_request_msix()
    155d6d434f86 iavf: fix non-tunneled IPv6 UDP packet type and hashing
    15dcb57eba09 iavf: fix inverted Rx hash condition leading to disabled hash
    580634b03a55 xsk: Add missing overflow check in xdp_umem_reg
    7b5dffe048f9 ARM: dts: imx6sl: tolino-shine2hd: fix usbotg1 pinctrl
    35a49d27585c ARM: dts: imx6sll: e60k02: fix usbotg1 pinctrl
    75e2144291e8 power: supply: da9150: Fix use after free bug in da9150_charger_remove due to race condition
    2b346876b931 power: supply: bq24190: Fix use after free bug in bq24190_remove due to race condition
    18359b8e30c4 power: supply: bq24190_charger: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
    1fde5782f187 net: tls: fix possible race condition between do_tls_getsockopt_conf() and do_tls_setsockopt_conf()
    cfeda9432c1d drm/sun4i: fix missing component unbind on bind errors
    b5131ed83c83 serial: 8250: ASPEED_VUART: select REGMAP instead of depending on it
    5fcb12f00a05 serial: 8250: SERIAL_8250_ASPEED_VUART should depend on ARCH_ASPEED
    19a98d56dfed tty: serial: fsl_lpuart: fix race on RX DMA shutdown
    ae12308c7d55 serial: fsl_lpuart: Fix comment typo
    a43f7d0628e4 KVM: Register /dev/kvm as the _very_ last thing during initialization
    7958663668ef KVM: Pre-allocate cpumasks for kvm_make_all_cpus_request_except()
    6100066358ee KVM: Optimize kvm_make_vcpus_request_mask() a bit
    ad120bc86930 KVM: KVM: Use cpumask_available() to check for NULL cpumask when kicking vCPUs
    4cc54f6ae535 KVM: Clean up benign vcpu->cpu data races when kicking vCPUs
    8f9ae017dd35 ipmi:ssif: Add a timer between request retries
    c94de7f85d99 ipmi:ssif: resend_msg() cannot fail
    cd35cbde0078 ipmi:ssif: Increase the message retry time
    4d57c90f24e1 ipmi:ssif: make ssif_i2c_send() void
    18dd825b8651 perf: fix perf_event_context->time
    ddcf83200036 perf/core: Fix perf_output_begin parameter is incorrectly invoked in perf_event_bpf_output
    29ee1495e857 interconnect: qcom: osm-l3: fix icc_onecell_data allocation

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 474c3c6b01..e087add2bf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "03d34a4008d35075c61a6202f95cb87bd348879d"
-SRCREV_meta ?= "18265875e3652c8edf8c3d86f8ae3e0130b93968"
+SRCREV_machine ?= "f6146935c0b2cb2d342d8d188e7779c8244883a3"
+SRCREV_meta ?= "1ba4a1bc51cdb8831392fd4c4fca13e85aa6a344"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.176"
+LINUX_VERSION ?= "5.10.177"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 16533170d1..37eab2d7ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.176"
+LINUX_VERSION ?= "5.10.177"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "44b10c10eb958db18819f16cfbd7dbdd75be3abd"
-SRCREV_machine ?= "3166b27713fe990c8bd11ab0a510d7e1a386cf86"
-SRCREV_meta ?= "18265875e3652c8edf8c3d86f8ae3e0130b93968"
+SRCREV_machine:qemuarm ?= "deb2d09b4882f73a460887572816b3408845a5cf"
+SRCREV_machine ?= "63eb02cd1aa6c4f3e75ac2c69944a82979850c79"
+SRCREV_meta ?= "1ba4a1bc51cdb8831392fd4c4fca13e85aa6a344"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index a9a79ed916..ef9a581be4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f04da39302cc51ad80638a0690cee42375d208b5"
-SRCREV_machine:qemuarm64 ?= "71939600c1846b45f44348db7261be30f0aefad7"
-SRCREV_machine:qemumips ?= "1ce574832f8aa9097eb383b406f459b334ffbbb4"
-SRCREV_machine:qemuppc ?= "eba8a3dca0ffff3d5ab722cd007451a4e4a3844c"
-SRCREV_machine:qemuriscv64 ?= "f027472a5dcddfaff51c9deb6aa6e517b3f88e7f"
-SRCREV_machine:qemuriscv32 ?= "f027472a5dcddfaff51c9deb6aa6e517b3f88e7f"
-SRCREV_machine:qemux86 ?= "f027472a5dcddfaff51c9deb6aa6e517b3f88e7f"
-SRCREV_machine:qemux86-64 ?= "f027472a5dcddfaff51c9deb6aa6e517b3f88e7f"
-SRCREV_machine:qemumips64 ?= "8bd572b90c004bea71f9c9ddc15ec343d54ddacc"
-SRCREV_machine ?= "f027472a5dcddfaff51c9deb6aa6e517b3f88e7f"
-SRCREV_meta ?= "18265875e3652c8edf8c3d86f8ae3e0130b93968"
+SRCREV_machine:qemuarm ?= "98332f8182ad39dbf2a864fdb8a813f03e3c6381"
+SRCREV_machine:qemuarm64 ?= "c8dff1b7b60ce1afbd0b6d5cb25ac335594e0ddc"
+SRCREV_machine:qemumips ?= "ff6ab2848e9bb9342bb128728ac8137f12acf4ae"
+SRCREV_machine:qemuppc ?= "f77b04b2253f1f4466dd7ed67846acdf173dc014"
+SRCREV_machine:qemuriscv64 ?= "cf160f367e3ceb54cde11392a80413b152ca4e15"
+SRCREV_machine:qemuriscv32 ?= "cf160f367e3ceb54cde11392a80413b152ca4e15"
+SRCREV_machine:qemux86 ?= "cf160f367e3ceb54cde11392a80413b152ca4e15"
+SRCREV_machine:qemux86-64 ?= "cf160f367e3ceb54cde11392a80413b152ca4e15"
+SRCREV_machine:qemumips64 ?= "c1189cd9d1c5149306b2740322b849acf0349b3c"
+SRCREV_machine ?= "cf160f367e3ceb54cde11392a80413b152ca4e15"
+SRCREV_meta ?= "1ba4a1bc51cdb8831392fd4c4fca13e85aa6a344"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.176"
+LINUX_VERSION ?= "5.10.177"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


