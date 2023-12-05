Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A239C10F09
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 04:27:17 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.93050.1701750436350915540
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 20:27:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PO4e6VyN;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-423e77aa09cso41442661cf.1
        for <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 20:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701750435; x=1702355235; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cve4rHOvpPVhRP3ViEiJgDF7KIPfMRbM5mkMW7tIDrM=;
        b=PO4e6VyNnC9nYVW2IbY41psvyRsAtPkelmorrORm4ZIW6A8ST1n8N+84N1UjNqI482
         0jrYznLeF9a5CUM7G86lQ+nsg/85qEfwy+a0RGo/vNjp/p93PE9xqpLpUmbMaubsPC1T
         /Ma8F61kh2ccezLqHCoV7PtGJANu9zDKjppWde6NfHoUp699chtitBI2j6e/bIeF8RsV
         FlE4/B6ofAfxmuQHTViP7EzCVOi1joEsOl4hteG1KeJXIwrVoV6HLO9pSGV8xBKEgCeR
         wk4RYFVgXWeSXKcCLCT2cI7EvHAmwRxjnwJeewtoJMmiPJtXk5oiaHHptebOBZP8CQud
         jXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701750435; x=1702355235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cve4rHOvpPVhRP3ViEiJgDF7KIPfMRbM5mkMW7tIDrM=;
        b=xB7J1DWomKEYnsCpK1Yo6ieSrOENGmJS4vvdqhnSKlM9L2sGfHpTbzYM6kleVoE265
         2HvVcNGZ9RU6LHv9Nokj+lEfiGlF/q6wnTNWX0qRwYQNFk92X8UM8YvN6fwyR1LLezIy
         RcqwdZFcMhhyCVM8xbJFvFFJbHGrv512Tb45B3SMijDxCrm3GsEg6ly2PH4Z51koeNgE
         Mn8pTg0P00w4MDm2J9KjnFwxWtSFcjskESaOAzbnnlgEBlDhEt7D1nO4Ms4X+jGzd212
         IqCh/q/OFAPjMsjGL3yqnEe8EdFWThd0ce/69l35fxaC430R8D1ogA/HWdhl9e10ZRSt
         F20Q==
X-Gm-Message-State: AOJu0YzkQfE7OnrOhv8OGSNOGQenjOshC/AOEIPLh/DMHSog7ec+rjG5
	zZZNAFWkewlMw13BwgzB148COWkZmqE=
X-Google-Smtp-Source: AGHT+IHurCN6seuYy4JFwzMECEPAs7b5XSGCClt6u9mca6o7sCthqAfxy3FaWCob29DRXM8ngtbeVw==
X-Received: by 2002:ac8:7d14:0:b0:425:4043:7645 with SMTP id g20-20020ac87d14000000b0042540437645mr619114qtb.109.1701750434926;
        Mon, 04 Dec 2023 20:27:14 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id bz17-20020a05622a1e9100b0042542160fd0sm2963298qtb.20.2023.12.04.20.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 20:27:14 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/7] linux-yocto/6.1: update to v6.1.65
