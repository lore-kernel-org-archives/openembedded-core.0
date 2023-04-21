Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F98FC77B61
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 16:42:03 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.17767.1682095317169238857
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Apr 2023 09:41:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YBV4m4CY;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-74dd7f52f18so655645085a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 09:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682095318; x=1684687318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZ4N0ARJ1DYdzIxAZXUYzGXItpDfm3e+K7tjTQxfQ30=;
        b=YBV4m4CYsDDEDAv3zr/ueiwFmwOk5/myfgP63tUqgd9NSYbaEhYEi8xoITbRaevqWu
         lhPMGT/RhGUHHEY3CyRI+fMTe47eBoV4s0QsY0EiXPcix14CjXrs6yupDm5pe68wKkAH
         fg6jGyuALfaWGHSGnDE+PVZAl2m1ZoJAikW97qO+I6YjOMDfASSpM/KQNjdEFHvQsyCA
         veCXYGQJ2Rv4H15kaXocBQ1bHch9+EC15TuKOlUFFjIFAQzir6hoiBMaWWGYllGkHsA4
         05whYEybyLq8vBpnA7qA/DLYXehRRTLPJXtb6i7a5gWjFluD2vB/rfzlxLYFq+C3p7Bl
         9rRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095318; x=1684687318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QZ4N0ARJ1DYdzIxAZXUYzGXItpDfm3e+K7tjTQxfQ30=;
        b=afgALLB8/doiMsn88FHkggPWMfewkVnCHLSL9Jptse+YCptn7Qb07xLQVLxCpDoZ1Z
         FkC1xpqi6c8DLSs+7mLQ1bGKolhcko5iR76iOioxymhm5gzb2Q+giHWzgLVVIF+SwGN+
         Ye5SszAfYeswq6/h/KLCcUe7OpizAH//JHQ8benKfcNnahrlxZjS/qlkQXjmm5xxRRQo
         P4bT3l6kh+7GQdXjdgAnUyFHsHqCktZWQsdWQumJX+OKOVGO/Xjh9l/Vxn42vnkKkqlq
         vREzMNsghPSiQ7CEQ+LAirlsSVT4c3PUW16OODq2uvbAiHYaGy8LNIdI76EYLhTFFLnq
         K94w==
X-Gm-Message-State: AAQBX9fRo3+fjcg2tyJkTpjykJ1KPgO+9hAdIsBOPIIDBbSIFyjz3CQk
	Tm/3GbHuY2lllgEV4P156eZvIVo5tkInew==
X-Google-Smtp-Source: AKy350Zt3FXqwVR7NQdwy5tJCpuKF6GM4dpeYoi9J1AggW7aqKF6FHsKkCvZiIfDsIGSf4H685p3gQ==
X-Received: by 2002:ac8:7d51:0:b0:3e6:7634:3d0a with SMTP id h17-20020ac87d51000000b003e676343d0amr9176862qtb.1.1682095317949;
        Fri, 21 Apr 2023 09:41:57 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id 9-20020ac85909000000b003ef573e24cfsm1131245qty.12.2023.04.21.09.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 09:41:57 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] linux-yocto/6.1: update to v6.1.25
