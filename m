Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web09.44140.1622467012540699022
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 06:16:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MQmhtzTI;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id v18so5461500qvx.10
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 06:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tj3ddofkbetD4BvGgJoDdyjg8HveOAFaPGbhbnK+gT0=;
        b=MQmhtzTI93HkZ6afQzd063Ziq0FaYf9MvzJpLYx9Nk4tYTSNziFRTObPpfbjKdgVMW
         v6uheHA8Ka+dcrNXIDk3iSm/i+mHntU2CDQqkhF0k09+yIEebLYMFR+R1E10WQ1/+9El
         hK8smduYyNFgyWaL/08VhBooQnzPLhuO/uNroWhCovllF6Ronk6wDC1efLsJ7ECz9DVo
         8J3lIAluQK+Q2Kn2pGP7DEvXG+nXpxGpm5kGvmfAHmiiQQWYa2eqepFCH4vS6n20IOdn
         MJe7rH0hTIvgngWFvbjb+3tmHV4U3Lh68XToyQPiCydvrXtIabcWdvOCqF0VmdxkE5Ah
         lg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tj3ddofkbetD4BvGgJoDdyjg8HveOAFaPGbhbnK+gT0=;
        b=IXr+1X7LIGiU3/INXIT9heanWq/Mi9yF2HddSTeOqgacP1zHifMiwLa9KNjSCBDJ4v
         Ywtf7BxJyqvln3VqrH7ZO1xoN1sVhJ+NDfHu/idlBXqox+5M+pghyQyMEJGxc3RMH8tE
         ze/IUo/JIMPpNPO7nHDgir9eTY/cQk9oftsPfWC+qkmTdXGCbP8T9J920vLxJWkf8Z+J
         +K4xR+z9ECIlcXM2v8W8hmBKucXZiJzgtKG5B3VSeAcYS4uLd74O99lbgRrjjDbyI8SI
         9YY45RiDPnxg1Z5ppjvclMmEU64VByJigTbVrV/cvlSJimwDIaAPmYVEUJDicZOZeTbv
         9+WA==
X-Gm-Message-State: AOAM532UlEXg31MpklamFr3w0I65AKm2xZAJQt/H0CqZktd9Y71Udg9R
	th3OWx6qmzczVGbdHrD9864HHdcgQkFndklw
X-Google-Smtp-Source: ABdhPJwKUCwMJvxxBqPjJUYZVjUs6KCnBwNKca0LCxF/hujMdvUj3eXEyvJFDY04M1IpVtCNn5lOFQ==
X-Received: by 2002:a0c:eac3:: with SMTP id y3mr14558872qvp.9.1622467011566;
        Mon, 31 May 2021 06:16:51 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id u11sm3008622qkk.12.2021.05.31.06.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 06:16:51 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/5.10: update to v5.10.41
