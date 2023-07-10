Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8018C04A94
	for <webhook@archiver.kernel.org>; Mon, 10 Jul 2023 03:20:37 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.32105.1688959230598548436
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jul 2023 20:20:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=n9dH5S+v;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-634efb81e8dso23812526d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 09 Jul 2023 20:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688959229; x=1691551229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Gt25j8y8sexB0POl25FoqxcPCMLtTwqwPSXfEcPrbg=;
        b=n9dH5S+vWOLfOKAZsSTzpwm67Ag2Rzhr8V6bjEHoXRYEUAa6V1oUTUQpj4x6lIMvXb
         auNeH7ssb8xkLX3Kx3MACGmKAb299Axps3jN/AKT9koYERBZu5hFJmGaHZuVp7xIRJe4
         JV1t9qSkKkJIOsdQZtdE/ES5gTWksyv8c3VPULEmzlhCvwZ3mdfsOgMLA/0lXyCshJSa
         jhobAMMjp8Mvh431o1ZqE2bBwWp6qRGPX5/4LuSp3BkIUxac1le549fWLDku8jhCmLEM
         9Hd3HM34ISa0ujpa9Ey/p+iIRhVYzWMc1GaR4J8360/An0oE6rYk2UI0jK8QclqUiA/8
         ZZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688959229; x=1691551229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Gt25j8y8sexB0POl25FoqxcPCMLtTwqwPSXfEcPrbg=;
        b=O9E+0O64Q6CjNEp3JTJMy6LZ6ST6tHJleq35ciD1CiN/5pgUk2Y4Yo9bzeGaOPMKW5
         6QEpSfvuGYhqwe6dqHZ/WpLl1sRsIAkCLVq4KPXcL9Z2iQrUeGsQOM8qwEYwA1ANsREs
         d/lZMoB70B3fjd8b+7bJm9auMkjH3Q58536/A+4A7d3H+5gB4CB+uI8bGSkR+KqdgfcM
         5PMsc/QTJnVClt6b7PCnTQkwv2cfUgDBIDtzh4cPESwb4JbFTAtDU1UbklXwcEdU4imr
         ReVSq4sJlAsyB7XsYMmAIfFlM4PN6Hwl8TuIs4N8LdOk6K3xu0ALkg8mPM/0wNail6wd
         MSmg==
X-Gm-Message-State: ABy/qLb0MtJXKIO/OMU451+/NwjYjBfLaTGeGm0eRiUgB4TyRjZ/R1+/
	IlC5rlPa30+dr6OnPBku9H4XRURylIw=
X-Google-Smtp-Source: APBJJlGNwEHoadPxgK6jexZHYbe0lcz6w2k/jHTfR5T7oM0h7YPzX6somrYeeqcJ6C2DoUVP/khdRg==
X-Received: by 2002:a0c:e10a:0:b0:631:eb39:b7a0 with SMTP id w10-20020a0ce10a000000b00631eb39b7a0mr9631904qvk.38.1688959229371;
        Sun, 09 Jul 2023 20:20:29 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id d15-20020a0cf0cf000000b00630228acc45sm5039863qvl.145.2023.07.09.20.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jul 2023 20:20:29 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/15] linux-yocto/6.1: update to v6.1.36
