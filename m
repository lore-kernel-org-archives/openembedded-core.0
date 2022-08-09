Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3AE2C25B0E
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 21:51:10 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.16.1660081863144350943
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:51:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=qwQWqLjb;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so237039pjf.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Aug 2022 14:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ePztEHLpr/5e4cun+taKCfx+duwjLkApOUjKKJisdQM=;
        b=qwQWqLjbL4WevK4O7/fWFsO0DThcKaBoG5qx8tvoFqSftroPsKoGchGwEjm426A9O9
         3xwTrZVPERbDM9XDSz5CaUBb6hR35dIs9i+TVf98Arv9Foas+Pc1emsIlqor5f47CkKD
         It4iNGEQtoC0IOmNl9Wl517wdzPHUID7EO+ellBF+8zKFzRs8/cy0kIqlqNcIjWu+hiv
         TIiHmHdhzzb6VW4MCzu6IsBPPE/tbnnDNReGNuC8bniMABXEioNBXjUlSc6tDfejizLt
         bf2jvKR95hmdN/AjeSuLccS+E+GqPBCjGtp472M2TRUe3jZokug1DsJXTQ/c90bikGHg
         thdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ePztEHLpr/5e4cun+taKCfx+duwjLkApOUjKKJisdQM=;
        b=eioZtwCoEAMy/pg/ShCGWFd2KiycbSaif+1/v7wDfOQ/PsfIWaLsTK/Jz16xut/BLh
         597EpNFGp1+vT+ut6BudQsDaupkyPueS89eVCXW8eB4rg1HAe+KSuktXsiA1HcKMoNxp
         er8q9oHuUWIQQAuTPu7701o/KVESrCUA6ysdLjVnw4tnuN5/Fcf8QiwWn/DudSqomiu+
         pXIKsIlrjrBbXfIIJEN9Ed4zo/uiOeaOP5J7LAqTYBWnr7J/CuZnWkRnJuQ5TnCn+o4x
         o+GoGPBqEWajAEGox4DlwBRWdExiR7ZgVM2ifoP3ou+hFtDYlT6slEnLlJjjuYeInR4B
         XRYQ==
X-Gm-Message-State: ACgBeo3FtOdjJk2C9uU24q7jQcFZDxIBOBmbUJ0w8wcZ3errbDqtgySO
	q2BEOWdrPHWAdSYQ3F7u3I1RaphW3Y4v+KgC
X-Google-Smtp-Source: 
 AA6agR6A6EvTq04MCRmj2AkmoH/3fCp6ADFH/iWUDpqNynCITjw34FPmRQ1ND1KeFMjKKcq0Q3vQIw==
X-Received: by 2002:a17:902:eb86:b0:16f:d78:74d7 with SMTP id
 q6-20020a170902eb8600b0016f0d7874d7mr24572392plg.149.1660081861592;
        Tue, 09 Aug 2022 14:51:01 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 u125-20020a626083000000b0052c7ff2ac74sm402219pfb.17.2022.08.09.14.51.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 14:51:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/9] linux-yocto/5.10: update to v5.10.135
Date: Tue,  9 Aug 2022 11:50:33 -1000
Message-Id: 
 <373f85777564f4bdd40b0da32dd1799d77f11cc6.1660081510.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1660081510.git.steve@sakoman.com>
