Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3756.1793405771796686779
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=bQpG6C1m;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso13602115e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405770; x=1794010570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1WOaILNBuHJozcCg4aPVOyId3yNqlkXiw+42viHTeOM=;
        b=bQpG6C1mk9I/wTJLyyiSzcnFhvqy6Pxwzujo38gYUR8B56bDbTMnEM9RDW2eecvL5Y
         pLM23T369+98OezKmzBc+oMJkbq7CAUhRqWvR3m68Wdr9nHY9nqlgXhZuhFFvLwvkz3C
         k6Lv3AWBKZeSoQ7u3LCys2Kzsy9oofiDmtHf+QE8PC+xJ0ikwXXi0AkIPEhW5Jj+1cAJ
         9pkaBsdPWnScNvdgqCKjKQhHl771kw1X+CJ8P2TJ3C5bxipDflkzPF29jKyDrOcu6lX9
         MagU01+/GNGstVtFACj+zPIcgn93b9zHpjmkORqrhMD82T0PF2oZh7v0LoYPkJOfrr0A
         9WWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405770; x=1794010570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1WOaILNBuHJozcCg4aPVOyId3yNqlkXiw+42viHTeOM=;
        b=R8jeR870XK5QoXnk+avchLLHnsPeLgZsA44xTZECxIhzJ8h5Mw25BF20QvuKMUYoPY
         LwzVP+1KVjOXuJPRAbcPbzx2n63CjP08poay7aF5WcmMaZvkFVhabqoIpCsQJNX9SoA4
         RNlkJob3n3N/DoPSEiPSio9R5m7g7NsYckz5V44z4mr6UlGlYfeu9og5ZXEIYoylcOn9
         Gjy4+1CtJwiATRRehZOsEyUHHc7FItyBIQn7ENrV7B5OwQfPiAA4qrdWUXdxu3LjmKer
         Tjo/fzsAvfAvb1ZSEm3v7+xW3cT0Wt88d0ZDqn9f9R4Ihf7sJ95fHSq/k7nEw1OW4kTC
         0PAA==
X-Gm-Message-State: AFq9FYIdLzc5J5MdTaAnbxxHDnonLHlawywCgoh1kP07WtUC5sB7CRvd
	rCT7DtQB7gYl8Ol12a9fv82IdbdO18GNR9IcfXYNHndjGLoPXbJuSPEGSpENGgqE+orCF0UQoeo
	0sQdORT8=
X-Gm-Gg: AYBFou2u6TBYQkzxFzB7lpgzdc9WL6kPxDeaIHa6aEf64RebX3ZxyAuVlj0e3GD3Xzp
	FZJr1T3sytKks26x8PMBI69brqqLf8zzcVf6f6o/H8FIChUIvzJuqIUvHAb71TtvIOXTANGB7Jx
	g41tsL/R5DqB35qPqcnLRhGZyZjqTGiB6aiYNCEjHDh0rDxSmq3GoGsj+6ANSY3/z3AmYhPXH1X
	KnnQKiD10ghwsG030ax4f4avsQMuzh+0sOEBg93/kn0rLFOlZJzY08gmkbi3uxa3cOI/YDWiBBq
	rUnocRlPHvL7ROvzpXHTpK/SUQBj6zgdK0x8uJAVFXIxG8Lng7WhuujXOKYvAKpmFHitjGRnjw5
	pJArR5asiFmRA/9xTTpFz6ItYh4fixme4YZyuPlvfAl6CZHPRqJ2BRWO5FQa9v22x3iOIRCFEaG
	C15z2Y+wVZSv54l6qmsdkOs/diV5bNiVAVJCXACXdh23IFy441P6aXJHmB3G8EzA2ZR6C/laK9o
	CNIcxHxpQ806/tK5/nXvm4VcQBtGIsqOwHPDXNz3GXiZ92knGtorjMA14MzgeEpvM+QnIwIwpCg
	iEeECjRh5kTObQV2qCV1Hbq1S7quTjlKg88vIdO0iqWPZyul28vsz4PIJhPilqjAx/jcIaXznCU
	6wGAet1fX/VnmA2sZVIrWR5ATFTC9
X-Received: by 2002:a05:600c:8706:b0:4a1:e0d5:293e with SMTP id 5b1f17b1804b1-4ac1765d3ddmr94015605e9.21.1793405768550;
        Fri, 30 Oct 2026 17:16:08 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.16.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:16:07 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 43/55] linux-yocto/6.6: update to v6.6.159
