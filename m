Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C82CF649E
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 01:57:56 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.45285.1727661472323262481
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 18:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XWbMooBh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2e0af6e5da9so2325790a91.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 18:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727661471; x=1728266271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/O4FRHWGLRUqew9+AuK8dpPywa94KfOFHkK9nynBLA=;
        b=XWbMooBhfEGnFGU8ZGkqNMaph1W34MtcpoNeZqQxWbsiAviIN1/WyX5tCQAXXQsciu
         ZDjcYBFn1R+mGV3AlMfoxNT5EcFMfZWKUqFQD/MZqTLr5ZIs8Wegca6Bp9mfmOrTaia3
         K5ajJZ2yUUnI3tn4IOevDG5IEPiacfJ+9EcXQJqBpbUKJ72DcMAv7NRv3B63rhmftHQn
         zfJzV4DH0Eq6qIIQDEluDVZIZ+VQagHfCGrzyrIgu+jtwgcCGSDWQslT8X4PnmS6ncWz
         eHUN0sd5j/d2WAq8EcjwAt2+kAO9Wv4w7OzARnIVoC1wNMj6w/kX+ZpQRsuUDlSadbHx
         TI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727661471; x=1728266271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/O4FRHWGLRUqew9+AuK8dpPywa94KfOFHkK9nynBLA=;
        b=ZnjfbvtROzzPvnhAqc2uxkeYOe+HWZNjG36rQ49awTU37AZJH3uz9W0H83JKaPezoW
         CTaUHCboZ+IiFagZNS48RzqT6iIfyxbgcgyGGSMXw6wK+umsXyT9qDsCb3j/KSFkQwgy
         5QQtGP8XXg0/iys2xcUt3+9/qq2lRhex/lr+s7YVsy6WuQR66ZDc7qNGnNjNhomvC4io
         5GayCgGoLeksTwMmeYSwbBr3pHgmLzx8IloFBli16bNhmEf2p+I0ke/BUaYuiZhNUTSK
         ch0yrdAeJAR5USJEfQNyWRGj/8z5ddSaHwZ9oovTlk55y+90YWk+wjFCRcC/iXFDh6cq
         YlDQ==
X-Gm-Message-State: AOJu0YxDXy9oAniDL3qNaK19nDmB91UVQEl7BE1yK3KoXbYWKd1OlkNx
	VUFDH/171aZ5KuBwiKh9rswAqY3hcW7tIaAet8JysgwkGLENwAFPqm2UOj9HvfL7Phbe/3KUsPm
	8ju8=
X-Google-Smtp-Source: AGHT+IGJ9t/4kPN2GmvCIxT+qE3yrSjKeLuR6TPD78zOHXB2/p0krDbEA5AIFQIOLvdMCkUb/oNLoQ==
X-Received: by 2002:a17:90a:ec11:b0:2e0:6cd4:973a with SMTP id 98e67ed59e1d1-2e0b887184amr12419363a91.5.1727661470808;
        Sun, 29 Sep 2024 18:57:50 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e0d4af744bsm5496070a91.23.2024.09.29.18.57.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 18:57:50 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 12/27] linux-yocto/6.6: update to v6.6.49