References: <cover.1660081510.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Aug 2022 21:51:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169175

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    4fd9cb57a3f5 Linux 5.10.135
    4bfc9dc60873 selftests: bpf: Don't run sk_lookup in verifier tests
    6d3fad2b44eb bpf: Add PROG_TEST_RUN support for sk_lookup programs
    6aad811b37ee bpf: Consolidate shared test timing code
    545fc3524ccc x86/bugs: Do not enable IBPB at firmware entry when IBPB is not available
    14b494b7aaf2 xfs: Enforce attr3 buffer recovery order
    e5f9d4e0f895 xfs: logging the on disk inode LSN can make it go backwards
    c1268acaa0dd xfs: remove dead stale buf unpin handling code
    c85cbb0b21a1 xfs: hold buffer across unpin and potential shutdown processing
    d8f5bb0a09b7 xfs: force the log offline when log intent item recovery fails
    eccacbcbfd70 xfs: fix log intent recovery ENOSPC shutdowns when inactivating inodes
    17c8097fb041 xfs: prevent UAF in xfs_log_item_in_current_chkpt
    6d3605f84edd xfs: xfs_log_force_lsn isn't passed a LSN
    41fbfdaba94a xfs: refactor xfs_file_fsync
    aadc39fd5b6d docs/kernel-parameters: Update descriptions for "mitigations=" param with retbleed
    c4cd52ab1e6d EDAC/ghes: Set the DIMM label unconditionally
    c45463917205 ARM: 9216/1: Fix MAX_DMA_ADDRESS overflow
    e500aa9f2d76 mt7601u: add USB device ID for some versions of XiaoDu WiFi Dongle.
    2670f76a5631 page_alloc: fix invalid watermark check on a negative value
    8014246694bb ARM: crypto: comment out gcc warning that breaks clang builds
    6f3505588d66 sctp: leave the err path free in sctp_stream_init to sctp_stream_free
    510e5b3791f6 sfc: disable softirqs for ptp TX
    3ec42508a67b perf symbol: Correct address for bss symbols
    6807897695d4 virtio-net: fix the race between refill work and close
    440dccd80f62 netfilter: nf_queue: do not allow packet truncation below transport header offset
    aeb2ff9f9f70 sctp: fix sleep in atomic context bug in timer handlers
    fad6caf9b19f i40e: Fix interface init with MSI interrupts (no MSI-X)
    e4a7acd6b443 tcp: Fix data-races around sysctl_tcp_reflect_tos.
    f310fb69a0a8 tcp: Fix a data-race around sysctl_tcp_comp_sack_nr.
    d2476f2059c2 tcp: Fix a data-race around sysctl_tcp_comp_sack_slack_ns.
    483239789127 tcp: Fix a data-race around sysctl_tcp_comp_sack_delay_ns.
    530a4da37ece net: macsec: fix potential resource leak in macsec_add_rxsa() and macsec_add_txsa()
    6e0e0464f1da macsec: always read MACSEC_SA_ATTR_PN as a u64
    2daf0a1261c7 macsec: limit replay window size with XPN
    0755c9d05ab2 macsec: fix error message in macsec_add_rxsa and _txsa
    54c295a30f00 macsec: fix NULL deref in macsec_add_rxsa
    034bfadc8f51 Documentation: fix sctp_wmem in ip-sysctl.rst
    4aea33f40459 tcp: Fix a data-race around sysctl_tcp_invalid_ratelimit.
    c4e6029a85c8 tcp: Fix a data-race around sysctl_tcp_autocorking.
    83edb788e69a tcp: Fix a data-race around sysctl_tcp_min_rtt_wlen.
    f47e7e5b49e3 tcp: Fix a data-race around sysctl_tcp_min_tso_segs.
    5584fe9718a4 net: sungem_phy: Add of_node_put() for reference returned by of_get_parent()
    b399ffafffba igmp: Fix data-races around sysctl_igmp_qrv.
    4c1318dabeb9 net/tls: Remove the context from the list in tls_device_down
    8008e797ec6f ipv6/addrconf: fix a null-ptr-deref bug for ip6_ptr
    a84b8b53a50b net: ping6: Fix memleak in ipv6_renew_options().
    c37c7f35d7b7 tcp: Fix a data-race around sysctl_tcp_challenge_ack_limit.
    9ffb4fdfd80a tcp: Fix a data-race around sysctl_tcp_limit_output_bytes.
    3e933125830a tcp: Fix data-races around sysctl_tcp_moderate_rcvbuf.
    77ac046a9ad3 Revert "tcp: change pingpong threshold to 3"
    54a73d65440e scsi: ufs: host: Hold reference returned by of_parse_phandle()
    160f79561e87 ice: do not setup vlan for loopback VSI
    9ed6f97c8d77 ice: check (DD | EOF) bits on Rx descriptor rather than (EOP | RS)
    2b4b373271e5 tcp: Fix data-races around sysctl_tcp_no_ssthresh_metrics_save.
    3fb21b67c0fc tcp: Fix a data-race around sysctl_tcp_nometrics_save.
    81c45f49e678 tcp: Fix a data-race around sysctl_tcp_frto.
    312ce3901fd8 tcp: Fix a data-race around sysctl_tcp_adv_win_scale.
    3cddb7a7a5d5 tcp: Fix a data-race around sysctl_tcp_app_win.
    f10a5f905a97 tcp: Fix data-races around sysctl_tcp_dsack.
    7fa8999b3167 watch_queue: Fix missing locking in add_watch_to_object()
    45a84f04a9a0 watch_queue: Fix missing rcu annotation
    b38a8802c52d nouveau/svm: Fix to migrate all requested pages
    bd46ca41461b s390/archrandom: prevent CPACF trng invocations in interrupt context
    1228934cf259 ntfs: fix use-after-free in ntfs_ucsncmp()
    5528990512a2 Revert "ocfs2: mount shared volume without ha stack"
    de5d4654ac6c Bluetooth: L2CAP: Fix use-after-free caused by l2cap_chan_put
    7a62a4b6212a Linux 5.10.134
    bb1990a3005e watch-queue: remove spurious double semicolon
    f7c1fc0dec97 net: usb: ax88179_178a needs FLAG_SEND_ZLP
    08afa87f58d8 tty: use new tty_insert_flip_string_and_push_buffer() in pty_write()
    a4bb7ef2d6f6 tty: extract tty_flip_buffer_commit() from tty_flip_buffer_push()
    c84986d09745 tty: drop tty_schedule_flip()
    4d374625cca2 tty: the rest, stop using tty_schedule_flip()
    6a8184825286 tty: drivers/tty/, stop using tty_schedule_flip()
    0adf21eec590 watchqueue: make sure to serialize 'wqueue->defunct' properly
    c0a3a9eb262a x86/alternative: Report missing return thunk details
    b7b9e5cc8b24 x86/amd: Use IBPB for firmware calls
    14fc9233aa73 Bluetooth: Fix bt_skb_sendmmsg not allocating partial chunks
    f44e65e6f0ee Bluetooth: SCO: Fix sco_send_frame returning skb->len
    a8feae8bd227 Bluetooth: Fix passing NULL to PTR_ERR
    5283591c84fa Bluetooth: RFCOMM: Replace use of memcpy_from_msg with bt_skb_sendmmsg
    341a029cf39c Bluetooth: SCO: Replace use of memcpy_from_msg with bt_skb_sendmsg
    3cce0e771fb5 Bluetooth: Add bt_skb_sendmmsg helper
    c87b2bc9d74a Bluetooth: Add bt_skb_sendmsg helper
    4faf4bbc2d60 ALSA: memalloc: Align buffer allocations in page size
    d1dc861cd68c bitfield.h: Fix "type of reg too small for mask" test
    f62ffdb5e2ee drm/imx/dcss: fix unused but set variable warnings
    577b624689aa dlm: fix pending remove if msg allocation fails
    cdcd20aa2cd4 x86/bugs: Warn when "ibrs" mitigation is selected on Enhanced IBRS parts
    26d5eb3c25c3 sched/deadline: Fix BUG_ON condition for deboosted tasks
    0c722a32f29a bpf: Make sure mac_header was set before using it
    ddb3f0b68863 mm/mempolicy: fix uninit-value in mpol_rebind_policy()
    3616776bc51c KVM: Don't null dereference ops->destroy
    684896e675ed spi: bcm2835: bcm2835_spi_handle_err(): fix NULL pointer deref for non DMA transfers
    064852663308 tcp: Fix data-races around sysctl_tcp_max_reordering.
    805f1c7ce470 tcp: Fix a data-race around sysctl_tcp_rfc1337.
    03bb3892f3f1 tcp: Fix a data-race around sysctl_tcp_stdurg.
    daa8b5b8694c tcp: Fix a data-race around sysctl_tcp_retrans_collapse.
    0e3f82a03ec8 tcp: Fix data-races around sysctl_tcp_slow_start_after_idle.
    cc133e4f4bc2 tcp: Fix a data-race around sysctl_tcp_thin_linear_timeouts.
    d8781f7cd040 tcp: Fix data-races around sysctl_tcp_recovery.
    11e8b013d16e tcp: Fix a data-race around sysctl_tcp_early_retrans.
    ffc388f6f0d6 tcp: Fix data-races around sysctl knobs related to SYN option.
    fcaef69c79ec udp: Fix a data-race around sysctl_udp_l3mdev_accept.
    9add240f76af ip: Fix data-races around sysctl_ip_prot_sock.
    e045d672ba06 ipv4: Fix a data-race around sysctl_fib_multipath_use_neigh.
    36f1d9c607f9 drm/imx/dcss: Add missing of_node_put() in fail path
    665cbe91de2f be2net: Fix buffer overflow in be_get_module_eeprom
    47523928557e gpio: pca953x: use the correct register address when regcache sync during init
    a941e6d5ba3b gpio: pca953x: use the correct range when do regmap sync
    928ded3fc1b9 gpio: pca953x: only use single read/write for No AI mode
    b82de63f8f81 ixgbe: Add locking to prevent panic when setting sriov_numvfs to zero
    6f949e5615f8 i40e: Fix erroneous adapter reinitialization during recovery process
    c6af94324911 iavf: Fix handling of dummy receive descriptors
    0dc2f19d8c26 tcp: Fix data-races around sysctl_tcp_fastopen_blackhole_timeout.
    22938534c611 tcp: Fix data-races around sysctl_tcp_fastopen.
    b3ce32e33ab7 tcp: Fix data-races around sysctl_max_syn_backlog.
    b6c189aa801a tcp: Fix a data-race around sysctl_tcp_tw_reuse.
    fd6f1284e380 tcp: Fix a data-race around sysctl_tcp_notsent_lowat.
    768e42460720 tcp: Fix data-races around some timeout sysctl knobs.
    474510e174fb tcp: Fix data-races around sysctl_tcp_reordering.
    dc1a78a2b274 tcp: Fix data-races around sysctl_tcp_syncookies.
    fc489055e7e8 tcp: Fix data-races around keepalive sysctl knobs.
    f85119fb3fd6 igmp: Fix data-races around sysctl_igmp_max_msf.
    7d26db005354 igmp: Fix a data-race around sysctl_igmp_max_memberships.
    473aad9ad57f igmp: Fix data-races around sysctl_igmp_llm_reports.
    e80ff0b96613 net/tls: Fix race in TLS device down flow
    a3ac79f38d35 net: stmmac: fix dma queue left shift overflow issue
    f3da643d8763 i2c: cadence: Change large transfer count reset logic to be unconditional
    dd7b5ba44b67 net: stmmac: fix unbalanced ptp clock issue in suspend/resume flow
    c61aede097d3 tcp: Fix a data-race around sysctl_tcp_probe_interval.
    d452ce36f2d4 tcp: Fix a data-race around sysctl_tcp_probe_threshold.
    d5bece4df609 tcp: Fix a data-race around sysctl_tcp_mtu_probe_floor.
    97992e8feff3 tcp: Fix data-races around sysctl_tcp_min_snd_mss.
    514d2254c7b8 tcp: Fix data-races around sysctl_tcp_base_mss.
    77a04845f0d2 tcp: Fix data-races around sysctl_tcp_mtu_probing.
    d4f65615db7f tcp/dccp: Fix a data-race around sysctl_tcp_fwmark_accept.
    0ee76fe01ff3 ip: Fix a data-race around sysctl_fwmark_reflect.
    611ba70e5aca ip: Fix a data-race around sysctl_ip_autobind_reuse.
    94269132d0fc ip: Fix data-races around sysctl_ip_nonlocal_bind.
    11038fa781ab ip: Fix data-races around sysctl_ip_fwd_update_priority.
    b96ed5ccb09a ip: Fix data-races around sysctl_ip_fwd_use_pmtu.
    5e343e3ef464 ip: Fix data-races around sysctl_ip_no_pmtu_disc.
    77836dbe3538 igc: Reinstate IGC_REMOVED logic and implement it properly
    fb6031203ebb drm/amdgpu/display: add quirk handling for stutter mode
    43128b3eee33 perf/core: Fix data race between perf_event_set_output() and perf_mmap_close()
    5694b162f275 pinctrl: ralink: Check for null return of devm_kcalloc
    493ceca32713 power/reset: arm-versatile: Fix refcount leak in versatile_reboot_probe
    47b696dd6544 xfrm: xfrm_policy: fix a possible double xfrm_pols_put() in xfrm_bundle_lookup()
    3777ea39f05a serial: mvebu-uart: correctly report configured baudrate value
    e744aad0c442 PCI: hv: Fix interrupt mapping for multi-MSI
    522bd31d6b4b PCI: hv: Reuse existing IRTE allocation in compose_msi_msg()
    73bf070408a7 PCI: hv: Fix hv_arch_irq_unmask() for multi-MSI
    f1d2f1ce0535 PCI: hv: Fix multi-MSI to allow more than one MSI vector
    b07240ce4a09 Revert "m68knommu: only set CONFIG_ISA_DMA_API for ColdFire sub-arch"
    4f900c37f13e net: inline rollback_registered_many()
    bf2f3d1970c0 net: move rollback_registered_many()
    672fac0a4372 net: inline rollback_registered()
    b1158677d46b net: move net_set_todo inside rollback_registered()
    2e11856ec379 net: make sure devices go through netdev_wait_all_refs
    ed6964ff4714 net: make free_netdev() more lenient with unregistering devices
    2686f62fa78c docs: net: explain struct net_device lifetime
    7a99c7c32c85 xen/gntdev: Ignore failure to unmap INVALID_GRANT_HANDLE
    2ee0cab11f66 io_uring: Use original task for req identity in io_identity_cow()
    ab5050fd7430 lockdown: Fix kexec lockdown bypass with ima policy
    426336de3557 mlxsw: spectrum_router: Fix IPv4 nexthop gateway indication
    15155fa898cb riscv: add as-options for modules with assembly compontents
    31f3bb363a89 pinctrl: stm32: fix optional IRQ support to gpios
    503493453643 Linux 5.10.133
    2fc7f18ba2f9 tools headers: Remove broken definition of __LITTLE_ENDIAN
    060e39b8c21c tools arch: Update arch/x86/lib/mem{cpy,set}_64.S copies used in 'perf bench mem memcpy' - again
    fbf60f83e241 objtool: Fix elf_create_undef_symbol() endianness
    39065d54347f kvm: fix objtool relocation warning
    6849ed81a33a x86: Use -mindirect-branch-cs-prefix for RETPOLINE builds
    8e2774270aa3 um: Add missing apply_returns()
    725da3e67cec x86/bugs: Remove apostrophe typo
    81604506c26a tools headers cpufeatures: Sync with the kernel sources
    3f93b8630a91 tools arch x86: Sync the msr-index.h copy with the kernel sources
    2ef1b06ceacf KVM: emulate: do not adjust size of fastop and setcc subroutines
    8e31dfd6306e x86/kvm: fix FASTOP_SIZE when return thunks are enabled
    5779e2f0cc24 efi/x86: use naked RET on mixed mode call wrapper
    abf88ff13414 x86/speculation: Use DECLARE_PER_CPU for x86_spec_ctrl_current
    ecc0d92a9f6c x86/asm/32: Fix ANNOTATE_UNRET_SAFE use on 32-bit
    95d89ec7dba5 x86/ftrace: Add UNWIND_HINT_FUNC annotation for ftrace_stub
    668cb1ddf0ae x86/xen: Fix initialisation in hypercall_page after rethunk
    81f20e5000ec x86, kvm: use proper ASM macros for kvm_vcpu_is_preempted
    844947eee36c tools/insn: Restore the relative include paths for cross building
    c035ca88b074 x86/static_call: Serialize __static_call_fixup() properly
    eb38964b6ff8 x86/speculation: Disable RRSBA behavior
    c2ca99214428 x86/kexec: Disable RET on kexec
    51552b6b52fc x86/bugs: Do not enable IBPB-on-entry when IBPB is not supported
    609336351d08 x86/bugs: Add Cannon lake to RETBleed affected CPU list
    b24fdd0f1c33 x86/retbleed: Add fine grained Kconfig knobs
    f7851ed697be x86/cpu/amd: Enumerate BTC_NO
    a74f5d23e68d x86/common: Stamp out the stepping madness
    4d7f72b6e1bc x86/speculation: Fill RSB on vmexit for IBRS
    47ae76fb2739 KVM: VMX: Fix IBRS handling after vmexit
    5269be9111e2 KVM: VMX: Prevent guest RSB poisoning attacks with eIBRS
    84061fff2ad9 KVM: VMX: Convert launched argument to flags
    07401c2311f6 KVM: VMX: Flatten __vmx_vcpu_run()
    df93717a32f5 objtool: Re-add UNWIND_HINT_{SAVE_RESTORE}
    1dbefa577252 x86/speculation: Remove x86_spec_ctrl_mask
    ce11f91b21c2 x86/speculation: Use cached host SPEC_CTRL value for guest entry/exit
    aad83db22e99 x86/speculation: Fix SPEC_CTRL write on SMT state change
    d29c07912a49 x86/speculation: Fix firmware entry SPEC_CTRL handling
    f1b01ace814b x86/speculation: Fix RSB filling with CONFIG_RETPOLINE=n
    ea1aa926f423 x86/cpu/amd: Add Spectral Chicken
    0d1a8a16e62c objtool: Add entry UNRET validation
    fbab1c94eb1a x86/bugs: Do IBPB fallback check only once
    c8845b875437 x86/bugs: Add retbleed=ibpb
    f728eff26339 x86/xen: Rename SYS* entry points
    28aa3fa0b2c9 objtool: Update Retpoline validation
    55bba093fd91 intel_idle: Disable IBRS during long idle
    e8142e2d6cb6 x86/bugs: Report Intel retbleed vulnerability
    a0f8ef71d762 x86/bugs: Split spectre_v2_select_mitigation() and spectre_v2_user_select_mitigation()
    dabc2a1b406a x86/speculation: Add spectre_v2=ibrs option to support Kernel IBRS
    6d7e13ccc4d7 x86/bugs: Optimize SPEC_CTRL MSR writes
    3dddacf8c3cc x86/entry: Add kernel IBRS implementation
    9e727e0d9486 x86/bugs: Keep a per-CPU IA32_SPEC_CTRL value
    a989e7513619 x86/bugs: Enable STIBP for JMP2RET
    3f29791d56d3 x86/bugs: Add AMD retbleed= boot parameter
    876750cca4f0 x86/bugs: Report AMD retbleed vulnerability
    df748593c553 x86: Add magic AMD return-thunk
    c70d6f82141b objtool: Treat .text.__x86.* as noinstr
    c9eb5dcdc8f4 x86: Use return-thunk in asm code
    5b2edaf709b5 x86/sev: Avoid using __x86_return_thunk
    d6eb50e9b724 x86/vsyscall_emu/64: Don't use RET in vsyscall emulation
    ee4996f07d86 x86/kvm: Fix SETcc emulation for return thunks
    e0e06a922706 x86/bpf: Use alternative RET encoding
    00b136bb6254 x86/ftrace: Use alternative RET encoding
    7723edf5edfd x86,static_call: Use alternative RET encoding
    446eb6f08936 objtool: skip non-text sections when adding return-thunk sites
    8bdb25f7aee3 x86,objtool: Create .return_sites
    716410960ba0 x86: Undo return-thunk damage
    270de63cf4a3 x86/retpoline: Use -mfunction-return
    37b9bb094123 Makefile: Set retpoline cflags based on CONFIG_CC_IS_{CLANG,GCC}
    3e519ed8d509 x86/retpoline: Swizzle retpoline thunk
    6a2b142886c5 x86/retpoline: Cleanup some #ifdefery
    feec5277d5aa x86/cpufeatures: Move RETPOLINE flags to word 11
    7070bbb66c53 x86/kvm/vmx: Make noinstr clean
    accb8cfd506d x86/realmode: build with -D__DISABLE_EXPORTS
    236b959da9d1 objtool: Fix objtool regression on x32 systems
    148811a84292 x86/entry: Remove skip_r11rcx
    e1db6c8a69ec objtool: Fix symbol creation
    3e8afd072d09 objtool: Fix type of reloc::addend
    42ec4d71353f objtool: Fix code relocs vs weak symbols
    831d5c07b7e7 objtool: Fix SLS validation for kcov tail-call replacement
    9728af8857df crypto: x86/poly1305 - Fixup SLS
    03c5c33e043e objtool: Default ignore INT3 for unreachable
    bef21f88b47e kvm/emulate: Fix SETcc emulation function offsets with SLS
    494ed76c1446 tools arch: Update arch/x86/lib/mem{cpy,set}_64.S copies used in 'perf bench mem memcpy'
    e9925a4584dc x86: Add straight-line-speculation mitigation
    0f8532c28377 objtool: Add straight-line-speculation validation
    1f6e6683c466 x86/alternative: Relax text_poke_bp() constraint
    277f4ddc36c5 x86: Prepare inline-asm for straight-line-speculation
    3c91e2257622 x86: Prepare asm files for straight-line-speculation
    a512fcd881c1 x86/lib/atomic64_386_32: Rename things
    c2746d567dcd bpf,x86: Respect X86_FEATURE_RETPOLINE*
    1713e5c4f852 bpf,x86: Simplify computing label offsets
    38a80a3ca2cb x86/alternative: Add debug prints to apply_retpolines()
    3d13ee0d411a x86/alternative: Try inline spectre_v2=retpoline,amd
    b0e2dc950654 x86/alternative: Handle Jcc __x86_indirect_thunk_\reg
    381fd04c97b4 x86/alternative: Implement .retpoline_sites support
    6eb95718f3ea x86/retpoline: Create a retpoline thunk array
    0de47ad5b9d5 x86/retpoline: Move the retpoline thunk declarations to nospec-branch.h
    41ef95807000 x86/asm: Fixup odd GEN-for-each-reg.h usage
    8ef808b3f406 x86/asm: Fix register order
    ccb8fc65a3e8 x86/retpoline: Remove unused replacement symbols
    908bd980a80e objtool,x86: Replace alternatives with .retpoline_sites
    023e78bbf13c objtool: Explicitly avoid self modifying code in .altinstr_replacement
    6e4676f438f8 objtool: Classify symbols
    acc0be56b415 objtool: Handle __sanitize_cov*() tail calls
    9d7ec2418a3a objtool: Introduce CFI hash
    e8b1128fb0d6 objtool: Make .altinstructions section entry size consistent
    1afa44480b62 objtool: Remove reloc symbol type checks in get_alt_entry()
    e7118a25a87f objtool: print out the symbol type when complaining about it
    7ea073195745 objtool: Teach get_alt_entry() about more relocation types
    364e463097a7 objtool: Don't make .altinstructions writable
    f231b2ee8533 objtool/x86: Ignore __x86_indirect_alt_* symbols
    e32542e9ed36 objtool: Only rewrite unconditional retpoline thunk calls
    a0319253825e objtool: Fix .symtab_shndx handling for elf_create_undef_symbol()
    76474a9dd34a x86/alternative: Optimize single-byte NOPs at an arbitrary position
    f3fe1b141d2c objtool: Support asm jump tables
    0b2c8bf4983b objtool/x86: Rewrite retpoline thunk calls
    ed7783dca5ba objtool: Skip magical retpoline .altinstr_replacement
    e87c18c4a951 objtool: Cache instruction relocs
    33092b486686 objtool: Keep track of retpoline call sites
    8a6d73f7db7f objtool: Add elf_create_undef_symbol()
    b69e1b4b689f objtool: Extract elf_symbol_add()
    da962cd0a2fe objtool: Extract elf_strtab_concat()
    b37c43925011 objtool: Create reloc sections implicitly
    fcdb7926d399 objtool: Add elf_create_reloc() helper
    c9049cf4804a objtool: Rework the elf_rebuild_reloc_section() logic
    d42fa5bf19fc objtool: Handle per arch retpoline naming
    6e95f8caffb3 objtool: Correctly handle retpoline thunk calls
    28ca35129674 x86/retpoline: Simplify retpolines
    e68db6f780c6 x86/alternatives: Optimize optimize_nops()
    9a6471666b73 x86: Add insn_decode_kernel()
    d9cd21911498 x86/alternative: Use insn_decode()
    e6f8dc86a1c1 x86/insn-eval: Handle return values from the decoder
    6bc6875b82a0 x86/insn: Add an insn_decode() API
    76c513c87f59 x86/insn: Add a __ignore_sync_check__ marker
    a3d96c74395e x86/insn: Rename insn_decode() to insn_decode_from_regs()
    fd80da64cffe x86/alternative: Use ALTERNATIVE_TERNARY() in _static_cpu_has()
    341e6178c1cf x86/alternative: Support ALTERNATIVE_TERNARY
    0c4c69856996 x86/alternative: Support not-feature
    c9cf908b89ca x86/alternative: Merge include files
    5f93d900b9d3 x86/xen: Support objtool vmlinux.o validation in xen-head.S
    b626e17c11f5 x86/xen: Support objtool validation in xen-asm.S
    3116dee2704b objtool: Combine UNWIND_HINT_RET_OFFSET and UNWIND_HINT_FUNC
    53e89bc78e43 objtool: Assume only ELF functions do sibling calls
    3e674f265289 objtool: Support retpoline jump detection for vmlinux.o
    917a4f6348d9 objtool: Support stack layout changes in alternatives
    e9197d768f97 objtool: Add 'alt_group' struct
    1d516bd72a68 objtool: Refactor ORC section generation
    dd87aa5f610b KVM/nVMX: Use __vmx_vcpu_run in nested_vmx_check_vmentry_hw
    0ca2ba6e4d13 KVM/VMX: Use TEST %REG,%REG instead of CMP $0,%REG in vmenter.S
    7748091a3127 Linux 5.10.132
    06a5dc3911a3 x86/pat: Fix x86_has_pat_wp()
    d9cb6fabc901 serial: 8250: Fix PM usage_count for console handover
    e1bd94dd9e5c serial: pl011: UPSTAT_AUTORTS requires .throttle/unthrottle
    b8c466112656 serial: stm32: Clear prev values before setting RTS delays
    039ffe436ae5 serial: 8250: fix return error code in serial8250_request_std_resource()
    bfee93c9a6c3 vt: fix memory overlapping when deleting chars in the buffer
    5450430199e3 tty: serial: samsung_tty: set dma burst_size to 1
    0e5668ed7b7a usb: dwc3: gadget: Fix event pending check
    f1e01a42dcbd usb: typec: add missing uevent when partner support PD
    61ab5d644e16 USB: serial: ftdi_sio: add Belimo device ids
    58b94325ee80 signal handling: don't use BUG_ON() for debugging
    e75f692b79b4 nvme-pci: phison e16 has bogus namespace ids
    54bf0b8c75af Revert "can: xilinx_can: Limit CANFD brp to 2"
    35ce2c64e57e ARM: dts: stm32: use the correct clock source for CEC on stm32mp151
    227ee155eaf5 soc: ixp4xx/npe: Fix unused match warning
    136d7987fcfd x86: Clear .brk area at early boot
    fd830d8dd59a irqchip: or1k-pic: Undefine mask_ack for level triggered hardware
    dae43b37925c ASoC: madera: Fix event generation for rate controls
    cae4b78f3c7d ASoC: madera: Fix event generation for OUT1 demux
    a7634527cb23 ASoC: cs47l15: Fix event generation for low power mux control
    41f97b0ecfb3 ASoC: dapm: Initialise kcontrol data for mux/demux controls
    11a14e4f31b7 ASoC: wm5110: Fix DRE control
    6cbbe59fdc7e ASoC: SOF: Intel: hda-loader: Clarify the cl_dsp_init() flow
    ef1e38532f4b pinctrl: aspeed: Fix potential NULL dereference in aspeed_pinmux_set_mux()
    13fb9105cfc9 ASoC: ops: Fix off by one in range control validation
    67dc32542a1f net: sfp: fix memory leak in sfp_probe()
    104594de2778 nvme: fix regression when disconnect a recovering ctrl
    5504e63832e7 nvme-tcp: always fail a request when sending it failed
    de876f36f9a3 NFC: nxp-nci: don't print header length mismatch on i2c error
    efa78f2ae363 net: tipc: fix possible refcount leak in tipc_sk_create()
    bacfef0bf2fa platform/x86: hp-wmi: Ignore Sanitization Mode event
    3ea9dbf7c2f4 cpufreq: pmac32-cpufreq: Fix refcount leak bug
    24cd0b9bfdff scsi: hisi_sas: Limit max hw sectors for v3 HW
    c458ebd6591e netfilter: br_netfilter: do not skip all hooks with 0 priority
    93135dca8c4c virtio_mmio: Restore guest page size on resume
    d6115800325c virtio_mmio: Add missing PM calls to freeze/restore
    31e16a5e113f mm: sysctl: fix missing numa_stat when !CONFIG_HUGETLB_PAGE
    c713de1d80a5 net/tls: Check for errors in tls_device_init
    eb58fd350a85 KVM: x86: Fully initialize 'struct kvm_lapic_irq' in kvm_pv_kick_cpu_op()
    c2978d0124f2 net: atlantic: remove aq_nic_deinit() when resume
    38e081ee06cb net: atlantic: remove deep parameter on suspend/resume functions
    b82e4ad58a7f sfc: fix kernel panic when creating VF
    2d4efc9a0e85 seg6: bpf: fix skb checksum in bpf_push_seg6_encap()
    7b38df59a8f4 seg6: fix skb checksum in SRv6 End.B6 and End.B6.Encaps behaviors
    834fa0a22fe8 seg6: fix skb checksum evaluation in SRH encapsulation/insertion
    c2240500817b sfc: fix use after free when disabling sriov
    c1d9702ceb4a ima: Fix potential memory leak in ima_init_crypto()
    eb360267e1e9 ima: force signature verification when CONFIG_KEXEC_SIG is configured
    29c6a632f819 net: ftgmac100: Hold reference returned by of_get_child_by_name()
    a51040d4b120 nexthop: Fix data-races around nexthop_compat_mode.
    2c56958de89b ipv4: Fix data-races around sysctl_ip_dynaddr.
    038a87b3e460 raw: Fix a data-race around sysctl_raw_l3mdev_accept.
    38d78c7b4be7 icmp: Fix a data-race around sysctl_icmp_ratemask.
    4ebf26153215 icmp: Fix a data-race around sysctl_icmp_ratelimit.
    b8871d918602 sysctl: Fix data-races in proc_dointvec_ms_jiffies().
    2744e302e752 drm/i915/gt: Serialize TLB invalidates with GT resets
    636e5dbaf097 drm/i915/selftests: fix a couple IS_ERR() vs NULL tests
    359f2bca7989 ARM: dts: sunxi: Fix SPI NOR campatible on Orange Pi Zero
    e1aa73454ab4 ARM: dts: at91: sama5d2: Fix typo in i2s1 node
    418b191d5f22 ipv4: Fix a data-race around sysctl_fib_sync_mem.
    e088ceb73c24 icmp: Fix data-races around sysctl.
    fe2a35fa2c4f cipso: Fix data-races around sysctl.
    f5811b8df2b9 net: Fix data-races around sysctl_mem.
    d54b6ef53cbc inetpeer: Fix data-races around sysctl.
    6481a8a72a74 tcp: Fix a data-race around sysctl_tcp_max_orphans.
    609ce7ff75a7 sysctl: Fix data races in proc_dointvec_jiffies().
    a5ee448d388c sysctl: Fix data races in proc_doulongvec_minmax().
    e3a2144b3b6b sysctl: Fix data races in proc_douintvec_minmax().
    71ddde27c2eb sysctl: Fix data races in proc_dointvec_minmax().
    d5d54714e329 sysctl: Fix data races in proc_douintvec().
    80cc28a4b484 sysctl: Fix data races in proc_dointvec().
    9cc8edc571b8 net: stmmac: dwc-qos: Disable split header for Tegra194
    cd201332cc39 ASoC: Intel: Skylake: Correct the handling of fmt_config flexible array
    fbb87a0ed216 ASoC: Intel: Skylake: Correct the ssp rate discovery in skl_get_ssp_clks()
    bb8bf8038771 ASoC: tas2764: Fix amp gain register offset & default
    f1cd988de463 ASoC: tas2764: Correct playback volume range
    52d1b4250ca9 ASoC: tas2764: Fix and extend FSYNC polarity handling
    249fe2d20d55 ASoC: tas2764: Add post reset delays
    f160a1f97091 ASoC: sgtl5000: Fix noise on shutdown/remove
    831e190175f1 ima: Fix a potential integer overflow in ima_appraise_measurement
    592f3bad00b7 drm/i915: fix a possible refcount leak in intel_dp_add_mst_connector()
    4cb5c1950b7a net/mlx5e: Fix capability check for updating vnic env counters
    6eb1d0c370af net/mlx5e: kTLS, Fix build time constant test in RX
    c87d5211be84 net/mlx5e: kTLS, Fix build time constant test in TX
    d6cab2e06c33 ARM: 9210/1: Mark the FDT_FIXED sections as shareable
    3d82fba7d363 ARM: 9209/1: Spectre-BHB: avoid pr_info() every time a CPU comes out of idle
    0c300e294d1c spi: amd: Limit max transfer and message size
    d8d42c92fe56 ARM: dts: imx6qdl-ts7970: Fix ngpio typo and count
    91f90b571f1a ext4: fix race condition between ext4_write and ext4_convert_inline_data
    9d883b3f000d Revert "evm: Fix memleak in init_desc"
    41007669fc3b sh: convert nommu io{re,un}map() to static inline functions
    ea4dbcfb9532 nilfs2: fix incorrect masking of permission flags for symlinks
    14e63942d63e fs/remap: constrain dedupe of EOF blocks
    0581613df7f9 drm/panfrost: Fix shrinker list corruption by madvise IOCTL
    2e760fe05d3e drm/panfrost: Put mapping instead of shmem obj on panfrost_mmu_map_fault_addr() error
    c1ea39a77cbd btrfs: return -EAGAIN for NOWAIT dio reads/writes on compressed and inline extents
    7657e3958535 cgroup: Use separate src/dst nodes when preloading css_sets for migration
    e013ea2a51a9 wifi: mac80211: fix queue selection for mesh/OCB interfaces
    db6e8c30154f ARM: 9214/1: alignment: advance IT state after emulating Thumb instruction
    f851e4f40253 ARM: 9213/1: Print message about disabled Spectre workarounds only once
    fa40bb3a5f0c ip: fix dflt addr selection for connected nexthop
    4d3e0fb05eec net: sock: tracing: Fix sock_exceed_buf_limit not to dereference stale pointer
    78a1400c42ee tracing/histograms: Fix memory leak problem
    931dbcc2e02f mm: split huge PUD on wp_huge_pud fallback
    91530f675e88 fix race between exit_itimers() and /proc/pid/timers
    b9c32a6886af xen/netback: avoid entering xenvif_rx_next_skb() with an empty rx queue
    782a6b07b127 ALSA: hda/realtek - Enable the headset-mic on a Xiaomi's laptop
    cacac3e13a81 ALSA: hda/realtek - Fix headset mic problem for a HP machine with alc221
    08ab39027a88 ALSA: hda/realtek - Fix headset mic problem for a HP machine with alc671
    4d0d15d18467 ALSA: hda/realtek: Fix headset mic for Acer SF313-51
    b642a3476a34 ALSA: hda/conexant: Apply quirk for another HP ProDesk 600 G3 model
    4486bbe92840 ALSA: hda - Add fixup for Dell Latitidue E5430
    8f95261a0064 Linux 5.10.131
    cc5ee0e0eed0 Revert "mtd: rawnand: gpmi: Fix setting busy timeout setting"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 53ccd41033..9387c67cfb 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "63771123b1eea439bea2cf80f9f5682667528d9f"
