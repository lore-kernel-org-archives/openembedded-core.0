Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.61609.1594052829061264573
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2020 09:27:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kqcgarpS;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id b25so7980757qto.2
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2020 09:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D6AFrEPvRrOOz6DwOaqPiFt/2FjQPuPd6XvpWcPLtts=;
        b=kqcgarpSa4iXn0S6zXjQjUuGmSwJ6AbzzKKNkEXdK6di5kepLB2CXwttQAIFXxcxbv
         m7XlBUdsekBjzguGRUKKcnXeX0RhunqKs5YFx/V+be2Bx9i6pnwUYlMVEtCM5dduJa8H
         HkjHc3c3r02EKwPRblrlNE4CyuCNeZ4+xADon/qDKgu8kkCY4JI+3KKcUER+YEtFk2Uh
         Y384YT1xb1XqRfw72shKivfn8FJOUPO1b8ZWZGXaDfvC7UfpBByBKw1kG0sAZpRvTZXg
         H07gDE4hEhyWV5goNesXJ66ZbPJH2hoymRSrfN7yFl+Xw0E8IDJmKpvpj6C/2f95tKeb
         XoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D6AFrEPvRrOOz6DwOaqPiFt/2FjQPuPd6XvpWcPLtts=;
        b=dy1cGVhtsrwTQACYOByLAX468+1v7f3rNxrhyfoxNgCpSCVNI0Lq8o92wPeozP9M8i
         EQtBSwlRgSZ9D7FbFFJfOmBirMvwJlghmsQpFtMIx4bMTE9hatm9sBtkJFrpOG37S136
         yQ6qJWcv7mesCI0Kus0h0kz+tbUeQMlBlh49ArwAkrCMU1xuqiwsgTZUQXlcg8eHlIPE
         hNg6IvMfJZLKjw5qZJCD5xPKdTA6miIxntJFfa72I0mL0HZ/f2Sht7mHfYzqr4N5Y7s+
         7IvoplRDM+kHoAX2pqDln8ZtgC0knr5ZFD+4KJFcvOto8A9k7YAxk/6bKNz+k1DnFoZ+
         oxUQ==
X-Gm-Message-State: AOAM531m0HRfc143NKYK9J4igYc9+VVZRL42lvelycnBxc5KJeUkZ44L
	WNsih2wSdruSyeGjzE0guLw=
X-Google-Smtp-Source: ABdhPJzs1k9MqE0tPEI02T89AXdoeqaRGBJ+qLHj1tye7xYOUUzXgirCWlxP76w5bz71apDrANLCdg==
X-Received: by 2002:aed:3b99:: with SMTP id r25mr27894822qte.315.1594052827841;
        Mon, 06 Jul 2020 09:27:07 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id v184sm20326928qki.12.2020.07.06.09.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 09:27:07 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] linux-yocto/5.4: update to v5.4.50
