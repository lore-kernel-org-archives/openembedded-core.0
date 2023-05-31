Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EFF1C7EE37
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 18:49:18 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.2601.1685558955831717446
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 May 2023 11:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Vt8faO/4;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-75b0b2eb9ecso407407785a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 11:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685558955; x=1688150955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbeqcp02vSYfBBpGJTJ+NyLWshNUJBXCmd5Mo5BVvaQ=;
        b=Vt8faO/43NWXlm9TmpEpTBryUKeljr5E62QynLmzvfjrTDEoiqCO7v5Y9RqC1QwSei
         cmwOpHxwAYVq+C4SMHWcBeIJN9dgKnRzqfGwC8Yb2BTwyOnrmMOky8DVcHIV/S4w2cZY
         wf+rGZXOwMOwK2sjzB3Rt/ITC+WY59nPDyeujEJB+MrtzuUN1wpCo5IE0H9XHY2cMd3U
         nw4ERccFy63Ju7VH0p2zx859MXkNr6QT5NMcMbIyIWZsYoK1YMGHvAK7ZdX02VJo8AuQ
         dlmbsvr6lf7vApLL0b9Ct/McnJfVLCBx9+MK4Uj2v+DhDCjkPFy7oRPMwJsUW7CPPhWX
         azUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685558955; x=1688150955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wbeqcp02vSYfBBpGJTJ+NyLWshNUJBXCmd5Mo5BVvaQ=;
        b=LBbBPQEU4aV4YOU8pH7TJQTS6dA9UFIcY0ggNDSugE8GjD41BmZ3wgMAapwJBUp/fF
         iwkPmXoLXL6D3SaNpp5bpdgwD6tReb0oxS+m63tj/AH3DiPywjpWqacrN0oyqWhQDwlf
         474ZxjbIPw1KmlJKp8wyjLn8X8BlYlKHIbVTwZ6J+vnnT0JeDZT+MWoP6wuo8fscpP5K
         l/qTn7HwCsoWK1IdLzfV0Wjj4kvOLx5z58hvAXV6Bzc5z5VpSzEsfn7uxYigLBpWHCtT
         iET5L0JrOVBG/yJx6oveyuLq29WTMag3QJHFVHCEt65dP1bqzBhbAEv6veEGSXXNFEMy
         I97A==
X-Gm-Message-State: AC+VfDxL/rbTKpkO3K9IGlrRZA92Q9ZsUVbAn9U5grADEm+9NY4aym6e
	kTQo7TmpY5UfJebayWeDE8fmXSihKDfglg==
X-Google-Smtp-Source: ACHHUZ6NUs2277JsBVqy8lVLz21kpwZgdiqkbLwf3Vr1YqFnS1DzUaCAWPSRXBxWD2zT6wqGQwu2kw==
X-Received: by 2002:a05:6214:e6c:b0:620:a1be:c74d with SMTP id jz12-20020a0562140e6c00b00620a1bec74dmr6683755qvb.37.1685558953771;
        Wed, 31 May 2023 11:49:13 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id e16-20020a0cf750000000b006257e64474asm3926645qvo.113.2023.05.31.11.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 11:49:13 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 9/9] linux-yocto/6.1: update to v6.1.30