Date: Fri, 21 Apr 2023 12:41:49 -0400
Message-Id: <715f6c8ed4533c2d33cb360d44a814b72d5c582f.1682095127.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682095127.git.bruce.ashfield@gmail.com>
References: <cover.1682095127.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 16:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180294

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    f17b0ab65d17 Linux 6.1.25
    243d9f3a1101 cgroup/cpuset: Add cpuset_can_fork() and cpuset_cancel_fork() methods
    e33ab28395d3 cgroup/cpuset: Make cpuset_fork() handle CLONE_INTO_CGROUP properly
    ff5a4fe2598e cgroup/cpuset: Skip spread flags update on v2
    1058e9a130ce nvme-pci: add NVME_QUIRK_BOGUS_NID for T-FORCE Z330 SSD
    dfae73fafd72 nvme-pci: mark Lexar NM760 as IGNORE_DEV_SUBNQN
    f4523cd4986f cifs: fix negotiate context parsing
    8f09ece19c22 i2c: ocores: generate stop condition after timeout in polling mode
    6f5758fd2edf x86/rtc: Remove __init for runtime functions
    31c5ad43bdd1 sched/fair: Fix imbalance overflow
    98c77adf519d powerpc/papr_scm: Update the NUMA distance table for the target node
    9277d0e5889c i2c: mchp-pci1xxxx: Update Timing registers
    50eb90da4fa0 ubi: Fix deadlock caused by recursively holding work_sem
    3dce44039b62 ubi: Fix failure attaching when vid_hdr offset equals to (sub)page size
    aff9099e9c51 mptcp: stricter state check in mptcp_worker
    4d433920eb5e mptcp: use mptcp_schedule_work instead of open-coding it
    1f93ed9a6841 drm/amd/pm: correct SMU13.0.7 max shader clock reporting
    8464a01508f4 drm/amd/pm: correct SMU13.0.7 pstate profiling clock settings
    a746ad276b2e cgroup/cpuset: Wake up cpuset_attach_wq tasks in cpuset_cancel_attach()
    f06c9b01540c cgroup/cpuset: Fix partition root's cpuset.cpus update bug
    53244494bfcb cgroup: fix display of forceidle time at root
    226f6410fd43 x86/PCI: Add quirk for AMD XHCI controller that loses MSI-X state in D3hot
    f8e702c54413 scsi: ses: Handle enclosure with just a primary component gracefully
    c918d0bc687c net: phy: nxp-c45-tja11xx: fix unsigned long multiplication overflow
    4fb1a978a373 net: phy: nxp-c45-tja11xx: add remove callback
    4b3101989e19 net: sfp: initialize sfp->i2c_block_size at sfp allocation
    6c8cc40c588f HID: intel-ish-hid: Fix kernel panic during warm reset
    5d12b36d72bb riscv: add icache flush for nommu sigreturn trampoline
    a2f6ded41bec ksmbd: avoid out of bounds access in decode_preauth_ctxt()
    2128f7c00fa5 maple_tree: fix write memory barrier of nodes once dead for RCU mode
    f58574f238c3 tracing: Have tracing_snapshot_instance_cond() write errors to the appropriate instance
    5620eeb379d1 tracing: Add trace_array_puts() to write into instance
    41afd2473dc4 KVM: SVM: Flush Hyper-V TLB when required
    d8b1253f223c x86/hyperv: KVM: Rename "hv_enlightenments" to "hv_vmcb_enlightenments"
    8eb5ca7f344e KVM: SVM: Add a proper field for Hyper-V VMCB enlightenments
    38b091c8a3f2 KVM: selftests: Move "struct hv_enlightenments" to x86_64/svm.h
    59ef934fcc52 x86/hyperv: Move VMCB enlightenment definitions to hyperv-tlfs.h
    6e999e45ab1c ACPI: resource: Add Medion S17413 to IRQ override quirk
    8c1e247907b9 drm/amdgpu/gfx: set cg flags to enter/exit safe mode
    b4efb6af93ca drm/amdgpu: Force signal hw_fences that are embedded in non-sched jobs
    df27bcd0cf2b drm/amdgpu: add mes resume when do gfx post soft reset
    6c2103d9a88e wifi: iwlwifi: mvm: protect TXQ list manipulation
    742ae1a6c65d wifi: iwlwifi: mvm: fix mvmtxq->stopped handling
    bb0cf2bd6363 nvme: send Identify with CNS 06h only to I/O controllers
    3221808c1c6e asymmetric_keys: log on fatal failures in PE/pkcs7
    d29a47b456fd verify_pefile: relax wrapper length check
    9d482a09acd3 hwmon: (xgene) Fix ioremap and memremap leak
    f2226c840f8d hwmon: (peci/cputemp) Fix miscalculated DTS for SKX
    1fe2ed70c054 drm: panel-orientation-quirks: Add quirk for Lenovo Yoga Book X90F
    25d36216b160 ACPI: video: Add backlight=native DMI quirk for Acer Aspire 3830TG
    cec44fdfbdd6 block: ublk_drv: mark device as LIVE before adding disk
    09b1f40a4ea2 efi: sysfb_efi: Add quirk for Lenovo Yoga Book X91F/L
    a1cfba541300 i2c: hisi: Avoid redundant interrupts
    bd51c04b7e18 i2c: imx-lpi2c: clean rx/tx buffers upon new message
    bf7d62cac546 wifi: mwifiex: mark OF related data as maybe unused
    3565e0b6bca5 selftests/bpf: Fix progs/find_vma_fail1.c build error.
    ac5866fcb6f5 power: supply: axp288_fuel_gauge: Added check for negative values
    d71b48d5b181 power: supply: cros_usbpd: reclassify "default case!" as debug
    43bba80efd07 power: supply: rk817: Fix unsigned comparison with less than zero
    eb365d1f507d ARM: dts: qcom: apq8026-lg-lenok: add missing reserved memory
    19fdbc60b6be ARM: 9290/1: uaccess: Fix KASAN false-positives
    8a5342878429 libbpf: Fix single-line struct definition output in btf_dump
    71850b5af92d skbuff: Fix a race between coalescing and releasing SKBs
    9412a9bf5952 net: macb: fix a memory corruption in extended buffer descriptor mode
    ecdf42c23f3f udp6: fix potential access to stale information
    6985701e628a selftests: openvswitch: adjust datapath NL message declaration
    370280c65c28 RDMA/core: Fix GID entry ref leak when create_ah fails
    5c9367ac5a22 sctp: fix a potential overflow in sctp_ifwdtsn_skip
    bef57c227b52 net: qrtr: Fix an uninit variable access bug in qrtr_tx_resume()
    3756171b97c3 cgroup,freezer: hold cpu_hotplug_lock before freezer_mutex
    eabf778f9b21 net: wwan: iosm: Fix error handling path in ipc_pcie_probe()
    f517b5ee826a qlcnic: check pci_reset_function result
    09f4dec1f6ac drm/armada: Fix a potential double free in an error handling path
    a3f1344a7644 Bluetooth: Set ISO Data Path on broadcast sink
    2fcfd51add22 Bluetooth: SCO: Fix possible circular locking dependency sco_sock_getsockopt
    99f1bc32ebcb Bluetooth: Fix printing errors if LE Connection times out
    7c90d78301f8 Bluetooth: hci_conn: Fix not cleaning up on LE Connection failure
    644b3051b06b net: openvswitch: fix race on port output
    d10c951191af iavf: remove active_cvlans and active_svlans bitmaps
    aa0f377c9b00 iavf: refactor VLAN filter states
    4f6c08c2323b bonding: fix ns validation on backup slaves
    9d7765638fd8 tcp: restrict net.ipv4.tcp_app_win
    53a22fa7f9c2 niu: Fix missing unwind goto in niu_alloc_channels()
    24da5765d1ed KVM: arm64: Advertise ID_AA64PFR0_EL1.CSV2/3 to protected VMs
    361b02e68181 KVM: arm64: Initialise hypervisor copies of host symbols unconditionally
    8b9c64942ada bpf, arm64: Fixed a BTI error on returning to patched function
    c4002b9d5e83 9p/xen : Fix use after free bug in xen_9pfs_front_remove due to race condition
    b7abd535881a dmaengine: apple-admac: Fix 'current_tx' not getting freed
    fdbd0392352c dmaengine: apple-admac: Set src_addr_widths capability
    c7bb085947c3 dmaengine: apple-admac: Handle 'global' interrupt flags
    37b39345b952 LoongArch, bpf: Fix jit to skip speculation barrier opcode
    db9c9086d362 bpf: tcp: Use sock_gen_put instead of sock_put in bpf_iter_tcp
    02eabb635bc6 RDMA/cma: Allow UD qp_type to join multicast only
    74f4471ad642 clk: rs9: Fix suspend/resume
    132918e08e86 RDMA/erdma: Defer probing if netdevice can not be found
    d682c9bc41fa RDMA/erdma: Inline mtt entries into WQE if supported
    3570f3cc4aab RDMA/erdma: Update default EQ depth to 4096 and max_send_wr to 8192
    9554a6b5e2ec IB/mlx5: Add support for 400G_8X lane speed
    6ea322a1ee6a RDMA/irdma: Add ipv4 check to irdma_find_listener()
    ad960ae9f56a RDMA/irdma: Increase iWARP CM default rexmit count
    ee02fa4a71bd RDMA/irdma: Fix memory leak of PBLE objects
    6d61b0cc2ade RDMA/irdma: Do not generate SW completions for NOPs
    b8f3162579e1 clk: sprd: set max_register according to mapping range
    8d901a336302 drm/i915/dsi: fix DSS CTL register offsets for TGL+
    b15df140fe09 fbcon: set_con2fb_map needs to set con2fb_map!
    93aa242f598e fbcon: Fix error paths in set_con2fb_map
    d6c4dfb62d55 KVM: arm64: PMU: Restore the guest's EL0 event counting after migration
    3ad491459d4a mtd: rawnand: stm32_fmc2: use timings.mode instead of checking tRC_min
    1029642ce63e mtd: rawnand: stm32_fmc2: remove unsupported EDO mode
    4efb01e9e3f4 mtd: rawnand: meson: fix bitmask for length in command word
    205c503c8920 mtdblock: tolerate corrected bit-flips
    d5392c1c64f9 fbmem: Reject FB_ACTIVATE_KD_TEXT from userspace
    874cf0b2c0a8 btrfs: fix fast csum implementation detection
    3103c0781257 btrfs: restore the thread_pool= behavior in remount for the end I/O workqueues
    8c4b65f6c707 Bluetooth: hci_conn: Fix possible UAF
    4290d89ae934 Bluetooth: Free potentially unfreed SCO connection
    ba7d93969275 bluetooth: btbcm: Fix logic error in forming the board name.
    f6719fd8f409 Bluetooth: Fix race condition in hidp_session_thread
    348d446762e7 Bluetooth: L2CAP: Fix use-after-free in l2cap_disconnect_{req,rsp}
    71964e93fcb1 ALSA: hda/hdmi: disable KAE for Intel DG2
    d5c9d46f1c1d ALSA: hda/sigmatel: fix S/PDIF out on Intel D*45* motherboards
    cd65ce6696b2 ALSA: emu10k1: don't create old pass-through playback device on Audigy
    8456a96c6b3b ALSA: firewire-tascam: add missing unwind goto in snd_tscm_stream_start_duplex()
    97d70398126d ALSA: hda/realtek: Add quirks for Lenovo Z13/Z16 Gen2
    474f951fb2f8 ALSA: hda: patch_realtek: add quirk for Asus N7601ZM
    165182b56569 ALSA: i2c/cs8427: fix iec958 mixer control deactivation
    721cdcb7a53b ALSA: hda/sigmatel: add pin overrides for Intel DP45SG motherboard
    409f3e57fd2b ALSA: emu10k1: fix capture interrupt handler unlinking
    779fd2a575cc drm/amd/display: Pass the right info to drm_dp_remove_payload
    8b1700d79f9e Revert "pinctrl: amd: Disable and mask interrupts on resume"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 61b94df6d0..4aaa371d97 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "bd422393ccbc5b9c459d3107371a5afe2ed2f064"