Date: Mon,  6 Jul 2020 12:27:04 -0400
Message-Id: <20200706162705.19104-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    e75220890bf6 Linux 5.4.50
    a160afebd779 Revert "tty: hvc: Fix data abort due to race in hvc_open"
    ffd40b7962d4 xfs: add agf freeblocks verify in xfs_agf_verify
    cc66553004f4 dm writecache: add cond_resched to loop in persistent_memory_claim()
    a51e71cbf6e6 dm writecache: correct uncommitted_block when discarding uncommitted entry
    de1d70dad6f2 xprtrdma: Fix handling of RDMA_ERROR replies
    4d35ca872ac3 NFSv4 fix CLOSE not waiting for direct IO compeletion
    02917bef8f1b pNFS/flexfiles: Fix list corruption if the mirror count changes
    7b99577ff376 SUNRPC: Properly set the @subbuf parameter of xdr_buf_subsegment()
    c27d205baa82 sunrpc: fixed rollback in rpc_gssd_dummy_populate()
    60bdb51d44fa Staging: rtl8723bs: prevent buffer overflow in update_sta_support_rate()
    c6f88afa6ae1 drm/amdgpu: add fw release for sdma v5_0
    05124abe1fb0 drm/radeon: fix fb_div check in ni_init_smc_spll_table()
    834a3aa2ceb4 drm: rcar-du: Fix build error
    176a3c488476 drm/amd: fix potential memleak in err branch
    0b3cc973f16f ring-buffer: Zero out time extend if it is nested and not absolute
    9a59a88b3d31 tracing: Fix event trigger to accept redundant spaces
    c036eb65fdfc arm64: dts: imx8mn-ddr4-evk: correct ldo1/ldo2 voltage range
    90bd9c611f21 arm64: dts: imx8mm-evk: correct ldo1/ldo2 voltage range
    73f79b420bd0 arm64: perf: Report the PC value in REGS_ABI_32 mode
    7a9e3e25a9d2 mm/memcontrol.c: add missed css_put()
    ff6aff13a8cf ocfs2: fix panic on nfs server over ocfs2
    a8d82ebaee97 ocfs2: fix value of OCFS2_INVALID_SLOT
    4685df862c8b ocfs2: load global_inode_alloc
    7fa716a594a6 ocfs2: avoid inode removal while nfsd is accessing it
    fbca1aee1397 mm/slab: use memzero_explicit() in kzfree()
    a79c3a99ac81 btrfs: fix failure of RWF_NOWAIT write into prealloc extent beyond eof
    863a197f7f10 btrfs: check if a log root exists before locking the log_mutex on unlink
    53a081661047 btrfs: fix data block group relocation failure due to concurrent scrub
    0a4dfc69ea7e btrfs: fix bytes_may_use underflow when running balance and scrub in parallel
    df13086490db x86/asm/64: Align start of __clear_user() loop to 16-bytes
    3ceaf206b706 x86/cpu: Use pinning mask for CR4 bits needing to be 0
    96a80133559f KVM: VMX: Stop context switching MSR_IA32_UMWAIT_CONTROL
    8ccc6ac51eac KVM: nVMX: Plumb L2 GPA through to PML emulation
    5774f9fa563b KVM: X86: Fix MSR range of APIC registers in X2APIC mode
    0236040fcf97 erofs: fix partially uninitialized misuse in z_erofs_onlinepage_fixup
    824d0b6225f3 ACPI: configfs: Disallow loading ACPI tables when locked down
    3c4f9a5541bb ACPI: sysfs: Fix pm_profile_attr type
    6ee4d61403d2 ALSA: hda/realtek: Add mute LED and micmute LED support for HP systems
    1a1bc3ae6935 ALSA: hda/realtek - Add quirk for MSI GE63 laptop
    0211e0d7f185 ALSA: hda: Add NVIDIA codec IDs 9a & 9d through a0 to patch table
    f06a6294e113 RISC-V: Don't allow write+exec only page mapping request in mmap
    26b0956cb374 block: update hctx map when use multiple maps
    72647ea37700 blktrace: break out of blktrace setup on concurrent calls
    d14eb5d8f0f4 kprobes: Suppress the suspicious RCU warning on kprobes
    8ed391a3dbc4 recordmcount: support >64k sections
    803d114e8f19 kbuild: improve cc-option to clean up all temporary files
    cbed4eb0a92f arm64: sve: Fix build failure when ARM64_SVE=y and SYSCTL=n
    a9a3b33b20aa s390/vdso: fix vDSO clock_getres()
    68a3cbc44660 s390/vdso: Use $(LD) instead of $(CC) to link vDSO
    7c17909a889d s390/ptrace: fix setting syscall number
    64f7b10a91a4 s390/ptrace: pass invalid syscall numbers to tracing
    453cfe187723 pinctrl: tegra: Use noirq suspend/resume callbacks
    7851257375ae pinctrl: qcom: spmi-gpio: fix warning about irq chip reusage
    8dba9173a37a test_objagg: Fix potential memory leak in error handling
    6fd916e24935 net: alx: fix race condition in alx_remove
    855dbf10c9a7 ibmvnic: Harden device login requests
    07b8b2d46371 hwrng: ks-sa - Fix runtime PM imbalance on error
    b8403f7e45e5 riscv/atomic: Fix sign extension for RV64I
    81616542adcc drm/amd/display: Use kfree() to free rgb_user in calculate_user_regamma_ramp()
    f7f181582f1b ata/libata: Fix usage of page address by page_address in ata_scsi_mode_select_xlat function
    4dfc238a2441 sata_rcar: handle pm_runtime_get_sync failure cases
    83bdf7f8b712 sched/core: Fix PI boosting between RT and DEADLINE tasks
    3dc7138943b1 sched/deadline: Initialize ->dl_boosted
    bfd4981fe3d6 afs: Fix storage of cell names
    5cee9e67596f i2c: core: check returned size of emulated smbus block read
    4a6e6413059e i2c: fsi: Fix the port number field in status register
    0935afc39797 clk: sifive: allocate sufficient memory for struct __prci_data
    b78bae5ab399 net: bcmgenet: use hardware padding of runt frames
    ae6d80f62c73 netfilter: ipset: fix unaligned atomic access
    8d93603bf60c nvme: don't protect ns mutation with ns->head->lock
    f9dc5e708ab8 usb: renesas_usbhs: getting residue from callback_result
    56ee0ed97df5 usb: gadget: udc: Potential Oops in error handling code
    a3a86515d017 scsi: lpfc: Avoid another null dereference in lpfc_sli4_hba_unset()
    1e812023f478 ARM: imx5: add missing put_device() call in imx_suspend_alloc_ocram()
    61f488765dff cxgb4: move handling L2T ARP failures to caller
    065f225ef975 net: qede: fix use-after-free on recovery and AER handling
    f490e70fa7eb net: qede: fix PTP initialization on recovery
    7180c8fc4a03 net: qed: fix excessive QM ILT lines consumption
    32cf4ff4ec52 net: qed: fix NVMe login fails over VFs
    d0717a95a06b net: qede: stop adding events on an already destroyed workqueue
    164d9a15652f net: qed: fix async event callbacks unregistering
    5cf7f0c68405 net: qed: fix left elements count calculation
    33104571648b iommu/vt-d: Update scalable mode paging structure coherency
    ede796e5ac87 iommu/vt-d: Enable PCI ACS for platform opt in hint
    67db9e032b6e selftests/net: report etf errors correctly
    34f45567462d RDMA/mad: Fix possible memory leak in ib_mad_post_receive_mads()
    d3edf648f398 s390/qeth: fix error handling for isolation mode cmds
    9e89c2d5da87 ASoC: rockchip: Fix a reference count leak.
    4aeb21584e55 RDMA/cma: Protect bind_list and listen_list while finding matching cm id
    f0078dc6750f RDMA/qedr: Fix KASAN: use-after-free in ucma_event_handler+0x532
    66143ecb9e3c RDMA/rvt: Fix potential memory leak caused by rvt_alloc_rq
    d6fb7f457456 rxrpc: Fix handling of rwind from an ACK packet
    73cff44e66e3 ARM: dts: NSP: Correct FA2 mailbox node
    f1ee7d3a2c1a bpf: Don't return EINVAL from {get,set}sockopt when optlen > PAGE_SIZE
    0f3aa6c6d6ad devmap: Use bpf_map_area_alloc() for allocating hash buckets
    b93df0f6d7cd regmap: Fix memory leak from regmap_register_patch
    5f6b834e110b x86/resctrl: Fix a NULL vs IS_ERR() static checker warning in rdt_cdp_peer_get()
    99ab61cc8b75 ARM: dts: Fix duovero smsc interrupt for suspend
    07f7c547698b ARM: dts: am335x-pocketbeagle: Fix mmc0 Write Protect
    d909f9db0caa bpf, xdp, samples: Fix null pointer dereference in *_user code
    0608288c6caa samples/bpf: xdp_redirect_cpu: Set MAX_CPUS according to NR_CPUS
    b59ed5668c4e ASoC: fsl_ssi: Fix bclk calculation for mono channel
    3947dd237ef5 RDMA/siw: Fix pointer-to-int-cast warning in siw_rx_pbl()
    34f105349369 regualtor: pfuze100: correct sw1a/sw2 on pfuze3000
    1fa27418054f ASoC: qcom: common: set correct directions for dailinks
    47c7ae0ca9d7 ASoc: q6afe: add support to get port direction
    92444a57e365 efi/esrt: Fix reference count leak in esre_create_sysfs_entry.
    8c236ac4376a efi/tpm: Verify event log header before parsing
    e50cf858d118 ASoC: q6asm: handle EOS correctly
    41b2debf35ef xfrm: Fix double ESP trailer insertion in IPsec crypto offload.
    475a7b09b4bb ARM: OMAP2+: Fix legacy mode dss_reset
    527ddb339d6b bus: ti-sysc: Ignore clockactivity unless specified as a quirk
    1f5197a5ad97 bus: ti-sysc: Flush posted write on enable and disable
    21d511c6c9c2 IB/hfi1: Fix module use count flaw due to leftover module put calls
    2a4c0bf5c70e IB/mad: Fix use after free when destroying MAD agent
    588ad2b29ea3 loop: replace kill_bdev with invalidate_bdev
    d9a74e455070 cdc-acm: Add DISABLE_ECHO quirk for Microchip/SMSC chip
    d6522bc320d7 xhci: Return if xHCI doesn't support LPM
    14d46386226e xhci: Fix enumeration issue when setting max packet size for FS devices.
    c09be4f57956 xhci: Fix incorrect EP_STATE_MASK
    e615f58fa86c cifs/smb3: Fix data inconsistent when zero file range
    bd2f2ac0ab96 cifs/smb3: Fix data inconsistent when punch hole
    572a11131ad3 cifs: Fix cached_fid refcnt leak in open_shroot
    1f551a056b30 scsi: zfcp: Fix panic on ERP timeout for previously dismissed ERP action
    d3a251b84797 scsi: qla2xxx: Keep initiator ports after RSCN
    be8df027079b usb: cdns3: ep0: add spinlock for cdns3_check_new_setup
    a0668653be26 usb: cdns3: ep0: fix the test mode set incorrectly
    79175ae5f996 usb: cdns3: trace: using correct dir value
    25e1bb1e6c36 ALSA: usb-audio: Fix OOB access of mixer element list
    1cc2d29710c2 ALSA: usb-audio: add quirk for Samsung USBC Headset (AKG)
    0c4ff206043e ALSA: usb-audio: add quirk for Denon DCD-1500RE
    74a7ad9d975c ALSA: usb-audio: Add implicit feedback quirk for SSL2+.
    895ec8c86e13 usb: typec: tcpci_rt1711h: avoid screaming irq causing boot hangs
    fe2daefad98a usb: host: ehci-exynos: Fix error check in exynos_ehci_probe()
    c1e71a51c2f5 xhci: Poll for U0 after disabling USB2 LPM
    9d814bd14cff usb: host: xhci-mtk: avoid runtime suspend when removing hcd
    9200037a6ab6 USB: ehci: reopen solution for Synopsys HC bug
    ffeb58a0daf0 usb: add USB_QUIRK_DELAY_INIT for Logitech C922
    6b3eb8af48cb usb: dwc2: Postponed gadget registration to the udc class driver
    195c1d1dd8cf USB: ohci-sm501: Add missed iounmap() in remove
    2274a7421e73 binder: fix null deref of proc->context
    3621616af99b ALSA: usb-audio: Fix potential use-after-free of streams
    335add4ac891 fix a braino in "sparc32: fix register window handling in genregs32_[gs]et()"
    32e5a15f1084 net: sched: export __netdev_watchdog_up()
    9d3d40ec7dee btrfs: fix a block group ref counter leak after failure to remove block group
    8ae850cddf27 Revert "i2c: tegra: Fix suspending in active runtime PM state"
    052a7fdd86fb tcp_cubic: fix spurious HYSTART_DELAY exit upon drop in min RTT
    942315134313 sch_cake: fix a few style nits
    b1aa7e5fa163 sch_cake: don't call diffserv parsing code when it is not needed
    ea2628dd586d sch_cake: don't try to reallocate or unshare skb unconditionally
    3c6208267218 ip_tunnel: fix use-after-free in ip_tunnel_lookup()
    9baf076d797f net: phy: Check harder for errors in get_phy_id()
    568c5aaf6c2d ip6_gre: fix use-after-free in ip6gre_tunnel_lookup()
    35db638692db tg3: driver sleeps indefinitely when EEH errors exceed eeh_max_freezes
    fe3a5d8fc372 tcp: grow window for OOO packets only for SACK flows
    cb22ce3346f2 tcp: don't ignore ECN CWR on pure ACK
    dc43f7e807a8 sctp: Don't advertise IPv4 addresses if ipv6only is set on the socket
    fea864489c90 rxrpc: Fix notification call on completion of discarded calls
    6956830cf981 rocker: fix incorrect error handling in dma_rings_init
    a908f986ddf7 openvswitch: take into account de-fragmentation/gso_size in execute_check_pkt_len
    27b70214fc69 net: usb: ax88179_178a: fix packet alignment padding
    67571b1ab296 net: increment xmit_recursion level in dev_direct_xmit()
    97a1d2aa6cdd net: Fix the arp error in some cases
    742f2358b324 net: fix memleak in register_netdevice()
    9e693934cd59 net: Do not clear the sock TX queue in sk_set_socket()
    9f217d6dd796 net: core: reduce recursion limit value
    f32325b100ea net: bridge: enfore alignment for ethernet address
    57a976e676e1 mvpp2: ethtool rxtx stats fix
    fa0d7e09da1d mld: fix memory leak in ipv6_mc_destroy_dev()
    009b3e294a90 ibmveth: Fix max MTU limit
    f060107ccc97 geneve: allow changing DF behavior after creation
    ce06fcb6a66d enetc: Fix tx rings bitmap iteration range, irq handling
    b90ca32531bf block/bio-integrity: don't free 'buf' if bio_integrity_add_page() failed

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index e5401587d6..a4b593b96d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f611b456c071c5898e3762a190b71e3a51b0ad65"
-SRCREV_meta ?= "30814016b37dc93699992221763ad4e2960b02fa"
+SRCREV_machine ?= "6415a4e7c405526f97049ede833f52127a5ce7a1"
+SRCREV_meta ?= "416566e1f01c3c02ca5b3a03d0943df387d521f0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.49"
+LINUX_VERSION ?= "5.4.50"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index fb2d37405d..0622d33835 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.49"
+LINUX_VERSION ?= "5.4.50"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "ddf262a3be1304a97d62bb8f60a0c0ae2b41fdc9"
-SRCREV_machine ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
-SRCREV_meta ?= "30814016b37dc93699992221763ad4e2960b02fa"
+SRCREV_machine_qemuarm ?= "1a8a14e45f01cfee926c5b35d2d67e6f1a7eebfc"
+SRCREV_machine ?= "94667198aabf869571bdff5291a24956796faddf"
+SRCREV_meta ?= "416566e1f01c3c02ca5b3a03d0943df387d521f0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index fc8c442ef1..2476b3502c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "93677fbb328db35b696740a0c34e05036e75f1b7"
-SRCREV_machine_qemuarm64 ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
-SRCREV_machine_qemumips ?= "c2068f8b670dce4a8d409981a8993df12b993fd3"
-SRCREV_machine_qemuppc ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
-SRCREV_machine_qemuriscv64 ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
-SRCREV_machine_qemux86 ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
-SRCREV_machine_qemux86-64 ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
-SRCREV_machine_qemumips64 ?= "4c723a6a9eb908e34d228c5a478af237d9baabf8"
-SRCREV_machine ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
-SRCREV_meta ?= "30814016b37dc93699992221763ad4e2960b02fa"
+SRCREV_machine_qemuarm ?= "99743105f331e90852ccb9e72ce26134dbcafec6"
+SRCREV_machine_qemuarm64 ?= "94667198aabf869571bdff5291a24956796faddf"
+SRCREV_machine_qemumips ?= "886870e5abaeaaf753fb50a1e5be56336c44c642"
+SRCREV_machine_qemuppc ?= "94667198aabf869571bdff5291a24956796faddf"
+SRCREV_machine_qemuriscv64 ?= "94667198aabf869571bdff5291a24956796faddf"
+SRCREV_machine_qemux86 ?= "94667198aabf869571bdff5291a24956796faddf"
+SRCREV_machine_qemux86-64 ?= "94667198aabf869571bdff5291a24956796faddf"
+SRCREV_machine_qemumips64 ?= "7548abbb409eeef6f0575eed25231090f902559e"
+SRCREV_machine ?= "94667198aabf869571bdff5291a24956796faddf"
+SRCREV_meta ?= "416566e1f01c3c02ca5b3a03d0943df387d521f0"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.49"
+LINUX_VERSION ?= "5.4.50"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

