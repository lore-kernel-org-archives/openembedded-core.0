Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40FC3C25B0C
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 22:58:05 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web09.707.1659653875939008826
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:57:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oJEIYqK7;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id a15so924092qto.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 15:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=+s9foGe+2Hv5+m59FfDA0oVJrIBeg1g1hnHIzDUkDqY=;
        b=oJEIYqK7J47r9vfv1bbqFv50wubj5zLM1P8PYn3UN9IMe0T2E2/P9CDGTx0wWBx8jf
         XsY3/SfFbiuqi44VPgJkKXZiKlr5I2mATIKEJ/MNBxqIobffZ3p/pnwpdiAWBsR373Rp
         bplbozevVRK5cF3A5I/WVibouicFdlru8xcj4/Ve8Yn12s65GQDsdjfwx+iRnXPtjU7h
         aNhb4lkMp/ta4G1GaZbJHthJDRbBJ5fGYDQHDEBq/NyiP2EPqYJjaKn8otEPuVhRsJ/p
         59Jj8lkA5AAYcYfBj6jo2HJMH3GusCtmDH6VWqiWg7DmTq5N15/Zabn1giEjtHdlSQu2
         ojug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=+s9foGe+2Hv5+m59FfDA0oVJrIBeg1g1hnHIzDUkDqY=;
        b=xJO4UfI70jB7jRAbIa5JhEPVgD0fsbbfQn+LQz6oY8alG2dR18aCmtoA5X85JFgiOL
         KBYMaiVc/2vLDYM0Kx+hgfjCWA1X61yZue+djUw70cDZ1BKBwab9uR+Z6vObEuBYkHdh
         co4PvncHYewWCqxrGI0q60DAhVtqoPQFkbisCCuYVrvtnkV0iekDLDoguaL3WDEHGpAj
         KnA9qRuF3UAUMyi1cbQ3SXL03sjP6xV8aTmoEcGYtOag2jEXicHsM3WazW+NSHWndWHc
         Dn63COaA25JIXd0+VW0f+JNuSiW/nwjw0/VjDu8AV4bxem6ArswzySw83wJU1456Q6xN
         2G1Q==
X-Gm-Message-State: ACgBeo3YUVS5y9+7VlBX/ApqKvClyYHE8yrm2CCzwvUmQmhJuNh4dCMA
	5FsLdof2bbIhphi+G7prBWWd50jTEJ+/Mw==
X-Google-Smtp-Source: 
 AA6agR711S3f91257doOuBAu5onneTrILzfEiP75vjnjo4nGpqslt1Bwhtmt8Fni/Ix8FyIK+QURsQ==
X-Received: by 2002:a05:622a:1744:b0:342:5d41:43ee with SMTP id
 l4-20020a05622a174400b003425d4143eemr1853645qtk.81.1659653874321;
        Thu, 04 Aug 2022 15:57:54 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 bl38-20020a05620a1aa600b006b8df80471csm1500818qkb.119.2022.08.04.15.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Aug 2022 15:57:52 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 01/13] linux-yocto/5.15: update to v5.15.58
Date: Thu,  4 Aug 2022 18:57:38 -0400
Message-Id: 
 <93ea82f462051878eee12e85de1bb3fc62ceeb1b.1659653543.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1659653543.git.bruce.ashfield@gmail.com>