Date: Sun,  9 Jul 2023 23:20:12 -0400
Message-Id: <854dc2c1743f8fa919bfe29ca8a3d5e0d746a9ce.1688958789.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688958788.git.bruce.ashfield@gmail.com>
References: <cover.1688958788.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jul 2023 03:20:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184043

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    a1c449d00ff8 Linux 6.1.36
    29429a1f5871 smb: move client and server files to common directory fs/smb
    9d3e4bca4b92 i2c: imx-lpi2c: fix type char overflow issue when calculating the clock cycle
    81d4078f7a42 x86/apic: Fix kernel panic when booting with intremap=off and x2apic_phys
    679354bea008 KVM: arm64: Restore GICv2-on-GICv3 functionality
    6ab9468d3eea vhost_net: revert upend_idx only on retriable error
    454e4f391a14 vhost_vdpa: tell vqs about the negotiated
    1af1cd7be370 drm/radeon: fix race condition UAF in radeon_gem_set_domain_ioctl
    022f2306d94f drm/exynos: fix race condition UAF in exynos_g2d_exec_ioctl
    aa88042218aa drm/exynos: vidi: fix a wrong error return
    711f727f7bab null_blk: Fix: memory release when memory_backed=1
    f6076a1386c9 ARM: dts: Fix erroneous ADS touchscreen polarities
    1d1baefacdb4 i2c: mchp-pci1xxxx: Avoid cast to incompatible function type
    8e3257599409 ALSA: hda/realtek: Add "Intel Reference board" and "NUC 13" SSID in the ALC256
    cfa01235b5ed ASoC: fsl_sai: Enable BCI bit if SAI works on synchronous mode with BYP asserted
    570583c6251a s390/purgatory: disable branch profiling
    c2888c460db2 gfs2: Don't get stuck writing page onto itself under direct I/O
    878dad66b9b5 ASoC: amd: yc: Add Thinkpad Neo14 to quirks list for acp6x
    1c97025d441f ASoC: nau8824: Add quirk to active-high jack-detect
    5cc506e9b3e5 soundwire: qcom: add proper error paths in qcom_swrm_startup()
    2839e0b64e65 soundwire: dmi-quirks: add new mapping for HP Spectre x360
    ee4d36a14d3f ASoC: simple-card: Add missing of_node_put() in case of error
    e701fb0a5d5b ASoC: codecs: wcd938x-sdw: do not set can_multi_write flag
    06b9522ca831 spi: lpspi: disable lpspi module irq in DMA mode
    39a77f005f8a s390/cio: unregister device when the only path is gone
    552a24eb7168 arm64: dts: qcom: sc7280-qcard: drop incorrect dai-cells from WCD938x SDW
    4de58b7c14c0 arm64: dts: qcom: sc7280-idp: drop incorrect dai-cells from WCD938x SDW
    2e8ebf1a44cb Input: soc_button_array - add invalid acpi_index DMI quirk handling
    ba0cc7a2e508 nvme: improve handling of long keep alives
    06d9ec407f76 nvme: check IO start time when deciding to defer KA
    8a72260619ca nvme: double KA polling frequency to avoid KATO with TBKAS on
    c8f988c37a6b usb: gadget: udc: fix NULL dereference in remove()
    3f6391062d0b btrfs: fix an uninitialized variable warning in btrfs_log_inode
    a2c3e9bfc02c nfcsim.c: Fix error checking for debugfs_create_dir
    a05df0643120 media: cec: core: don't set last_initiator if tx in progress
    f37956a140d1 media: cec: core: disable adapter in cec_devnode_unregister
    9d8ac2726cff smb3: missing null check in SMB2_change_notify
    3e8458c5b205 arm64: Add missing Set/Way CMO encodings
    8428f4c00d8c HID: wacom: Add error check to wacom_parse_and_register()
    aaa50510adb7 scsi: target: iscsi: Prevent login threads from racing between each other
    0357259cb103 gpiolib: Fix irq_domain resource tracking for gpiochip_irqchip_add_domain()
    8592ada80ea5 gpio: sifive: add missing check for platform_get_irq
    cb1108e17493 gpiolib: Fix GPIO chip IRQ initialization restriction
    90714f7ed760 arm64: dts: rockchip: fix nEXTRST on SOQuartz
    e51abd4808f9 arm64: dts: rockchip: Enable GPU on SOQuartz CM4
    ec3d0f12e728 revert "net: align SO_RCVMARK required privileges with SO_MARK"
    b2e2f9c0939f sch_netem: acquire qdisc lock in netem_change()
    0434277b72a4 platform/x86/amd/pmf: Register notify handler only if SPS is enabled
    2d580c73afdc selftests: forwarding: Fix race condition in mirror installation
    eff07bf11841 io_uring/net: use the correct msghdr union member in io_sendmsg_copy_hdr
    1b7b048c228e bpf: Force kprobe multi expected_attach_type for kprobe_multi link
    fc3afb337814 bpf/btf: Accept function names that contain dots
    22cc989f2b10 Revert "net: phy: dp83867: perform soft reset and retain established link"
    3e04743dbacf netfilter: nfnetlink_osf: fix module autoload
    abd3afddbf9e netfilter: nf_tables: disallow updates of anonymous sets
    c34b22038543 netfilter: nf_tables: reject unbound chain set before commit phase
    46f801ab5fb9 netfilter: nf_tables: reject unbound anonymous set before commit phase
    b60c0ce0ff31 netfilter: nf_tables: disallow element updates of bound anonymous sets
    0d836f917520 netfilter: nft_set_pipapo: .walk does not deal with generations
    d60be2da67d1 netfilter: nf_tables: drop map element references from preparation phase
    df27be7c1530 netfilter: nf_tables: add NFT_TRANS_PREPARE_ERROR to deal with bound set/chain
    891cd2edddc7 netfilter: nf_tables: fix chain binding transaction logic
    f5b6dbec26f1 be2net: Extend xmit workaround to BE3 chip
    50f689918db4 net: dsa: mt7530: fix handling of LLDP frames
    a50f84af215e net: dsa: mt7530: fix handling of BPDUs on MT7530 switch
    a4e4c7190126 net: dsa: mt7530: fix trapping frames on non-MT7621 SoC MT7530 switch
    7fd2e9a69e83 ipvs: align inner_mac_header for encapsulation
    6d1eec1f2dd7 mmc: usdhi60rol0: fix deferred probing
    7e10fff13353 mmc: sh_mmcif: fix deferred probing
    565b8bd2905d mmc: sdhci-acpi: fix deferred probing
    645f89ee3e3e mmc: owl: fix deferred probing
    251101c32a01 mmc: omap_hsmmc: fix deferred probing
    0057a905de5c mmc: omap: fix deferred probing
    f73b380518b2 mmc: mvsdio: fix deferred probing
    4806f6b6b7a3 mmc: mtk-sd: fix deferred probing
    d28b7a87332f net: qca_spi: Avoid high load if QCA7000 is not available
    1d4dd09f13a9 sfc: use budget for TX completions
    0bbb8164ed07 net/mlx5: DR, Fix wrong action data allocation in decap action
    b062caf4f73b xfrm: Linearize the skb after offloading if needed.
    fff9a18e0128 selftests: net: fcnal-test: check if FIPS mode is enabled
    0793ead2ff2c selftests: net: vrf-xfrm-tests: change authentication and encryption algos
    6919634176cd selftests: net: tls: check if FIPS mode is enabled
    ac5671d10060 bpf: Fix a bpf_jit_dump issue for x86_64 with sysctl bpf_jit_enable.
    8bb51cdc4fc2 xfrm: fix inbound ipv4/udp/esp packets to UDPv6 dualstack sockets
    d9a0b1a53c79 bpf: Fix verifier id tracking of scalars on spill
    461fc3391c52 bpf: track immediate values written to stack by BPF_ST instruction
    b36ba84f09a1 KVM: arm64: PMU: Restore the host's PMUSERENR_EL0
    c803e91600be xfrm: Ensure policies always checked on XFRM-I input path
    94e81817f080 xfrm: interface: rename xfrm_interface.c to xfrm_interface_core.c
    8ea03341f78a xfrm: Treat already-verified secpath entries as optional
    43489b2cba5a ieee802154: hwsim: Fix possible memory leaks
    caddcdf2a999 mmc: meson-gx: fix deferred probing
    1a2793a25a60 memfd: check for non-NULL file_seals in memfd_create() syscall
    364fdcbb035b x86/mm: Avoid using set_pgd() outside of real PGD pages
    cbfee3d9d5c0 nilfs2: prevent general protection fault in nilfs_clear_dirty_page()
    24f473769e7e io_uring/poll: serialize poll linked timer start with poll removal
    2d80c85fa404 arm64: dts: rockchip: Fix rk356x PCIe register and range mappings
    277a7c23b590 regmap: spi-avmm: Fix regmap_bus max_raw_write
    b385b1d28e4e regulator: pca9450: Fix LDO3OUT and LDO4OUT MASK
    ad5daeaa3d57 spi: spi-geni-qcom: correctly handle -EPROBE_DEFER from dma_request_chan()
    21945b7a868f wifi: iwlwifi: pcie: Handle SO-F device for PCI id 0x7AF0
    1dfca388fc7c bpf: ensure main program has an extable
    03b2149d5aca mmc: sunxi: fix deferred probing
    8b8756324c5b mmc: bcm2835: fix deferred probing
    1db5a39a904e mmc: sdhci-spear: fix deferred probing
    f1b17198e45b mmc: mmci: stm32: fix max busy timeout calculation
    6c2af0fd8301 mmc: meson-gx: remove redundant mmc_request_done() call from irq context
    687d34c57807 mmc: sdhci-msm: Disable broken 64-bit DMA on MSM8916
    3dd0041c41da mmc: litex_mmc: set PROBE_PREFER_ASYNCHRONOUS
    0d7a4e6589a0 cgroup,freezer: hold cpu_hotplug_lock before freezer_mutex in freezer_css_{online,offline}()
    7b162a18d332 cgroup: Do not corrupt task iteration when rebinding subsystem
    c2c46a70282f mptcp: consolidate fallback and non fallback state machine
    1d3127542665 mptcp: fix possible list corruption on passive MPJ
    b747e755986a mptcp: fix possible divide by zero in recvmsg()
    b7bb71dfb541 mptcp: handle correctly disconnect() failures
    1d9dc9bed999 io_uring/net: disable partial retries for recvmsg with cmsg
    4d729cc67b05 io_uring/net: clear msg_controllen on partial sendmsg retry
    4db49d59a89c PCI: hv: Add a per-bus mutex state_lock
    091d03d19859 PCI: hv: Fix a race condition in hv_irq_unmask() that can cause panic
    5c09925b1879 PCI: hv: Remove the useless hv_pcichild_state from struct hv_pci_dev
    da2fff20d92d Revert "PCI: hv: Fix a timing issue which causes kdump to fail occasionally"
    a74a9d9b756a PCI: hv: Fix a race condition bug in hv_pci_query_relations()
    ba803d7ac18a Drivers: hv: vmbus: Fix vmbus_wait_for_unload() to scan present CPUs
    191cb913293a Drivers: hv: vmbus: Call hv_synic_free() if hv_synic_alloc() fails
    4f7e702b74f7 KVM: Avoid illegal stage2 mapping on invalid memory slot
    390aeb5ae7c0 ACPI: sleep: Avoid breaking S3 wakeup due to might_sleep()
    8e63b1fd24a8 nilfs2: fix buffer corruption due to concurrent device reads
    d5d7cde2ad19 scripts: fix the gfp flags header path in gfp-translate
    4a89bfb1a142 writeback: fix dereferencing NULL mapping->host on writeback_page_template
    1fed1f851346 selftests: mptcp: join: fix "userspace pm add & remove address"
    53e096bcaeac selftests: mptcp: join: skip fail tests if not supported
    f17459121c37 selftests: mptcp: join: skip userspace PM tests if not supported
    f40a7ded34c9 selftests: mptcp: join: skip test if iptables/tc cmds fail
    bce23d125434 selftests: mptcp: sockopt: skip TCP_INQ checks if not supported
    157dcb20000b selftests: mptcp: diag: skip listen tests if not supported
    755c8857abde selftests/mount_setattr: fix redefine struct mount_attr build error
    94851666aff4 selftests: mptcp: join: skip MPC backups tests if not supported
    fe1f28db73f7 selftests: mptcp: join: skip fullmesh flag tests if not supported
    6313c493e3c9 selftests: mptcp: join: skip backup if set flag on ID not supported
    efb4f6c2dd4c selftests: mptcp: join: skip implicit tests if not supported
    dd6c284a3430 selftests: mptcp: join: support RM_ADDR for used endpoints or not
    695cce2f2cf5 selftests: mptcp: join: skip Fastclose tests if not supported
    0381f30735e2 selftests: mptcp: join: support local endpoint being tracked or not
    1c0d9b4b4745 selftests: mptcp: join: skip check if MIB counter not supported
    e35edb09e53e selftests: mptcp: join: helpers to skip tests
    4d65ec947d24 selftests: mptcp: join: use 'iptables-legacy' if available
    44d3366bf4b9 selftests: mptcp: lib: skip if not below kernel version
    c5bdd8eb8e7d selftests: mptcp: userspace pm: skip if not supported
    733bf9d80d95 selftests: mptcp: userspace pm: skip if 'ip' tool is unavailable
    bfe225dec643 selftests: mptcp: sockopt: skip getsockopt checks if not supported
    103b4e62de32 selftests: mptcp: sockopt: relax expected returned size
    61c1bf0666a9 selftests: mptcp: pm nl: skip fullmesh flag checks if not supported
    41f7f7f6e43e selftests: mptcp: pm nl: remove hardcoded default limits
    e79e5e7642ad selftests: mptcp: connect: skip disconnect tests if not supported
    cba0db9c1586 selftests: mptcp: connect: skip transp tests if not supported
    9ead68270b29 selftests: mptcp: lib: skip if missing symbol
    4bed22c6876b selftests: mptcp: join: fix ShellCheck warnings
    a032ccca15e1 selftests: mptcp: remove duplicated entries in usage
    0c6552f83725 tick/common: Align tick period during sched_timer setup
    854156d12caa ksmbd: validate session id and tree id in the compound request
    c86211159bc3 ksmbd: fix out-of-bound read in smb2_write
    9650cf70ec9d ksmbd: validate command payload size
    0fd4ac3773c3 tpm_crb: Add support for CRB devices based on Pluton
    a46fa5696613 tpm, tpm_tis: Claim locality in interrupt handler
    2e7ad879e1b0 mm: Fix copy_from_user_nofault().
    4ed740c6482f ata: libata-scsi: Avoid deadlock on rescan after device resume
    c4465bff4d2f tty: serial: fsl_lpuart: reduce RX watermark to 0 on LS1028A
    17732fed852a tty: serial: fsl_lpuart: make rx_watermark configurable for different platforms
    9bcac453890b drm/amd/display: fix the system hang while disable PSR
    e538342002cb drm/amd/display: Add wrapper to call planes and stream update
    8d855bc67630 drm/amd/display: Use dc_update_planes_and_stream

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 54ead24ded..19758206bc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "6f370bf9127713eccdfb3cf009c46ef4852aec28"
-SRCREV_meta ?= "b358c237cf493dcf5af1760fc4632ede32e1ff2e"
+SRCREV_machine ?= "5227a8173cee7256e370750216dbff5eca741134"
+SRCREV_meta ?= "aba2c2181163cf40e3f8c5618c05e78e931f235b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.35"
+LINUX_VERSION ?= "6.1.36"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index fd2e2511d5..48cc6b87fb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.35"
+LINUX_VERSION ?= "6.1.36"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "682b17e1d76bc4364fcc9864f39c31c855b5f5df"
-SRCREV_meta ?= "b358c237cf493dcf5af1760fc4632ede32e1ff2e"
+SRCREV_machine ?= "6ba5ae474699ee9e6dd39874dfdb680959f55ffd"
+SRCREV_meta ?= "aba2c2181163cf40e3f8c5618c05e78e931f235b"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 1838a1e031..5587c0d5b5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "915f4d2237d1c8e23eb67eda0b8e9b24373a80b4"
-SRCREV_machine:qemuarm64 ?= "682b17e1d76bc4364fcc9864f39c31c855b5f5df"
-SRCREV_machine:qemuloongarch64 ?= "682b17e1d76bc4364fcc9864f39c31c855b5f5df"
-SRCREV_machine:qemumips ?= "1aad3fa2eba5594fb4e779fc53fef6046d833c91"
-SRCREV_machine:qemuppc ?= "682b17e1d76bc4364fcc9864f39c31c855b5f5df"
-SRCREV_machine:qemuriscv64 ?= "682b17e1d76bc4364fcc9864f39c31c855b5f5df"
-SRCREV_machine:qemuriscv32 ?= "682b17e1d76bc4364fcc9864f39c31c855b5f5df"
-SRCREV_machine:qemux86 ?= "682b17e1d76bc4364fcc9864f39c31c855b5f5df"
-SRCREV_machine:qemux86-64 ?= "682b17e1d76bc4364fcc9864f39c31c855b5f5df"
-SRCREV_machine:qemumips64 ?= "53e7685d6da27e112397e71c27a0bce0fc9313a9"
-SRCREV_machine ?= "682b17e1d76bc4364fcc9864f39c31c855b5f5df"
-SRCREV_meta ?= "b358c237cf493dcf5af1760fc4632ede32e1ff2e"
+SRCREV_machine:qemuarm ?= "5dd09d311b31db8c7b098e14a7857ef8a6e5353d"
+SRCREV_machine:qemuarm64 ?= "6ba5ae474699ee9e6dd39874dfdb680959f55ffd"
+SRCREV_machine:qemuloongarch64 ?= "6ba5ae474699ee9e6dd39874dfdb680959f55ffd"
+SRCREV_machine:qemumips ?= "1d79865ce12928b85ab2ab1756e7aa7ae5cc4938"
+SRCREV_machine:qemuppc ?= "6ba5ae474699ee9e6dd39874dfdb680959f55ffd"
+SRCREV_machine:qemuriscv64 ?= "6ba5ae474699ee9e6dd39874dfdb680959f55ffd"
+SRCREV_machine:qemuriscv32 ?= "6ba5ae474699ee9e6dd39874dfdb680959f55ffd"
+SRCREV_machine:qemux86 ?= "6ba5ae474699ee9e6dd39874dfdb680959f55ffd"
+SRCREV_machine:qemux86-64 ?= "6ba5ae474699ee9e6dd39874dfdb680959f55ffd"
+SRCREV_machine:qemumips64 ?= "7241bd2e494f07582f736ef1604e81ccd4afc7cf"
+SRCREV_machine ?= "6ba5ae474699ee9e6dd39874dfdb680959f55ffd"
+SRCREV_meta ?= "aba2c2181163cf40e3f8c5618c05e78e931f235b"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "e84a4e368abe42cf359fe237f0238820859d5044"
+SRCREV_machine:class-devupstream ?= "a1c449d00ff8ce2c5fcea5f755df682d1f6bc2ef"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.35"
+LINUX_VERSION ?= "6.1.36"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


