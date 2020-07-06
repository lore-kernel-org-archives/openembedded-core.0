Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
 by mx.groups.io with SMTP id smtpd.web11.61420.1594051885539264916
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:11:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=h/w+FQz0;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.196, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f196.google.com with SMTP id w2so17794038pgg.10
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=4a0i72U181UFJyGrQypfwl2le9B0IH2lLDG/JECjcWc=;
        b=h/w+FQz0Fnf9VzHZnO8tDmQw8hk+xqmMHL4y4Z/te5H1TXbAx37kLKhGcLMIW11EWU
         TR8SaesfO63IVqSzzsLHsilZ72eK08e8IpvDOKKwsBzfafW87U5a+cEsH0IFaJCpPEgg
         aO+ZxyESxylRVaG/KAPF8f//PkCRQxk3Gtix77CwspbhmSHfdq2aGhawfE54l9Xv95NW
         vWjQFS6GPLtqzNdIXWQxQXlWfP9w3XEiQE10T+xKOFvXXhkC0IAtElySn46PI0jmnUiz
         VTdNFG1UEZIDiOpgVbLdSqi4ecWtUfhZ2qjdHCK6HWzqi7MiuNrS0JN2wNJqlWN/RxbV
         NGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=4a0i72U181UFJyGrQypfwl2le9B0IH2lLDG/JECjcWc=;
        b=nfD1l05M8dNWdtT/u5ikGgCyk5pPfuJo72sPsUBDMXwsw/9HIeCsUrLz9UnyoUp2Wu
         lnIeTgbdgz+GqPvGBZa4O2kzrpq40XWLpmEivHPmVSdSUuJWT0sy726rw753l7fJEimn
         PtNaP8piEkjz3w5vQcQzjoIeoxyfJdtMjzon56YmzjSWYSJqSDs3PXpGoS4Uw2mpuFwW
         BeSe/gFJgNg4nSNfxapGOw1sAOQm2sGy9iIHqLe0MeOo8WEXMmjgOdgfuvihqfPW9kPi
         8Dt0N+65VmPlm7yTPkROvhTKFZBRj7WgAMPBXFeU4cj+7xEjr2gwjN1h0Ob0v7jmBPvu
         oYaA==
X-Gm-Message-State: AOAM531SLyNUz+tuZwMWKMXUSdjdvR/sdEX3HpQIsT9aLtcBUkIvuxHZ
	9Nlds+ERktu4uUlzPEOsRSb4Nhs1NcX6fA==
X-Google-Smtp-Source: ABdhPJzDAhEGwvWrHLo4CVbS9NAt+q5UnKY6bTueHIPkNu62O0YoOLb6llA+yt3Qq9Pe1kb1N+P3mA==
X-Received: by 2002:a62:758b:: with SMTP id q133mr22037734pfc.289.1594051884180;
        Mon, 06 Jul 2020 09:11:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id i67sm18225811pfg.13.2020.07.06.09.11.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:11:23 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 08/25] linux-yocto/5.4: update to v5.4.47