References: <cover.1659653543.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 22:58:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168865

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    7d8048d4e064 Linux 5.15.58
    c6e4817ab622 drm/amd/display: Fix wrong format specifier in amdgpu_dm.c
    198a6f40822e x86/entry_32: Fix segment exceptions
    ec9ec3bc08b1 drm/amdgpu: Off by one in dm_dmub_outbox1_low_irq()
    e4481000ac68 x86: drop bogus "cc" clobber from __try_cmpxchg_user_asm()
    9444462d6343 KVM: x86: fix typo in __try_cmpxchg_user causing non-atomicness
    b6c24afba608 x86/extable: Prefer local labels in .set directives
    f85a6046f771 drm/amd/display: invalid parameter check in dmub_hpd_callback
    760fe3203493 drm/amd/display: Don't lock connection_mutex for DMUB HPD
    d026ed6eda29 watch-queue: remove spurious double semicolon
    b34229f4b212 net: usb: ax88179_178a needs FLAG_SEND_ZLP
    b2d1e4cd558c tty: use new tty_insert_flip_string_and_push_buffer() in pty_write()
    816c301b6a73 tty: extract tty_flip_buffer_commit() from tty_flip_buffer_push()
    35545303454a tty: drop tty_schedule_flip()
    6219f5b54ad8 tty: the rest, stop using tty_schedule_flip()
    ea255921c4b5 tty: drivers/tty/, stop using tty_schedule_flip()
    ba3a8af8a21a watchqueue: make sure to serialize 'wqueue->defunct' properly
    49338b651f5a x86/alternative: Report missing return thunk details
    8842d5d70713 x86/amd: Use IBPB for firmware calls
    c2b484d784c8 drm/amd/display: Fix surface optimization regression on Carrizo
    958151194858 drm/amd/display: Optimize bandwidth on following fast update
    b3f16976b9ed drm/amd/display: Reset DMCUB before HW init
    4b4b1f8dfeb7 exfat: use updated exfat_chain directly during renaming
    000473ac997a Bluetooth: Fix bt_skb_sendmmsg not allocating partial chunks
    d01605a01f01 Bluetooth: SCO: Fix sco_send_frame returning skb->len
    5ae749f40d01 Bluetooth: Fix passing NULL to PTR_ERR
    367becefb8a1 Bluetooth: RFCOMM: Replace use of memcpy_from_msg with bt_skb_sendmmsg
    1864e820a5ac Bluetooth: SCO: Replace use of memcpy_from_msg with bt_skb_sendmsg
    cb7ed8c7fe5b Bluetooth: Add bt_skb_sendmmsg helper
    a4e8071be337 Bluetooth: Add bt_skb_sendmsg helper
    59f132fda50d um: virtio_uml: Fix broken device handling in time-travel
    38a28bb80f00 um: virtio_uml: Allow probing from devicetree
    d8413b16feee tracing: Fix return value of trace_pid_write()
    d9777061727b tracing: Place trace_pid_list logic into abstract functions
    6107b014163f tracing: Have event format check not flag %p* on __get_dynamic_array()
    621c1d8c1bd1 exfat: fix referencing wrong parent directory information after renaming
    72e0ec16f172 crypto: qat - re-enable registration of algorithms
    e7f979ed51f9 crypto: qat - add param check for DH
    4d6d2adce087 crypto: qat - add param check for RSA
    2488286d3e77 crypto: qat - remove dma_free_coherent() for DH
    6e8606e7ae40 crypto: qat - remove dma_free_coherent() for RSA
    a843925e0287 crypto: qat - fix memory leak in RSA
    ef5594895df2 crypto: qat - add backlog mechanism
    9cac903b6303 crypto: qat - refactor submission logic
    f576c7e01a6a crypto: qat - use pre-allocated buffers in datapath
    343cee3eafda crypto: qat - set to zero DH parameters before free
    c1f6637fe1c2 iwlwifi: fw: uefi: add missing include guards
    4448327b4173 mt76: fix use-after-free by removing a non-RCU wcid pointer
    829baf398f2c xhci: Set HCD flag to defer primary roothub registration
    813f4b49e81c xhci: dbc: Rename xhci_dbc_init and xhci_dbc_exit
    413c5f751f7c xhci: dbc: create and remove dbc structure in dbgtty driver.
    d7afb4a13f6c xhci: dbc: refactor xhci_dbc_init()
    d97c0667c1e6 KVM: x86: Use __try_cmpxchg_user() to emulate atomic accesses
    88eded8104d2 x86/futex: Remove .fixup usage
    6875d2425be8 x86/msr: Remove .fixup usage
    f637fbc7bda6 x86/extable: Extend extable functionality
    4bbc9a07e050 x86/entry_32: Remove .fixup usage
    e89d805e77f2 bitfield.h: Fix "type of reg too small for mask" test
    a86201c3ae79 x86/extable: Provide EX_TYPE_DEFAULT_MCE_SAFE and EX_TYPE_FAULT_MCE_SAFE
    3461326e1a9e x86/extable: Rework the exception table mechanics
    ad2d98ea72d2 x86/mce: Deduplicate exception handling
    3e6392ba3dce x86/extable: Get rid of redundant macros
    d3135da29e1a x86/extable: Tidy up redundant handler functions
    823424905d03 x86/uaccess: Implement macros for CMPXCHG on user addresses
    1062cfb47e56 dlm: fix pending remove if msg allocation fails
    765f802e0d25 x86/bugs: Warn when "ibrs" mitigation is selected on Enhanced IBRS parts
    46d5575df8a1 sched/deadline: Fix BUG_ON condition for deboosted tasks
    bc1fb3c53afd bpf: Make sure mac_header was set before using it
    8c5429a04ccd mm/mempolicy: fix uninit-value in mpol_rebind_policy()
    e91665fbbf3c KVM: Don't null dereference ops->destroy
    58466e053900 spi: bcm2835: bcm2835_spi_handle_err(): fix NULL pointer deref for non DMA transfers
    cd9f96aa8f57 KVM: selftests: Fix target thread to be migrated in rseq_test
    e129e5486b98 gpio: gpio-xilinx: Fix integer overflow
    ce3731c61589 tcp: Fix data-races around sysctl_tcp_max_reordering.
    84cee470f77c tcp: Fix a data-race around sysctl_tcp_abort_on_overflow.
    46d05dab1b4f tcp: Fix a data-race around sysctl_tcp_rfc1337.
    d46d55e3f9f8 tcp: Fix a data-race around sysctl_tcp_stdurg.
    1a1aedbb7605 tcp: Fix a data-race around sysctl_tcp_retrans_collapse.
    41aeba4506f6 tcp: Fix data-races around sysctl_tcp_slow_start_after_idle.
    404c53ccdebd tcp: Fix a data-race around sysctl_tcp_thin_linear_timeouts.
    a31e2d0cb5cf tcp: Fix data-races around sysctl_tcp_recovery.
    5037ca9e4b16 tcp: Fix a data-race around sysctl_tcp_early_retrans.
    329de75b9e16 tcp: Fix data-races around sysctl knobs related to SYN option.
    3f2ac2d6511b udp: Fix a data-race around sysctl_udp_l3mdev_accept.
    95724fe897a4 ip: Fix data-races around sysctl_ip_prot_sock.
    36f5b86f309b ipv4: Fix data-races around sysctl_fib_multipath_hash_fields.
    21fb844bc1dc ipv4: Fix data-races around sysctl_fib_multipath_hash_policy.
    b8d345db03b4 ipv4: Fix a data-race around sysctl_fib_multipath_use_neigh.
    94e4b855e22b drm/imx/dcss: Add missing of_node_put() in fail path
    3d13bf301e06 net: dsa: vitesse-vsc73xx: silent spi_device_id warnings
    25e1d782c9c3 net: dsa: sja1105: silent spi_device_id warnings
    aba8ff847f4f be2net: Fix buffer overflow in be_get_module_eeprom
    caae64d3e91b gpio: pca953x: use the correct register address when regcache sync during init
    dfb4b67ff4df gpio: pca953x: use the correct range when do regmap sync
    9726ed46b9b7 gpio: pca953x: only use single read/write for No AI mode
    e6fc5472b850 net: stmmac: remove redunctant disable xPCS EEE call
    16f929a5e76f ixgbe: Add locking to prevent panic when setting sriov_numvfs to zero
    893ea2b35bb9 i40e: Fix erroneous adapter reinitialization during recovery process
    fad55088ad73 pinctrl: armada-37xx: use raw spinlocks for regmap to avoid invalid wait context
    9d674108fe76 pinctrl: armada-37xx: Convert to use dev_err_probe()
    47c9f6bfc234 pinctrl: armada-37xx: Make use of the devm_platform_ioremap_resource()
    2cbb16513176 pinctrl: armada-37xx: Use temporary variable for struct device
    2918419c0608 iavf: Fix handling of dummy receive descriptors
    a77a75a0e7f3 tcp: Fix data-races around sysctl_tcp_fastopen_blackhole_timeout.
    539d9ab79eba tcp: Fix data-races around sysctl_tcp_fastopen.
    3ae85dc62a02 tcp: Fix data-races around sysctl_max_syn_backlog.
    58d5ea71aaa6 tcp: Fix a data-race around sysctl_tcp_tw_reuse.
    80d4d0c46167 tcp: Fix a data-race around sysctl_tcp_notsent_lowat.
    e816f8024617 tcp: Fix data-races around some timeout sysctl knobs.
    f6ce6556958c tcp: Fix data-races around sysctl_tcp_reordering.
    fcf6c6d8aeff tcp: Fix data-races around sysctl_tcp_migrate_req.
    10a9ba97a404 tcp: Fix data-races around sysctl_tcp_syncookies.
    78522951d718 tcp: Fix data-races around sysctl_tcp_syn(ack)?_retries.
    906beda70c2f tcp: Fix data-races around keepalive sysctl knobs.
    849450279dfc igmp: Fix data-races around sysctl_igmp_max_msf.
    2a408a4f423e igmp: Fix a data-race around sysctl_igmp_max_memberships.
    260446eb8e55 igmp: Fix data-races around sysctl_igmp_llm_reports.
    2e8c8309329d net/tls: Fix race in TLS device down flow
    7c687a893f5c net: stmmac: fix dma queue left shift overflow issue
    34e98fce9a9b perf tests: Fix Convert perf time to TSC test for hybrid
    196c21deb08a i2c: cadence: Change large transfer count reset logic to be unconditional
    66b73ef38d80 i2c: mlxcpld: Fix register setting for 400KHz frequency
    b8e68fce6f0e net: ipv4: use kfree_skb_reason() in ip_rcv_finish_core()
    ad5a78ed1356 net: ipv4: use kfree_skb_reason() in ip_rcv_core()
    82cda9918473 net: netfilter: use kfree_drop_reason() for NF_DROP
    f3ed670ef850 net: skb_drop_reason: add document for drop reasons
    8ac90de3d137 net: socket: rename SKB_DROP_REASON_SOCKET_FILTER
    b7adefdae236 net: skb: use kfree_skb_reason() in __udp4_lib_rcv()
    1629144da383 net: skb: use kfree_skb_reason() in tcp_v4_rcv()
    5158e18225c0 net: skb: introduce kfree_skb_reason()
    88ec2ff42da3 net: dsa: microchip: ksz_common: Fix refcount leak bug
    212a5360ef40 mtd: rawnand: gpmi: Set WAIT_FOR_READY timeout based on program/erase times
    0156b402a5be mtd: rawnand: gpmi: validate controller clock rate
    f53c6ee5e7eb net: stmmac: fix unbalanced ptp clock issue in suspend/resume flow
    f784d232565b net: stmmac: fix pm runtime issue in stmmac_dvr_remove()
    e6b6f027e285 tcp: Fix a data-race around sysctl_tcp_probe_interval.
    f524c3e7f6cd tcp: Fix a data-race around sysctl_tcp_probe_threshold.
    cc36c37f5fe0 tcp: Fix a data-race around sysctl_tcp_mtu_probe_floor.
    0fc9357282df tcp: Fix data-races around sysctl_tcp_min_snd_mss.
    4d7dea651b7f tcp: Fix data-races around sysctl_tcp_base_mss.
    aabe9438fdfe tcp: Fix data-races around sysctl_tcp_mtu_probing.
    9ba9cd43b577 tcp: Fix data-races around sysctl_tcp_l3mdev_accept.
    b8e29f644583 tcp: sk->sk_bound_dev_if once in inet_request_bound_dev_if()
    bf3134feffe6 tcp/dccp: Fix a data-race around sysctl_tcp_fwmark_accept.
    dccf8a67f30e ip: Fix a data-race around sysctl_fwmark_reflect.
    87ceaa199a72 ip: Fix a data-race around sysctl_ip_autobind_reuse.
    4fdf9bdb2883 ip: Fix data-races around sysctl_ip_nonlocal_bind.
    351f81f7d718 ip: Fix data-races around sysctl_ip_fwd_update_priority.
    93fbc06da1d8 ip: Fix data-races around sysctl_ip_fwd_use_pmtu.
    01083e3f9868 ip: Fix data-races around sysctl_ip_no_pmtu_disc.
    e75b73081f1e igc: Reinstate IGC_REMOVED logic and implement it properly
    a4f7a9fbe24b Revert "e1000e: Fix possible HW unit hang after an s0ix exit"
    63aa107bce83 e1000e: Enable GPT clock before sending message to CSME
    98d81b2b154d nvme: fix block device naming collision
    321abf90c576 nvme: check for duplicate identifiers earlier
    dbedad96f416 scsi: ufs: core: Drop loglevel of WriteBoost message
    04ae8518745c scsi: megaraid: Clear READ queue map's nr_queues
    c7720f23bb93 drm/amd/display: Ignore First MST Sideband Message Return Error
    8bae037b0fb4 drm/amdgpu/display: add quirk handling for stutter mode
    e980e1d978e0 drm/amd/display: Fork thread to offload work of hpd_rx_irq
    54740bc4b182 drm/amd/display: Add option to defer works of hpd_rx_irq
    734d5ce02cb0 drm/amd/display: Support for DMUB HPD interrupt handling
    d1e0bbe08171 tcp: Fix data-races around sysctl_tcp_ecn.
    9cb4959493cd sysctl: move some boundary constants from sysctl.c to sysctl_vals
    e2b6c5f7ee95 mm/pagealloc: sysctl: change watermark_scale_factor max limit to 30%
    d2dba226acb9 net: tun: split run_ebpf_filter() and pskb_trim() into different "if statement"
    f52af853be7a ipv4/tcp: do not use per netns ctl sockets
    da3c256e2d0e perf/core: Fix data race between perf_event_set_output() and perf_mmap_close()
    44016a85419c pinctrl: ralink: Check for null return of devm_kcalloc
    e4e3187750f8 pinctrl: ralink: rename pinctrl-rt2880 to pinctrl-ralink
    d40def7cd05c pinctrl: ralink: rename MT7628(an) functions to MT76X8
    a4c5115140ed RDMA/irdma: Fix sleep from invalid context BUG
    03fd151bdff0 RDMA/irdma: Do not advertise 1GB page size for x722
    71ab83ac65e2 power/reset: arm-versatile: Fix refcount leak in versatile_reboot_probe
    c8e32bca0676 xfrm: xfrm_policy: fix a possible double xfrm_pols_put() in xfrm_bundle_lookup()
    1d3eeb199970 ip: Fix data-races around sysctl_ip_default_ttl.
    6bf450d92d0c r8152: fix a WOL issue
    44addae95ed7 xfs: prevent a WARN_ONCE() in xfs_ioc_attr_list()
    1da0b50ea071 xfs: fix perag reference leak on iteration race with growfs
    768bfde1cf3e xfs: terminate perag iteration reliably on agcount
    2991d51b42a3 xfs: rename the next_agno perag iteration variable
    4d6f22f6cc58 xfs: fold perag loop iteration logic into helper function
    67cb74213a52 xfs: fix maxlevels comparisons in the btree staging code
    cf719adb6fa9 mt76: mt7921: Fix the error handling path of mt7921_pci_probe()
    22b910a7a378 mt76: mt7921e: fix possible probe failure after reboot
    c3bcf1f959f6 mt76: mt7921: use physical addr to unify register access
    191c16f921ad Revert "mt76: mt7921e: fix possible probe failure after reboot"
    4666a6eb390c Revert "mt76: mt7921: Fix the error handling path of mt7921_pci_probe()"
    0cac1c84e1cc batman-adv: Use netif_rx_any_context() any.
    be56f007c414 serial: mvebu-uart: correctly report configured baudrate value
    92dcb50f7f09 PCI: hv: Fix interrupt mapping for multi-MSI
    2b77425d0ae4 PCI: hv: Reuse existing IRTE allocation in compose_msi_msg()
    35d24b115a40 PCI: hv: Fix hv_arch_irq_unmask() for multi-MSI
    5c676a214d63 PCI: hv: Fix multi-MSI to allow more than one MSI vector
    0791309aa0eb Revert "selftest/vm: verify mmap addr in mremap_test"
    cfd3a9be0ac4 Revert "selftest/vm: verify remap destination address in mremap_test"
    d7c4f9b8ed62 bus: mhi: host: pci_generic: add Telit FN990
    38b7bbe0ef1d bus: mhi: host: pci_generic: add Telit FN980 v1 hardware revision
    60e536b0a564 drm/ttm: fix locking in vmap/vunmap TTM GEM helpers
    0e66932a9dc9 lockdown: Fix kexec lockdown bypass with ima policy
    25ba5b824a72 mlxsw: spectrum_router: Fix IPv4 nexthop gateway indication
    73846553bcde riscv: add as-options for modules with assembly compontents
    aff42cea285f pinctrl: stm32: fix optional IRQ support to gpios
    a9e2d8e52e1c Linux 5.15.57
    b4296a7b863f x86: Use -mindirect-branch-cs-prefix for RETPOLINE builds
    06741ef8e7cc um: Add missing apply_returns()
    320fc994f0c8 x86/bugs: Remove apostrophe typo
    ac8edadc2b1e tools headers cpufeatures: Sync with the kernel sources
    1dd6c13b437c tools arch x86: Sync the msr-index.h copy with the kernel sources
    5f4e77cc9abf KVM: emulate: do not adjust size of fastop and setcc subroutines
    198685e58b13 x86/kvm: fix FASTOP_SIZE when return thunks are enabled
    554cf28b104d efi/x86: use naked RET on mixed mode call wrapper
    d0caa861a836 x86/speculation: Use DECLARE_PER_CPU for x86_spec_ctrl_current
    67040d1d922b x86/asm/32: Fix ANNOTATE_UNRET_SAFE use on 32-bit
    96907c5d3927 x86/xen: Fix initialisation in hypercall_page after rethunk
    86ccf19a91be x86/static_call: Serialize __static_call_fixup() properly
    73ad137d1146 x86/speculation: Disable RRSBA behavior
    db0128b8243f x86/kexec: Disable RET on kexec
    3653093b7bbf x86/bugs: Do not enable IBPB-on-entry when IBPB is not supported
    925340f99bdf x86/entry: Move PUSH_AND_CLEAR_REGS() back into error_entry
    2f8967e22322 x86/bugs: Add Cannon lake to RETBleed affected CPU list
    cc3011cdbe5f x86/retbleed: Add fine grained Kconfig knobs
    12a13570054f x86/cpu/amd: Enumerate BTC_NO
    d7a5c08b46b6 x86/common: Stamp out the stepping madness
    8d5cff499a6d x86/speculation: Fill RSB on vmexit for IBRS
    4207d7b645b8 KVM: VMX: Fix IBRS handling after vmexit
    0cbd5905c8f3 KVM: VMX: Prevent guest RSB poisoning attacks with eIBRS
    5fde25284dfe KVM: VMX: Convert launched argument to flags
    852fe53040b9 KVM: VMX: Flatten __vmx_vcpu_run()
    c590fa2d2dac objtool: Re-add UNWIND_HINT_{SAVE_RESTORE}
    66b37dccbc25 x86/speculation: Remove x86_spec_ctrl_mask
    b55663e7521f x86/speculation: Use cached host SPEC_CTRL value for guest entry/exit
    2069bd0e6f5b x86/speculation: Fix SPEC_CTRL write on SMT state change
    e898e28762f8 x86/speculation: Fix firmware entry SPEC_CTRL handling
    d427c1f83e8c x86/speculation: Fix RSB filling with CONFIG_RETPOLINE=n
    75d4fc2e965f x86/cpu/amd: Add Spectral Chicken
    dab72c3c32cc objtool: Add entry UNRET validation
    469d9b157017 x86/bugs: Do IBPB fallback check only once
    fd17a4254965 x86/bugs: Add retbleed=ibpb
    8894f699f187 x86/xen: Add UNTRAIN_RET
    87e6270183a4 x86/xen: Rename SYS* entry points
    e894b7817e08 objtool: Update Retpoline validation
    a1d912d7ac04 intel_idle: Disable IBRS during long idle
    e51769df6228 x86/bugs: Report Intel retbleed vulnerability
    b9349805e653 x86/bugs: Split spectre_v2_select_mitigation() and spectre_v2_user_select_mitigation()
    347d0bf6b0c0 x86/speculation: Add spectre_v2=ibrs option to support Kernel IBRS
    e03415eeba78 x86/bugs: Optimize SPEC_CTRL MSR writes
    62b4db57eefe x86/entry: Add kernel IBRS implementation
    fac1b0007cec x86/bugs: Keep a per-CPU IA32_SPEC_CTRL value
    b4e05ea71eda x86/bugs: Enable STIBP for JMP2RET
    89eba42632fc x86/bugs: Add AMD retbleed= boot parameter
    82e92fe936db x86/bugs: Report AMD retbleed vulnerability
    a9c0926fc754 x86: Add magic AMD return-thunk
    07f5c5e36236 objtool: Treat .text.__x86.* as noinstr
    1f068f9da743 x86/entry: Avoid very early RET
    1d61a2988612 x86: Use return-thunk in asm code
    6c45176bc2ae x86/sev: Avoid using __x86_return_thunk
    f3d9f990586c x86/vsyscall_emu/64: Don't use RET in vsyscall emulation
    5b43965d58ef x86/kvm: Fix SETcc emulation for return thunks
    0bfe8be824aa x86/bpf: Use alternative RET encoding
    e54fcb0812fa x86/ftrace: Use alternative RET encoding
    c1c80aabc7b9 x86,static_call: Use alternative RET encoding
    b0fb9784cf80 objtool: skip non-text sections when adding return-thunk sites
    1920e4be8a97 x86,objtool: Create .return_sites
    7bf553d9eebd x86: Undo return-thunk damage
    023a2b07d5c3 x86/retpoline: Use -mfunction-return
    bb81f3ac69f8 x86/retpoline: Swizzle retpoline thunk
    545b45c36a2f x86/retpoline: Cleanup some #ifdefery
    eee4f31fa2eb x86/cpufeatures: Move RETPOLINE flags to word 11
    ccb25d7db1a2 x86/kvm/vmx: Make noinstr clean
    2cd972ae337f x86/realmode: build with -D__DISABLE_EXPORTS
    6834878ace6e x86/entry: Remove skip_r11rcx
    40265bcd1bd3 objtool: Default ignore INT3 for unreachable
    32b2cd6060e7 bpf,x86: Respect X86_FEATURE_RETPOLINE*
    74b5a9f8edfe bpf,x86: Simplify computing label offsets
    1c2e7b40752a x86/alternative: Add debug prints to apply_retpolines()
    b93a0a740bca x86/alternative: Try inline spectre_v2=retpoline,amd
    a40925e2efd8 x86/alternative: Handle Jcc __x86_indirect_thunk_\reg
    86900f95fb06 x86/alternative: Implement .retpoline_sites support
    936c8fcb4995 x86/retpoline: Create a retpoline thunk array
    90ca76c83044 x86/retpoline: Move the retpoline thunk declarations to nospec-branch.h
    6a6fcb256301 x86/asm: Fixup odd GEN-for-each-reg.h usage
    71e578e1bd74 x86/asm: Fix register order
    18576e45b12a x86/retpoline: Remove unused replacement symbols
    655d4097039c objtool: Introduce CFI hash
    503882b5aeb6 objtool,x86: Replace alternatives with .retpoline_sites
    cad0e43a8c30 objtool: Shrink struct instruction
    c9fd00d8e622 objtool: Explicitly avoid self modifying code in .altinstr_replacement
    29e6b52efca1 objtool: Classify symbols
    1fd333eb3377 x86/entry: Don't call error_entry() for XENPV
    cac414684be9 x86/entry: Move PUSH_AND_CLEAR_REGS out of error_entry()
    19ac6c99a17e x86/entry: Switch the stack after error_entry() returns
    01bc8bd64c19 x86/traps: Use pt_regs directly in fixup_bad_iret()
    760adb59f621 Linux 5.15.56
    31f351eb534e drm/aperture: Run fbdev removal before internal helpers
    eac7fd3ca397 x86/pat: Fix x86_has_pat_wp()
    190ce5cdc55d serial: 8250: Fix PM usage_count for console handover
    2db3b95166f7 serial: pl011: UPSTAT_AUTORTS requires .throttle/unthrottle
    8ef116a2a738 serial: stm32: Clear prev values before setting RTS delays
    10b27fa2d67c serial: 8250: fix return error code in serial8250_request_std_resource()
    57964a571025 vt: fix memory overlapping when deleting chars in the buffer
    8b07c2998720 tty: serial: samsung_tty: set dma burst_size to 1
    3cb692555a0b usb: dwc3: gadget: Fix event pending check
    ea42ef3ef678 usb: typec: add missing uevent when partner support PD
    aa96257867c0 USB: serial: ftdi_sio: add Belimo device ids
    ec0c62a23c50 signal handling: don't use BUG_ON() for debugging
    c01793517d8d nvme-pci: phison e16 has bogus namespace ids
    15ef4d686a58 ALSA: usb-audio: Add quirk for Fiero SC-01 (fw v1.0.0)
    df982f9d094d ALSA: usb-audio: Add quirk for Fiero SC-01
    9d90a21f0cb7 ALSA: usb-audio: Add quirks for MacroSilicon MS2100/MS2106 devices
    2483ba7afa59 Revert "can: xilinx_can: Limit CANFD brp to 2"
    bd87cf2ed609 ARM: dts: stm32: use the correct clock source for CEC on stm32mp151
    c0cba036bfe8 soc: ixp4xx/npe: Fix unused match warning
    26bb7afc027c x86: Clear .brk area at early boot
    ee1da3d59674 irqchip: or1k-pic: Undefine mask_ack for level triggered hardware
    9c9869c308a3 ASoC: madera: Fix event generation for rate controls
    66cc34f2e493 ASoC: madera: Fix event generation for OUT1 demux
    74ead64cbf0d ASoC: cs47l15: Fix event generation for low power mux control
    ab2f5e5f3ce1 ASoC: dapm: Initialise kcontrol data for mux/demux controls
    269be8b29073 ASoC: rt711-sdca: fix kernel NULL pointer dereference when IO error
    44975751bef0 ASoC: wm5110: Fix DRE control
    bc9067062600 ASoC: Intel: bytcr_wm5102: Fix GPIO related probe-ordering problem
    dd70da2a5816 ASoC: wcd938x: Fix event generation for some controls
    05708fb473ce ASoC: SOF: Intel: hda-loader: Clarify the cl_dsp_init() flow
    e71d0e1370b1 ASoC: codecs: rt700/rt711/rt711-sdca: initialize workqueues in probe
    07a606e1389a ASoC: rt7*-sdw: harden jack_detect_handler
    b054614dd3fd ASoC: rt711: fix calibrate mutex initialization
    f2556ce6b35a ASoC: Intel: sof_sdw: handle errors on card registration
    42664a97f2b5 ASoC: rt711-sdca-sdw: fix calibrate mutex initialization
    4e81b38d9426 ASoC: Realtek/Maxim SoundWire codecs: disable pm_runtime on remove
    3cb392b64304 pinctrl: aspeed: Fix potential NULL dereference in aspeed_pinmux_set_mux()
    0c6c7d57ed00 ASoC: ops: Fix off by one in range control validation
    204543581a2f net: sfp: fix memory leak in sfp_probe()
    7a2294c5f2e5 nvme: fix regression when disconnect a recovering ctrl
    1e4427aa2fc8 nvme-tcp: always fail a request when sending it failed
    8ab067462e09 NFC: nxp-nci: don't print header length mismatch on i2c error
    833ecd0eae76 net: tipc: fix possible refcount leak in tipc_sk_create()
    13d28e0c79cb fbdev: Disable sysfb device registration when removing conflicting FBs
    b952569e0316 firmware: sysfb: Add sysfb_disable() helper function
    2ef4c6d66f7d firmware: sysfb: Make sysfb_create_simplefb() return a pdev pointer
    f57c76104c74 platform/x86: hp-wmi: Ignore Sanitization Mode event
    57289b6601fe cpufreq: pmac32-cpufreq: Fix refcount leak bug
    06f818de1621 scsi: hisi_sas: Limit max hw sectors for v3 HW
    03a400a64050 netfilter: br_netfilter: do not skip all hooks with 0 priority
    bf5307924563 virtio_mmio: Restore guest page size on resume
    26d824d1316f virtio_mmio: Add missing PM calls to freeze/restore
    65d7a723fdda vduse: Tie vduse mgmtdev and its device
    b34dbeb2b0ec vdpa/mlx5: Initialize CVQ vringh only once
    10f2cd373e65 powerpc/xive/spapr: correct bitmap allocation size
    4e69750549b8 ksmbd: use SOCK_NONBLOCK type for kernel_accept()
    d300ced12889 btrfs: zoned: fix a leaked bioc in read_zone_info
    d2faf8ed1dc2 btrfs: rename btrfs_bio to btrfs_io_context
    a06248fa62ef mm: sysctl: fix missing numa_stat when !CONFIG_HUGETLB_PAGE
    204d12228697 ACPI: video: Fix acpi_video_handles_brightness_key_presses()
    724ec407f997 net/tls: Check for errors in tls_device_init
    a0706d7c1429 KVM: x86: Fully initialize 'struct kvm_lapic_irq' in kvm_pv_kick_cpu_op()
    58c90993933e net: atlantic: remove aq_nic_deinit() when resume
    9b1cb795a7ab net: atlantic: remove deep parameter on suspend/resume functions
    68e5f32f0de9 sfc: fix kernel panic when creating VF
    2d84fcb6e6f7 seg6: bpf: fix skb checksum in bpf_push_seg6_encap()
    15e8b6274c49 seg6: fix skb checksum in SRv6 End.B6 and End.B6.Encaps behaviors
    859081fb60e6 seg6: fix skb checksum evaluation in SRH encapsulation/insertion
    5464c8987ddf ceph: switch netfs read ops to use rreq->inode instead of rreq->mapping->host
    58d93e9d160c sfc: fix use after free when disabling sriov
    8c37e7a2000d drm/amd/pm: Prevent divide by zero
    cded1186f7e9 drm/amd/display: Only use depth 36 bpp linebuffers on DCN display engines.
    601ae26aa280 ima: Fix potential memory leak in ima_init_crypto()
    2340428c90d4 ima: force signature verification when CONFIG_KEXEC_SIG is configured
    f4bd3202a2b4 net: stmmac: fix leaks in probe
    4225a78eb4d7 net: ftgmac100: Hold reference returned by of_get_child_by_name()
    0d17723afea3 nexthop: Fix data-races around nexthop_compat_mode.
    6b26fb2fe227 ipv4: Fix data-races around sysctl_ip_dynaddr.
    8bcf7339f2cf tcp: Fix a data-race around sysctl_tcp_ecn_fallback.
    46e9c46203fd raw: Fix a data-race around sysctl_raw_l3mdev_accept.
    8d7a13654a98 icmp: Fix a data-race around sysctl_icmp_ratemask.
    7c1b6e453481 icmp: Fix a data-race around sysctl_icmp_ratelimit.
    de9490c32bc1 icmp: Fix a data-race around sysctl_icmp_errors_use_inbound_ifaddr.
    44021c2929cf icmp: Fix a data-race around sysctl_icmp_ignore_bogus_error_responses.
    cce955efa0ab icmp: Fix data-races around sysctl_icmp_echo_enable_probe.
    a716a3846c5f sysctl: Fix data-races in proc_dointvec_ms_jiffies().
    e58b02e44546 sysctl: Fix data-races in proc_dou8vec_minmax().
    3852f048be60 bnxt_en: Fix bnxt_refclk_read()
    0260a9aa5d5c bnxt_en: Fix bnxt_reinit_after_abort() code path
    a6cecaf058c4 drm/i915: Require the vm mutex for i915_vma_bind()
    60d1bb301ea5 drm/i915/uc: correctly track uc_fw init failure
    86062ca5edf1 drm/i915/gt: Serialize TLB invalidates with GT resets
    0ee5874dad61 drm/i915/gt: Serialize GRDOM access between multiple engine resets
    f8ba02531476 drm/i915/dg2: Add Wa_22011100796
    40c12fc52023 drm/i915/selftests: fix a couple IS_ERR() vs NULL tests
    af515a633942 tracing: Fix sleeping while atomic in kdb ftdump
    62a6a708f392 lockd: fix nlm_close_files
    9c3eef773cf4 lockd: set fl_owner when unlocking files
    1e92426e2b3a xen/gntdev: Ignore failure to unmap INVALID_GRANT_HANDLE
    f6e3ced9c60f drm/i915/gvt: IS_ERR() vs NULL bug in intel_gvt_update_reg_whitelist()
    5a4bb158f4c6 netfilter: nf_tables: replace BUG_ON by element length check
    b97aa619a3cb netfilter: nf_log: incorrect offset to network header
    dc2ec80bc949 arm64: dts: broadcom: bcm4908: Fix cpu node for smp boot
    1d49665a93b1 arm64: dts: broadcom: bcm4908: Fix timer node for BCM4906 SoC
    f0ccff1c89ba ARM: dts: sunxi: Fix SPI NOR campatible on Orange Pi Zero
    c0dd77cede0a ARM: dts: at91: sama5d2: Fix typo in i2s1 node
    9be8aac91960 ipv4: Fix a data-race around sysctl_fib_sync_mem.
    e2828e8c6058 icmp: Fix data-races around sysctl.
    07b0caf8aeb9 cipso: Fix data-races around sysctl.
    a5796154b56f net: Fix data-races around sysctl_mem.
    82d07170290d inetpeer: Fix data-races around sysctl.
    2dfff4b607c4 tcp: Fix a data-race around sysctl_tcp_max_orphans.
    67623d290d45 sysctl: Fix data races in proc_dointvec_jiffies().
    dcdf3c3c587a sysctl: Fix data races in proc_doulongvec_minmax().
    40e0477a7371 sysctl: Fix data races in proc_douintvec_minmax().
    32d7f8da8244 sysctl: Fix data races in proc_dointvec_minmax().
    d335db59f7fb sysctl: Fix data races in proc_douintvec().
    279bf2a909e6 sysctl: Fix data races in proc_dointvec().
    ad3014b0f6b2 net: ethernet: ti: am65-cpsw: Fix devlink port register sequence
    d5c315a78765 net: stmmac: dwc-qos: Disable split header for Tegra194
    750a5e2e5368 ASoC: Intel: Skylake: Correct the handling of fmt_config flexible array
    0d083ea282e5 ASoC: Intel: Skylake: Correct the ssp rate discovery in skl_get_ssp_clks()
    dfe3ce23217c ASoC: tas2764: Fix amp gain register offset & default
    a92e7564c540 ASoC: tas2764: Correct playback volume range
    1230d3e4b884 ASoC: tas2764: Fix and extend FSYNC polarity handling
    7dc0ae04c04e ASoC: tas2764: Add post reset delays
    9b9773cc55d8 ASoC: sgtl5000: Fix noise on shutdown/remove
    c8d5d8194093 ima: Fix a potential integer overflow in ima_appraise_measurement
    505114dda5bb drm/i915: fix a possible refcount leak in intel_dp_add_mst_connector()
    c6e1c5c0c19d net/mlx5e: Ring the TX doorbell on DMA errors
    663a06e96203 net/mlx5e: Fix capability check for updating vnic env counters
    3a5e734ec002 net/mlx5e: Fix enabling sriov while tc nic rules are offloaded
    5adcc5ded58a net/mlx5e: kTLS, Fix build time constant test in RX
    2ee2ef846fa3 net/mlx5e: kTLS, Fix build time constant test in TX
    ba27a912f99e ARM: 9210/1: Mark the FDT_FIXED sections as shareable
    443838e6ff0f ARM: 9209/1: Spectre-BHB: avoid pr_info() every time a CPU comes out of idle
    2bcb2e42a500 spi: amd: Limit max transfer and message size
    28ad09b0d7b1 ARM: dts: imx6qdl-ts7970: Fix ngpio typo and count
    3bbe6437c1d5 reset: Fix devm bulk optional exclusive control getter
    d8124f111b67 xfs: drop async cache flushes from CIL commits.
    d4dab8b405c6 xfs: run callbacks before waking waiters in xlog_state_shutdown_callbacks
    88beb994eae1 xfs: don't include bnobt blocks when reserving free block pool
    ea22fcd0324d xfs: only run COW extent recovery when there are no live extents
    fb593531571c Revert "evm: Fix memleak in init_desc"
    d69f9ff4c8ab sh: convert nommu io{re,un}map() to static inline functions
    bb676a80c6eb nilfs2: fix incorrect masking of permission flags for symlinks
    ca58387e7ad1 fs/remap: constrain dedupe of EOF blocks
    1807d8867402 drm/panfrost: Fix shrinker list corruption by madvise IOCTL
    fbe7451a3ada drm/panfrost: Put mapping instead of shmem obj on panfrost_mmu_map_fault_addr() error
    531a140e269d btrfs: return -EAGAIN for NOWAIT dio reads/writes on compressed and inline extents
    54aee4e5ce8c cgroup: Use separate src/dst nodes when preloading css_sets for migration
    5a9df3101799 wifi: mac80211: fix queue selection for mesh/OCB interfaces
    2a098504d7a0 ARM: 9214/1: alignment: advance IT state after emulating Thumb instruction
    a4f5e3a22fbd ARM: 9213/1: Print message about disabled Spectre workarounds only once
    6f497564bf6a ip: fix dflt addr selection for connected nexthop
    1eb4bea3af81 net: sock: tracing: Fix sock_exceed_buf_limit not to dereference stale pointer
    22eeff55679d tracing/histograms: Fix memory leak problem
    e4967d22882b mm: split huge PUD on wp_huge_pud fallback
    27056f20d753 mm: userfaultfd: fix UFFDIO_CONTINUE on fallocated shmem pages
    b856e5738b1c fix race between exit_itimers() and /proc/pid/timers
    b99174ac57fe xen/netback: avoid entering xenvif_rx_next_skb() with an empty rx queue
    9d3243d774f5 ALSA: hda/realtek - Enable the headset-mic on a Xiaomi's laptop
    cd2731b3efe8 ALSA: hda/realtek - Fix headset mic problem for a HP machine with alc221
    dd9746cf6da3 ALSA: hda/realtek: fix mute/micmute LEDs for HP machines
    7d0c5005c580 ALSA: hda/realtek - Fix headset mic problem for a HP machine with alc671
    32fad77c4cd2 ALSA: hda/realtek: Fix headset mic for Acer SF313-51
    6744faa1d810 ALSA: hda/conexant: Apply quirk for another HP ProDesk 600 G3 model
    d60bb64d3263 ALSA: hda - Add fixup for Dell Latitidue E5430
    baefa2315cb1 Linux 5.15.55
    c80b15105a08 Revert "mtd: rawnand: gpmi: Fix setting busy timeout setting"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index b6e443d4da..ef47daab6e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0222cbb8d40318cf5377875017e32eebefa59ab8"