Date: Sun, 29 Sep 2024 18:57:07 -0700
Message-Id: <39c6afcac2c9a8633baedaa7c8f58f3692e27e89.1727661284.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1727661284.git.steve@sakoman.com>
References: <cover.1727661284.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 01:57:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205074

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    df1a7cc5e00f Linux 6.6.49
    d60839a73a26 apparmor: fix policy_unpack_test on big endian systems
    8a3995a3ffec scsi: aacraid: Fix double-free on probe failure
    790a8d36f96b arm64: dts: freescale: imx93-tqma9352-mba93xxla: fix typo
    7cf7de0f3572 arm64: dts: freescale: imx93-tqma9352: fix CMA alloc-ranges
    f8fb2cd48653 arm64: dts: imx93: update default value for snps,clk-csr
    d0c54c294926 arm64: dts: imx93: add nvmem property for eqos
    1e59301fcc30 arm64: dts: imx93: add nvmem property for fec1
    228d69f93898 arm64: dts: imx8mp-beacon-kit: Fix Stereo Audio on WM8962
    8aaca1c9fb9a ARM: dts: omap3-n900: correct the accelerometer orientation
    d54696813cf4 usb: cdnsp: fix for Link TRB with TC
    72be846dc76e usb: cdnsp: fix incorrect index in cdnsp_get_hw_deq function
    8fc7c9dcfe38 usb: core: sysfs: Unmerge @usb3_hardware_lpm_attr_group in remove_power_attributes()
    70b43c33669e usb: dwc3: st: add missing depopulate in probe error path
    e1e5e8ea2731 usb: dwc3: st: fix probed platform device ref count on probe error path
    7bb11a75dd4d usb: dwc3: core: Prevent USB core invalid event buffer address access
    df2daed52923 usb: dwc3: omap: add missing depopulate in probe error path
    b3e8696e0374 ARM: dts: imx6dl-yapp43: Increase LED current to match the yapp4 HW design
    6d9f4783868b USB: serial: option: add MeiG Smart SRM825L
    03e3156ea7e5 scsi: sd: Ignore command SYNCHRONIZE CACHE error if format in progress
    cdf7efe4b02a firmware: qcom: scm: Mark get_wq_ctx() as atomic call
    ea3b6ec38bed cdc-acm: Add DISABLE_ECHO quirk for GE HealthCare UI Controller
    1efdbf5323c9 soc: qcom: pmic_glink: Fix race during initialization
    c704091b5911 soc: qcom: pmic_glink: Actually communicate when remote goes down
    ef80520be0ff soc: qcom: cmd-db: Map shared memory as WC, not WB
    56ad559cf6d8 nfc: pn533: Add poll mod list filling check
    55526afdbb52 net: busy-poll: use ktime_get_ns() instead of local_clock()
    f6f5e39a3fe7 drm/amd/display: avoid using null object of framebuffer
    b65116bee7b5 sctp: fix association labeling in the duplicate COOKIE-ECHO case
    28c67f0f84f8 gtp: fix a potential NULL pointer dereference
    6b598069164a bonding: change ipsec_lock from spin lock to mutex
    19792758339b bonding: extract the use of real_device into local variable
    124a688ed36c bonding: implement xdo_dev_state_free and call it after deletion
    7aa9f978c2b6 selftests: forwarding: local_termination: Down ports on cleanup
    7e7d0bd538d5 selftests: forwarding: no_forwarding: Down ports on cleanup
    84f17718a0b8 netfilter: nf_tables_ipv6: consider network offset in netdev/egress validation
    94ab317024ba ethtool: check device is present when getting link settings
    1a525d99dc93 wifi: iwlwifi: fw: fix wgds rev 3 exact size
    8e51088d9123 netfilter: nf_tables: restore IP sanity checks for netdev/egress
    99912d85fa89 iommu: Do not return 0 from map_pages if it doesn't do anything
    c8525821ecb1 Bluetooth: hci_core: Fix not handling hibernation actions
    662a55986b88 Bluetooth: btnxpuart: Fix random crash seen while removing driver
    9aa6e15c0108 Bluetooth: btnxpuart: Handle FW Download Abort scenario
    9d5df94ce0e2 Bluetooth: btnxpuart: Resolve TX timeout error in power save stress test
    7df36cceb934 dmaengine: dw: Add memory bus width verification
    e1b63d054ee0 dmaengine: dw: Add peripheral bus width verification
    24775bfdf435 phy: xilinx: phy-zynqmp: Fix SGMII linkup failure on resume
    ffd2e852dc54 dmaengine: dw-edma: Do not enable watermark interrupts for HDMA
    d3c9a2a6caa8 dmaengine: dw-edma: Fix unmasking STOP and ABORT interrupts for HDMA
    b47ff45c4a87 soundwire: stream: fix programming slave ports for non-continous port maps
    954e1893fe85 phy: fsl-imx8mq-usb: fix tuning parameter name
    b547cab1ebdb iommufd: Do not allow creating areas without READ or WRITE
    459584258d47 selinux,smack: don't bypass permissions check in inode_setsecctx hook
    05d2e16a9e3a Revert "change alloc_pages name in dma_map_ops to avoid name conflicts"
    288d398df80c cifs: Fix FALLOC_FL_PUNCH_HOLE support
    881aee27ce7d mm: Fix missing folio invalidation calls during truncation
    9de10f5b7ba9 ovl: ovl_parse_param_lowerdir: Add missed '\n' for pr_err
    dce7cbeaa10f ovl: fix wrong lowerdir number check for parameter Opt_lowerdir
    0e1c9709d70b ovl: pass string to ovl_parse_layer()
    c15123bbe379 pinctrl: starfive: jh7110: Correct the level trigger configuration of iev register
    2ebdb6e98705 pinctrl: mediatek: common-v2: Fix broken bias-disable for PULL_PU_PD_RSEL_TYPE
    805cb277fbc0 ASoC: SOF: amd: Fix for acp init sequence
    30464c3174e1 ASoC: amd: acp: fix module autoloading
    2dfbf8991e49 thermal: of: Fix OF node leak in of_thermal_zone_find() error paths
    31019a2ab4a0 thermal: of: Fix OF node leak in thermal_of_trips_init() error path
    0199a29ec6e9 of: Introduce for_each_*_child_of_node_scoped() to automate of_node_put() handling
    d967f6ae3149 usb: typec: fix up incorrectly backported "usb: typec: tcpm: unregister existing source caps before re-registration"
    4ed03758ddf0 tracing: Have format file honor EVENT_FILE_FL_FREED
    9a9716bbbf3d drm/vmwgfx: Fix prime with external buffers
    39defab0ebf0 drm/amdgpu/swsmu: always force a state reprogram on init
    11182b33faf3 drm/amdgpu: align pp_power_profile_mode with kernel docs
    09c423d6fcd5 selftests: mptcp: join: check re-re-adding ID 0 endp
    99c17b3be7e3 selftests: mptcp: join: no extra msg if no counter
    a81c87ac6080 selftests: mptcp: join: check removing ID 0 endpoint
    dc14d542e683 mptcp: pm: ADD_ADDR 0 is not a new address
    53e2173172d2 mptcp: pm: fix ID 0 endp usage after multiple re-creations
    78b04149868d mptcp: pm: do not remove already closed subflows
    edfbc14a4beb mptcp: pm: send ACK on an active subflow
    26e0f27405db mptcp: pm: reset MPC endp ID when re-added
    6d6c14563347 mptcp: pm: skip connecting to already established sf
    1448d9a34ce4 mptcp: pm: reuse ID 0 after delete and re-add
    9e40cd795900 mptcp: sched: check both backup in retrans
    255bc4fc4f6a mptcp: close subflow when receiving TCP+FIN
    c04cac9a59c4 net: mana: Fix race of mana_hwc_post_rx_wqe and new hwc response
    8e4084ed2bd6 wifi: mwifiex: duplicate static structs used in driver instances
    9d5e5908f063 wifi: wfx: repair open network AP mode
    cb739d3ce51c of: Add cleanup.h based auto release via __free(device_node) markings
    4ed45fe99ec9 pinctrl: single: fix potential NULL dereference in pcs_get_function()
    d80bdfaa48c1 pinctrl: rockchip: correct RK3328 iomux width flag for GPIO2-B pins
    a01859dd6aeb smb/client: avoid dereferencing rdata=NULL in smb2_new_read_req()
    44013260666f btrfs: run delayed iputs when flushing delalloc
    51722b99f41f btrfs: fix a use-after-free when hitting errors inside btrfs_submit_chunk()
    f6758eb7928e LoongArch: Remove the unused dma-direct.h
    b1922c3102f1 ALSA: seq: Skip event type filtering for UMP events
    c77dee530e77 Linux 6.6.48
    a2081b8cabbe tools: move alignment-related macros to new <linux/align.h>
    8f04edd554d1 Input: MT - limit max slots
    3d68d1076040 Revert "s390/dasd: Establish DMA alignment"
    b8d7b897e1e5 net: ngbe: Fix phy mode set to external phy
    118fd997612d ksmbd: fix race condition between destroy_previous_session() and smb2 operations()
    c6372cbd919b drm/amdgpu/vcn: not pause dpg for unified queue
    44bb8f18a63b drm/amdgpu/vcn: identify unified queue in sw init
    e0aeb26b04ec NFSD: simplify error paths in nfsd_svc()
    b12caa8f0888 selftests/bpf: Add a test to verify previous stacksafe() fix
    7cad3174cc79 bpf: Fix a kernel verifier crash in stacksafe()
    19b4397c4a15 mm/numa: no task_numa_fault() call if PTE is changed
    c789a78151c1 mm/numa: no task_numa_fault() call if PMD is changed
    bb121128fd58 ALSA: timer: Relax start tick time check for slave timer elements
    1f3b52c0fdc8 igc: Fix qbv tx latency by setting gtxoffset
    ad569ac6055f drm/panel: nt36523: Set 120Hz fps for xiaomi,elish panels
    ab7554fb515b drm/msm/mdss: specify cfg bandwidth for SDM670
    cc9006d00da4 hwmon: (ltc2992) Fix memory leak in ltc2992_parse_dt()
    f0974e6bc385 tcp: do not export tcp_twsk_purge()
    3d3a8654a53b platform/x86/intel/ifs: Call release_firmware() when handling errors.
    50fe8565a9be Revert "drm/amd/display: Validate hw_points_num before using it"
    8e1f64d44664 Revert "usb: gadget: uvc: cleanup request when not in correct state"
    ce2f28a549f1 selftests: mptcp: join: check re-using ID of closed subflow
    f845af67e79e selftests: mptcp: join: validate fullmesh endp on 1st sf
    9a9afbbc3fbf mptcp: pm: avoid possible UaF when selecting endp
    b762e1e301bd mptcp: pm: fullmesh: select the right ID later
    a7a692b79104 mptcp: pm: only in-kernel cannot have entries with ID 0
    9907af6a28a6 mptcp: pm: check add_addr_accept_max before accepting new ADD_ADDR
    d20bf2c96d7f mptcp: pm: only decrement add_addr_accepted for MPJ req
    43cf912b0b0f mptcp: pm: only mark 'subflow' endp as available
    01db51846874 mptcp: pm: remove mptcp_pm_remove_subflow()
    257d56fbfff9 mptcp: pm: re-using ID of unused flushed subflows
    7b64bdbfcf6f mptcp: pm: re-using ID of unused removed subflows
    cb24bdcdecba mptcp: pm: re-using ID of unused removed ADD_ADDR
    cc29c5546c6a nouveau/firmware: use dma non-coherent allocator
    d25fd6eb26a7 pmdomain: imx: wait SSAR when i.MX93 power domain on
    e6d49dd41e14 pmdomain: imx: scu-pd: Remove duplicated clocks
    7bbf8f8b8861 mmc: dw_mmc: allow biu and ciu clocks to defer
    c1b17191abc5 mmc: mtk-sd: receive cmd8 data when hs400 tuning fail
    9d7629bec5c3 KVM: arm64: Make ICC_*SGI*_EL1 undef in the absence of a vGICv3
    2d7cb80bfff3 cxgb4: add forgotten u64 ivlan cast before shift
    11343059daf8 Input: i8042 - use new forcenorestore quirk to replace old buggy quirk combination
    fdda14aba729 Input: i8042 - add forcenorestore quirk to leave controller untouched even on s3
    2b5f22ea55ca HID: wacom: Defer calculation of resolution until resolution_code is known
    ac5d3baf141a MIPS: Loongson64: Set timer mode in cpu-probe
    242665bd914a net: dsa: microchip: fix PTP config failure when using multiple ports
    50553ea7cbd3 drm/amdgpu: Validate TA binary size
    09982d418ac6 ksmbd: the buffer of smb2 query dir response has at least 1 byte
    76df3a1970dd scsi: core: Fix the return value of scsi_logical_block_count()
    064dd929c765 Bluetooth: MGMT: Add error handling to pair_device()
    0fa4b4aadb2b smb: client: ignore unhandled reparse tags
    cac2815f49d3 mmc: mmc_test: Fix NULL dereference on allocation failure
    88c232fd0629 drm/msm: fix the highest_bank_bit for sc7180
    aba75693331e drm/msm/mdss: Handle the reg bus ICC path
    707601fcf652 drm/msm/mdss: Rename path references to mdp_path
    9611899f42e3 drm/msm/mdss: switch mdss to use devm_of_icc_get()
    8b93b3e1589e drm/msm/dpu: take plane rotation into account for wide planes
    1af8f3db50c2 drm/msm/dpu: try multirect based on mdp clock limits
    a3c5815b07f4 drm/msm/dpu: cleanup FB if dpu_format_populate_layout fails
    6f3aea37aac4 drm/msm/dp: reset the link phy params before link training
    3fb61718bcbe drm/msm/dpu: move dpu_encoder's connector assignment to atomic_enable()
    8e7ef27e4e8f drm/msm/dpu: capture snapshot on the first commit_done timeout
    801f49c83bac drm/msm/dpu: split dpu_encoder_wait_for_event into two functions
    da7243e52264 drm/msm/dpu: drop MSM_ENC_VBLANK support
    e86721b0d02c drm/msm/dpu: use drmm-managed allocation for dpu_encoder_phys
    4a2798cc24ba drm/msm/dp: fix the max supported bpp logic
    69da87fb0dd4 drm/msm/dpu: don't play tricks with debug macros
    6be50c8991d7 net: ovs: fix ovs_drop_reasons error
    4bf322e5af8e net: xilinx: axienet: Fix dangling multicast addresses
    14ebcb4a67dc net: xilinx: axienet: Always disable promiscuous mode
    7a8c74df7c97 octeontx2-af: Fix CPT AF register offset calculation
    0279c35d242d netfilter: flowtable: validate vlan header
    fa4e6ae38574 bnxt_en: Fix double DMA unmapping for XDP_REDIRECT
    124b428fe280 ipv6: prevent possible UAF in ip6_xmit()
    6ab6bf731354 ipv6: fix possible UAF in ip6_finish_output2()
    af1dde074ee2 ipv6: prevent UAF in ip6_send_skb()
    cfa692e7e71b udp: fix receiving fraglist GSO packets
    577d6c061946 netem: fix return value if duplicate enqueue fails
    f7d8c2fabd39 net: dsa: mv88e6xxx: Fix out-of-bound access
    8ea80ff5d829 igb: cope with large MAX_SKB_FRAGS
    da7d3fddced7 dpaa2-switch: Fix error checking in dpaa2_switch_seed_bp()
    c864bf016692 ice: fix truesize operations for PAGE_SIZE >= 8192
    e9a1df12d530 ice: fix ICE_LAST_OFFSET formula
    5898525275b2 ice: fix page reuse when PAGE_SIZE is over 8k
    996ba2f0d755 bonding: fix xfrm state handling when clearing active slave
    4582d4ff413a bonding: fix xfrm real_dev null pointer dereference
    0707260a1831 bonding: fix null pointer deref in bond_ipsec_offload_ok
    f2b3d38d7986 bonding: fix bond_ipsec_offload_ok return type
    467ee0d4c567 ip6_tunnel: Fix broken GRO
    9a131a509935 netfilter: nft_counter: Synchronize nft_counter_reset() against reader.
    b1ac83483e8a netfilter: nft_counter: Disable BH in nft_counter_offload_stats().
    00425508f30b kcm: Serialise kcm_sendmsg() for the same socket.
    ed37ac430c70 net: mctp: test: Use correct skb for route input check
    99580ae890ec tcp: prevent concurrent execution of tcp_sk_exit_batch
    7348061662c7 tcp/dccp: do not care about families in inet_twsk_purge()
    9624febd6968 tcp/dccp: bypass empty buckets in inet_twsk_purge()
    03225025384d selftests: udpgro: report error when receive failed
    440efd86cda2 tc-testing: don't access non-existent variable on exception
    e83b49ecb569 net: mscc: ocelot: serialize access to the injection/extraction groups
    ff7f554bbd75 net: mscc: ocelot: fix QoS class for injected packets with "ocelot-8021q"
    dd17e1e68255 net: mscc: ocelot: use ocelot_xmit_get_vlan_info() also for FDMA and register injection
    4177f2b0a348 Bluetooth: SMP: Fix assumption of Central always being Initiator
    50ce49116477 Bluetooth: hci_core: Fix LE quote calculation
    9b707444bebc drm/amdkfd: reserve the BO before validating it
    15e3bbd83bf5 ALSA: hda/tas2781: Use correct endian conversion
    9dcb933a161e platform/surface: aggregator: Fix warning when controller is destroyed in probe
    114858d71382 drm/amd/amdgpu: command submission parser for JPEG
    a50a25dc0ce0 drm/amd/display: fix cursor offset on rotation 180
    6490f063d54b drm/amd/display: Enable otg synchronization logic for DCN321
    d15fc910b618 drm/amd/display: Adjust cursor position
    f0e8658790b1 btrfs: send: allow cloning non-aligned extent if it ends at i_size
    1bca9776ed27 btrfs: replace sb::s_blocksize by fs_info::sectorsize
    de7bad86345c mm/vmalloc: fix page mapping if vm_area_alloc_pages() with high order fallback to order 0
    983e6b2636f0 change alloc_pages name in dma_map_ops to avoid name conflicts
    f2ce57463dd3 selftests: memfd_secret: don't build memfd_secret test on unsupported arches
    7b0e822d6546 selftests/mm: log run_vmtests.sh results in TAP format
    b4426da8c17c tools/testing/selftests/mm/run_vmtests.sh: lower the ptrace permissions
    b77471c6760a mm: fix endless reclaim on machines with unaccepted memory
    00b395e95a01 dm suspend: return -ERESTARTSYS instead of -EINTR
    84557cd61182 riscv: entry: always initialize regs->a0 to -ENOSYS
    e84f4400bf8c i2c: stm32f7: Add atomic_xfer method to driver
    2ff51719ec61 jfs: define xtree root and page independently
    34ba4f29f3d9 gtp: pull network headers in gtp_dev_xmit()
    9c375a95669e nvme: fix namespace removal list
    6019283e1e35 EDAC/skx_common: Allow decoding of SGX addresses
    81bd4b07a4f3 ionic: check cmd_regs before copying in or out
    1ae3ff27c6f2 ionic: use pci_is_enabled not open code
    a855d1297985 hrtimer: Prevent queuing of hrtimer without a function callback
    3cc03d1dbdcf drm/amdgpu: fix dereference null return value for the function amdgpu_vm_pt_parent
    82f20194bf46 nvme: use srcu for iterating namespace list
    913c30f827e1 Revert "bpf, sockmap: Prevent lock inversion deadlock in map delete elem"
    1b2631dd54fb selftests/bpf: Fix a few tests for GCC related warnings.
    73c50bd10478 nvmet-rdma: fix possible bad dereference when freeing rsps
    e9c0aa6c3dfd ext4: set the type of max_zeroout to unsigned int to avoid overflow
    4ca547488de8 irqchip/gic-v3-its: Remove BUG_ON in its_vpe_irq_domain_alloc
    def4422ff0eb usb: dwc3: core: Skip setting event buffers for host only controllers
    c0076d2c8d45 platform/x86: lg-laptop: fix %s null argument warning
    14bd62d58018 clocksource: Make watchdog and suspend-timing multiplication overflow safe
    831420f210a3 irqchip/renesas-rzg2l: Do not set TIEN and TINT source at the same time
    d8d4da5c689d s390/iucv: fix receive buffer virtual vs physical address confusion
    7ad21517c397 openrisc: Call setup_memory() earlier in the init sequence
    fbc63fb16544 NFS: avoid infinite loop in pnfs_update_layout.
    4ff710fdf72f nvmet-tcp: do not continue for invalid icreq
    be285b8dd29b net: hns3: add checking for vf id of mailbox
    454ba1740cb5 rtc: nct3018y: fix possible NULL dereference
    664ad87c36c8 firmware: cirrus: cs_dsp: Initialize debugfs_root to invalid
    7ff15407c404 Bluetooth: bnep: Fix out-of-bound access
    5469f609be9f nvme: clear caller pointer on identify failure
    5419f3001e9e usb: gadget: fsl: Increase size of name buffer for endpoints
    428fb40bd951 f2fs: fix to do sanity check in update_sit_entry
    b9b019acfb72 btrfs: delete pointless BUG_ON check on quota root in btrfs_qgroup_account_extent()
    c7e0e8acc59a btrfs: change BUG_ON to assertion in tree_move_down()
    48256173f200 btrfs: send: handle unexpected inode in header process_recorded_refs()
    4eb8be942efc btrfs: send: handle unexpected data in header buffer in begin_cmd()
    46ca3ec9b8b1 btrfs: handle invalid root reference found in may_destroy_subvol()
    6be930556d28 btrfs: push errors up from add_async_extent()
    981a749cef8e btrfs: tests: allocate dummy fs_info and root in test_find_delalloc()
    f379c3f49e95 btrfs: change BUG_ON to assertion when checking for delayed_node root
    315471004b84 btrfs: defrag: change BUG_ON to assertion in btrfs_defrag_leaves()
    a7fec145b086 btrfs: delayed-inode: drop pointless BUG_ON in __btrfs_remove_delayed_item()
    97db7b598766 powerpc/boot: Only free if realloc() succeeds
    9c96b5b05648 powerpc/boot: Handle allocation failure in simple_realloc()
    881613a97540 f2fs: stop checkpoint when get a out-of-bounds segment
    23494bccd256 rxrpc: Don't pick values out of the wire header when setting up security
    cbdac8249fc9 parisc: Use irq_enter_rcu() to fix warning at kernel/context_tracking.c:367
    0f7acd8cefdb memory: stm32-fmc2-ebi: check regmap_read return value
    1a45994fb218 x86: Increase brk randomness entropy for 64-bit systems
    60563755c93c md: clean up invalid BUG_ON in md_ioctl
    9cf3b89b4f84 netlink: hold nlk->cb_mutex longer in __netlink_dump_start()
    0e07c0c84afe tick: Move got_idle_tick away from common flags
    6d4fbad0efbf clocksource/drivers/arm_global_timer: Guard against division by zero
    533893c2e033 accel/habanalabs: fix debugfs files permissions
    0b9f748da2ae virtiofs: forbid newlines in tags
    a48d12797eef hrtimer: Select housekeeping CPU during migration
    53b2f3539958 gpio: sysfs: extend the critical section for unregistering sysfs devices
    932490268c44 drm/lima: set gp bus_stop bit before hard reset
    aeecb08b6420 net/sun3_82586: Avoid reading past buffer in debug output
    6d3ff0437e1a wifi: iwlwifi: mvm: avoid garbage iPN
    2f50c1ea7fde media: drivers/media/dvb-core: copy user arrays safely
    12b5b959080a scsi: lpfc: Initialize status local variable in lpfc_sli4_repost_sgl_list()
    342352caf06f fs: binfmt_elf_efpic: don't use missing interpreter's properties
    b1397fb4a779 media: pci: cx23885: check cx23885_vdev_init() return
    1fb112cefadb kernfs: fix false-positive WARN(nr_mmapped) in kernfs_drain_open_files
    d5a9588cc389 riscv: blacklist assembly symbols for kprobe
    18b9264a1389 quota: Remove BUG_ON from dqget()
    30bbdff9e19d wifi: ath12k: Add missing qmi_txn_cancel() calls
    535e9bd0e8f8 fuse: fix UAF in rcu pathwalks
    e968edf6ecba afs: fix __afs_break_callback() / afs_drop_open_mmap() race
    56a1bf2b8357 btrfs: zlib: fix and simplify the inline extent decompression
    0a56dcce6b82 ext4: do not trim the group with corrupted block bitmap
    5b7766ab913b nvmet-trace: avoid dereferencing pointer too early
    9b139b16b58e EDAC/skx_common: Filter out the invalid address
    73567149beaf gfs2: Refcounting fix in gfs2_thaw_super
    3cde81f8ad3e Bluetooth: hci_conn: Check non NULL function before calling for HFP offload
    7a3e7f1ed601 evm: don't copy up 'security.evm' xattr
    e9c902dd3695 drm/rockchip: vop2: clear afbc en and transform bit for cluster window at linear mode
    9324cbc465a6 ionic: no fw read when PCI reset failed
    b41d5ce6b210 ionic: prevent pci disable of already disabled device
    fb768e05712d powerpc/pseries/papr-sysparm: Validate buffer object lengths
    cbd7ab7d7ef7 hwmon: (pc87360) Bounds check data->innr usage
    61db7910e8c2 ASoC: SOF: ipc4: check return value of snd_sof_ipc_msg_data
    9badede60704 powerpc/xics: Check return value of kasprintf in icp_native_map_one_cpu
    dff1afeaeaf6 memory: tegra: Skip SID programming if SID registers aren't set
    9064a70eee97 drm/msm: Reduce fallout of fence signaling vs reclaim hangs
    edb39f621bad block: Fix lockdep warning in blk_mq_mark_tag_wait
    c58f7770456b arm64: Fix KASAN random tag seed initialization
    855538373007 powerpc/topology: Check if a core is online
    f17c3a37b22a cpu/SMT: Enable SMT only if a core is online
    881eb2fae123 rust: fix the default format for CONFIG_{RUSTC,BINDGEN}_VERSION_TEXT
    b4dad0cab687 rust: suppress error messages from CONFIG_{RUSTC,BINDGEN}_VERSION_TEXT
    34e1335905f2 rust: work around `bindgen` 0.69.0 issue
    7d805d925529 hwmon: (ltc2992) Avoid division by zero
    67288cbb7ac2 IB/hfi1: Fix potential deadlock on &irq_src_lock and &dd->uctxt_lock
    c357e4cf5830 clk: visconti: Add bounds-checking coverage for struct visconti_pll_provider
    30819471054a wifi: iwlwifi: check for kmemdup() return value in iwl_parse_tlv_firmware()
    0a1a3c11fc33 wifi: iwlwifi: fw: Fix debugfs command sending
    1cbdaf141a5d wifi: iwlwifi: abort scan when rfkill on but device enabled
    355aec2ed84d gfs2: setattr_chown: Add missing initialization
    1a327862eb13 wifi: mac80211: flush STA queues on unauthorization
    e9f610050369 scsi: spi: Fix sshdr use
    3b2f36068c28 ASoC: SOF: Intel: hda-dsp: Make sure that no irq handler is pending before suspend
    66ddb97699b2 iommu/arm-smmu-qcom: Add SDM670 MDSS compatible
    9649d26dc9ad media: qcom: venus: fix incorrect return value
    abbba0768c8c drm/tegra: Zero-initialize iosys_map
    5ee7df8143c1 binfmt_misc: cleanup on filesystem umount
    ebf6f517d3f3 md/raid5-cache: use READ_ONCE/WRITE_ONCE for 'conf->log'
    03be3489b165 accel/habanalabs: fix bug in timestamp interrupt handling
    db5ba2c1ed16 accel/habanalabs: export dma-buf only if size/offset multiples of PAGE_SIZE
    fa8cb3102fe4 accel/habanalabs/gaudi2: unsecure tpc count registers
    e6571cff84da media: s5p-mfc: Fix potential deadlock on condlock
    14dde93c3136 platform/x86/intel/ifs: Validate image size
    8464e99e3808 staging: ks7010: disable bh on tx_dev_lock
    a8b30d53a1e9 drm/amd/display: Validate hw_points_num before using it
    1b60d354a4de usb: gadget: uvc: cleanup request when not in correct state
    d2defcddfe90 wifi: mt76: fix race condition related to checking tx queue fill status
    b87691d733cf staging: iio: resolver: ad2s1210: fix use before initialization
    84d617388059 wifi: ath11k: fix ath11k_mac_op_remain_on_channel() stack usage
    55e9057c8a95 media: radio-isa: use dev_name to fill in bus_info
    14fafdfdadf9 drm/amdkfd: Move dma unmapping after TLB flush
    7620f9c3bdc5 i3c: mipi-i3c-hci: Do not unmap region not mapped for transfer
    6c85c7c9a8cd i3c: mipi-i3c-hci: Remove BUG() when Ring Abort request times out
    98ed3f40f22d wifi: ath12k: fix WARN_ON during ath12k_mac_update_vif_chan
    10b1f8525415 drm/bridge: tc358768: Attempt to fix DSI horizontal timings
    8653d7bddf81 s390/smp,mcck: fix early IPI handling
    0b9c00d9fae7 RDMA/rtrs: Fix the problem of variable not initialized fully
    75a92689e36b i2c: riic: avoid potential division by zero
    a2225b7af5d6 cgroup: Avoid extra dereference in css_populate_dir()
    a4dc7424561c wifi: cw1200: Avoid processing an invalid TIM IE
    97f381703914 sched/topology: Handle NUMA_NO_NODE in sched_numa_find_nth_cpu()
    7ede6ef04c9f net: ethernet: mtk_wed: check update_wo_rx_stats in mtk_wed_update_rx_stats()
    81ba4dd37a28 rcu: Eliminate rcu_gp_slow_unregister() false positive
    e160de344f52 rcu: Dump memory object info if callback function is invalid
    4a2f09460141 mm: Remove kmem_valid_obj()
    ee6669b463ca wifi: iwlwifi: mvm: fix recovery flow in CSA
    86f22e7cce02 wifi: mac80211: fix BA session teardown race
    268f84a82753 wifi: cfg80211: check wiphy mutex is held for wdev mutex
    f34056c3050e wifi: mac80211: lock wiphy in IP address notifier
    5a002f41ebff ASoC: cs35l45: Checks index of cs35l45_irqs[]
    8574cdabb526 ssb: Fix division by zero issue in ssb_calc_clock_rate
    ec71cc24b0d4 drm/amdgpu: access RLC_SPM_MC_CNTL through MMIO in SRIOV runtime
    695f692bcd72 drm/amd/amdgpu/imu_v11_0: Increase buffer size to ensure all possible values can be stored
    51e4630ef0d1 drm/amd/pm: fix error flow in sensor fetching
    c3254bc09f46 ALSA: hda/realtek: Fix noise from speakers on Lenovo IdeaPad 3 15IAU7
    a8544dec14a7 gpio: mlxbf3: Support shutdown() function
    fa1d4de7265c net: hns3: fix a deadlock problem when config TC during resetting
    1d2f4a731613 net: hns3: use the user's cfg after reset
    a6c0178c81a1 net: hns3: fix wrong use of semaphore up
    d4b8c4bb7714 selftests: net: lib: kill PIDs before del netns
    fc9cae2199b8 selftests: net: lib: ignore possible errors
    921f1acf0c3c vsock: fix recursive ->recvmsg calls
    f123293db16d netfilter: nf_tables: Add locking for NFT_MSG_GETOBJ_RESET requests
    4340de3e659c netfilter: nf_tables: Introduce nf_tables_getobj_single
    cf4ebf779739 netfilter: nf_tables: Carry reset boolean in nft_obj_dump_ctx
    f3b7dc8b6c9a netfilter: nf_tables: nft_obj_filter fits into cb->ctx
    959c9bf85fe2 netfilter: nf_tables: Carry s_idx in nft_obj_dump_ctx
    2c6a79b94e39 netfilter: nf_tables: A better name for nft_obj_filter
    ba9b99d909e1 netfilter: nf_tables: Unconditionally allocate nft_obj_filter
    83d37714c151 netfilter: nf_tables: Drop pointless memset in nf_tables_dump_obj
    bb6231e53361 netfilter: nf_tables: Audit log dump reset after the fact
    74e6eb7fd27e netfilter: nf_queue: drop packets with cloned unconfirmed conntracks
    c7b760499f77 netfilter: flowtable: initialise extack before use
    7b825f91a071 netfilter: allow ipv6 fragments to arrive on different devices
    227355ad4e4a tcp: Update window clamping condition
    ff8292bb10ec mptcp: correct MPTCP_SUBFLOW_ATTR_SSN_OFFSET reserved size
    c920ab13d713 mlxbf_gige: disable RX filters until RX path initialized
    326a89321f9d net: ethernet: mtk_wed: fix use-after-free panic in mtk_wed_setup_tc_block_cb()
    b3917d8a4e01 net: dsa: vsc73xx: check busy flag in MDIO operations
    cec515531e4f net: dsa: vsc73xx: use read_poll_timeout instead delay loop
    e077f5192811 net: dsa: vsc73xx: pass value in phy_write operation
    948ee178f46e net: axienet: Fix register defines comment description
    ef23c18ab88e atm: idt77252: prevent use after free in dequeue_rx()
    6c88d53bcf8e net/mlx5e: Correctly report errors for ethtool rx flows
    b3b9a87adee9 net/mlx5e: Take state lock during tx timeout reporter
    920dff7f4369 igc: Fix reset adapter logics when tx mode change
    01ad5058b826 igc: Fix qbv_config_change_errors logics
    3fa593db4592 igc: Fix packet still tx after gate close by reducing i226 MAC retry buffer
    944f2d4db9ce bpf: Fix updating attached freplace prog in prog_array map
    730f7a5e44d8 s390/uv: Panic for set and remove shared access UVC errors
    09717678737b drm/amdgpu/jpeg4: properly set atomics vmid field
    0e93fa4027cf drm/amdgpu/jpeg2: properly set atomics vmid field
    f1aa7c509aa7 memcg_write_event_control(): fix a user-triggerable oops
    2685a2b9e55d drm/amdgpu: Actually check flags for all context ops.
    d3ba98ce5c18 btrfs: tree-checker: add dev extent item checks
    9baca56eb073 btrfs: zoned: properly take lock to read/update block group's zoned variables
    251508b933f6 btrfs: tree-checker: reject BTRFS_FT_UNKNOWN dir type
    f7668d033940 mm/memory-failure: use raw_spinlock_t in struct memory_failure_cpu
    5295951b53bd selinux: add the processing of the failure of avc_add_xperms_decision()
    01a6b34b602a selinux: fix potential counting error in avc_add_xperms_decision()
    dfaa39b05a6c fs/netfs/fscache_cookie: add missing "n_accesses" check
    4291f94f8c6b wifi: brcmfmac: cfg80211: Handle SSID based pmksa deletion
    221cf8321757 net: mana: Fix doorbell out of order violation and avoid unnecessary doorbell rings
    65f20b174ec0 net: mana: Fix RX buf alloc_size alignment and atomic op panic
    753f1745146e rtla/osnoise: Prevent NULL dereference in error handling
    67d1d8cc5904 i2c: qcom-geni: Add missing geni_icc_disable in geni_i2c_runtime_resume
    dd72ae8b0fce fix bitmap corruption on close_range() with CLOSE_RANGE_UNSHARE
    97a532c3ac4f bitmap: introduce generic optimized bitmap_size()
    ef725854f898 btrfs: rename bitmap_set_bits() -> btrfs_bitmap_set_bits()
    9805a8811781 s390/cio: rename bitmap_size() -> idset_bitmap_size()
    706cc80260d3 fs/ntfs3: add prefix to bitmap_size() and use BITS_TO_U64()
    b9bda5f6012d vfs: Don't evict inode under the inode lru traversing context
    a6bba25f15e7 dm persistent data: fix memory allocation failure
    00df2f486838 dm resume: don't return EINVAL when signalled
    0237b5517ccb arm64: ACPI: NUMA: initialize all values of acpi_early_node_map to NUMA_NO_NODE
    d2c7680250ef ACPI: EC: Evaluate _REG outside the EC scope more carefully
    03fd525dfefe ACPICA: Add a depth argument to acpi_execute_reg_methods()
    6861faf4232e i2c: tegra: Do not mark ACPI devices as irq safe
    36ebafda35f8 riscv: change XIP's kernel_map.size to be size of the entire kernel
    051c0a558154 KVM: s390: fix validity interception issue when gisa is switched off
    93a7e2856951 s390/dasd: fix error recovery leading to data corruption on ESE devices
    31ba13202c74 ALSA: hda/tas2781: fix wrong calibrated data order
    18b3ad2a3cc8 thunderbolt: Mark XDomain as unplugged when router is removed
    6b99de301d78 xhci: Fix Panther point NULL pointer deref at full-speed re-enumeration
    9dd9078485eb ALSA: usb-audio: Support Yamaha P-125 quirk entry
    82d06b816332 ALSA: usb-audio: Add delay quirk for VIVO USB-C-XE710 HEADSET
    5cff754692ad char: xillybus: Check USB endpoints when probing device
    435fc9cae23d char: xillybus: Refine workqueue handling
    a7ad105b1225 char: xillybus: Don't destroy workqueue from work item running on it
    ac42e0f0eb66 fuse: Initialize beyond-EOF page contents before setting uptodate
    61eb7aae8b16 selinux: revert our use of vma_is_initial_heap()
    c2a3b181f08f Revert "usb: typec: tcpm: clear pd_event queue in PORT_RESET"
    ea13bd807f1c Revert "misc: fastrpc: Restrict untrusted app to attach to privileged PD"
    7adc8a3d5da8 Revert "ACPI: EC: Evaluate orphan _REG under EC device"
    63e80efa6341 tty: atmel_serial: use the correct RTS flag.
    8eb92cfca6c2 tty: serial: fsl_lpuart: mark last busy before uart_add_one_port
    18abb2787b53 x86/syscall: Mark exit[_group] syscall handlers __noreturn
    2879d995e569 pnmtologo: sync with 6.6
    43ea1c5e6eb3 lib/build_OID_registry: take -stable reproducibility changes
    35046aea43c8 bpftool: Fix undefined bpf macro for unix socket
    9a558d4b8621 tools/resolve_btfids: Fix comparison of distinct pointer types warning in resolve_btfids
    42b2eec2e503 bpftool: Query only cgroup-related attach types
    f71bb11887ba cpu/amd: inhibit SMP check for qemux86
    c31365597a17 powerpc/uaccess: Fix build errors seen with GCC 13/14
    64ebf485c56b usb: dwc3: core: remove lock of otg mode during gadget suspend/resume to avoid deadlock
    7c76aad68f6d kselftest: Add a ksft_perror() helper
    06644f0d7193 drm/tilcdc: Set preferred depth
    ff7ae7b32324 crypto: jitter - add RCT/APT support for different OSRs
    50cd24ddb6f0 arm64: defconfig: remove CONFIG_IPQ_APSS_5018
    58e5c91d6701 x86/alternatives: Disable interrupts and sync when optimizing NOPs in place
    c878fd2d4c79 x86/alternatives: Sync core before enabling interrupts
    c2d64b9f52b6 qemux86: add configuration symbol to select values
    630c33229e6d sched/isolation: really align nohz_full with rcu_nocbs
    0e5e0f68e2e6 clear_warn_once: add a clear_warn_once= boot parameter
    46934791b902 clear_warn_once: bind a timer to written reset value
    cdee9e38ff32 clear_warn_once: expand debugfs to include read support
    82b562b81841 tools: Remove some options from CLANG_CROSS_FLAGS
    36dc380b776b libbpf: Fix build warning on ref_ctr_off
    9e3e1fe20982 perf: perf can not parser the backtrace of app in the 32bit system and 64bit kernel.
    e497a4a5da65 perf: x86-32: explicitly include <errno.h>
    7b57ddd89565 perf: mips64: Convert __u64 to unsigned long long
    1cfc19423dc7 perf: fix bench numa compilation
    98bc2815fade perf: add SLANG_INC for slang.h
    17209a70b9b3 perf: add sgidefs.h to for mips builds
    9cd4258d910a perf: change --root to --prefix for python install
    8110a4f26628 perf: add 'libperl not found' warning
    bc89d5e08f77 perf: force include of <stdbool.h>
    4f6c760cc876 fat: Replace prandom_u32() with get_random_u32()
    bc53117b12b2 fat: don't use obsolete random32 call in namei_vfat
    30b2236ab378 FAT: Added FAT_NO_83NAME
    cef98d22b4ed FAT: Add CONFIG_VFAT_NO_CREATE_WITH_LONGNAMES option
    0bbd7daba9e1 FAT: Add CONFIG_VFAT_FS_NO_DUALNAMES option
    5883fc340084 aufs6: adapt to v6.6 i_op->ctime changes
    c4342d979bf2 aufs6: fix magic.mk include path
    35266bc2dc81 aufs6: adapt to v6.6
    8edede4e98be aufs6: core
    712248233ebe aufs6: standalone
    3b71a8a848d8 aufs6: mmap
    3e2924871f37 aufs6: base
    7f4907a93101 aufs6: kbuild
    d2f7b03e4aa7 yaffs2: update VFS ctime operations to 6.6+
    bcd6cfcd1aa0 yaffs2: v6.5 fixups
    cc615704b5f5 yaffs2: Fix miscalculation of devname buffer length
    8ef2e22dcf91 yaffs2: convert user_namespace to mnt_idmap
    c9c749f9f7d3 yaffs2: replace bdevname call with sprintf
    395b01cdc39d yaffs2: convert read_page -> readfolio
    d98b07e43ba6 yaffs: replace IS_ERR with IS_ERR_OR_NULL to check both ERR and NULL
    613c6d50fdbe yaffs: fix -Wstringop-overread compile warning in yaffs_fix_null_name
    622c4648936f yaffs2: v5.12+ build fixups (not runtime tested)
    7562133d4090 yaffs: include blkdev.h
    dbd44252cd59 yaffs: fix misplaced variable declaration
    c223a10b1ac0 yaffs2: v5.6 build fixups
    90f6007cfbf4 yaffs2: fix memory leak when /proc/yaffs is read
    37ee169c5ea1 yaffs: add strict check when call yaffs_internal_read_super
    b6e007b8abb6 yaffs: repair yaffs_get_mtd_device
    fb98f65a466a yaffs: Fix build failure by handling inode i_version with proper atomic API
    51e0aac75ea2 yaffs2: fix memory leak in mount/umount
    2b74a0cae7b0 yaffs: Avoid setting any ACL releated xattr
    ff4130a9c376 Yaffs:check oob size before auto selecting Yaffs1
    ba95b409c67c fs: yaffs2: replace CURRENT_TIME by other appropriate apis
    8fa35eba9056 yaffs2: adjust to proper location of MS_RDONLY
    1eb5deaad8c4 yaffs2: import git revision b4ce1bb (jan, 2020)
    4dce67c1e8c8 initramfs: allow an optional wrapper script around initramfs generation
    2f603d83fcc4 pnmtologo: use relocatable file name
    664a6a0a484b tools: use basename to identify file in gen-mach-types
    9de64bc0c185 lib/build_OID_registry: fix reproducibility issues
    ae9b80797295 vt/conmakehash: improve reproducibility
    a972323151bd iwlwifi: select MAC80211_LEDS conditionally
    15d2adcc0198 net/dccp: make it depend on CONFIG_BROKEN (CVE-2020-16119)
    5556a6c04b19 arm64/perf: Fix wrong cast that may cause wrong truncation
    5552dc768ffc defconfigs: drop obselete options
    00fe4152df31 arm64/perf: fix backtrace for AAPCS with FP enabled
    3888d0652edf linux-yocto: Handle /bin/awk issues
    3d55d299f23a uvesafb: provide option to specify timeout for task completion
    23c068c080be uvesafb: print error message when task timeout occurs
    edbfc939266e compiler.h: Undef before redefining __attribute_const__
    c99ae7e2a19a vmware: include jiffies.h
    572d84d928c8 Resolve jiffies wrapping about arp
    fdcd47cac843 nfs: Allow default io size to be configured.
    927d48801098 check console device file on fs when booting
    57cc27f821dd mount_root: clarify error messages for when no rootfs found
    1b53d82a8152 mconf: fix output of cflags and libraries
    1811da09f42c menuconfig,mconf-cfg: Allow specification of ncurses location
    83c2e0c6eb1f modpost: mask trivial warnings
    6de673039484 kbuild: exclude meta directory from distclean processing
    6decd32815f5 powerpc: serialize image targets
    f6b683b38318 arm: serialize build targets
    e798b09ebf57 mtd_blkdevs: add mtd_table_mutex lock back to blktrans_{open, release} to avoid race condition
    dc8a1e5a88f8 x86_64_defconfig: Fix warnings
    68491e5f72b6 powerpc/ptrace: Disable array-bounds warning with gcc8
    d71ebfce3004 powerpc: Disable attribute-alias warnings from gcc8
    62f50884b8b1 powerpc: kexec fix for powerpc64
    da6871c62c37 powerpc: Add unwind information for SPE registers of E500 core
    f161c880c11d mips: make current_cpu_data preempt safe
    5e94a8247ce7 mips: vdso: fix 'jalr $t9' crash in vdso code
    19e36714b1c7 mips: Kconfig: add QEMUMIPS64 option
    e2e537db3cbd 4kc cache tlb hazard: tlbp cache coherency
    aee9870611e5 malta uhci quirks: make allowance for slow 4k(e)c
    881948cd1517 drm/fb-helper: move zeroing code to drm_fb_helper_fill_var
    98ec1963fcb7 arm64: defconfig: cleanup config options
    f1727c537ba8 vexpress: Pass LOADADDR to Makefile
    4474c32dc24a arm: ARM EABI socketcall
    75e31a2b70fd ARM: LPAE: Invalidate the TLB for module addresses during translation fault

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4dbd9650040a5e9b839b4d508953a05d008a0bcc)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index a4c88e110a..9463f4d567 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "79a2910d1ba0b443f6aae76c61772386104db498"
-SRCREV_meta ?= "694e046ff4449d031f51c2e85f5dff035f5fa9e9"
+SRCREV_machine ?= "0f1484ece355a9a9c3f5f45178cf6dadbf08c923"
+SRCREV_meta ?= "3cc947053b7450290cae875946754959171687da"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.47"
+LINUX_VERSION ?= "6.6.49"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index eaf112bc37..ac1f1755fe 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.47"
+LINUX_VERSION ?= "6.6.49"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9cbc9350eaaecef6885b292082c8e9e93346dcac"
-SRCREV_meta ?= "694e046ff4449d031f51c2e85f5dff035f5fa9e9"
+SRCREV_machine ?= "06e8675c342253e9aaf9c7b7ebf2f4493dc6f247"
+SRCREV_meta ?= "3cc947053b7450290cae875946754959171687da"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 2169b9e691..68f0fcd087 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "a4093f33d7dd2dd59f18a5c76d6e5120e3ca93b6"
-SRCREV_machine:qemuarm64 ?= "9cbc9350eaaecef6885b292082c8e9e93346dcac"
-SRCREV_machine:qemuloongarch64 ?= "9cbc9350eaaecef6885b292082c8e9e93346dcac"
-SRCREV_machine:qemumips ?= "1c6aa9d8841224583571fd1deb8d3139f6516c36"
-SRCREV_machine:qemuppc ?= "9cbc9350eaaecef6885b292082c8e9e93346dcac"
-SRCREV_machine:qemuriscv64 ?= "9cbc9350eaaecef6885b292082c8e9e93346dcac"
-SRCREV_machine:qemuriscv32 ?= "9cbc9350eaaecef6885b292082c8e9e93346dcac"
-SRCREV_machine:qemux86 ?= "9cbc9350eaaecef6885b292082c8e9e93346dcac"
-SRCREV_machine:qemux86-64 ?= "9cbc9350eaaecef6885b292082c8e9e93346dcac"
-SRCREV_machine:qemumips64 ?= "2f8fc2e37239be95fe47410e50aae4c3dc0e1409"
-SRCREV_machine ?= "9cbc9350eaaecef6885b292082c8e9e93346dcac"
-SRCREV_meta ?= "694e046ff4449d031f51c2e85f5dff035f5fa9e9"
+SRCREV_machine:qemuarm ?= "7393c01d34b5c539f34e340024daa4bace20f5bd"
+SRCREV_machine:qemuarm64 ?= "06e8675c342253e9aaf9c7b7ebf2f4493dc6f247"
+SRCREV_machine:qemuloongarch64 ?= "06e8675c342253e9aaf9c7b7ebf2f4493dc6f247"
+SRCREV_machine:qemumips ?= "7bfe885f1a43718ff5a3c5be2f0c0f5b173910c1"
+SRCREV_machine:qemuppc ?= "06e8675c342253e9aaf9c7b7ebf2f4493dc6f247"
+SRCREV_machine:qemuriscv64 ?= "06e8675c342253e9aaf9c7b7ebf2f4493dc6f247"
+SRCREV_machine:qemuriscv32 ?= "06e8675c342253e9aaf9c7b7ebf2f4493dc6f247"
+SRCREV_machine:qemux86 ?= "06e8675c342253e9aaf9c7b7ebf2f4493dc6f247"
+SRCREV_machine:qemux86-64 ?= "06e8675c342253e9aaf9c7b7ebf2f4493dc6f247"
+SRCREV_machine:qemumips64 ?= "8f47e7c0df83299b256c09441385236693402c71"
+SRCREV_machine ?= "06e8675c342253e9aaf9c7b7ebf2f4493dc6f247"
+SRCREV_meta ?= "3cc947053b7450290cae875946754959171687da"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "4c1a2d4cd9a5b6c55739a80c5b9efbca322adad7"
+SRCREV_machine:class-devupstream ?= "df1a7cc5e00ffb5d330f10483a4d5974f5941d78"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.47"
+LINUX_VERSION ?= "6.6.49"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.34.1