Date: Mon, 31 May 2021 09:16:45 -0400
Message-Id: <f42be2719432179a246c93c0f9f69dee007734cf.1622466879.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1622466879.git.bruce.ashfield@gmail.com>
References: <cover.1622466879.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    33069919e2dc Linux 5.10.41
    b34cb7ac32cc NFC: nci: fix memory leak in nci_allocate_device
    8d11e6ae4304 perf unwind: Set userdata for all __report_module() paths
    53eaf28c056d perf unwind: Fix separate debug info files when using elfutils' libdw's unwinder
    514883ebac77 KVM: x86: Defer vtime accounting 'til after IRQ handling
    77068304b30f context_tracking: Move guest exit vtime accounting to separate helpers
    5ae5e3f05831 context_tracking: Move guest exit context tracking to separate helpers
    27acfd11ba17 bpf: No need to simulate speculative domain for immediates
    c87ef240a8bb bpf: Fix mask direction swap upon off reg sign change
    4e2c7b297431 bpf: Wrap aux data inside bpf_sanitize_info container
    4068786a8690 Linux 5.10.40
    d8d261c7cfb3 Bluetooth: SMP: Fail if remote and local public keys are identical
    e8c34789f1b8 video: hgafb: correctly handle card detect failure during probe
    ed9fdd4c6f03 nvmet: use new ana_log_size instead the old one
    d28aa3c15736 x86/boot/compressed/64: Check SEV encryption in the 32-bit boot-path
    0296c9057ade rtc: pcf85063: fallback to parent of_node
    7b994b03f1de nvme-multipath: fix double initialization of ANA state
    e2c26ddd4e85 x86/Xen: swap NX determination and GDT setup on BSP
    d5c4605e9e1c openrisc: mm/init.c: remove unused memblock_region variable in map_ram()
    585d8425e504 drm/i915/gt: Disable HiZ Raw Stall Optimization on broken gen7
    eb46907f99d6 tty: vt: always invoke vc->vc_sw->con_resize callback
    a14ca25d4f23 vt: Fix character height handling with VT_RESIZEX
    8026eb8242bc vt_ioctl: Revert VT_RESIZEX parameter handling removal
    a3de46844f34 vgacon: Record video mode changes with VT_RESIZEX
    8e0d302e7e51 video: hgafb: fix potential NULL pointer dereference
    98404acf0a20 qlcnic: Add null check after calling netdev_alloc_skb
    865ec95a77f7 leds: lp5523: check return value of lp5xx_read and jump to cleanup code
    33a9ff900b9b ics932s401: fix broken handling of errors when word reading fails
    e81f94a71b00 net: rtlwifi: properly check for alloc_workqueue() failure
    f9f59f4ca2d8 scsi: ufs: handle cleanup correctly on devm_reset_control_get error
    0eb496c3c103 net: stmicro: handle clk_prepare() failure during init
    c89c9a291149 ethernet: sun: niu: fix missing checks of niu_pci_eeprom_read()
    17e22164d6c5 Revert "niu: fix missing checks of niu_pci_eeprom_read"
    c794f7851c5d Revert "qlcnic: Avoid potential NULL pointer dereference"
    5e4fd74089b1 Revert "rtlwifi: fix a potential NULL pointer dereference"
    951ed241e228 Revert "media: rcar_drif: fix a memory disclosure"
    566086409511 cdrom: gdrom: initialize global variable at init time
    9285808072d4 cdrom: gdrom: deallocate struct gdrom_unit fields in remove_gdrom
    3d2a4fb91122 Revert "gdrom: fix a memory leak bug"
    64ae556541a3 Revert "scsi: ufs: fix a missing check of devm_reset_control_get"
    61b9bc3091a5 Revert "ecryptfs: replace BUG_ON with error handling code"
    6003d373bf2f Revert "video: imsttfb: fix potential NULL pointer dereferences"
    4baaa4946d72 Revert "hwmon: (lm80) fix a missing check of bus read in lm80 probe"
    03c5d02c38d4 Revert "leds: lp5523: fix a missing check of return value of lp55xx_read"
    059031afcdc1 Revert "net: stmicro: fix a missing check of clk_prepare"
    d88f05cecefd Revert "video: hgafb: fix potential NULL pointer dereference"
    fae4f4debf2b kcsan: Fix debugfs initcall return type
    2a61f0ccb756 dm snapshot: fix crash with transient storage and zero chunk size
    4528c0c32308 ipc/mqueue, msg, sem: avoid relying on a stack reference past its expiry
    63a5b3844770 xen-pciback: reconfigure also from backend watch handler
    c196031f4fd9 xen-pciback: redo VF placement in the virtual topology
    d047ec8730b2 mmc: sdhci-pci-gli: increase 1.8V regulator wait
    343208ffe92f powerpc/64s/syscall: Fix ptrace syscall info with scv syscalls
    105345b909d8 powerpc/64s/syscall: Use pt_regs.trap to distinguish syscall ABI difference between sc and scv syscalls
    3708b7a9c28c drm/amdgpu: update sdma golden setting for Navi12
    e32cb1057faa drm/amdgpu: update gc golden setting for Navi12
    0c47929fd836 drm/amdgpu: disable 3DCGCG on picasso/raven1 to avoid compute hang
    93ba55c14d70 drm/amdgpu: Fix GPU TLB update error when PAGE_SIZE > AMDGPU_PAGE_SIZE
    367c90f2bc1b x86/sev-es: Forward page-faults which happen during emulation
    5af89eeb7414 x86/sev-es: Use __put_user()/__get_user() for data accesses
    be4cba71b2d0 x86/sev-es: Don't return NULL from sev_es_get_ghcb()
    e7174da8c45b x86/sev-es: Invalidate the GHCB after completing VMGEXIT
    193e02196fad x86/sev-es: Move sev_es_put_ghcb() in prep for follow on patch
    9b942cb2d92e nvme-tcp: fix possible use-after-completion
    e4be68465322 Revert "serial: mvebu-uart: Fix to avoid a potential NULL pointer dereference"
    1ba7a534a9e4 rapidio: handle create_workqueue() failure
    961ae8cbe893 Revert "rapidio: fix a NULL pointer dereference when create_workqueue() fails"
    d84b5e912212 uio_hv_generic: Fix a memory leak in error handling paths
    b044f5108e4b ALSA: hda/realtek: Add fixup for HP Spectre x360 15-df0xxx
    8add3dce391b ALSA: hda/realtek: Add fixup for HP OMEN laptop
    01dbb91d8589 ALSA: hda/realtek: Fix silent headphone output on ASUS UX430UA
    cfa55927478a ALSA: hda/realtek: Add some CLOVE SSIDs of ALC293
    f693d0e72c4d ALSA: hda/realtek: reset eapd coeff to default value for alc287
    78a37c03c65c ALSA: firewire-lib: fix check for the size of isochronous packet payload
    00e5aa3f2116 Revert "ALSA: sb8: add a check for request_region"
    42796eb7c485 ALSA: hda: fixup headset for ASUS GU502 laptop
    2cc051b6a482 ALSA: bebob/oxfw: fix Kconfig entry for Mackie d.2 Pro
    e5ffa75afb5b ALSA: usb-audio: Validate MS endpoint descriptors
    ad7f8cced378 ALSA: firewire-lib: fix calculation for size of IR context payload
    3d063d6ce1d2 ALSA: dice: fix stream format at middle sampling rate for Alesis iO 26
    f42cf1e7b86b ALSA: line6: Fix racy initialization of LINE6 MIDI
    214a9836697c ALSA: firewire-lib: fix amdtp_packet tracepoints event for packet_index field
    1e94ffd074dd ALSA: intel8x0: Don't update period unless prepared
    e227c60aa9ec ALSA: dice: fix stream format for TC Electronic Konnekt Live at high sampling transfer frequency
    1b2b4d68172b misc: eeprom: at24: check suspend status before disable regulator
    42d35af92246 cifs: fix memory leak in smb2_copychunk_range
    56001dda032f btrfs: avoid RCU stalls while running delayed iputs
    e022914f206c powerpc: Fix early setup to make early_ioremap() work
    e354e3744b0b locking/mutex: clear MUTEX_FLAGS if wait_list is empty due to signal
    5dfed1be0e9c locking/lockdep: Correct calling tracepoints
    075becedce37 perf/x86: Avoid touching LBR_TOS MSR for Arch LBR
    e207bbf555bd nvmet: seset ns->file when open fails
    6f08af55ea54 ptrace: make ptrace() fail if the tracee changed its pid unexpectedly
    eeafd6489d2c powerpc/pseries: Fix hcall tracing recursion in pv queued spinlocks
    d53738cd4855 tools/testing/selftests/exec: fix link error
    7cf4decefa05 RDMA/uverbs: Fix a NULL vs IS_ERR() bug
    c62c907ccc63 RDMA/mlx5: Fix query DCT via DEVX
    0cf036a0d325 platform/x86: dell-smbios-wmi: Fix oops on rmmod dell_smbios
    b8ff3221771a platform/x86: intel_int0002_vgpio: Only call enable_irq_wake() when using s2idle
    2d6168fa6bc6 platform/mellanox: mlxbf-tmfifo: Fix a memory barrier issue
    753927b802f6 nvme-fc: clear q_live at beginning of association teardown
    33ebdee80e40 nvme-tcp: rerun io_work if req_list is not empty
    9c980795ccd7 nvme-loop: fix memory leak in nvme_loop_create_ctrl()
    4720f29acb3f nvmet: fix memory leak in nvmet_alloc_ctrl()
    737ccd21342c nvmet: remove unused ctrl->cqs
    bd538f2f136f RDMA/core: Don't access cm_id after its destruction
    75bdfe783732 RDMA/mlx5: Recover from fatal event in dual port mode
    8170c2039cc1 scsi: qla2xxx: Fix error return code in qla82xx_write_flash_dword()
    a6362a737572 scsi: qedf: Add pointer checks in qedf_update_link_speed()
    3f04b4f87f32 scsi: ufs: core: Increase the usable queue depth
    2ee4d79c3649 RDMA/rxe: Clear all QP fields if creation failed
    66ab7fcdac34 RDMA/core: Prevent divide-by-zero error triggered by the user
    15357010e0e1 RDMA/siw: Release xarray entry
    b83b49192767 RDMA/siw: Properly check send and receive CQ pointers
    c39a190d834d tee: amdtee: unload TA only when its refcount becomes 0
    12de3ff98935 openrisc: Fix a memory leak
    4dcb3aa4a5ad firmware: arm_scpi: Prevent the ternary sign expansion bug
    b561d56bcd16 Linux 5.10.39
    090466aeb6a0 scripts: switch explicitly to Python 3
    6ae514b8a8eb tweewide: Fix most Shebang lines
    ccecbcc9c574 ipv6: remove extra dev_hold() for fallback tunnels
    019c426b5360 ip6_tunnel: sit: proper dev_{hold|put} in ndo_[un]init methods
    3c24dbd358bf sit: proper dev_{hold|put} in ndo_[un]init methods
    b18b1548cb4e ip6_gre: proper dev_{hold|put} in ndo_[un]init methods
    0473032821e6 net: stmmac: Do not enable RX FIFO overflow interrupts
    1fb05a3f1f20 lib: stackdepot: turn depot_lock spinlock to raw_spinlock
    7da9368f9151 block: reexpand iov_iter after read/write
    87f627a0280b ALSA: hda: generic: change the DAC ctl name for LO+SPK or LO+HP
    027926f4ff86 net:CXGB4: fix leak if sk_buff is not used
    9284b702c8e0 gpiolib: acpi: Add quirk to ignore EC wakeups on Dell Venue 10 Pro 5055
    1ce34fb34b99 drm/amd/display: Fix two cursor duplication when using overlay
    3851a86c3da8 nvmet: remove unsupported command noise
    86587f35cba9 net: hsr: check skb can contain struct hsr_ethhdr in fill_frame_info
    82646b1844a2 bridge: Fix possible races between assigning rx_handler_data and setting IFF_BRIDGE_PORT bit
    dcbc4e33804c amdgpu/pm: Prevent force of DCEFCLK on NAVI10 and SIENNA_CICHLID
    d47d0d1a1fb2 scsi: target: tcmu: Return from tcmu_handle_completions() if cmd_id not found
    3611ce2f23a4 ceph: don't allow access to MDS-private inodes
    db275714dd50 ceph: don't clobber i_snap_caps on non-I_NEW inode
    2783c34d5430 ceph: fix fscache invalidation
    f8adfb1d370f scsi: lpfc: Fix illegal memory access on Abort IOCBs
    0195e2813aac riscv: Workaround mcount name prior to clang-13
    52b7b9ad63da scripts/recordmcount.pl: Fix RISC-V regex for clang
    b6b7f7ed7f96 riscv: Use $(LD) instead of $(CC) to link vDSO
    6a40e3f9a803 platform/chrome: cros_ec_typec: Add DP mode check
    b01b7999f49e ARM: 9075/1: kernel: Fix interrupted SMC calls
    2f06cd6d9c6a um: Disable CONFIG_GCOV with MODULES
    91628cfd70d0 um: Mark all kernel symbols as local
    d35891cbb1d4 NFS: NFS_INO_REVAL_PAGECACHE should mark the change attribute invalid
    87264fb5abac Input: silead - add workaround for x86 BIOS-es which bring the chip up in a stuck state
    c2742ef47574 Input: elants_i2c - do not bind to i2c-hid compatible ACPI instantiated devices
    4800a98bcfe4 PCI: tegra: Fix runtime PM imbalance in pex_ep_event_pex_rst_deassert()
    dd6ba896ffa7 ACPI / hotplug / PCI: Fix reference count leak in enable_slot()
    ec324393a63c ARM: 9066/1: ftrace: pause/unpause function graph tracer in cpu_suspend()
    3029ef71ab22 dmaengine: dw-edma: Fix crash on loading/unloading driver
    13a2ca80d792 PCI: thunder: Fix compile testing
    a36703d08c83 virtio_net: Do not pull payload in skb->head
    cbb397b673bd isdn: capi: fix mismatched prototypes
    a60855366be5 cxgb4: Fix the -Wmisleading-indentation warning
    c6034b618c1a usb: sl811-hcd: improve misleading indentation
    c2e7c260371d kgdb: fix gcc-11 warning on indentation
    b6795cdc268b airo: work around stack usage warning
    80e414e7cf7d drm/i915/display: fix compiler warning about array overrun
    ee387de3cab1 x86/msr: Fix wr/rdmsr_safe_regs_on_cpu() prototypes

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 98c438e08a..11d8928ad7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0ccf0db07a7247fb5303b3291e5c024cc52e3061"
-SRCREV_meta ?= "d38abd9180148fe29fc92b8d7fa4bb14a59328eb"
+SRCREV_machine ?= "d25690cb34d3b9d67089b318c48b89163058608c"
+SRCREV_meta ?= "48a13749dcfa21864b5cdf5f02a1c210a4b6046b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.38"
+LINUX_VERSION ?= "5.10.41"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 4bace3ca82..8fe0194193 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.38"
+LINUX_VERSION ?= "5.10.41"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "0fb85b368f742ae428ecfabe7a1ca894149fdbdc"
-SRCREV_machine ?= "231125d238d5c59712afeff6524f33cad3eb7802"
-SRCREV_meta ?= "d38abd9180148fe29fc92b8d7fa4bb14a59328eb"
+SRCREV_machine_qemuarm ?= "c5b462a67540b3364a21999b601d08b837ee95a2"
+SRCREV_machine ?= "bb3f40e801fed14f9233749f7eaa27b105979059"
+SRCREV_meta ?= "48a13749dcfa21864b5cdf5f02a1c210a4b6046b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index eb9c7f59cc..24f856603c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "55f7c2088de75a4e9588d014c8c7cf961dfcc2fa"
-SRCREV_machine_qemuarm64 ?= "231125d238d5c59712afeff6524f33cad3eb7802"
-SRCREV_machine_qemumips ?= "ac525be591a408dadbd2e95ef15f7de90a2f76e3"
-SRCREV_machine_qemuppc ?= "231125d238d5c59712afeff6524f33cad3eb7802"
-SRCREV_machine_qemuriscv64 ?= "231125d238d5c59712afeff6524f33cad3eb7802"
-SRCREV_machine_qemuriscv32 ?= "231125d238d5c59712afeff6524f33cad3eb7802"
-SRCREV_machine_qemux86 ?= "231125d238d5c59712afeff6524f33cad3eb7802"
-SRCREV_machine_qemux86-64 ?= "231125d238d5c59712afeff6524f33cad3eb7802"
-SRCREV_machine_qemumips64 ?= "4f4e62712a88a2460ae132059c6b51e6ff35299e"
-SRCREV_machine ?= "231125d238d5c59712afeff6524f33cad3eb7802"
-SRCREV_meta ?= "d38abd9180148fe29fc92b8d7fa4bb14a59328eb"
+SRCREV_machine_qemuarm ?= "d1a5dc63766ef3b2dfc79ac2965af69b33203520"
+SRCREV_machine_qemuarm64 ?= "bb3f40e801fed14f9233749f7eaa27b105979059"
+SRCREV_machine_qemumips ?= "03dd9a4bb1b030a89f56712c3d724f0219fd16a3"
+SRCREV_machine_qemuppc ?= "bb3f40e801fed14f9233749f7eaa27b105979059"
+SRCREV_machine_qemuriscv64 ?= "bb3f40e801fed14f9233749f7eaa27b105979059"
+SRCREV_machine_qemuriscv32 ?= "bb3f40e801fed14f9233749f7eaa27b105979059"
+SRCREV_machine_qemux86 ?= "bb3f40e801fed14f9233749f7eaa27b105979059"
+SRCREV_machine_qemux86-64 ?= "bb3f40e801fed14f9233749f7eaa27b105979059"
+SRCREV_machine_qemumips64 ?= "9292051c510e6bf1452ead867c8f8050556cfae3"
+SRCREV_machine ?= "bb3f40e801fed14f9233749f7eaa27b105979059"
+SRCREV_meta ?= "48a13749dcfa21864b5cdf5f02a1c210a4b6046b"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.38"
+LINUX_VERSION ?= "5.10.41"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