-SRCREV_meta ?= "0e3a81a5aefbea03388b1235fbcc3dec278425d0"
+SRCREV_machine ?= "2a966fea899c00cf90fa1b79b9449e4ea384e9e4"
+SRCREV_meta ?= "f45197776b360447cb4df7bc1e74dce6f8ad52b1"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.54"
+LINUX_VERSION ?= "5.15.58"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index aadf014463..ab0151d1ab 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.54"
+LINUX_VERSION ?= "5.15.58"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "9b1d0e5eb8b08323577f5e2b21cbb2065aba0aa1"
-SRCREV_meta ?= "0e3a81a5aefbea03388b1235fbcc3dec278425d0"
+SRCREV_machine ?= "c944a56a2d84d3adbaef14be8a6afa30b0dace20"
+SRCREV_meta ?= "f45197776b360447cb4df7bc1e74dce6f8ad52b1"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 4c1d163a1e..f7e576ba3d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "c284142affccb534122ad93bdcd4774af161d767"
-SRCREV_machine:qemuarm64 ?= "c4c194a34c568c17389120608b2ee8a7a988150a"
-SRCREV_machine:qemumips ?= "7b446965d9659d312952ef4dedf5b50a493e60c2"
-SRCREV_machine:qemuppc ?= "0c2a4ad856c8f0c1b3ca8a38c17e1194f47e4643"
-SRCREV_machine:qemuriscv64 ?= "a40d2daf2795d89e3ef8af0413b25190558831ec"
-SRCREV_machine:qemuriscv32 ?= "a40d2daf2795d89e3ef8af0413b25190558831ec"
-SRCREV_machine:qemux86 ?= "a40d2daf2795d89e3ef8af0413b25190558831ec"
-SRCREV_machine:qemux86-64 ?= "a40d2daf2795d89e3ef8af0413b25190558831ec"
-SRCREV_machine:qemumips64 ?= "9a8d4e00df67daf224ae62b238c151a3f3f70ae7"
-SRCREV_machine ?= "a40d2daf2795d89e3ef8af0413b25190558831ec"
-SRCREV_meta ?= "0e3a81a5aefbea03388b1235fbcc3dec278425d0"
+SRCREV_machine:qemuarm ?= "294460c2e2f3e7d3c0ddff5d731568bf14fe3468"
+SRCREV_machine:qemuarm64 ?= "6887e4e7a7bbd8cba33a91d8309a1a16c466e025"
+SRCREV_machine:qemumips ?= "a372c36fe5260e6806b1a2211f2a944353e3cf42"
+SRCREV_machine:qemuppc ?= "e0bae0aa107d9587a249c66b8bebddd88053a4da"
+SRCREV_machine:qemuriscv64 ?= "231c3910df6c8320d4ded84a5b4776c4ff90750f"
+SRCREV_machine:qemuriscv32 ?= "231c3910df6c8320d4ded84a5b4776c4ff90750f"
+SRCREV_machine:qemux86 ?= "231c3910df6c8320d4ded84a5b4776c4ff90750f"
+SRCREV_machine:qemux86-64 ?= "231c3910df6c8320d4ded84a5b4776c4ff90750f"
+SRCREV_machine:qemumips64 ?= "c7a71a863f360ea1c54e35c03e8987c4212fbef1"
+SRCREV_machine ?= "231c3910df6c8320d4ded84a5b4776c4ff90750f"
+SRCREV_meta ?= "f45197776b360447cb4df7bc1e74dce6f8ad52b1"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "843dae1756d9bddee21a96827784791fd97d484e"
+SRCREV_machine:class-devupstream ?= "7d8048d4e064d4ef7719e9520f6c123c051fca99"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.54"
+LINUX_VERSION ?= "5.15.58"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