Date: Sat, 31 Oct 2026 01:15:04 +0100
Message-ID: <2cda6e8e07e5a698a94cf004355470882dfccb59.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249119
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    cecd39af8a1ab Linux 6.6.159
    742f73df544e0 ipv4: free inet_opt and ireq_opt after an RCU grace period
    a65f69e0f38ff ipv4: validate checksum_start before completing checksum
    33aa3b7f4afbd netfilter: nfnetlink_queue: unbreak SCTP traffic
    a91a6aa9253c6 Linux 6.6.158
    81e82340170ae net: mediatek: Fix potential NULL pointer dereference in dummy net_device handling
    3c83e90204359 crypto: atmel-ecc - avoid stale fallback key after set_secret failure
    6989f298103f5 netfilter: nf_tables: don't queue packet path object notifications
    f268099fc0e38 netfilter: nf_tables: place base_seq in struct net
    7b74a4f71ca50 netfilter: nft_set_rbtree: Remove unused variable nft_net
    bd33cb19bcb43 crypto: virtio - bound the akcipher result length
    ca84bef594538 crypto: virtio - Drop superfluous [as]kcipher_req pointer
    895ab908ade68 crypto: virtio - Drop superfluous [as]kcipher_ctx pointer
    ba7b5b5e35407 crypto: virtio - Drop sign/verify operations
    9efc6119bfbe1 crypto: virtio - Less function calls in __virtio_crypto_akcipher_do_req() after error detection
    b38d7a4bc9c17 vlan: fix skb_under_panic and races when toggling HW VLAN offload
    7eca6b809c1d4 vlan: defer real device state propagation to netdev_work
    debf9f50140b3 net/packet: defer vmalloc TX_RING free until skbs finish
    b4ac2a5ce5a96 gtp: serialize PDP context updates
    301f4a3303b21 usb: xhci: bail out of setup if the controller is inaccessible
    9e85ecc77ffa0 usb: xhci: simplify handling of Structural Parameters 1 values
    608efac1ba6fb usb: xhci: use cached HCSPARAMS1 value
    aa709b4f370e0 usb: xhci: implement USB Port Register Set struct
    4687b927c6ab5 usb: xhci: add USB Port Register Set struct
    c02a85ecd92db usb: xhci: add helper to read PORTSC register
    ade5ca589d2f5 usb: xhci: add tracing for PORTSC register writes
    1c3f4b15eb185 ALSA: hda: Fix missing pointer check in hda_component_manager_init function
    73853208a497a drm/amdgpu/atom: Check kcalloc() for WS buffer in amdgpu_atom_execute_table_locked()
    6b38ca1c9dd47 lan78xx: Enable Auto Speed and Auto Duplex configuration for LAN7801 if NO EEPROM is detected
    0c5b7a12e1751 lan78xx: Enable 125 MHz CLK configuration for LAN7801 if NO EEPROM is detected
    b4a3e1bb94091 tools/thermal/tmon: Fix compilation warning for wrong format
    cc91c461cf390 nvme-fabrics: use reserved tag for reg read/write command
    a99d4f0c43eaa perf test: Change all remaining #!/bin/sh to #!/bin/bash
    fb05e973698f4 drm/mediatek: Fix potential NULL dereference in mtk_crtc_destroy()
    e2379b2e343e3 drm/amd/display: Validate function returns
    336bc3461b1c7 drm/amd/display: Check null pointers before using them
    15403445b873a drm/amd/display: Ensure array index tg_inst won't be -1
    3218df42ff3b1 drm/amd/display: Add a dc_state NULL check in dc_state_release
    9a38ba5561d96 wifi: ath12k: check M3 buffer size as well whey trying to reuse it
    7e323cb557053 wifi: ath12k: fix kernel crash during resume
    8c78593cf1229 net: tls: fix silent data drop under pipe back-pressure
    bc262c6d32b6c cxl/mem: Fix no cxl_nvd during pmem region auto-assembling
    5eaa11c500ed0 bpf: Defer work in bpf_timer_cancel_and_free
    4b48228eebce2 bpf: Fail verification for sign-extension of packet data/data_end/data_meta
    5be32f1ca915c xfs: fix blockgc group quota scanning when usrquota isn't enforced
    a40671025e915 smb: client: validate POSIX create context length
    e4c49012708c9 smb: client: fix create context out-of-bounds reads
    84ae3cfd7d3a6 Bluetooth: RFCOMM: fix NULL dereference of dlc->session in RFCOMM_CONNINFO
    524e0450dd9a3 Bluetooth: mgmt: fix race in read_unconf_index_list()
    8c7556c7cd17e Bluetooth: L2CAP: validate frame length before control and FCS access
    ff28e6c67143c Bluetooth: ISO: balance the parent hold in hci_bind_bis()
    68f0bcc4e16e3 Bluetooth: hci_sock: reject out-of-range OCF values
    dca25c204f71b Bluetooth: hci_sock: validate event length before filtering
    10f959cb43521 Bluetooth: hci_conn: fix CIS hold ownership on reuse
    c5efcbf06d648 RISC-V: KVM: Fix HSM hart status error propagation
    2af03b606aada RISC-V: KVM: Synchronize hrtimer callback during teardown
    dbf30e661ceb9 s390/cio: Fix NULL pointer dereference in ccw_device_get_util_str()
    c0ba61180d153 pinctrl: single: free the IRQ on domain creation failure
    de96dc11aee0d scsi: libiscsi_tcp: Check the data direction of a Data-In PDU
    144ad477c381e nfc: port100: reject frames whose declared length exceeds the received data
    066205553a010 nfc: llcp: drop truncated I/RR/RNR PDUs in nfc_llcp_recv_hdlc()
    19bcfc2a56d0b nfc: fix use-after-free in nfc_get_local_general_bytes
    b89249819a7d6 netfilter: ip6t_rt: fix zero-address non-strict match out-of-bounds read
    f49da48bd679c netfilter: ip6t_rpfilter: reject routes without inet6_dev
    b895bd3267e5a net: usb: lan78xx: Fix URB reference leak in lan78xx_submit_deferred_urbs()
    9a7140ea89a09 net: usb: cdc_mbim: add MeiG Smart SRM821 to ZLP whitelist
    1d8c85359b507 net: atl1e: fix soft lockup on out-of-range hw_next_to_clean read
    57b55367b6e3a net: atl1c: fix soft lockup on out-of-range tpd_cons read
    de41ee24f77b0 net: openvswitch: conntrack: avoid modifying shared unconfirmed ct entry
    2f57cef1a17cb net: hisilicon: hns_dsaf_mac: fix mdio device leak in hns_mac_register_phy()
    632cd7b81cb7b net: atl1: fix soft lockup on out-of-range cmb_tpd_next_to_clean read
    1b08c5c3ac27c net: arp: terminate device name before lookup
    6c9f07bf88001 net/sched: reject IDR error pointers when deleting actions
    ff384b1bd7228 net/mlx5e: advertise MACsec offload only when supported
    288721013605b net/mlx5: Fix rev_entry reference leak in mlx5_tc_ct_shared_counter_get()
    65e7c4b5366b7 HID: wacom: fix OOB read in wacom_wac_pen_serial_enforce()
    f4c21a259b4f3 HID: quirks: add ALWAYS_POLL quirk for SDINNOVATION gaming keyboard
    5a8ad63158165 HID: alps: fix use-after-free on input2 registration failure
    ccd32fa3489cb PCI: of_property: Omit bus properties without a subordinate bus
    822e8a473391e gpio: tps65219: Fix GPIO input value reads
    9571ab7493561 drm/virtio: fix NULL pointer dereference on fence allocation failure
    43bfe2b60c149 drm/virtio: fix memory leak of fence event on execbuffer failure
    9924c1d64405b drm/nouveau: don't bump pin count on failed re-pin in nouveau_bo_pin_locked()
    74485cdc34306 drm/nouveau: Fix gem reference leak in validate_init()
    f09f4a536935b drm/nouveau: fix double-free in nvif_vmm_dtor
    ac4f1d28498b9 drm/nouveau: Fix bridge reference leak in nv1a_ram_new()
    1971720e6a979 drm/nouveau: fix autosuspend cleanup during teardown
    5c857b2e6e755 drm/amdgpu: Fix vmid_wait fence leak in amdgpu_ring_init()
    2c1a643942caa drm/amdgpu: Fix runtime PM leak in amdgpu_debugfs_test_ib_show()
    96833fbf28c03 drm/amdgpu: Fix last_update fence leak in amdgpu_vm_init()
    daeac72644124 drm/amd/display: Fix dc stream excess put in dm_update_crtc_state()
    c53db9cc24521 drm/i915: fix incorrect RCU teardown order
    49ba5ed012990 rds: ib: Clear the sg list when mapping an MR fails
    1937222c2511a llc: reserve device headroom for allocated frames
    25c08be2a5e77 gpio: zynq: fix runtime PM leak on request error path
    9d8d6cddcb7c0 gpio: arizona: Fix runtime PM leak in arizona_gpio_direction_out()
    66bf65fa10932 ipv6: sr: enforce exact attribute length for SEG6_ATTR_DST
    dc92cb972e867 ipv6: do not let ipv6_find_hdr() return an offset past the packet end
    e560bdf62b11d fsl/fman: Fix clk reference leak in read_dts_node()
    ebf1555ad2821 writeback: report a Tasks-RCU quiescent state per cgwb drain pass
    513121e693886 workqueue: Fix NULL current_pwq deref in flush dependency check
    c96b4d1628868 writeback: bound cleanup_offline_cgwb() rescans by rotating scanned inodes
    3bcc1624cc1cd fou: reject omitted FOU_ATTR_IPPROTO on FOU_ENCAP_DIRECT
    c698f6deabf68 ata: libata-scsi: bound the ATA passthru sense descriptor writes
    be1aacff399d5 af_packet: fix integer overflow in prb_calc_retire_blk_tmo()
    1cd246b214dc9 sctp: discard the rest of the packet on a stale-cookie error
    80a9ccfc24d37 tipc: reject invalid and unexpected GRP_ACK_MSG to prevent bc_ackers underflow
    fc8df272af64f x86/PCI: Disable enhanced atomics on AMD NBIO 7.7 and 7.11
    301bdc558a5eb af_unix: Drop all SCM attributes for SOCKMAP.
    00e370627f2e1 netfilter: nf_tables: join hook list via splice_list_rcu() in commit phase
    3c5a6fa3fa004 rculist: add list_splice_rcu() for private lists
    d989c14cd70ab mptcp: return sk_wait_data() errors from recvmsg()
    a8f50c545ea5f perf/x86/intel: Make @data a mandatory param for intel_guest_get_msrs()
    599491e83e459 perf/x86/intel: Don't pointlessly context switch DS_AREA (and PEBS config) if PEBS is unused
    ed7ba11ed0859 perf/x86/intel: Don't write PEBS_ENABLED on host<=>guest xfers if CPU has PEBS isolation, to fix stuck PEBS_ENABLED
    5bce700da0580 perf/x86/intel: Ensure KVM guest PEBS path doesn't set unwanted PERF_GLOBAL_CTRL bits
    a58593b501b7b autofs: fix sbi->pipe file reference leak in autofs_kill_sb()
    ca797491f0ae4 vlan: ensure sufficient headroom in vlan_dev_hard_header()
    f623fe69f210d net/sched: sch_teql: fix shadowed err in __teql_resolve()
    1f4ac6ef54579 bridge: check llc_mac_hdr_init() return value in br_send_bpdu()
    d360b31f1a366 llc: fix skb UAF and leaks on llc_mac_hdr_init() failure
    b7d285a28a6dd net: ethernet: stmmac: dwmac-rk: fix bulk clock leak when the PHY clock fails
    c691d78c33da5 tipc: Fix a data race on mon->peer_cnt in mon_timeout()
    00a59600ae72d net/smc: fix UAF on lgr list traversal in smcr_port_err()
    c1b1639fb138d nfp: hold IPsec RX state under the XArray lock
    71d45049b0d63 tcp: fix use-after-free of retransmit_skb_hint in tcp_send_synack()
    bd172580e624b net: dsa: mt7530: fix NULL dereference on unbind of MT7531 and MT7621
    90464d595eb95 bonding: crypto offload enabled, non-offload slave failover, rekey failed
    9e841723ba482 net: xps: reject an out of range traffic class
    45a67662bf8ce vxlan: use one headroom snapshot for neighbour replies
    da2e0cfbb620b ip_gre: Reject enabling collect metadata through changelink
    97bb73b5a4672 net: bcmgenet: mask DMA_TIMEOUT_MASK when reading DMA_RING0_TIMEOUT
    075dca2b60dae net: bcmgenet: validate Ethernet address in bcmgenet_set_mac_addr
    f1fd173aea9b7 net: bcmgenet: do not skip WoL power up on GENET V1
    8055a4c6b9e38 net: bcmgenet: allow return of power up status
    b086fb2c4952e net: bcmgenet: move bcmgenet_power_up into resume_noirq
    ad0660587da4f net: bcmgenet: initialize u64 stats seq counter for all queues
    a61c0324e6187 net: bcmgenet: fix 64-bit RTNL stats reading in ethtool on 32-bit systems
    f187490352414 tg3: use random MAC address when tg3_get_device_address fails
    4092f59d1ce47 driver core: Add device probe log helper dev_warn_probe()
    7a527c6b27ba9 driver core: Make dev_err_probe() silent for -ENOMEM
    65451eb5a4599 driver core: Better advertise dev_err_probe()
    edf51b8dea6e9 bpf: Fix BSWAP 32 and 16 on MIPS64
    beeae92e70e70 bpf: Fix immediate JMP JEQ/JNE on MIPS32
    7d20eab09eb43 vrf: Stop corrupting skb->csum when capturing CHECKSUM_COMPLETE packets
    b2da5ed3d8c75 net: skbuff: fix pull-bound underflow in skb_checksum_setup_ipv6()
    f0e8dba8c2249 veth: manage XDP program pointers during channel resize
    290c4a021dd59 net/sched: act_gate: budget the per-entry list in get_fill_size
    ea82b75767932 nfc: pn533: fix OOB read in pn533_acr122_is_rx_frame_valid()
    75bfd9ef4da2f nfc: llcp: fix slab-out-of-bounds reads when logging service names
    6fad2c34d451d nfc: llcp: fix WKS SAP hijacking via prefix match in nfc_llcp_wks_sap()
    6295a085cb91d nfc: llcp: fix -ENOMEM on connect with zero-length service name
    9fa21b0f78adb nfc: st21nfca: validate ISO15693 inventory length
    e43ec0191c163 nfc: llcp: fix sdreq TLV list leak on parse/alloc/send failure
    f3083512a5bb5 nfc: virtual_ncidev: Add missing ioctl compat handler
    9ba32ddb1cf91 selftests/nci: Fix out-of-bounds store on thread join
    3b52335611593 selftests: nci: Fix uninitialized family ID on missing attribute
    41256821762a7 nfc: llcp: Fix race condition in accept_queue lifecycle
    f2550d8a37878 selftests: nci: Correct pthread_create return value check
    c1e9ed52a6697 nfc: llcp: Fix list corruption / refcount desync in nfc_llcp_recv_dm()
    d4008c3499dba nfc: st21nfca: validate received frame size
    a4e56f57dd04d nfc: nfcmrvl: validate helper command length before pull
    e57f041943615 bpf: Reject dev-bound-only programs on other devices
    ad5b7fd1434a2 net: stmmac: dwmac4: Use the correct bufzise when the len is exactly 8K
    1d1d9e4f9541e net: stmmac: selftests: Capture all packets for vlan checks
    27bd3b0ce2001 net: stmmac: selftests: Check the dev->features for S-TAG offload testing
    ddcc8b626b08d net: stmmac: selftests: Support running selftests on DSA conduits
    9d3d39da05447 sctp: hold asoc or transport before mod_timer() in timer handlers
    66ae85e15f1c6 net/mlx5: Bridge, don't fail unlink of untracked/unsupported peer ports
    6020d85204742 net/mlx5: Bridge, don't fail switchdev events of sibling eswitch ports
    909f761868fda bpf, sockmap: Reject max_entries > INT_MAX in sock_map_alloc
    ea4dc96c902cc bpf: Fix bpf_sock context code generation
    1b923538598be bpf: Fix bounds check for skb-backed dynptrs
    062849d19dd31 genetlink: report the real command id for dump-only ops in policy dumps
    91be8331501f1 net: ethernet: ti: netcp: fix pm_runtime usage counter leak on error
    33f706884821d s390/debug: Fix NULL pointer dereference in debug_info_copy()
    34cf1535a78b9 s390/debug: Do not register views for failed static debug areas
    e766321288b50 tg3: clean up PHYLIB resources on probe failure
    e1f5b74edccf4 net: usb: sr9700: include receive overhead in the length check
    c25587fa26761 Bluetooth: RFCOMM: Reject short EA=0 frames in rfcomm_recv_frame()
    035f9b1809861 Bluetooth: bnep: fix out-of-bounds reads on short RX/TX frames and control fallthrough
    77a43e00c5748 drm/bridge: samsung-dsim: fix TE GPIO lifetime for host attach
    a9bb8f8fd5694 drm/virtio: release the GEM object on virtio_gpu_vram_create() errors
    88c60c06a2a52 drm/virtio: fix object leaks in virtio_gpu_resource_create_blob_ioctl()
    77dee8e9106d6 drm/virtio: fix object leak in virtio_gpu_resource_create_ioctl()
    e2edd2d78d2cf drm/virtio: fix object leak when drm_gem_handle_create() fails
    e8f9979286f70 net/sched: sch_hfsc: bound the classify inner-filter walk with a drift budget
    21e206dd88b3d net: usb: catc: bound the RX packet length in catc_rx_done()
    83b1a7f9e7188 sctp: avoid livelock while updating retransmit path
    2731601ad277a ip6_gre: Call ip6erspan_tunnel_unlink_md() in ip6erspan_changelink().
    245bea0c7ab27 net: ethernet: mtk_eth_soc: unregister net_devices in case of probe failure
    d5d57501f543f net: mediatek: mtk_eth_sock: allocate dummy net_device dynamically
    34c6214d0df49 net: create a dummy net_device allocator
    88530b58fe0b3 net: core: Fix documentation
    9767e57504739 net: Do not return value from init_dummy_netdev()
    1d664be4ca49d net: gue: reject invalid REMCSUM offsets
    d512c484bd93a net/sched: act_ct: don't WARN on benign flow_offload_alloc() failure
    999a6c71a6aa0 drm/nouveau/clk: don't clobber reclock status when restoring volt/fan
    a867abcfa85ab drm/nouveau/clk: fix list cursor use after loop in nvkm_clk_ustate_update
    15f52cbc35d4c ocfs2: make ocfs2_calc_xattr_init() return void
    fddc90d4af455 arm64: io: Reject non-user protection in ioremap_prot()
    5128b8b0bdb24 netfilter: ctnetlink: fix suspicious RCU usage in expect_iter_name
    2c23d95517547 ipvs: revalidate ihl before icmp_send
    d52caee4f0fcd netfilter: nft_synproxy: use the family-aware checksum helper
    d559e06a5ab7c netfilter: nfnetlink_queue: hold nfnl mutex in event notifier
    caa82500e231e netfilter: nfnetlink_queue: nfqnl_instance GFP_ATOMIC -> GFP_KERNEL_ACCOUNT allocation
    e20701843032c netfilter: flowtable: publish HW_DEAD after worker is done
    e87687b967dcd libbpf: Reject truncated ldimm64 CO-RE relocations
    a0b79cdfcf34b bpf: Restrict CO-RE poisoning to relocatable instructions
    0fac292d93fdb net/sched: cls_u32: fix manual hash table handle IDR aliasing
    c251ed48bd906 bpf: Skip unsettled links in link iterator
    123f90f394ca4 xsk: Use a 32-bit compare in xsk_map_gen_lookup
    937cbeca0554a s390/cio: Guard PMCW field accesses with dnv check
    e364f5c677e81 s390/cio: Check pmcw.dnv before pmcw.ena in I/O entry points
    0f0e459ccf390 s390/cio: Fix cio_update_schib() to not cache invalid schib
    396d4b0be238a s390/pci/docs: Fix sriov_numvfs attribute name
    5cf766c9cca44 docs: s390/pci: Improve and update PCI documentation
    77d5f05ef79be scsi: megaraid_sas: Protect megasas_get_ctrl_info() in megasas_resume()
    f8174bd3822c5 selftests: cgroup: give the O_TMPFILE open in get_temp_fd() a mode
    8fd91aa0cf78a cgroup: selftests: Move memcontrol specific helpers out of common cgroup_util.c
    718a8ffa180d4 Bluetooth: mgmt: Dequeue pending mesh_send_sync entries on cancel
    5b467087928c5 Bluetooth: SMP: reject Security Request over BR/EDR
    c68e0068a236f squashfs: Add dictionary size range check to prevent shift-out-of-bounds
    144d60ed22735 KVM: arm64: Return -EINVAL for an empty SMCCC filter range at base 0
    62cdbb3e096f9 KVM: arm64: vgic-its: Skip unreachable devices instead of failing the save
    2df1bc50a6633 KVM: arm64: vgic-its: Add stronger type-checking to the ITS entry sizes
    5ff24aa7af0bc HID: amd_sfh: Validate PCI BAR size before mapping
    a78414ede1dc6 pinctrl: meson: Fix typo in s4 group name
    dc98def81e3c6 bpf, sockmap: Fix self-redirect copied_seq double-counting
    a8a9becbac93a bpf: Fix out-of-bounds read of rtt_min in sock_ops
    77a3b52b4455e bpf: Avoid soft lockup in __htab_map_lookup_and_delete_batch()
    911818b449196 HID: elecom: fix bus type for M-XGL20DLBK
    23da88d1597ee tcp: Skip cond_resched() in inet_csk_listen_stop() under BPF context
    5b4eb82475ae1 bpf: Fix out-of-bounds read of sk_protocol in bpf_sock_destroy()
    934e9ba9f8d05 bpf: Fix divide-by-zero in btf_struct_walk()
    f831c7bf53e91 selftests/ftrace: Fix unique symbol check in kprobe_non_uniq_symbol.tc
    df0072be6fc37 bpf: Disallow bpf_skb_pull_data() for LWT_SEG6LOCAL
    7e748e6e007b5 bpf: Fix bpf_skb_change_tail wrt csum partial skbs
    1572c4a24120f remoteproc: qcom_q6v5_adsp: Fix iommu_unmap() usage
    670fb8b0dbe0f netfilter: nf_tables: Simplify chain netdev notifier
    becc1f5adc77c netfilter: nf_tables: Tolerate chains with no remaining hooks
    0c415aaaffbf8 apparmor: Fix 8-byte alignment for initial dfa blob streams
    662e391e85af5 apparmor: Fix memory leak in unpack_profile()
    7e3717466403b apparmor: free the allocated pdb objects
    0b895b8faca11 erofs: fix large folio race in erofs_fscache_req_complete
    17309187f12d7 spi: zynqmp-gqspi: Use devm_spi_alloc_host()
    1ba2ffa759c5b selftests/landlock: Add layout1.refer_mount_root
    8706e18922fb9 spi: spi-zynqmp-gqspi: stop the controller on shutdown
    57230a74cf07d ksmbd: fix partial normalized name responses
    c3343cd7ec870 ipv6: mcast: fix RCU list diversion in ip6_mc_del1_src()
    ac51321d3b239 ipv6: mcast: use copy-on-write RCU updates in ip6_mc_source()
    5b24c8f815a44 ipv6: mcast: Don't hold RTNL for MCAST_ socket options.
    776668d3424c3 ipv6: mcast: Don't hold RTNL for IPV6_DROP_MEMBERSHIP and MCAST_LEAVE_GROUP.
    7157a0865debe ipv6: mcast: Don't hold RTNL for IPV6_ADD_MEMBERSHIP and MCAST_JOIN_GROUP.
    8355220e6166a ipv6: mcast: Use in6_dev_get() in ipv6_dev_mc_dec().
    d91b9a3b2b38e smb: client: fix missing iov bounds check in parse_posix_sids()
    6f5f4785b98c9 smb: client: fix missing lower-bound check on DFS referral string offsets
    e78fc1d240b27 smb: client: fix server->total_read for compound encrypted PDUs
    74995ee8305a7 smb: client: fix potential OOB read in smb3_enum_snapshots()
    491e33144dee8 smb: client: fix next_buffer UAF and NextCommand bounds in compound PDUs
    e3344bb0ff5ec smb: client: fix smbd_connection leak on cifs_get_tcp_session() error
    53d82794f890a smb: client: reject short Next offsets in parse_server_interfaces()
    b5f924ffbfa97 smb: client: fix rlist race and missing initialization
    180380272f116 smb: client: cancel reconnect work in clean_demultiplex_info()
    c46c47aef4982 drm/msm/hdmi_phy: fix runtime PM cleanup on probe failure
    48e46ea9b2c6a drm/msm/adreno: fix autosuspend cleanup during teardown
    5f5e565410b49 drm/gud: fix out-of-bounds write in gud_plane_atomic_check()
    0d1700394e9f5 wifi: mac80211: avoid WARN in set_bitrate_mask when sdata not in driver
    16abf3f5d727a wifi: mwifiex: validate action frame fixed fields
    c4943323fda22 wifi: mwifiex: validate scan response extents
    2402c9e2644b7 wifi: mwifiex: bound the pairwise-cipher OUI walk to the IE length
    bc83c04be042f wifi: p54: require a full exp_if record in PDR_INTERFACE_LIST
    42f4b03971f9d wifi: p54: validate curve data length in the calibration curve converters
    612ed9224eae7 wifi: wilc1000: fix RX buffer OOB-write in wilc_wlan_handle_isr_ext()
    491df93b10d76 wifi: wilc1000: fix out-of-bounds read in P2P public action frames
    05b5e297bbf46 wifi: wlcore: release runtime PM ref on regdomain config failure
    00bea35892556 wifi: rsi: fix heap OOB write on key removal
    41b1a4d545ec3 wifi: libertas_tf: fix UAF in lbtf_free_adapter()
    85d847ff71fe7 wifi: iwlegacy: fix broadcast stations deallocation
    856dabd5f2617 wifi: brcmsmac: fix UAF in brcms_free_timer()
    ef3c2aef001a6 watchdog: starfive-wdt: Fix runtime PM leak in starfive_wdt_pm_start()
    135cf929db55d watchdog: sp5100_tco: Fix pci_dev reference leak in sp5100_tco_init()
    757c721545b9f watchdog: rtd119x: Avoid division by zero
    c52ba8375ff9c watchdog: msc313e: Propagate error code in resume()
    1c4aabc88fee1 watchdog: msc313e: Fix premature reset during timeout update
    08c58739c9984 watchdog: digicolor: Avoid division by zero
    c30b419c7e6fb watchdog: da9063: fix suspend/resume handling of HW_RUNNING watchdog
    b81989ecf97d1 hwmon: (w83793) release probe data through kref
    f6e2ab72f32d1 hwmon: (w83791d) remove fan/pwm 4-5 sysfs group on remove
    3040bfd935599 hwmon: (pmbus/tps53679) Select page 0 for single-page TPS53676
    1209d2330bab3 hwmon: (pmbus/tps53679) Fix TPS53676 phase page decoding
    66368f682a53f hwmon: (pmbus/core) increase number of phases and add new mask
    b6b2a638aa36c hwmon: (hp-wmi-sensors) Fix use-after-free in fungible_show()
    c5e573bb095d5 Input: zero ff_effect before compat copy in input_ff_effect_from_user
    e2b6703465c1c Input: synaptics-rmi4 - fix GPF in suspend and resume when unbound
    d06f72350d5d5 Input: synaptics - disable InterTouch on ThinkPad T440p (board id 2722)
    42c7afc0e5f5b Input: soc_button_array - check btns_desc->package.count
    fd9bc6c1e5c0d Input: soc_button_array - fix MS Surface Pro 11 probe failure
    50dd585bee766 Input: rmi_smbus - fix out-of-bounds read in rmi_smb_write_block()
    84f863866adb0 Input: i8042 - add quirk for Acer Aspire Go 15 AG15-42P
    af5f7130cbf39 Input: evdev - zero absinfo before partial copy in EVIOCSABS
    b172c69e67bc7 Input: cyttsp5 - clamp the HID report size before memcpy
    e08c459870a65 Input: atkbd - skip deactivate for Xiaomi Redmi Book Pro 16 2026
    b266cbbad1a7a Input: adp5588-keys - cache GPIO state before registering the gpiochip
    7e1c98cb7249e mmc: sdhci_am654: Reset command and data lines on failed tuning
    da4929ee78ee7 mmc: spi: reset bytes_xfered before retrying CRC failures
    4adbd609686d5 mmc: sh_mmcif: initialize IRQ-thread mutex before requesting interrupt
    72f4c2b7a4842 mmc: sdio_uart: fix xmit_fifo leak when the port table is full
    b84d29f2541c8 mmc: sdhci-of-aspeed: Remove children before releasing SDC resources
    cd19ae28eb545 mmc: rtsx_pci_sdmmc: ignore broken write-protect on ThinkPad X260
    ae10838a7cdf0 mmc: mxcmmc: cancel data work and watchdog on remove
    c50d6515bffb1 mmc: hsq: Fix use-after-free in retry work
    ee47e50011c20 mmc: core: Fix OF node reference leak on card add failure
    0bf3d168a2cc2 mmc: core: Cancel SDIO IRQ work before freeing host
    e77461af13eab selinux: always fill AVC decision in avc_has_perm_noaudit()
    4d50ebe5a2772 selinux: recheck intermediate backing files on mprotect()
    caa1b913d90d5 selinux: preserve user SID across nested backing files
    535530bb2ea52 IB/hfi1: Fix the PIO_CRED credit-return mmap
    1b352c95a49a3 IB/hfi1: Resolve the credit-return buffer through the send context's node
    cf20d7476754c IB/mlx4: Fix use-after-free on pkey sysfs registration failure
    bf0252e908448 i2c: imx: disable autosuspend on remove
    ad793059a419f i2c: imx: release DMA channels on probe error
    2f5e42edbd232 i2c: atr: fix dangling adapter pointer on add failure
    3cb8ae257292f i2c: at91: release DMA channels on remove and probe error
    3fd487c69ad31 KEYS: trusted: Fix tpm2_load_cmd() boundary check
    6ecc3fef3db53 keys: translate request_key_auth pid for the reading procfs instance
    ce6009f753485 mm/mlock: use the IRQ-safe accessor for NR_MLOCK in __munlock_folio()
    19c3da6621a25 memstick: ms_block: destroy io_queue workqueue on removal
    937108dc0258d xfrm: serialize state GC with device state flush
    39491a1ae9305 scsi: core: Validate MODE SENSE lengths in scsi_cdl_enable()
    6106fb1246ead net/packet: avoid truncating TPACKET_V3 private size
    23cd30498891d net/packet: clear RX owner on VNET header error
    d8e2f1f0263b7 net/sched: hhf: cap hh_flows_limit at change time
    dd136f1fdd105 net: wwan: mhi_wwan_mbim: check skb_copy_bits() return value
    19b5e8dd884a5 net: wwan: mhi_wwan_mbim: guard against a cyclic NDP chain
    fba45070e25ab net: wwan: t7xx: validate the netif index in t7xx_ccmni_recv_skb()
    a58024835c704 net: lan743x: fix RX checksum use-after-free
    60459c670329d ipv6: xfrm: use full sockets in local error paths
    89f5414660724 dmaengine: ti: k3-udma-glue: fix NULL dereference in k3_udma_glue_release_rx_chn()
    aacd1c4cbe06a dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status
    b4025915131c6 dmaengine: sun6i: fix non-atomic read of DMA position registers
    560ed4373c06a Bluetooth: hci_sync: Serialize local codec list cleanup
    a6da782fefae6 Bluetooth: hci_codec: validate vendor codec count length
    3a640fee27ce4 Bluetooth: eir: validate service data length before reading UUID
    063d409c54703 Bluetooth: btusb: fix NXP IW610 composite device handling
    df4920b133343 arm64: percpu: Fix this_cpu_and() mask generation
    9397a97eba3d5 arm64: percpu: Fix this_cpu_write() casting
    0b2144175502d arm64: dts: renesas: r8a779f0: Set UFS lane count
    909e92423db72 arm64: hibernate: pass HVC_SET_VECTORS args to the resume hvc
    a8b826076a41e kselftest/arm64: Fix size of thread_data values for pthread_join()
    8f282d12550e3 HID: logitech-hidpp: fix race condition when accessing stale stack pointer
    b2b84e73e0386 net: xfrm: reject unrepresentable espintcp transport headers
    579d87ec1e1e8 openvswitch: avoid reallocating confirmed conntrack labels
    2fbac8a56004b RDMA/core: fix refcount bug in iwpm_get_nlmsg_request()
    ae805d204cf1f RDMA/ucma: Serialize join and leave on copy_to_user failure
    1c8448db5cf35 tcp: exclude old ACKs from tcp fast path
    b5c9f2951d330 rds: ib: use rds_conn_drop() on protocol version mismatch
    6f1977cea3e85 exec: Cleanup POSIX timers right after de_thread()
    0338489960dda cifs: Fix server use-after-free in cifs_chan_skip_or_disable()
    a5a8b4737f68b ata: libahci: clear PxCLBU and PxFBU for AHCI_HFLAG_32BIT_ONLY
    6507055733a9d ASoC: codecs: rt712-sdca-dmic: fix uninitialized stream_config->type
    830012feadc22 ALSA: virtio: reset device before deleting virtqueues
    5658739b54f5e Input: xpad - fix PDP Marvel Xbox 360 controller
    1fb92056c8fcc Input: xpad - add support for Azeron devices
    2e74f1f22a0e3 Input: xpad - add support for Victrix Pro BFG Controller
    93e3eb481be0f wifi: rtw88: Fix the random "error beacon valid" messages for USB
    f689260c48fb4 wifi: rtw88: TX QOS Null data the same way as Null data
    fa252fe7dc329 net: cpsw: Execute ndo_set_rx_mode callback in a work queue
    74852715757d9 net: cpsw_new: Execute ndo_set_rx_mode callback in a work queue
    7e22e5bcbfacf mm/huge_memory: use folio's memcg inside __folio_split()
    2605eb9ba3bbd btrfs: abort transaction on failure to update inode for hole punching and reflinking
    71d45a04ea99c btrfs: remove redundant root argument from btrfs_update_inode()
    a66b626d3b4b7 btrfs: simplify error check condition at btrfs_dirty_inode()
    b7c7f07a40037 drm/amdgpu: check ras and obj before dereference
    6569fd85b0ef9 net: mvpp2: prevent buffer overflow in page_pool allocation
    afaddc3fbf2ae net: macb: fix ordering around PTP timestamp read
    472493d1d3334 net: ethernet: cortina: Ack RX overrun interrupt correctly
    17b2a1eb97fdb net: lock the socket in sock_gettstamp()
    c10101baba9d3 net: netsec: fix device_node reference leak on phy_np
    aeec38e773c66 ASoC: hdmi-codec: Report a change when the channel status moves
    9cc2fae796b79 ASoC: ux500: Parenthesize MSP_{RX,TX}_CLKPOL_BIT() arguments
    d6a1779129d93 powerpc/iommu: Fix the overflow validation in iommu_tce_check_ioba
    c41088b2765af KVM: PPC: Book3S HV: fix secure device page leak on uv_page_in() failure
    e37fba1ba6938 KVM: PPC: Book3S HV: fix use-after-free in kvmhv_emulate_tlbie_all_lpid()
    d54a044136b12 drop_monitor: fix out-of-bounds write in reset_per_cpu_data()
    86f1151aa6ac3 drop_monitor: synchronize tracepoint unregistration on error path
    ffc448eb54f5b pppoatm: ensure a writable skb header and linear data
    c741977e413f5 Bluetooth: RFCOMM: avoid socket lock inversion in listener cleanup
    3b00027c71345 Bluetooth: btmtksdio: Fix PM runtime reference leak in shutdown
    ad13c739dedcc Bluetooth: btmtk: fix wrong status for short WMT FUNC_CTRL events
    ea8a262662be6 Bluetooth: ISO: Fix parent socket leak in iso_conn_ready()
    4a33886057e6d dmaengine: mmp_pdma: fix wrong sg length in mmp_pdma_prep_slave_sg()
    a444c0115665a ksmbd: keep compound responses on query info errors
    2107d60053c88 ksmbd: fix partial file information responses
    39685131e5bda ksmbd: return buffer overflow for partial filesystem info
    9a4f49bf8d2da tcp: do not let tcp_rmem be set below 4096
    b727e3d58cb90 tcp: Don't call skb_clone_and_charge_r() for close()d listener in tcp_v6_do_rcv().
    6b431b6321985 net: bridge: mst: move switchdev call outside rcu
    50b1adbb39fc0 wifi: brcmfmac: fix lost 802.1x TX completion wakeup
    822903ed99197 net: fddi: skfp: fix NULL deref when setting the MAC address while down
    83aa83f81a8fe ipv4: icmp: reject RTN_UNREACHABLE input routes in icmp_route_lookup
    5130afa025c95 seg6: set IPSKB_L3SLAVE from IP6SKB_L3SLAVE on IPIP decapsulation
    35cbe34c3704c drm/msm/dsi: round the byte clock rate after reparenting to the PHY PLL
    a7cd161e4ba2b btrfs: tree-checker: print dev extent offset in error message
    0a52ba6d3b268 ALSA: hda: trace PCM open only after assigning a stream
    b6beee927e7f4 drm/vc4: Use managed KMS polling to fix UAF on unbind
    f1a232fdc1012 drm/ast: Automatically clean up poll helper
    e8304e25c6dab wifi: virt_wifi: don't transfer operstate before register
    246de677552fe ALSA: 6fire: fix OOB write from device-reported iso length
    8b8559aeaba2e ALSA: usb: 6fire: Avoid embedded URBs
    910bde5a7f188 ALSA: 6fire: Clean ups with guard()
    aff058605007c Input: trackpoint - fix the inertia attribute name in the ABI document
    686c7a6af1eea ALSA: pcm: set timer->private_data before registering the PCM timer
    d54a90f2b9376 phy: mediatek: phy-mtk-hdmi-mt8195: Fix TMDS clk bit ratio setting
    5d6c7370d515e phy: mediatek: phy-mtk-hdmi-mt8195: Fix PLL calc divisor overflow
    c83d6b0a65f7b ALSA: bcd2000: Fix race between rawmidi and disconnect
    3d5f7e77b2e1b keys: fix lost wakeup when reaping a dead key type
    780716e2e0191 drm: Fix drm_pending_vblank_event leak in error path for out_fence_ptr
    136cb27bf8f5b perf/arm-cmn: Fix wp_dev_sel2 setting for multi-DTM configurations
    a43cd2b67b91e netfilter: flowtable: hold reference on ct until flow is released
    e4982c489ee35 netfilter: nft_nat: fully initialise new_addr in netmap setup
    eb4d7a9469704 RDMA/siw: Bound fragmented header copies by the remaining length
    c767e2812cac8 RDMA/efa: Keep EQ resources alive while IRQ is registered
    00f7df59543cc RDMA/efa: Keep admin queues alive while IRQ is registered
    87793933dc54f dmaengine: xilinx_dma: Fix hardware buffer descriptor chain after cyclic DMA
    209cf79a4f8a6 dmaengine: xilinx_dma: Fix hardware buffer descriptor reuse order
    aaf4ae1730d40 scsi: qla2xxx: Fix the ql2xfc2target parameter description
    7343f2575868f mm: memblock: show all region flags in debugfs
    420fcc2fdeae6 wifi: mac80211: set up the TX info early to fix failure paths
    7e32c6ed25548 wifi: mac80211: rework ack_frame_id handling a bit
    b51f5a310bd68 wifi: mac80211: mesh: release the channel if start fails
    be7bfdea1ec9b wifi: mac80211: add HE 6 GHz capability in the scan elems len
    f17a3fb26beca wifi: mac80211: don't access the TSF of a down interface
    e4bb995f61e23 wifi: mac80211: don't RCU-dereference the mesh CSA settings we just set
    ed8d5f5b74d0f wifi: mac80211: don't allow link changes when iface is down
    d0afa5395c46d wifi: mac80211: require a peer station for TDLS setup confirm
    7775759e3cb35 wifi: mac80211: reset the AP_VLAN tailroom counter on ifdown
    c4e4fe330294e wifi: mac80211_hwsim: don't hand frames to mac80211 while stopping
    20a56e96a6f7b wifi: mac80211: unlist vifs when their netdev is unregistered
    06f1c819700db wifi: mac80211: suppress chanctx warning for debugfs reset
    790221efbfece wifi: mac80211: don't offload TC setup on AP_VLAN interfaces
    65fdb973bd905 wifi: cfg80211: don't filter by BSS type when removing stale entries
    73365b81630b5 wifi: cfg80211: only group hidden BSSes with beacon entries
    8577a5ec4f7e0 dmaengine: wait for RCU readers before releasing dma_device
    07eb075b60d56 dmaengine: fix use-after-free in dma_chan_put() and dma_release_channel()
    7c3f4ce651d43 dmaengine: Fix device kref underflow in dma_chan_put()
    cee7e641245c3 dma-coherent: report a failed reserved memory assignment
    c9cee0989b55d dma-coherent: Warn if OF reserved memory is beyond current coherent DMA mask
    dd579fd27593d MIPS: Octeon: apply USB FDT fixups also when USB is modular
    c58a21667bd5e soundwire: cadence_master: wait and cancel cdns->work before clock stop
    12c0abd4d1c1b wifi: cfg80211: check IP header size in cfg80211_classify8021d()
    326f7d34bd7e6 IB/IPoIB: Avoid restoring OPER_UP after multicast flush
    46aa75291056b wifi: libipw: reject too-short association responses
    14ae269c13060 wifi: libipw: reject too-short beacon and probe responses
    2761b21cb896b wifi: mwifiex: fix IRQ leak using wrong index in MSI-X error path
    36727a702cf8e wifi: virt_wifi: free skb when disconnected
    3eff16074d061 dmaengine: sprd: Fix runtime PM reference leak in probe
    6f8020fe7465f RDMA/rtrs-clt: Fix CQ pool leak when connect is interrupted
    aacfef2480876 RDMA/irdma: Enforce local fence for IB_WR_REG_MR
    752b30e9d3390 RDMA/mad: Fix receive buffer leak when PKey enforcement fails
    505b242d93516 IB/isert: wait for deferred control PDU completions before releasing the connection
    9d145a2d8d6f8 IB/iser: reject a remote invalidation of an unregistered direction
    45c60ffc79771 RDMA/core: Reject unregistering netdevs in ib_get_eth_speed
    1c4cc9f0d8f45 net: convert dev->reg_state to u8
    c79a789aa1518 RDMA/rxe: insert mcg into mcg_tree only after rxe_mcast_add() succeeds
    56b7a9d89c679 clk: scpi: bound-check DVFS index in scpi_dvfs_recalc_rate
    f17865332cc4c firmware: arm_scpi: reject DVFS OPP count above MAX_DVFS_OPPS
    b7d2118660545 RDMA/rxe: Fix integer overflow in mr_check_range() leading to OOB access
    08f12745cb729 RDMA/rxe: validate access flags before swapping the MR's PD
    030306bbb9273 RDMA/siw: Clear association under lock if siw_qp_modify fails in siw_accept
    70d509b6bdf74 RDMA/siw: Cleanup siw_accept
    0b6ac53b6bd5f RDMA/siw: Introduce siw_cep_set_free_and_put
    5219c5652b2f3 ARM: socfpga: select the PL310 erratum 753970 workaround
    69a768c12398c esp: downgrade zerocopy managed frags before mutating skb frags
    0cda8273265d3 xfrm: add missing rcu_read_lock(), skb_dst_force() and dev_hold() for xfrm_trans_reinject()
    2b63341e2ebc9 xfrm: fix compat ALLOCSPI request use-after-free
    60610a5dab6ed xfrm: avoid RCU warnings around the per-netns netlink socket
    f1fde49cabc90 ipv6: Honor oif when choosing nexthop for locally generated traffic
    8a13003b50b97 ipv6: Select best matching nexthop object in fib6_table_lookup()
    4bc97d3bf5d72 media: video-i2c: fix buffer queue ordering
    04317f3fb8be2 sunvdc: fix -EIO issue due to lack of retries
    9a622ea3662c8 selftests/landlock: Add tests for whiteout object creation
    b6e45216aecc8 Revert "alpha: fix ieee_swcr_to_fpcr setting FPCR_DNOD unconditionally"
    f5d1ea9bb08d9 Revert "alpha: don't leak hardware-fabricated FP exception bits to user space"
    c337c14afcf7e selftests/landlock: Add disconnected leafs and branch test suites
    b15ec9fef1b16 selftests/landlock: Add tests for access through disconnected paths
    82e198df9c252 Revert "hwmon: (emc1403) Rely on subsystem locking"
    e08063fb0d02f Revert "hwmon: (emc1403) Drop hysteresis for low limit temperature"
    0a926b5df8efd mptcp: close race between scheduler and state change
    1962841387087 mptcp: avoid unneeded actions on subflow reset
    ddbf9f03c1cc7 mptcp: fix bad accounting in __mptcp_subflow_push_pending()
    cf6e04377bdde Bluetooth: btintel: Fix compiler warning for multi_v7_defconfig config
    9107e43ba1e03 workqueue: Update documentation as per system_percpu_wq naming
    1100e075a0e09 netfilter: nft_set_pipapo_avx2: add missing vzeroupper
    2c8fa22997892 crypto: sun8i-ce - Remove crypto_rng interface
    a41e4ba94ad45 crypto: sun8i-ss - Remove crypto_rng interface
    99f4d3120b244 fou: Fix use-after-free in fou_create()
    542c1dd41e1b0 net: appletalk: fix NULL pointer dereference in aarp_send_ddp()
    df077253f6405 i2c: smbus: reject oversized block transfers in the common path
    938e8d6cee8d3 ALSA: us122l: Prevent write upgrades for read mappings
    05d47f540d85c net: usb: pegasus: don't rely on id table pointer arithmetic
    be5996349328b media: as102: do not rely on id table address comparison
    0bbcbe9f7cfce usb: serial: spcp8x5: don't store usb_device_id
    367af2b4d5168 usb: usbtmc: don't store usb_device_id
    8cb99d4a71593 wifi: ath9k_htc: don't store usb_device_id
    5086f5639197f usb: xusbatm: don't rely on id table pointer arithmetic
    8f4422c14d6a2 perf evsel: Add per-thread warning for EOPNOTSUPP open failues
    44441aa9630fa Revert "perf tests: Fix flakiness in BPF counters test on hybrid systems"
    a3ca496b63fb9 Revert "selftests/mm: report unique test names for each cow test"
    289dfa824fb24 Revert "selftests/mm: skip COW tmpfile cases when fallocate() is unsupported"
    ad1be9fe255b4 Revert "nvme: apple: Add Apple A11 support"
    187187eea3441 Revert "nvme-apple: Drop the PRP null check chicken bit"
    eb51cbf1b091c Revert "nvme-apple: Prevent shared tags across queues on Apple A11"
    b66ef13b72f4f Revert "nvme-apple: Reset q->sq_tail during queue init"
    f91df9f3ed6ca Revert "arm64: dts: qcom: sc8180x: Fix the PCIe iommu-map entries"
    bddd4544e80b2 Revert "arm64: dts: qcom: sdm845: Fix the PCIe iommu-map entries"
    492c1a89a5c94 Revert "arm64: dts: qcom: sm8150: Fix the PCIe iommu-map entries"
    a0441be048ddd Revert "arm64: dts: qcom: sm8250: Fix the PCIe iommu-map entries"
    654a2e749883b Revert "arm64: dts: qcom: sm8350: Fix the PCIe iommu-map entries"
    91d04c96ef14b Revert "arm64: dts: qcom: sm8450: Fix the PCIe iommu-map entries"
    6805046d2db02 Revert "arm64: dts: qcom: sm8550: Fix the PCIe iommu-map entries"
    c2bf1299aeff6 xfs: bail out on bitmap errors in xrep_agfl_fill
    2cc0af2204070 xfs: count escaped corruption errors in scrub stats
    201995b1e9839 xfs: signal inode btree xref error if get_rec returns an error
    6e55aac5a1008 xfs: snapshot old AGFL before rewriting it
    e0873cce0e132 xfs: snapshot scrub stats when rendering them
    d5cea6766ae18 smb: client: fix heap overflow in DACL owner/group rewrite
    e9c5bcc88b833 smb: client: avoid leaking refcount when cifs_sb_tlink() fails
    de2a6bcff2659 smb: client: avoid leaking refcount in cifs_queue_oplock_break()
    f73341e1ef134 smb: client: fix file type corruption in wsl_to_fattr()
    0f723c20d2ced smb: client: fix file type corruption in cifs_reparse_point_to_fattr()
    ff411fcbfc55e smb: client: fix one-byte OOB read in smb2_parse_native_symlink()
    3c9acc9835c30 smb: client: pin DFS superblock in iterator callback
    17c93bcd17755 smb: client: reject userspace cifs.idmap descriptions
    f00c31be52f5c selftests: mptcp: fix an UAF in mptcp_connect.c
    360d99258a640 mptcp: syncookies: remember the request backup flag
    a2431bea521ef mptcp: subflow: no need to copy thmac during ulp_clone
    654381b0b176e mptcp: options: handle MPC data + csum reqd + no csum
    c3eb07e78e628 bnxt_en: Propagate RX ring init failures in bnxt_init_nic()
    cfec9e7f15a56 bnxt_en: Handle buffer allocation failure in bnxt_rx_ring_reset()
    aae9a450af63e bnxt_en: Only restore LRO if the device supports TPA
    1afaf85c4990f media: v4l2-ctrls: validate AV1 tile counts
    724915535558b media: v4l2-ctrls: validate HEVC tile counts
    95ee48eb17c91 media: verisilicon: rockchip: reject AV1 frames exceeding the tile capacity
    8659e5fc21a82 media: verisilicon: rockchip: guard VPU981 AV1 divisor and tile buffer
    279fb47254f37 media: v4l2-h264: Fix memcmp() size in B1 reference list comparison
    f19acf00818a9 media: mediatek: vcodec: bound AV1 tile-start copy to the array capacity
    2887a98c03d97 media: verisilicon: hantro: bound G2 HEVC tile loop to the buffer capacity
    98018ea5a682a media: hevc: add bounded tile-count helpers
    137c1b88507a4 hwmon: (pmbus) Clear generic status alarms with CLEAR_FAULTS
    e9fc7d53b2eb3 hwmon: (gpio-fan) Fix use-after-free in alarm work
    716beceaf70c1 hwmon: (applesmc) fix key backlight workqueue leak on register failure
    991c875310254 s390/crypto: Fix missing scrub of temp buffers with AES ctr and gcm algorithm
    b3f8200ec5285 s390/qeth: allow bridgeport queries despite OS_MISMATCH
    5f33ae947f52f KVM: PPC: Book3S HV: Set irqfd->producer only on success
    4826fd8373f68 mac802154: fix use-after-free of sdata via queued RX frames
    652d9caa5ac92 ipvs: reject invalid states in connection template sync records
    3080f9e653d8c ipv4: fib: bound automatic table ID allocation
    e3b4681197aa0 ieee802154: hwsim: serialize pib updates to fix double-free
    543994fa03c36 ieee802154: 6lowpan: fix NULL dereference in lowpan_newlink
    ff83367cda8ee inet: frags: invalidate queues before flushing them
    de5a0eda59fe4 fbdev: vfb: defer cleanup until the last reference
    b534dca2db93c scripts/sorttable: Mark long_size as __maybe_unused
    f464fde4fd880 vdpa: solidrun: Free IRQs after request failure
    123acfd63d767 vdpa: ifcvf: Put device on unsupported feature error
    b6204011c79eb netfilter: report NLM_F_DUMP_FILTERED when all is filtered out
    90166834b7dc6 netfilter: nf_log: unregister loggers before per-net teardown
    76678217cdabc net: openvswitch: fix use-after-free of the flow table mask array
    0b3425fd0ecd5 net: mpls: clear inner_protocol when the last label is popped
    f7d76b84b9206 net: mana: Reserve extra CQ slot for the fence completion CQE
    84ba968d7b35c net: hso: fix TIOCMIWAIT race
    9e28471d22a49 ring-buffer: Acquire the lock with irqsave in rb_wake_up_waiters()
    362c42720259f drm/i915: Fix memory leak in query_perf_config_list()
    506cfed91e50c drm/drm_exec: fix up contended obj when num_objects is 0
    3feb4020bfb7c exec: do_close_on_exec() before taking exec_update_lock
    b22193eea2ce3 cpufreq: initialize policy rwsem before sysfs publication
    06f273d29e5e0 cpufreq: zero-initialize policy cpumask before sysfs publication
    ba96047bba4a6 Bluetooth: btrtl: Don't leak return code when parsing firmware format v2
    45021eb562114 ASoC: sti: initialize IRQ lock before requesting IRQ
    1467e3989c6ed ASoC: sprd: validate compress buffer sizes against fixed allocations
    fe05eeed27128 tracing: Keep the entry count when the histogram stats allocation fails
    01966c9569230 tracing: Let histogram values keep the percent and graph modifiers
    3d42fed18b2c5 tracing: Free histogram the field rejected for a bad modifier
    b513a4c60a7aa tracing: Free histogram var refs regardless of how often they are referenced
    4924328d6991f tracing: Free histogram the var ref when its initialization fails
    a3d9b8b7c8f36 tracing/user_events: Don't destroy fields when event removal fails
    757aa9f548c18 tick/broadcast: Plug clockevents replacement race
    7cd398799eeb6 tunnels: Drop stale dst when building an ICMP error for PMTUD
    58c0c414b2b8d ufs: validate cylinder group metadata before caching it
    cd21f1ff74b1c ufs: create the root dentry after loading cylinder metadata
    c9e4a2c11ff61 watchdog: sunxi_wdt: preserve boot-enabled watchdog
    c42eadbcf68ca dm/amdgpu: fix malformed link_settings debugfs output
    d170cfbe38c88 ALSA: usbusx2y: fix in04_last array size mismatch with in04_buf
    3570468cc34e7 ALSA: ctxfi: Fix CA20K2 S/PDIF passthrough
    98da3379cdee3 tracing: Fix memory corruption from the histogram stacktrace modifier
    14fdaba201fdf ipv6: fix fib6 walker UAF on seq stop
    b5dec6dfb593d x86/mm: Fix user-space data loss with MADV_FREE and THP
    b0c201a596816 crypto: x86/aria - add missing vzeroupper in AVX-512 code
    3dee28df79cb7 crypto: x86/aria - add missing vzeroupper in AVX2 code
    460fab22b6513 powerpc/eeh: Fix recursive locking on devices without EEH sensitive driver
    e52bf7c4f2b2e powerpc/ps3: Fix repository.c build failure
    fd636a87161de ksmbd: prevent out-of-bounds reads in share config responses
    9c777f8e0cb04 scsi: target: iscsi: Fix hang for aborted WRITE_PENDING commands
    b0de6463667e9 sunvdc: unmap LDC cookies when the descriptor send fails
    4cd165b5f3eae openvswitch: fix wrong flag value in get_ipv6_ext_hdrs()
    348492de88bc6 net/rds: fix tcp stream corruption with large pages
    5c353c5a76e30 octeontx2-af: fix PF/CGX debugfs PCI bus lookup
    c622bbc212207 net: hinic: fix mailbox segment buffer overflow
    5aab3e8d71644 net: sun4i-emac: fix missing of_node_put() for phy_node
    96c2fc5daf983 net/sched: cls_api: Don't replay RTM_GETCHAIN in tc_ctl_chain().
    2cad4a521942d net/sched: cls_route: Fix in-place replace
    3d4c403aa780b net/sched: cls_route: make netlink errors meaningful
    cec2052fcecc2 net/sched: cls_route: Reject handle aliasing
    41e94079200aa net/sched: cls_route: free emptied bucket on filter move
    7fd4a45ee721d perf/x86/intel: Correct pt_regs->flags update for PEBS path
    82e79fdbf68ca perf/x86/intel/ds: Factor out PEBS group processing code to functions
    e2e2ca292449e perf/x86/intel/ds: Remove redundant assignments to sample.period
    421bc24582a36 perf/x86/intel/ds: Clarify adaptive PEBS processing
    85382012bbc33 perf/core: Check sample_type in perf_sample_save_callchain
    b799264c7b1f7 selftests/powerpc/tm: Fix tcheck() reading uninitialised CR value
    79fb5bcc50996 net: stmmac: initialize ptp_lock at probe time
    7953946f68262 ppp_synctty: ensure a writeable skb header
    16c5c8ea50179 octeontx2-pf: reset HTB scheduler topology before freeing queues
    3b90136e3df4f hwmon: (aspeed-pwm-tacho) Propagate reset deassert errors
    4a641ec4a73a6 hwmon: (gpio-fan) take fan_data->lock in gpio_fan_shutdown()
    ce3479e4a647b net: ks8851: Fix receiver error in 100BASE-TX mode following software power-down
    01a3ec43ad635 net/micrel: Fix typos in micrel driver code comments
    4afef977f36da watchdog: msc313e: Sync timeout value if WDT was running at boot
    079c8c2891d35 watchdog: msc313e: Fix undefined behavior
    aea1af21e3028 watchdog: msc313e: Fix spurious reset on suspend
    b4f3a54fd1949 watchdog: msc313e: Enable clock before accessing hardware registers
    a1dd0817776ea watchdog: msc313e: Fix clock leak and spurious timer in settimeout()
    660571b082331 watchdog: msc313e: Avoid division by zero
    0a1c1f26c68b1 watchdog: fix hrtimer start when pretimeout is zero
    c1de1e7b51ab2 net: macb: destroy the phylink instance on the probe error path
    5242050195a71 Bluetooth: btusb: Fix UAF of btusb_data by rx_work
    c075a91fe5762 ice: add missing xa_destroy for sched_node_ids
    e56a339e3de5e ALSA: hda: Report a change when only the channel status bytes move
    621a4bb3ec3c2 ALSA: hda/common: Use guard() for mutex locks
    934b404b6063d ALSA: hda/common: Use cleanup macros for PM controls
    3fe9102ae0a82 ALSA: hda: Introduce auto cleanup macros for PM
    4bc6df61a100a drm/logicvc: Drop the select of the nonexistent CONFIG_DRM_KMS_DMA_HELPER
    f2de9df262c47 net: ethernet: cortina: Count RX descriptors for freeq refill
    742f06928960c net: ethernet: cortina: Count RX drops once per frame
    dd792f4154b69 net: ethernet: cortina: No mapping is a dropped rx
    e858b9b1ea3cb net: ethernet: cortina: Count dropped frames as NAPI work
    d2541cfbd41cd net: ethernet: cortina: Finish RX updates before NAPI completion
    4ca84049c6428 net: ethernet: cortina: Fix budget accounting
    565be2ffa33fe net: ipv6: Clamp to IP6_MAX_MTU in ip6_dst_mtu_maybe_forward
    1dd562f301901 net: ipv6: Fix UDP length overflow with PMTU discover and big MTU
    550aa32d46f2a ipv6: lockless IPV6_MTU implementation
    20c41165e8efd ipv6: lockless IPV6_MULTICAST_HOPS implementation
    c79c67de42d6e ipv6: lockless IPV6_MULTICAST_LOOP implementation
    e6c6b0059d624 ipv6: lockless IPV6_UNICAST_HOPS implementation
    81073bca2062c virtio_input: stop callbacks before unregistering input device
    16c90260ae7ae virtio_input: reset device if input_register_device() fails
    fa2ec3f48a679 virtio-pci: return IRQ_HANDLED after non-zero ISR
    1b803d382cde6 vdpa_sim_net: check TX pull result before RX copy
    000c6300776ce vdpa_sim_blk: reject out-of-range sector starts
    59fc7c1c6b4d3 vhost-vdpa: don't install the eventfd_ctx_fdget() error in config_ctx
    4875c65ca5379 vhost/vdpa: reject VRING_NUM larger than device max
    bd94e2ba56d02 vhost-vdpa: clean iotlb map during reset for older userspace
    b46594205234a vdpa: introduce .compat_reset operation callback
    dc74887a56e58 vhost-vdpa: introduce IOTLB_PERSIST backend feature bit
    fde77a9a589f3 vdpa: introduce .reset_map operation callback
    c147d62316ce0 vhost-vdpa: introduce descriptor group backend feature
    d76182012a5df vdpa: introduce dedicated descriptor group for virtqueue
    2e40c69b9c344 virtio_console: do not free control-out buffers on remove
    74bdd312e78d0 ASoC: mt6351: Publish the OF module alias
    0f7dcaaff3b24 netfilter: ip6_tables: set F_PROTO when proto value is nonzero
    3161186a2ff81 netfilter: nfnetlink_log: cope with concurrent instance destruction
    79d93d8b49f05 ASoC: Intel: SST: Publish the PCI module aliases
    ebae165ad8352 ASoC: bcm: bcm63xx: Publish the OF module aliases
    671037b282eb7 ALSA: caiaq: Decoupling ep1_in_urb in caiaq dev
    2ff38b3552af5 bpf: Reject non-scalar bpf_loop iteration counts
    054ad8e66025e net: macb: fix NULL pointer dereference on unbind with fixed-link
    2efc0d08fda24 net: macb: rename bp->sgmii_phy field to bp->phy
    94b12a42cf8e8 workqueue: Introduce from_work() helper for cleaner callback declarations
    226d2702e74a5 net/sched: ets: clamp quantum in parse and fallback paths
    b464affe9f9df net/sched: drr: clamp quantum in change class
    3685934a0620f net/sched: pie: clamp psched_mtu in pie_drop_early
    6570f326a6a96 net/sched: hhf: clamp quantum in change and init paths
    e4192bcf83aaa net/sched: sfq: clamp quantum in change path
    215df1e953ae7 net/sched: fq_pie: clamp quantum in change path
    439a3dc17964e net_sched: sch_fq_pie: implement lockless fq_pie_dump()
    5a2b87dfceccf net/mlx5: E-Switch, prevent mc_list repopulation during vport disable
    a5833fdf53350 net/mlx5: E-Switch: fix use-after-free in mlx5_eswitch_termtbl_put
    8267e46d14e84 net/mlx5e: Fix use-after-free race in sample_restore_put()
    1886540daeaff net/mlx5e: Fix ETS zero BW reporting when one TC holds 100%
    874e90f3d8806 net/mlx5e: Fix setting RS FEC after remapping
    6a1b49bb9fdf9 net/sched: defer qdisc freeing after failed creation
    04a6cdb3fd13e powerpc/kexec_file: Use inclusive range checks in add_usable_mem()
    0bf9f3bae3c4b pds_core: fix cmd_regs access racing BAR unmap on reset
    c2362c500931e net: cap tx_queue_len at S16_MAX to prevent oversized ring allocations
    b2a8e165ddb6c vxlan: reject dynamic fdb entries that reference a nexthop id
    90f6f5cb331af s390/ism: folio_put() after error
    59bf9e94bdc49 net: usb: cx82310_eth: drop URB after 0xffff reboot sentinel to prevent partial_data heap overflow
    e5f4a054b9dc4 octeontx2-af: mcs: Clear stale X2P calibration state before calibration
    37cb9a81600da net: bridge: mcast: properly convert mglist to rcu
    c5b5c52b6524c net: dsa: mv88e6xxx: bound the policy rule dump by the caller's buffer size
    f5e93162b3dd1 net: dsa: bcm_sf2: bound the CFP rule dump by the caller's buffer size
    f24eb5bd870ca bonding: use skb_cow_head() in bond_do_alb_xmit() and rlb_arp_xmit()
    17acbcd4c5a6c nexthop: Initialize extack in remove_nh_grp_entry()
    8d282b2703899 selftests/bpf: Fix flaky bpf_nf test when random NAT port is 0
    0ba57948dc23a selftests/bpf: Update tests for new ct zone opts for nf_conntrack kfuncs
    b843ab43ac9d2 bpf: Mark bpf_btf_find_by_name_kind() as sleepable
    990df1ba4d080 net: bcmasp: fix tx_spb_ring_full() checking same slot cnt times
    1e213ba7cb3b9 net: bcmasp: clear txcb->last before writing each descriptor
    a16ca1987ce86 ASoC: Intel: avs: Clean up the bus when fetching ML caps fails
    aec0a9c1579eb bpf: Fix NULL-ptr-deref in btf_var_show()
    86d86f9fcf62d bpf: Fix NULL-ptr-deref when showing a void BTF type
    75b20534d7a37 ALSA: caiaq: Fix potential double-free at error path
    401aedb4632ae selftests/alsa: Fix the step check for INTEGER controls
    92748cdff7388 net: stmmac: reconfigure RX packet parser table in stmmac_hw_setup() after reset
    0ec75c69918b7 net/rds: don't let rds_conn_shutdown() consume a concurrent drop
    2e46248e375a5 net/rds: acquire the fastpath locks in rds_conn_shutdown()
    d184e6dd4b8f3 net/rds: acquire RDS_IN_XMIT in rds_tcp_reset_callbacks()
    51164c0597405 net/rds: tcp: don't force RDS_CONN_RESETTING over a concurrent shutdown
    b8a8b6d25e742 net/rds: clear cp_flags bits individually in rds_conn_path_reset()
    14d0a842e1696 net/rds: use clear_bit_unlock() in release_refill()
    3d401934b7edb net/rds: use wq_has_sleeper() in release_in_xmit()
    7b435c69a30b4 bonding: do not clear curr_active_slave prematurely when releasing all slaves
    8cb75f7ada25b bpf: reject BPF_PSEUDO_FUNC reference to the main program
    9379e193826f2 tracing/probes: Fix use-after-free on field name/type of events with multiple probes
    c6beb08b1a9fd netfilter: nf_conntrack_sip: fix OOB read in sip_skip_whitespace()
    677ff8ab30a66 ipvs: fix reversed sequence option serialization
    7caaae233a55e btrfs: do not force reloc root creation during qgroup_account_snapshot()
    02ebc4d4e5d73 btrfs: send: fix lost error return value in will_overwrite_ref()
    d043c43d2b4eb btrfs: fix the possible bioc_list memory leak during error
    81116d3c6b27d btrfs: directly return 0 on no error code in btrfs_insert_raid_extent()
    089d9c45ea49f btrfs: fix transaction use-after-free in raid stripe insertion
    77a771b5083c7 ASoC: ux500: Program the MSP FIFO watermarks
    507f239aacedd ASoC: ux500: Request the MSP MMIO resource
    737e29e7dbf6e mfd: db8500-prcmu: Fold dbx500 header into db8500
    f30aae1a465f2 arm: Handle KCOV __init vs inline mismatches
    3f87eece1edde mfd: db8500-prcmu: Remove needless return in three void APIs
    2e5e878e321f1 ASoC: ux500: Validate MSP DAI configuration
    054396ce4a4eb ASoC: ux500: Correct MSP frame and bit clock setup
    3b2d65cadf1f6 ASoC: ux500: Propagate MSP setup errors
    80c65fbc57d21 ASoC: ux500: Fix MSP stream lifecycle handling
    d6f9af093dc91 ALSA: ump: do not touch legacy_rmidi before it exists
    d2baaf94766e2 ALSA: ump: Update rawmidi name per EP name update
    b8ca1a95e9c52 ALSA: ump: Copy safe string name to rawmidi
    ee432ab0658c8 ALSA: ump: Copy FB name string more safely
    5447926ddbe75 ALSA: rawmidi: Show substream activity in info ioctl
    210a9fc6678ce ALSA: rawmidi: Expose the tied device number in info ioctl
    6bc345f6d81eb locking/lockdep: Invalidate stale class_cache entries for zapped classes
    c049f114bcb9e perf/core: Skip empty AUX records with only format flags
    7bcce856c79c1 scsi: mpt3sas: Avoid out-of-bounds cpumask_of_node() call in _base_assign_reply_queues()
    7adb1bf25b0c5 bonding: alb: fix uninitialized transport header access in alb_determine_nd()
    0a0ee38ad6324 btrfs: restore active device pointers after failed sprout
    7fe9dfbca4346 btrfs: detach failed sprout device from transaction update list
    d356c188a653d ASoC: amd: yc: fix memory leak in acp6x_pdm_dma_close()
    d744a26619bc9 ASoC: amd: renoir: fix disable_pdm_interrupts() to clear mask bits
    65736547074cb s390/boot: Fix physical memory search range
    68e920cb06ddd ALSA: hda: restore MFG widget enumeration after core split
    02f8dcb5c9be4 ALSA: hda/core: Use guard() for mutex locks
    10cc145b87367 staging: fbtft: make dirty_lock IRQ-safe
    2b9fa12fbdbfc af_packet: Don't cast tpacket_hdr.tp_len to int in tpacket_parse_header().
    af08f62b5a5a4 ipv6: sr: restore network header before routing and forwarding
    b5344e459996a tipc: fix NULL deref in tipc_named_node_up() on empty publication list
    f614c83fd7664 ip6_gre: check tunnel info before xmit in ip6gre_tunnel_xmit
    faaa80fad1f5d ppp: ppp_async: simplify tty disc_data access
    84223baf21bc9 net/sched: cls_u32: fix duplicate handle when node ID pool is exhausted
    6245425c04be5 ASoC: ab8500: Validate and program TDM slots correctly
    780e00c41886a ASoC: ab8500: Correct digital interface format setup
    84ce73fefeb17 ASoC: ab8500: Repair the DAPM capture graph
    a2db840c01162 ASoC: ab8500: Reset the audio block before configuring it
    b67584161b7f9 Bluetooth: hci_mrvl: Fix wrong return value check of wait_on_bit_timeout()
    a8841f6653164 Bluetooth: L2CAP: clear FLAG_DEFER_SETUP only for same PID/PSM
    0e1fc7cab95ad Bluetooth: L2CAP: fix chan mode for LE_CONN_REQ + EXT_FLOWCTL pchan
    593e64f64a20b Bluetooth: hci_core: Fix race condition during device registration
    e9cf7f175c00d Bluetooth: btintel: validate version TLV value lengths
    17b61f59914b5 Bluetooth: btintel: Export few static functions
    b9b36a0e3d77a Bluetooth: btintel: Print firmware SHA1
    abf3623af5d67 workqueue: reject watchdog thresholds that overflow jiffies
    198734bee7945 workqueue: replace use of system_wq with system_percpu_wq
    41647864e62b2 s390/ipl: Fix NULL deref in dump_reipl without re-IPL parm block
    030e88812435f s390/ipl: Fix NULL deref in kdump without re-IPL parm block
    948d0090e7250 s390/os_info: Introduce value entries
    b0fc13ff74a13 s390/checksum: provide and use cksm() inline assembly
    581896f229b39 s390/checksum: call instrument_read() instead of kasan_check_read()
    486876f957456 ksmbd: rate limit unmapped SID errors
    cbadf2575d25e ALSA: pcm: Serialize PCM mmap with buffer reallocation to fix page UAF
    dcaa77d10ea19 OPP: of: Fix potential multiplication overflow when calculating freq
    a135415be5683 watchdog: msc313e: Fix NULL pointer dereference in PM callbacks
    069d5527bb0f2 vxlan: mdb: Fix use-after-free in vxlan_mdb_remote_src_del()
    c60066fa5e2fe net: amd-xgbe: discard rx packets with bad FCS
    e3f4ffbde379c raw: annotate disconnect-side IPv4 match writers
    4548d843e7b29 sctp: fix soft lockup from unpadded ASCONF-ACK parameter iteration
    377e01e4f3104 smb: client: transport: Fix debug printing in __release_mid()
    60a93d9f0fa06 smb/client: mark file sparse before emulating insert range
    58e3d2fbc8c91 scsi: mpi3mr: Fix target device refcount leak in mpi3mr_sas_port_add()
    c848a1bbe1104 scsi: mpi3mr: Fix NULL pointer dereference in mpi3mr_sas_port_add()
    09e7f9290d631 sctp: fix a TOCTOU race in SCTP_CMD_TIMER_START
    1ea521961c110 net/sched: act_api: fix skb sizing and action leak on reoffload delete
    5fe7f53543e85 net/sched: act_api: conditional notification of events
    4587ff1844ebb net/sched: act_api: don't open code max()
    8611126b2637d rtnl: add helper to send if skb is not null
    52a6bb47ef80d net/sched: act_api: size the RTM_GETACTION reply from the actions
    606c29451264d net/sched: act_api: budget all shared attributes in notify skbs
    99654b651c6d5 net: icmp: avoid invalid transport header access in icmp_send tracepoint
    2a0e7bcff3fa6 drm/cirrus-qemu: Validate BAR0 size during probe
    6a8aa0068d476 drm/cirrus: Use video aperture helpers
    5b269f6682a7f ufs: do not treat unreadable directory blocks as empty
    364e65b2e81ed ufs: Convert ufs_get_page() to ufs_get_folio()
    1ca5c166deeac ufs: Convert ufs_get_page() to use a folio
    f8f3d946fe4b0 ufs: convert to new timestamp accessors
    23d2429aecd6f selftests/cgroup: Fix cg_run_in_subcgroups ignoring arg parameter
    965804b20c0f0 nvme-rdma: fix -EIO cleanup order in queue_rq
    5807a65f301b6 accel/qaic: Address potential out-of-bounds read in resp_worker()
    3fe8a33715265 drm/virtio: Fix a NULL vs ERR_PTR() bug in virtio_gpu_user_framebuffer_create()
    541fc6f733b32 EDAC/device_sysfs: Use kstrtouint() for poll_msec to prevent truncation
    9a5b471f95dd4 EDAC/igen6: Fix channel address decode for non-hash mode
    c359c9c9c9f8a EDAC/igen6: Fix channel selection hash
    149df8bf827f3 EDAC/igen6: Fix interleave boundary condition
    d019542ed3324 ARM: ensure interrupts are enabled in __do_user_fault()
    ec9f166e6573c ARM: 9484/1: enable interrupts when unhandled user faults are triggered
    881c5b1faf110 Revert "Bluetooth: btusb: Add ASUS USB-BT540 for Realtek 8761CU"
    8a69620b23e7b Revert "Bluetooth: btusb: Add ASUS USB-BT600 for Realtek 8761CU"
    5b0953f86d658 mm/damon/core: avoid infinite kdamond_merge_regions() internal loop
    258d54030481f of: dynamic: Fix overlayed devices not probing because of fw_devlink
    6fda5c51b8e43 af_unix: Unlink scc_entry in unix_del_edge().
    5a0367bf5ce42 ksmbd: use memcmp() to compare ClientGUIDs
    90703664dbc5a ASoC: meson: aiu: Validate written enum values
    c405b07246bf1 ASoC: topology: Check PCM and DAI name strings before use
    7907a395701b3 ipv4: fib: Don't dump dying fib_info in fib_leaf_notify().
    ff6c5ee77dcc9 bpf: Guard __get_user acesss with access_ok for uprobe_multi data
    00444baa8f74d RDMA/bnxt_re: Proper rollback if the ioremap fails
    dd3c9e1c9858c coresight: platform: defer connection counter increment until alloc succeeds
    43ddbcdc0ed74 sctp: fix err_chunk memory leaks in INIT handling
    6181239115e19 bpf: Mask pseudo pointer values in verifier logs
    7250b6b5ba9b7 Bluetooth: ISO: fix malformed ISO_END/CONT handling
    93580911f02d1 tipc: fix integer overflow in tipc_recvmsg() and tipc_recvstream()
    3c0bc7dcc5f92 net: drop_monitor: fix info leak in NET_DM_ATTR_PAYLOAD
    0da8f531336b2 drop_monitor: fix size calculations for 64-bit attributes
    3454c729ee8aa drop_monitor: perform u64_stats updates under IRQ-disabled section
    c4bb894362d22 ppp_async: drop the errored frame instead of resetting its headroom
    16110d1a0e95a wifi: mt76: mt7921: skip unknown CLC firmware records
    740272d46ffc8 wifi: mt76: mt7921: validate CLC firmware records
    5ffe08b81a74d tracing/histograms: Simplify last_cmd_set()
    9cd6d714d3ca0 ksmbd: remove stale channels from all sessions on teardown
    a2ac6a057409d firmware: stratix10-svc: fix FCS SMC call kernel-doc
    3b9aa62d78ce8 netfilter: nfnetlink_log: wait for rcu grace period before freeing pernet state
    8138a6951111d ASoC: amd: yc: Add DMI quirk for HyperX OMEN Gaming Laptop 16-ap1xxx
    6b450c277c106 scsi: core: Do not block on tag allocation in scsi_eh_lock_door()
    7c8b6b4d6f9de ASoC: rt5645: Perform the initial jack detect at probe
    64f3ffba03b37 spi: dw: fix wrong RX_SAMPLE_DLY setting after resume
    0737441d20b34 hwmon: (corsair-psu) Fix linear11 calculation
    be2636e1b21fe vhost-scsi: flush backend after device ioctls
    37d743def9b6b ASoC: amd: yc: Add DMI quirk for HP Victus Laptop 16-e1xxx
    887c8a9635dcb Drivers: hv: vmbus: add VTL2 redirect connection ID
    b44293b1598fa ALSA: usb-audio: Add quirk for Corsair Virtuoso (later revision)
    30d1d9f349546 Bluetooth: RFCOMM: validate skb length in rfcomm_recv_frame
    d01f1600e8b07 wifi: cfg80211: validate IEs in cfg80211_wext_siwgenie()
    3a4a34a732e8a cifs: validate idmap key payload length
    cf8497dc74b3c powerpc/pseries: Ensure vpa,slb_shadow & dtl are unregistered during crash
    07c121859d49e ice: pass the return value of skb_checksum_help()
    ce1b98bfe0cdb ALSA: hda/realtek: Add mute LED quirk for HP Laptop 14s-dr1xxx
    b0cd3daf4710e ALSA: usb-audio: Add dB map quirk for Razer Barracuda X 2.4
    f4e8477e7af81 phonet: check register_netdevice_notifier() error in phonet_device_init()
    8add43887cca1 drm/gma500: return errors from Oaktrail HDMI I2C reads
    4a19bb1c45667 ksmbd: preserve VFS inherited POSIX ACL mask
    6f6368b20f8c9 wifi: mac80211_hwsim: reject undersized HWSIM_ATTR_TX_INFO
    97aa48806d90e regulator: core: clamp voltage constraints before applying apply_uV
    cf87ef1e62ed3 smb: client: bound dirent name against end of SMB response in cifs_filldir
    063b26637dcb2 wifi: mwifiex: replace one-element arrays with flexible array members
    a273c0336699e ALSA: hda/realtek: Add HDA_CODEC_QUIRK for Samsung 750XBE/730XBE
    9096509e63ddd wifi: iwlwifi: acpi: validate WGDS table revision index
    a5af3b3e76760 ALSA: usb-audio: Add FIXED_RATE quirk for JBL Quantum650 Wireless
    4cfadb2e01566 wifi: iwlwifi: bound aligned TLV advance in FW parser
    e9b2633918c73 ALSA: hda/realtek: Add quirk for HP Pavilion x360
    2750f52b58d92 drm/amd/pm/si: Don't schedule thermal work when queue isn't initialized
    c8e84e292ed4c arm64: kprobes: Allow reentering kprobes while single-stepping
    35f991d685fea wifi: iwlwifi: mvm: fix out-of-bounds tid_data access in BA notif
    0f690fd3b5535 wifi: iwlwifi: mvm: add a check on the tid coming from the firmware
    861bd61732148 arm64: fixmap: Allow 256K early_ioremap() at any offset
    3ea815f401652 wifi: iwlwifi: mvm: fix a possible underflow
    216e469586057 smb/client: flush dirty data before punching a hole
    c3650be82ef6e blk-cgroup: fix leaks and online flag on radix_tree_insert failure
    7e307cbae23d9 ALSA: hda/realtek: Add quirk for HP EliteBook 830 G8 (8AB8) to enable mute LEDs
    05f79cea3b15c wifi: iwlwifi: mvm: fix sched scan IE sizing
    7a2d4efea2c41 wifi: iwlwifi: mvm: fix an off-by-1 boundary check
    0bc25f0a2d1b3 btrfs: fix reloc root cleanup in merge_reloc_roots()
    f9938eb95e2dd wifi: iwlwifi: mvm: validate sta_id in BA window status notif
    091e097c2f829 spi: dw-dma: Wait for controller idle before completing Tx
    a01837ae174a2 btrfs: fix use-after-free on reloc root after error in insert_dirty_subvol()
    6d04872f36e83 btrfs: only account delalloc bytes for regular file inodes in btrfs_getattr()
    8db6d96ac93f4 ALSA: hda/realtek: Fix speakers on MECHREVO WUJIE Series
    631b292f93a3d smb/client: reduce fallocate zero buffer allocation
    f08d7f3c91633 wifi: rsi: validate beacon length before fixed buffer copy
    ecb48c6b9edc7 netfilter: ipset: mark the rcu locked areas properly
    0b61c465ea620 wifi: libipw: fix key index receive bound checks
    fbbdda4753ec3 gpio: dwapb: Mask interrupts at hardware initialization
    6bdf4dcff98df wifi: cfg80211: validate rx/tx MLME callback frame lengths before access
    9c4ace62a7511 ksmbd: validate SID namespace before mapping IDs
    e790f72f2c99e ksmbd: mark invalid session responses as signed
    47b018dba6ec7 ksmbd: find bound sessions during reauthentication
    71be658246c90 wifi: cfg80211: validate assoc response length before status and IE access
    b657cc98d7936 wifi: libertas: reject short monitor TX frames
    5207727e53fba wifi: rsi: avoid reading TKIP MIC keys for non-TKIP ciphers
    a78689e2beed2 wifi: mac80211: validate deauth frame length before reason access
    6acaf2d10ad1c wifi: ralink: RT2X00: init EEPROM properly
    319393151367e ALSA: usb-audio: caiaq: validate EP1 reply lengths
    58b767c74930a ksmbd: fix credit charge calculation for SMB2 QUERY_INFO
    717db0d436875 drm/amdgpu: flush pending RCU callbacks on module unload
    4a69504f5d691 ASoC: amd: yc: Add Alienware m15 R7 AMD to DMIC quirk table
    246098a2b8e88 cachefiles: Fix double fput
    720554c04acba xen/gntalloc: validate grant count before allocation
    7ada9807e3710 freevxfs: don't BUG() on unknown typed-extent type
    ac97b55d9e989 xen/front-pgdir-shbuf: free grant reference head on errors
    edc17db830856 ksmbd: Fix acl.sd_buf memory leak and invalid sd_size error handling
    aa9bd2c8513e4 ksmbd: fix n.data memory leak in ksmbd_vfs_set_dos_attrib_xattr
    43658ba7f701e drm/arm/komeda: fix error handling for clk_prepare_enable() and callers
    c866c3314a685 ksmbd: fix sd_ndr.data memory leak in ksmbd_vfs_set_sd_xattr
    b7f3ee925aee9 netfilter: nf_conntrack_expect: zero at allocation time
    223bf70736b49 drm/arm/malidp: use clk_bulk API in runtime PM resume and suspend
    4cb41f07685f8 btrfs: tree-checker: validate INODE_REF's namelen
    1cc84ca8599b8 spi: core: Abort active target transfer on controller suspend
    2b3c4c381fb23 fbdev: pm2fb: unwind WC setup on probe failure
    69aea5ee498fb eth: mlx5: fix macsec dependency
    42a37f4a89665 rtc: bq32000: add delay between RTC reads
    e6a404ac2a1e8 blk-cgroup: protect iterating blkgs with blkcg->lock in blkcg_print_stat()
    e1b5a13249975 net: au1000: move free_irq out of the close-time spinlocked section
    8efa52abbff2e regulator: da9121: Use subvariant ids in the I2C table
    249be9b5704d4 PCI/sysfs: Use kstrtobool() to parse the ROM attribute input
    aa1ad3c1f3976 PCI/proc: Fix race between pci_proc_init() and pci_bus_add_device()
    4114c357386d7 ksmbd: treat read-control opens as stat opens only for leases
    3df8918da4630 ksmbd: break RH leases before delete-on-close
    9e2cccbbf3b63 ksmbd: start file id allocation at 1
    5c37c7275d757 ksmbd: deny renaming directory with open children
    52bceb4629bf4 ksmbd: apply create security descriptor first
    58a0a1c399a08 ksmbd: treat unnamed DATA stream as base file
    3b64cae18fd79 ksmbd: use connection ClientGUID for lease lookup
    3281d27b4d974 ksmbd: align SMB2 oplock break ack handling
    223a923582afa ksmbd: validate SMB2 lease create contexts
    17699905a3816 ksmbd: fix lease break and ack state handling
    52fa4ba4268ce rtc: aspeed: add AST2700 compatible
    aee4e6de71ca7 f2fs: validate inline dentry name lengths before conversion
    2fdc51228d9a8 md/raid5: let stripe batch bm_seq comparison wrap-safe
    fc0fab337d554 md/raid5: account discard IO
    31e33dcc89652 PCI: mediatek: Protect root bus removal with rescan lock
    5d566ac3a055f PCI: rockchip: Protect root bus removal with rescan lock
    4b69c63cc247f PCI: altera: Protect root bus removal with rescan lock
    aaf4153caed9f PCI: iproc: Protect root bus removal with rescan lock
    53da3557621a3 ALSA: usb-audio: Add quirk for YAMAHA CDS3000
    67a5885f846b0 drm/amdgpu: Use system unbound workqueue for soft IH ring
    89ed4a0ce8beb drm/amdkfd: check find_first_zero_bit before __set_bit on kfd->doorbell_bitmap
    d51841bb5ceee drm/amdkfd: Let driver decide buffer size at AMDKFD_IOC_GET_DMABUF_INFO ioctl
    af84fb6ac0cb7 mfd: rsmu: Add 8a34002 support
    9e54c47bc8407 mfd: tps65219: Make poweroff handler conditional on system-power-controller
    31aab1e3d0f3a leds: pca9532: Don't stop blinking for non-zero brightness
    9f0d6bb71a6bc leds: uleds: Return -EFAULT on copy_to_user() failure
    804302aca977b ALSA: hda/conexant: Add pin config quirk for Lenovo IdeaPad Slim 5 16AKP10
    e26aa709454d4 tls: reject the combination of TLS and sockmap
    1d8050de0ca2a ALSA: usb-audio: Add quirk flags for SC13A
    359b3442e66c5 spi: Add NULL check for spi_get_device_id() in spi_get_device_match_data()
    12e4118b5b4f8 gpio: pisosr: Read "ngpios" as u32
    111b36e7b6dc6 scsi: bfa: Reduce kernel stack usage in bfa_fcs_lport_fdmi_build_portattr_block()
    f58daade5963a fuse: set ff->flock only on success
    5d7637f4d050d HID: hidpp: fix potential UAF in hidpp_connect_event()
    97313af1820db ALSA: hda/realtek: Add quirk for Lenovo Xiaoxin 14 GT
    71fcc902af9c2 sparc: Disable compat support with LLD
    737a90fcd99d1 i3c: mipi-i3c-hci: Tolerate i3c_master_add_i3c_dev_locked() failures in DAA
    cfa09f63e75cf smb: client: fix races in cifsd thread creation
    ea0af96a1b939 net/sched: act_csum: don't mangle UDP tunnel GSO packets
    f948534a042fa e1000e: limit endianness conversion to boundary words
    76e678bdc5170 vsock: use sk_acceptq_is_full() helper in all transports
    af16e8f97c622 ptp: ocp: add shutdown callback
    74dbb85a6a254 net: stmmac: xgmac2: disable RBUE in default RX interrupt mask
    665089ff4f8a2 sparc64: uprobes: add missing break
    01e350c0641f5 Bluetooth: btusb: Add TP-Link UB600 for Realtek 8761BUV
    98deaf6117195 ASoC: rockchip: spdif: Restore regcache cache-only mode on sync failure
    1994a4bdaa7fc ASoC: rockchip: rockchip_pdm: Reorder clock enable sequence
    7f0fd754c7087 ASoC: rockchip: rockchip_pdm: Handle runtime PM resume failures in set_fmt
    72e26293a231f Bluetooth: L2CAP: validate connectionless PSM length
    c8d249de9e97d Bluetooth: btusb: Add support for TP-Link TL-UB250
    e86071156ea99 Bluetooth: btusb: Add Mercusys MA530 for Realtek RTL8761BUV
    fa9d74b9bb0cd spi: xilinx: let transfers timeout in case of no IRQ
    23f05d42f189d hwmon: (pmbus/lm25066) Fix PMBus coefficients for LM5064/5066/5066i
    3c8c0c786f3f0 dmaengine: dw-axi-dmac: fix PM for system sleep and channel alloc
    58d882c723ae9 PCI: Avoid SBR for Qualcomm WCN6855/WCN7850 WiFi, SDX62/SDX65 modems
    f2db152beb06c sctp: Unwind address notifier registration on failure
    5488e2706c584 nvme-fc: Do not cancel requests in io target before it is initialized
    8cd46f24e8411 platform/x86: intel-hid: Add HP ProBook x360 440 G1 to button_array_table
    4ecbe6a5ac28e ata: libata-pmp: add JMicron JMS562 quirk
    58ae36b6f20c7 ALSA: hda/realtek: Add quirk for Lenovo Yoga Pro 7 14IRH8
    21730289e0af9 ALSA: hda/realtek: Add quirk for HP 255 15.6 inch G9 Notebook PC
    ba180821a4e23 vdpa/ifcvf: handle dev_set_name() failure in ifcvf_vdpa_dev_add()
    a432bf58906b7 net: dsa: qca8k: Add support for force mode for fixed link topology
    86ace5b321108 hwmon: (adt7462) Add of_match_table to support devicetree
    1a6c92aa7242a btrfs: protect sb_write_pointer() with invalidate lock
    d51ba5fe3459b wifi: mt76: transform aspm_conf for pci_disable_link_state
    466e727a3481b platform/x86: dell-laptop: add Inspiron N5110 to touchpad LED quirk table
    7521c2e260855 tls: Flush backlog before waiting for a new record
    f0399b3e21274 net: ibm: emac: mal: fix potential system hang in mal_remove()
    f38f5acb4942f configfs_depend_prep(): pass configfs_dirent instead of dentry
    0d099caebc3e0 xprtrdma: Add request-pool slack for delayed recycling
    b042b4947752d RDMA/rtrs-srv: Fix integer underflow in process_read and process_write
    f556c3d4d64dc NFS: fix eof updates after NFSv4.2 fallocate/zero-range
    ba6c4fc662853 btrfs: tree-checker: validate names in ROOT_REF and ROOT_BACKREF
    81a664ed8b1a4 btrfs: balance: fix potential bg lookup failure in btrfs_may_alloc_data_chunk()
    0d5ad732e4fdc netfilter: nf_conntrack: use get_unaligned_be32() in tcp_sack()
    91c97a7969dae ALSA: es18xx: check control allocation before private data setup
    a7625d408f7f0 net: microchip: sparx5: clean up PSFP resources on flower setup failure
    016b8eaca53bf hsr: broadcast netlink notifications in the device's net namespace
    8af61d5bd87fd net: cpsw_new: unregister devlink on port registration failure
    31377675c3d75 bpf: NUL-terminate replaced sysctl value
    b1e111f93deef RDMA/mlx5: Fix state and counter desync on loopback enable failure
    e9bbb5f5349ef RDMA/umem: Be careful about boundary conditions in ib_umem_find_best_pgsz()
    2095eceaedddf wifi: nl80211: Increase ie_len size to prevent truncated IEs in new peer notifications
    641be20110cdf drm/amdkfd: Unwind debug trap enable on copy_to_user failure
    5eade80288a03 ipmi: si: Use platform_get_irq_optional() to retrieve interrupt
    3b389d479f831 ALSA: hda/realtek: Add quirk for ASUS VivoBook X509DAP
    fd36e829eb3c1 clk: keystone: don't cache clock rate
    0e646d3912ff5 net/mlx5: E-Switch, align disable sequence with switchdev-to-legacy transition
    025293b9d0cf6 RDMA/irdma: Fix typo in SQ completions generation
    4a1b0a4c5acbe drm/amdgpu: fix buffer overflow during vBIOS update
    9b5cb2e4eb297 drm/amd/pm: bound pp_dpm_set_pp_table() memcpy
    090b51e2dabf8 drm/amdkfd: fix UAF race in destroy_queue_cpsch
    fec259e46d443 xhci: Prevent queuing new commands if xhci is inaccessible
    97c2c0b1233b3 thermal/drivers/qcom/tsens: Atomic temperature read with hardware-guided retries
    c996faba71fc4 dpaa2-switch: fix handling of NAPI on the remove path
    d0e54098c072b net: dsa: sja1105: flower: reject cross-chip redirect
    259ad6093204b dpaa2-switch: fix the error path in dpaa2_switch_rx()
    dc626f2abb305 dpaa2-switch: rework FDB management on the bridge leave path
    2922cf2583e59 ALSA: seq: oss: Reject reads that cannot fit the next event
    a92d497bc768e ASoC: codecs: rk3328: Use managed GPIO and clock helpers
    2f7d0ec8c10dc ntfs3: fix out-of-bounds read in ntfs_dir_emit() and hdr_find_e()
    d564a885219a6 fs/ntfs3: validate index entry key bounds
    fdc9f65aa6631 fs/ntfs3: preserve non-DOS attribute bits in system.dos_attrib
    fce90e41601e3 iommu/rockchip: disable fetch dte time limit
    356a4983340df net: wwan: t7xx: Add delay between MD and SAP suspend
    f76a39c45182d net: qrtr: fix node refcount leak on ctrl packet alloc failure
    6b6be7328f2b2 ACPI: PCI: Clear _DEP dependencies after PCI root bridge attach
    6d29b91164424 ata: ahci: fail probe if BAR too small for claimed ports
    0ccf0d4dddbe5 ASoC: codecs: pcm3168a: Drop CONFIG_PM-conditional preproc directive
    43cb6295c3a6d ASoC: qcom: q6apm: return error code to consumers on failures
    b4ef30f1d107a wifi: ath11k: fix invalid data access in ath11k_dp_rx_h_undecap_nwifi
    b511b56f63daa net: ibm: emac: Reserve VLAN header in MJS limit
    bc6e3444a6d7a libbpf: Also reset {insn,data}_cur on realloc failure
    da92b1a8560a5 iio: accel: mma8452: switch to non-devm request_threaded_irq()
    d85b5591ea459 perf/ftrace: Fix WARNING in __unregister_ftrace_function
    2c2d63f410557 iio: light: stk3310: Deal with the ps interrupt issue in PM
    b5fa000eaf6bb mmc: renesas_sdhi: Add OF entry for RZ/G2E SoC
    3657383a477ab tracing: Disable KCOV instrumentation for trace_irqsoff.o
    345b1dfa73be0 mmc: renesas_sdhi: Add OF entry for RZ/G2N SoC
    cfc0b65a29b41 mmc: davinci: fix mmc_add_host order in probe
    86ac37d42a8b1 soundwire: only handle alert events when the peripheral is attached
    c8abef7c07c10 gfs2: page poisoning fix
    26532163b3cef soundwire: dmi-quirks: Disable ghost Realtek devices
    5cdfd851fa205 libbpf: Add __NR_bpf definition for LoongArch
    1bdf84bbe14a7 ASoC: Intel: catpt: Complete coredump handling
    feb1ad41281ae drm/nouveau/gsp: add SEC2 to GA100 chip table
    c6ad6451f88f0 scripts: modpost: detect and report truncated buf_printf() output
    74bd1f05d9ba2 host1x: bus: Fix missing ops null check in error teardown
    37acac6d2d6d3 pinctrl: renesas: rzv2m: Use -ENOTSUPP instead of -EOPNOTSUPP
    1ca2411d90c85 hfs: rework hfsplus_readdir() logic
    38ee32a9ace6f ACPICA: add boundary checks in two places
    50a11e2f3dc8a ACPICA: Enhance buffer validation in acpi_ut_walk_aml_resources()
    08c5dee5da1d8 ACPICA: Fix NULL pointer dereference in acpi_ns_custom_package()
    e301b6132be06 ACPICA: Enhance OEM ID and Table ID validation in acpi_ex_load_table_op()
    26dd27000e954 ACPICA: Add validation for node in acpi_ns_build_normalized_path()
    2442772fd79a4 ACPICA: Add package limit checks in parser functions
    254e304f68dc0 ACPICA: validate handler object type in two places
    72d75287bc6d6 ACPICA: Improve argument parsing in acpi_ps_get_next_simple_arg()
    4532c9cf006bb ACPICA: Fix integer overflow in acpi_ex_opcode_3A_1T_1R() (mid_op)
    c2cf936b07b0a ACPICA: Prevent adding invalid references
    6e0d26e6ec903 ACPICA: validate byte_count in acpi_ps_get_next_package_length()
    7d97ecf2a4c7a ACPICA: add boundary checks in acpi_ps_get_next_field()
    63ca6f67816a2 ACPICA: Fix use-after-free in acpi_ds_terminate_control_method()
    4c22c9842c53b ACPICA: Fix condition check in acpi_ps_parse_loop()
    121352772b326 drm/amd/pm/si: Fix updating clock limits from power states
    c8bc44a1d86d5 net: thunderx: fix PTP device ref leak in nicvf_probe()
    f601ec5c92b32 ipv6: addrconf: fix temp address generation after prefix deprecation
    f5d3088e1a9f3 net: hsr: require valid EOT supervision TLV
    52c61420923e4 ALSA: usb-audio: Add quirk for Novation Mininova
    4761493dd6634 irqchip/gic-v4: Don't advertise VLPIs if no ITS is probed
    566b1fc9a4fb8 iio: adc: qcom-spmi-iadc: balance enable_irq_wake() on driver unbind
    df904e01b710f mips: cps: Assemble jr.hb with an R2 ISA level
    cf82a9d15ae69 drm/panel: simple: Add AM-1280800W8TZQW-T00H
    a643ce49ddcdb thermal/drivers/tegra/soctherma: Switch to devm cooling device registration
    99a1ae9c1e058 clk: socfpga: agilex: implement l3_main_free_clk
    ff8e9b793effc s390/zcore: Removed unused variables
    2e6b5c4b59351 rds: annotate data-race around rs_seen_congestion
    65fae4b42269d rds: filter RDS_INFO_* getsockopt by caller's netns
    4892962af7896 netlabel: fix IPv6 unlabeled address add error handling
    4cf3a3f61c88c wifi: rtw89: pci: enable LTR based on pcie control register
    df2f6c977a94a rcu-tasks: Fix possible boot-time tests failed for the call_rcu_tasks()
    47850643464ba char/nvram: Remove redundant nvram_mutex
    cd4f278f30021 usb: host: add ARCH_AIROHA in XHCI MTK dependency
    03ed804a0ddc3 serial: 8250: fix possible ISR soft lockup
    99fcf2d8daf24 usb: gadget: aspeed_udc: avoid past-the-end iterator in dequeue
    c055449f384b1 USB: cdc-acm: start bulk-IN polling when ALWAYS_POLL_CTRL is set
    a018d4195114c usb: gadget: goku_udc: avoid NULL deref of dev->driver in INT_USBRESET log
    d0291fb4d9198 usb: core: hcd: fix possible deadlock in rh control transfers
    517c353e5358b usbip: vhci_hcd: fix NULL deref in status_show_vhci
    28d1f6aa14f59 isofs: handle set_blocksize failures
    29186cd17bb5f omfs: handle set_blocksize failures
    0451927f42b02 hpfs: handle set_blocksize failures
    87d6852f06c5a jfs: handle set_blocksize failures
    f83e416c2242f qnx4: handle set_blocksize failures
    8e788c14b72d6 minix: handle set_blocksize failures
    8a96010d230a8 bfs: handle set_blocksize failures
    ea8a4a9f3cc10 affs: handle set_blocksize failures
    df9dac4dbe557 ntfs3: handle set_blocksize failures
    ceb89faa8ead6 befs: handle set_blocksize failures
    07a348d48e589 net/rds: Don't sleep inside rds_ib_conn_path_shutdown
    4fc0430de152f net/sched: sch_drr: make cl->quantum lockless
    f0018acf0b66f net: bridge: remove stale rcu_barrier() in br_multicast_dev_del()
    513cab0e49ebe net: usb: qmi_wwan: add MeiG SRM813Q
    ac8cc00c0fb60 nvme-core: align fabrics_q teardown with admin_q in nvme_free_ctrl
    b4d8264ca70f3 bitfield: wire __bf_shf to __builtin_ctzll
    85cbb946b9c59 thunderbolt: Verify Router Ready bit is set after router enumeration
    5428342dd66ed thunderbolt: Increase timeout for Configuration Ready bit
    c0742f23ec13f firmware: arm_scmi: Validate BASE_ERROR_EVENT payload size
    1bbe431fc5970 firmware: arm_scmi: Validate SENSOR_UPDATE payload size
    7496466121155 thunderbolt: Improve multi-display DisplayPort tunnel allocation
    a13e408c554be thunderbolt: Don't access path config space on Lane 1 adapters in tb_switch_reset_host()
    de4b7f9bfee2c bridge: Add missing READ_ONCE() annotations around FDB destination port
    4904370513ad6 9p: use kvzalloc for readdir buffer
    c2319e1cfb78c arm64/daifflags: Make local_daif_*() helpers __always_inline
    b6b5175b4da92 9p: invalidate readdir buffer on seek
    3167b620815c4 sched/fair: Reject misfit pulls onto busy SMT siblings on asym-capacity
    d04cff45c9d2a ALSA: usx2y: Drain pending US-428 pipe-4 output commands
    3d2ddfc9b361b drm/amdkfd: Check bounds on allocate_doorbell
    e2bef0f168be4 drm/amdkfd: Fix OOB memory exposure in get_wave_state()
    25e1b29ecc8da drm/amdkfd: Check bounds for allocate_sdma_queue restore_sdma_id
    c1797a31c5fe8 PCI: Wait for device readiness after D3hot -> D0uninitialized transition
    bb42eed92e401 mailbox: Make mbox_send_message() return error code when tx fails
    91c6fdcdf22bd RDMA/mlx5: Use QP port when decoding responder CQEs
    0a996ad14fbbb media: imon: Add iMON VFD HID OEM v1.2 key mappings
    c4f2d6c924263 crypto: atmel-ecc - add support for atecc608b
    bec33e03d2244 crypto: ecc - Unbreak the build on arm with CONFIG_KASAN_STACK=y
    3b3ae5517658a scsi: pm8001: Reject non-fatal dump when controller is crashed
    cb789c65aa703 scsi: pm8001: Reject firmware update in fatal error state
    e4fe7a56992ee clk: samsung: exynos850: mark APM I3C clocks as critical
    959913c0d51e1 soundwire: intel: Move suspend tracking from trigger to pm suspend
    c0cbb58df7d21 drivers/of: validate status properties in reconfig state changes
    a6ce8632fbdc0 integrity: Check for NULL returned by asymmetric_key_public_key
    32ff92cc9f91e net: dsa: realtek: rtl8365mb: add support for RTL8367SB
    72bf6944e336d wifi: rtw89: phy: check length before parsing PHY status IE
    b7afb0c24a761 media: video-i2c: use vb2_video_unregister_device on driver removal
    3d2ac2f6ed2e2 drm/gud: Add RCade Display Adapter VID/PID pair
    9eb4ca55f5b61 net: phy: motorcomm: use device properties for firmware tuning
    bfdb4d0fab516 hfsplus: rework hfsplus_readdir() logic
    03505f0c7c277 PCI: intel-gw: Enable clock before PHY init
    dc4fd6c0d9323 drm/amd/display: Fix CRC open failure during active rendering
    3c5e3e5badbf0 mmc: davinci: avoid NULL deref of host->data in IRQ handler
    a8283f7d93f0d mmc: core: Add validation for host-provided max_segs
    120c4c6e07f94 ASoC: ti: omap3pandora: update board check to use DT compatible
    38570c33dc367 drm/bridge: tc358768: Set pre_enable_prev_first for reverse order
    1b793329699b5 clk: renesas: cpg-mssr: Add number of clock cells check
    827c30511b02a crypto: omap - add omap_des_unregister_algs helper
    8c37bc8d6a6f7 crypto: ixp4xx - fix buffer chain unwind on allocation failure
    c75237294a70d media: em28xx-video: fix missing res_free() on init_usb_xfer failure
    0d252fe2012d9 net: dsa: mv88e6xxx: enable .rmu_disable() for 6320 family
    2381e99226b53 net: dsa: mv88e6xxx: define .pot_clear() for 6321
    c43bc7bd2e68a PCI: switchtec: Add Gen6 Device IDs
    d2c97bf5b1ff2 net: dsa: mv88e6xxx: fix number of g1 interrupts for 6320 family
    b6327023dcc74 media: dm1105: fix missing error check for dma_alloc_coherent
    bed89ef877c9e thunderbolt: Don't create multiple DMA tunnels on firmware connection manager
    83d1af5b1b6e6 thunderbolt: Set tb->root_switch to NULL when domain is stopped
    b61a4ae2ec6a0 thunderbolt: Keep the domain reference while processing hotplug
    57359bb31526c thunderbolt: Keep XDomain reference during the lifetime of a service
    9d6657674919b thunderbolt: Release request if tb_cfg_request() fails in __tb_xdomain_response()
    f5e6286350c86 media: rc: mceusb: Add support for 04eb:e033
    d9fa79ccd0920 spi: spi-qcom-qspi: Fix incomplete error handling in runtime PM
    71ab6046cb940 soundwire: validate DT compatible before parsing it
    827d1eebd5f24 bridge: Do not suppress ARP probes and DAD NS unconditionally
    b9efc7bdadca8 firmware: stratix10-svc: change get provision data to async SMC call
    ad65a12f6a0a4 kcsan: Silence -Wmaybe-uninitialized when calling __kcsan_check_access()
    0b58a5ac9170a wifi: rtw88: Add NULL check for chip->edcca_th in rtw_fw_adaptivity_result()
    adf23deb60387 wifi: mac80211: always allow transmitting null-data on TXQs
    8fe5eb7b68d76 wifi: nl80211: reject beacons with bad HE operation
    5a46a1b5dcbae hfsplus: fix issue of direct writes beyond end-of-file
    0f8a92c198893 PCI: Stop setting cached power state to 'unknown' on unbind
    5a99d68c32927 tools/nolibc: avoid call to wcslen() in _start_c() inserted by clang
    e9260bc729335 tee: optee: Allow MT_NORMAL_TAGGED shared memory
    11c633d24780a usb: gadget: udc: skip pullup() if already connected
    8c77312728d07 ima: return error early if file xattr cannot be changed
    c6dfcaea6d3ae ALSA: usb-audio: Propagate write errors in generic mixer put callbacks
    5a7c355f83c63 drm/amd/pm: Check SMUv13.0.6/12 metrics integrity
    e0ae7248bae11 drm/panel: jadard-jd9365da-h3: set prepare_prev_first
    3ad0c3cf4a163 drm/amd/display: Fix DPMS using partially updated pipe context
    82f51c4addcac bus: fsl-mc: wait for the MC firmware to complete its boot
    30cd0f44e983e drm/gem: Consider GEM object reclaimable if shrinking fails
    892f643b141ae ksmbd: fix use-after-free in oplock break notification

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index 8a31bbfd09a..3c91a4ba7a5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9b87590f4fb1e0d54ae9153f9e4fe84cec61f13e"
-SRCREV_meta ?= "0d175695cbfd92999ee910a0535f01cbcbe7a0f8"
+SRCREV_machine ?= "aafd2f2dba2b549d89a66f79826d770742d968ab"
+SRCREV_meta ?= "3254590036234c69bdd4cbc92af14a8178fc64ef"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.157"
+LINUX_VERSION ?= "6.6.159"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 3904ba1d1c6..1b06d1e35fb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.157"
+LINUX_VERSION ?= "6.6.159"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a56c1dbe33dcd7b71df3b2703ceb95692edd9579"
-SRCREV_meta ?= "0d175695cbfd92999ee910a0535f01cbcbe7a0f8"
+SRCREV_machine ?= "7d022d231f699d2c767d88bb1fa305550ca68e01"
+SRCREV_meta ?= "3254590036234c69bdd4cbc92af14a8178fc64ef"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index da3c5dd6ea6..601eb925955 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "f762f9a437240aebfb663b9f08166b6978411ad3"
-SRCREV_machine:qemuarm64 ?= "efde6579b1968f396f4718ad939aeb6859f17012"
-SRCREV_machine:qemuloongarch64 ?= "a353a9563cf1625b98d7f33ec845d25cbdef12b6"
-SRCREV_machine:qemumips ?= "d7bc8d3db82714ebe46bde3e69f9dcbef7ae6e48"
-SRCREV_machine:qemuppc ?= "b8bafdf6f040163a1fe0eb91c7b419452e3590b4"
-SRCREV_machine:qemuriscv64 ?= "a353a9563cf1625b98d7f33ec845d25cbdef12b6"
-SRCREV_machine:qemuriscv32 ?= "a353a9563cf1625b98d7f33ec845d25cbdef12b6"
-SRCREV_machine:qemux86 ?= "a353a9563cf1625b98d7f33ec845d25cbdef12b6"
-SRCREV_machine:qemux86-64 ?= "a353a9563cf1625b98d7f33ec845d25cbdef12b6"
-SRCREV_machine:qemumips64 ?= "fa48e020815730c4ff228c0e8d42836d68ac4b4b"
-SRCREV_machine ?= "a353a9563cf1625b98d7f33ec845d25cbdef12b6"
-SRCREV_meta ?= "0d175695cbfd92999ee910a0535f01cbcbe7a0f8"
+SRCREV_machine:qemuarm ?= "9d17d5c9ac32b38ca5186199ed824b43f3d4308b"
+SRCREV_machine:qemuarm64 ?= "857114866d2445d49024c9ef1ec710a7ef291a5b"
+SRCREV_machine:qemuloongarch64 ?= "f175bcee52358aef9b53e1ddc5300e65735226ac"
+SRCREV_machine:qemumips ?= "2349f4c462400a8fb6f95c6bc0fbbdf959b2cb18"
+SRCREV_machine:qemuppc ?= "47e791b3b9f786f926e66a672c524c1e858c76c1"
+SRCREV_machine:qemuriscv64 ?= "f175bcee52358aef9b53e1ddc5300e65735226ac"
+SRCREV_machine:qemuriscv32 ?= "f175bcee52358aef9b53e1ddc5300e65735226ac"
+SRCREV_machine:qemux86 ?= "f175bcee52358aef9b53e1ddc5300e65735226ac"
+SRCREV_machine:qemux86-64 ?= "f175bcee52358aef9b53e1ddc5300e65735226ac"
+SRCREV_machine:qemumips64 ?= "a77a45b7cea3e691d2dafca4d9bdbaa60d134617"
+SRCREV_machine ?= "f175bcee52358aef9b53e1ddc5300e65735226ac"
+SRCREV_meta ?= "3254590036234c69bdd4cbc92af14a8178fc64ef"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "79643295eba17affbd16ca97f3ef04c90266b28c"
+SRCREV_machine:class-devupstream ?= "cecd39af8a1ab81373fd9fa765b2f7ab73becaad"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.157"
+LINUX_VERSION ?= "6.6.159"
 
 PV = "${LINUX_VERSION}+git"
 
