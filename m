Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.2317.1591056810447516038
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 17:13:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=ICtBFjbb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id m7so595245plt.5
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 17:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=SWM0KJIy2LnUziQ4stzMrANu7G2h5HKqzbdsT/M095c=;
        b=ICtBFjbbZGKY+U9viGHOZ3WnBQvuFzhg5YSmeGgzJCmr/LpdlRqrPU2pcCS5G4mNW/
         b+wUnsxh7S/fK+RPK7V/zCwOyPamofguB8eaBgiKHh4OxfeSlxwUPU7V5RPVd5OqT57M
         6kXWoBsqHlB2y3EGZgocfnfXVp/JaJjRv/uYvv1jmYVeZN3fg677bTpakB7SpABgmdRq
         bK50n2K8giDkjmHv6jmqiLPQRCnnyE5JVPr25ZjZ2ne/LKhalYYx5yMJRfZ+Fb1ofgFY
         7cn6KJmaZwl0DPDAhzrXGexLTXaT1xxlTKbZtIDvEmeal6z39gxTLg0snzG5G1xoWAPw
         ct7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=SWM0KJIy2LnUziQ4stzMrANu7G2h5HKqzbdsT/M095c=;
        b=FBQRW+yt9PJMUrDSa9AimXbjHB3vqPALVH/R60/moS2JhX3sr5CGkI/m6QZnwCTPHl
         mwjI0X+hQJq05y+22xr60zZZyHR0TRatPsM6TCiw8mFmM0iIeN+Z5qeU1UD+1hooMPyV
         pY7/FQxKElmC2Azhfk1kLl/l7O+NfBLiRTSjhQaB1BFR1DMWXYGtHbVn4IGew5B8yCbH
         9c/3LefHisJsrUydnZOmuxWv2aoD+h13MYzEoPZwXqAk2Ghkib4+/Nspke/mwfO4Dpcq
         r4agXM5o9N4rBwt+yKBSrhXvQ7lKNtpELwGb5bsXm1f7z5EZ6b6latwZWkv6TslFiwfq
         ClJw==
X-Gm-Message-State: AOAM532FvGRz2o8g8MNTmM6J/AQ2GZ2pX22wy2EwkWdJ0e2O2WYYvjWi
	WDjJTZkcCJbdzHpN1BhKG2i2T6QWRoI=
X-Google-Smtp-Source: ABdhPJxXIHiit665b7B24UcC2q28FslxeWJJN2jIi9mDqf0jRucjKAlBcq8MGHHWJxxLgWePK5vxqQ==
X-Received: by 2002:a17:90b:4d10:: with SMTP id mw16mr2132613pjb.143.1591056809166;
        Mon, 01 Jun 2020 17:13:29 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c195sm442699pfc.203.2020.06.01.17.13.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 17:13:28 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 8/8] linux-yocto/5.4: update to v5.4.43
