Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BCE7CF5371
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:01 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.7906.1729686898444047805
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:34:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=sJui//So;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20cf3e36a76so66168415ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686897; x=1730291697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3p8CpA8gcLWdHS23O/hTPRf83YdASthOV6cJ/1f61s8=;
        b=sJui//So0PY4wxz/iDMvJYSe6RDBoqd00jIqRoSqLEH7WPALEjyIS3SDqvvB3W/p8k
         zPrnkYqEhtJlECbKV4/5vnXNi0h5PW+KkALwKOM5XKaKhM7nJck6/IQZ21CCQ6jfu4DZ
         pufHKW1DeESpMGhUR9H77975PoQ0E6ZabrGsRwhAUM9n+Zg2rH7Zv7SNiIV0KM3puvVv
         CjFjd4P+OkGbmEsbLGNKm1waCYVClJ4MG925+HrP1ILpShfHBO4SgMfas7mmqN4ez1Af
         adeiZnaANSVe/1MumcTCvHpxhMmIVRfBjjdOedre8bTGfv/kh/KgYISwLxX9rAXpYO3C
         05gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686897; x=1730291697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3p8CpA8gcLWdHS23O/hTPRf83YdASthOV6cJ/1f61s8=;
        b=TMEkLbys6T0gKTXKYC/44VY2nvjI+gCU9SmPeqyQrWWzn9Kr7HJ8hBu41gY6rC3oE/
         eS9WEoASix+z6aDq7qNDtoY16n8vmLSi11uOhV3sYU13F0wBSY26zTD2X4RS9ZWRwhJC
         ++9qyjgEdEZhpYUA51xqZ9JGGdZ1akz3/10zJJ+q4vbkfYjDebEHyOTfq+idW+iHcjEY
         5wiVurjDp6ufhlvRiKBEaa/ogrqwWkuLa76qeXh6VsPP9QULxpENi7xcml3iEDRtp/ge
         T/K0rDYDP7vh+jv5krzWMNkO1j30R3++w4njLrkCCbEXjty3N2bXdWYBBavGo+kvAvW7
         tN6A==
X-Gm-Message-State: AOJu0Yz1V+YzFSZNq/1SI5T8xur9iunCSZcJhR5wnGJC9SBzaWbRTHpJ
	3p/Q5YWEyJOPKxCltMJaFZF1LUjBwi4lqgCz/GdGIRggGbii4mv+1/zWuai3dbyRMMFK4nku9Xy
	Q
X-Google-Smtp-Source: AGHT+IEo0wuOSpWAzt0EbivPpefMxDaTZyzXWc3GHGsQTFubFXw8QEQiXMUhBbTgps2m1j0awqxUrw==
X-Received: by 2002:a17:903:41c2:b0:20b:9998:e2f4 with SMTP id d9443c01a7336-20fab307631mr29570265ad.61.1729686896458;
        Wed, 23 Oct 2024 05:34:56 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.34.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:34:55 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 08/27] linux-yocto/6.10: update to v6.10.11
