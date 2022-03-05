Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E14CC433F5
	for <webhook@archiver.kernel.org>; Sat,  5 Mar 2022 01:25:25 +0000 (UTC)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com
 [209.85.221.172])
 by mx.groups.io with SMTP id smtpd.web12.1638.1646443524173352088
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:25:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pqdVuMwx;
 spf=pass (domain: gmail.com, ip: 209.85.221.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vk1-f172.google.com with SMTP id c4so5154697vkq.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 17:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3XNB3SzuRnbUQjqZ7FZy+x2akIXeZgZtyMHkCvYxeqU=;
        b=pqdVuMwxVrjGXq+SSDJ2IGEG01X5FX1z/YoYo9zv9UuYX30qsx1uZrGia8IjFd7RGt
         w2FS3slEsZOK36xcJaeSyrYe00avGGc3T+O7IAtB5BNlL+NSO0i+Bc6nEhanUbl4B01h
         8hrSuCV7z1g/wb93holm5pFr3YxTr4sHryfwVV1YIw+xdT5mnUMeyPNQFUFavCSgpA52
         BeSZ5iJCrler7rtynNcDkimr5cmYT8tPif4GPJDUqSB/1qkot1AEXFWuZmx3M7/e0Vqu
         rqMIurIqEN8DWfUj8poInJ3DGpn7HvBVNliqP0rl2vzyLy6CLW/DTihRZBJk9oG9hL0w
         0YPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3XNB3SzuRnbUQjqZ7FZy+x2akIXeZgZtyMHkCvYxeqU=;
        b=AWL8LcaG1CZLI1v3ldFDb1Q2+tTFkaCHu7B/42OOJOcLj4w1J6v9US9UBNc2YWSR+d
         rZMRe/s9warhYJ4khbqo5lYrUPnR1cHzsdLbaNyefssBI7cgJU1Bh6wbdycytIEit4tN
         nSHzpWyxpmONI9kouFEI2kBZ9/Vmp7ft/ItWWxU7QcH/CmlvXhu0D9elRFx15Fyf+1o4
         jPRTfAUGBj6MA0rCH0/V94+tVLSD/jg0+c45ZWtoLs6rXLXL5CZ5qKXLfVRphxnr4kKd
         07zMJujrhiZMk7AEXekUeIGoglFiYYL8debF8LoCpmcBVywOkhzCF0/aVpYtVaGQ/CSy
         Qvvw==
X-Gm-Message-State: AOAM532FdPwoKNKp0AG2LM+4GZc7EzsvZK5dwnR8YAiGnn4uslB/F/6U
	ZkvmH5jNPVcv4wqKSIAthwUVJUuUTQl6EA==
X-Google-Smtp-Source: 
 ABdhPJyV6cupgVCYYkPHsq1rJ/q2oRxqyODMhlfXN90B1Z5zjf1Y1yRZcdGoIDjtRe+1S8/0O5TGAQ==
X-Received: by 2002:a05:6122:134f:b0:32d:9340:94a9 with SMTP id
 f15-20020a056122134f00b0032d934094a9mr574899vkp.0.1646443523006;
        Fri, 04 Mar 2022 17:25:23 -0800 (PST)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 q9-20020ab02649000000b0034a4433fe82sm1053934uao.36.2022.03.04.17.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 17:25:22 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] linux-yocto/5.15: update to v5.15.24
Date: Fri,  4 Mar 2022 20:25:11 -0500
Message-Id: 
 <079556b05e0af52ed701211a7aad04f456f9d6dc.1646443420.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1646443420.git.bruce.ashfield@gmail.com>