Date: Mon,  1 Jun 2020 14:12:46 -1000
Message-Id: <ef5af31f406076107402694f5d6afb27b240eba6.1591056239.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591056239.git.steve@sakoman.com>
References: <cover.1591056239.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    e0d81ce76004 Linux 5.4.43
    b5100186021a sched/fair: Fix enqueue_task_fair() warning some more
    8b13f5657fa8 sched/fair: Fix reordering of enqueue/dequeue_task_fair()
    a2ad232aa6a9 sched/fair: Reorder enqueue/dequeue_task_fair path
    f4520daa3c5a tpm: check event log version before reading final events
    68b7b8183c12 rxrpc: Fix ack discard
    283eb0016f97 rxrpc: Trace discarded ACKs
    f2da8c0dfe81 iio: adc: stm32-dfsdm: fix device used to request dma
    7b5af65ca246 iio: adc: stm32-dfsdm: Use dma_request_chan() instead dma_request_slave_channel()
    692001a867b6 iio: adc: stm32-adc: fix device used to request dma
    8e8836b2b782 iio: adc: stm32-adc: Use dma_request_chan() instead dma_request_slave_channel()
    1084eee4dc5d x86/unwind/orc: Fix unwind_get_return_address_ptr() for inactive tasks
    860fe59783a9 flow_dissector: Drop BPF flow dissector prog ref on netns cleanup
    bd6f0c799f4d s390/kexec_file: fix initrd location for kdump kernel
    834d24ec3a0a rxrpc: Fix a memory leak in rxkad_verify_response()
    23ae6e3e8aeb rxrpc: Fix the excessive initial retransmission timeout
    c2a26769b43e kasan: disable branch tracing for core runtime
    86217fecc4b7 rapidio: fix an error in get_user_pages_fast() error handling
    689dacb2b09d device-dax: don't leak kernel memory to user space after unloading kmem
    9e451933bba9 s390/kaslr: add support for R_390_JMP_SLOT relocation type
    72f3241508ac s390/pci: Fix s390_mmio_read/write with MIO
    9c84884cd5dc ipack: tpci200: fix error return code in tpci200_register()
    46f47dda27bc mei: release me_cl object reference
    f505a3e24c6a tty: serial: add missing spin_lock_init for SiFive serial console
    a5b4b3f97de7 misc: rtsx: Add short delay after exit from ASPM
    e64b205035fb iio: adc: ti-ads8344: Fix channel selection
    9af65dc54b9b iio: dac: vf610: Fix an error handling path in 'vf610_dac_probe()'
    d54e5a4ff04c iio: sca3000: Remove an erroneous 'get_device()'
    56cff2ac7c9d staging: greybus: Fix uninitialized scalar variable
    a41e02cb4232 staging: kpc2000: fix error return code in kp2000_pcie_probe()
    dee81110a488 staging: iio: ad2s1210: Fix SPI reading
    76296dc723ef media: fdp1: Fix R-Car M3-N naming in debug message
    4adb7a2b3161 Revert "gfs2: Don't demote a glock until its revokes are written"
    bb6524537dc2 kbuild: Remove debug info from kallsyms linking
    ee71c590dd8d bpf: Avoid setting bpf insns pages read-only when prog is jited
    4c732e81bd4d powerpc/64s: Disable STRICT_KERNEL_RWX
    b67da9dbdb89 powerpc: Remove STRICT_KERNEL_RWX incompatibility with RELOCATABLE
    9bcfbd8ba2b5 drm/i915: Propagate error from completed fences
    5e171483e947 drm/i915/gvt: Init DPLL/DDI vreg for virtual display instead of inheritance.
    0e1d5f67253e vsprintf: don't obfuscate NULL and error pointers
    4b1b34621998 dmaengine: owl: Use correct lock in owl_dma_get_pchan()
    0fcbe108b01a dmaengine: dmatest: Restore default for channel
    57c32a52c3fe drm/etnaviv: Fix a leak in submit_pin_objects()
    432b103596bd dmaengine: tegra210-adma: Fix an error handling path in 'tegra_adma_probe()'
    870a45e0b507 apparmor: Fix aa_label refcnt leak in policy_update
    054934aa9faa apparmor: fix potential label refcnt leak in aa_change_profile
    97d817b9ef13 apparmor: Fix use-after-free in aa_audit_rule_init
    3b1e38dfbc9f drm/etnaviv: fix perfmon domain interation
    53683907ef68 arm64: Fix PTRACE_SYSEMU semantics
    96e56055a2f0 scsi: target: Put lun_ref at end of tmr processing
    818657105a0b scsi: qla2xxx: Do not log message when reading port speed via sysfs
    d54c5eff8795 ALSA: hda/realtek - Add more fixup entries for Clevo machines
    80f5822c2bf3 ALSA: hda/realtek - Fix silent output on Gigabyte X570 Aorus Xtreme
    1b17a0f98ad0 ALSA: pcm: fix incorrect hw_base increase
    a44cb2581718 ALSA: iec1712: Initialize STDSP24 properly when using the model=staudio option
    99e392a4979b KVM: x86: Fix pkru save/restore when guest CR4.PKE=0, move it to x86.c
    1c3d707d7d12 ALSA: hda/realtek: Enable headset mic of ASUS UX581LV with ALC295
    26a3a3053332 ALSA: hda/realtek - Enable headset mic of ASUS UX550GE with ALC295
    c5742497dcd2 ALSA: hda/realtek - Enable headset mic of ASUS GL503VM with ALC295
    2523e9010d2b ALSA: hda/realtek: Add quirk for Samsung Notebook
    6cc4dd44e207 ALSA: hda/realtek - Add HP new mute led supported for ALC236
    0d189b31c4d7 ALSA: hda/realtek - Add supported new mute Led for HP
    69d5dc286d05 ALSA: hda: Manage concurrent reg access more properly
    1efaaf74528c ALSA: hda: patch_realtek: fix empty macro usage in if block
    749e58bd2b09 ALSA: hda - constify and cleanup static NodeID tables
    02ebbd1da394 scripts/gdb: repair rb_first() and rb_last()
    9eff404a4382 ARM: futex: Address build warning
    67a5c3104d12 KVM: selftests: Fix build for evmcs.h
    4f48af814798 drm/amd/display: Prevent dpcd reads with passive dongles
    e0bb3075f91b iommu/amd: Call domain_flush_complete() in update_domain()
    e1efb9893bdd platform/x86: asus-nb-wmi: Do not load on Asus T100TA and T200TA
    c8d323578e36 USB: core: Fix misleading driver bug report
    42b32a43529e stmmac: fix pointer check after utilization in stmmac_interrupt
    b68d27c5fffd ceph: fix double unlock in handle_cap_export()
    df0df8ee2ac7 HID: quirks: Add HID_QUIRK_NO_INIT_REPORTS quirk for Dell K12A keyboard-dock
    8a5de4a391e4 gtp: set NLM_F_MULTI flag in gtp_genl_dump_pdp()
    7932168ec08e x86/apic: Move TSC deadline timer debug printk
    1ae9f1a62a50 ftrace/selftest: make unresolved cases cause failure if --fail-unresolved set
    2eac9d3dc23f ibmvnic: Skip fatal error reset after passive init
    f82a3013226e x86/mm/cpa: Flush direct map alias during cpa
    632db044ab99 HID: i2c-hid: reset Synaptics SYNA2393 on resume
    acd3efa17d96 scsi: ibmvscsi: Fix WARN_ON during event pool release
    6ef21295dc20 net/ena: Fix build warning in ena_xdp_set()
    d0db69f9d132 component: Silence bind error on -EPROBE_DEFER
    7a5f60dc3a67 aquantia: Fix the media type of AQC100 ethernet controller in the driver
    445437b417b6 vhost/vsock: fix packet delivery order to monitoring devices
    dcec6678c3b1 configfs: fix config_item refcnt leak in configfs_rmdir()
    2b52a61adb38 scsi: qla2xxx: Delete all sessions before unregister local nvme port
    d2430cb7f2d4 scsi: qla2xxx: Fix hang when issuing nvme disconnect-all in NPIV
    7b481b802a8f HID: alps: ALPS_1657 is too specific; use U1_UNICORN_LEGACY instead
    a08626f6e982 HID: alps: Add AUI1657 device ID
    68988c00b153 HID: multitouch: add eGalaxTouch P80H84 support
    cc6428803d22 gcc-common.h: Update for GCC 10
    3c140d22e3c2 net: drop_monitor: use IS_REACHABLE() to guard net_dm_hw_report()
    87863a7426b2 kbuild: avoid concurrency issue in parallel building dtbs and dtbs_check
    44fd02a3d719 mtd: Fix mtd not registered due to nvmem name collision
    496c7c61bd64 afs: Don't unlock fetched data pages until the op completes successfully
    17c9595cca71 ubi: Fix seq_file usage in detailed_erase_block_info debugfs file
    274cd3c7b5d3 i2c: mux: demux-pinctrl: Fix an error handling path in 'i2c_demux_pinctrl_probe()'
    dd540f2d7c2d evm: Fix a small race in init_desc()
    f96ab0d1f3ec iommu/amd: Fix over-read of ACPI UID from IVRS table
    33769c19feba i2c: fix missing pm_runtime_put_sync in i2c_device_probe
    9f885f17501d ubifs: remove broken lazytime support
    ac6f94d3be65 fix multiplication overflow in copy_fdtable()
    725b0bb0f94d mtd: spinand: Propagate ECC information to the MTD structure
    e3637eb6a351 ACPI: EC: PM: Avoid flushing EC work when EC GPE is inactive
    3be8ece11440 ubifs: fix wrong use of crypto_shash_descsize()
    48bbd44f5fa9 ima: Fix return value of ima_write_policy()
    1066327bf936 evm: Check also if *tfm is an error pointer in init_desc()
    4aedc534b608 ima: Set file->f_mode instead of file->f_flags in ima_calc_file_hash()
    ac46cea606d5 KVM: SVM: Fix potential memory leak in svm_cpu_init()
    1bed86cfe5cb i2c: dev: Fix the race between the release of i2c_dev and cdev

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9cd117dec502f40402ebd3a09ed3e8dba804ce2b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index a78d333e31..a9213c2439 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3d70f110c590b38219843a3a0815a232fd542cec"
-SRCREV_meta ?= "d62979d9e2d30640c777438bebb40d98e03c331a"
+SRCREV_machine ?= "1afad41c91e13f957bbe61fa7fdc05a77e84d489"
+SRCREV_meta ?= "aafb8f095e97013d6e55b09ed150369cbe0c6476"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.42"
+LINUX_VERSION ?= "5.4.43"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index db2e82efe4..aab53bed6a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.42"
+LINUX_VERSION ?= "5.4.43"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "80606f0432a35225e7bff188a890b836018bae61"
-SRCREV_machine ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
-SRCREV_meta ?= "d62979d9e2d30640c777438bebb40d98e03c331a"
+SRCREV_machine_qemuarm ?= "c3864bf2906c5075305bf675c27788505ea93047"
+SRCREV_machine ?= "9e1b13d7f9d84f691fb9988c5f53c5ab62b8a5e9"
+SRCREV_meta ?= "aafb8f095e97013d6e55b09ed150369cbe0c6476"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 6c991558ce..01795e6166 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "a076e375d8ad4e5fdfa2de876e760868bfb56362"
-SRCREV_machine_qemuarm64 ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
-SRCREV_machine_qemumips ?= "fd673ca3d8d41867ffc9869cba2fa407e7be1b2a"
-SRCREV_machine_qemuppc ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
-SRCREV_machine_qemuriscv64 ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
-SRCREV_machine_qemux86 ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
-SRCREV_machine_qemux86-64 ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
-SRCREV_machine_qemumips64 ?= "2da40cf3f065512eea3729172f8e3f0cf1857160"
-SRCREV_machine ?= "1ef0d05b4662a4e5a075db47e7e368e9a12c4877"
-SRCREV_meta ?= "d62979d9e2d30640c777438bebb40d98e03c331a"
+SRCREV_machine_qemuarm ?= "6c628db39bf48f7dd6cd95ae826bcaa18a56df1d"
+SRCREV_machine_qemuarm64 ?= "9e1b13d7f9d84f691fb9988c5f53c5ab62b8a5e9"
+SRCREV_machine_qemumips ?= "c0cd2937ae195344ece04663b30b2049427b3c57"
+SRCREV_machine_qemuppc ?= "9e1b13d7f9d84f691fb9988c5f53c5ab62b8a5e9"
+SRCREV_machine_qemuriscv64 ?= "9e1b13d7f9d84f691fb9988c5f53c5ab62b8a5e9"
+SRCREV_machine_qemux86 ?= "9e1b13d7f9d84f691fb9988c5f53c5ab62b8a5e9"
+SRCREV_machine_qemux86-64 ?= "9e1b13d7f9d84f691fb9988c5f53c5ab62b8a5e9"
+SRCREV_machine_qemumips64 ?= "6254ff1d776b75bc3d9c2c66c083fbc622091cd4"
+SRCREV_machine ?= "9e1b13d7f9d84f691fb9988c5f53c5ab62b8a5e9"
+SRCREV_meta ?= "aafb8f095e97013d6e55b09ed150369cbe0c6476"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.42"
+LINUX_VERSION ?= "5.4.43"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1

