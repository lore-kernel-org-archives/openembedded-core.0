Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04EFC433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 23:03:57 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web12.2801.1644447836545968310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 15:03:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gWlttZgb;
 spf=pass (domain: gmail.com, ip: 209.85.221.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id v192so2076335vkv.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 15:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nzZIN0iAy03eRGNKCKwj1GtSJwyY5ZO5riVnX08kppE=;
        b=gWlttZgbvNeAeIdYfTVTavAl96rBSFjBeVGfJlB9URTPbGiwJOBtdfWTowZN+5GjOA
         wtz3918eAP6Yncmji2mq9GiqgnVAr32i/vsOgjjk47T0bN5xvJ5rODw/6KEufK3dr7pu
         81vva9ZqvWGYN3RAorg4kRXbJxFqEt1teUmJL35R8wZHEfVhgaJ4Jc56sLB11CO3lf8D
         lwRzI37WmtouR7h29Fd+Ar+uQsR5HSkmDVdd51hDdCSfT4OFzfS/FP1eti+HeB6JfLsg
         rAaA1C++L9yAgftKPonczhb5V02nO0OV0NQXvSk+7LaC0ENv6L+PGV54fXFN4qqcoCKd
         MP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nzZIN0iAy03eRGNKCKwj1GtSJwyY5ZO5riVnX08kppE=;
        b=EEdv+7iMQsVDO8UqIL4qGAUD+fwqZIW8s81mFAKs48mJksmb07naOeUlvceqH8fk7a
         AxdZUNYoiwkorgtQYB0QqyFGdXTMtdQ6Yql9VYgOuNZSymljdHM4A2WR1XoC4nvNrGZr
         MV03gm7DD/LuC9XwMdugK9xVILeA25qUZULWvvmqJHya8lSrSJG2j/bUoEzanJ2ljpPF
         kzAMF2HlQIZdVGS7Iz8zKDgeZpxZBx9vLhcp/oKCe7BoNcAwyaGWyGALWSDkxMOojCk8
         MfmtKIPBOSl5gVU8Ujwz9J3fzXQOoL3R9l0iPV9H2oDMtTa1CWhVGyoaUGq2B5smLebJ
         EfCg==
X-Gm-Message-State: AOAM532RlSnkP9z8lJ05Z/CrLjjTORKqp0gCdYiXj+7birZNhSegdOVx
	RtzLAqxj+/jm0Mqf7M3W2bo=
X-Google-Smtp-Source: 
 ABdhPJwRsGPuE1hAn8K/gE7qS1jo/vhC/NKo84byhjE0DBt5IOzfWglhltanlRubZcldNrXXuEVENQ==
X-Received: by 2002:a05:6122:a0b:: with SMTP id
 11mr1776261vkn.19.1644447835395;
        Wed, 09 Feb 2022 15:03:55 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 29sm3511994vki.25.2022.02.09.15.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 15:03:54 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com,
	richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/5.4: update to v5.4.176
Date: Wed,  9 Feb 2022 18:03:51 -0500
Message-Id: <20220209230352.28324-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20220209230352.28324-1-bruce.ashfield@gmail.com>
References: <20220209230352.28324-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 23:03:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161593

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    2570bb2729c7 Linux 5.4.176
    5e2a4d02252f mtd: rawnand: mpc5121: Remove unused variable in ads5121_select_chip()
    6cbf4c731d78 block: Fix wrong offset in bio_truncate()
    33a9ba52d5ea fsnotify: invalidate dcache before IN_DELETE event
    b52103cbb659 dt-bindings: can: tcan4x5x: fix mram-cfg RX FIFO config
    e913171594ea ipv4: remove sparse error in ip_neigh_gw4()
    c30ecdba9e5a ipv4: tcp: send zero IPID in SYNACK messages
    51dde4ae5a37 ipv4: raw: lock the socket in raw_bind()
    2d334469c29e net: hns3: handle empty unknown interrupt for VF
    7afc09c8915b yam: fix a memory leak in yam_siocdevprivate()
    51edc483af6c drm/msm/hdmi: Fix missing put_device() call in msm_hdmi_get_phy
    a15ed3e9887f ibmvnic: don't spin in tasklet
    c09702f43a6a ibmvnic: init ->running_cap_crqs early
    86217a4ebd18 hwmon: (lm90) Mark alert as broken for MAX6654
    18684bb996f3 rxrpc: Adjust retransmission backoff
    f39027cbada4 phylib: fix potential use-after-free
    218cccb52124 net: phy: broadcom: hook up soft_reset for BCM54616S
    0d26470b25d2 netfilter: conntrack: don't increment invalid counter on NF_REPEAT
    abcb9d80a4a5 NFS: Ensure the server has an up to date ctime before renaming
    30965c768217 NFS: Ensure the server has an up to date ctime before hardlinking
    cdfaf8e985f8 ipv6: annotate accesses to fn->fn_sernum
    581317b1f001 drm/msm/dsi: invalid parameter check in msm_dsi_phy_enable
    b3e3d584f0f1 drm/msm/dsi: Fix missing put_device() call in dsi_get_phy
    4abd2a7735e1 drm/msm: Fix wrong size calculation
    9f0a6acac4a1 net-procfs: show net devices bound packet types
    4fd45ff2b404 NFSv4: nfs_atomic_open() can race when looking up a non-regular file
    0dfacee40021 NFSv4: Handle case where the lookup of a directory fails
    c27abaa040f3 hwmon: (lm90) Reduce maximum conversion rate for G781
    1f748455a8f0 ipv4: avoid using shared IP generator for connected sockets
    ca5355771ca8 ping: fix the sk_bound_dev_if match in ping_lookup
    0b567a24addc hwmon: (lm90) Mark alert as broken for MAX6680
    b63031651a05 hwmon: (lm90) Mark alert as broken for MAX6646/6647/6649
    e372ecd455b6 net: fix information leakage in /proc/net/ptype
    20b7af413153 ipv6_tunnel: Rate limit warning messages
    bf2bd892a0cb scsi: bnx2fc: Flush destroy_work queue before calling bnx2fc_interface_put()
    d380beb5e58d rpmsg: char: Fix race between the release of rpmsg_eptdev and cdev
    da27b834c1e0 rpmsg: char: Fix race between the release of rpmsg_ctrldev and cdev
    cb24af19e5a7 i40e: fix unsigned stat widths
    be6998f232b8 i40e: Fix queues reservation for XDP
    b16f1a078d63 i40e: Fix issue when maximum queues is exceeded
    f18aadbdf6ad i40e: Increase delay to 1 s after global EMP reset
    7e94539448ed powerpc/32: Fix boot failure with GCC latent entropy plugin
    ff19d70b665d net: sfp: ignore disabled SFP node
    5ede72d48cab ucsi_ccg: Check DEV_INT bit only when starting CCG4
    3922b6e1c9ea usb: typec: tcpm: Do not disconnect while receiving VBUS off
    9c61fce322ac USB: core: Fix hang in usb_kill_urb by adding memory barriers
    4fc6519bdecb usb: gadget: f_sourcesink: Fix isoc transfer for USB_SPEED_SUPER_PLUS
    64e671a22163 usb: common: ulpi: Fix crash in ulpi_match()
    d66dc656c5f9 usb-storage: Add unusual-devs entry for VL817 USB-SATA bridge
    a06cba5ad125 tty: Add support for Brainboxes UC cards.
    f5e6c946732a tty: n_gsm: fix SW flow control encoding/handling
    05b330118888 serial: stm32: fix software flow control transfer
    0b92eda2d801 serial: 8250: of: Fix mapped region size when using reg-offset property
    2bf7dee6f423 netfilter: nft_payload: do not update layer 4 checksum when mangling fragments
    a6d588572568 arm64: errata: Fix exec handling in erratum 1418040 workaround
    5cbcd1f5a20a drm/etnaviv: relax submit size limits
    5463cfd83397 fsnotify: fix fsnotify hooks in pseudo filesystems
    1614bd844eef tracing: Don't inc err_log entry count if entry allocation fails
    8a8878ebb596 tracing/histogram: Fix a potential memory leak for kstrdup()
    73578a9b2b72 PM: wakeup: simplify the output logic of pm_show_wakelocks()
    31136e5467f3 udf: Fix NULL ptr deref when converting from inline format
    86bcc670d300 udf: Restore i_lenAlloc when inode expansion fails
    c54445af64ca scsi: zfcp: Fix failed recovery on gone remote port with non-NPIV FCP devices
    4d041e75c4c4 s390/hypfs: include z/VM guests with access control group set
    835d37068525 Bluetooth: refactor malicious adv data check
    7cdf2951f80d Linux 5.4.175
    84b1259fe36a drm/vmwgfx: Fix stale file descriptors on failed usercopy
    16895e4eac36 select: Fix indefinitely sleeping task in poll_schedule_timeout()
    53d5b08d8e98 mmc: sdhci-esdhc-imx: disable CMDQ support
    c3fa7ce43cdd ARM: dts: gpio-ranges property is now required
    75278f1aff5e pinctrl: bcm2835: Change init order for gpio hogs
    0d006bb08d76 pinctrl: bcm2835: Add support for wake-up interrupts
    08fd6274380a pinctrl: bcm2835: Match BCM7211 compatible string
    ac3daf50c150 pinctrl: bcm2835: Add support for all GPIOs on BCM2711
    e5237171117c pinctrl: bcm2835: Refactor platform data
    33e48b5305eb pinctrl: bcm2835: Drop unused define
    75ca9c1d96c7 rcu: Tighten rcu_advance_cbs_nowake() checks
    1b5553c79d52 drm/i915: Flush TLBs before releasing backing store
    411d8da1c843 Linux 5.4.174
    2c9650faa19c Revert "ia64: kprobes: Use generic kretprobe trampoline handler"
    d106693dfd21 mtd: nand: bbt: Fix corner case in bad block table handling
    0c1b20381926 lib/test_meminit: destroy cache in kmem_cache_alloc_bulk() test
    a836180fc53a lib82596: Fix IRQ check in sni_82596_probe
    3903f65a5a9f scripts/dtc: dtx_diff: remove broken example from help text
    b0e5b352fe12 dt-bindings: display: meson-vpu: Add missing amlogic,canvas property
    e3e561707c28 dt-bindings: display: meson-dw-hdmi: add missing sound-name-prefix property
    810d3fac215d net: ethernet: mtk_eth_soc: fix error checking in mtk_mac_config()
    e81d42e5445a bcmgenet: add WOL IRQ check
    3bd7629eb8b2 net_sched: restore "mpu xxx" handling
    918b3dbf0315 arm64: dts: qcom: msm8996: drop not documented adreno properties
    1e0e01eb2589 dmaengine: at_xdmac: Fix at_xdmac_lld struct definition
    ca48aa7de702 dmaengine: at_xdmac: Fix lld view setting
    0366901b7b02 dmaengine: at_xdmac: Fix concurrency over xfers_list
    d56e1fcb7b5b dmaengine: at_xdmac: Print debug message after realeasing the lock
    7163076f252e dmaengine: at_xdmac: Don't start transactions at tx_submit level
    9fbe8ea8df20 perf script: Fix hex dump character output
    e7e3f9634ae6 libcxgb: Don't accidentally set RTO_ONLINK in cxgb_find_route()
    91e58091a6bd gre: Don't accidentally set RTO_ONLINK in gre_fill_metadata_dst()
    1e06cb37febe xfrm: Don't accidentally set RTO_ONLINK in decode_session4()
    d6bfcc8d9541 netns: add schedule point in ops_exit_list()
    577d3c5291dc inet: frags: annotate races around fqdir->dead and fqdir->high_thresh
    967ec4b05918 rtc: pxa: fix null pointer dereference
    1623e00e407c net: axienet: increase default TX ring size to 128
    88d7727796a6 net: axienet: fix number of TX ring slots for available check
    d2765d89fe38 net: axienet: limit minimum TX ring size
    2612e3567665 clk: si5341: Fix clock HW provider cleanup
    7a831993a9a8 af_unix: annote lockless accesses to unix_tot_inflight & gc_in_progress
    fdc1ce979061 f2fs: fix to reserve space for IO align feature
    f852afb6c072 parisc: pdc_stable: Fix memory leak in pdcs_register_pathentries
    d25fe9c255b6 net/fsl: xgmac_mdio: Fix incorrect iounmap when removing module
    682a1e0ecbda ipv4: avoid quadratic behavior in netns dismantle
    e6669fba04ad bpftool: Remove inclusion of utilities.mak from Makefiles
    9e5a74b6326b powerpc/fsl/dts: Enable WA for erratum A-009885 on fman3l MDIO buses
    461aedcf68e0 powerpc/cell: Fix clang -Wimplicit-fallthrough warning
    261f9917648e Revert "net/mlx5: Add retry mechanism to the command entry index allocation"
    6926d427941a dmaengine: stm32-mdma: fix STM32_MDMA_CTBR_TSEL_MASK
    d2d453940b62 RDMA/rxe: Fix a typo in opcode name
    1a3f263e05d1 RDMA/hns: Modify the mapping attribute of doorbell to device
    0cb05af4bf87 scsi: core: Show SCMD_LAST in text form
    59c7ff950915 Documentation: fix firewire.rst ABI file path error
    dafbd79e423e Documentation: refer to config RANDOMIZE_BASE for kernel address-space randomization
    2ecbe50b2b8e Documentation: ACPI: Fix data node reference documentation
    49daee55004b Documentation: dmaengine: Correctly describe dmatest with channel unset
    05594394dc27 media: rcar-csi2: Optimize the selection PHTW register
    547ea2d23ec6 firmware: Update Kconfig help text for Google firmware
    515ca9f56833 of: base: Improve argument length mismatch error
    227afbfe47b5 drm/radeon: fix error handling in radeon_driver_open_kms
    d820cb636563 ext4: don't use the orphan list when migrating an inode
    85c121cf17fd ext4: Fix BUG_ON in ext4_bread when write quota data
    b985c8521dac ext4: set csum seed in tmp inode while migrating to extents
    6e23e0bb1a11 ext4: make sure quota gets properly shutdown on error
    86be63aea2b1 ext4: make sure to reset inode lockdep class when quota enabling fails
    e5999c49cd90 btrfs: respect the max size in the header when activating swap file
    85dc4aac7e99 btrfs: check the root node for uptodate before returning it
    eeec77bb53a5 btrfs: fix deadlock between quota enable and other quota operations
    e89514082668 xfrm: fix policy lookup for ipv6 gre packets
    09af149541d9 PCI: pci-bridge-emul: Set PCI_STATUS_CAP_LIST for PCIe device
    e904b46073a1 PCI: pci-bridge-emul: Correctly set PCIe capabilities
    ab57ac7299e2 PCI: pci-bridge-emul: Properly mark reserved PCIe bits in PCI config space
    db531b57cb50 drm/bridge: analogix_dp: Make PSR-exit block less
    17d492d39e17 drm/nouveau/kms/nv04: use vzalloc for nv04_display
    0d0e56a1a945 drm/etnaviv: limit submit sizes
    72a953efcbd6 s390/mm: fix 2KB pgtable release race
    da4e1facccc7 iwlwifi: mvm: Increase the scan timeout guard to 30 seconds
    11604a3a6bed tracing/kprobes: 'nmissed' not showed correctly for kretprobe
    ae2e0b2f2ba3 cputime, cpuacct: Include guest time in user time in cpuacct.stat
    c526d53edd21 serial: Fix incorrect rs485 polarity on uart open
    19a61f92fa6b fuse: Pass correct lend value to filemap_write_and_wait_range()
    8130a1c0bf8a ubifs: Error path in ubifs_remount_rw() seems to wrongly free write buffers
    011024b0f695 crypto: caam - replace this_cpu_ptr with raw_cpu_ptr
    973669290ad3 crypto: stm32/crc32 - Fix kernel BUG triggered in probe()
    0c0fd11c9c77 crypto: omap-aes - Fix broken pm_runtime_and_get() usage
    b728b5295d1b rpmsg: core: Clean up resources on announce_create failure.
    9e2c8bd78488 power: bq25890: Enable continuous conversion for ADC at charging
    f16a5bce3fd3 ASoC: mediatek: mt8173: fix device_node leak
    5d635c25983e scsi: sr: Don't use GFP_DMA
    1785538d273c MIPS: Octeon: Fix build errors using clang
    bb7d1de681f9 i2c: designware-pci: Fix to change data types of hcnt and lcnt parameters
    6abdf6722cd2 MIPS: OCTEON: add put_device() after of_find_device_by_node()
    2a8870f5cb2a powerpc: handle kdump appropriately with crash_kexec_post_notifiers option
    2dbb618e241a ALSA: seq: Set upper limit of processed events
    1ad4f94630c0 scsi: lpfc: Trigger SLI4 firmware dump before doing driver cleanup
    73ed9127b8e8 w1: Misuse of get_user()/put_user() reported by sparse
    b8e5376c273c KVM: PPC: Book3S: Suppress failed alloc warning in H_COPY_TOFROM_GUEST
    aecdb1d24210 powerpc/powermac: Add missing lockdep_register_key()
    2c146cf97bcb clk: meson: gxbb: Fix the SDM_EN bit for MPLL0 on GXBB
    e441d3cb760b i2c: mpc: Correct I2C reset procedure
    f231d1d22bad powerpc/smp: Move setup_profiling_timer() under CONFIG_PROFILING
    aca56c298e2a i2c: i801: Don't silently correct invalid transfer size
    aea9d368480f powerpc/watchdog: Fix missed watchdog reset due to memory ordering race
    5a3cda54ffd0 powerpc/btext: add missing of_node_put
    fd0135fc6f0a powerpc/cell: add missing of_node_put
    67329fb6a8e2 powerpc/powernv: add missing of_node_put
    5bea763aec17 powerpc/6xx: add missing of_node_put
    ecfe73aec681 parisc: Avoid calling faulthandler_disabled() twice
    5e126f68808c random: do not throw away excess input to crng_fast_load
    8f6cecfff36c serial: core: Keep mctrl register state and cached copy in sync
    6f7bd9f7c893 serial: pl010: Drop CR register reset on set_termios
    c5e156a62744 regulator: qcom_smd: Align probe function with rpmh-regulator
    4a55b02b647e net: gemini: allow any RGMII interface mode
    4bee2316c574 net: phy: marvell: configure RGMII delays for 88E1118
    b3fbe7565f8e dm space map common: add bounds check to sm_ll_lookup_bitmap()
    052f64013701 dm btree: add a defensive bounds check to insert_at()
    aaefb1833309 mac80211: allow non-standard VHT MCS-10/11
    5253794b19f6 net: mdio: Demote probed message to debug print
    8508caebe60e btrfs: remove BUG_ON(!eie) in find_parent_nodes
    7d4f4075e78b btrfs: remove BUG_ON() in find_parent_nodes()
    ba72fa2cb2f2 ACPI: battery: Add the ThinkPad "Not Charging" quirk
    7c366d75a44a drm/amdgpu: fixup bad vram size on gmc v8
    88b5abc0c61d ACPICA: Hardware: Do not flush CPU cache when entering S4 and S5
    de85f5861894 ACPICA: Fix wrong interpretation of PCC address
    1fa8e71d0022 ACPICA: Executer: Fix the REFCLASS_REFOF case in acpi_ex_opcode_1A_0T_1R()
    aee78b668ef5 ACPICA: Utilities: Avoid deleting the same object twice in a row
    a4c6cde223d2 ACPICA: actypes.h: Expand the ACPI_ACCESS_ definitions
    56c308c7302b jffs2: GC deadlock reading a page that is used in jffs2_write_begin()
    c02454b3c85b um: registers: Rename function names to avoid conflicts and build problems
    51b44e9b14a6 iwlwifi: mvm: Fix calculation of frame length
    95017cf0a367 iwlwifi: remove module loading failure message
    0446cafa843e iwlwifi: fix leaks/bad data after failed firmware load
    c8fe499c4565 ath9k: Fix out-of-bound memcpy in ath9k_hif_usb_rx_stream
    46fdba26cdff usb: hub: Add delay for SuperSpeed hub resume to let links transit to U0
    8ac2cf0253a5 cpufreq: Fix initialization of min and max frequency QoS requests
    bfcc1e9c2e00 arm64: tegra: Adjust length of CCPLEX cluster MMIO region
    65816c103476 arm64: dts: ls1028a-qds: move rtc node to the correct i2c bus
    dcf1d9f76f71 audit: ensure userspace is penalized the same as the kernel when under pressure
    5cc8a367851b mmc: core: Fixup storing of OCR for MMC_QUIRK_NONSTD_SDIO
    3a7f37eb2083 media: saa7146: hexium_gemini: Fix a NULL pointer dereference in hexium_attach()
    71b6d05db553 media: igorplugusb: receiver overflow should be reported
    1af9e1d4885a HID: quirks: Allow inverting the absolute X/Y values
    75f7885dc257 bpf: Do not WARN in bpf_warn_invalid_xdp_action()
    086181b0ffde net: bonding: debug: avoid printing debug logs when bond is not notifying peers
    fcd7e8ccc437 x86/mce: Mark mce_read_aux() noinstr
    a0d171398dcd x86/mce: Mark mce_end() noinstr
    bca5aa920274 x86/mce: Mark mce_panic() noinstr
    2481ee0ce59c gpio: aspeed: Convert aspeed_gpio.lock to raw_spinlock
    743911a2bf8b net: phy: prefer 1000baseT over 1000baseKX
    a5d8e6189b13 net-sysfs: update the queue counts in the unregistration path
    d08cc0223a78 ath10k: Fix tx hanging
    054281b3548d iwlwifi: mvm: synchronize with FW after multicast commands
    fe791612afab media: m920x: don't use stack on USB reads
    a821532ce5ec media: saa7146: hexium_orion: Fix a NULL pointer dereference in hexium_attach()
    b867a9c3de09 media: uvcvideo: Increase UVC_CTRL_CONTROL_TIMEOUT to 5 seconds.
    ff867910e87c x86/mm: Flush global TLB when switching to trampoline page-table
    16f2ef98cccf floppy: Add max size check for user space request
    3ad5c9e50263 usb: uhci: add aspeed ast2600 uhci support
    c27a52321190 rsi: Fix out-of-bounds read in rsi_read_pkt()
    51ad4c448611 rsi: Fix use-after-free in rsi_rx_done_handler()
    ae56c5524a75 mwifiex: Fix skb_over_panic in mwifiex_usb_recv()
    4ff69cf3b1c8 HSI: core: Fix return freed object in hsi_new_client
    009d6d9fea8c gpiolib: acpi: Do not set the IRQ type if the IRQ is already in use
    50ad94f8654a drm/bridge: megachips: Ensure both bridges are probed before registration
    c640dc459b7e mlxsw: pci: Add shutdown method in PCI driver
    f6b650941942 EDAC/synopsys: Use the quirk for version instead of ddr version
    2134ebc2d0ad media: b2c2: Add missing check in flexcop_pci_isr:
    2933aa510907 HID: apple: Do not reset quirks when the Fn key is not found
    a62523988129 drm: panel-orientation-quirks: Add quirk for the Lenovo Yoga Book X91F/L
    0cba42c09ac8 usb: gadget: f_fs: Use stream_open() for endpoint files
    c7e4004b38aa batman-adv: allow netlink usage in unprivileged containers
    c93a934f812e ARM: shmobile: rcar-gen2: Add missing of_node_put()
    c9ec3d85c0ee drm/nouveau/pmu/gm200-: avoid touching PMU outside of DEVINIT/PREOS/ACR
    3642493839af ar5523: Fix null-ptr-deref with unexpected WDCMSG_TARGET_START reply
    c7186605d878 drm/lima: fix warning when CONFIG_DEBUG_SG=y & CONFIG_DMA_API_DEBUG=y
    58cddfe67745 fs: dlm: filter user dlm messages for kernel locks
    fa4ca508c25c Bluetooth: Fix debugfs entry leak in hci_register_dev()
    2b09cb8d92a5 of: base: Fix phandle argument length mismatch error message
    f88ccfb3f2d9 RDMA/cxgb4: Set queue pair state when being queried
    38d97204a24b mips: bcm63xx: add support for clk_set_parent()
    d12b5cfab493 mips: lantiq: add support for clk_set_parent()
    770e92dbc9f6 misc: lattice-ecp3-config: Fix task hung when firmware load failed
    458c253b2577 ASoC: samsung: idma: Check of ioremap return value
    8b894d503ed7 ASoC: mediatek: Check for error clk pointer
    41d2dc9110e0 phy: uniphier-usb3ss: fix unintended writing zeros to PHY register
    dc03527ca12b iommu/iova: Fix race between FQ timeout and teardown
    86233ee4b4b9 dmaengine: pxa/mmp: stop referencing config->slave_id
    741a26cf3134 clk: stm32: Fix ltdc's clock turn off by clk_disable_unused() after system enter shell
    35d7be242cd9 ASoC: rt5663: Handle device_property_read_u32_array error codes
    200f00382f08 RDMA/cma: Let cma_resolve_ib_dev() continue search even after empty entry
    6314e22a998e RDMA/core: Let ib_find_gid() continue search even after empty entry
    2e89a39fd702 powerpc/powermac: Add additional missing lockdep_register_key()
    9367675e76b8 PCI/MSI: Fix pci_irq_vector()/pci_irq_get_affinity()
    27a90275e8f7 scsi: ufs: Fix race conditions related to driver data
    b9b691de3c99 iommu/io-pgtable-arm: Fix table descriptor paddr formatting
    48fc8eebd174 binder: fix handling of error during copy
    f3c2c7f3f884 char/mwave: Adjust io port register size
    e607cd712d5d ALSA: oss: fix compile error when OSS_DEBUG is enabled
    5daf39257079 ASoC: uniphier: drop selecting non-existing SND_SOC_UNIPHIER_AIO_DMA
    7e2ce332aacc powerpc/prom_init: Fix improper check of prom_getprop()
    506184ded655 clk: imx8mn: Fix imx8mn_clko1_sels
    852f447ce0c1 RDMA/hns: Validate the pkey index
    9927848b1ce5 ALSA: hda: Add missing rwsem around snd_ctl_remove() calls
    79b89d3ab5a9 ALSA: PCM: Add missing rwsem around snd_ctl_remove() calls
    86fecb7f50b5 ALSA: jack: Add missing rwsem around snd_ctl_remove() calls
    970d9082043d ext4: avoid trim error on fs with small groups
    2e5f08a5f8b5 net: mcs7830: handle usb read errors properly
    ff09d5951b81 pcmcia: fix setting of kthread task states
    f56b423bce1e can: xilinx_can: xcan_probe(): check for error irq
    58533bbd5cf1 can: softing: softing_startstop(): fix set but not used variable warning
    13af3a9b1ba6 tpm: add request_locality before write TPM_INT_ENABLE
    5d5223beb6e2 spi: spi-meson-spifc: Add missing pm_runtime_disable() in meson_spifc_probe
    74dd45122b84 net/mlx5: Set command entry semaphore up once got index free
    2b7816b1e90e Revert "net/mlx5e: Block offload of outer header csum for UDP tunnels"
    2f2336ca68b9 net/mlx5e: Don't block routes with nexthop objects in SW
    fca92bb20ced debugfs: lockdown: Allow reading debugfs files that are not world readable
    46541f21de5c HID: hid-uclogic-params: Invalid parameter check in uclogic_params_frame_init_v1_buttonpad
    f6fbc6a0502c HID: hid-uclogic-params: Invalid parameter check in uclogic_params_huion_init
    1f660b3ff5d6 HID: hid-uclogic-params: Invalid parameter check in uclogic_params_get_str_desc
    3f4823c651bd HID: hid-uclogic-params: Invalid parameter check in uclogic_params_init
    1b7443f4ebf1 Bluetooth: hci_bcm: Check for error irq
    4ceb319006e8 fsl/fman: Check for null pointer after calling devm_ioremap
    e2e1ceb8ca7a staging: greybus: audio: Check null pointer
    b78473575fbe rocker: fix a sleeping in atomic bug
    385b8fe39802 ppp: ensure minimum packet size in ppp_write()
    c7a99af48c55 bpf: Fix SO_RCVBUF/SO_SNDBUF handling in _bpf_setsockopt().
    4e8307203d73 netfilter: ipt_CLUSTERIP: fix refcount leak in clusterip_tg_check()
    ad6674562819 pcmcia: rsrc_nonstatic: Fix a NULL pointer dereference in nonstatic_find_mem_region()
    17162e260178 pcmcia: rsrc_nonstatic: Fix a NULL pointer dereference in __nonstatic_find_io_region()
    6cdbf5b6e4cf ACPI: scan: Create platform device for BCM4752 and LNV4752 ACPI nodes
    d49992de0077 x86/mce/inject: Avoid out-of-bounds write when setting flags
    a259c73dddb3 bpftool: Enable line buffering for stdout
    eb599bf3bae5 selinux: fix potential memleak in selinux_add_opt()
    8fe5e6ed36a5 mmc: meson-mx-sdio: add IRQ check
    db6eb2f94ad7 ARM: dts: armada-38x: Add generic compatible to UART nodes
    1b10eb460dc1 usb: ftdi-elan: fix memory leak on device disconnect
    3f8edc28c02b ARM: 9159/1: decompressor: Avoid UNPREDICTABLE NOP encoding
    25dfc85fceeb xfrm: state and policy should fail if XFRMA_IF_ID 0
    b34fadb521c9 xfrm: interface with if_id 0 should return error
    ba7d5b3e33a5 media: hantro: Fix probe func error path
    26cf595abd9a drm/bridge: ti-sn65dsi86: Set max register for regmap
    a6d408452c16 drm/msm/dpu: fix safe status debugfs file
    036fcde6c7d0 media: coda/imx-vdoa: Handle dma_set_coherent_mask error codes
    7089b97b46b6 media: msi001: fix possible null-ptr-deref in msi001_probe()
    04691afdbc34 media: dw2102: Fix use after free
    b153346f0ffe ARM: dts: gemini: NAS4220-B: fis-index-block with 128 KiB sectors
    4c66717867b9 crypto: stm32/cryp - fix lrw chaining mode
    46d85cdd472a crypto: stm32/cryp - fix double pm exit
    17bb09710c6b crypto: stm32/cryp - fix xts and race condition in crypto_engine requests
    fe211ebe8e14 xfrm: fix a small bug in xfrm_sa_len()
    b3e50e041b68 mwifiex: Fix possible ABBA deadlock
    236399a60ec9 rcu/exp: Mark current CPU as exp-QS in IPI loop second pass
    b67881059f8f sched/rt: Try to restart rt period timer when rt runtime exceeded
    a26a338f4df6 media: si2157: Fix "warm" tuner state detection
    dc3b4b60a0d6 media: saa7146: mxb: Fix a NULL pointer dereference in mxb_attach()
    f39bd2900fd4 media: dib8000: Fix a memleak in dib8000_init()
    62bff2a806b0 Bluetooth: btmtksdio: fix resume failure
    80f81e4bcc2a staging: rtl8192e: rtllib_module: fix error handle case in alloc_rtllib()
    9f49cf5196d9 staging: rtl8192e: return error code from rtllib_softmac_init()
    84e568531b9e floppy: Fix hang in watchdog when disk is ejected
    6a4160c9f2ec serial: amba-pl011: do not request memory region twice
    96591a7e66ba tty: serial: uartlite: allow 64 bit address
    d3aee4338f1d arm64: dts: ti: k3-j721e: Fix the L2 cache sets
    15115464eba2 drm/radeon/radeon_kms: Fix a NULL pointer dereference in radeon_driver_open_kms()
    46ec86ea0d02 drm/amdgpu: Fix a NULL pointer dereference in amdgpu_connector_lcd_native_mode()
    77af47f26987 ACPI: EC: Rework flushing of EC work while suspended to idle
    f996dab1a846 arm64: dts: qcom: msm8916: fix MMC controller aliases
    54b5ab456e00 netfilter: bridge: add support for pppoe filtering
    04bb89f51cba media: venus: core: Fix a resource leak in the error handling path of 'venus_probe()'
    8034d6c40e43 media: mtk-vcodec: call v4l2_m2m_ctx_release first when file is released
    f77b90341055 media: si470x-i2c: fix possible memory leak in si470x_i2c_probe()
    a3c5386a515f media: imx-pxp: Initialize the spinlock prior to using it
    0410f7ac04b3 media: rcar-csi2: Correct the selection of hsfreqrange
    62866d6542ea tty: serial: atmel: Call dma_async_issue_pending()
    cd867ffa14a8 tty: serial: atmel: Check return code of dmaengine_submit()
    06d6f696873b arm64: dts: ti: k3-j721e: correct cache-sets info
    ac718d92b6dc crypto: qce - fix uaf on qce_ahash_register_one
    be6ee09c9ece media: dmxdev: fix UAF when dvb_register_device() fails
    da0b42d1c3fb tee: fix put order in teedev_close_context()
    24161b9c43de Bluetooth: stop proccessing malicious adv data
    50a981742363 arm64: dts: meson-gxbb-wetek: fix missing GPIO binding
    e48e1d3e0f85 arm64: dts: meson-gxbb-wetek: fix HDMI in early boot
    1221b3adf539 media: aspeed: Update signal status immediately to ensure sane hw state
    15df887c6248 media: em28xx: fix memory leak in em28xx_init_dev
    58f08f024c72 media: aspeed: fix mode-detect always time out at 2nd run
    dc644dd8a00c media: videobuf2: Fix the size printk format
    e51b0099c870 wcn36xx: Release DMA channel descriptor allocations
    2aa2da3fb522 wcn36xx: Indicate beacon not connection loss on MISSED_BEACON_IND
    457b05f39116 clk: bcm-2835: Remove rounding up the dividers
    aac1ed30597c clk: bcm-2835: Pick the closest clock rate
    ba4cc4968917 Bluetooth: cmtp: fix possible panic when cmtp_init_sockets() fails
    141a9a9cae28 drm/rockchip: dsi: Fix unbalanced clock on probe error
    bcd6bfe12be0 drm/panel: innolux-p079zca: Delete panel on attach() failure
    4c255e98aa05 drm/panel: kingdisplay-kd097d04: Delete panel on attach() failure
    5cc7480e63a3 drm/rockchip: dsi: Reconfigure hardware on resume()
    0620aabea8d8 drm/rockchip: dsi: Hold pm-runtime across bind/unbind
    6264d0fef906 shmem: fix a race between shmem_unused_huge_shrink and shmem_evict_inode
    9d8fb273d5ee mm/page_alloc.c: do not warn allocation failure on zone DMA if no managed pages
    7ad300800c43 mm_zone: add function to check if managed dma zone exists
    c4212d52f926 PCI: Add function 1 DMA alias quirk for Marvell 88SE9125 SATA controller
    9e5bb22beb3c dma_fence_array: Fix PENDING_ERROR leak in dma_fence_array_signaled()
    e12f983c4a3c iommu/io-pgtable-arm-v7s: Add error handle for page table allocation failure
    81a026b9c33d lkdtm: Fix content of section containing lkdtm_rodata_do_nothing()
    3cead5b7a88c can: softing_cs: softingcs_probe(): fix memleak on registration failure
    38e28033a56b media: stk1160: fix control-message timeouts
    0ac3d5f6f956 media: pvrusb2: fix control-message timeouts
    d1c57f558d24 media: redrat3: fix control-message timeouts
    7a9d34be181f media: dib0700: fix undefined behavior in tuner shutdown
    f64b379bde39 media: s2255: fix control-message timeouts
    3a49cd738b07 media: cpia2: fix control-message timeouts
    c9ef6e1d5025 media: em28xx: fix control-message timeouts
    c89df039e811 media: mceusb: fix control-message timeouts
    22325141e94c media: flexcop-usb: fix control-message timeouts
    7458b0189e87 media: v4l2-ioctl.c: readbuffers depends on V4L2_CAP_READWRITE
    023357dd2eaf rtc: cmos: take rtc_lock while reading from CMOS
    9a82bfb442b7 tools/nolibc: fix incorrect truncation of exit code
    2e83886c0420 tools/nolibc: i386: fix initial stack alignment
    aca2988eddb9 tools/nolibc: x86-64: Fix startup code bug
    a4b5d9af4af5 x86/gpu: Reserve stolen memory for first integrated Intel GPU
    f55dbf729872 mtd: rawnand: gpmi: Remove explicit default gpmi clock setting for i.MX6
    29218853877a mtd: rawnand: gpmi: Add ERR007117 protection for nfc_apply_timings
    ba2539b5f958 nfc: llcp: fix NULL error pointer dereference on sendmsg() after failed bind()
    eb116c891ba1 f2fs: fix to do sanity check in is_alive()
    bf9e52c0a9d9 HID: wacom: Avoid using stale array indicies to read contact count
    5d1023f33c6d HID: wacom: Ignore the confidence flag when a touch is removed
    60257988d6f9 HID: wacom: Reset expected and received contact counts at the same time
    898e69caad0f HID: uhid: Fix worker destroying device without any protection

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 8e5a0ae5e0..72b11c3c2d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "04f6e2728373decb06b2c159cdf599c8813a7ea2"
-SRCREV_meta ?= "9e6e627445612ea0b6cc514bcdb879de3999f175"
+SRCREV_machine ?= "b24dd7e4d381fb2b855e46428087f1d2d5a2e98f"
+SRCREV_meta ?= "25910e8585d93aa555c747a9aaedccbc405c5134"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.173"
+LINUX_VERSION ?= "5.4.176"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 53f85c8cd4..227356a126 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.173"
+LINUX_VERSION ?= "5.4.176"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "dd1d37cf1243bb0194f63992294c386b91b883ee"
-SRCREV_machine ?= "149a477216fedee100a2a7c749d7876a5af18c3d"
-SRCREV_meta ?= "9e6e627445612ea0b6cc514bcdb879de3999f175"
+SRCREV_machine_qemuarm ?= "ce298ed73f24a8529058476004cb973c86432cd9"
+SRCREV_machine ?= "0b50f433a66bfa7ff4baaf1383a53aa9bfec7b66"
+SRCREV_meta ?= "25910e8585d93aa555c747a9aaedccbc405c5134"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index ad22072ddf..be14fd4f8f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "7d8ca1d1b0891c023c74d79ea39e045d1a794077"
-SRCREV_machine_qemuarm64 ?= "79e8b8d059d36f1c2e7e20e38f883ea8c7381ffa"
-SRCREV_machine_qemumips ?= "bed90b69d8120029e8b362166c11437a257b9fdc"
-SRCREV_machine_qemuppc ?= "e886407de7b10259c99c61f9538af43181f2fec3"
-SRCREV_machine_qemuriscv64 ?= "9d1d023f9d659fd8678f020f3e98d735b27896fb"
-SRCREV_machine_qemux86 ?= "9d1d023f9d659fd8678f020f3e98d735b27896fb"
-SRCREV_machine_qemux86-64 ?= "9d1d023f9d659fd8678f020f3e98d735b27896fb"
-SRCREV_machine_qemumips64 ?= "20b16bf3c848f34be5b747f27c4cfc1237bcefbd"
-SRCREV_machine ?= "9d1d023f9d659fd8678f020f3e98d735b27896fb"
-SRCREV_meta ?= "9e6e627445612ea0b6cc514bcdb879de3999f175"
+SRCREV_machine_qemuarm ?= "eecb4a32b034e7ac5f3e54f68cf5263499f79b6f"
+SRCREV_machine_qemuarm64 ?= "6786585bee3d0de9cd8886fa4be54eafd0aeac8a"
+SRCREV_machine_qemumips ?= "4fe08e5a1c9b437ad0276448cfa63c5fa1b8303b"
+SRCREV_machine_qemuppc ?= "0f5916a777fc69030480f19b097b0e9fc035f4bf"
+SRCREV_machine_qemuriscv64 ?= "7cff5cd60103d5af3dd1e6b13bff1c7a9ef8e99d"
+SRCREV_machine_qemux86 ?= "7cff5cd60103d5af3dd1e6b13bff1c7a9ef8e99d"
+SRCREV_machine_qemux86-64 ?= "7cff5cd60103d5af3dd1e6b13bff1c7a9ef8e99d"
+SRCREV_machine_qemumips64 ?= "f15ba204e8f1c7fe33b248ae19d1b0b851c7272d"
+SRCREV_machine ?= "7cff5cd60103d5af3dd1e6b13bff1c7a9ef8e99d"
+SRCREV_meta ?= "25910e8585d93aa555c747a9aaedccbc405c5134"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.173"
+LINUX_VERSION ?= "5.4.176"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