Date: Wed, 31 May 2023 14:49:01 -0400
Message-Id: <22330b744eb628e426ef4a20f8c35b1177e16551.1685558432.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685558432.git.bruce.ashfield@gmail.com>
References: <cover.1685558432.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 May 2023 18:49:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182032

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    a343b0dd87b4 Linux 6.1.30
    da9a8dc33da2 drm/amdgpu: reserve the old gc_11_0_*_mes.bin
    616843d5a11b drm/amd/amdgpu: introduce gc_*_mes_2.bin v2
    09bf14907d86 drm/amdgpu: declare firmware for new MES 11.0.4
    f05ccf6a6ac6 crypto: testmgr - fix RNG performance in fuzz tests
    682679fc953d remoteproc: imx_dsp_rproc: Fix kernel test robot sparse warning
    7099e14f601e rethook, fprobe: do not trace rethook related functions
    c46d3efb4d23 rethook: use preempt_{disable, enable}_notrace in rethook_trampoline_handler
    4e38a02b2207 arm64: mte: Do not set PG_mte_tagged if tags were not initialized
    02cf4a336e7d s390/qdio: fix do_sqbs() inline assembly constraint
    25e8d30507aa s390/crypto: use vector instructions only if available for ChaCha20
    eeb63c07ba72 s390/dasd: fix command reject error on ESE devices
    acc2a40e428f nilfs2: fix use-after-free bug of nilfs_root in nilfs_evict_inode()
    0fc73f310c05 powerpc/64s/radix: Fix soft dirty tracking
    ae5d148965bc tpm/tpm_tis: Disable interrupts for more Lenovo devices
    9a74146540cf powerpc/iommu: Incorrect DDW Table is referenced for SR-IOV device
    fc983cf5ddd2 powerpc/iommu: DMA address offset is incorrectly calculated with 2MB TCEs
    6e092fa42ed1 dt-bindings: ata: ahci-ceva: Cover all 4 iommus entries
    76313a63f779 drm/amdgpu/gfx11: update gpu_clock_counter logic
    055852074c96 drm/amdgpu: refine get gpu clock counter method
    4e2f9159f942 drm/amdgpu/gfx11: Adjust gfxoff before powergating on gfx11 as well
    abfe2ffc004a drm/amdgpu/gfx10: Disable gfxoff before disabling powergating.
    9de5a985884a drm/amdgpu/gmc11: implement get_vbios_fb_size()
    903e942500c6 drm/amd/pm: fix possible power mode mismatch between driver and PMFW
    595824a45090 ceph: force updating the msg pointer in non-split case
    3338d0b9acde vc_screen: reload load of struct vc_data pointer in vcs_write() to avoid UAF
    e16629c639d4 thunderbolt: Clear registers properly when auto clear isn't in use
    abc7e50e891f serial: qcom-geni: fix enabling deactivated interrupt
    1db5db7a99a0 serial: 8250_exar: Add support for USR298x PCI Modems
    cda8aa19bfdb serial: Add support for Advantech PCI-1611U card
    2cab13f500a6 mm: fix zswap writeback race condition
    254ee530286a maple_tree: make maple state reusable after mas_empty_area()
    6c4172d44cf9 statfs: enforce statfs[64] structure initialization
    154de42fe3f2 KVM: Fix vcpu_array[0] races
    75378b03a90d ksmbd: fix global-out-of-bounds in smb2_find_context_vals
    40d90ee0275a ksmbd: fix wrong UserName check in session_user
    af7335a4b946 ksmbd: allocate one more byte for implied bcc[0]
    f1d013b0f0f0 ksmbd: smb2: Allow messages padded to 8byte boundary
    4d25f93e64be SMB3: drop reference to cfile before sending oplock break
    3b66d58c89fd SMB3: Close all deferred handles of inode in case of handle lease break
    107677a8f435 wifi: rtw88: use work to update rate to avoid RCU warning
    d61191092d63 can: kvaser_pciefd: Disable interrupts in probe error path
    eabb11236a64 can: kvaser_pciefd: Do not send EFLUSH command on TFD interrupt
    45ce3beb02a0 can: kvaser_pciefd: Clear listen-only bit if not explicitly requested
    fcdfc1860f8a can: kvaser_pciefd: Empty SRB buffer in probe
    50bdf44a1bda can: kvaser_pciefd: Call request_irq() before enabling interrupts
    24bdfcb09947 can: kvaser_pciefd: Set CAN_STATE_STOPPED in kvaser_pciefd_stop()
    9cd1025b1a46 can: isotp: recvmsg(): allow MSG_CMSG_COMPAT flag
    836641cc41cd can: j1939: recvmsg(): allow MSG_CMSG_COMPAT flag
    0eee95cbbbf7 ALSA: hda/realtek: Fix mute and micmute LEDs for yet another HP laptop
    0cc95fdb67bb ALSA: hda/realtek: Add quirk for HP EliteBook G10 laptops
    4ea7c3388f38 ALSA: hda/realtek: Add quirk for 2nd ASUS GU603
    9328c6569457 ALSA: hda/realtek: Add a quirk for HP EliteDesk 805
    30043b0a065c ALSA: hda/realtek: Add quirk for Clevo L140AU
    0e1e6c077952 ALSA: hda: Add NVIDIA codec IDs a3 through a7 to patch table
    dc8c569d59f1 ALSA: hda: Fix Oops by 9.1 surround channel names
    44f2ed29e16d xhci: Fix incorrect tracking of free space on transfer rings
    643a45387896 xhci-pci: Only run d3cold avoidance quirk for s2idle
    ea56ede91178 Revert "usb: gadget: udc: core: Invoke usb_gadget_connect only when started"
    7356d42ceffe Revert "usb: gadget: udc: core: Prevent redundant calls to pullup"
    08bd1be1c716 usb: typec: altmodes/displayport: fix pin_assignment_show
    f1f810e54163 usb: gadget: u_ether: Fix host MAC address case
    a9342bd4c29b usb: dwc3: debugfs: Resume dwc3 before accessing registers
    ad43004fd532 usb: dwc3: gadget: Improve dwc3_gadget_suspend() and dwc3_gadget_resume()
    56a0769fa40a USB: UHCI: adjust zhaoxin UHCI controllers OverCurrent bit value
    4c3312745ffb usb-storage: fix deadlock when a scsi command timeouts more than once
    0ced12bdf624 USB: usbtmc: Fix direction for 0-length ioctl control messages
    2cd7d88fcb1e ALSA: usb-audio: Add a sample rate workaround for Line6 Pod Go
    d319fe244e87 bridge: always declare tunnel functions
    a836be60a3aa netfilter: nft_set_rbtree: fix null deref on element insertion
    8f58c538573a netfilter: nf_tables: fix nft_trans type confusion
    d862b63605df net: selftests: Fix optstring
    fdc5c8fb57d7 net: pcs: xpcs: fix C73 AN not getting enabled
    ee44bacf462d net: wwan: iosm: fix NULL pointer dereference when removing device
    c3e3e8933faa vlan: fix a potential uninit-value in vlan_dev_hard_start_xmit()
    e02d2b987c02 igb: fix bit_shift to be in [1..8] range
    516114d7fb58 net: dsa: mv88e6xxx: Fix mv88e6393x EPC write command offset
    172146c26f0c cassini: Fix a memory leak in the error handling path of cas_init_one()
    9cae243b9ae2 tun: Fix memory leak for detached NAPI queue.
    e2d59768f851 net: tun: rebuild error handling in tun_get_user
    ae42c6f79cec scsi: storvsc: Don't pass unused PFNs to Hyper-V host
    557ba100d8cf wifi: iwlwifi: mvm: don't trust firmware n_channels
    a270c552ced3 wifi: iwlwifi: mvm: fix OEM's name in the tas approved list
    bc907fbf48bc wifi: iwlwifi: fix OEM's name in the ppag approved list
    2160e1198191 wifi: iwlwifi: fw: fix DBGI dump
    a20550b3aac3 wifi: iwlwifi: mvm: fix cancel_delayed_work_sync() deadlock
    bc2265643208 wifi: mac80211: Abort running color change when stopping the AP
    01a4503d9fb8 wifi: mac80211: fix min center freq offset tracing
    c79d794a2cd7 wifi: mac80211: fortify the spinlock against deadlock by interrupt
    f9a85347e4d1 wifi: cfg80211: Drop entries with invalid BSSIDs in RNR
    dda9c9b117a2 ice: Fix ice VF reset during iavf initialization
    f181d799fb53 ice: introduce clear_reset_state operation
    36e6c7ada5ed net: bcmgenet: Restore phy_stop() depending upon suspend/close
    41357a52b83e net: bcmgenet: Remove phy_stop() from bcmgenet_netif_stop()
    e90cefcffd73 can: dev: fix missing CAN XL support in can_put_echo_skb()
    c9abef1e07ff s390/cio: include subchannels without devices also for evaluation
    f215b62f59be tipc: check the bearer min mtu properly when setting it by netlink
    259683001d7e tipc: do not update mtu if msg_max is too small in mtu negotiation
    735c64ea8802 tipc: add tipc_bearer_min_mtu to calculate min mtu
    73f53bc29572 virtio_net: Fix error unwinding of XDP initialization
    978a55b0c096 virtio-net: Maintain reverse cleanup order
    6fbedf987b6b net: nsh: Use correct mac_offset to unwind gso skb in nsh_gso_segment()
    82ede435440e drm/exynos: fix g2d_open/close helper function definitions
    866c78a3a99b ASoC: SOF: topology: Fix logic for copying tuples
    3e56a1c04882 ASoC: mediatek: mt8186: Fix use-after-free in driver remove path
    da1b6989764d SUNRPC: Fix trace_svc_register() call site
    47adb84916ee SUNRPC: always free ctxt when freeing deferred request
    fd86534872f4 SUNRPC: double free xprt_ctxt while still in use
    07821524f67b media: netup_unidvb: fix use-after-free at del_timer()
    4147a0cee15d net: hns3: fix reset timeout when enable full VF
    89982e050110 net: hns3: fix reset delay time to avoid configuration timeout
    2a06c5ab7b92 net: hns3: fix sending pfc frames after reset issue
    8ee34c90ce5e net: hns3: fix output information incomplete for dumping tx queue info with debugfs
    37c1e28967e1 net: dsa: rzn1-a5psw: disable learning for standalone ports
    7ceeb5608d16 net: dsa: rzn1-a5psw: fix STP states handling
    374c9cf3ad60 net: dsa: rzn1-a5psw: enable management frames for CPU port
    33a93db90967 erspan: get the proto with the md version for collect_md
    2a3e5f428fc4 serial: 8250_bcm7271: fix leak in `brcmuart_probe`
    dcf08087c2cd serial: 8250_bcm7271: balance clk_enable calls
    081790eee6b4 serial: arc_uart: fix of_iomap leak in `arc_serial_probe`
    820a60a4160f tcp: fix possible sk_priority leak in tcp_v4_send_reset()
    9bcf4794f1c6 vsock: avoid to close connected socket after the timeout
    116cc7670f06 sfc: disable RXFCS and RXALL features by default
    1c052acd717a ALSA: hda/realtek: Apply HP B&O top speaker profile to Pavilion 15
    a16bf8f9c8b5 wifi: mt76: connac: fix stats->tx_bytes calculation
    ee1a221d9478 ALSA: firewire-digi00x: prevent potential use after free
    ea9c758184ae net: phy: dp83867: add w/a for packet errors seen with short cables
    9407454a9b18 net: fec: Better handle pm_runtime_get() failing in .remove()
    e412fa5d81f0 selftets: seg6: disable rp_filter by default in srv6_end_dt4_l3vpn_test
    7099beeec97d selftests: seg6: disable DAD on IPv6 router cfg for srv6_end_dt4_l3vpn_test
    c498e5d39294 drm/msm: Fix submit error-path leaks
    474d57adf16a af_key: Reject optional tunnel/BEET mode templates in outbound policies
    e5a0b280b05f xfrm: Reject optional tunnel/BEET mode templates in outbound policies
    0d778f0cb131 cpupower: Make TSC read per CPU for Mperf monitor
    ce6c7befc2ea ASoC: fsl_micfil: Fix error handler with pm_runtime_enable
    9d3ac384cbce platform: Provide a remove callback that returns no value
    394336e13973 dt-bindings: display/msm: dsi-controller-main: Document qcom, master-dsi and qcom, sync-dual-dsi
    97d6437cbf10 drm/msm/dpu: Remove duplicate register defines from INTF
    d6d90e140226 drm/msm/dpu: Move non-MDP_TOP INTF_INTR offsets out of hwio header
    092f382f65c4 drm/msm/dpu: Assign missing writeback log_mask
    ccde7016d131 drm/msm/dp: unregister audio driver during unbind
    6867c4b5dbfe Revert "Fix XFRM-I support for nested ESP tunnels"
    070d0047c670 xfrm: don't check the default policy if the policy allows the packet
    7b5a8a23acbc drm/amdgpu: drop gfx_v11_0_cp_ecc_error_irq_funcs
    b5f3f923d421 platform/x86: hp-wmi: add micmute to hp_wmi_keymap struct
    1189b7f49540 platform/x86: Move existing HP drivers to a new hp subdir
    c9888aaed1a2 parisc: Replace regular spinlock with spin_trylock on panic path
    e112b2e26569 mfd: intel-lpss: Add Intel Meteor Lake PCH-S LPSS PCI IDs
    77f43c014a77 mfd: dln2: Fix memory leak in dln2_probe()
    d3ee2f9e3069 mfd: intel_soc_pmic_chtwc: Add Lenovo Yoga Book X90F to intel_cht_wc_models
    4e5e9da139c0 soundwire: bus: Fix unbalanced pm_runtime_put() causing usage count underflow
    60eb1afb4fb6 soundwire: qcom: gracefully handle too many ports in DT
    3060b08d633a phy: st: miphy28lp: use _poll_timeout functions for waits
    81e8f1abd08f soundwire: dmi-quirks: add remapping for Intel 'Rooks County' NUC M15
    895130e63c93 recordmcount: Fix memory leaks in the uwrite function
    4e2df9111887 lkdtm/stackleak: Fix noinstr violation
    fa825017fb15 sched: Fix KCSAN noinstr violation
    eaa182a6c81c mcb-pci: Reallocate memory region to avoid memory overlapping
    af4d6dbb1a92 serial: 8250: Reinit port->pm on port specific driver unbind
    6a4cef8244de usb: typec: tcpm: fix multiple times discover svids error
    1edff076cc41 HID: wacom: generic: Set battery quirk only when we see battery data
    37358a22a334 HID: Ignore battery for ELAN touchscreen on ROG Flow X13 GV301RA
    10ba1c342451 HID: apple: Set the tilde quirk flag on the Geyser 3
    f3e2f3e0a7af ASoC: amd: yc: Add ThinkBook 14 G5+ ARP to quirks list for acp6x
    1a6371c50b79 ASoC: amd: Add Dell G15 5525 to quirks list
    26fda3734523 ALSA: hda: LNL: add HD Audio PCI ID
    907d6b615e79 usb: typec: ucsi: acpi: add quirk for ASUS Zenbook UM325
    b484aa214763 spi: spi-imx: fix MX51_ECSPI_* macros when cs > 3
    1844749dcfc4 HID: logitech-hidpp: Reconcile USB and Unifying serials
    16420da84522 HID: logitech-hidpp: Don't use the USB serial for USB devices
    2e64faf6553b ASoC: amd: yc: Add DMI entries to support HP OMEN 16-n0xxx (8A42)
    6ce24d176ea6 staging: axis-fifo: initialize timeouts in init only
    b268082188e6 HID: apple: Set the tilde quirk flag on the Geyser 4 and later
    ec310591cf83 staging: rtl8192e: Replace macro RTL_PCI_DEVICE with PCI_DEVICE
    022fe9fcac06 Bluetooth: btrtl: Add the support for RTL8851B
    fd269a0435f8 Bluetooth: L2CAP: fix "bad unlock balance" in l2cap_disconnect_rsp
    2f4a1b24dad0 Bluetooth: Add new quirk for broken set random RPA timeout for ATS2851
    76dd7893bd10 Bluetooth: hci_bcm: Fall back to getting bdaddr from EFI if not set
    803ba6dcc4b6 Bluetooth: btintel: Add LE States quirk support
    ea160ece0866 Bluetooth: btrtl: check for NULL in btrtl_set_quirks()
    f4f3cbdbf2c8 Bluetooth: Improve support for Actions Semi ATS2851 based devices
    88deda7cd8fa Bluetooth: btrtl: add support for the RTL8723CS
    c97ab504419b Bluetooth: Add new quirk for broken local ext features page 2
    d9a68e9e89ce Bluetooth: btusb: Add new PID/VID 04ca:3801 for MT7663
    75481fa7aa5b ipvs: Update width of source for ip_vs_sync_conn_options
    fab766c8a1af nbd: fix incomplete validation of ioctl arg
    068fd06148fb wifi: ath11k: Fix SKB corruption in REO destination ring
    57189c885149 wifi: iwlwifi: dvm: Fix memcpy: detected field-spanning write backtrace
    fd35b7bb6d5a null_blk: Always check queue mode setting from configfs
    63e2d06adf6b wifi: iwlwifi: fix iwl_mvm_max_amsdu_size() for MLO
    e78526a06b53 wifi: ath11k: Ignore frags from uninitialized peer in dp.
    1655cfc85250 block, bfq: Fix division by zero error on zero wsum
    dbebdee3f2e9 wifi: iwlwifi: mvm: fix ptk_pn memory leak
    eb1ef44efac7 wifi: iwlwifi: pcie: Fix integer overflow in iwl_write_to_user_buf
    19f063df737b wifi: iwlwifi: add a new PCI device ID for BZ device
    0f9a1bcb9401 wifi: iwlwifi: pcie: fix possible NULL pointer dereference
    b4acb6c3ede8 md: fix soft lockup in status_resync
    60039bf72f81 bpf: Add preempt_count_{sub,add} into btf id deny list
    f2065b8b0a21 samples/bpf: Fix fout leak in hbm's run_bpf_prog
    e05d63f8b48a f2fs: fix to check readonly condition correctly
    7741ddc882a0 f2fs: fix to drop all dirty pages during umount() if cp_error is set
    f4631d295ae3 f2fs: Fix system crash due to lack of free space in LFS
    c1b0b32f2dfa crypto: jitter - permanent and intermittent health errors
    9d4430b7f862 ext4: Fix best extent lstart adjustment logic in ext4_mb_new_inode_pa()
    c6bee8970075 ext4: set goal start correctly in ext4_mb_normalize_request
    7739981b9c6a scsi: ufs: ufs-pci: Add support for Intel Lunar Lake
    d48590323186 gfs2: Fix inode height consistency check
    9c6da3b7f125 scsi: message: mptlan: Fix use after free bug in mptlan_remove() due to race condition
    c9115f49cf26 lib: cpu_rmap: Avoid use after free on rmap->obj array entries
    a7a4def6c704 scsi: target: iscsit: Free cmds before session free
    d957a100bcc2 netdev: Enforce index cap in netdev_get_tx_queue
    cf1fe8ccb506 net: Catch invalid index in XPS mapping
    ee5929c1e85e net: pasemi: Fix return type of pasemi_mac_start_tx()
    efb1a2575134 bnxt: avoid overflow in bnxt_get_nvram_directory()
    8a7228969431 scsi: lpfc: Correct used_rpi count when devloss tmo fires with no recovery
    a9df88cb31dc scsi: lpfc: Prevent lpfc_debugfs_lockstat_write() buffer overflow
    e6f4fb28890c ext2: Check block size validity during mount
    f8a6c53ff1d9 wifi: brcmfmac: cfg80211: Pass the PMK in binary instead of hex
    c35105f375b5 wifi: brcmfmac: pcie: Provide a buffer of random bytes to the device
    4e7a81b5e718 bpf: Annotate data races in bpf_local_storage
    660ab315619b wifi: ath: Silence memcpy run-time false positive warning
    48e4e06e2c5f media: mediatek: vcodec: Fix potential array out-of-bounds in decoder queue_setup
    83c42283bff0 media: Prefer designated initializers over memset for subdev pad ops
    210ef6cd8e63 drm/amdgpu: Fix sdma v4 sw fini error
    5675ecd2e0b0 drm/amd: Fix an out of bounds error in BIOS parser
    ec5f00a59aad drm/amd/display: Correct DML calculation to follow HW SPEC
    cf180afea303 ACPI: video: Remove desktops without backlight DMI quirks
    86ba4f7b9f94 irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4
    57b5a56cecbe arm64: dts: qcom: sdm845-polaris: Drop inexistent properties
    fee613349009 ACPICA: ACPICA: check null return of ACPI_ALLOCATE_ZEROED in acpi_db_display_objects
    8c4a7163b7f1 ACPICA: Avoid undefined behavior: applying zero offset to null pointer
    b1db73e27f0b drm/msm/dp: Clean up handling of DP AUX interrupts
    a6eb3aa0ec5b drm/tegra: Avoid potential 32-bit integer overflow
    a7f9c14aced3 remoteproc: stm32_rproc: Add mutex protection for workqueue
    3dc61a19c924 drm/amd/display: fixed dcn30+ underflow issue
    86a159fd5bdb ACPI: EC: Fix oops when removing custom query handlers
    a8267bc8de73 firmware: arm_sdei: Fix sleep from invalid context BUG
    b963e1b7066f arm64: dts: imx8mq-librem5: Remove dis_u3_susphy_quirk from usb_dwc3_0
    9a342d4eb9fb memstick: r592: Fix UAF bug in r592_remove due to race condition
    110d42025223 drm/rockchip: dw_hdmi: cleanup drm encoder during unbind
    79ca94bc3e8c ACPI: processor: Check for null return of devm_kzalloc() in fch_misc_setup()
    cc4273233ace media: pvrusb2: VIDEO_PVRUSB2 depends on DVB_CORE to use dvb_* symbols
    3c67f49a6643 media: pci: tw68: Fix null-ptr-deref bug in buf prepare and finish
    6738841f6fcf media: cx23885: Fix a null-ptr-deref bug in buffer_prepare() and buffer_finish()
    346c97552455 arm64: dts: qcom: msm8996: Add missing DWC3 quirks
    44361033a880 remoteproc: imx_dsp_rproc: Add custom memory copy implementation for i.MX DSP Cores
    10add04ee608 regmap: cache: Return error in cache sync operations for REGCACHE_NONE
    34813f041d0e drm/amd/display: Use DC_LOG_DC in the trasform pixel function
    d547d499e451 drm/amd/display: Enable HostVM based on rIOMMU active
    898b031dc267 platform/x86: x86-android-tablets: Add Acer Iconia One 7 B1-750 data
    09f7da1301cf drm/amd/display: Correct DML calculation to align HW formula
    92e6c79acad4 drm/amd/display: populate subvp cmd info only for the top pipe
    4b17053ba268 drm/displayid: add displayid_get_header() and check bounds better
    48960a503fce fs: hfsplus: remove WARN_ON() from hfsplus_cat_{read,write}_inode()
    e8c322b76e58 open: return EINVAL for O_DIRECTORY | O_CREAT
    d0a8c0e31a09 rcu: Protect rcu_print_task_exp_stall() ->exp_tasks access
    801593f70be8 selftests: cgroup: Add 'malloc' failures checks in test_memcontrol
    522c441faf82 refscale: Move shutdown from wait_event() to wait_event_idle()
    b4319e457d6e ext4: allow ext4_get_group_info() to fail
    f12aa035e814 ext4: allow to find by goal if EXT4_MB_HINT_GOAL_ONLY is set
    cd2341c26fb6 ext4: don't clear SB_RDONLY when remounting r/w until quota is re-enabled
    cc4086759fda ext4: reflect error codes from ext4_multi_mount_protect() to its callers
    5a08a72da35b fbdev: arcfb: Fix error handling in arcfb_probe()
    dcd289136bcc drm/i915: taint kernel when force probing unsupported devices
    36fa6187753a drm/i915: Expand force_probe to block probe of devices as well.
    86d73b1f98a8 drm/i915/dp: prevent potential div-by-zero
    dbf25cc21bef drm/i915: Fix NULL ptr deref by checking new_crtc_state
    1b485f39acf3 drm/i915/guc: Don't capture Gen8 regs on Xe devices
    e410895892f9 af_unix: Fix data races around sk->sk_shutdown.
    75924fb0f373 af_unix: Fix a data race of sk->sk_receive_queue->qlen.
    8759c1a361fa net: datagram: fix data-races in datagram_poll()
    9e62a4960838 net: mscc: ocelot: fix stat counter register values
    610a433810b2 ipvlan:Fix out-of-bounds caused by unclear skb->cb
    d695dccb74e3 gve: Remove the code of clearing PBA bit
    b4c0af8974be tcp: add annotations around sk->sk_shutdown accesses
    55caf900e13c net: add vlan_get_protocol_and_depth() helper
    65531f567536 net: deal with most data-races in sk_wait_event()
    bd0f360ee864 net: annotate sk->sk_err write from do_recvmmsg()
    a115dadf8995 netlink: annotate accesses to nlk->cb_running
    6b4585a3c9f0 bonding: fix send_peer_notif overflow
    d9176dc690bc netfilter: conntrack: fix possible bug_on with enable_hooks=1
    30e4b13b1bfb netfilter: nf_tables: always release netdev hooks from notifier
    6fa2e7bb7ba4 net: phy: bcm7xx: Correct read from expansion register
    7145f2309d64 net: Fix load-tearing on sk->sk_stamp in sock_recv_cmsgs().
    edc1f6d89be3 net: stmmac: Initialize MAC_ONEUS_TIC_COUNTER register
    9e916db758a0 linux/dim: Do nothing if no time delta between samples
    a84b08314f44 tick/broadcast: Make broadcast device replacement work correctly
    262841702603 scsi: ufs: core: Fix I/O hang that occurs when BKOPS fails in W-LUN suspend
    27c6b573d150 net: mdio: mvusb: Fix an error handling path in mvusb_mdio_probe()
    3e785c8deb04 net: skb_partial_csum_set() fix against transport header magic value
    8547757056c4 ARM: 9296/1: HP Jornada 7XX: fix kernel-doc warnings
    3ff962242f5b drm/mipi-dsi: Set the fwnode for mipi_dsi_device
    efd2821b8abe drm/fbdev-generic: prohibit potential out-of-bounds access

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 4fbbfb1367..597be2668d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8b754025611eb94967a5b03aeaabe629ab4d1f03"
-SRCREV_meta ?= "8ad7b7906e93fe0deed70d93632299c5dc937258"
+SRCREV_machine ?= "031b5c5dd6ec09850fa783dfe07fc79543f46181"
+SRCREV_meta ?= "922bc1fa7422e1dd9192b1859c2904af145be7c5"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.29"
+LINUX_VERSION ?= "6.1.30"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 3074420f4f..9c91d0b12e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.29"
+LINUX_VERSION ?= "6.1.30"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "593e4f8f12aa24a3b24b0065b871441c9cc092bd"
-SRCREV_meta ?= "8ad7b7906e93fe0deed70d93632299c5dc937258"
+SRCREV_machine ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
+SRCREV_meta ?= "922bc1fa7422e1dd9192b1859c2904af145be7c5"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 014b502fce..2b55cfe22d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "6980804856a73a2c52e94bc6121c3d9d5caaed42"
-SRCREV_machine:qemuarm64 ?= "593e4f8f12aa24a3b24b0065b871441c9cc092bd"
-SRCREV_machine:qemuloongarch64 ?= "593e4f8f12aa24a3b24b0065b871441c9cc092bd"
-SRCREV_machine:qemumips ?= "9c44910d8c8dbb994ffd0b92d89d0842e754f37f"
-SRCREV_machine:qemuppc ?= "593e4f8f12aa24a3b24b0065b871441c9cc092bd"
-SRCREV_machine:qemuriscv64 ?= "593e4f8f12aa24a3b24b0065b871441c9cc092bd"
-SRCREV_machine:qemuriscv32 ?= "593e4f8f12aa24a3b24b0065b871441c9cc092bd"
-SRCREV_machine:qemux86 ?= "593e4f8f12aa24a3b24b0065b871441c9cc092bd"
-SRCREV_machine:qemux86-64 ?= "593e4f8f12aa24a3b24b0065b871441c9cc092bd"
-SRCREV_machine:qemumips64 ?= "18710460737428d230d146df6c84b803cd52d878"
-SRCREV_machine ?= "593e4f8f12aa24a3b24b0065b871441c9cc092bd"
-SRCREV_meta ?= "8ad7b7906e93fe0deed70d93632299c5dc937258"
+SRCREV_machine:qemuarm ?= "184474571931cc506e67b1e5aeb40feb1d7df04e"
+SRCREV_machine:qemuarm64 ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
+SRCREV_machine:qemuloongarch64 ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
+SRCREV_machine:qemumips ?= "e87f9e19a7f8c2312ba62f0ba7426728c8191f1a"
+SRCREV_machine:qemuppc ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
+SRCREV_machine:qemuriscv64 ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
+SRCREV_machine:qemuriscv32 ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
+SRCREV_machine:qemux86 ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
+SRCREV_machine:qemux86-64 ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
+SRCREV_machine:qemumips64 ?= "7c17dfad5a3bff04c30b40c2fffb6f1f8f8f095e"
+SRCREV_machine ?= "6ec439b4b456ce929c4c07fe457b5d6a4b468e86"
+SRCREV_meta ?= "922bc1fa7422e1dd9192b1859c2904af145be7c5"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "fa74641fb6b93a19ccb50579886ecc98320230f9"
+SRCREV_machine:class-devupstream ?= "a343b0dd87b42ba9d508fbf7d0c06f744c2e0954"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.29"
+LINUX_VERSION ?= "6.1.30"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.34.1


