Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A49C77B60
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 15:20:07 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.104112.1679671202571459821
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 08:20:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TfE1KwA3;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id g9so1790697qvt.8
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 08:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679671201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ND15tf4UbqVnbl8W/QIJ4VHZxsUDTQW/PJfNsbB14A0=;
        b=TfE1KwA3qNBZTS+ZavrCKm/3Gxd/M81hGv/qwPH6JTsoHHMYMyO76EY8SAsMiJk2GH
         e9vV1teuqglg+aFwjwU0YDVu0cn82pNACaDVQWCavKkqgFKvK/1OMV5FP1gJeJL7kzam
         HV27ofb+h9b3Uzr9HQydf9QvNFVYEr2iHXdOapl6d62IUDiub1GIFRjwjvEQMhBZqr2v
         x/xo6Avv8FwlIx+D10u8iNwpd2HMik/6/UDMlOrSeHEsHbs+mY/HVkzJM4wACr9zuX4N
         J3phnxbtVERqoBMWXSekEiiZSRdmY23Qa5f/70OeJjbbvI0/Wm1LZ9ts5wHk/bdsfiIs
         iK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679671201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ND15tf4UbqVnbl8W/QIJ4VHZxsUDTQW/PJfNsbB14A0=;
        b=jHb+095wHjiHLHb4qR+9StZbQI85G7ncYD8myxWIE0Drf4B3JhKfB3Ugr1XlaA7u2v
         rRn90sqZFqzXKI5OpUQRYXMGsikAismvX21dBF0KcVAAi06AJZ/I1e+0lepmrEohRgwQ
         bxKjLOQ4yZJ9PhnPf/Xc4jag4aVCgA0qnJyqoHXE1cdtsn2SSuU42ZuVj0rjdQrF2SmD
         XqfwaujhnGtIBxSaK+WscXVE4gfH6kTQMsagkDMtXqHujEGYeZTQZgvKJhYvX77PNh3K
         7MoTv6co5WZAVXHT49PUv6Y0yeH+u+5SPnWFS6KAumhtzdZ0TVyKAxuYLqIQDwVyWbxd
         J9Ow==
X-Gm-Message-State: AAQBX9dwFlF+749/WUQqHfsIktBeIuGz3B3VeaRw+ZgT6qH8KghHP2vY
	3MZHMeQ0BKNyYKS1OCJJF+tqdgSPUIHldQ==
X-Google-Smtp-Source: AKy350YW0msltD3ppwOaUm01x5GZE9uMn4mLYiBsfy0b5bK6AmtcyNK0Qk1H7lFfdjUfCkie7ZU68Q==
X-Received: by 2002:a05:6214:124e:b0:5a6:3dc:a7f3 with SMTP id r14-20020a056214124e00b005a603dca7f3mr5522573qvv.15.1679671201384;
        Fri, 24 Mar 2023 08:20:01 -0700 (PDT)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id w8-20020a05620a148800b0073bb0ef3a8esm14316752qkj.21.2023.03.24.08.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 08:20:00 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [[PATCH][kirkstone] 4/7] linux-yocto/5.10: update to v5.10.168