Date: Wed, 23 Oct 2024 05:34:16 -0700
Message-Id: <8640017507a8e68cd7c89169e224ce684710f047.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206219

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.10 to the latest korg -stable release that comprises
the following commits:

    8a886bee7aa5 Linux 6.10.11
    729ae6e76187 usb: typec: ucsi: Only set number of plug altmodes after registration
    7d318166bf55 ASoC: meson: axg-card: fix 'use-after-free'
    080c3068715d pinctrl: meteorlake: Add Arrow Lake-H/U ACPI ID
    6c69458e2e32 cifs: Fix signature miscalculation
    7f7417d0ba92 drm/xe/display: fix compat IS_DISPLAY_STEP() range end
    d53503ca0449 ASoC: codecs: avoid possible garbage value in peb2466_reg_read()
    bcf0e7f90ba8 drm/i915/guc: prevent a possible int overflow in wq offsets
    4e96ea328a80 spi: geni-qcom: Fix incorrect free_irq() sequence
    ff4767f00234 spi: geni-qcom: Undo runtime PM changes at driver exit time
    01281a9e8275 ASoC: Intel: soc-acpi-intel-mtl-match: add missing empty item
    8eb57389d8ad ASoC: Intel: soc-acpi-intel-lnl-match: add missing empty item
    ad78bcd111e3 tracing/kprobes: Fix build error when find_module() is not available
    abc8feacacf8 drm/xe/client: add missing bo locking in show_meminfo()
    9d3de463e23b drm/xe/client: fix deadlock in show_meminfo()
    fc108cbc7e7a drm/amd/amdgpu: apply command submission parser for JPEG v2+
    8403c350b44e drm/amd/amdgpu: apply command submission parser for JPEG v1
    42850927656a drm/amd/display: Avoid race between dcn35_set_drr() and dc_state_destruct()
    b6ce047a81f5 drm/amd/display: Avoid race between dcn10_set_drr() and dc_state_destruct()
    73e7a3b2f451 drm/amdgpu/atomfirmware: Silence UBSAN warning
    affbd12c5f76 drm/nouveau/fb: restore init() for ramgp102
    e79050882b85 dma-buf: heaps: Fix off-by-one in CMA heap fault handler
    73333816cf2a drm/syncobj: Fix syncobj leak in drm_syncobj_eventfd_ioctl
    87d3436e4c27 soundwire: stream: Revert "soundwire: stream: fix programming slave ports for non-continous port maps"
    d1a1dfcec77c spi: nxp-fspi: fix the KASAN report out-of-bounds bug
    49ac6299f2a9 tracing/osnoise: Fix build when timerlat is not enabled
    abee73f96d9d netlink: specs: mptcp: fix port endianness
    ce8eabc912fe net: dpaa: Pad packets to ETH_ZLEN
    b4fe06be8eee net: dsa: felix: ignore pending status of TAS module when it's disabled
    8d0c3368478e net: hsr: prevent NULL pointer dereference in hsr_proxy_announce()
    1f68e097e20d netfilter: nft_socket: fix sk refcount leaks
    b5f2f7d1c526 riscv: Disable preemption while handling PR_RISCV_CTX_SW_FENCEI_OFF
    edcab8d5bce3 drivers: perf: Fix smp_processor_id() use in preemptible code
    176b6a0675c5 selftests: net: csum: Fix checksums for packets with non-zero padding
    67b61e2f4c9c net: phy: dp83822: Fix NULL pointer dereference on DP83825 devices
    e55c1df0016b net: ftgmac100: Enable TX interrupt to avoid TX timeout
    57db4764a88b octeontx2-af: Modify SMQ flush sequence to drop packets
    aca06c617c83 fou: fix initialization of grc
    505ae01f75f8 net/mlx5: Fix bridge mode operations when there are no VFs
    317b791922b8 net/mlx5: Verify support for scheduling element and TSAR type
    0865cf82edfc net/mlx5: Correct TASR typo into TSAR
    58491e7afe24 net/mlx5: Add missing masks and QoS bit masks for scheduling elements
    849bc9775242 net/mlx5: Explicitly set scheduling element and TSAR type
    478f00895f44 net/mlx5e: Add missing link mode to ptys2ext_ethtool_map
    2e1880fd618f net/mlx5e: Add missing link modes to ptys2ethtool_map
    20700e95b90a net/mlx5: Update the list of the PCI supported devices
    f422771750e4 igb: Always call igb_xdp_ring_update_tail() under Tx lock
    57b01a10ae14 ice: fix VSI lists confusion when adding VLANs
    4d6ad546156a ice: fix accounting for filters shared by multiple VSIs
    5f6c00ae7b33 ice: Fix lldp packets dropping after changing the number of channels
    a4b9c2fd80f2 hwmon: (pmbus) Conditionally clear individual status bits for pmbus rev >= 1.2
    de239e8db564 net: hsr: Send supervisory frames to HSR network with ProxyNodeTable data
    506dd33be9fd selftests/bpf: Support SOCK_STREAM in unix_inet_redir_to_connected()
    3e8856209299 cxl: Restore XOR'd position bits during address translation
    b5bd350efae9 cxl/core: Fix incorrect vendor debug UUID define
    70b90f7843ec clk/sophgo: Using BUG() instead of unreachable() in mmux_get_parent_id()
    556c31259cdd eeprom: digsy_mtc: Fix 93xx46 driver probe failure
    c5702cc3cb1b drm/amd/display: Fix FEC_READY write on DP LT
    d36ad993d565 drm/amd/display: Disable error correction if it's not supported
    9c838257b95d riscv: dts: starfive: jh7110-common: Fix lower rate of CPUfreq by setting PLL0 rate to 1.5GHz
    8c6a5a1fc02a firmware: qcom: uefisecapp: Fix deadlock in qcuefi_acquire()
    36050b7cdb3a arm64: dts: rockchip: fix PMIC interrupt pin in pinctrl for ROCK Pi E
    77e4578148b8 bcachefs: Don't delete open files in online fsck
    efb335dc3664 bcachefs: Revert lockless buffered IO path
    0514b281f36b bcachefs: Fix bch2_extents_match() false positive
    954fd4c81f22 mm: avoid leaving partial pfn mappings around in error case
    d6f018a3b49d x86/hyperv: fix kexec crash due to VP assist page corruption
    1bb24288b625 clocksource: hyper-v: Use lapic timer in a TDX VM without paravisor
    5dfb716fdb7d dm-integrity: fix a race condition when accessing recalc_sector
    327f0792ca04 net: libwx: fix number of Rx and Tx descriptors
    8e1f7e51648e net: tighten bad gso csum offset check in virtio_net_hdr
    5a6faeb2815e minmax: reduce min/max macro expansion in atomisp driver
    70eb635cdbe9 arm64: dts: rockchip: override BIOS_DISABLE signal via GPIO hog on RK3399 Puma
    18c0ddc03703 arm64: dts: rockchip: fix eMMC/SPI corruption when audio has been used on RK3399 Puma
    e5ba8d381a3c selftests: mptcp: join: restrict fullmesh endp on 1st sf
    12134a652b0a mptcp: pm: Fix uaf in __timer_delete_sync
    f311968726d5 platform/x86: panasonic-laptop: Allocate 1 entry extra in the sinf array
    b38c19783286 platform/x86: panasonic-laptop: Fix SINF array out of bounds accesses
    a23c1b9a76f8 NFS: Avoid unnecessary rescanning of the per-server delegation list
    f2331b87fdaf NFSv4: Fix clearing of layout segments in layoutreturn
    5c605d81e3d8 smb/server: fix return value of smb2_open()
    0b99d0e17d6a s390/mm: Pin identity mapping base to zero
    7a6e0b6fe3cf drm/xe: use devm instead of drmm for managed bo
    f3c6de0fa538 drm/xe: fix WA 14018094691
    3aa5397e333a drm/xe/xe2lpm: Extend Wa_16021639441
    f74e8bc5d71a Input: i8042 - add Fujitsu Lifebook E756 to i8042 quirk table
    b4ca1ead719c drm/msm/adreno: Fix error return if missing firmware-name
    ad0a22cb9047 spi: zynqmp-gqspi: Scale timeout by data size
    c27f780f4542 platform/surface: aggregator_registry: Add support for Surface Laptop 6
    d8d5fb769017 platform/surface: aggregator_registry: Add fan and thermal sensor support for Surface Laptop 5
    845eef138035 platform/surface: aggregator_registry: Add support for Surface Laptop Studio 2
    41c042722007 platform/surface: aggregator_registry: Add support for Surface Laptop Go 3
    db707dd766c9 platform/surface: aggregator_registry: Add Support for Surface Pro 10
    4111ff8f9a15 platform/x86: asus-wmi: Add quirk for ROG Ally X
    317159931f8f scripts: kconfig: merge_config: config files: add a trailing newline
    3dfab03b923c cgroup/cpuset: Eliminate unncessary sched domains rebuilds in hotplug
    f693397eb9a5 Input: edt-ft5x06 - add support for FocalTech FT8201
    d189e24a42b8 HID: multitouch: Add support for GT7868Q
    1fe7facedf6e hid-asus: add ROG Ally X prod ID to quirk list
    883e932bd416 Input: synaptics - enable SMBus for HP Elitebook 840 G2
    5720cd7313af Input: ads7846 - ratelimit the spi_sync error message
    a314bb665a2a btrfs: update target inode's ctime on unlink
    45ce59266a75 net: hns3: use correct release function during uninitialization
    57a606ca15de drm/amdgpu: Update kmd_fw_shared for VCN5
    8d92bafd4c67 wifi: mt76: mt7921: fix NULL pointer access in mt7921_ipv6_addr_change
    59c1b7916dba powerpc/mm: Fix boot warning with hugepages and CONFIG_DEBUG_VIRTUAL
    b7002518171d net: phy: vitesse: repair vsc73xx autonegotiation
    a43653ed1ef1 drm: panel-orientation-quirks: Add quirk for Ayn Loki Max
    df5a3a6d2020 drm: panel-orientation-quirks: Add quirk for Ayn Loki Zero
    a387bfd15305 net: ethernet: use ip_hdrlen() instead of bit shift
    ccc94e269281 usbnet: ipheth: fix carrier detection in modes 1 and 4
    08ca800b0cd5 usbnet: ipheth: do not stop RX on failing RX callback
    716b11132999 usbnet: ipheth: drop RX URBs with no payload
    5ad04d8e4207 usbnet: ipheth: remove extraneous rx URB length check
    02bc490c4590 ksmbd: override fsids for smb2_query_info()
    08f9f96d430e ksmbd: override fsids for share path check
    960be51f89cd drm/mediatek: Set sensible cursor width/height values to fix crash
    3e1840750c57 usb: typec: ucsi: Fix cable registration
    a67fc92568b8 usb: typec: ucsi: Always set number of alternate modes
    049be94099ea Linux 6.10.10
    60e01e9316a3 LoongArch: Use accessors to page table entries instead of direct dereference
    12bc88ca29de spi: spi-fsl-lpspi: Fix off-by-one in prescale max
    01681aa609b5 btrfs: fix race between direct IO write and fsync when using same fd
    6f574d015689 drm/i915/display: Increase Fast Wake Sync length as a quirk
    48cb63ce38b9 drm/i915/display: Add mechanism to use sink model when applying quirk
    b4e9331e9064 x86/mm: Fix PTI for i386 some more
    7c890ef60bf4 ublk_drv: fix NULL pointer dereference in ublk_ctrl_start_recovery()
    5ac3d0a487d1 nvmet: Identify-Active Namespace ID List command should reject invalid nsid
    2443c10be369 nvme: rename CDR/MORE/DNR to NVME_STATUS_*
    d433e595f1ac nvme: fix status magic numbers
    1be0c309a33c nvme: rename nvme_sc_to_pr_err to nvme_status_to_pr_err
    39517a901b8f cifs: Fix SMB1 readv/writev callback in the same way as SMB2/3
    72a57a7b4f83 cifs: Fix zero_point init on inode initialisation
    82f134ddd4f5 riscv: Fix RISCV_ALTERNATIVE_EARLY
    bb63fe4f5f31 riscv: Improve sbi_ecall() code generation by reordering arguments
    3445b6ccc792 riscv: Add tracepoints for SBI calls and returns
    339b880e7ced riscv: Do not restrict memory size because of linear mapping on nommu
    775a2238aa98 riscv: Fix toolchain vector detection
    1a46c7f6546b smb: client: fix double put of @cfile in smb2_rename_path()
    d195d5fae9b8 gpio: modepin: Enable module autoloading
    fcb0ebed9345 gpio: rockchip: fix OF node leak in probe()
    c2017deb0330 drm/i915/fence: Mark debug_fence_free() with __maybe_unused
    e74af8de40b5 drm/i915/fence: Mark debug_fence_init_onstack() with __maybe_unused
    74182cc77497 nouveau: fix the fwsec sb verification register.
    709aba10e2fa clk: qcom: gcc-sm8550: Don't park the USB RCG at registration time
    0d1e7301225c clk: qcom: gcc-sm8550: Don't use parking clk_ops for QUPs
    527663015f23 ASoC: sunxi: sun4i-i2s: fix LRCLK polarity in i2s mode
    9bf1c67635b5 riscv: mm: Do not restrict mmap address based on hint
    62f6ca61bb88 riscv: selftests: Remove mmap hint address checks
    9795a6bd7172 ASoc: SOF: topology: Clear SOF link platform name upon unload
    68e6917f3d4e clk: qcom: gcc-x1e80100: Don't use parking clk_ops for QUPs
    cf7ce11385cc nvme-pci: allocate tagset on reset if necessary
    6c04d1e3ab22 nvmet-tcp: fix kernel crash if commands allocation fails
    67002edd6c6c ASoC: tegra: Fix CBB error during probe()
    55fe39810bea powerpc/vdso: Don't discard rela sections
    1e08132bc7c7 powerpc/64e: Define mmu_pte_psize static
    7ebaff701efe powerpc/64e: split out nohash Book3E 64-bit code
    4429f9807e63 powerpc/64e: remove unused IBM HTW code
    70eee39bbd05 clk: qcom: ipq9574: Update the alpha PLL type for GPLLs
    7b7a9dac3878 clk: qcom: gcc-x1e80100: Fix USB 0 and 1 PHY GDSC pwrsts flags
    101c62609886 drm/xe/xe2lpg: Extend workaround 14021402888
    2cb699051873 drm/xe/xe2: Add workaround 14021402888
    e70f6ac7b761 net/mlx5e: SHAMPO, Fix page leak
    c26243db74c1 net/mlx5e: SHAMPO, Use KSMs instead of KLMs
    f5ce0b408124 hid: bpf: add BPF_JIT dependency
    17c1e62c7ec2 crypto: starfive - Fix nent assignment in rsa dec
    0e3da92dbf6e crypto: starfive - Align rsa input data to 32-bit
    f9d0026c628c ata: libata-scsi: Check ATA_QCFLAG_RTF_FILLED before using result_tf
    79f80316e6a9 ata: libata-scsi: Remove redundant sense_buffer memsets
    830bdd8a183d drm/amdgpu: handle gfx12 in amdgpu_display_verify_sizes
    4ba7c00d39f6 drm/amd: Add gfx12 swizzle mode defs
    d33a5bff7059 can: mcp251xfd: rx: add workaround for erratum DS80000789E 6 of mcp2518fd
    91c389c7aa93 can: mcp251xfd: clarify the meaning of timestamp
    185c150a826e can: mcp251xfd: rx: prepare to workaround broken RX FIFO head index erratum
    018028d42bbc can: mcp251xfd: mcp251xfd_handle_rxif_ring_uinc(): factor out in separate function
    bc7fbb37e3d2 arm64: acpi: Harden get_cpu_for_acpi_id() against missing CPU entry
    7c7d598974b5 arm64: acpi: Move get_cpu_for_acpi_id() to a header
    eea54a453c1d ACPI: processor: Fix memory leaks in error paths of processor_add()
    560eef75500d ACPI: processor: Return an error if acpi_processor_get_info() fails in processor_add()
    9be835e9fd63 fs: relax permissions for listmount()
    e895aef0485f fs: simplify error handling
    968d52c4dde2 path: add cleanup helper
    da5f374103a1 workqueue: Improve scalability of workqueue watchdog touch
    4b88865d8bf0 workqueue: wq_watchdog_touch is always called with valid CPU
    43568d917d93 mm/memcontrol: respect zswap.writeback setting from parent cg too
    b7d4dd381d3e mm: zswap: rename is_zswap_enabled() to zswap_is_enabled()
    b9b6882e243b perf/aux: Fix AUX buffer serialization
    13123ef14a94 uprobes: Use kzalloc to allocate xol area
    e47d7f80b4d7 clocksource/drivers/timer-of: Remove percpu irq related code
    9c09812e885a clocksource/drivers/imx-tpm: Fix next event not taking effect sometime
    13145027070c clocksource/drivers/imx-tpm: Fix return -ETIME when delta exceeds INT_MAX
    00fe5292f081 VMCI: Fix use-after-free when removing resource in vmci_resource_remove()
    a11874db04ea Drivers: hv: vmbus: Fix rescind handling in uio_hv_generic
    928e399e84f4 uio_hv_generic: Fix kernel NULL pointer dereference in hv_uio_rescind
    2241b78f2245 nvmem: Fix return type of devm_nvmem_device_get() in kerneldoc
    f78addda7afc nvmem: u-boot-env: error if NVMEM device is too small
    540ca4c902d9 dt-bindings: nvmem: Use soc-nvmem node name instead of nvmem
    109e845c1184 binder: fix UAF caused by offsets overwrite
    bfc1704d909d misc: fastrpc: Fix double free of 'buf' in error path
    31b793b08134 usb: typec: ucsi: Fix the partner PD revision
    c1e23cee9ce3 usb: dwc3: Avoid waking up gadget during startxfer
    2ba5ad41218a usb: cdns2: Fix controller reset issue
    0140b2b5b76a usb: dwc3: core: update LC timer as per USB Spec V3.2
    a334f875a886 iio: adc: ad7124: fix DT configuration parsing
    76a160c8e82a iio: adc: ad7124: fix chip ID mismatch
    6e4bf8e79966 iio: adc: ad_sigma_delta: fix irq_flags on irq request
    0e79ed236b4d iio: adc: ad7606: remove frstdata check for serial mode
    6c56053739ad iio: adc: ad7124: fix config comparison
    9de24f9ef0f1 iio: imu: inv_mpu6050: fix interrupt status read for old buggy chips
    b30d022f04a8 iio: fix scale application in iio_convert_raw_to_processed_unlocked
    3d752f729e35 iio: buffer-dmaengine: fix releasing dma channel on error
    8961b245e8f9 staging: iio: frequency: ad9834: Validate frequency parameter value
    84dc375c8350 tcp: process the 3rd ACK with sk_socket for TFO/MPTCP
    98d1b6b48628 fs: only copy to userspace on success in listmount()
    e30b013e24da drm/amdgpu: Fix amdgpu_device_reset_sriov retry logic
    3adb4ae45e42 drm/amdgpu: Add reset_context flag for host FLR
    1f490704c616 drm/amdgpu: Fix two reset triggered in a row
    f9f0b593baef NFSv4: Add missing rescheduling points in nfs_client_return_marked_delegations
    3b692794b81f smb/server: fix potential null-ptr-deref of lease_ctx_info in smb2_open()
    b8186f5cfa4f ata: pata_macio: Use WARN instead of BUG
    9cb25a390a41 spi: spi-fsl-lpspi: limit PRESCALE bit in TCR register
    189d3ed3b25b MIPS: cevt-r4k: Don't call get_c0_compare_int if timer irq is installed
    d1207f07decc kunit/overflow: Fix UB in overflow_allocation_test
    c33a9806dc80 net: hns3: void array out of bound when loop tnl_num
    0f078f8ca93b lib/generic-radix-tree.c: Fix rare race in __genradix_ptr_alloc()
    bf68acd840b6 of/irq: Prevent device address out-of-bounds read in interrupt map walk
    ef4e249971eb Squashfs: sanity check symbolic link size
    51263e839929 usbnet: ipheth: race between ipheth_close and error handling
    d76fc0f0b18d Input: uinput - reject requests with unreasonable number of slots
    adb3e3c1ddb5 HID: amd_sfh: free driver_data after destroying hid device
    48b2108efa20 HID: cougar: fix slab-out-of-bounds Read in cougar_report_fixup
    d21f3480b6db s390/vmlinux.lds.S: Move ro_after_init section behind rodata section
    55b046ec8a4f btrfs: initialize location to fix -Wmaybe-uninitialized in btrfs_lookup_dentry()
    ee73a15d4a8c spi: hisi-kunpeng: Add verification for the max_frequency provided by the firmware
    f743662ab629 kselftests: dmabuf-heaps: Ensure the driver name is null-terminated
    e2d14bfda9eb i3c: mipi-i3c-hci: Error out instead on BUG_ON() in IBI DMA setup
    f62bf0cc6075 i3c: master: svc: resend target address when get NACK
    8d5863cb33aa vfs: Fix potential circular locking through setxattr() and removexattr()
    cec226f9b1fd cachefiles: Set the max subreq size for cache writes to MAX_RW_COUNT
    cae59dffe652 s390/boot: Do not assume the decompressor range is reserved
    66a490d7c5dd regmap: maple: work around gcc-14.1 false-positive warning
    4794579335ca LoongArch: Use correct API to map cmdline in relocate_kernel()
    52d9d4f33b85 drm/amdgpu: add mutex to protect ras shared memory
    42e6607d33c7 net: dpaa: avoid on-stack arrays of NR_CPUS elements
    056e0cd381d5 Bluetooth: btnxpuart: Fix Null pointer dereference in btnxpuart_flush()
    2d82277f6619 tcp: Don't drop SYN+ACK for simultaneous connect().
    81c68e218ab8 PCI: Add missing bridge lock to pci_bus_lock()
    6ffa0fb4f842 riscv: set trap vector earlier
    142ef3a1c98f cxl/region: Verify target positions using the ordered target list
    101737d8b88d ethtool: fail closed if we can't get max channel used in indirection tables
    ef9a8b73c8b6 btrfs: don't BUG_ON() when 0 reference count at btrfs_lookup_extent_info()
    f895db00c65e btrfs: replace BUG_ON() with error handling at update_ref_for_cow()
    a7f16a7a7098 btrfs: handle errors from btrfs_dec_ref() properly
    03804641ec2d btrfs: clean up our handling of refs == 0 in snapshot delete
    a7dfb14798bc btrfs: replace BUG_ON with ASSERT in walk_down_proc()
    704c359b4093 btrfs: don't BUG_ON on ENOMEM from btrfs_lookup_extent_info() in walk_down_proc()
    ab6a217ac577 btrfs: slightly loosen the requirement for qgroup removal
    b5a531dd2f72 fs/ntfs3: Check more cases when directory is corrupted
    5e1a3e5ddf6a smp: Add missing destroy_work_on_stack() call in smp_call_on_cpu()
    0d0d06fbc8f2 drm/amdgpu: reject gang submit on reserved VMIDs
    16c317f16e38 watchdog: imx7ulp_wdt: keep already running watchdog enabled
    9cd15511de7c bpf: Remove tst_run from lwt_seg6local_prog_ops.
    89827a4de802 iommufd: Require drivers to supply the cache_invalidate_user ops
    3913cea77d64 staging: vchiq_core: Bubble up wait_event_interruptible() return value
    bc89b8a2c6e2 PCI: qcom: Override NO_SNOOP attribute for SA8775P RC
    412db603a1d2 perf/x86/intel: Hide Topdown metrics events if the feature is not enumerated
    c16916dd6c16 wifi: mwifiex: Do not return unused priv in mwifiex_get_priv_by_id()
    a90abf931046 dma-mapping: benchmark: Don't starve others when doing the test
    926107e6e3f6 jbd2: avoid mount failed when commit block is partial submitted
    6dd40d964e67 ext4: fix possible tid_t sequence overflows
    bce2c507d99e drm/amdgpu: Set no_hw_access when VF request full GPU fails
    9feed1c5260c libbpf: Add NULL checks to bpf_object__{prev_map,next_map}
    899eddc06e02 ASoc: TAS2781: replace beXX_to_cpup with get_unaligned_beXX for potentially broken alignment
    26825b62bd1b hwmon: (w83627ehf) Fix underflows seen when writing limit attributes
    996221b03099 hwmon: (nct6775-core) Fix underflows seen when writing limit attributes
    16f42953231b hwmon: (lm95234) Fix underflows seen when writing limit attributes
    b0bdb43852bf hwmon: (adc128d818) Fix underflows seen when writing limit attributes
    e74ba5e3056f tracing/kprobes: Add symbol counting check when module loads
    8f2dabd2eef1 crypto: qat - fix unintentional re-enabling of error interrupts
    bba47fe3b038 scsi: lpfc: Handle mailbox timeouts in lpfc_get_sfp_info
    f14d3e1aa613 scsi: pm80xx: Set phy->enable_completion only when we wait for it
    3844586e9bd9 scsi: ufs: core: Remove SCSI host only if added
    25eaef533bf3 wifi: rtw88: usb: schedule rx work after everything is set up
    2745d99da131 virtio_ring: fix KMSAN error for premapped mode
    bfc44075b197 pci/hotplug/pnv_php: Fix hotplug driver crash on Powernv
    2962197b3e92 devres: Initialize an uninitialized struct member
    fc843d3837eb um: line: always fill *error_out in setup_one_line()
    1200485653a0 cgroup: Protect css->cgroup write under css_set_lock
    64149da0fddb block: don't call bio_uninit from bio_endio
    08205763198a iommu/vt-d: Remove control over Execute-Requested requests
    81f8c4381371 iommu/vt-d: Handle volatile descriptor status read
    15364a1ae180 cxl/region: Fix a race condition in memory hotplug notifier
    aa4e90ed8c5d dm init: Handle minors larger than 255
    85c9fdf75cd8 ASoC: topology: Properly initialize soc_enum values
    eb21d40a2189 phy: zynqmp: Take the phy mutex in xlate
    7f093820c084 firmware: cs_dsp: Don't allow writes to read-only controls
    112fd2f02b30 xen: privcmd: Fix possible access to a freed kirqfd instance
    982e057ee188 tools/net/ynl: fix cli.py --subscribe feature
    c61c4a64d246 selftests: net: enable bind tests
    553769473343 net: dsa: vsc73xx: fix possible subblocks range of CAPT block
    b4c56ed51390 net: xilinx: axienet: Fix race in axienet_stop
    7c1ac9e92797 net: bridge: br_fdb_external_learn_add(): always set EXT_LEARN
    7a8d3a25f6b4 r8152: fix the firmware doesn't work
    c46cd6aaca81 fou: Fix null-ptr-deref in GRO.
    58571ffb7843 bareudp: Fix device stats updates.
    c8ffe2d4d37a bpf: add check for invalid name in btf_name_valid_section()
    e454476c4452 bpf, net: Fix a potential race in do_sock_getsockopt()
    d860f25dee0e net: dqs: Do not use extern for unused dql_group
    720f1548fb13 usbnet: modern method to get random MAC
    fc110a08e83c ice: do not bring the VSI up, if it was down before the XDP setup
    041cbd1feb43 ice: remove ICE_CFG_BUSY locking from AF_XDP code
    6ea67b4790a0 ice: check ICE_VSI_DOWN under rtnl_lock when preparing for reset
    391f7dae3d83 ice: protect XDP configuration with a mutex
    2285c2faef19 ice: move netif_queue_set_napi to rtnl-protected sections
    ced032853080 ptp: ocp: adjust sysfs entries to expose tty information
    45e1755eedd6 ptp: ocp: convert serial ports to array
    d9c8dbbc236c net: phy: Fix missing of_node_put() for leds
    6a920f041aeb net: ethernet: ti: am65-cpsw: Fix RX statistics for XDP_TX and XDP_REDIRECT
    1b8719ac77cf perf lock contention: Fix spinlock and rwlock accounting
    4b19c83ba108 hwmon: (hp-wmi-sensors) Check if WMI event data exists
    0b7d7bca20c5 igc: Unlock on error in igc_io_resume()
    70e6473995a4 scripts: fix gfp-translate after ___GFP_*_BITS conversion to an enum
    671013001365 hwmon: ltc2991: fix register bits defines
    58afdc9b1887 Bluetooth: MGMT: Fix not generating command complete for MGMT_OP_DISCONNECT
    cae19117ac36 Bluetooth: hci_sync: Introduce hci_cmd_sync_run/hci_cmd_sync_run_once
    5d8a15c1138e Bluetooth: qca: If memdump doesn't work, re-enable IBS
    c4adc08b85f9 can: kvaser_pciefd: Use a single write when releasing RX buffers
    d1a40a5c2a4c can: kvaser_pciefd: Move reset of DMA RX buffers to the end of the ISR
    330912c6f39d can: kvaser_pciefd: Rename board_irq to pci_irq
    662f25ae3401 can: kvaser_pciefd: Remove unnecessary comment
    fa2951deaea7 can: kvaser_pciefd: Skip redundant NULL pointer check in ISR
    b15bfd9701c6 regulator: core: Stub devm_regulator_bulk_get_const() if !CONFIG_REGULATOR
    6e68abdc5d67 spi: intel: Add check devm_kasprintf() returned value
    7a9203f945fe platform/x86: dell-smbios: Fix error path in dell_smbios_init()
    36486c9e8e01 ice: Add netif_device_attach/detach into PF reset flow
    50161385e9d6 igb: Fix not clearing TimeSync interrupts for 82580
    7dfa4279c55f cifs: Fix FALLOC_FL_ZERO_RANGE to preflush buffered part of target region
    55e78331e0ca cifs: Fix copy offload to flush destination region
    f3d8e8fde454 netfs, cifs: Fix handling of short DIO read
    2e1c24f7f5e5 cifs: Fix lack of credit renegotiation on read retry
    9cf20320a013 rust: kbuild: fix export of bss symbols
    c5a5feb1f84d can: mcp251xfd: fix ring configuration when switching from CAN-CC to CAN-FD mode
    9b6513daa5e2 can: m_can: Reset cached active_interrupts on start
    3fe629aa7d47 can: m_can: disable_all_interrupts, not clear active_interrupts
    281f32ea887e can: m_can: Do not cancel timer from within timer
    83e5c41d1ecd can: m_can: Remove m_can_rx_peripheral indirection
    79ae3475c9cf can: m_can: Remove coalesing disable in isr during suspend
    7eab2b893d5e can: m_can: Reset coalescing during suspend/resume
    abf296d242cd can: m_can: Release irq on error in m_can_open
    abb0a615569e can: bcm: Remove proc entry when dev is unregistered.
    79cc2b84ad24 drm/amdgpu/display: handle gfx12 in amdgpu_dm_plane_format_mod_supported
    14c9b54b28e0 drm/amdgpu: Correct register used to clear fault status
    9073d2cb8fdb drm/amdgpu: check for LINEAR_ALIGNED correctly in check_tiling_flags_gfx6
    ede06d233925 drm/amd/display: Check denominator crb_pipes before used
    11f997143c67 drm/amd/display: Check denominator pbn_div before used
    67c07958facc pcmcia: Use resource_size function on resource object
    b86c6b2ab1c7 media: qcom: camss: Add check for v4l2_fwnode_endpoint_parse
    4afc9cda8ade Input: ili210x - use kvmalloc() to allocate buffer for firmware update
    dd47051c76c8 PCI: keystone: Add workaround for Errata #i2037 (AM65x SR 1.0)
    9ae799838b29 ice: Check all ice_vsi_rebuild() errors in function
    90afe40da0a5 seccomp: release task filters when the task exits
    68d815648094 powerpc/rtas: Prevent Spectre v1 gadget construction in sys_rtas()
    dfd2e8eaa64b fs: relax permissions for statmount()
    15c770640bcb fs: don't copy to userspace under namespace semaphore
    e37e875e40b5 vfio/spapr: Always clear TCEs before unsetting the window
    4fd7a0513d67 media: vivid: don't set HDMI TX controls if there are no HDMI outputs
    9f216ceb125c crypto: qat - initialize user_input.lock for rate_limiting
    47d7b9a56deb drm/amdgpu: clear RB_OVERFLOW bit when enabling interrupts
    c2056c7a840f drm/amdgpu: Fix smatch static checker warning
    9738a1d834fb drm/amdgpu: add missing error handling in function amdgpu_gmc_flush_gpu_tlb_pasid
    5639a3048c70 drm/amd/display: Validate function returns
    47e637193f9a drm/amd/display: Check HDCP returned status
    adc74d25cdbb drm/amd/display: Run DC_LOG_DC after checking link->link_enc
    c1b85157d456 drm/amdgpu: Fix register access violation
    6fe9ca2ca389 usb: gadget: aspeed_udc: validate endpoint index for ast udc
    d66ec9855b21 usb: uas: set host status byte on data completion error
    08155329af59 wifi: rtw89: wow: prevent to send unexpected H2C during download Firmware
    d45b1c62d8af wifi: brcmsmac: advertise MFP_CAPABLE to enable WPA3
    8aa2cd9f37d7 leds: spi-byte: Call of_node_put() on error path
    606cd754cad7 media: vivid: fix wrong sizeimage value for mplane
    f80c65d1e9a6 riscv: kprobes: Use patch_text_nosync() for insn slots
    90cc74552a73 fs/ntfs3: One more reason to mark inode bad
    925fd8ee80d5 udf: Avoid excessive partition lengths
    3cca098c9139 wifi: iwlwifi: mvm: use IWL_FW_CHECK for link ID check
    94dc8dc1c038 gve: Add adminq mutex lock
    39c3b595f3ef netfilter: nf_conncount: fix wrong variable type
    01579894637b iommu: sun50i: clear bypass register
    86e99aab7e18 x86/kmsan: Fix hook for unaligned accesses
    c8cb076f865f af_unix: Remove put_pid()/put_cred() in copy_peercred().
    845af9c8ce03 media: b2c2: flexcop-usb: fix flexcop_usb_memory_req
    34d1122674b8 irqchip/armada-370-xp: Do not allow mapping IRQ 0 and 1
    01e43f1f651c irqchip/renesas-rzg2l: Reorder function calls in rzg2l_irqc_irq_disable()
    b69449b6c174 accel/habanalabs/gaudi2: unsecure edma max outstanding register
    1cf8cd809030 ELF: fix kernel.randomize_va_space double read
    af246e400789 bpf, verifier: Correct tail_call_reachable for bpf prog
    276872034888 virt: sev-guest: Mark driver struct with __refdata to prevent section mismatch
    941358a2c56e cgroup/cpuset: Delay setting of CS_CPU_EXCLUSIVE until valid partition
    4e2b49a85e79 drm/amd/display: Check UnboundedRequestEnabled's value
    73656d1f4a74 smack: unix sockets: fix accept()ed socket label
    25a15f80253a wifi: ath12k: fix firmware crash due to invalid peer nss
    3e0a29500282 wifi: ath12k: fix uninitialize symbol error on ath12k_peer_assoc_h_he()
    b0d13e92d927 ALSA: hda: Add input value sanity checks to HDMI channel map controls
    d4e65b669755 ALSA: control: Apply sanity check of input values for user elements
    1b55a0249ae2 ALSA: hda/realtek: extend quirks for Clevo V5[46]0
    db492b5a322c drm/amd/display: Lock DC and exit IPS when changing backlight
    d1e4d3df12e4 drm/i915: Do not attempt to load the GSC multiple times
    675d6d34fc1c drm/amdgpu: always allocate cleared VRAM for GEM allocations
    1cc695be8920 drm/imagination: Free pvr_vm_gpuva after unlink
    33eb0344e186 drm/panthor: Restrict high priorities on group_create
    a6b268fce7bf drm/panthor: flush FW AS caches in slow reset path
    966fe02a285d drm/xe/gsc: Do not attempt to load the GSC multiple times
    e91dab550dd1 btrfs: zoned: handle broken write pointer on zones
    c3ae6e7b970d btrfs: qgroup: don't use extent changeset when not needed
    74866c16ea21 nilfs2: fix state management in error path of log writing function
    962562d4c70c nilfs2: protect references to superblock parameters exposed in sysfs
    1cf1f7e8cd47 nilfs2: fix missing cleanup on rollforward recovery error
    d7c01c0714c0 sched: sch_cake: fix bulk flow accounting logic for host fairness
    47abd8adddbc ila: call nf_unregister_net_hooks() sooner
    126d72b726c4 tcp_bpf: fix return value of tcp_bpf_sendmsg()
    436dd444d8b2 Revert "wifi: ath11k: support hibernation"
    930840f19ec9 Revert "wifi: ath11k: restore country code during resume"
    3aa52bd43986 Revert "drm/amdgpu: align pp_power_profile_mode with kernel docs"
    82e3e968defb x86/apic: Make x2apic_disable() work correctly
    ce9e83a066f4 x86/fpu: Avoid writing LBR bit to IA32_XSS unless supported
    ddee07e8ad90 net: mctp-serial: Fix missing escapes on transmit
    4982a47154f0 net: mana: Fix error handling in mana_create_txq/rxq's NAPI cleanup
    f579d17a8644 eventfs: Use list_del_rcu() for SRCU protected list variable
    0a11262549ac fscache: delete fscache_cookie_lru_timer when fscache exits to avoid UAF
    98cc18b1b71e userfaultfd: fix checks for huge PMDs
    db978287e908 userfaultfd: don't BUG_ON() if khugepaged yanks our page table
    4679272d5252 tracing/timerlat: Add interface_lock around clearing of kthread in stop_kthread()
    aec14e97c866 tracing: Avoid possible softlockup in tracing_iter_reset()
    8a9d0d405159 tracing/timerlat: Only clear timer if a kthread exists
    27282d2505b4 tracing/osnoise: Use a cpumask to know what threads are kthreads
    0efbad8445fb spi: rockchip: Resolve unbalanced runtime PM / system PM handling
    e7eb8b9c8391 Revert "mm: skip CMA pages when they are not available"
    2d476c86ba47 mm/slub: add check for s->flags in the alloc_tagging_slab_free_hook
    6cf74e0e5e3a mm: vmalloc: ensure vmap_block is initialised before adding to queue
    55c39bb701ba kexec_file: fix elfcorehdr digest exclusion when CONFIG_CRASH_HOTPLUG=y
    bd4c713e0652 maple_tree: remove rcu_read_lock() from mt_validate()
    16ad36c8e66a codetag: debug: mark codetags for poisoned page as empty
    77e240511603 alloc_tag: fix allocation tag reporting when CONFIG_MODULES=n
    1e96ae38257c mm: vmalloc: optimize vmap_lazy_nr arithmetic when purging each vmap_area
    e554113a1cd2 can: mcp251x: fix deadlock if an interrupt occurs during mcp251x_open
    1e8a6948bdbd pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now
    be495259a08e clk: qcom: clk-alpha-pll: Fix the trion pll postdiv set rate API
    382ef041d60e clk: qcom: clk-alpha-pll: Fix the pll post div mask
    d81ef42faf96 clk: starfive: jh7110-sys: Add notifier for PLL0 clock
    c37c00cf3d03 parisc: Delay write-protection until mark_rodata_ro() call
    a3b6ff6c896a riscv: misaligned: Restrict user access to kernel memory
    85cda5b040bd ASoC: Intel: Boards: Fix NULL pointer deref in BYT/CHT boards harder
    2a5f32223e8f fuse: clear PG_uptodate when using a stolen page
    b39cea3a5a93 fuse: fix memory leak in fuse_create_open
    c5a56f3000a9 fuse: use unsigned type for getxattr/listxattr size truncation
    55c0b50148f7 fuse: check aborted connection before adding requests to pending list for resending
    58020fe88352 fuse: disable the combination of passthrough and writeback cache
    7a0b9c73ec42 fuse: update stats for pages in dropped aux writeback list
    73279b3c312f mmc: cqhci: Fix checking of CQHCI_HALT state
    0e8df0942de0 mmc: sdhci-of-aspeed: fix module autoloading
    5b1ef10f7d49 mmc: dw_mmc: Fix IDMAC operation with pages bigger than 4K
    202c58db7a9c mmc: core: apply SD quirks earlier during probe
    129ba129f20b selftests: mm: fix build errors on armhf
    25256e790f9f Bluetooth: MGMT: Ignore keys being loaded with invalid type
    6f774a3a00ec Revert "Bluetooth: MGMT/SMP: Fix address type when using SMP over BREDR/LE"
    70c76a9c55ed rust: macros: provide correct provenance when constructing THIS_MODULE
    bf958898d5f5 nvme-pci: Add sleep quirk for Samsung 990 Evo
    1863e1f098c5 irqchip/riscv-aplic: Fix an IS_ERR() vs NULL bug in probe()
    f13b5afc5c48 rtmutex: Drop rt_mutex::wait_lock before scheduling
    cfcd89ed9c57 x86/kaslr: Expose and use the end of the physical memory address space
    9319bfd74041 irqchip/sifive-plic: Probe plic driver early for Allwinner D1 platform
    028bd7b41f56 irqchip/gic-v2m: Fix refcount leak in gicv2m_of_init()
    8717dc35c0e5 perf/x86/intel: Limit the period on Haswell
    b55ce742afcb x86/tdx: Fix data leak in mmio_read()
    81790a4dce06 ata: libata: Fix memory leak for error path in ata_host_alloc()
    28be82053460 ksmbd: Unlock on in ksmbd_tcp_set_interfaces()
    4c8496f44f5b ksmbd: unset the binding mark of a reused connection
    762099898309 smb: client: fix double put of @cfile in smb2_set_path_size()
    f06af737e4be powerpc/qspinlock: Fix deadlock in MCS queue
    a6370f7196b6 ALSA: hda/realtek: Support mute LED on HP Laptop 14-dq2xxx
    1a892e42d4cc ALSA: hda/realtek - Fix inactive headset mic jack for ASUS Vivobook 15 X1504VAP
    deb8e5a399e9 ALSA: hda/realtek: Enable Mute Led for HP Victus 15-fb1xxx
    e083e14b1344 ALSA: hda/realtek: add patch for internal mic in Lenovo V145
    54e3f7d0a17f ALSA: hda/conexant: Add pincfg quirk to enable top speakers on Sirius devices
    85e5f2451853 KVM: SVM: Don't advertise Bus Lock Detect to guest if SVM support is missing
    67766d01014e KVM: SVM: fix emulation of msr reads/writes of MSR_FS_BASE and MSR_GS_BASE
    ecdbe8ac86fb KVM: x86: Acquire kvm->srcu when handling KVM_SET_VCPU_EVENTS
    6a14fad8be17 ASoC: dapm: Fix UAF for snd_soc_pcm_runtime object
    396c88ab6dab net: ethernet: ti: am65-cpsw: fix XDP_DROP, XDP_TX and XDP_REDIRECT
    f7fe95f40c85 net: microchip: vcap: Fix use-after-free error in kunit test
    2e7189d2b1de net: ethernet: ti: am65-cpsw: Fix NULL dereference on XDP_TX
    590768e13ddd xfs: xfs_finobt_count_blocks() walks the wrong btree
    32008ab989dd sch/netem: fix use after free in netem_dequeue
    03e2a1209a83 libfs: fix get_stashed_dentry()
    1611860f184a Linux 6.10.9
    5c8dc61a17f4 i2c: Use IS_REACHABLE() for substituting empty ACPI functions
    b4fc7d011bc7 drm/amdgpu: remove redundant semicolons in RAS_EVENT_LOG
    9ce27841e0e1 mm: Fix filemap_invalidate_inode() to use invalidate_inode_pages2_range()
    ca32ee853a1e pinctrl: core: reset gpio_device in loop in pinctrl_pins_show()
    f45f8af567b6 media: uvcvideo: Enforce alignment of frame and interval
    b557ccd62c5c crypto: ecc - Fix off-by-one missing to clear most significant digit
    54834585e91c drm/amd/display: Skip wbscl_set_scaler_filter if filter is null
    e46b70a7cfed drm/amd/display: Check BIOS images before it is used
    de449701ca07 drm/amdkfd: use mode1 reset for RAS poison consumption
    41c91c78eac0 drm/amdgpu: set RAS fed status for more cases
    30d1b783b6ee drm/amd/display: Avoid overflow from uint32_t to uint8_t
    31c254c9cd4b drm/amd/display: Disable DMCUB timeout for DCN35
    8dea33a86c26 drm/amd/display: use preferred link settings for dp signal only
    eba4b2a38ccd drm/amd/display: Remove register from DCN35 DMCUB diagnostic collection
    c592b6355b9b drm/amd/display: Correct the defined value for AMDGPU_DMUB_NOTIFICATION_MAX
    6bf920193ba1 drm/amd/display: added NULL check at start of dc_validate_stream
    80a984854ff0 drm/amd/display: Don't use fsleep for PSR exit waits on dmub replay
    0b9696a9bd55 drm/amdgpu: fix overflowed constant warning in mmhub_set_clockgating()
    2fd24d2b99c8 drm/amdgpu: add lock in kfd_process_dequeue_from_device
    ba1123e2e864 drm/amdgpu: add lock in amdgpu_gart_invalidate_tlb
    314883f6db87 drm/amdgpu: add skip_hw_access checks for sriov
    72de6c05742f block: remove the blk_flush_integrity call in blk_integrity_unregister
    dc537a72f648 driver: iio: add missing checks on iio_info's callback access
    af84813cfd29 drm/xe: Add GuC state asserts to deregister_exec_queue
    f909236671fe f2fs: fix to do sanity check on blocks for inline_data inode
    4540181f66cf wifi: cfg80211: make hash table duplicates more survivable
    82fff0aa4aff hwmon: (k10temp) Check return value of amd_smn_read()
    5fa5febeaf17 thermal: trip: Use READ_ONCE() for lockless access to trip properties
    db67686676c7 dmaengine: altera-msgdma: properly free descriptor in msgdma_free_descriptor
    cc8d9d36169d dmaengine: altera-msgdma: use irq variant of spin_lock/unlock while invoking callbacks
    d00f6aab2139 pinctrl: renesas: rzg2l: Validate power registers for SD and ETH
    e797ce6fd49f drm/xe: Check valid domain is passed in xe_force_wake_ref
    5e183e1c7ee2 drm/xe: Ensure caller uses sole domain for xe_force_wake_assert_held
    1fb136939537 drm/bridge: tc358767: Check if fully initialized before signalling HPD event via IRQ
    3e6ff8ca7faa net: tcp/dccp: prepare for tw_timer un-pinning
    b69aadeb26cb RAS/AMD/ATL: Validate address map when information is gathered
    af4dec239583 gfs2: Revert "Add quota_change type"
    5d734665cd5d crypto: stm32/cryp - call finalize with bh disabled
    f756e46704f1 drm/meson: plane: Add error handling
    c909ab41df2b net/mlx5e: SHAMPO, Fix incorrect page release
    1d2de6dd5902 platform/chrome: cros_ec_lpc: MEC access can use an AML mutex
    d3703fa94116 smack: tcp: ipv4, fix incorrect labeling
    61e5929d10b8 regmap: spi: Fix potential off-by-one when calculating reserved size
    bb706e92c87b drm/xe: Don't overmap identity VRAM mapping
    0080bdd9752a drm/amdgu: fix Unintentional integer overflow for mall size
    738cda07e5bb tcp: annotate data-races around tw->tw_ts_recent and tw->tw_ts_recent_stamp
    c64470787959 net: remove NULL-pointer net parameter in ip_metrics_convert
    7ef1d2e240c3 fsnotify: clear PARENT_WATCHED flags lazily
    4ff3d3d18d8f drm/xe: Use missing lock in relay_needs_worker
    99331fe68a8e usb: typec: ucsi: Fix null pointer dereference in trace
    ce16bd3a4a41 usbip: Don't submit special requests twice
    1eea6c49abf7 media: v4l2-cci: Always assign *val
    251f627e25c8 rcu/nocb: Remove buggy bypass lock contention mitigation
    514377ab902c pwm: xilinx: Fix u32 overflow issue in 32-bit width PWM mode.
    053f3b86631d ionic: fix potential irq name truncation
    6aa9ad7f4508 RDMA/efa: Properly handle unexpected AQ completions
    a197446759b3 remoteproc: qcom_q6v5_pas: Add hwspinlock bust on stop
    1e0ecab555b9 soc: qcom: smem: Add qcom_smem_bust_hwspin_lock_by_host()
    145c38e5b540 hwspinlock: Introduce hwspin_lock_bust()
    38c775a1eb33 wifi: mac80211: check ieee80211_bss_info_change_notify() against MLD
    deffdebd9a5a wifi: iwlwifi: mvm: use only beacon BSS load for active links
    bb65c7b0d6c7 remoteproc: mediatek: Zero out only remaining bytes of IPI buffer
    e965c638f3be PCI: al: Check IORESOURCE_BUS existence during probe
    1223b3426e8e cpufreq: scmi: Avoid overflow of target_freq in fast switch
    0c7ac6867e92 wifi: cfg80211: restrict operation during radar detection
    564875db8e8b wifi: iwlwifi: remove fw_running op
    fb8e15ba808d drm/amdgpu: update type of buf size to u32 for eeprom functions
    179cc680f052 drm/amdgpu: Queue KFD reset workitem in VF FED
    79b0da10223b drm/amd/display: Fix pipe addition logic in calc_blocks_to_ungate DCN35
    63c195b4b89b drm/amdgpu: fix compiler 'side-effect' check issue for RAS_EVENT_LOG()
    3863350172a7 drm/kfd: Correct pinned buffer handling at kfd restore and validate process
    17881ea63b2f drm/xe: Fix the warning conditions
    02ed3fcf1d8f wifi: rtw89: ser: avoid multiple deinit on same CAM
    c5d3bf45dc43 drm/amd/pm: check negtive return for table entries
    7b56041e731d drm/amdgpu: fix the warning bad bit shift operation for aca_error_type type
    130c2dc75c8c drm/amdgpu: the warning dereferencing obj for nbio_v7_4
    0312bf150333 drm/amd/pm: check specific index for smu13
    f8e484c9e265 drm/amd/pm: check specific index for aldebaran
    d3f927ef0607 drm/amdgpu: fix the waring dereferencing hive
    00b9594d6310 drm/amdgpu: fix dereference after null check
    a01618adcba7 drm/amdgpu: Fix the warning division or modulo by zero
    aa92264ba6fd drm/amdgpu/vcn: remove irq disabling in vcn 5 suspend
    545f04215ca3 drm/amdgpu/pm: Check input value for power profile setting on smu11, smu13 and smu14
    76b24e94edab drm/amdgpu/pm: Check input value for CUSTOM profile mode setting on legacy SOCs
    286b140b1f71 wifi: ath12k: initialize 'ret' in ath12k_dp_rxdma_ring_sel_config_wcn7850()
    60f098b07e43 wifi: ath11k: initialize 'ret' in ath11k_qmi_load_file_target_mem()
    0573d1701a26 wifi: ath12k: initialize 'ret' in ath12k_qmi_load_file_target_mem()
    c49bbe69ee15 apparmor: fix possible NULL pointer dereference
    2f4e36aaf5bd drm/xe/hwmon: Remove unwanted write permission for currN_label
    ee99ef9ebe02 drm/amdkfd: Reconcile the definition and use of oem_id in struct kfd_topology_device
    578ae965e8b9 drm/amdgpu: fix mc_data out-of-bounds read warning
    23fefef859c6 drm/amdgpu: fix ucode out-of-bounds read warning
    6a634dc4f3a3 drm/amdgpu: Fix uninitialized variable warning in amdgpu_info_ioctl
    db7a86676fd6 drm/amdgpu: Fix out-of-bounds read of df_v1_7_channel_number
    a914c14ad2a2 drm/amdgpu: fix uninitialized variable warning for jpeg_v4
    d32081a430cd drm/amdgpu: fix uninitialized variable warning for amdgpu_xgmi
    820dcbd38a77 drm/amdkfd: Check debug trap enable before write dbg_ev_file
    130bee397b9c drm/amdgpu: Fix out-of-bounds write warning
    3b7b430f6ae2 drm/amdgpu: Fix the uninitialized variable warning
    0c28e581f6fc drm/amdgpu/pm: Fix uninitialized variable agc_btc_response
    e2c7da6fb5e5 drm/amdgpu/pm: Fix uninitialized variable warning for smu10
    734d5247ec3f drm/amd/pm: fix uninitialized variable warnings for vangogh_ppt
    4bbfb0cd9bc4 drm/drm-bridge: Drop conditionals around of_node pointers
    362a93ad2df0 drm/xe: Demote CCS_MODE info to debug only
    e8765364d4f3 drm/amd/amdgpu: Check tbo resource pointer
    aba188d6f4eb drm/amd/display: Fix index may exceed array range within fpu_update_bw_bounding_box
    783d50e8216e drm/amd/display: Fix writeback job lock evasion within dm_crtc_high_irq
    ee9d6df6d917 drm/amd/display: Skip inactive planes within ModeSupportAndSystemConfiguration
    d705b5869f6b drm/amd/display: Ensure index calculation will not overflow
    e10b68e1c9f5 drm/amd/display: Fix Coverity INTEGER_OVERFLOW within decide_fallback_link_setting_max_bw_policy
    05be70f34a6c drm/amd/display: Spinlock before reading event
    34108384e670 drm/amd/display: Release clck_src memory if clk_src_construct fails
    44def55f7554 drm/amd/display: Fix Coverity INTEGER_OVERFLOW within dal_gpio_service_create
    ff9730fafa55 drm/amd/display: Fix Coverity INTERGER_OVERFLOW within construct_integrated_info
    aad4d3d3d3b6 drm/amd/display: Add otg_master NULL check within resource_log_pipe_topology_update
    ac04759b4a00 drm/amd/display: Check link_index before accessing dc->links[]
    26cdb5ed36b9 drm/amd/display: Release state memory if amdgpu_dm_create_color_properties fail
    6590643c5de7 drm/amd/display: Check msg_id before processing transcation
    6a4a08e45e61 drm/amd/display: Check num_valid_sets before accessing reader_wm_sets[]
    a3b5ee22a9d3 drm/amd/display: Add array index check for hdcp ddc access
    ca0b0b0a2230 drm/amd/display: Add missing NULL pointer check within dpcd_extend_address_range
    6c588e9350dd drm/amd/display: Check index for aux_rd_interval before using
    712be65b3b37 drm/amd/display: Fix incorrect size calculation for loop
    36c39a8dcce2 drm/amd/display: Stop amdgpu_dm initialize when link nums greater than max_links
    d398c74c881d drm/amd/display: Stop amdgpu_dm initialize when stream nums greater than 6
    3d4198ab612a drm/amd/display: Check gpio_id before used as array index
    a64284b9e199 drm/amd/display: Ensure array index tg_inst won't be -1
    55e07d7952ac drm/amdgpu: avoid reading vf2pf info size from FB
    152a0eed10e4 drm/xe/gt: Fix assert in L3 bank mask generation
    b137126d70ae drm/amd/pm: fix uninitialized variable warnings for vega10_hwmgr
    5dd675d51828 drm/amdgpu: fix uninitialized scalar variable warning
    d83fb9f9f63e drm/amd/pm: fix the Out-of-bounds read warning
    5551c1937904 drm/amd/pm: fix uninitialized variable warning for smu_v13
    06a3810010b5 drm/amd/pm: Fix negative array index read
    9c2c7ecae01c drm/amd/pm: fix warning using uninitialized value of max_vid_step
    a30173a087cf drm/amd/pm: fix uninitialized variable warning for smu8_hwmgr
    113a28db008e drm/amd/pm: fix uninitialized variable warning
    1e310c74d91b drm/amdgpu/pm: Check the return value of smum_send_msg_to_smc
    3e122ddec66f drm/amdgpu: fix overflowed array index read warning
    b946a27513fe drm/amdgpu: Handle sg size limit for contiguous allocation
    c44b568931d2 drm/amd/display: Assign linear_pitch_alignment even for VM
    5ba5b99ce3b6 drm/amd/display: Handle the case which quad_part is equal 0
    020d0b3acda4 Revert "drm/amd/display: Fix incorrect pointer assignment"
    c9c3366f52d9 drm/amdgpu: Fix uninitialized variable warning in amdgpu_afmt_acr
    ee743f5f8624 selftests: mptcp: join: test for flush/re-add endpoints
    e8d360c9d666 selftests: mptcp: join: check re-re-adding ID 0 signal
    712a5148cfdc selftests: mptcp: join: validate event numbers
    bcad92c9188a selftests: mptcp: join: check re-adding init endp with != id
    2851cf6c57c5 selftests: mptcp: join: check re-using ID of unused ADD_ADDR
    16a71574da28 selftests: mptcp: add explicit test case for remove/readd
    451f7bf9cc61 arm64: dts: qcom: x1e80100-qcp: fix missing PCIe4 gpios
    40d5b7bf2794 arm64: dts: qcom: x1e80100-qcp: fix up PCIe6a pinctrl node
    33dc7e2039f1 arm64: dts: qcom: x1e80100-crd: fix missing PCIe4 gpios
    e6de9b376833 arm64: dts: qcom: x1e80100-crd: fix up PCIe6a pinctrl node
    9606bea70a67 arm64: dts: qcom: x1e80100: Describe the PCIe 6a resources
    b7265d217892 ASoC: codecs: ES8326: button detect issue
    97f9a8690faf ASoC: amd: yc: Support mic on Lenovo Thinkpad E14 Gen 6
    a680c59024b4 net: usb: qmi_wwan: add MeiG Smart SRM825L
    e1e49ba81a96 dma-debug: avoid deadlock between dma debug vs printk and netconsole
    93658715e6f1 virtio-net: check feature before configuring the vq coalescing command
    7ced32ce3a7a i2c: Fix conditional for substituting empty ACPI functions
    e42ef22bc10f btrfs: fix qgroup reserve leaks in cow_file_range
    a52397fc1e51 btrfs: scrub: update last_physical after scrubbing one stripe
    984bd0470143 btrfs: factor out stripe length calculation into a helper
    5f4a377f56e6 platform/x86/amd/pmf: Add new ACPI ID AMDI0107
    3d5c26b08bde platform/x86/amd: pmf: Add quirk for ROG Ally X
    2d118bb07fdd spi: hisi-kunpeng: Add validation for the minimum value of speed_hz
    7bfee532b6f5 ASoC: amd: yc: Support mic on HP 14-em0002la
    8f215abf7755 smb: client: fix FSCTL_GET_REPARSE_POINT against NetApp
    432afacede47 net/mlx5: DR, Fix 'stack guard page was hit' error in dr_rule
    67b2cc15774c ALSA: seq: ump: Explicitly reset RPN with Null RPN
    e7e26824f5ca ALSA: seq: ump: Transmit RPN/NRPN message at each MSB/LSB data reception
    a2e6dd2bbadd ALSA: seq: ump: Use the common RPN/bank conversion context
    d0e17d1676ca ALSA: ump: Explicitly reset RPN with Null RPN
    a894f0117ff1 ALSA: ump: Transmit RPN/NRPN message at each MSB/LSB data reception
    b348eac11cb3 x86/CPU/AMD: Add models 0x60-0x6f to the Zen5 range
    f0d4faa80023 ALSA: hda/conexant: Mute speakers at suspend / shutdown
    2ae9f8706a8d ALSA: hda/generic: Add a helper to mute speakers at suspend/shutdown
    fbaafe4c8f79 btrfs: tree-checker: validate dref root and objectid
    54b20f6ef361 scsi: ufs: core: Bypass quick recovery if force reset is needed
    fef611b98c32 scsi: ufs: core: Check LSDBS cap when !mcq
    26de03c2ddc4 drm: panel-orientation-quirks: Add quirk for OrangePi Neo
    63945b7948ef drm/fb-helper: Don't schedule_work() to flush frame buffer during panic()
    c4386c5293aa drivers: gpu: drm: msm: registers: improve reproducibility
    915a386c7cff qemux86: add configuration symbol to select values
    62df91b21626 sched/isolation: really align nohz_full with rcu_nocbs
    afe643f5802b clear_warn_once: add a clear_warn_once= boot parameter
    7b016793edbf clear_warn_once: bind a timer to written reset value
    89a5c70f2000 clear_warn_once: expand debugfs to include read support
    8014704c527d tools: Remove some options from CLANG_CROSS_FLAGS
    e9ca44556936 libbpf: Fix build warning on ref_ctr_off
    32fe8c972c36 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    a372ac2b798d perf: x86-32: explicitly include <errno.h>
    a5cb41682777 perf: mips64: Convert __u64 to unsigned long long
    ed8ee9f3d1ae perf: fix bench numa compilation
    6dbb2915e8a7 perf: add SLANG_INC for slang.h
    57f78dddfd93 perf: add sgidefs.h to for mips builds
    130f0306cfba perf: change --root to --prefix for python install
    2520efe95341 perf: add 'libperl not found' warning
    45731b6ae676 perf: force include of <stdbool.h>
    ace10f8dec53 fat: Replace prandom_u32() with get_random_u32()
    64797bdca14e fat: don't use obsolete random32 call in namei_vfat
    2442bae1a645 FAT: Added FAT_NO_83NAME
    7561126bce00 FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    5c51ab959876 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5869720658c9 aufs6: match exports to functions
    e125467cf228 aufs: adjust for v6.9+
    eebcdc6635bf aufs6: correct do_splice_from prototype
    4c5829036c45 aufs: update remove_page to remove_folio
    e8d889d0f434 aufs: i_op: Add handling for au_pin_hdir_set_owner with RT kernel
    3ecd9203de17 aufs: fix v6.7 kernel build compilation
    5e8ee028dbe2 aufs6: adapt to v6.6 i_op->ctime changes
    1132c330feed aufs6: adapt to v6.6
    d3e4ede69603 aufs6: core
    49ec9271f41d aufs6: standalone
    dcc0978da2dd aufs6: mmap
    80e1609b37e7 aufs6: base
    0dbb3f062420 aufs6: kbuild
    ad51078c5ebf yaffs: fix mtime/itime field access
    e5f1d35d6188 yaffs2: update VFS ctime operations to 6.6+
    dd374461adc7 yaffs2: v6.5 fixups
    f5908785d88d yaffs2: Fix miscalculation of devname buffer length
    d1403f0acfdf yaffs2: convert user_namespace to mnt_idmap
    7dae5463b54f yaffs2: replace bdevname call with sprintf
    92d30df4eb56 yaffs2: convert read_page -> readfolio
    6c895bffdf72 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    6801e7d90255 yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    aff012190046 yaffs2: v5.12+ build fixups (not runtime tested)
    fb474842c16e yaffs: include blkdev.h
    fe7d745aac94 yaffs: fix misplaced variable declaration
    bee147b2e533 yaffs2: v5.6 build fixups
    22998f589ec2 yaffs2: fix memory leak when /proc/yaffs is read
    ce7d8084a976 yaffs: add strict check when call yaffs_internal_read_super
    adb7202fda95 yaffs: repair yaffs_get_mtd_device
    2852e5c15d4d yaffs: Fix build failure by handling inode i_version with proper atomic API
    1526802a8147 yaffs2: fix memory leak in mount/umount
    6c7827a16aaa yaffs: Avoid setting any ACL releated xattr
    fa3482815542 Yaffs:check oob size before auto selecting Yaffs1
    aaa4843b73ce fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    48e992af6531 yaffs2: adjust to proper location of MS_RDONLY
    f3af7160d8a0 yaffs2: import git revision b4ce1bb (jan, 2020)
    4add698ed6e8 initramfs: allow an optional wrapper script around initramfs generation
    b619a8d54336 vt/conmakehash: improve reproducibility
    c786186aeef3 tools: use basename to identify file in gen-mach-types
    aa3a8e7ceb6e iwlwifi: select MAC80211_LEDS conditionally
    325db54c4be9 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    23a87c6e13aa defconfigs: drop obselete options
    946e5b78ab94 linux-yocto: Handle /bin/awk issues
    9daee1dba585 uvesafb: provide option to specify timeout for task completion
    f68b8683441a uvesafb: print error message when task timeout occurs
    a1595c6b6017 compiler.h: Undef before redefining __attribute_const__
    8086839613c6 vmware: include jiffies.h
    32e79eb3c169 Resolve jiffies wrapping about arp
    f6fabf91b6f2 nfs: Allow default io size to be configured.
    ad2b29f801e9 check console device file on fs when booting
    5194785d545b mount_root: clarify error messages for when no rootfs found
    78b3498cb59a mconf: fix output of cflags and libraries
    9cc6870708d5 menuconfig,mconf-cfg: Allow specification of ncurses location
    f34088ed9c93 modpost: mask trivial warnings
    4784584582f5 kbuild: exclude meta directory from distclean processing
    73072b5fe25a powerpc: serialize image targets
    a120eb200320 arm: serialize build targets
    51d5719ac05b mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    5155f0bb36f0 cpu/amd: inhibit SMP check for qemux86
    e5a5996ee586 x86_64_defconfig: Fix warnings
    1359db75df0c mips: make current_cpu_data preempt safe
    385edf6090c3 mips: vdso: fix 'jalr $t9' crash in vdso code
    968266397319 mips: Kconfig: add QEMUMIPS64 option
    389ce854fde3 4kc cache tlb hazard: tlbp cache coherency
    9cab61199fa8 malta uhci quirks: make allowance for slow 4k(e)c
    80cae3bd9eea arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    41c82709900f drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    59ef4f151a5e arm64: defconfig: cleanup config options
    c5fb425762ed vexpress: Pass LOADADDR to Makefile
    07a8b544d4e9 arm: ARM EABI socketcall
    574f3ae3d2ca ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit aa6e9888173ce4252c0f2ad8cdd94c8ff795cff2)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.10.bb              |  6 ++--
 .../linux/linux-yocto-tiny_6.10.bb            |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.10.bb | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