-SRCREV_meta ?= "96ea2660bb97e15f48f4885b9e436f24c3606bd9"
+SRCREV_machine ?= "6df690626649ba5430a379f63a5f7b7423ce2e48"
+SRCREV_meta ?= "ed7e0c3bb9464387ba99fedd5ea32bf78ae2fe45"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.130"
+LINUX_VERSION ?= "5.10.135"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 7b3aaa7fa0..d7aa3281cc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.130"
+LINUX_VERSION ?= "5.10.135"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "bff12aa9748d83efc518e524858913c028f0707a"
-SRCREV_machine ?= "5bdf36bd73803640ee495fc6f36b0207993bf62a"
-SRCREV_meta ?= "96ea2660bb97e15f48f4885b9e436f24c3606bd9"
+SRCREV_machine:qemuarm ?= "3b1c4608c04d645b292f13cc550b5151e032794b"
+SRCREV_machine ?= "cbfab86927ad95da60b8d49957ca941df615d877"
+SRCREV_meta ?= "ed7e0c3bb9464387ba99fedd5ea32bf78ae2fe45"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index d5bf2c9496..73a58e59a0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8d513bf2294b60cbfa7bfbfab43f7ec458e88de0"
-SRCREV_machine:qemuarm64 ?= "f86e70ec0a39fa6cfd5b19a013703345cf9e8d4c"
-SRCREV_machine:qemumips ?= "a5c1977699a2733ed4ddd08f1bcc1cbcc1fa8862"
-SRCREV_machine:qemuppc ?= "2e52a4c55beaea77e6b99720de58624c416e7569"
-SRCREV_machine:qemuriscv64 ?= "2883e69e202dc7948c99a7828e192b2b42c2d90a"
-SRCREV_machine:qemuriscv32 ?= "2883e69e202dc7948c99a7828e192b2b42c2d90a"
-SRCREV_machine:qemux86 ?= "2883e69e202dc7948c99a7828e192b2b42c2d90a"
-SRCREV_machine:qemux86-64 ?= "2883e69e202dc7948c99a7828e192b2b42c2d90a"
-SRCREV_machine:qemumips64 ?= "37c7c3e8979a2b0eb75bf8ceab7f2b7f12565ceb"
-SRCREV_machine ?= "2883e69e202dc7948c99a7828e192b2b42c2d90a"
-SRCREV_meta ?= "96ea2660bb97e15f48f4885b9e436f24c3606bd9"
+SRCREV_machine:qemuarm ?= "23ab0f8300e7b90fdf1e0be923933d5cfd03b618"
+SRCREV_machine:qemuarm64 ?= "5ff1949cbb7ff90ae3e4dc6fd0fd9876ffaab9d2"
+SRCREV_machine:qemumips ?= "01c75770046189608bb4ea9977521ec58a15b6bf"
+SRCREV_machine:qemuppc ?= "7dd170da9eacb57c6d8eff88ca24b8bf55ab042a"
+SRCREV_machine:qemuriscv64 ?= "d09b184cbc0321794bda715ab560dec077a048d0"
+SRCREV_machine:qemuriscv32 ?= "d09b184cbc0321794bda715ab560dec077a048d0"
+SRCREV_machine:qemux86 ?= "d09b184cbc0321794bda715ab560dec077a048d0"
+SRCREV_machine:qemux86-64 ?= "d09b184cbc0321794bda715ab560dec077a048d0"
+SRCREV_machine:qemumips64 ?= "a099189ac94c7218c09f1519ea4222fb2d9070be"
+SRCREV_machine ?= "d09b184cbc0321794bda715ab560dec077a048d0"
+SRCREV_meta ?= "ed7e0c3bb9464387ba99fedd5ea32bf78ae2fe45"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.130"
+LINUX_VERSION ?= "5.10.135"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.25.1