Date: Mon,  6 Jul 2020 06:10:10 -1000
Message-Id: <a0ea7227d62bd6a92f01b988506356f78c0d41f4.1594050175.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594050175.git.steve@sakoman.com>
References: <cover.1594050175.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    fd8cd8ac940c Linux 5.4.47
    d96ef8fa9534 KVM: arm64: Save the host's PtrAuth keys in non-preemptible context
    812857678847 KVM: arm64: Synchronize sysreg state on injecting an AArch32 exception
    85831981aa0e xen/pvcalls-back: test for errors when calling backend_connect()
    29ed45653bec block/floppy: fix contended case in floppy_queue_rq()
    9ec34f441ed4 mmc: sdio: Fix several potential memory leaks in mmc_sdio_init_card()
    55d805ab3691 mmc: sdio: Fix potential NULL pointer error in mmc_sdio_init_card()
    d3c4c5a4d3d8 ARM: dts: at91: sama5d2_ptc_ek: fix sdmmc0 node description
    5a05406e8c14 mmc: uniphier-sd: call devm_request_irq() after tmio_mmc_host_probe()
    1ccf2d6c5b8c mmc: tmio: Further fixup runtime PM management at remove
    e9614e0c525d mmc: mmci_sdmmc: fix DMA API warning overlapping mappings
    f5b13ef230dc mmc: sdhci-msm: Clear tuning done flag while hs400 tuning
    bfc12ff9050b agp/intel: Reinforce the barrier after GTT updates
    e81b05e535e8 perf: Add cond_resched() to task_function_call()
    e0544273b70c fat: don't allow to mount if the FAT length == 0
    c49a17f1f1f7 mm/slub: fix a memory leak in sysfs_slab_add()
    b21602a88ef1 drm/vkms: Hold gem object while still in-use
    9c09a772acb4 Smack: slab-out-of-bounds in vsscanf
    b5c8896bc14f ath9k: Fix general protection fault in ath9k_hif_usb_rx_cb
    db899f242e1a ath9x: Fix stack-out-of-bounds Write in ath9k_hif_usb_rx_cb
    3412e9437543 ath9k: Fix use-after-free Write in ath9k_htc_rx_msg
    3eb802924486 ath9k: Fix use-after-free Read in ath9k_wmi_ctrl_rx
    7f336346d001 ath9k: Fix use-after-free Read in htc_connect_service
    fe0957254640 selftests/ftrace: Return unsupported if no error_log file
    221b26e01d9d scsi: lpfc: Fix negation of else clause in lpfc_prep_node_fc4type
    387d51f0c16f scsi: megaraid_sas: TM command refire leads to controller firmware crash
    205b4c441b0e KVM: arm64: Make vcpu_cp1x() work on Big Endian hosts
    f9551b73717a KVM: arm64: Stop writing aarch32's CSSELR into ACTLR
    8c8238343f0f KVM: MIPS: Fix VPN2_MASK definition for variable cpu_vmbits
    94f4af1b73de KVM: MIPS: Define KVM_ENTRYHI_ASID to cpu_asid_mask(&boot_cpu_data)
    c6d2eb8e57b3 KVM: nVMX: Consult only the "basic" exit reason when routing nested exit
    021cd99a305a KVM: nSVM: leave ASID aside in copy_vmcb_control_area
    3c0bee0c0757 KVM: nSVM: fix condition for filtering async PF
    64b8f33b2e1e KVM: nVMX: Skip IBPB when switching between vmcs01 and vmcs02
    d181dc3667de video: fbdev: w100fb: Fix a potential double free.
    dc8897b8d3b4 video: vt8500lcdfb: fix fallthrough warning
    78e6964dce2a EDAC/skx: Use the mcmtr register to retrieve close_pg/bank_xor_enable
    cd266f8a5b1c cpufreq: Fix up cpufreq_boost_set_sw()
    943f3ae9b149 remoteproc: Fix and restore the parenting hierarchy for vdev
    81fb06cb6bd4 remoteproc: Fall back to using parent memory pool if no dedicated available
    12b24ba6ce56 proc: Use new_inode not new_inode_pseudo
    98a3dea7e276 ovl: initialize error in ovl_copy_xattr
    5650ce02d261 net/mlx5e: Fix repeated XSK usage on one channel
    b05f2b60213c net/mlx5: Fix fatal error handling during device load
    cd5d0278dcb1 net/mlx5: drain health workqueue in case of driver load error
    57bad9e291e3 selftests/net: in rxtimestamp getopt_long needs terminating null entry
    05e275d8742b dccp: Fix possible memleak in dccp_init and dccp_fini
    5ab6f11621a5 crypto: virtio: Fix dest length calculation in __virtio_crypto_skcipher_do_req()
    af03d5957152 crypto: virtio: Fix src/dst scatterlist calculation in __virtio_crypto_skcipher_do_req()
    2ef260d686b5 crypto: virtio: Fix use-after-free in virtio_crypto_skcipher_finalize_req()
    0070e73c9edc firmware: imx: scu: Fix corruption of header
    a1fd068c8922 firmware: imx-scu: Support one TX and one RX
    da24a76bdc81 firmware: imx: warn on unexpected RX
    9a20d6c32756 x86/{mce,mm}: Unmap the entire page if the whole page is affected and poisoned
    977b89e1aba0 crypto: drbg - fix error return code in drbg_alloc_state()
    6ebdf342d4c7 crypto: algapi - Avoid spurious modprobe on LOADED
    4a87772480aa crypto: cavium/nitrox - Fix 'nitrox_get_first_device()' when ndevlist is fully iterated
    1027dc04f557 gup: document and work around "COW can break either way" issue
    6ed11984edb1 PM: runtime: clk: Fix clk_pm_runtime_get() error path
    fc45cd292c5e spi: bcm-qspi: when tx/rx buffer is NULL set to 0
    0cd18337704f spi: bcm-qspi: Handle clock probe deferral
    3bb1e6eb7c5e spi: bcm2835aux: Fix controller unregister order
    496a5e5fd0e6 spi: bcm2835: Fix controller unregister order
    73d9bae0a584 spi: pxa2xx: Fix runtime PM ref imbalance on probe error
    1aec7b22a93f spi: pxa2xx: Fix controller unregister order
    824a4e3b9acf spi: Fix controller unregister order
    7753886c6dd7 spi: dw: Fix controller unregister order
    ffe5ebdf81a1 nilfs2: fix null pointer dereference at nilfs_segctor_do_construct()
    d4904b38ea45 lib/lzo: fix ambiguous encoding bug in lzo-rle
    07ffdf0d984b arm64: acpi: fix UBSAN warning
    286822392013 ACPI: PM: Avoid using power resources if there are none for D0
    75d6d0ad12f3 ACPI: GED: add support for _Exx / _Lxx handler methods
    040b4dcc1269 ACPI: CPPC: Fix reference count leak in acpi_cppc_processor_probe()
    e4cc99efbeb9 ACPI: sysfs: Fix reference count leak in acpi_sysfs_add_hotplug_profile()
    10a8c04c0b51 ALSA: usb-audio: Add vendor, product and profile name for HP Thunderbolt Dock
    969c9b50fdec ALSA: usb-audio: Fix inconsistent card PM state after resume
    1f5ab51e2e2f ALSA: pcm: fix snd_pcm_link() lockdep splat
    4f643b8c4773 ALSA: pcm: disallow linking stream to itself
    1900bf5e7fd7 ALSA: hda/realtek - add a pintbl quirk for several Lenovo machines
    13c18353c985 ALSA: fireface: fix configuration error for nominal sampling transfer frequency
    110d04acda5e ALSA: es1688: Add the missed snd_card_free()
    f7d57ba8d7b8 watchdog: imx_sc_wdt: Fix reboot on crash
    3003daa76bdf smb3: add indatalen that can be a non-zero value to calculation of credit charge in smb2 ioctl
    0470d6c3276d smb3: fix incorrect number of credits when ioctl MaxOutputResponse > 64K
    e1437d181d30 efi/efivars: Add missing kobject_put() in sysfs entry creation error path
    ab2df991e5e2 io_uring: use kvfree() in io_sqe_buffer_register()
    d4a13e671138 ASoC: max9867: fix volume controls
    ac0175f9dd4d powerpc/ptdump: Properly handle non standard page size
    cb810f75e98a KVM: x86: Fix APIC page invalidation race
    a2b0ce3c2206 KVM: x86: respect singlestep when emulating instruction
    af718119061f KVM: x86/mmu: Set mmio_value to '0' if reserved #PF can't be generated
    d872f174218d perf/x86/intel: Add more available bits for OFFCORE_RESPONSE of Intel Tremont
    57a537b3994e x86/reboot/quirks: Add MacBook6,1 reboot quirk
    e1545848ad55 x86/speculation: PR_SPEC_FORCE_DISABLE enforcement for indirect branches.
    6d60d5462a91 x86/speculation: Avoid force-disabling IBPB based on STIBP and enhanced IBRS.
    9d1dcba6dd48 x86/speculation: Prevent rogue cross-process SSBD shutdown
    41551b56af93 x86/PCI: Mark Intel C620 MROMs as having non-compliant BARs
    e8652fef5336 x86_64: Fix jiffies ODR violation
    7ae53601458f sctp: fix refcount bug in sctp_wfree
    067ef17a3f7d sctp: fix possibly using a bad saddr with a given dst
    f1bb90b885cf iwlwifi: mvm: fix NVM check for 3168 devices
    0315cfc6f816 ipv4: fix a RCU-list lock in fib_triestat_seq_show
    7328f9a4ad58 aio: fix async fsync creds
    f27ad513a474 fanotify: fix ignore mask logic for events on child and on dir
    515e02bf19b3 selftests: fix flower parent qdisc
    0b11ec4ae557 mm: add kvfree_sensitive() for freeing sensitive data objects
    7c41d8c1bc6f perf probe: Accept the instance number of kretprobe event
    a3e6ba31fc4d PCI/PM: Adjust pcie_wait_for_link_delay() for caller delay
    ba95f95c27e8 KVM: x86: only do L1TF workaround on affected processors
    79e378172ca3 x86/cpu/amd: Make erratum #1054 a legacy erratum
    86c7d245e38d s390/pci: Log new handle in clp_disable_fh()
    77db4e1d40aa padata: add separate cpuhp node for CPUHP_PADATA_DEAD
    f23be4d1555d RDMA/uverbs: Make the event_queue fds return POLLERR when disassociated
    3f14df580a3d smack: avoid unused 'sip' variable warning
    3242fa02daf0 ath9k_htc: Silence undersized packet warnings
    b06bbbc6afcd spi: dw: Fix native CS being unset
    eb6315063043 powerpc/xive: Clear the page tables for the ESB IO mapping
    282acc187c48 drivers/net/ibmvnic: Update VNIC protocol version reporting
    f8713c2cb06e gfs2: Even more gfs2_find_jhead fixes
    108681048cf7 csky: Fixup abiv2 syscall_trace break a4 & a5
    16d902821bb7 Input: synaptics - add a second working PNP_ID for Lenovo T470s
    53fed23f8c74 sched/fair: Don't NUMA balance for kthreads
    1a28b2050334 ARM: 8977/1: ptrace: Fix mask for thumb breakpoint hook
    bafaf4708a62 Input: mms114 - fix handling of mms345l
    b4aa6da26135 elfnote: mark all .note sections SHF_ALLOC
    f04d1e880f17 bpf: Support llvm-objcopy for vmlinux BTF
    3a577e62208c vxlan: Avoid infinite loop when suppressing NS messages with invalid options
    de9d1010b97c bridge: Avoid infinite loop when suppressing NS messages with invalid options
    747d5bcb97eb tun: correct header offsets in napi frags mode
    c8e374ee6095 net_failover: fixed rollback in net_failover_open()
    5ab453bb7b29 mlxsw: core: Use different get_trend() callbacks for different thermal zones
    f560ea659b33 ipv6: fix IPV6_ADDRFORM operation logic

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ea6bc1389bae6e5c28d0ee49a41ad1e3ca632d3d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 4f7b84613e..20b1586f52 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "29bff27700d5eaeee119c91b3a8b3540f9eff4e6"
-SRCREV_meta ?= "627191aa87d971e153f95beac4d9e45aea0e9b65"
+SRCREV_machine ?= "477bc652e6af1f1a21e36bb52045c78646608e22"
+SRCREV_meta ?= "8745aff15effeb7856b8dca7f8bd5a472f3173c7"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.46"
+LINUX_VERSION ?= "5.4.47"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 0859d35ced..058d7683cf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.46"
+LINUX_VERSION ?= "5.4.47"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ef392a1fda8e56dd3f811488771d233a7374ee46"
-SRCREV_machine ?= "37a68a90035cd2ac28005ed4136a4d376359bd17"
-SRCREV_meta ?= "627191aa87d971e153f95beac4d9e45aea0e9b65"
+SRCREV_machine_qemuarm ?= "2eee5e9cb9fbd8cfd84e5b90cbb05456a30c4032"
+SRCREV_machine ?= "403891379b317f9f12e3cee8aa1622a6d74d7b0c"
+SRCREV_meta ?= "8745aff15effeb7856b8dca7f8bd5a472f3173c7"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 862ec48d82..13be2acc24 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "db71dcd861b5d9d2c5b1a98b0cf0c67979ae8790"
-SRCREV_machine_qemuarm64 ?= "37a68a90035cd2ac28005ed4136a4d376359bd17"
-SRCREV_machine_qemumips ?= "90471d7fcb21e5955bac724d9b1cf2aa6d2e5444"
-SRCREV_machine_qemuppc ?= "37a68a90035cd2ac28005ed4136a4d376359bd17"
-SRCREV_machine_qemuriscv64 ?= "37a68a90035cd2ac28005ed4136a4d376359bd17"
-SRCREV_machine_qemux86 ?= "37a68a90035cd2ac28005ed4136a4d376359bd17"
-SRCREV_machine_qemux86-64 ?= "37a68a90035cd2ac28005ed4136a4d376359bd17"
-SRCREV_machine_qemumips64 ?= "1b81c8b0c3a73120966d633485233382bb8f7517"
-SRCREV_machine ?= "37a68a90035cd2ac28005ed4136a4d376359bd17"
-SRCREV_meta ?= "627191aa87d971e153f95beac4d9e45aea0e9b65"
+SRCREV_machine_qemuarm ?= "69a05705a437d3b0fc51518c66f93cc4db3cbd16"
+SRCREV_machine_qemuarm64 ?= "403891379b317f9f12e3cee8aa1622a6d74d7b0c"
+SRCREV_machine_qemumips ?= "93cc3c1275f5ef3a83610aadfcce7e8c7da7187d"
+SRCREV_machine_qemuppc ?= "403891379b317f9f12e3cee8aa1622a6d74d7b0c"
+SRCREV_machine_qemuriscv64 ?= "403891379b317f9f12e3cee8aa1622a6d74d7b0c"
+SRCREV_machine_qemux86 ?= "403891379b317f9f12e3cee8aa1622a6d74d7b0c"
+SRCREV_machine_qemux86-64 ?= "403891379b317f9f12e3cee8aa1622a6d74d7b0c"
+SRCREV_machine_qemumips64 ?= "ed4a5ca45f3ff5aee9cb76a584e9f8db4667035d"
+SRCREV_machine ?= "403891379b317f9f12e3cee8aa1622a6d74d7b0c"
+SRCREV_meta ?= "8745aff15effeb7856b8dca7f8bd5a472f3173c7"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.46"
+LINUX_VERSION ?= "5.4.47"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.17.1