Date: Fri, 24 Mar 2023 11:19:53 -0400
Message-Id: <20230324151956.1349749-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324151956.1349749-1-bruce.ashfield@gmail.com>
References: <20230324151956.1349749-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 15:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179056

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    707c48210a53 Linux 5.10.168
    0a626e27f984 Fix page corruption caused by racy check in __free_pages
    0ef2490a876b arm64: dts: meson-axg: Make mmc host controller interrupts level-sensitive
    5bfc8f09619a arm64: dts: meson-g12-common: Make mmc host controller interrupts level-sensitive
    809f4acb7f01 arm64: dts: meson-gx: Make mmc host controller interrupts level-sensitive
    8eee3521bca7 riscv: Fixup race condition on PG_dcache_clean in flush_icache_pte
    6ff8b4825392 ceph: flush cap releases when the session is flushed
    4f518a4a79bd usb: typec: altmodes/displayport: Fix probe pin assign check
    f25fa93e5236 usb: core: add quirk for Alcor Link AK9563 smartcard reader
    dd965ad39de4 btrfs: free device in btrfs_close_devices for a single device filesystem
    1be271c52bf3 net: USB: Fix wrong-direction WARNING in plusb.c
    2b693fe3f760 cifs: Fix use-after-free in rdata->read_into_pages()
    bbc850904457 pinctrl: intel: Restore the pins that used to be in Direct IRQ mode
    4863f46ddaf9 spi: dw: Fix wrong FIFO level setting for long xfers
    6e2a0521e4e8 pinctrl: single: fix potential NULL dereference
    61f8a493c076 pinctrl: aspeed: Fix confusing types in return value
    ef3edede7b73 ALSA: pci: lx6464es: fix a debug loop
    3914b71dad5a selftests: forwarding: lib: quote the sysctl values
    c53f34ec3fbf rds: rds_rm_zerocopy_callback() use list_first_entry()
    3eb04ef27811 net/mlx5: fw_tracer, Zero consumer index when reloading the tracer
    fac1fb80088a net/mlx5: fw_tracer, Clear load bit when freeing string DBs buffers
    703c3efa4b0b net/mlx5e: IPoIB, Show unknown speed instead of error
    896bd85688b4 net: mscc: ocelot: fix VCAP filters not matching on MAC with "protocol 802.1Q"
    1ad4112c9fcf ice: Do not use WQ_MEM_RECLAIM flag for workqueue
    34a5af788ed4 uapi: add missing ip/ipv6 header dependencies for linux/stddef.h
    4259a4082772 ionic: clean interrupt before enabling queue to avoid credit race
    07097ad30b36 net: phy: meson-gxl: use MMD access dummy stubs for GXL, internal PHY
    cafa2ad4f1d7 bonding: fix error checking in bond_debug_reregister()
    30fdf660356f xfrm: fix bug with DSCP copy to v6 from v4 tunnel
    491b7a5fc8e2 RDMA/usnic: use iommu_map_atomic() under spin_lock()
    b1afb666c329 IB/IPoIB: Fix legacy IPoIB due to wrong number of queues
    a893cc644812 xfrm/compat: prevent potential spectre v1 gadget in xfrm_xlate32_attr()
    79b595d95914 IB/hfi1: Restore allocated resources on failed copyout
    3797e94c1992 xfrm: compat: change expression for switch in xfrm_xlate64
    bc9771cd6398 can: j1939: do not wait 250 ms if the same addr was already claimed
    edaf5c718314 of/address: Return an error when no valid dma-ranges are found
    b7d5fa8052ad tracing: Fix poll() and select() do not work on per_cpu trace_pipe and trace_pipe_raw
    35452bf986ab ALSA: hda/realtek: Fix the speaker output on Samsung Galaxy Book2 Pro 360
    e1646e2be956 ALSA: emux: Avoid potential array out-of-bound in snd_emux_xg_control()
    1c6576239906 ALSA: hda/realtek: Add Positivo N14KP6-TG
    f1fd16cd9753 btrfs: zlib: zero-initialize zlib workspace
    a1406d5aa393 btrfs: limit device extents to the device size
    dbe5a11954d8 migrate: hugetlb: check for hugetlb shared PMD in node migration
    97a5104d640d mm/migration: return errno when isolate_huge_page failed
    91ad3104b211 iio:adc:twl6030: Enable measurement of VAC
    e4c3ea9b6045 bpf: Do not reject when the stack read size is different from the tracked scalar size
    34ec4c7831c4 nvmem: core: Fix a conflict between MTD and NVMEM on wp-gpios property
    b2e412879595 wifi: brcmfmac: Check the count value of channel spec to prevent out-of-bounds reads
    914e38f02a49 f2fs: fix to do sanity check on i_extra_isize in is_alive()
    3931014367ef fbdev: smscufx: fix error handling code in ufx_usb_probe
    6c8a2c67a9d6 serial: 8250_dma: Fix DMA Rx rearm race
    967e726e57c3 serial: 8250_dma: Fix DMA Rx completion race
    1fd7a6a57968 nvmem: core: fix cell removal on error
    bb875f0a34e7 nvmem: core: initialise nvmem->id early
    b591abac78e2 drm/i915: Fix potential bit_17 double-free
    5c4d4a83bf1a Squashfs: fix handling and sanity checking of xattr_ids count
    30187be29052 mm/swapfile: add cond_resched() in get_swap_pages()
    639b40007a48 fpga: stratix10-soc: Fix return value check in s10_ops_write_init()
    0139d61d28a2 x86/debug: Fix stack recursion caused by wrongly ordered DR7 accesses
    556959327b19 mm: hugetlb: proc: check for hugetlb shared PMD in /proc/PID/smaps
    50d31309c999 riscv: disable generation of unwind tables
    71a4f39f99e8 parisc: Wire up PTRACE_GETREGS/PTRACE_SETREGS for compat case
    2982b473d764 parisc: Fix return code of pdc_iodc_print()
    170e1cc3c00f nvmem: qcom-spmi-sdam: fix module autoloading
    f11330b7ba51 iio: imu: fxos8700: fix MAGN sensor scale and unit
    5b30998c7f05 iio: imu: fxos8700: remove definition FXOS8700_CTRL_ODR_MIN
    42e34a08394a iio: imu: fxos8700: fix failed initialization ODR mode assignment
    ab976ecd0430 iio: imu: fxos8700: fix incorrect ODR mode readback
    9d6502ed6314 iio: imu: fxos8700: fix swapped ACCEL and MAGN channels readback
    aff4add60998 iio: imu: fxos8700: fix map label of channel type to MAGN sensor
    9545ce720ab1 iio: imu: fxos8700: fix IMU data bits returned to user space
    6d43eddc567b iio: imu: fxos8700: fix incomplete ACCEL and MAGN channels readback
    f7d996c953bf iio: imu: fxos8700: fix ACCEL measurement range selection
    11ac43f7631e iio:adc:twl6030: Enable measurements of VUSB, VBAT and others
    5602f6a244ab iio: adc: berlin2-adc: Add missing of_node_put() in error path
    33483172b35c iio: hid: fix the retval in accel_3d_capture_sample
    55cf65461b20 efi: Accept version 2 of memory attributes table
    8fb515c8b127 ALSA: hda/realtek: Add Acer Predator PH315-54
    192fd121d04f watchdog: diag288_wdt: fix __diag288() inline assembly
    5bcdcf437d3f watchdog: diag288_wdt: do not use stack buffers for hardware data
    0c76eddc1f89 net: qrtr: free memory on error path in radix_tree_insert()
    28d190882ba5 fbcon: Check font dimension limits
    658e0d99dbfb Input: i8042 - add Clevo PCX0DX to i8042 quirk table
    a82d49360496 Input: i8042 - add TUXEDO devices to i8042 quirk tables
    04d99a0a966a Input: i8042 - merge quirk tables
    ab85074c308f Input: i8042 - move __initconst to fix code styling warning
    55515d7d8743 vc_screen: move load of struct vc_data pointer in vcs_read() to avoid UAF
    434a36ed64ac usb: gadget: f_fs: Fix unbalanced spinlock in __ffs_ep0_queue_wait
    6e5565aa0047 usb: dwc3: qcom: enable vbus override when in OTG dr-mode
    1ca8629505fd usb: dwc3: dwc3-qcom: Fix typo in the dwc3 vbus override API
    30d0e2cf9900 iio: adc: stm32-dfsdm: fill module aliases
    4bbc34401d97 net/x25: Fix to not accept on connected socket
    2b1e8e20b984 platform/x86: dell-wmi: Add a keymap for KEY_MUTE in type 0x0010 table
    ac4d9c86e9f5 i2c: rk3x: fix a bunch of kernel-doc warnings
    9758ffe1c07b scsi: iscsi_tcp: Fix UAF during login when accessing the shost ipaddress
    1b28bf868fce scsi: target: core: Fix warning on RT kernels
    4e66ba3cfb4f i2c: mxs: suppress probe-deferral error message
    d09b0bf9ffd3 qede: execute xdp_do_flush() before napi_complete_done()
    8aba483f7034 qede: add netpoll support for qede driver
    87d4ff18738f efi: fix potential NULL deref in efi_mem_reserve_persistent
    70154489f531 net: openvswitch: fix flow memory leak in ovs_flow_cmd_new
    4fb430c69878 virtio-net: Keep stop() to follow mirror sequence of open()
    812236bb6a89 selftests: net: udpgso_bench_tx: Cater for pending datagrams zerocopy benchmarking
    9e7e2887ccb8 selftests: net: udpgso_bench: Fix racing bug between the rx/tx programs
    4babbd1f594d selftests: net: udpgso_bench_rx/tx: Stop when wrong CLI args are provided
    a4a493e599e3 selftests: net: udpgso_bench_rx: Fix 'used uninitialized' compiler warning
    4d9c9627161a ata: libata: Fix sata_down_spd_limit() when no link speed is reported
    b6d44072117b can: j1939: fix errant WARN_ON_ONCE in j1939_session_deactivate
    6362b861704f igc: return an error if the mac type is unknown in igc_ptp_systim_to_hwtstamp()
    98c93a01608f net: phy: meson-gxl: Add generic dummy stubs for MMD register access
    de2785aa3448 squashfs: harden sanity check in squashfs_read_xattr_id_table
    f53c6e7e77df netfilter: br_netfilter: disable sabotage_in hook after first suppression
    dd6991251a13 netrom: Fix use-after-free caused by accept on already connected socket
    362a2f5531dc net: phy: dp83822: Fix null pointer access on DP83825/DP83826 devices
    6824169e7488 sfc: correctly advertise tunneled IPv6 segmentation
    539fc3ef5104 virtio-net: execute xdp_do_flush() before napi_complete_done()
    63d1c4edbfc1 fix "direction" argument of iov_iter_kvec()
    0c67fb777508 fix iov_iter_bvec() "direction" argument
    b5437e0ba9e7 READ is "data destination", not source...
    fefb47a8331c WRITE is "data source", not destination...
    f9815b303e61 vhost/net: Clear the pending messages when the backend is removed
    de990d157179 scsi: Revert "scsi: core: map PQ=1, PDT=other values to SCSI_SCAN_TARGET_PRESENT"
    d08a9b0ad211 drm/vc4: hdmi: make CEC adapter name unique
    8c6b46d426ed arm64: dts: imx8mm: Fix pad control for UART1_DTE_RX
    9bd6074e1872 bpf, sockmap: Check for any of tcp_bpf_prots when cloning a listener
    36dbb8daf08a bpf: Fix to preserve reg parent/live fields when copying range info
    8de8c4a25ed8 bpf: Support <8-byte scalar spill and refill
    2b557fa635e7 ALSA: hda/via: Avoid potential array out-of-bound in add_secret_dac_path()
    1b1f56cc0eaa bpf: Fix a possible task gone issue with bpf_send_signal[_thread]() helpers
    2d0f276d504f powerpc/imc-pmu: Revert nest_init_lock to being a mutex
    9ff2bebc2cea bpf: Fix incorrect state pruning for <8B spill/fill
    60c27e0e37c8 bus: sunxi-rsb: Fix error handling in sunxi_rsb_init()
    d5a2dcee53fa firewire: fix memory leak for payload of request subaction to IEC 61883-1 FCP region
    a5acb54d4066 Linux 5.10.167
    6446369fb9f0 net: fix NULL pointer in skb_segment_list
    0f9db1209f59 Bluetooth: fix null ptr deref on hci_sync_conn_complete_evt
    d744c03c04a7 ACPI: processor idle: Practically limit "Dummy wait" workaround to old Intel systems
    bd0050b7ffa8 dmaengine: imx-sdma: Fix a possible memory leak in sdma_transfer_init
    19c9a2ba4699 blk-cgroup: fix missing pd_online_fn() while activating policy
    a1c0263f1eb4 bpf: Skip task with pid=1 in send_signal_common()
    f18546863123 arm64: dts: imx8mq-thor96: fix no-mmc property for SDHCI
    a26cef004146 ARM: dts: vf610: Fix pca9548 i2c-mux node names
    67a8beb8544e ARM: dts: imx: Fix pca9547 i2c-mux node name

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 18ec2c3137..58fd484ecc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4b9f53c8732f618357c28957a9fa253633a22cbc"
-SRCREV_meta ?= "3c0a8fa9826fee4dad01f1142425d56358450baa"
+SRCREV_machine ?= "62d5b741cdf7394d82331270ca386c713c473c7b"
+SRCREV_meta ?= "73c714d1d9614f95140e23c772716b9bc9842aaf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.166"
+LINUX_VERSION ?= "5.10.168"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 1082c64062..52b42651c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.166"
+LINUX_VERSION ?= "5.10.168"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "fac8197767b17e3d19a9bd32095d95ae30ca85f6"
-SRCREV_machine ?= "54f21c5d3b57ff1c4035e269cd07c212eabdc78e"
-SRCREV_meta ?= "3c0a8fa9826fee4dad01f1142425d56358450baa"
+SRCREV_machine:qemuarm ?= "4bdfe7cb960b9f9639ceaf8b38a4a02069ce179a"
+SRCREV_machine ?= "67a4594e5db4befb4319a75c636d9ace72d9ffc2"
+SRCREV_meta ?= "73c714d1d9614f95140e23c772716b9bc9842aaf"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 6197e74583..6db6c33af0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1e771a9729b622bf80c369af9e89d8dc5ecb90cd"
-SRCREV_machine:qemuarm64 ?= "d592de06ff6e9a351af5b182b9764cb9ce45bda5"
-SRCREV_machine:qemumips ?= "ebb48115617144f5dd1df0cab3efe56389bebef5"
-SRCREV_machine:qemuppc ?= "ad5f39dbc18c165db00411436d724dc380909ce8"
-SRCREV_machine:qemuriscv64 ?= "58c04d94261d55a4bd1c9713b1a309afdd56080c"
-SRCREV_machine:qemuriscv32 ?= "58c04d94261d55a4bd1c9713b1a309afdd56080c"
-SRCREV_machine:qemux86 ?= "58c04d94261d55a4bd1c9713b1a309afdd56080c"
-SRCREV_machine:qemux86-64 ?= "58c04d94261d55a4bd1c9713b1a309afdd56080c"
-SRCREV_machine:qemumips64 ?= "250545528ee6cefb5bc92d406c92115e89589c15"
-SRCREV_machine ?= "58c04d94261d55a4bd1c9713b1a309afdd56080c"
-SRCREV_meta ?= "3c0a8fa9826fee4dad01f1142425d56358450baa"
+SRCREV_machine:qemuarm ?= "27f3c2b7708c689f300da07d7c0ff14d0b478794"
+SRCREV_machine:qemuarm64 ?= "15efbe00f3913b4a83e563c322d69f67bee533f5"
+SRCREV_machine:qemumips ?= "e0cf57b8168c2c8db7606691ccfcc3b215f9352a"
+SRCREV_machine:qemuppc ?= "46db782b8dc68f0151279b1dc0e6ac3241ea90a8"
+SRCREV_machine:qemuriscv64 ?= "5db7446df39448a190fb0e1aa5bd5d2592594fa0"
+SRCREV_machine:qemuriscv32 ?= "5db7446df39448a190fb0e1aa5bd5d2592594fa0"
+SRCREV_machine:qemux86 ?= "5db7446df39448a190fb0e1aa5bd5d2592594fa0"
+SRCREV_machine:qemux86-64 ?= "5db7446df39448a190fb0e1aa5bd5d2592594fa0"
+SRCREV_machine:qemumips64 ?= "eecdfa122352c7955d602935e0a6940074438f71"
+SRCREV_machine ?= "5db7446df39448a190fb0e1aa5bd5d2592594fa0"
+SRCREV_meta ?= "73c714d1d9614f95140e23c772716b9bc9842aaf"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.166"
+LINUX_VERSION ?= "5.10.168"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