References: <cover.1646443420.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Mar 2022 01:25:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162768

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.15 to the latest korg -stable release that comprises
the following commits:

    a0ebea480bb3 Linux 5.15.24
    65ab30f6a695 iommu: Fix potential use-after-free during probe
    7969fe91c983 perf: Fix list corruption in perf_cgroup_switch()
    8ebcd2c680e1 arm64: dts: imx8mq: fix lcdif port node
    48f54966f7f7 MIPS: octeon: Fix missed PTR->PTR_WD conversion
    cd4494f8685c scsi: lpfc: Reduce log messages seen after firmware download
    6737f9a95a42 scsi: lpfc: Remove NVMe support if kernel has NVME_FC disabled
    c8e9c2b52c4c Makefile.extrawarn: Move -Wunaligned-access to W=1
    24645c47880b x86/sgx: Silence softlockup detection when releasing large enclaves
    30de73bebf2b hwmon: (dell-smm) Speed up setting of fan speed
    16cde074b00c bus: mhi: pci_generic: Add mru_default for Cinterion MV31-W
    2c1d20e34669 bus: mhi: pci_generic: Add mru_default for Foxconn SDX55
    fe990b7bf6ac s390/cio: verify the driver availability for path_event call
    56ca18dd5483 signal: HANDLER_EXIT should clear SIGNAL_UNKILLABLE
    f7a56fcca2e4 seccomp: Invalidate seccomp mode to catch death failures
    956cf21cd1ae mm: memcg: synchronize objcg lists with a dedicated spinlock
    b7f54894aa75 iio: buffer: Fix file related error handling in IIO_BUFFER_GET_FD_IOCTL
    7a360e546ad9 phy: ti: Fix missing sentinel for clk_div_table
    12431425c466 speakup-dectlk: Restore pitch setting
    9ae3dad535a9 USB: serial: cp210x: add CPI Bulk Coin Recycler id
    7e5108a22f19 USB: serial: cp210x: add NCR Retail IO box id
    8d226d39d052 USB: serial: ch341: add support for GW Instek USB2.0-Serial devices
    2ea4f4612cb9 USB: serial: option: add ZTE MF286D modem
    24311a9fc426 USB: serial: ftdi_sio: add support for Brainboxes US-159/235/320
    2330b2ba6465 usb: raw-gadget: fix handling of dual-direction-capable endpoints
    33d2a0c1ec20 usb: gadget: f_uac2: Define specific wTerminalType
    2da3b0ab54fb usb: gadget: rndis: check size of RNDIS_MSG_SET command
    3e33e5c67cb9 USB: gadget: validate interface OS descriptor requests
    d3d5bfb3a279 usb: gadget: udc: renesas_usb3: Fix host to USB_ROLE_NONE transition
    8d2b04dad380 usb: dwc3: gadget: Prevent core from processing stale TRBs
    93feb2bdf6d4 usb: ulpi: Call of_node_put correctly
    fc50f42e4616 usb: ulpi: Move of_node_put to ulpi_dev_release
    ffd0393adcdc net: usb: ax88179_178a: Fix out-of-bounds accesses in RX fixup
    f4e72ad027b0 Revert "usb: dwc2: drd: fix soft connect when gadget is unconfigured"
    a6ef1bda0efd usb: dwc2: drd: fix soft connect when gadget is unconfigured
    9a5f471ae380 eeprom: ee1004: limit i2c reads to I2C_SMBUS_BLOCK_MAX
    decb36e9a9f0 n_tty: wake up poll(POLLRDNORM) on receiving data
    573321db328b vt_ioctl: add array_index_nospec to VT_ACTIVATE
    ffe54289b02e vt_ioctl: fix array_index_nospec in vt_setactivate
    f916181692cb net: dsa: mv88e6xxx: fix use-after-free in mv88e6xxx_mdios_unregister
    d98ba26a4ba9 net: mscc: ocelot: fix mutex lock error during ethtool stats read
    41a8c548d47b ice: Avoid RTNL lock when re-creating auxiliary device
    f9daedc3ab8f ice: Fix KASAN error in LAG NETDEV_UNREGISTER handler
    52eb5c86ede4 ice: fix IPIP and SIT TSO offload
    efd399e12c1b ice: fix an error code in ice_cfg_phy_fec()
    12e067a4d98f dpaa2-eth: unregister the netdev before disconnecting from the PHY
    29b25d5f8f30 mptcp: netlink: process IPv6 addrs in creating listening sockets
    dcd1c4663469 drm/amd/pm: fix hwmon node of power1_label create issue
    4b24ef1d03cf net: amd-xgbe: disable interrupts during pci removal
    489d9fa78e59 tipc: rate limit warning for received illegal binding update
    bb04b5527aff net: mdio: aspeed: Add missing MODULE_DEVICE_TABLE
    b8ac37e57044 veth: fix races around rq->rx_notify_masked
    fdcb263fa5cd net: fix a memleak when uncloning an skb dst and its metadata
    f1ab1ba32d36 net: do not keep the dst cache when uncloning an skb dst and its metadata
    6cbe14cc0eb6 nfp: flower: fix ida_idx not being released
    3cab045c99db ipmr,ip6mr: acquire RTNL before calling ip[6]mr_free_table() on failure path
    b5652bc50dde net: dsa: lantiq_gswip: don't use devres for mdiobus
    46b747232329 net: dsa: mt7530: fix kernel bug in mdiobus_free() when unbinding
    8cda7577a0b4 net: dsa: felix: don't use devres for mdiobus
    caabb5f64f5c net: dsa: bcm_sf2: don't use devres for mdiobus
    aae1c6a1d3d6 net: dsa: ar9331: register the mdiobus under devres
    8b626d45127d net: dsa: mv88e6xxx: don't use devres for mdiobus
    147540cae264 bonding: pair enable_port with slave_arr_updates
    3523167d6658 fbcon: Avoid 'cap' set but not used warning
    ef2cb1fc0365 gpio: sifive: use the correct register to read output values
    d9daa2b76dde gpiolib: Never return internal error codes to user space
    e799974e7cbb ACPI: PM: s2idle: Cancel wakeup before dispatching EC GPE
    ab142ea5d502 drm/panel: simple: Assign data from panel_dpi_probe() correctly
    9e3dd49145f3 ixgbevf: Require large buffers for build_skb on 82599VF
    51eece9f8a1d arm64: dts: meson-sm1-odroid: fix boot loop after reboot
    57154c07ed62 arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO domain for GPIOE_2
    162f8057192c arm64: dts: meson-sm1-odroid: use correct enable-gpio pin for tf-io regulator
    006dc5815bb3 arm64: dts: meson-g12b-odroid-n2: fix typo 'dio2133'
    c5ee4cbd0f1b netfilter: ctnetlink: disable helper autoassign
    7f486bed5ec0 net: sparx5: Fix get_stat64 crash in tcpdump
    e4382d0a39f9 misc: fastrpc: avoid double fput() on failed usercopy
    f5e8733d93cf drm/vc4: hdmi: Allow DBLCLK modes even if horz timing is odd.
    3d2bc21a6768 NFS: Don't skip directory entries when doing uncached readdir
    557302faea9c NFS: Don't overfill uncached readdir pages
    00181d6c9665 gpio: aggregator: Fix calling into sleeping GPIO controllers
    ddcb149ce10a phy: dphy: Correct clk_pre parameter
    72a8aee863af usb: f_fs: Fix use-after-free for epfile
    0ed2f9a97a92 arm64: dts: imx8mq: fix mipi_csi bidirectional port numbers
    af6a1d60a13c ARM: dts: imx7ulp: Fix 'assigned-clocks-parents' typo
    94b16ca86ab6 phy: stm32: fix a refcount leak in stm32_usbphyc_pll_enable()
    541ec7bfeed3 phy: xilinx: zynqmp: Fix bus width setting for SGMII
    58c42f415b81 ARM: dts: imx6qdl-udoo: Properly describe the SD card detect
    025c6eef1490 staging: fbtft: Fix error path in fbtft_driver_module_init()
    c0ad2c2cac1b phy: broadcom: Kconfig: Fix PHY_BRCM_USB config option
    86cdc3060d41 ARM: dts: meson8b: Fix the UART device-tree schema validation
    5253b083f0a8 ARM: dts: meson8: Fix the UART device-tree schema validation
    00d135070efa ARM: dts: meson: Fix the UART compatible strings
    c22bddf61db0 ARM: dts: Fix timer regression for beagleboard revision c
    ac14a51c3169 drm/i915: Populate pipe dbuf slices more accurately during readout
    8d6a31b83cdd drm/i915: Allow !join_mbus cases for adlp+ dbuf configuration
    05ffa30c99f7 drm/rockchip: vop: Correct RK3399 VOP register fields
    c1af59449d80 drm/amdgpu/display: change pipe policy for DCN 2.0
    0e546bb1324e PM: s2idle: ACPI: Fix wakeup interrupts handling
    65aabd296665 ACPI/IORT: Check node revision for PMCG resources
    64c37c05f7ad nvme-tcp: fix bogus request completion when failing to send AER
    7740eb27c38e ARM: socfpga: fix missing RESET_CONTROLLER
    ccdd7956cd28 ARM: dts: Fix boot regression on Skomer
    14917a884f70 ARM: dts: imx23-evk: Remove MX23_PAD_SSP1_DETECT from hog group
    4134396f99d2 gfs2: Fix gfs2_release for non-writers regression
    71f46f3d1bf2 riscv: eliminate unreliable __builtin_frame_address(1)
    efe220337181 riscv: cpu-hotplug: clear cpu from numa map when teardown
    7486227fa47a riscv: fix build with binutils 2.38
    67398d2c7b8c KVM: x86: Report deprecated x87 features in supported CPUID
    c09a83ae3b2e KVM: VMX: Set vmcs.PENDING_DBG.BS on #DB in STI/MOVSS blocking shadow
    f7da3276e087 KVM: SVM: Don't kill SEV guest if SMAP erratum triggers in usermode
    11f9427d01a3 KVM: nVMX: Also filter MSR_IA32_VMX_TRUE_PINBASED_CTLS when eVMCS
    a3c43649600b KVM: nVMX: eVMCS: Filter out VM_EXIT_SAVE_VMX_PREEMPTION_TIMER
    d44af3ad2a21 KVM: eventfd: Fix false positive RCU usage warning
    a85f3ea1407f net: stmmac: dwmac-sun8i: use return val of readl_poll_timeout()
    a3ba49c129ed MIPS: Fix build error due to PTR used in more places
    96f91a877a5c nvme-pci: add the IGNORE_DEV_SUBNQN quirk for Intel P4500/P4600 SSDs
    a3486ef99a3b perf: Always wake the parent event
    8981a8fd900e usb: dwc2: gadget: don't try to disable ep0 in dwc2_hsotg_suspend
    a277422a8d97 drm/amd/display: Correct MPC split policy for DCN301
    dc5769c7b063 PM: hibernate: Remove register_nosave_region_late()
    50fe79589c14 net: stmmac: reduce unnecessary wakeups from eee sw timer
    6207f35c213f scsi: myrs: Fix crash in error case
    0c8d27c2aae5 scsi: ufs: Treat link loss as fatal error
    f0a91d892310 scsi: ufs: Use generic error code in ufshcd_set_dev_pwr_mode()
    cb26e94204d7 scsi: pm8001: Fix bogus FW crash for maxcpus=1
    1c22df15cf40 scsi: qedf: Change context reset messages to ratelimited
    6be8eaad75ca scsi: qedf: Fix refcount issue when LOGO is received during TMF
    1f53bbf27a87 scsi: qedf: Add stag_work to all the vports
    83f31dab46b2 scsi: ufs: ufshcd-pltfrm: Check the return value of devm_kstrdup()
    4f786e8f18c3 scsi: target: iscsi: Make sure the np under each tpg is unique
    43ae0ccc4d27 powerpc/fixmap: Fix VM debug warning on unmap
    fa693cfd8fe4 net: sched: Clarify error message when qdisc kind is unknown
    9696125fb3ca drm: panel-orientation-quirks: Add quirk for the 1Netbook OneXPlayer
    770d1ba9a820 drm/vc4: Fix deadlock on DSI device attach error
    85008bde411d sched: Avoid double preemption in __cond_resched_*lock*()
    ec903b6daa58 x86/perf: Avoid warning for Arch LBR without XSAVE
    ef5685971abd perf/x86/rapl: fix AMD event handling
    3f4e05eb46ae irqchip/realtek-rtl: Service all pending interrupts
    4403233b8775 sunrpc: Fix potential race conditions in rpc_sysfs_xprt_state_change()
    4b22aa42bd4d net/sunrpc: fix reference count leaks in rpc_sysfs_xprt_state_change
    5ca123c91a64 SUNRPC allow for unspecified transport time in rpc_clnt_add_xprt
    c5ae18fa8d71 NFSv4 handle port presence in fs_location server string
    be67be6a1a8f NFSv4 expose nfs_parse_server_name function
    6f2836341d8a NFSv4.1 query for fs_location attr on a new file system
    2df6a47a131a NFSv4 store server support for fs_location attribute
    0c5d3bfb2967 NFSv4 remove zero number of fs_locations entries error check
    3cb5b317901e NFSv4.1: Fix uninitialised variable in devicenotify
    58967a232ab3 nfs: nfs4clinet: check the return value of kstrdup()
    bbf647ecebc0 NFSv4 only print the label when its queried
    38ae938701e7 NFS: change nfs_access_get_cached to only report the mask
    78c28fdf1685 tracing: Propagate is_signed to expression
    8fdaa9a6ace2 thermal/drivers/int340x: Fix RFIM mailbox write commands
    5abd95ff5d6a thermal: int340x: Limit Kconfig to 64-bit
    786293f61b4b thermal/drivers/int340x: processor_thermal: Suppot 64 bit RFIM responses
    e9b0301939d1 thermal/drivers/int340x: Improve the tcc offset saving for suspend/resume
    c6eff5c42771 NFSD: Fix the behavior of READ near OFFSET_MAX
    c9a8571dd893 NFSD: Fix offset type in I/O trace points
    01c3ae81eef4 NFSD: Clamp WRITE offsets
    8e0ecaf7a7e5 NFSD: Fix ia_size underflow
    37f2d2cd8ead NFSD: Fix NFSv3 SETATTR/CREATE's handling of large file sizes
    535e301ea677 NFS: Fix initialisation of nfs_client cl_flags field
    6b42352bea56 net: phy: marvell: Fix MDI-x polarity setting in 88e1118-compatible PHYs
    9338c17e2c63 net: phy: marvell: Fix RGMII Tx/Rx delays setting in 88e1121-compatible PHYs
    540dff311c9a can: isotp: fix error path in isotp_sendmsg() to unlock wait queue
    f90cc68f9f4b can: isotp: fix potential CAN frame reception race in isotp_rcv()
    dbe7bf9b6fc8 mmc: core: Wait for command setting 'Power Off Notification' bit to complete
    222c071fadd6 mmc: sdhci-of-esdhc: Check for error num after setting mask
    cf4570ca8ed6 ima: Do not print policy rule with inactive LSM labels
    5389ea64af1e ima: Allow template selection with ima_template[_fmt]= after ima_hash=
    20805cdf95af ima: Remove ima_policy file before directory
    0838d6d68182 ima: fix reference leak in asymmetric_verify()
    739b7bb886b5 integrity: check the return value of audit_log_start()
    c1d3ac0c115f Linux 5.15.23
    1f1788616157 tipc: improve size validations for received domain records
    40eb05e5e72b crypto: api - Move cryptomgr soft dependency into algapi
    ab32ea3ad0d5 ksmbd: fix SMB 3.11 posix extension mount failure
    14f880ea779e KVM: s390: Return error on SIDA memop on normal guest
    c28ee73fea29 arm64: Add Cortex-A510 CPU part definition
    af0e6c49438b moxart: fix potential use-after-free on remove path

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index 22385ad38c..4aa1d90f4d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c5b3006ccedbb8397aa58b667b981e0c2435b943"
-SRCREV_meta ?= "e1b976ee4fb5af517cf01a9f2dd4a32f560ca894"
+SRCREV_machine ?= "3f32ac72547633bb4ba8af0a058ea6dd26700767"
+SRCREV_meta ?= "c4e4de6ccb27846e48a848d7ca1f20d9503a6fec"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.22"
+LINUX_VERSION ?= "5.15.24"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index ae72f34c26..5b5946fdc0 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.22"
+LINUX_VERSION ?= "5.15.24"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "66d56b3bcc1391639a84e35be3ef00c5197089a8"
-SRCREV_machine ?= "7f685244afb3acd13e94968312580b63d7296705"
-SRCREV_meta ?= "e1b976ee4fb5af517cf01a9f2dd4a32f560ca894"
+SRCREV_machine:qemuarm ?= "fa8ed5bf61550cfa9e6bb9b046674a2491db5672"
+SRCREV_machine ?= "3cba0e6744d4323f2901af62ed458957d40b8017"
+SRCREV_meta ?= "c4e4de6ccb27846e48a848d7ca1f20d9503a6fec"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 43409fb45e..8b343d6eaa 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6be018aeb5fd86986bc560e2e6ca59b774784bdb"
-SRCREV_machine:qemuarm64 ?= "7f685244afb3acd13e94968312580b63d7296705"
-SRCREV_machine:qemumips ?= "2b861aef3af1f8b09f1345a308e6e6fe213e1fef"
-SRCREV_machine:qemuppc ?= "7f685244afb3acd13e94968312580b63d7296705"
-SRCREV_machine:qemuriscv64 ?= "7f685244afb3acd13e94968312580b63d7296705"
-SRCREV_machine:qemuriscv32 ?= "7f685244afb3acd13e94968312580b63d7296705"
-SRCREV_machine:qemux86 ?= "7f685244afb3acd13e94968312580b63d7296705"
-SRCREV_machine:qemux86-64 ?= "7f685244afb3acd13e94968312580b63d7296705"
-SRCREV_machine:qemumips64 ?= "1d269d782d6b6effed2437ad6b11ae4f4e789259"
-SRCREV_machine ?= "7f685244afb3acd13e94968312580b63d7296705"
-SRCREV_meta ?= "e1b976ee4fb5af517cf01a9f2dd4a32f560ca894"
+SRCREV_machine:qemuarm ?= "2080556f77628b4b045c670321989cb058749acd"
+SRCREV_machine:qemuarm64 ?= "3cba0e6744d4323f2901af62ed458957d40b8017"
+SRCREV_machine:qemumips ?= "841c395c9a56e60c861e0d8346f39a88120fd8a1"
+SRCREV_machine:qemuppc ?= "3cba0e6744d4323f2901af62ed458957d40b8017"
+SRCREV_machine:qemuriscv64 ?= "3cba0e6744d4323f2901af62ed458957d40b8017"
+SRCREV_machine:qemuriscv32 ?= "3cba0e6744d4323f2901af62ed458957d40b8017"
+SRCREV_machine:qemux86 ?= "3cba0e6744d4323f2901af62ed458957d40b8017"
+SRCREV_machine:qemux86-64 ?= "3cba0e6744d4323f2901af62ed458957d40b8017"
+SRCREV_machine:qemumips64 ?= "f23755ed1e4ed384fe05651d51da41dd5ba1a43a"
+SRCREV_machine ?= "3cba0e6744d4323f2901af62ed458957d40b8017"
+SRCREV_meta ?= "c4e4de6ccb27846e48a848d7ca1f20d9503a6fec"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "e1b976ee4fb5af517cf01a9f2dd4a32f560ca894"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "0bf5b7cc9848b5494b2ca4eb1ca6e05865e8cdf1"
+SRCREV_machine:class-devupstream ?= "a0ebea480bb319a3ad408c99db91262dbc696b76"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.22"
+LINUX_VERSION ?= "5.15.24"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