index b2e9071615..b5f2b5229d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.10.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b8e8a499763e5f192540d76dcbed6b545b7dafc5"
-SRCREV_meta ?= "a9ca38a63029cdc0c92bb37d3156304bf0a17ad0"
+SRCREV_machine ?= "fa096b126e55041c72c87f74ea92116695c1e194"
+SRCREV_meta ?= "4bf82718cf80c9888c75799b1d10cde07bebd155"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.10.8"
+LINUX_VERSION ?= "6.10.11"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
index 62354201b0..ba1d10f5d5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.10.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.10.inc
 
-LINUX_VERSION ?= "6.10.8"
+LINUX_VERSION ?= "6.10.11"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
-SRCREV_meta ?= "a9ca38a63029cdc0c92bb37d3156304bf0a17ad0"
+SRCREV_machine ?= "6c956b2ea691fe2ba5521aa6c6674defb05de4fe"
+SRCREV_meta ?= "4bf82718cf80c9888c75799b1d10cde07bebd155"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.10.bb b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
index d21aea3551..cee06c22ea 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.10.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86.104 ?= "v6.10/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.10/standard/base"
 KBRANCH:qemumips64 ?= "v6.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8df31eb72735ccc31dd9c533b69be987bea50ee4"
-SRCREV_machine:qemuarm64 ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
-SRCREV_machine:qemuloongarch64 ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
-SRCREV_machine:qemumips ?= "95be5bc86ab306b47c92a91bace9737dff60c461"
-SRCREV_machine:qemuppc ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
-SRCREV_machine:qemuriscv64 ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
-SRCREV_machine:qemuriscv32 ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
-SRCREV_machine:qemux86 ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
-SRCREV_machine:qemux86-64 ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
-SRCREV_machine:qemumips64 ?= "5fdfe03b830e275d165d1bc655dd4a7b9072aecc"
-SRCREV_machine ?= "1025debfd0d40f7f8d0547328bbf50ac543bdeba"
-SRCREV_meta ?= "a9ca38a63029cdc0c92bb37d3156304bf0a17ad0"
+SRCREV_machine:qemuarm ?= "121079aa57b0b3a7cc06c50c44dd13386ee622d3"
+SRCREV_machine:qemuarm64 ?= "6c956b2ea691fe2ba5521aa6c6674defb05de4fe"
+SRCREV_machine:qemuloongarch64 ?= "6c956b2ea691fe2ba5521aa6c6674defb05de4fe"
+SRCREV_machine:qemumips ?= "6fb3af96c4c0dc5453909749875b8390b66d32e6"
+SRCREV_machine:qemuppc ?= "6c956b2ea691fe2ba5521aa6c6674defb05de4fe"
+SRCREV_machine:qemuriscv64 ?= "6c956b2ea691fe2ba5521aa6c6674defb05de4fe"
+SRCREV_machine:qemuriscv32 ?= "6c956b2ea691fe2ba5521aa6c6674defb05de4fe"
+SRCREV_machine:qemux86 ?= "6c956b2ea691fe2ba5521aa6c6674defb05de4fe"
+SRCREV_machine:qemux86-64 ?= "6c956b2ea691fe2ba5521aa6c6674defb05de4fe"
+SRCREV_machine:qemumips64 ?= "37f661e601fa802d54da17d4daa343910cecb1a3"
+SRCREV_machine ?= "6c956b2ea691fe2ba5521aa6c6674defb05de4fe"
+SRCREV_meta ?= "4bf82718cf80c9888c75799b1d10cde07bebd155"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "560ed1386571c54598065fb9e80ff54855e2236d"
+SRCREV_machine:class-devupstream ?= "8a886bee7aa574611df83a028ab435aeee071e00"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.10/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.10;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.10.8"
+LINUX_VERSION ?= "6.10.11"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


