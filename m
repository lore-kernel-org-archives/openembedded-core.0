Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.11921.1625242814841293130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 09:20:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="196043420"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="196043420"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:13 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="626776329"
Received: from ypoh4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.151.64])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:11 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/22] linux-yocto/5.10: update to v5.10.42
Date: Sat,  3 Jul 2021 00:19:43 +0800
Message-Id: <211731413f946a45281e05095234915c5d210ad4.1625242066.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625242066.git.anuj.mittal@intel.com>
References: <cover.1625242066.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    65859eca4dff Linux 5.10.42
    972b4c19f55d usb: core: reduce power-on-good delay time of root hub
    5c7b23b79628 neighbour: Prevent Race condition in neighbour subsytem
    942790699977 scripts/clang-tools: switch explicitly to Python 3
    c1febac44856 net: hso: bail out on interrupt URB allocation failure
    0e3045c15ff9 Revert "Revert "ALSA: usx2y: Fix potential NULL pointer dereference""
    899b5131e74c SUNRPC: More fixes for backlog congestion
    c2779f8ddc9a bpftool: Add sock_release help info for cgroup attach/prog load command
    534b6229196e net: hns3: check the return of skb_checksum_help()
    bc924bbccc50 samples/bpf: Consider frame size in tx_only of xdpsock sample
    02ce4c943e2e i915: fix build warning in intel_dp_get_link_status()
    8d2ab018a07a net: mvpp2: add buffer header handling in RX
    ac493452e937 net: zero-initialize tc skb extension on allocation
    8cad65950b18 MIPS: ralink: export rt_sysc_membase for rt2880_wdt.c
    70a922f59068 MIPS: alchemy: xxs1500: add gpio-au1000.h header file
    f6442ee08fe6 net: hsr: fix mac_len checks
    a6a0af3c902c sch_dsmark: fix a NULL deref in qdisc_reset()
    cd751bde9e0d net: ethernet: mtk_eth_soc: Fix packet statistics support for MT7628/88
    f103ae7c9c8b ALSA: usb-audio: scarlett2: snd_scarlett_gen2_controls_create() can be static
    5a2e1ce7abc2 ipv6: record frag_max_size in atomic fragments in input path
    5ac72351655f net: lantiq: fix memory corruption in RX ring
    988439906f6f scsi: libsas: Use _safe() loop in sas_resume_port()
    3a17d8adfa02 ASoC: qcom: lpass-cpu: Use optional clk APIs
    3cfd11506ed0 ixgbe: fix large MTU request from VF
    9948170c8eb4 bpf: Set mac_len in bpf_skb_change_head
    24cb8bb7f623 bpf, offload: Reorder offload callback 'prepare' in verifier
    78d5f411615a ASoC: cs35l33: fix an error code in probe()
    d29df5fc69ee staging: emxx_udc: fix loop in _nbu2ss_nuke()
    02f03883fdb1 cxgb4: avoid accessing registers when clearing filters
    a5212518b78c iommu/vt-d: Use user privilege for RID2PASID translation
    a663c1e418a3 net: hns3: put off calling register_netdev() until client initialize complete
    09867c500ec4 net: hns3: fix incorrect resp_msg issue
    815eb57e048b iommu/virtio: Add missing MODULE_DEVICE_TABLE
    8e534c981d7c gve: Correct SKB queue index validation.
    48f4ddec0ab9 gve: Upgrade memory barrier in poll routine
    da21a35c00ff gve: Add NULL pointer checks when freeing irqs.
    7114438671d6 gve: Update mgmt_msix_idx if num_ntfy changes
    b6ef5bfcd9d7 gve: Check TX QPL was actually assigned
    8b2cdc004d21 net/smc: remove device from smcd_dev_list after failed device_add()
    beb39adb150f mld: fix panic in mld_newpack()
    7e31bcbb335e bnxt_en: Fix context memory setup for 64K page size.
    4ebb03c9ffbe bnxt_en: Include new P5 HV definition in VF check.
    8f793568b02e net: bnx2: Fix error return code in bnx2_init_board()
    8eaca8d1caac net: hso: check for allocation failure in hso_create_bulk_serial_device()
    f9fc21e2b11e net: sched: fix tx action reschedule issue with stopped queue
    2f23d5bcd9f8 net: sched: fix tx action rescheduling issue during deactivation
    21c715109253 net: sched: fix packet stuck problem for lockless qdisc
    60e2193a600a tls splice: check SPLICE_F_NONBLOCK instead of MSG_DONTWAIT
    886dd7f3e9d3 openvswitch: meter: fix race when getting now_ms.
    b96adbf6601d cxgb4/ch_ktls: Clear resources when pf4 device is removed
    ada298f861a3 net: mdio: octeon: Fix some double free issues
    4bd833bb5e85 net: mdio: thunder: Fix a double free issue in the .remove function
    4246f7dc354f chelsio/chtls: unlock on error in chtls_pt_recvmsg()
    8ee7ef4a57a9 net: fec: fix the potential memory leak in fec_enet_init()
    9c386011fa61 net: packetmmap: fix only tx timestamp on request
    1f1b431a4fcd net: really orphan skbs tied to closing sk
    f5da0820c59d spi: Assume GPIO CS active high in ACPI case
    cd37040ba931 vfio-ccw: Check initialized flag in cp_init()
    ee67cbc13fc5 net: ipa: memory region array is variable size
    bf5c8f984f7f net: stmmac: Fix MAC WoL not working if PHY does not support WoL
    95cfa6c03047 ASoC: cs42l42: Regmap must use_single_read/write
    211c5d16e357 interconnect: qcom: Add missing MODULE_DEVICE_TABLE
    4e3cea8035b6 interconnect: qcom: bcm-voter: add a missing of_node_put()
    d7932e68520e net: dsa: fix error code getting shifted with 4 in dsa_slave_get_sset_count
    d5b0a1513b6c net: netcp: Fix an error message
    1354ec840899 linux/bits.h: fix compilation error with GENMASK
    b0f5d4891ea3 block: fix a race between del_gendisk and BLKRRPART
    ff945d033a04 platform/x86: touchscreen_dmi: Add info for the Chuwi Hi10 Pro (CWI529) tablet
    5fbc70eef88a drm/amdgpu: stop touching sched.ready in the backend
    4951dd498d48 drm/amd/amdgpu: fix a potential deadlock in gpu reset
    f98cdf084405 drm/amdgpu: Fix a use-after-free
    9fdb8ed37a3a drm/amd/amdgpu: fix refcount leak
    07ab4dfe0323 drm/amd/display: Disconnect non-DP with no EDID
    530baa6f3c06 SMB3: incorrect file id in requests compounded with open
    518457d0270c platform/x86: touchscreen_dmi: Add info for the Mediacom Winpad 7.0 W700 tablet
    c5bda3a559df platform/x86: intel_punit_ipc: Append MODULE_DEVICE_TABLE for ACPI
    fe156a601cac platform/x86: hp-wireless: add AMD's hardware id to the supported list
    7e13db503918 btrfs: do not BUG_ON in link_to_fixup_dir
    88f566beb1cf btrfs: release path before starting transaction when cloning inline extent
    8eaa762e1d18 scsi: pm80xx: Fix drives missing during rmmod/insmod loop
    71084e2a4d2f openrisc: Define memory barrier mb
    6384103641e3 scsi: BusLogic: Fix 64-bit system enumeration error for Buslogic
    d64464279404 scsi: ufs: ufs-mediatek: Fix power down spec violation
    c7e0c6047c4f btrfs: return whole extents in fiemap
    df451eab6e00 brcmfmac: properly check for bus register errors
    f0044d135d15 Revert "brcmfmac: add a check for the status of usb_register"
    43e6b2ed46ac net: liquidio: Add missing null pointer checks
    e6fbd9faca9f Revert "net: liquidio: fix a NULL pointer dereference"
    32aba7137879 media: gspca: properly check for errors in po1030_probe()
    3d8ac40a7f22 Revert "media: gspca: Check the return value of write_bridge for timeout"
    9ffea48d9da2 media: gspca: mt9m111: Check write_bridge for timeout
    e4bb3dba9e24 Revert "media: gspca: mt9m111: Check write_bridge for timeout"
    9fd73df80fa4 media: dvb: Add check on sp8870_readreg return
    7dae0ca98ae4 Revert "media: dvb: Add check on sp8870_readreg"
    3bf09ab413c7 ASoC: cs43130: handle errors in cs43130_probe() properly
    ce333cc94e2a Revert "ASoC: cs43130: fix a NULL pointer dereference"
    7fe86d957a45 libertas: register sysfs groups properly
    bf2b6ffa9689 Revert "libertas: add checks for the return value of sysfs_create_group"
    e04f1a7e31a3 dmaengine: qcom_hidma: comment platform_driver_register call
    611640b63ae8 Revert "dmaengine: qcom_hidma: Check for driver register failure"
    d9029b19abe5 isdn: mISDN: correctly handle ph_info allocation failure in hfcsusb_ph_info
    fb278d346835 Revert "isdn: mISDN: Fix potential NULL pointer dereference of kzalloc"
    34f4c208a8ce ath6kl: return error code in ath6kl_wmi_set_roam_lrssi_cmd()
    7e0dc2e96870 Revert "ath6kl: return error code in ath6kl_wmi_set_roam_lrssi_cmd()"
    576675c286a0 isdn: mISDNinfineon: check/cleanup ioremap failure correctly in setup_io
    941062256773 Revert "isdn: mISDNinfineon: fix potential NULL pointer dereference"
    1f886612686c Revert "ALSA: usx2y: Fix potential NULL pointer dereference"
    95886dbe3e1c Revert "ALSA: gus: add a check of the status of snd_ctl_add"
    c8972b14044a char: hpet: add checks after calling ioremap
    0f4e71f3d339 Revert "char: hpet: fix a missing check of ioremap"
    4d2b8fcc3fc8 net: caif: remove BUG_ON(dev == NULL) in caif_xmit
    8b5bd5b7424a Revert "net: caif: replace BUG_ON with recovery code"
    62c2472aeee4 net/smc: properly handle workqueue allocation failure
    83d4efe6bf03 Revert "net/smc: fix a NULL pointer dereference"
    71723a796ab7 net: fujitsu: fix potential null-ptr-deref
    b67c3d74adc3 Revert "net: fujitsu: fix a potential NULL pointer dereference"
    52610c1d2577 serial: max310x: unregister uart driver in case of failure and abort
    f7d0b8542fbc Revert "serial: max310x: pass return value of spi_register_driver"
    6bbcc1206c40 Revert "ALSA: sb: fix a missing check of snd_ctl_add"
    870a11325e69 Revert "media: usb: gspca: add a missed check for goto_low_power"
    dac2dde8ee54 Revert "crypto: cavium/nitrox - add an error message to explain the failure of pci_request_mem_regions"
    2bfa3ab89cec gpio: cadence: Add missing MODULE_DEVICE_TABLE
    515181e38e97 platform/x86: hp_accel: Avoid invoking _INI to speed up resume
    3267a061096e mptcp: fix data stream corruption
    deeb7d84f20a mptcp: drop unconditional pr_warn on bad opt
    71227b62143d mptcp: avoid error message on infinite mapping
    cb554bbf364b nvmet-tcp: fix inline data size comparison in nvmet_tcp_queue_response
    e31975c346bf perf jevents: Fix getting maximum number of fds
    ee8a8dd10e1e afs: Fix the nlink handling of dir-over-dir rename
    ce23a0ad4955 i2c: sh_mobile: Use new clock calculation formulas for RZ/G2E
    b523feb7e8e4 i2c: i801: Don't generate an interrupt on bus reset
    87f18aa51e3e i2c: mediatek: Disable i2c start_en and clear intr_stat brfore reset
    eff3c5b67fbb i2c: s3c2410: fix possible NULL pointer deref on read message after write
    935c9443f81c net: dsa: sja1105: fix VL lookup command packing for P/Q/R/S
    83999bf40c78 net: dsa: sja1105: call dsa_unregister_switch when allocating memory fails
    dd8609f20344 net: dsa: sja1105: add error handling in sja1105_setup()
    4a368bc25ab6 net: dsa: sja1105: error out on unsupported PHY mode
    4ef506c0718b net: dsa: sja1105: use 4095 as the private VLAN for untagged traffic
    6f4b79217f6b net: dsa: sja1105: update existing VLANs from the bridge VLAN list
    caff86f85512 net: dsa: fix a crash if ->get_sset_count() fails
    b91117b66fe8 net: dsa: mt7530: fix VLAN traffic leaks
    6d6bc8c75290 netfilter: flowtable: Remove redundant hw refresh bit
    fe6921e3b845 spi: spi-fsl-dspi: Fix a resource leak in an error handling path
    6da24cfc83ba tipc: skb_linearize the head skb when reassembling msgs
    5195ec5e365a tipc: wait and exit until all work queues are done
    0aa2212940b8 Revert "net:tipc: Fix a double free in tipc_sk_mcast_rcv"
    5343fcfc6cc8 SUNRPC in case of backlog, hand free slots directly to waiting task
    5dc905501f71 net/mlx5: Set term table as an unmanaged flow table
    143154a151c9 net/mlx4: Fix EEPROM dump support
    2e4b0b95a489 net/mlx5e: Fix null deref accessing lag dev
    cb6cc62d9e0f net/mlx5: Set reformat action when needed for termination rules
    2dde54e76b68 net/mlx5e: Fix nullptr in add_vlan_push_action()
    89a0e388c6f2 {net,vdpa}/mlx5: Configure interface MAC into mpfs L2 table
    bbd00c4d50db net/mlx5e: Fix error path of updating netdev queues
    02a8da446b49 net/mlx5e: Fix multipath lag activation
    fc41e45aa7e6 net/mlx5e: reset XPS on error flow if netdev isn't registered yet
    d66083c0d6f5 drm/meson: fix shutdown crash when component not probed
    92db1265f6cb NFSv4: Fix v4.0/v4.1 SEEK_DATA return -ENOTSUPP when set NFS_V4_2 config
    7087db95c0a0 NFS: Don't corrupt the value of pg_bytes_written in nfs_do_recoalesce()
    ee21cd3aa854 NFS: Fix an Oopsable condition in __nfs_pageio_add_request()
    9b367fe770b1 NFS: fix an incorrect limit in filelayout_decode_layout()
    1fbbcd1752ff fs/nfs: Use fatal_signal_pending instead of signal_pending
    1b364f8ede20 Bluetooth: cmtp: fix file refcount when cmtp_attach_device fails
    635ac38b3625 net: usb: fix memory leak in smsc75xx_bind
    77c6f2b36de1 usb: typec: mux: Fix matching with typec_altmode_desc
    bd4caf585b80 usb: gadget: udc: renesas_usb3: Fix a race in usb3_start_pipen()
    adccf1798262 usb: dwc3: gadget: Properly track pending and queued SG
    a40b07afcb86 thermal/drivers/intel: Initialize RW trip to THERMAL_TEMP_INVALID
    bfd46c08d609 USB: serial: pl2303: add device id for ADLINK ND-6530 GC
    794794459c52 USB: serial: ftdi_sio: add IDs for IDS GmbH Products
    f9a5cbdf86ef USB: serial: option: add Telit LE910-S1 compositions 0x7010, 0x7011
    682437d58e8b USB: serial: ti_usb_3410_5052: add startech.com device id
    6a931ceb0b94 serial: rp2: use 'request_firmware' instead of 'request_firmware_nowait'
    e95571170159 serial: sh-sci: Fix off-by-one error in FIFO threshold register setting
    604c654323fa serial: tegra: Fix a mask operation that is always true
    d007150b4e15 drivers: base: Fix device link removal
    8d83f109e920 USB: usbfs: Don't WARN about excessively large memory allocations
    bc439b4b6a6b Revert "irqbypass: do not start cons/prod when failed connect"
    b98a0380bc81 USB: trancevibrator: fix control-request direction
    ae46660bf29f serial: 8250_pci: handle FL_NOIRQ board flag
    60f9e33bb716 serial: 8250_pci: Add support for new HPE serial device
    a4a261328ce1 serial: 8250_dw: Add device HID for new AMD UART controller
    595505fc6f8b serial: 8250: Add UART_BUG_TXRACE workaround for Aspeed VUART
    023cd911d4c2 iio: adc: ad7192: handle regulator voltage error first
    885fbd6d360c iio: adc: ad7192: Avoid disabling a clock that was never enabled.
    e07d42897009 iio: adc: ad7793: Add missing error code in ad7793_setup()
    bd298334bffe iio: adc: ad7923: Fix undersized rx buffer.
    f70122825076 iio: adc: ad7124: Fix potential overflow due to non sequential channel numbers
    fbb02b5e7a34 iio: adc: ad7124: Fix missbalanced regulator enable / disable on error.
    dceb4ec04222 iio: adc: ad7768-1: Fix too small buffer passed to iio_push_to_buffers_with_timestamp()
    a78238fa3bee iio: dac: ad5770r: Put fwnode in error case during ->probe()
    619289733df0 iio: gyro: fxas21002c: balance runtime power in error path
    0239a3746332 staging: iio: cdc: ad7746: avoid overwrite of num_channels
    ead51afc7f0d mei: request autosuspend after sending rx flow control
    31283877e3cd KVM: arm64: Prevent mixed-width VM creation
    bb2e3adf237c KVM: X86: Fix vCPU preempted state from guest's point of view
    439a0b07fdef thunderbolt: dma_port: Fix NVM read buffer bounds and offset issue
    1b4a65408ec5 thunderbolt: usb4: Fix NVM read buffer bounds and offset issue
    5394ae9d8c79 misc/uss720: fix memory leak in uss720_probe
    1a2494c9eb02 serial: core: fix suspicious security_locked_down() call
    b71781c58982 seccomp: Refactor notification handler to prepare for new semantics
    a160cabf86a7 Documentation: seccomp: Fix user notification documentation
    adfe1d01e6f0 kgdb: fix gcc-11 warnings harder
    eeb3f0b0c351 selftests/gpio: Fix build when source tree is read only
    008f98f1dbac selftests/gpio: Move include of lib.mk up
    beac83e8bd09 selftests/gpio: Use TEST_GEN_PROGS_EXTENDED
    1cdabf921bfa drm/amdgpu/jpeg2.0: add cancel_delayed_work_sync before power gate
    bed5cc65ff3d drm/amdgpu/vcn2.5: add cancel_delayed_work_sync before power gate
    efd47c9d586d drm/amdgpu/vcn2.0: add cancel_delayed_work_sync before power gate
    01abf69154d0 drm/amdkfd: correct sienna_cichlid SDMA RLC register offset error
    2e4f262ef51d drm/amdgpu/vcn1: add cancel_delayed_work_sync before power gate
    e3a662e5e882 drm/amd/pm: correct MGpuFanBoost setting
    1a8ecc3cd1a1 dm snapshot: properly fix a crash when an origin has no snapshots
    cc5d84b1b07d ath11k: Clear the fragment cache during key install
    8135f46f5a48 ath10k: Validate first subframe of A-MSDU before processing the list
    6643b21aee1c ath10k: Fix TKIP Michael MIC verification for PCIe
    c4d5271830c6 ath10k: drop MPDU which has discard flag set by firmware for SDIO
    425cee636091 ath10k: drop fragments with multicast DA for SDIO
    b1b3dcd65377 ath10k: drop fragments with multicast DA for PCIe
    c17b3e1ffc14 ath10k: add CCMP PN replay protection for fragmented frames for PCIe
    6abcc01e8b3b mac80211: extend protection against mixed key and fragment cache attacks
    2b9b07b9a06f mac80211: do not accept/forward invalid EAPOL frames
    bf710b60bc7b mac80211: prevent attacks on TKIP/WEP as well
    e64ea0597050 mac80211: check defrag PN against current frame
    f51fe83ead3a mac80211: add fragment cache to sta_info
    9b21fcae6f68 mac80211: drop A-MSDUs on old ciphers
    c730d72aa6e8 cfg80211: mitigate A-MSDU aggregation attacks
    e3561d5af01c mac80211: properly handle A-MSDUs that start with an RFC 1042 header
    42d98e02193d mac80211: prevent mixed key and fragment cache attacks
    f7829b014bb6 mac80211: assure all fragments are encrypted
    b1f45a26bd32 netfilter: nft_set_pipapo_avx2: Add irq_fpu_usable() check, fallback to non-AVX2 version
    e6294c06e7c6 net/sched: fq_pie: fix OOB access in the traffic path
    e583eb5e7282 net/sched: fq_pie: re-factor fix for fq_pie endless loop
    47da4f614229 net: hso: fix control-request directions
    fb003a1bd603 proc: Check /proc/$pid/attr/ writes against file opener
    03b777ce8d70 perf scripts python: exported-sql-viewer.py: Fix warning display
    76b6c5a98f1a perf scripts python: exported-sql-viewer.py: Fix Array TypeError
    07f769416993 perf scripts python: exported-sql-viewer.py: Fix copy to clipboard from Top Calls by elapsed Time report
    7285b92dc55f perf intel-pt: Fix transaction abort handling
    ce3ea6b66ded perf intel-pt: Fix sample instruction bytes
    f01134321d04 iommu/vt-d: Fix sysfs leak in alloc_iommu()
    f9890652185b NFSv4: Fix a NULL pointer dereference in pnfs_mark_matching_lsegs_return()
    3e5b48d9e713 cifs: set server->cipher_type to AES-128-CCM for SMB3.0
    020b6b0dc7b6 ALSA: usb-audio: scarlett2: Improve driver startup messages
    9a75ed510385 ALSA: usb-audio: scarlett2: Fix device hang with ehci-pci
    7b42f41dab4c ALSA: hda/realtek: fix mute/micmute LEDs and speaker for HP Zbook Fury 17 G8
    7573b58a2d8f ALSA: hda/realtek: fix mute/micmute LEDs and speaker for HP Zbook Fury 15 G8
    b8cd7164b345 ALSA: hda/realtek: fix mute/micmute LEDs and speaker for HP Zbook G8
    8ffce2b02b45 ALSA: hda/realtek: fix mute/micmute LEDs for HP 855 G8
    7906018de736 ALSA: hda/realtek: Chain in pop reduction fixup for ThinkStation P340
    2f0f8e06e7ea ALSA: hda/realtek: Headphone volume is controlled by Front mixer
    8ca63ce02782 ALSA: hda/realtek: the bass speaker can't output sound on Yoga 9i

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a765ba646b0ab1ab1da5d0a7fcde2e7a1109d7dc)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 11d8928ad7..9fb881c6c8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "d25690cb34d3b9d67089b318c48b89163058608c"
-SRCREV_meta ?= "48a13749dcfa21864b5cdf5f02a1c210a4b6046b"
+SRCREV_machine ?= "1a53b60abc0aebb4e7be89b3d17c755fc127c2ec"
+SRCREV_meta ?= "38475332ee6749bc15f39cf0c22cd5aa2c0fddd0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.41"
+LINUX_VERSION ?= "5.10.42"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 8fe0194193..5b567b98bc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.41"
+LINUX_VERSION ?= "5.10.42"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "c5b462a67540b3364a21999b601d08b837ee95a2"
-SRCREV_machine ?= "bb3f40e801fed14f9233749f7eaa27b105979059"
-SRCREV_meta ?= "48a13749dcfa21864b5cdf5f02a1c210a4b6046b"
+SRCREV_machine_qemuarm ?= "4ca63892af0a3fefae7c283e9b7bcca0e47fea91"
+SRCREV_machine ?= "f09a5c524d12166be99bf465e3c0431d3aec80f2"
+SRCREV_meta ?= "38475332ee6749bc15f39cf0c22cd5aa2c0fddd0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 24f856603c..583abdb5ad 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "d1a5dc63766ef3b2dfc79ac2965af69b33203520"
-SRCREV_machine_qemuarm64 ?= "bb3f40e801fed14f9233749f7eaa27b105979059"
-SRCREV_machine_qemumips ?= "03dd9a4bb1b030a89f56712c3d724f0219fd16a3"
-SRCREV_machine_qemuppc ?= "bb3f40e801fed14f9233749f7eaa27b105979059"
-SRCREV_machine_qemuriscv64 ?= "bb3f40e801fed14f9233749f7eaa27b105979059"
-SRCREV_machine_qemuriscv32 ?= "bb3f40e801fed14f9233749f7eaa27b105979059"
-SRCREV_machine_qemux86 ?= "bb3f40e801fed14f9233749f7eaa27b105979059"
-SRCREV_machine_qemux86-64 ?= "bb3f40e801fed14f9233749f7eaa27b105979059"
-SRCREV_machine_qemumips64 ?= "9292051c510e6bf1452ead867c8f8050556cfae3"
-SRCREV_machine ?= "bb3f40e801fed14f9233749f7eaa27b105979059"
-SRCREV_meta ?= "48a13749dcfa21864b5cdf5f02a1c210a4b6046b"
+SRCREV_machine_qemuarm ?= "ce15f50ef5cf0d81f8539b2b7c728a5045f09161"
+SRCREV_machine_qemuarm64 ?= "f09a5c524d12166be99bf465e3c0431d3aec80f2"
+SRCREV_machine_qemumips ?= "f1a8f73dd8680fc57aab5d8618a14b4e3a28587d"
+SRCREV_machine_qemuppc ?= "f09a5c524d12166be99bf465e3c0431d3aec80f2"
+SRCREV_machine_qemuriscv64 ?= "f09a5c524d12166be99bf465e3c0431d3aec80f2"
+SRCREV_machine_qemuriscv32 ?= "f09a5c524d12166be99bf465e3c0431d3aec80f2"
+SRCREV_machine_qemux86 ?= "f09a5c524d12166be99bf465e3c0431d3aec80f2"
+SRCREV_machine_qemux86-64 ?= "f09a5c524d12166be99bf465e3c0431d3aec80f2"
+SRCREV_machine_qemumips64 ?= "d8c0cf01dfa28b3271606f942df69a12c8d23a95"
+SRCREV_machine ?= "f09a5c524d12166be99bf465e3c0431d3aec80f2"
+SRCREV_meta ?= "38475332ee6749bc15f39cf0c22cd5aa2c0fddd0"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.41"
+LINUX_VERSION ?= "5.10.42"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1