Date: Mon,  4 Dec 2023 23:27:02 -0500
Message-Id: <dd2261a44a8709f425e791a2933884e792fa322a.1701750230.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1701750230.git.bruce.ashfield@gmail.com>
References: <cover.1701750230.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 04:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191784

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    c6114c845984 Linux 6.1.65
    66ecd1cd8b0c io_uring: fix off-by one bvec index
    812171018e47 USB: dwc3: qcom: fix wakeup after probe deferral
    72ef87bb8e5d USB: dwc3: qcom: fix software node leak on probe errors
    fc7b2fe26769 usb: dwc3: set the dma max_seg_size
    92b9eca53de8 usb: dwc3: Fix default mode initialization
    451c5a61722d USB: dwc2: write HCINT with INTMASK applied
    d9be7a129778 usb: typec: tcpm: Skip hard reset when in error recovery
    c15cb712da41 USB: serial: option: don't claim interface 4 for ZTE MF290
    5a657b34fe83 USB: serial: option: fix FM101R-GL defines
    4fccb016ffcd USB: serial: option: add Fibocom L7xx modules
    f70b0b6fd8c6 usb: cdnsp: Fix deadlock issue during using NCM gadget
    f9ba5dd0d9c9 bcache: fixup lock c->root error
    c736af32a82b bcache: fixup init dirty data errors
    c37aca3dd513 bcache: prevent potential division by zero error
    366f3648f10e bcache: check return value from btree_node_alloc_replacement()
    4241b51f3ef8 dm-delay: fix a race between delay_presuspend and delay_bio
    c4d395751079 hv_netvsc: Mark VF as slave before exposing it to user-mode
    5dd83db613be hv_netvsc: Fix race of register_netdevice_notifier and VF register
    e8ef65c17460 hv_netvsc: fix race of netvsc and VF register_netdevice
    043c8e0306e2 USB: serial: option: add Luat Air72*U series products
    dc96fde8fcb2 s390/dasd: protect device queue against concurrent access
    b964a0a3910b io_uring/fs: consider link->flags when getting path for LINKAT
    12f497158900 bcache: fixup multi-threaded bch_sectors_dirty_init() wake-up race
    fa9bacc1d5d6 md: fix bi_status reporting in md_end_clone_io
    415f644b1f59 bcache: replace a mistaken IS_ERR() by IS_ERR_OR_NULL() in btree_gc_coalesce()
    354d162ba527 swiotlb-xen: provide the "max_mapping_size" method
    05591c0d1761 ACPI: resource: Skip IRQ override on ASUS ExpertBook B1402CVA
    1ed904f424d4 arm64: dts: imx8mn-var-som: add 20ms delay to ethernet regulator enable
    5d9ddbf4b5e7 NFSD: Fix checksum mismatches in the duplicate reply cache
    b597f3c85d2e NFSD: Fix "start of NFS reply" pointer passed to nfsd_cache_update()
    d7eb37615b93 ext4: make sure allocate pending entry not fail
    8384d8c5cc39 ext4: fix slab-use-after-free in ext4_es_insert_extent()
    9164978bce49 ext4: using nofail preallocation in ext4_es_insert_extent()
    614b383d0158 ext4: using nofail preallocation in ext4_es_insert_delayed_block()
    51cef2a5c6f9 ext4: using nofail preallocation in ext4_es_remove_extent()
    f1c236936674 ext4: use pre-allocated es in __es_remove_extent()
    ce581f8631a4 ext4: use pre-allocated es in __es_insert_extent()
    594a5f00e50c ext4: factor out __es_alloc_extent() and __es_free_extent()
    9381ff651224 ext4: add a new helper to check if es must be kept
    3a14f4fd7bda media: qcom: camss: Fix genpd cleanup
    df5bb7b408cc media: qcom: camss: Fix V4L2 async notifier error path
    fdfcdf969719 media: qcom: Initialise V4L2 async notifier later
    153a4396c304 media: camss: Convert to platform remove callback returning void
    4ae3c85e7369 media: camss: Split power domain management
    8bdcaa7c03f6 MIPS: KVM: Fix a build warning about variable set but not used
    e9c3d6b09c21 cifs: fix leak of iface for primary channel
    b24d42b52bd1 cifs: account for primary channel in the interface list
    548893404c44 cifs: distribute channels across interfaces based on speed
    5607a415d49c cifs: print last update time for interface list
    f4dff371119b smb3: allow dumping session and tcon id to improve stats analysis and debugging
    fbc666a9ac5a cifs: minor cleanup of some headers
    c2d336140a10 lockdep: Fix block chain corruption
    e9611e840431 USB: dwc3: qcom: fix ACPI platform device leak
    eaa315288b32 USB: dwc3: qcom: fix resource leaks on probe deferral
    0e485f12ebb7 nvmet: nul-terminate the NQNs passed in the connect command
    573fa2b70808 i40e: Fix adding unsupported cloud filters
    f7f3e69cedb9 i40e: use ERR_PTR error print in i40e messages
    27f5dd22af56 arm64: mm: Fix "rodata=on" when CONFIG_RODATA_FULL_DEFAULT_ENABLED=y
    558b8ee45f7f mm,kfence: decouple kfence from page granularity mapping judgement
    48b3ee0134db afs: Fix file locking on R/O volumes to operate in local mode
    f9cf17836ec3 afs: Return ENOENT if no cell DNS record can be found
    8025fd0706c8 net: axienet: Fix check for partial TX checksum
    3481ff38118c amd-xgbe: propagate the correct speed and duplex status
    73d114dd5703 amd-xgbe: handle the corner-case during tx completion
    4bcc07bb360e amd-xgbe: handle corner-case during sfp hotplug
    76b088b63958 octeontx2-pf: Fix ntuple rule creation to direct packet to VF with higher Rx queue than its PF
    97703eb199a3 arm/xen: fix xen_vcpu_info allocation alignment
    94a0ae698b4d net/smc: avoid data corruption caused by decline
    a573b334be26 net: usb: ax88179_178a: fix failed operations during ax88179_reset
    e784313dd00a ipv4: Correct/silence an endian warning in __ip_do_redirect
    377c4c7e97c6 HID: fix HID device resource race between HID core and debugging support
    8e9a64996528 drm/rockchip: vop: Fix color for RGB888/BGR888 format on VOP full
    84a6e475451d drm/i915: do not clean GT table on error path
    84c9d30dbc0e ata: pata_isapnp: Add missing error check for devm_ioport_map()
    cfbdb367277e octeontx2-pf: Fix memory leak during interface down
    4206f46d3f04 wireguard: use DEV_STATS_INC()
    7dfa5147444f drm/panel: simple: Fix Innolux G101ICE-L01 timings
    7f5eae8585c8 drm/panel: simple: Fix Innolux G101ICE-L01 bus flags
    39f11604e55d drm/panel: auo,b101uan08.3: Fine tune the panel power sequence
    84b232a9c81b drm/panel: boe-tv101wum-nl6: Fine tune the panel power sequence
    d2b3bc8c7f63 afs: Make error on cell lookup failure consistent with OpenAFS
    790ea5bc4022 afs: Fix afs_server_list to be cleaned up with RCU
    6ac30d748bb0 Linux 6.1.64
    04ff8a5107a5 RISC-V: drop error print from riscv_hartid_to_cpuid()
    9e1e0887ea21 cxl/port: Fix NULL pointer access in devm_cxl_add_port()
    c88cfbb18a5e mmc: sdhci-pci-gli: GL9755: Mask the replay timer timeout of AER
    2132941b453f Input: xpad - add VID for Turtle Beach controllers
    2fa74d29fc18 tracing: Have trace_event_file have ref counters
    6460508dce00 powerpc/powernv: Fix fortify source warnings in opal-prd.c
    4c55be085534 drm/amd/display: Change the DMCUB mailbox memory location from FB to inbox
    68d774eb10e2 drm/amd/display: Enable fast plane updates on DCN3.2 and above
    fb5c134ca589 drm/amd/display: fix a NULL pointer dereference in amdgpu_dm_i2c_xfer()
    51ffa1a3792e drm/amdgpu: lower CS errors to debug severity
    c52aac5884bc drm/amdgpu: fix error handling in amdgpu_bo_list_get()
    2ab6c1237bd4 drm/amdgpu: don't use ATRM for external devices
    965dce07a4fc drm/amdgpu: don't use pci_is_thunderbolt_attached()
    8e54a91d3e66 drm/amdgpu/smu13: drop compute workload workaround
    454d0cdd7c12 drm/amd/pm: Fix error of MACO flag setting code
    07e94f204f38 drm/i915: Fix potential spectre vulnerability
    9457636a4926 drm/i915: Bump GLK CDCLK frequency when driving multiple pipes
    e973f40de161 drm/amd/pm: Handle non-terminated overdrive commands.
    dc4542861ec8 ext4: properly sync file size update after O_SYNC direct IO
    e1d0f68bc07f ext4: add missed brelse in update_backups
    1793dc461e5a ext4: remove gdb backup copy for meta bg in setup_new_flex_group_blocks
    80ddcf21e7e0 ext4: correct the start block of counting reserved clusters
    ec4ba3d62f0f ext4: correct return value of ext4_convert_meta_bg
    32b9fb9a67ec ext4: mark buffer new if it is unwritten to avoid stale data exposure
    f0cc1368fafd ext4: correct offset of gdb backup in non meta_bg group to update_backups
    af075d06b34f ext4: apply umask if ACL support is disabled
    e795a56654fd Revert "net: r8169: Disable multicast filter for RTL8168H and RTL8107E"
    eb2f435be2c4 media: qcom: camss: Fix csid-gen2 for test pattern generator
    eeab07ddd020 media: qcom: camss: Fix invalid clock enable bit disjunction
    18a06f2eeb84 media: qcom: camss: Fix missing vfe_lite clocks check
    ddc424aedbd3 media: qcom: camss: Fix VFE-480 vfe_disable_output()
    0f3e5f93fe77 media: qcom: camss: Fix VFE-17x vfe_disable_output()
    04ef31a3e38a media: qcom: camss: Fix vfe_get() error jump
    3166c3af55fe media: qcom: camss: Fix pm_domain_on sequence in probe
    6dcb2605c284 mmc: sdhci-pci-gli: GL9750: Mask the replay timer timeout of AER
    f7164cb0371f r8169: add handling DASH when DASH is disabled
    862565f32494 r8169: fix network lost after resume on DASH systems
    9e9e2107ae36 mptcp: fix setsockopt(IP_TOS) subflow locking
    dba6f08cef19 mptcp: add validity check for sending RM_ADDR
    70ff9b65a728 mptcp: deal with large GSO size
    16fcda24b175 mm: kmem: drop __GFP_NOFAIL when allocating objcg vectors
    a7fd03355027 mm: fix for negative counter: nr_file_hugepages
    2594bdaa16b4 mmc: sdhci-pci-gli: A workaround to allow GL9750 to enter ASPM L1.2
    97fb6013f318 riscv: kprobes: allow writing to x0
    645257ad8d30 riscv: correct pt_level name via pgtable_l5/4_enabled
    fb1b16f04135 riscv: mm: Update the comment of CONFIG_PAGE_OFFSET
    9f74b261e4e2 LoongArch: Mark __percpu functions as always inline
    1bb61fb7908c nfsd: fix file memleak on client_opens_release
    a5d4be493afc dm-verity: don't use blocking calls from tasklets
    002d2473ddec drm/mediatek/dp: fix memory leak on ->get_edid callback error path
    5e9fcba176f9 drm/mediatek/dp: fix memory leak on ->get_edid callback audio detection
    e08232647386 media: ccs: Correctly initialise try compose rectangle
    424fc4638119 media: venus: hfi: add checks to handle capabilities from firmware
    9ebb3c14ec95 media: venus: hfi: fix the check to handle session buffer requirement
    a3e0b55deaf7 media: venus: hfi_parser: Add check to keep the number of codecs within range
    997639c100fa media: sharp: fix sharp encoding
    41c269083c4d media: lirc: drop trailing space from scancode transmit
    526dd7540a09 f2fs: avoid format-overflow warning
    6122b72ce54a f2fs: do not return EFSCORRUPTED, but try to run online repair
    e6fa9ac60fae i2c: i801: fix potential race in i801_block_transaction_byte_by_byte
    f5617a21c71c net: phylink: initialize carrier state at creation
    105d29fa8dba net: dsa: lan9303: consequently nested-lock physical MDIO
    eef592e71ae1 net: ethtool: Fix documentation of ethtool_sprintf()
    57e35d922996 s390/ap: fix AP bus crash on early config change callback invocation
    75d5c85cf402 i2c: designware: Disable TX_EMPTY irq while waiting for block length byte
    ba1a9eef3e53 sbsa_gwdt: Calculate timeout with 64-bit math
    cfcb1e7c17c3 lsm: fix default return value for inode_getsecctx
    7a048a90ac3e lsm: fix default return value for vm_enough_memory
    b3fd9db79e30 Revert "i2c: pxa: move to generic GPIO recovery"
    677fc3780fa4 Revert ncsi: Propagate carrier gain/loss events to the NCSI controller
    31f6ff62dfc0 cxl/region: Fix x1 root-decoder granularity calculations
    683b6a7324c6 tools/testing/cxl: Define a fixed volatile configuration to parse
    8cdc6b8b816d cxl/mem: Move devm_cxl_add_endpoint() from cxl_core to cxl_mem
    8fce427169ec cxl: Unify debug messages when calling devm_cxl_add_port()
    e841a59ac1d8 i3c: master: svc: fix random hot join failure since timeout error
    a807a44189d1 i3c: master: svc: add NACK check after start byte sent
    90db4c1d5eba cxl/region: Do not try to cleanup after cxl_region_setup_targets() fails
    c415f113d90e cxl/region: Move region-position validation to a helper
    008b08ab0773 cxl/region: Cleanup target list on attach error
    93d242f63ed3 cxl/region: Validate region mode vs decoder mode
    3b70d45c7ea8 drm/amd/display: enable dsc_clk even if dsc_pg disabled
    1d1cc275d1d7 Bluetooth: btusb: Add 0bda:b85b for Fn-Link RTL8852BE
    6c6a39080bd2 Bluetooth: btusb: Add RTW8852BE device 13d3:3570 to device tables
    ba9302fd936c bluetooth: Add device 13d3:3571 to device tables
    fc3423d55c86 bluetooth: Add device 0bda:887b to device tables
    f1c7f81e973f Bluetooth: btusb: Add Realtek RTL8852BE support ID 0x0cb8:0xc559
    1f026218f8a3 clk: visconti: Fix undefined behavior bug in struct visconti_pll_provider
    b2a28287209a clk: visconti: remove unused visconti_pll_provider::regmap
    e785584e0a0b cpufreq: stats: Fix buffer overflow detection in trans_stats()
    c2d14682b36d pmdomain: imx: Make imx pgc power domain also set the fwnode
    8bd370cc3cd6 pmdomain: bcm: bcm2835-power: check if the ASB register is equal to enable
    68620ef460df ALSA: hda/realtek: Add quirks for HP Laptops
    4d50004416df ALSA: hda/realtek: Enable Mute LED on HP 255 G10
    4645d3bcd5ff ALSA: hda/realtek - Enable internal speaker of ASUS K6500ZC
    eaa4e4ba7ace ALSA: hda/realtek - Add Dell ALC295 to pin fall back table
    0fcc2cf28f6c ALSA: hda/realtek: Enable Mute LED on HP 255 G8
    fa7c9cc3cb31 ALSA: info: Fix potential deadlock at disconnection
    a0d43e0f7ce4 btrfs: zoned: wait for data BG to be finished on direct IO allocation
    9ad4c7f065bf xfs: recovery should not clear di_flushiter unconditionally
    209379924a85 cifs: do not reset chan_max if multichannel is not supported at mount
    c9569bfd2868 cifs: force interface update before a fresh session setup
    5bdf34ca3242 cifs: reconnect helper should set reconnect for the right channel
    9eb44db68c5b smb: client: fix potential deadlock when releasing mids
    558817597d5f smb: client: fix use-after-free bug in cifs_debug_data_proc_show()
    49d0ff613f4d smb3: fix caching of ctime on setxattr
    34828baf81ef smb3: fix touch -h of symlink
    9d96ac07aee2 smb3: fix creating FIFOs when mounting with "sfu" mount option
    5691e1569569 fs: add ctime accessors infrastructure
    b50ca24c3ec1 xhci: Enable RPM on controllers that support low-power states
    72a90e7eb4a1 parisc/power: Fix power soft-off when running on qemu
    40b6914f4278 parisc/pgtable: Do not drop upper 5 address bits of physical address
    1651b334f1f6 parisc: Prevent booting 64-bit kernels on PA1.x machines
    3ddb2fa5ec1c i3c: master: svc: fix SDA keep low when polling IBIWON timeout happen
    1ea1fb221662 i3c: master: svc: fix check wrong status register in irq handler
    65d9f61324fc i3c: master: svc: fix ibi may not return mandatory data byte
    e32e9cba564e i3c: master: svc: fix wrong data return when IBI happen during start frame
    3a8e03f133c0 i3c: master: svc: fix race condition in ibi work thread
    de6ca501addc i3c: master: cdns: Fix reading status register
    3b93096d29c5 mtd: cfi_cmdset_0001: Byte swap OTP info
    aee642ae995e mm/memory_hotplug: use pfn math in place of direct struct page manipulation
    5a2768b9de0c mm/cma: use nth_page() in place of direct struct page manipulation
    20412ca356e5 s390/cmma: fix detection of DAT pages
    7fc465d2653a dmaengine: stm32-mdma: correct desc prep when channel running
    55d699e2d2ef mcb: fix error handling for different scenarios when parsing
    afcde812ddf5 driver core: Release all resources during unbind before updating device links
    f7ab9dee2200 tracing: Have the user copy of synthetic event address use correct context
    185f3617adc8 i2c: core: Run atomic i2c xfer when !preemptible
    59cb785919fd kernel/reboot: emergency_restart: Set correct system_state
    4f3135e2dd5b quota: explicitly forbid quota files from being encrypted
    ed3cc4f3cac4 jbd2: fix potential data lost in recovering journal raced with synchronizing fs bdev
    e166cc2bf51f ASoC: codecs: wsa-macro: fix uninitialized stack variables with name prefix
    479a120a043f hid: lenovo: Resend all settings on reset_resume for compact keyboards
    9ea5df7290e5 selftests/resctrl: Reduce failures due to outliers in MBA/MBM tests
    72f5a918b450 selftests/resctrl: Move _GNU_SOURCE define into Makefile
    e6526e403aaf selftests/resctrl: Remove duplicate feature check from CMT test
    3f100cc63a0c netfilter: nf_tables: split async and sync catchall in two functions
    13e2d49647a7 netfilter: nf_tables: remove catchall element in GC sync path
    143f450c6cb2 ima: detect changes to the backing overlay file
    2c63b9d7f7c8 ima: annotate iint mutex to avoid lockdep false positive warnings
    db98de0809f1 mfd: qcom-spmi-pmic: Fix revid implementation
    5231eb119079 mfd: qcom-spmi-pmic: Fix reference leaks in revid helper
    4d259683bc1c arm64: dts: qcom: ipq6018: Fix tcsr_mutex register size
    c754a6f5c3c7 ACPI: FPDT: properly handle invalid FPDT subtables
    95e747c3c60d firmware: qcom_scm: use 64-bit calling convention only when client is 64-bit
    cd222fc61e12 arm64: dts: qcom: ipq8074: Fix hwlock index for SMEM
    e866ef947a65 btrfs: don't arbitrarily slow down delalloc if we're committing
    ddf42b7c8d81 rcu: kmemleak: Ignore kmemleak false positives when RCU-freeing objects
    d15029481813 PM: hibernate: Clean up sync_read handling in snapshot_write_next()
    567c6f64950e PM: hibernate: Use __get_safe_page() rather than touching the list
    2c9222b7dc58 arm64: dts: qcom: ipq6018: Fix hwlock index for SMEM
    8d837850d3ec rcu/tree: Defer setting of jiffies during stall reset
    6aa3cab6be11 svcrdma: Drop connection after an RDMA Read error
    4b0d6ddb6466 wifi: wilc1000: use vmm_table as array in wilc struct
    efd8e6d19c14 PCI: exynos: Don't discard .remove() callback
    75bf9a8b0e89 PCI: kirin: Don't discard .remove() callback
    e02b9c6a832e PCI/ASPM: Fix L1 substate handling in aspm_attr_store_common()
    51dcd20a4a25 mmc: Add quirk MMC_QUIRK_BROKEN_CACHE_FLUSH for Micron eMMC Q2J54A
    07d425242e4f mmc: sdhci_am654: fix start loop index for TAP value parsing
    4542aa756914 mmc: vub300: fix an error code
    8387c94d73ec ksmbd: fix slab out of bounds write in smb_inherit_dacl()
    482aaa72f950 ksmbd: handle malformed smb1 message
    8e76941a1672 clk: qcom: ipq6018: drop the CLK_SET_RATE_PARENT flag from PLL clocks
    877080a34901 clk: qcom: ipq8074: drop the CLK_SET_RATE_PARENT flag from PLL clocks
    3291d3ecf331 clk: socfpga: Fix undefined behavior bug in struct stratix10_clock_data
    ea2c6e85b6b0 parisc/power: Add power soft-off when running on qemu
    783645be98c8 parisc/pdc: Add width field to struct pdc_model
    ef0224ee5399 arm64: Restrict CPU_BIG_ENDIAN to GNU as or LLVM IAS 15.x or newer
    938c4c731803 PCI: keystone: Don't discard .probe() callback
    b7d27cbfef5c PCI: keystone: Don't discard .remove() callback
    fe0b2a20f780 KEYS: trusted: Rollback init_trusted() consistently
    454ad98f31f0 KEYS: trusted: tee: Refactor register SHM usage
    3ef9944681eb genirq/generic_chip: Make irq_remove_generic_chip() irqdomain aware
    17381882fcce mmc: meson-gx: Remove setting of CMD_CFG_ERROR
    0cf7577b6b31 wifi: ath11k: fix gtk offload status event locking
    e3199b3fac65 wifi: ath11k: fix htt pktlog locking
    ca420ac4f945 wifi: ath11k: fix dfs radar event locking
    f0ea9e472611 wifi: ath11k: fix temperature event locking
    164fa9a0b1e9 regmap: Ensure range selector registers are updated after cache sync
    e10facbd25a6 ACPI: resource: Do IRQ override on TongFang GMxXGxx
    08a98c345f62 mm/damon/sysfs: check error from damon_sysfs_update_target()
    b0fc14428ca2 mm/damon: implement a function for max nr_accesses safe calculation
    834a800c58ea mm/damon/ops-common: avoid divide-by-zero during region hotness calculation
    2b38f0dbe8ba mm/damon/lru_sort: avoid divide-by-zero in hot threshold calculation
    cf2641099c02 watchdog: move softlockup_panic back to early_param
    f0f3328af912 mm/damon/sysfs: update monitoring target regions for online input commit
    9275f65d7729 mm/damon/sysfs: remove requested targets when online-commit inputs
    4e0fbf318803 PCI/sysfs: Protect driver's D3cold preference from user space
    1a2c7a2f3594 hvc/xen: fix event channel handling for secondary consoles
    b772e415e168 hvc/xen: fix error path in xen_hvc_init() to always register frontend driver
    74db59e63bd8 hvc/xen: fix console unplug
    e5b0e2308088 tty: serial: meson: fix hard LOCKUP on crtscts mode
    5e3b2141c759 tty/sysrq: replace smp_processor_id() with get_cpu()
    5b2352c64c48 proc: sysctl: prevent aliased sysctls from getting passed to init
    d91fd028c9f6 audit: don't WARN_ON_ONCE(!current->mm) in audit_exe_compare()
    38968c63e98e audit: don't take task_lock() in audit_exe_compare() code path
    43cea54109e1 KVM: x86: Clear bit12 of ICR after APIC-write VM-exit
    27976fa91754 KVM: x86: Ignore MSR_AMD64_TW_CFG access
    7e218114a219 KVM: x86: hyper-v: Don't auto-enable stimer on write from user-space
    41689ef19b7e x86/cpu/hygon: Fix the CPU topology evaluation for real
    f0732c646a8e crypto: x86/sha - load modules based on CPU features
    1fc94de1c1a8 scsi: qla2xxx: Fix system crash due to bad pointer access
    b16ea57d6c0f scsi: megaraid_sas: Increase register read retry rount from 3 to 30 for selected registers
    bb5e307366ef scsi: mpt3sas: Fix loop logic
    dd56d432445e bpf: Fix precision tracking for BPF_ALU | BPF_TO_BE | BPF_END
    947635fa174b bpf: Fix check_stack_write_fixed_off() to correctly spill imm
    3bdbe399b82f randstruct: Fix gcc-plugin performance mode to stay in group
    bee4f891fe1f powerpc/perf: Fix disabling BHRB and instruction sampling
    4cb064f6174a perf intel-pt: Fix async branch flags
    a1d8f675ea58 media: venus: hfi: add checks to perform sanity on queue pointers
    55db76caa782 i915/perf: Fix NULL deref bugs with drm_dbg() calls
    d1a04a5219e8 cifs: fix check of rc in function generate_smb3signingkey
    17cfba4aeb2d cifs: spnego: add ';' in HOST_KEY_LEN
    4b91ba060f2e tools/power/turbostat: Enable the C-state Pre-wake printing
    c5fcba7ff98b tools/power/turbostat: Fix a knl bug
    ca56cdfab3a9 macvlan: Don't propagate promisc change to lower dev in passthru
    f9b592a9e606 net/mlx5e: Check return value of snprintf writing to fw_version buffer for representors
    0ab53cd69ffc net/mlx5e: Check return value of snprintf writing to fw_version buffer
    7f2feab70152 net/mlx5e: Reduce the size of icosq_str
    e2d93cfd1b4f net/mlx5e: Fix pedit endianness
    991ba648983b net/mlx5e: fix double free of encap_header in update funcs
    e8ae37f86368 net/mlx5e: fix double free of encap_header
    7414a28de1b3 net: stmmac: avoid rx queue overrun
    49fb68040326 net: stmmac: fix rx budget limit check
    18a169810cff netfilter: nf_tables: fix pointer math issue in nft_byteorder_eval()
    6a15d971040e netfilter: nf_conntrack_bridge: initialize err to 0
    d179189eec42 af_unix: fix use-after-free in unix_stream_read_actor()
    14b11892a6da net: ethernet: cortina: Fix MTU max setting
    1a1efaed5fc2 net: ethernet: cortina: Handle large frames
    4794b6b16a90 net: ethernet: cortina: Fix max RX frame define
    19554aa901b5 bonding: stop the device in bond_setup_by_slave()
    f84846731b93 ptp: annotate data-race around q->head and q->tail
    ceae93d76a51 xen/events: fix delayed eoi list handling
    ab3e13b35c1a ppp: limit MRU to 64K
    00768b3e90e6 net: mvneta: fix calls to page_pool_get_stats
    1e83edbc422b tipc: Fix kernel-infoleak due to uninitialized TLV value
    a28ec8322dd3 net: hns3: fix VF wrong speed and duplex issue
    55d82e092c68 net: hns3: fix VF reset fail issue
    f47c6fba7293 net: hns3: fix variable may not initialized problem in hns3_init_mac_addr()
    07f5b8c47152 net: hns3: fix out-of-bounds access may occur when coalesce info is read via debugfs
    83a177b942fa net: hns3: fix incorrect capability bit display for copper port
    5dc440293db7 net: hns3: add barrier in vf mailbox reply process
    61c5ba5042b3 net: hns3: fix add VLAN fail issue
    76bd42849ce4 tty: Fix uninit-value access in ppp_sync_receive()
    732a67ca4368 ipvlan: add ipvlan_route_v6_outbound() helper
    12af02d24a49 net: set SOCK_RCU_FREE before inserting socket into hashtable
    c0f8b8fb7df9 vhost-vdpa: fix use after free in vhost_vdpa_probe()
    58278cc71d34 gfs2: Silence "suspicious RCU usage in gfs2_permission" warning
    7749fd2dbef7 SUNRPC: Fix RPC client cleaned up the freed pipefs dentries
    af0095a559f4 NFSv4.1: fix SP4_MACH_CRED protection for pnfs IO
    19d7dbf71ecc SUNRPC: Add an IS_ERR() check back to where it was
    c65b915641d8 NFSv4.1: fix handling NFS4ERR_DELAY when testing for session trunking
    5ee813da0c18 mtd: rawnand: meson: check return value of devm_kasprintf()
    b2a9ba69dfd5 mtd: rawnand: intel: check return value of devm_kasprintf()
    8d02b6fb3c67 SUNRPC: ECONNRESET might require a rebind
    11f6aadd1f59 sched/core: Optimize in_task() and in_interrupt() a bit
    3a6ad749e9ef wifi: iwlwifi: Use FW rate for non-data frames
    2fa178e2cd5f mtd: rawnand: tegra: add missing check for platform_get_irq()
    1fb3a9c59e7f pwm: Fix double shift bug
    6586b5f8e456 drm/amdgpu: fix software pci_unplug on some chips
    8a1552e908d6 ALSA: hda/realtek: Add quirk for ASUS UX7602ZM
    07ab6615a9d2 drm/qxl: prevent memory leak
    09297e3ffc1d ASoC: ti: omap-mcbsp: Fix runtime PM underflow warnings
    aff8be2cad74 i2c: dev: copy userspace array safely
    72d02adae320 kgdb: Flush console before entering kgdb on panic
    8a06894666e0 drm/amd/display: Avoid NULL dereference of timing generator
    b083aaf5db2e media: imon: fix access to invalid resource for the second interface
    65335aef1ab6 media: ccs: Fix driver quirk struct documentation
    b8dcbbd0c4bf media: cobalt: Use FIELD_GET() to extract Link Width
    e2ccedd4d182 gfs2: fix an oops in gfs2_permission
    53fc16c1ad84 gfs2: ignore negated quota changes
    329a8d1d60ba media: vivid: avoid integer overflow
    a647f27a7426 media: gspca: cpia1: shift-out-of-bounds in set_flicker
    e64d23dc6581 i3c: master: mipi-i3c-hci: Fix a kernel panic for accessing DAT_data.
    472bd4787406 virtio-blk: fix implicit overflow on virtio_max_dma_size
    32b17bc21f8e i2c: sun6i-p2wi: Prevent potential division by zero
    0b5e729d4e35 i2c: fix memleak in i2c_new_client_device()
    8be39f66915b i3c: mipi-i3c-hci: Fix out of bounds access in hci_dma_irq_handler
    07c11a5249cb 9p: v9fs_listxattr: fix %s null argument warning
    3851d844d790 9p/trans_fd: Annotate data-racy writes to file::f_flags
    c7b0ce54b11d usb: gadget: f_ncm: Always set current gadget in ncm_bind()
    ff9500758381 f2fs: fix error handling of __get_node_page
    a82bd79cbfe9 soundwire: dmi-quirks: update HP Omen match
    7932afa9bb61 usb: dwc3: core: configure TX/RX threshold for DWC3_IP
    7cebc86481bf tty: vcc: Add check for kstrdup() in vcc_probe()
    d6957635de8f thunderbolt: Apply USB 3.x bandwidth quirk only in software connection manager
    b80aaff5f781 iio: adc: stm32-adc: harden against NULL pointer deref in stm32_adc_probe()
    c92de3bf6ccf mfd: intel-lpss: Add Intel Lunar Lake-M PCI IDs
    b469227b1d1e exfat: support handle zero-size directory
    24e222a54e4c HID: Add quirk for Dell Pro Wireless Keyboard and Mouse KM5221W
    4ee3b3a0ff02 crypto: hisilicon/qm - prevent soft lockup in receive loop
    a70cb0d59d91 ASoC: Intel: soc-acpi-cht: Add Lenovo Yoga Tab 3 Pro YT3-X90 quirk
    cbf304de78c0 PCI: Use FIELD_GET() in Sapphire RX 5600 XT Pulse quirk
    52cd51ba5769 misc: pci_endpoint_test: Add Device ID for R-Car S4-8 PCIe controller
    6f9557a5c971 PCI: Disable ATS for specific Intel IPU E2000 devices
    161767bb7c5d PCI: Extract ATS disabling to a helper function
    6b4608458205 PCI: Use FIELD_GET() to extract Link Width
    442fd24d7b6b scsi: libfc: Fix potential NULL pointer dereference in fc_lport_ptp_setup()
    dabc0ee84d0d PCI: Do error check on own line to split long "if" conditions
    146badf18e2c atm: iphase: Do PCI error checks on own line
    1a7c3d2e1dfa PCI: mvebu: Use FIELD_PREP() with Link Width
    aac90c719781 PCI: tegra194: Use FIELD_GET()/FIELD_PREP() with Link Width fields
    43b91df291c8 ALSA: hda: Fix possible null-ptr-deref when assigning a stream
    fa7abd3c5cd4 ARM: 9320/1: fix stack depot IRQ stack filter
    6e2076cad887 HID: lenovo: Detect quirk-free fw on cptkbd and stop applying workaround
    8c68af2af697 jfs: fix array-index-out-of-bounds in diAlloc
    a50b796d3671 jfs: fix array-index-out-of-bounds in dbFindLeaf
    5013f8269887 fs/jfs: Add validity check for db_maxag and db_agpref
    0cb567e72733 fs/jfs: Add check for negative db_l2nbperpage
    88984ec47927 scsi: ibmvfc: Remove BUG_ON in the case of an empty event pool
    33331b265aac scsi: hisi_sas: Set debugfs_dir pointer to NULL after removing debugfs
    f1521fe0b411 RDMA/hfi1: Use FIELD_GET() to extract Link Width
    af493dde68e8 ASoC: SOF: ipc4: handle EXCEPTION_CAUGHT notification from firmware
    c55fc098fd9d crypto: pcrypt - Fix hungtask for PADATA_RESET
    62c65e799fb4 ASoC: SOF: Pass PCI SSID to machine driver
    14107cbeb5f7 ASoC: soc-card: Add storage for PCI SSID
    0aaf8077564e selftests/efivarfs: create-read: fix a resource leak
    c68535657f3c arm64: dts: ls208xa: use a pseudo-bus to constrain usb dma size
    6c1b3d89a2dd drm/amdgpu: Fix a null pointer access when the smc_rreg pointer is NULL
    2806f8803792 drm/amdkfd: Fix shift out-of-bounds issue
    7017e835007c drm/panel: st7703: Pick different reset sequence
    33fb1a555354 drm/amdgpu/vkms: fix a possible null pointer dereference
    16fa59e273f8 drm/radeon: fix a possible null pointer dereference
    d0bc9ab0a161 drm/panel/panel-tpo-tpg110: fix a possible null pointer dereference
    79813cd59398 drm/panel: fix a possible null pointer dereference
    9b70fc7d70e8 drm/amdgpu: Fix potential null pointer derefernce
    d0725232da77 drm/amd: Fix UBSAN array-index-out-of-bounds for Polaris and Tonga
    fc9ac0e8e0bc drm/amd: Fix UBSAN array-index-out-of-bounds for SMU7
    09b900fc2cb1 drm/msm/dp: skip validity check for DP CTS EDID checksum
    412ce8966934 drm: vmwgfx_surface.c: copy user-array safely
    0f5f56745188 drm_lease.c: copy user-array safely
    6995df256e4f kernel: watch_queue: copy user-array safely
    8332523b13db kernel: kexec: copy user-array safely
    2fabc3289ba1 string.h: add array-wrappers for (v)memdup_user()
    24faa2740b3f drm/amd/display: use full update for clip size increase of large plane source
    09d4f579d300 drm/amd: Update `update_pcie_parameters` functions to use uint8_t arguments
    50f35a907c4f drm/amdkfd: Fix a race condition of vram buffer unref in svm code
    5b978a8ce497 drm/amdgpu: not to save bo in the case of RAS err_event_athub
    0c8eda600ed8 drm/komeda: drop all currently held locks if deadlock happens
    4048cf4615b6 drm/gma500: Fix call trace when psb_gem_mm_init() fails
    a57a54a8bc21 platform/x86: thinkpad_acpi: Add battery quirk for Thinkpad X120e
    6edd5ea5040b platform/chrome: kunit: initialize lock for fake ec_dev
    c90c7bf7b1b3 tsnep: Fix tsnep_request_irq() format-overflow warning
    70997012d8dd ACPI: EC: Add quirk for HP 250 G7 Notebook PC
    87624b1f9b78 Bluetooth: Fix double free in hci_conn_cleanup
    a556f2ef556a Bluetooth: btusb: Add date->evt_skb is NULL check
    0a40c609e2a3 bpf: Ensure proper register state printing for cond jumps
    8093dd759ee2 vsock: read from socket's error queue
    459970363e7c wifi: ath10k: Don't touch the CE interrupt registers after power up
    1c6a6c926abf net: annotate data-races around sk->sk_dst_pending_confirm
    e7960d2a09d4 net: annotate data-races around sk->sk_tx_queue_mapping
    46537b45972e wifi: ath10k: fix clang-specific fortify warning
    de979982ebfb wifi: ath9k: fix clang-specific fortify warnings
    aa42a7cb9264 bpf: Detect IP == ksym.end as part of BPF program
    57e44ff9c2c9 atl1c: Work around the DMA RX overflow issue
    2be24c47ac19 wifi: mac80211: don't return unset power in ieee80211_get_tx_power()
    9c2e4a81d3e7 wifi: mac80211_hwsim: fix clang-specific fortify warning
    d0fc4cb9d23b wifi: plfxlc: fix clang-specific fortify warning
    b5046b253236 x86/mm: Drop the 4 MB restriction on minimal NUMA node memory size
    2652d199dd72 workqueue: Provide one lock class key per work_on_cpu() callsite
    3410b7023547 cpu/hotplug: Don't offline the last non-isolated CPU
    b7441453ff96 smp,csd: Throw an error if a CSD lock is stuck for too long
    6680d55aba60 clocksource/drivers/timer-atmel-tcb: Fix initialization on SAM9 hardware
    ff8370a0d8cb clocksource/drivers/timer-imx-gpt: Fix potential memory leak
    9f4c391dc2bc selftests/lkdtm: Disable CONFIG_UBSAN_TRAP in test config
    e9a27fdce56b srcu: Fix srcu_struct node grpmask overflow on 64-bit systems
    9ce4e87a8efd perf/core: Bail out early if the request AUX area is out of bound
    784d01f9bbc2 lib/generic-radix-tree.c: Don't overflow in peek()
    c56df79d6867 locking/ww_mutex/test: Fix potential workqueue corruption
    69e434a1cb21 Linux 6.1.63
    830c11c9c085 virtio/vsock: fix header length on skb merging
    cd12535b97dd virtio/vsock: Fix uninit-value in virtio_transport_recv_pkt()
    a6650e78c428 virtio/vsock: fix leaks due to missing skb owner
    bb1c9a5907d2 vsock/loopback: use only sk_buff_head.lock to protect the packet queue
    1e5f00e9dbdb virtio/vsock: don't drop skbuff on copy failure
    883a3db2212c virtio/vsock: remove redundant 'skb_pull()' call
    5852a2b573f7 virtio/vsock: don't use skbuff state to account credit
    25bc87768cef wifi: cfg80211: fix kernel-doc for wiphy_delayed_work_flush()
    fc3a19543e32 btrfs: use u64 for buffer sizes in the tree search ioctls
    c606c43ab6a7 Revert "mmc: core: Capture correct oemid-bits for eMMC cards"
    acca43d813bb x86/amd_nb: Use Family 19h Models 60h-7Fh Function 4 IDs
    129debbb4178 io_uring/net: ensure socket is marked connected on connect retry
    b80b85f4945d tracing/kprobes: Fix the order of argument descriptions
    28e7153418b1 fbdev: fsl-diu-fb: mark wr_reg_wa() static
    7bc7b82fb219 fbdev: imsttfb: fix a resource leak in probe
    985845828220 fbdev: imsttfb: Fix error path of imsttfb_probe()
    6d53668c438b spi: spi-zynq-qspi: add spi-mem to driver kconfig dependencies
    b4843bf39d9f ASoC: dapm: fix clock get name
    f5350c6f7887 ASoC: hdmi-codec: register hpd callback on component probe
    acc36089bc36 ASoC: mediatek: mt8186_mt6366_rt1019_rt5682s: trivial: fix error messages
    3bbf06efb8ed drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE
    3df98bd31966 RISC-V: Don't fail in riscv_of_parent_hartid() for disabled HARTs
    587e6308d69b netfilter: nat: fix ipv6 nat redirect with mapped and scoped addresses
    8fa280d1a9f4 netfilter: nft_redir: use `struct nf_nat_range2` throughout and deduplicate eval call-backs
    d85670128f24 netfilter: xt_recent: fix (increase) ipv6 literal buffer length
    7ee2070589d2 i2c: iproc: handle invalid slave state
    b5974b0c893c r8169: respect userspace disabling IFF_MULTICAST
    1fecefb0920c vsock/virtio: remove socket from connected/bound list on shutdown
    baddcc2c7157 virtio/vsock: replace virtio_vsock_pkt with sk_buff
    46c541fa6680 blk-core: use pr_warn_ratelimited() in bio_check_ro()
    4e9b3ec84dc9 nbd: fix uaf in nbd_open
    b0310063d4b2 tg3: power down device only on SYSTEM_POWER_OFF
    2dbafb0081d7 nvme: fix error-handling for io_uring nvme-passthrough
    f4277cb5626b net/smc: put sk reference if close work was canceled
    2d563aa75226 net/smc: allow cdc msg send rather than drop it with NULL sndbuf_desc
    9d976cd3e320 net/smc: fix dangling sock under state SMC_APPFINCLOSEWAIT
    4a12fb7d1af6 octeontx2-pf: Free pending and dropped SQEs
    a1e8e68204c8 octeontx2-pf: qos send queues management
    479d344a929b octeontx2-pf: Rename tot_tx_queues to non_qos_queues
    f9c2807e2a7d selftests: pmtu.sh: fix result checking
    490dfbf65191 net: stmmac: xgmac: Enable support for multiple Flexible PPS outputs
    0b8ffe3cb0b7 Fix termination state for idr_for_each_entry_ul()
    7f4a2c296774 net: r8169: Disable multicast filter for RTL8168H and RTL8107E
    db68ac51fe86 dccp/tcp: Call security_inet_conn_request() after setting IPv6 addresses.
    414d36c1178e dccp: Call security_inet_conn_request() after setting IPv4 addresses.
    e129327d80a7 net: page_pool: add missing free_percpu when page_pool_init fail
    a95acc2099b6 octeontx2-pf: Fix holes in error code
    00376cc74347 octeontx2-pf: Fix error codes
    612c22e92848 inet: shrink struct flowi_common
    89d92e4fc5c6 bpf: Check map->usercnt after timer->timer is assigned
    4c731e98fe4d tipc: Change nla_policy for bearer-related names to NLA_NUL_STRING
    6086258bd5ea hsr: Prevent use after free in prp_create_tagged_frame()
    f980e9a57dfb llc: verify mac len before reading mac header
    8803da01fe1b watchdog: ixp4xx: Make sure restart always works
    7082b1fb5321 Input: synaptics-rmi4 - fix use after free in rmi_unregister_function()
    f8225c3c6555 pwm: brcmstb: Utilize appropriate clock APIs in suspend/resume
    679d2ab67e09 pwm: sti: Reduce number of allocations and drop usage of chip_data
    713629765f25 regmap: prevent noinc writes from clobbering cache
    7ec7b7d3f2b8 media: cec: meson: always include meson sub-directory in Makefile
    103c66dcf54e media: dvb-usb-v2: af9035: fix missing unlock
    39c2ec94a829 media: cadence: csi2rx: Unregister v4l2 async notifier
    76d12296ee58 media: cedrus: Fix clock/reset sequence
    a254ee1ddc59 media: vidtv: mux: Add check and kfree for kstrdup
    5c26aae37239 media: vidtv: psi: Add check for kstrdup
    e7c96f4605d9 media: s3c-camif: Avoid inappropriate kfree()
    1620531a3dac media: mtk-jpegenc: Fix bug in JPEG encode quality selection
    b75fb8a2ee1e media: amphion: handle firmware debug message
    20568d06f606 media: bttv: fix use after free error due to btv->timeout timer
    825a7a6a3a5e media: ov5640: Fix a memory leak when ov5640_probe fails
    ba305517a1de media: i2c: max9286: Fix some redundant of_node_put() calls
    a7a8c49dc670 media: ov5640: fix vblank unchange issue when work at dvp mode
    9b1c0aca7fbf media: ov5640: Drop dead code using frame_interval
    6380621de364 media: verisilicon: Do not enable G2 postproc downscale if source is narrower than destination
    64f55cebb433 media: hantro: Check whether reset op is defined before use
    f258fd94abcd pcmcia: ds: fix possible name leak in error path in pcmcia_device_add()
    7c9947693b5e pcmcia: ds: fix refcount leak in pcmcia_device_add()
    fbdf451e7683 pcmcia: cs: fix possible hung task and memory leak pccardd()
    f9e17bce0aec rtc: pcf85363: fix wrong mask/val parameters in regmap_update_bits call
    b4dda701d057 virt: sevguest: Fix passing a stack buffer as a scatterlist target
    d889b7bc12b5 x86/sev: Change snp_guest_issue_request()'s fw_err argument
    a5b03f56d38d crypto: ccp - Name -1 return value as SEV_RET_NO_FW_CALL
    7c7371b41a14 cxl/mem: Fix shutdown order
    174ae0a3b89e i3c: Fix potential refcount leak in i3c_master_register_new_i3c_devs
    b9793c9c0338 9p/net: fix possible memory leak in p9_check_errors()
    8b184ebff60b perf hist: Add missing puts to hist__account_cycles
    8e1f41a853d9 perf machine: Avoid out of bounds LBR memory read
    209f4a67d8b7 usb: host: xhci-plat: fix possible kernel oops while resuming
    071666451e59 xhci: Loosen RPM as default policy to cover for AMD xHC 1.1
    abdd1f47efae powerpc/pseries: fix potential memory leak in init_cpu_associativity()
    257517c00b57 powerpc/imc-pmu: Use the correct spinlock initializer.
    8409ee076d0a powerpc/vas: Limit open window failure messages in log bufffer
    0f8dabe79a98 powerpc/xive: Fix endian conversion size
    b4bc030af7d6 powerpc/40x: Remove stale PTE_ATOMIC_UPDATES macro
    a204f9f3cb66 modpost: fix ishtp MODULE_DEVICE_TABLE built on big-endian host
    339148f78641 modpost: fix tee MODULE_DEVICE_TABLE built on big-endian host
    9d4f7441cddd powerpc: Only define __parse_fpscr() when required
    4a43be67d635 interconnect: qcom: sm8350: Set ACV enable_mask
    bfc019c7134a interconnect: qcom: sm8350: Retire DEFINE_QBCM
    ccbd1281a2d1 interconnect: qcom: sm8150: Set ACV enable_mask
    d7e501045ef4 interconnect: qcom: sm8150: Retire DEFINE_QBCM
    386a4d6f83fd interconnect: qcom: sm8150: Drop IP0 interconnects
    8979ed70da2f interconnect: move ignore_list out of of_count_icc_providers()
    bf7039825f04 interconnect: qcom: sm6350: Set ACV enable_mask
    d39e3249c04c interconnect: qcom: sm6350: Retire DEFINE_QBCM
    639ee7fbc095 interconnect: qcom: sdm845: Set ACV enable_mask
    808588804587 interconnect: qcom: sdm845: Retire DEFINE_QBCM
    e82d634fdb0d interconnect: qcom: sc8280xp: Set ACV enable_mask
    50e4e1ad3532 interconnect: qcom: sc8180x: Set ACV enable_mask
    673ced6e0178 interconnect: qcom: sc7280: Set ACV enable_mask
    8fe916ff8a84 interconnect: qcom: sc7180: Set ACV enable_mask
    3f884277f995 interconnect: qcom: sc7180: Retire DEFINE_QBCM
    695b3cfe1c28 f2fs: fix to initialize map.m_pblk in f2fs_precache_extents()
    7b863b8bcd67 dmaengine: pxa_dma: Remove an erroneous BUG_ON() in pxad_free_desc()
    2ed67a40ddb6 USB: usbip: fix stub_dev hub disconnect
    dae6fd974773 tools: iio: iio_generic_buffer ensure alignment
    06a1286345ac misc: st_core: Do not call kfree_skb() under spin_lock_irqsave()
    fc968818d547 dmaengine: ti: edma: handle irq_of_parse_and_map() errors
    03984e24db85 usb: chipidea: Simplify Tegra DMA alignment code
    c9095c743bf6 usb: chipidea: Fix DMA overwrite for Tegra
    6b21a2272885 usb: dwc2: fix possible NULL pointer dereference caused by driver concurrency
    0806a6afe155 dmaengine: idxd: Register dsa_bus_type before registering idxd sub-drivers
    1e03a2695995 perf record: Fix BTF type checks in the off-cpu profiling
    1c4eb1bc39d3 pinctrl: renesas: rzg2l: Make reverse order of enable() for disable()
    cd7d804f52c6 livepatch: Fix missing newline character in klp_resolve_symbols()
    f1cda3c5dd4d tty: tty_jobctrl: fix pid memleak in disassociate_ctty()
    fb4251dab3d1 f2fs: compress: fix to avoid redundant compress extension
    9375ea7f2690 f2fs: compress: fix to avoid use-after-free on dic
    071bbc5a669b f2fs: compress: fix deadloop in f2fs_write_cache_pages()
    ec67c83dd59b f2fs: convert f2fs_write_cache_pages() to use filemap_get_folios_tag()
    599befdd7996 filemap: add filemap_get_folios_tag()
    855516cb6e74 perf kwork: Set ordered_events to true in 'struct perf_tool'
    231665cc6ff7 perf kwork: Add the supported subcommands to the document
    16e02976cf37 perf kwork: Fix incorrect and missing free atom in work_push_atom()
    e27c2668ac8a iio: frequency: adf4350: Use device managed functions and fix power down issue.
    550711e007bb perf stat: Fix aggr mode initialization
    6cb0495d3623 apparmor: fix invalid reference on profile->disconnected
    cef064fddee8 apparmor: test: make static symbols visible during kunit testing
    cfce1e26b4c9 kunit: add macro to allow conditionally exposing static symbols to tests
    1d47d1abb4f3 leds: trigger: ledtrig-cpu:: Fix 'output may be truncated' issue for 'cpu'
    4198a7a6efa0 leds: pwm: Don't disable the PWM when the LED should be off
    63cdeb20ee3b leds: turris-omnia: Do not use SMBUS calls
    7d0e60e4ff84 leds: turris-omnia: Drop unnecessary mutex locking
    ce58f479b531 mfd: arizona-spi: Set pdata.hpdet_channel for ACPI enumerated devs
    26b534a3f0f4 dt-bindings: mfd: mt6397: Split out compatible for MediaTek MT6366 PMIC
    90155dfd990d dt-bindings: mfd: mt6397: Add binding for MT6357
    9ac0c0536572 mfd: dln2: Fix double put in dln2_probe
    ee6b91411d3f mfd: core: Ensure disabled devices are skipped without aborting
    f1ed6c4e59f9 mfd: core: Un-constify mfd_cell.of_reg
    437f033e30c8 IB/mlx5: Fix init stage error handling to avoid double free of same QP and UAF
    ad52f21e3dec ASoC: ams-delta.c: use component after check
    3dd998f78cb5 crypto: qat - fix deadlock in backlog processing
    c7c26d0ef5d2 padata: Fix refcnt handling in padata_free_shell()
    980a7fd5e57e ASoC: Intel: Skylake: Fix mem leak when parsing UUIDs fails
    9ee89579e69d HID: logitech-hidpp: Move get_wireless_feature_index() check to hidpp_connect_event()
    cf47abd7d8a1 HID: logitech-hidpp: Revert "Don't restart communication if not necessary"
    8eb1f933ccde HID: logitech-hidpp: Don't restart IO, instead defer hid_connect() only
    7f2ed86dde19 HID: logitech-hidpp: Remove HIDPP_QUIRK_NO_HIDINPUT quirk
    b1736354a7b9 Revert "HID: logitech-hidpp: add a module parameter to keep firmware gestures"
    693baca82d20 sh: bios: Revive earlyprintk support
    35ac8075aea2 hid: cp2112: Fix IRQ shutdown stopping polling for all IRQs on chip
    8a716eb7f8f5 HID: cp2112: Make irq_chip immutable
    cce6785b8401 RDMA/hfi1: Workaround truncation compilation error
    7a22e6fa51c5 scsi: ufs: core: Leave space for '\0' in utf8 desc string
    f9f4a6bdf934 ASoC: fsl: Fix PM disable depth imbalance in fsl_easrc_probe
    002bd3c874da ASoC: SOF: core: Ensure sof_ops_free() is still called when probe never ran.
    fe6efb2d1864 RDMA/hns: The UD mode can only be configured with DCQCN
    1a6806f27e9e RDMA/hns: Add check for SL
    d3a8efb9de59 RDMA/hns: Fix signed-unsigned mixed comparisons
    1000adbac3b2 RDMA/hns: Fix uninitialized ucmd in hns_roce_create_qp_common()
    7c09504c371d RDMA/hns: Fix printing level of asynchronous events
    3d559a5d5db3 IB/mlx5: Fix rdma counter binding for RAW QP
    c0f4144d0dec ASoC: fsl: mpc5200_dma.c: Fix warning of Function parameter or member not described
    4f13eab0e8a1 ext4: move 'ix' sanity check to corrent position
    242ba2e20baf ARM: 9321/1: memset: cast the constant byte to unsigned char
    0a7f9238f3f8 crypto: hisilicon/qm - fix PF queue parameter issue
    07eb93dbe1a7 crypto: hisilicon/qm - split a debugfs.c from qm
    2cec6774fd1e crypto: hisilicon/qm - modify the process of regs dfx
    56785a3a08e5 crypto: hisilicon/qm - delete redundant null assignment operations
    bafb12b629b7 hid: cp2112: Fix duplicate workqueue initialization
    aa804deca1c3 PCI: vmd: Correct PCI Header Type Register's multi-function check
    ed7f07ef84c4 crypto: qat - increase size of buffers
    17c890a887c1 crypto: caam/jr - fix Chacha20 + Poly1305 self test failure
    9857f811e5cd crypto: caam/qi2 - fix Chacha20 + Poly1305 self test failure
    f23859748e3d nd_btt: Make BTT lanes preemptible
    93aa88170cf3 libnvdimm/of_pmem: Use devm_kstrdup instead of kstrdup and check its return value
    4795de8c046e scsi: ibmvfc: Fix erroneous use of rtas_busy_delay with hcall return code
    dc44e3fdb091 crypto: qat - fix unregistration of crypto algorithms
    5e989aeb4022 crypto: qat - extend buffer list interface
    443bde2a4ca6 crypto: qat - generalize crypto request buffers
    380f0a1de227 crypto: qat - change bufferlist logic interface
    2ad909a408d1 crypto: qat - rename bufferlist functions
    61c57bb98680 crypto: qat - relocate bufferlist logic
    e3294cccd818 crypto: qat - ignore subsequent state up commands
    bb55130d024a RDMA/core: Use size_{add,sub,mul}() in calls to struct_size()
    e39b84448ff9 hwrng: geode - fix accessing registers
    3c5c7f926a4b hwrng: bcm2835 - Fix hwrng throughput regression
    0c824b77ad48 crypto: hisilicon/hpre - Fix a erroneous check after snprintf()
    12d2087a7dd9 KEYS: Include linux/errno.h in linux/verification.h
    44dcf6d33e9e ALSA: hda: cs35l41: Undo runtime PM changes at driver exit time
    2d81896fe161 ALSA: hda: cs35l41: Fix unbalanced pm_runtime_get()
    06421269133f ASoC: cs35l41: Undo runtime PM changes at driver exit time
    ab3aa429c8df ASoC: cs35l41: Verify PM runtime resume errors in IRQ handler
    f20c4b0c015c module/decompress: use vmalloc() for gzip decompression workspace
    c8a235583304 selftests/resctrl: Ensure the benchmark commands fits to its array
    02c167c93fe2 selftests/pidfd: Fix ksft print formats
    6b7feafde79c arm64: tegra: Use correct interrupts for Tegra234 TKE
    87367bc3d9b0 arm64: dts: imx8mn: Add sound-dai-cells to micfil node
    fef0af22503f arm64: dts: imx8mm: Add sound-dai-cells to micfil node
    fafaf5a2f313 arm64: dts: imx8qm-ss-img: Fix jpegenc compatible entry
    37658e518958 clk: scmi: Free scmi_clk allocated when the clocks with invalid info are skipped
    db6db0af76f5 ARM: dts: am3517-evm: Fix LED3/4 pinmux
    d43c3e49744c firmware: arm_ffa: Allow the FF-A drivers to use 32bit mode of messaging
    5429ecbb1b8b firmware: arm_ffa: Assign the missing IDR allocation ID to the FFA device
    e0cf8e811f72 arm64: dts: ti: k3-am62a7-sk: Drop i2c-1 to 100Khz
    eccde2dbd93d firmware: ti_sci: Mark driver as non removable
    7efb91501ba2 kunit: Fix missed memory release in kunit_free_suite_set()
    f0ef883cae30 soc: qcom: llcc: Handle a second device without data corruption
    4653225f41ab ARM: dts: qcom: mdm9615: populate vsdcc fixed regulator
    d97268ce08c3 arm64: dts: qcom: apq8016-sbc: Add missing ADV7533 regulators
    7867e1d92622 ARM64: dts: marvell: cn9310: Use appropriate label for spi1 pins
    945f2e4f13f3 arm64: dts: qcom: sdm845-mtp: fix WiFi configuration
    89465723e0f6 arm64: dts: qcom: sm8350: fix pinctrl for UART18
    1a404795c401 arm64: dts: qcom: sm8150: add ref clock to PCIe PHYs
    cd952d43c00d arm64: dts: qcom: sc7280: Add missing LMH interrupts
    03a0a34f04a4 arm64: dts: qcom: msm8992-libra: drop duplicated reserved memory
    4109f7d1a852 arm64: dts: qcom: msm8916: Fix iommu local address range
    389a4aa5e327 arm64: dts: qcom: sc7280: link usb3_phy_wrapper_gcc_usb30_pipe_clk
    426d3c7c72a2 arm64: dts: qcom: sdm845: cheza doesn't support LMh node
    e65c1aa21ba1 ARM: dts: renesas: blanche: Fix typo in GP_11_2 pin name
    b660420f449d perf: hisi: Fix use-after-free when register pmu fails
    104fa6426a8f drivers/perf: hisi_pcie: Check the type first in pmu::event_init()
    c6e00bc30ea1 perf/arm-cmn: Fix DTC domain detection
    28fa550a49e8 perf/arm-cmn: Revamp model detection
    4589403a343b drivers/perf: hisi: use cpuhp_state_remove_instance_nocalls() for hisi_hns3_pmu uninit process
    1e88414e64a2 drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET settings/handling
    025d2ac470a9 clocksource/drivers/arm_arch_timer: limit XGene-1 workaround
    96c3a1830434 drm/msm/dsi: free TX buffer in unbind
    8b072ab6c445 drm/msm/dsi: use msm_gem_kernel_put to free TX buffer
    5671bed3c0c8 xen-pciback: Consider INTx disabled when MSI/MSI-X is enabled
    934747e2f807 xenbus: fix error exit in xenbus_init()
    ace6403e7854 drm/rockchip: Fix type promotion bug in rockchip_gem_iommu_map()
    2836c72e8d60 arm64/arm: xen: enlighten: Fix KPTI checks
    008b2a93c5d7 drm/bridge: lt9611uxc: fix the race in the error path
    af19ebfc6a17 gpu: host1x: Correct allocated size for contexts
    9da019345405 drm/rockchip: cdn-dp: Fix some error handling paths in cdn_dp_probe()
    8045808be1c2 drm/mediatek: Fix iommu fault during crtc enabling
    5d30fedc20ad drm/mediatek: Fix iommu fault by swapping FBs after updating plane state
    32b15fef33e8 io_uring/kbuf: Allow the full buffer id space for provided buffers
    60db638be5f4 io_uring/kbuf: Fix check of BID wrapping in provided buffers
    03e334565d2d drm/amd/display: Bail from dm_check_crtc_cursor if no relevant change
    a99afba394a9 drm/amd/display: Refactor dm_get_plane_scale helper
    896066202757 drm/amd/display: Check all enabled planes in dm_check_crtc_cursor
    9eae81af9243 drm/amdkfd: fix some race conditions in vram buffer alloc/free of svm code
    78e998884d5d drm/bridge: tc358768: Fix tc358768_ns_to_cnt()
    9dbfdf5dcc38 drm/bridge: tc358768: Clean up clock period code
    3ed322a852ed drm/bridge: tc358768: Rename dsibclk to hsbyteclk
    14d546d067fb drm/bridge: tc358768: Use dev for dbg prints, not priv->dev
    4a1c4eff6545 drm/bridge: tc358768: Print logical values, not raw register values
    fb82b3b4acdd drm/bridge: tc358768: Use struct videomode
    e87a3c24ce5a drm/bridge: tc358768: remove unused variable
    1942dc48f482 drm/bridge: tc358768: Fix bit updates
    2fab90bcde42 drm/bridge: tc358768: Fix use of uninitialized variable
    3c0b681ba44b drm/bridge: lt8912b: Add missing drm_bridge_attach call
    5a521f6b68ec drm/bridge: lt8912b: Manually disable HPD only if it was enabled
    7bf0cb8f4028 drm/bridge: lt8912b: Fix crash on bridge detach
    2cfa9dc32c9e drm/bridge: lt8912b: Fix bridge_detach
    45350e5471dc drm/bridge: lt8912b: Add hot plug detection
    2c80c4f0d284 drm: bridge: it66121: Fix invalid connector dereference
    341e79f8aec6 drm/radeon: possible buffer overflow
    2d68194e1a01 drm/rockchip: vop2: Add missing call to crtc reset helper
    bc05621888d9 drm/rockchip: vop2: Don't crash for invalid duplicate_state
    b248ccaabfc1 drm/rockchip: vop: Fix call to crtc reset helper
    ffebe76e5049 drm/rockchip: vop: Fix reset of state in duplicate state crtc funcs
    4d37df40b103 hte: tegra: Fix missing error code in tegra_hte_test_probe()
    a671a41d60d3 hwmon: (sch5627) Disallow write access if virtual registers are locked
    4a3031298295 hwmon: (sch5627) Use bit macros when accessing the control register
    3385632de8ce Revert "hwmon: (sch56xx-common) Add automatic module loading on supported devices"
    581255403a64 Revert "hwmon: (sch56xx-common) Add DMI override table"
    dd06f92fd811 hwmon: (coretemp) Fix potentially truncated sysfs attribute name
    33de53a27060 hwmon: (axi-fan-control) Fix possible NULL pointer dereference
    44a96796d258 platform/x86: wmi: Fix opening of char device
    ae28868bbaec platform/x86: wmi: Fix probe failure when failing to register WMI devices
    7b8d88df171a clk: qcom: config IPQ_APSS_6018 should depend on QCOM_SMEM
    2a18dd653284 clk: mediatek: clk-mt2701: Add check for mtk_alloc_clk_data
    a836efc21ef0 clk: mediatek: clk-mt7629: Add check for mtk_alloc_clk_data
    a540ca0aeae8 clk: mediatek: clk-mt7629-eth: Add check for mtk_alloc_clk_data
    357df1c2f6ac clk: mediatek: clk-mt6797: Add check for mtk_alloc_clk_data
    df1c4a9efa3f clk: mediatek: clk-mt6779: Add check for mtk_alloc_clk_data
    dd1f30d68fa9 clk: mediatek: clk-mt6765: Add check for mtk_alloc_clk_data
    7d022726e384 clk: npcm7xx: Fix incorrect kfree
    cc1c2772c1e1 clk: ti: fix double free in of_ti_divider_clk_setup()
    e4df931fb424 clk: ti: change ti_clk_register[_omap_hw]() API
    cb6c38995f9c clk: keystone: pll: fix a couple NULL vs IS_ERR() checks
    0a3761410965 spi: nxp-fspi: use the correct ioremap function
    cdaa544dc473 clk: linux/clk-provider.h: fix kernel-doc warnings and typos
    a0b3b2cc2d73 clk: renesas: rzg2l: Fix computation formula
    e1809bb19a67 clk: renesas: rzg2l: Use FIELD_GET() for PLL register fields
    e6070f0cdad6 clk: renesas: rzg2l: Trust value returned by hardware
    c823ffba5d00 clk: renesas: rzg2l: Lock around writes to mux register
    77e233880234 clk: renesas: rzg2l: Wait for status bit of SD mux before continuing
    f26a440d0ec1 clk: renesas: rcar-gen3: Extend SDnH divider table
    d72c586809e0 clk: imx: imx8qxp: Fix elcdif_pll clock
    2c2f1fb3f857 clk: imx: imx8mq: correct error handling path
    0e2b08824072 clk: imx: Select MXC_CLK for CLK_IMX8QXP
    5b8d3ea0939c regulator: mt6358: Fail probe on unknown chip ID
    8d20252d96bd clk: qcom: gcc-sm8150: Fix gcc_sdcc2_apps_clk_src
    a588f440c47f clk: qcom: mmcc-msm8998: Fix the SMMU GDSC
    d2ffd85ee356 clk: qcom: mmcc-msm8998: Don't check halt bit on some branch clks
    06a7365e2bd8 clk: qcom: clk-rcg2: Fix clock rate overflow for high parent frequencies
    101c2d257c1f clk: qcom: gcc-msm8996: Remove RPM bus clocks
    5c25f89c00b9 spi: tegra: Fix missing IRQ check in tegra_slink_probe()
    51d4d3cd1836 regmap: debugfs: Fix a erroneous check after snprintf()
    30e77e3ee989 ipvlan: properly track tx_errors
    4836b94e5e38 net: add DEV_STATS_READ() helper
    fae5cc598ee6 ipv6: avoid atomic fragment on GSO packets
    35aff5362693 ACPI: sysfs: Fix create_pnp_modalias() and create_of_modalias()
    1ca7bc1b085f bpf: Fix unnecessary -EBUSY from htab_lock_bucket
    4bb26ec7ed76 Bluetooth: hci_sync: Fix Opcode prints in bt_dev_dbg/err
    6f505a013c85 wifi: iwlwifi: empty overflow queue during flush
    e2be4ab86a4a wifi: iwlwifi: pcie: synchronize IRQs before NAPI
    c56aed37b671 wifi: iwlwifi: call napi_synchronize() before freeing rx/tx queues
    6d88d4b1bb42 tcp: fix cookie_init_timestamp() overflows
    72c23b307173 chtls: fix tp->rcv_tstamp initialization
    2acedc5372ed net: skb_find_text: Ignore patterns extending past 'to'
    d860416236bd selftests: netfilter: test for sctp collision processing in nf_conntrack
    aa0a050c6569 r8169: fix rare issue with broken rx after link-down on RTL8125
    4789d93f94d9 r8169: use tp_to_dev instead of open code
    77ff34a56b69 thermal: core: prevent potential string overflow
    9709c6d7594d netfilter: nf_tables: Drop pointless memset when dumping rules
    100a75d56b0d wifi: wfx: fix case where rates are out of order
    f64a559f2d19 PM / devfreq: rockchip-dfi: Make pmu regmap mandatory
    0d30931f1fa0 can: dev: can_put_echo_skb(): don't crash kernel if can_priv::echo_skb is accessed out of bounds
    76378a8bae09 can: dev: can_restart(): fix race condition between controller restart and netif_carrier_on()
    614d615d495e can: dev: can_restart(): don't crash kernel if carrier is OK
    d5342dafca3c wifi: ath11k: fix Tx power value during active CAC
    8a777b28d7d0 ACPI: video: Add acpi_backlight=vendor quirk for Toshiba Portégé R100
    396ec51b138e ACPI: property: Allow _DSD buffer data only for byte accessors
    75de6a664183 wifi: rtlwifi: fix EDCA limit set by BT coexistence
    14a7e73b28eb tcp_metrics: do not create an entry from tcp_init_metrics()
    52ec0669f457 tcp_metrics: properly set tp->snd_ssthresh in tcp_init_metrics()
    e850efcf2bb0 tcp_metrics: add missing barriers on delete
    586ce1064f66 wifi: ath: dfs_pattern_detector: Fix a memory initialization issue
    ebca9ae926df wifi: mt76: mt7915: fix beamforming availability check
    2b12aebbd324 wifi: mt76: mt7603: improve stuck beacon handling
    c2fd48179cf2 wifi: mt76: mt7603: improve watchdog reset reliablity
    e3c46ce78ddf wifi: mt76: mt7603: rework/fix rx pse hang check
    e01b3400d641 wifi: ath11k: fix boot failure with one MSI vector
    26e301a70d93 wifi: rtw88: debug: Fix the NULL vs IS_ERR() bug for debugfs_create_file()
    365fe12f4529 net: ethernet: mtk_wed: fix EXT_INT_STATUS_RX_FBUF definitions for MT7986 SoC
    d97463c1f390 net: spider_net: Use size_add() in call to struct_size()
    254187a64a30 tipc: Use size_add() in calls to struct_size()
    065cb7ae3f15 tls: Use size_add() in call to struct_size()
    8ae187386420 tls: Only use data field in crypto completion function
    65e65a8b2de4 mlxsw: Use size_mul() in call to struct_size()
    a764c22bbc85 gve: Use size_add() in call to struct_size()
    5dd1344de3e6 tcp: call tcp_try_undo_recovery when an RTOd TFO SYNACK is ACKed
    a08ff0544b92 udp: add missing WRITE_ONCE() around up->encap_rcv
    ec18d7507f9d selftests/bpf: Correct map_fd to data_fd in tailcalls
    3e1d754b5ddf iavf: Fix promiscuous mode configuration flow messages
    42b452960a13 i40e: fix potential memory leaks in i40e_remove()
    36f0004fe5bd wifi: iwlwifi: honor the enable_ini value
    9c6269f5d11f wifi: mac80211: fix # of MSDU in A-MSDU calculation
    cee323e56c13 wifi: mac80211: move sched-scan stop work to wiphy work
    0568d1e8899e wifi: mac80211: move offchannel works to wiphy work
    ef413615197c wifi: mac80211: move scan work to wiphy work
    09915293c302 wifi: mac80211: move radar detect work to wiphy work
    697fb94e3e8d wifi: cfg80211: add flush functions for wiphy work
    36aa50d5782b genirq/matrix: Exclude managed interrupts in irq_matrix_allocated()
    4f834ad0341c string: Adjust strtomem() logic to allow for smaller sources
    63f637309baa pstore/platform: Add check for kstrdup
    0a1dab4a8e3d drivers/clocksource/timer-ti-dm: Don't call clk_get_rate() in stop function
    dbb558160323 x86/boot: Fix incorrect startup_gdt_descr.size
    21c5c3f95f25 x86/sev-es: Allow copy_from_kernel_nofault() in earlier boot
    7807c269cbf4 ACPI/NUMA: Apply SRAT proximity domain to entire CFMWS window
    bf178c8b9c8e x86/numa: Introduce numa_fill_memblks()
    dce53a017ca2 futex: Don't include process MM in futex key on no-MMU
    3c1a20c122bc x86/srso: Fix SBPB enablement for (possible) future fixed HW
    2351c03529b2 writeback, cgroup: switch inodes with dirty timestamps to release dying cgwbs
    bc8e02850a59 vfs: fix readahead(2) on block devices
    8620933c3c53 sched: Fix stop_one_cpu_nowait() vs hotplug
    21f99a5adbc5 objtool: Propagate early errors
    df870d47d2af sched/uclamp: Ignore (util == 0) optimization in feec() when p_util_max = 0
    d77530a1d47f sched/uclamp: Set max_spare_cap_cpu even if max_spare_cap is 0
    b7839197719f iov_iter, x86: Be consistent about the __user tag on copy_mc_to_user()
    42bed989f0ef sched/fair: Fix cfs_rq_is_decayed() on !SMP
    71e3e7830b3e hwmon: (nct6775) Fix incorrect variable reuse in fan_div calculation

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index a9e335a79d..3d9a98b506 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2ebf9ed52d958208ec758b9bd8eb74e9c8f473d0"
-SRCREV_meta ?= "d26f4f3307216e06ee0b74fa9b57b17fba72a988"
+SRCREV_machine ?= "8987c29d0fc5680adf4f3ac89d6c8bd2bc279a53"
+SRCREV_meta ?= "77f0a9eba731b83da9273d1c0d6bb1c3afd9b129"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.62"
+LINUX_VERSION ?= "6.1.65"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 601b66322a..b966797d0b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.62"
+LINUX_VERSION ?= "6.1.65"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9b52a4e842fde2fc6d7bfc163c90ffe0b4af9cc9"
-SRCREV_meta ?= "d26f4f3307216e06ee0b74fa9b57b17fba72a988"
+SRCREV_machine ?= "5d4da9e99880f594ca07d0a68d80d6b830728dc8"
+SRCREV_meta ?= "77f0a9eba731b83da9273d1c0d6bb1c3afd9b129"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 1e8271b5e8..cf65afa922 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "553807cc4b2abe45fcecad38ad424da1af792cb6"
-SRCREV_machine:qemuarm64 ?= "9b52a4e842fde2fc6d7bfc163c90ffe0b4af9cc9"
-SRCREV_machine:qemuloongarch64 ?= "9b52a4e842fde2fc6d7bfc163c90ffe0b4af9cc9"
-SRCREV_machine:qemumips ?= "ab6cbfee4ca2e65c01f4241dd47ca39d602f6d6c"
-SRCREV_machine:qemuppc ?= "9b52a4e842fde2fc6d7bfc163c90ffe0b4af9cc9"
-SRCREV_machine:qemuriscv64 ?= "9b52a4e842fde2fc6d7bfc163c90ffe0b4af9cc9"
-SRCREV_machine:qemuriscv32 ?= "9b52a4e842fde2fc6d7bfc163c90ffe0b4af9cc9"
-SRCREV_machine:qemux86 ?= "9b52a4e842fde2fc6d7bfc163c90ffe0b4af9cc9"
-SRCREV_machine:qemux86-64 ?= "9b52a4e842fde2fc6d7bfc163c90ffe0b4af9cc9"
-SRCREV_machine:qemumips64 ?= "2908340b73bf0421d1bfdf5102deb03bfcfde62e"
-SRCREV_machine ?= "9b52a4e842fde2fc6d7bfc163c90ffe0b4af9cc9"
-SRCREV_meta ?= "d26f4f3307216e06ee0b74fa9b57b17fba72a988"
+SRCREV_machine:qemuarm ?= "c7612f5ac940578eac19971dcfa4f52f25753074"
+SRCREV_machine:qemuarm64 ?= "5d4da9e99880f594ca07d0a68d80d6b830728dc8"
+SRCREV_machine:qemuloongarch64 ?= "5d4da9e99880f594ca07d0a68d80d6b830728dc8"
+SRCREV_machine:qemumips ?= "61a56646314cdf030994524e9b04a89b79e0cb9b"
+SRCREV_machine:qemuppc ?= "5d4da9e99880f594ca07d0a68d80d6b830728dc8"
+SRCREV_machine:qemuriscv64 ?= "5d4da9e99880f594ca07d0a68d80d6b830728dc8"
+SRCREV_machine:qemuriscv32 ?= "5d4da9e99880f594ca07d0a68d80d6b830728dc8"
+SRCREV_machine:qemux86 ?= "5d4da9e99880f594ca07d0a68d80d6b830728dc8"
+SRCREV_machine:qemux86-64 ?= "5d4da9e99880f594ca07d0a68d80d6b830728dc8"
+SRCREV_machine:qemumips64 ?= "8d25ce2c226b61b29e600dc6b4018afa354a6e67"
+SRCREV_machine ?= "5d4da9e99880f594ca07d0a68d80d6b830728dc8"
+SRCREV_meta ?= "77f0a9eba731b83da9273d1c0d6bb1c3afd9b129"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "fb2635ac69abac0060cc2be2873dc4f524f12e66"
+SRCREV_machine:class-devupstream ?= "c6114c845984144944f1abc07c61de219367a4da"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.62"
+LINUX_VERSION ?= "6.1.65"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