-SRCREV_meta ?= "a6064d99509dcaec2e56ad3e7afb3c4d5245887f"
+SRCREV_machine ?= "f974a72071f8b481fc4e38517219bc5c503e14f6"
+SRCREV_meta ?= "36901b5b298e601fe73dd79aaff8b615a7762013"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "6.1.24"
+LINUX_VERSION ?= "6.1.25"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 7ef661b19b..5046759061 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.24"
+LINUX_VERSION ?= "6.1.25"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "524858820f19306f914334e1cdea753002e5c2b4"
-SRCREV_meta ?= "a6064d99509dcaec2e56ad3e7afb3c4d5245887f"
+SRCREV_machine ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
+SRCREV_meta ?= "36901b5b298e601fe73dd79aaff8b615a7762013"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 68428eff97..c2b0e66fb8 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "5bd9ec17d8659b89458036b275b3d26531c3555c"
-SRCREV_machine:qemuarm64 ?= "524858820f19306f914334e1cdea753002e5c2b4"
-SRCREV_machine:qemuloongarch64 ?= "524858820f19306f914334e1cdea753002e5c2b4"
-SRCREV_machine:qemumips ?= "d0064731549602247de4a5d905c23349287c5536"
-SRCREV_machine:qemuppc ?= "524858820f19306f914334e1cdea753002e5c2b4"
-SRCREV_machine:qemuriscv64 ?= "524858820f19306f914334e1cdea753002e5c2b4"
-SRCREV_machine:qemuriscv32 ?= "524858820f19306f914334e1cdea753002e5c2b4"
-SRCREV_machine:qemux86 ?= "524858820f19306f914334e1cdea753002e5c2b4"
-SRCREV_machine:qemux86-64 ?= "524858820f19306f914334e1cdea753002e5c2b4"
-SRCREV_machine:qemumips64 ?= "b40d894e5124d337a6bc6dfcfe3875467090f572"
-SRCREV_machine ?= "524858820f19306f914334e1cdea753002e5c2b4"
-SRCREV_meta ?= "a6064d99509dcaec2e56ad3e7afb3c4d5245887f"
+SRCREV_machine:qemuarm ?= "0b80e90b38ae1735c7dab701ca3d0b2447376ccc"
+SRCREV_machine:qemuarm64 ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
+SRCREV_machine:qemuloongarch64 ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
+SRCREV_machine:qemumips ?= "db61d7fe3540904fbe77b532ce3e37aeb737524a"
+SRCREV_machine:qemuppc ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
+SRCREV_machine:qemuriscv64 ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
+SRCREV_machine:qemuriscv32 ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
+SRCREV_machine:qemux86 ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
+SRCREV_machine:qemux86-64 ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
+SRCREV_machine:qemumips64 ?= "aacc52b6216955723cebb5bc493a4210357b23b2"
+SRCREV_machine ?= "581dc1aa2f340fff2cc010067257185fa2c993f9"
+SRCREV_meta ?= "36901b5b298e601fe73dd79aaff8b615a7762013"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "0102425ac76bd184704c698cab7cb4fe37997556"
+SRCREV_machine:class-devupstream ?= "f17b0ab65d17988d5e6d6fe22f708ef3721080bf"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.24"
+LINUX_VERSION ?= "6.1.25"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


