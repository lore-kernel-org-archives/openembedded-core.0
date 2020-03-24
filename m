Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
 by mx.groups.io with SMTP id smtpd.web11.6421.1585057843338847835
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 06:50:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=UAIbKLN4;
 spf=pass (domain: gmail.com, ip: 209.85.208.68, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f68.google.com with SMTP id a43so20752493edf.6
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 06:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=093hxVpfYdo8ZrKds3KJM2Vohoq28mzKMXOVShYs0Ac=;
        b=UAIbKLN4YtmZYkGjPd/VbsInO8Icdw2nJyf9hAX39FG2y0vueDWRlgkR2LhHmj3dRk
         CDlwMapMbh6CUvbdT3ck8DNDgkQptbpHrsATrwVHUSUW3ZtNsYvvQK+0d5bsjHO6ecu0
         EQgNuCmfdWfOPNge7JDcZP9kmyXHaTU85+CByWJxVK9T5fMPyxc4n8IT9C4MqUSBWdWf
         STFP0XP3Fwg5B20MqxFkTmL8ULMZY2XCGgRbhpH9FpnuTuephevZ1n9vyepJIEf8MV5p
         SMYe38T19dKNI3pkZ6S2EyWKsde90Sky+0kvxNQZu5boitQ//+FlpB9ubZE2qFhxS2R8
         JB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=093hxVpfYdo8ZrKds3KJM2Vohoq28mzKMXOVShYs0Ac=;
        b=D+DmiVjaoeuD9teyvijPsS37fd5TY9Pf0T8XsnNWYsw5MLfJtDPTxiYaeq9lGwOeRl
         N8/nzYg7A1jX4DKMW/0tl5Qaq2vWhAfCQgp600SXvlErq6BiE0RRVYRBkxRI9V57NboR
         OP4vU8QqDvmux/d5XHJQLeOfl9wVQdt2qd8S2bRas+x9iyZ/AU2n/Zcr0TocYc5FLd+8
         L520LfLPNBA7lpJh2Xsxab6Hi1OyefAHWPOF+R2V6m1UDIX63w+VDUt7YV7WqgatoJuz
         aHCMr8NLdBqk0u2E3qsEI2CjosXh6t7mN2ZKASjfptCljNbyEjg8V3AZxADoLQ7HSBrW
         QEAw==
X-Gm-Message-State: ANhLgQ2x1pC8h3HS3PyCGR7G3G/ppP+o6kIEjwZxmvZeOMKmXwHVTC0X
	WBH2efZkEsFNJGoKdvXBDhXM99KbvK6w8oZ12Gs=
X-Google-Smtp-Source: ADFU+vtygpA6rGy8AW/bK8S//SIM/xkRYDbdenSV0Nyurow0uYCX8VIhlNF9FqrxGleh6hqp48bJVEuuzDqheWNhVJM=
X-Received: by 2002:a50:9fcb:: with SMTP id c69mr26005174edf.27.1585057841480;
 Tue, 24 Mar 2020 06:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1584839764.git.bruce.ashfield@gmail.com>
 <d72687a010b7a6ec9af62fe24e9026ade26d53c0.1584839764.git.bruce.ashfield@gmail.com>
 <CAMKF1soydrW09V_DuyUMr6ZZMk4Vgg-i32pyRUA6CpOdpsCW9w@mail.gmail.com>
 <CADkTA4Oyt1vgE0OBB_gmcn=XsMmugNVZO60bdaoA057TLki1bA@mail.gmail.com> <CAMKF1sqYRzup8nQkrT9whY5gtvbMDidDWFnKc2SfwCNoqbzNYA@mail.gmail.com>
In-Reply-To: <CAMKF1sqYRzup8nQkrT9whY5gtvbMDidDWFnKc2SfwCNoqbzNYA@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Tue, 24 Mar 2020 09:50:29 -0400
Message-ID: <CADkTA4MwgHyhL4TozVh2UCjDU9J3SfTNZTJ9FaUqZRgMgTDo2A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] linux-yocto/5.4: update to v5.4.27
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 24, 2020 at 9:42 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Mar 24, 2020 at 5:40 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >
> > On Tue, Mar 24, 2020 at 2:35 AM Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > Hi Bruce
> > >
> > > This results in kernel-selftest failure regression
> > >
> > > errors.yoctoproject.org/Errors/Build/100385/
> > >
> > > and also same errors as reported here
> > > https://bugs.launchpad.net/ubuntu-kernel-tests/+bug/1867596
> > >
> > > I have fixed them via three patches that are here
> > >
> > > https://git.openembedded.org/openembedded-core-contrib/commit/?h=yoe/mut&id=2c15bc35809365db8c586df7c383ed01b00e6618
> > >
> > > Please cherry-pick these 3 patches as well on this pull while you are here.
> > >
> >
> > Only one of the patches has any upstream information.
> >
> > Are the reverts also being done in mainline ? Or is a different fix ?
> >
>
> these are all results of half cherry picks into stable. all works fine in master
> they should be reverted in stable but I have not sent them to lkml

Aha. Thanks, that helps me understand what was going on.

I'll amend the logs slightly and yank them into my tree.

Cheers,

Bruce

>
> > What about the one that does have an upstream status, has it been
> > submitted to -stable ?
> >
> > Bruce
> >
> > > On Sat, Mar 21, 2020 at 6:18 PM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> > > >
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > >
> > > > Updating linux-yocto/5.4 to the latest korg -stable release that comprises
> > > > the following commits:
> > > >
> > > >     585e0cc08069 Linux 5.4.27
> > > >     20ba40d262b0 ipv4: ensure rcu_read_lock() in cipso_v4_error()
> > > >     81e0dac3780a ARM: 8961/2: Fix Kbuild issue caused by per-task stack protector GCC plugin
> > > >     1dc67950e2d1 HID: add ALWAYS_POLL quirk to lenovo pixart mouse
> > > >     5d961582ea88 HID: google: add moonball USB id
> > > >     ae119b7e1247 mm: slub: add missing TID bump in kmem_cache_alloc_bulk()
> > > >     47b6d269dbbd ARM: 8958/1: rename missed uaccess .fixup section
> > > >     1a9e78628d44 ARM: 8957/1: VDSO: Match ARMv8 timer in cntvct_functional()
> > > >     881876bee657 net: qrtr: fix len of skb_put_padto in qrtr_node_enqueue
> > > >     235fb892d846 blk-mq: insert flush request to the front of dispatch queue
> > > >     dbce8292217a jbd2: fix data races at struct journal_head
> > > >     99746e92fa4c sfc: fix timestamp reconstruction at 16-bit rollover points
> > > >     e2b8b042c98b net: rmnet: fix packet forwarding in rmnet bridge mode
> > > >     34c550ebb219 net: rmnet: fix bridge mode bugs
> > > >     8eccc6d06ea1 net: rmnet: use upper/lower device infrastructure
> > > >     835bbd892683 net: rmnet: do not allow to change mux id if mux id is duplicated
> > > >     5ce5e95d72f1 net: rmnet: remove rcu_read_lock in rmnet_force_unassociate_device()
> > > >     002b4bd9b51d net: rmnet: fix suspicious RCU usage
> > > >     8a027eee62f7 net: rmnet: fix NULL pointer dereference in rmnet_changelink()
> > > >     006cd2426a05 net: rmnet: fix NULL pointer dereference in rmnet_newlink()
> > > >     cfc7f5fe5c61 hinic: fix a bug of rss configuration
> > > >     e6f52d5ce172 hinic: fix a bug of setting hw_ioctxt
> > > >     65340b196811 hinic: fix a irq affinity bug
> > > >     1c7dde0a9bfc net: phy: mscc: fix firmware paths
> > > >     4d6ee3123d65 slip: not call free_netdev before rtnl_unlock in slip_open
> > > >     d1984c92f072 signal: avoid double atomic counter increments for user accounting
> > > >     df8e98b00941 kbuild: add dt_binding_check to PHONY in a correct place
> > > >     fd1f29f2a824 kbuild: add dtbs_check to PHONY
> > > >     bbf3acbb8a77 drm/amdgpu: fix memory leak during TDR test(v2)
> > > >     74c77d6a4ea9 blk-mq: insert passthrough request into hctx->dispatch directly
> > > >     74886a6d9de8 net: ll_temac: Handle DMA halt condition caused by buffer underrun
> > > >     c2cffaea4fde net: ll_temac: Fix RX buffer descriptor handling on GFP_ATOMIC pressure
> > > >     6e3b69543b5e net: ll_temac: Add more error handling of dma_map_single() calls
> > > >     0c050d655475 net: ll_temac: Fix race condition causing TX hang
> > > >     a342bb7b9902 mac80211: rx: avoid RCU list traversal under mutex
> > > >     5d92d834aa27 net: ks8851-ml: Fix IRQ handling and locking
> > > >     d939f3389f9b net: usb: qmi_wwan: restore mtu min/max values after raw_ip switch
> > > >     6c663120ecdb scsi: libfc: free response frame from GPN_ID
> > > >     079e9ad79410 cfg80211: check reg_rule for NULL in handle_channel_custom()
> > > >     a6f7e69cfafd tracing: Fix number printing bug in print_synth_event()
> > > >     c35aa36fec91 selftests/rseq: Fix out-of-tree compilation
> > > >     dd0d2d6ab6a2 HID: hid-bigbenff: fix race condition for scheduled work during removal
> > > >     ccb747d805d3 HID: hid-bigbenff: call hid_hw_stop() in case of error
> > > >     1bc271dd397d HID: hid-bigbenff: fix general protection fault caused by double kfree
> > > >     190e929e6cba HID: i2c-hid: add Trekstor Surfbook E11B to descriptor override
> > > >     87bd74b77531 ACPI: watchdog: Set default timeout in probe
> > > >     65b44497414b HID: apple: Add support for recent firmware on Magic Keyboards
> > > >     20eed7692749 ACPI: watchdog: Allow disabling WDAT at boot
> > > >     f3c478104a9a drm/amdgpu: Fix TLB invalidation request when using semaphore
> > > >     f6fccb0a0e59 netfilter: xt_hashlimit: unregister proc file before releasing mutex
> > > >     536942bf70b5 netfilter: hashlimit: do not use indirect calls during gc
> > > >     257edc6db943 Linux 5.4.26
> > > >     881f9469cc9f net/smc: cancel event worker during device removal
> > > >     dbaba2a4db6e net/smc: check for valid ib_client_data
> > > >     aa38bea47fd2 ipv6: restrict IPV6_ADDRFORM operation
> > > >     62fd4e348df2 iommu/amd: Fix IOMMU AVIC not properly update the is_run bit in IRTE
> > > >     8753b0cad128 i2c: acpi: put device when verifying client fails
> > > >     03d524d70ecf iommu/vt-d: Ignore devices with out-of-spec domain number
> > > >     9493a6361d81 iommu/vt-d: Fix the wrong printing in RHSA parsing
> > > >     2d106e75da45 netfilter: nft_chain_nat: inet family is missing module ownership
> > > >     56e84ae47481 netfilter: nf_tables: dump NFTA_CHAIN_FLAGS attribute
> > > >     15ec06c6a894 netfilter: nft_tunnel: add missing attribute validation for tunnels
> > > >     e92dea63e278 netfilter: nft_payload: add missing attribute validation for payload csum flags
> > > >     896d11cdcab9 netfilter: cthelper: add missing attribute validation for cthelper
> > > >     c61868ef2795 perf bench futex-wake: Restore thread count default to online CPU count
> > > >     b57542934121 nl80211: add missing attribute validation for channel switch
> > > >     5bd0ee5727d2 nl80211: add missing attribute validation for beacon report scanning
> > > >     b0fd0b85c377 nl80211: add missing attribute validation for critical protocol indication
> > > >     c684f4f68c0a i2c: gpio: suppress error on probe defer
> > > >     4f60640723cf iommu/vt-d: Fix RCU-list bugs in intel_iommu_init()
> > > >     b8c3cbca80e8 driver code: clarify and fix platform device DMA mask allocation
> > > >     a9fef78caac0 drm/i915/gvt: Fix unnecessary schedule timer when no vGPU exits
> > > >     f5ace0987a69 pinctrl: core: Remove extra kref_get which blocks hogs being freed
> > > >     d2df67d7411e drm/i915/gvt: Fix dma-buf display blur issue on CFL
> > > >     a6ea1df94903 virtio_ring: Fix mem leak with vring_new_virtqueue()
> > > >     b758686cf05a pinctrl: imx: scu: Align imx sc msg structs to 4
> > > >     66ee6b9b91b1 pinctrl: meson-gxl: fix GPIOX sdio pins
> > > >     93b8be43c9df clk: imx8mn: Fix incorrect clock defines
> > > >     130bd50d009c batman-adv: Don't schedule OGM for disabled interface
> > > >     8159e369d1e6 iommu/vt-d: Fix a bug in intel_iommu_iova_to_phys() for huge page
> > > >     28ffabf65e42 iommu/vt-d: Fix RCU list debugging warnings
> > > >     798c1441bde8 iommu/vt-d: dmar: replace WARN_TAINT with pr_warn + add_taint
> > > >     77abae8657c5 iommu/dma: Fix MSI reservation allocation
> > > >     923f2b3ab352 x86/mce: Fix logic and comments around MSR_PPIN_CTL
> > > >     53644e59c1c5 perf/amd/uncore: Replace manual sampling check with CAP_NO_INTERRUPT flag
> > > >     02013734629b mt76: fix array overflow on receiving too many fragments for a packet
> > > >     1357bf0ca50f i2c: designware-pci: Fix BUG_ON during device removal
> > > >     849233b7421c efi: Add a sanity check to efivar_store_raw()
> > > >     594b38226f84 efi: Fix a race and a buffer overflow while reading efivars via sysfs
> > > >     680613f44162 x86/ioremap: Map EFI runtime services data as encrypted for SEV
> > > >     f19bbb24a108 macintosh: windfarm: fix MODINFO regression
> > > >     ea1299be02e1 fscrypt: don't evict dirty inodes after removing key
> > > >     b7e54dd751fa blk-iocost: fix incorrect vtime comparison in iocg_is_idle()
> > > >     0c47d02ad451 ipmi_si: Avoid spurious errors for optional IRQs
> > > >     fbbacd0dcbc3 s390/dasd: fix data corruption for thin provisioned devices
> > > >     63050b3dc02f fuse: fix stack use after return
> > > >     f2947aa48017 ARC: define __ALIGN_STR and __ALIGN symbols for ARC
> > > >     4873041d3723 KVM: nVMX: avoid NULL pointer dereference with incorrect EVMCS GPAs
> > > >     84c6ce00e29b KVM: x86: clear stale x86_emulate_ctxt->intercept value
> > > >     9719442f9e24 gfs2_atomic_open(): fix O_EXCL|O_CREAT handling on cold dcache
> > > >     918ba24a9bbf cifs_atomic_open(): fix double-put on late allocation failure
> > > >     3625e9dfd80a ktest: Add timeout for ssh sync testing
> > > >     a67ada0dcd9a pinctrl: falcon: fix syntax error
> > > >     1961b5bb6ac8 mmc: sdhci-pci-gli: Enable MSI interrupt for GL975x
> > > >     0e57e9f70247 drm/i915: Defer semaphore priority bumping to a workqueue
> > > >     105d663d8430 drm/i915: be more solid in checking the alignment
> > > >     40c4ad7f1b15 drm/amd/display: remove duplicated assignment to grph_obj_type
> > > >     22540ca3d00d workqueue: don't use wq_select_unbound_cpu() for bound works
> > > >     70612567f6ce netfilter: x_tables: xt_mttg_seq_next should increase position index
> > > >     bfacd2806769 netfilter: xt_recent: recent_seq_next should increase position index
> > > >     16c0ae0a0437 netfilter: synproxy: synproxy_cpu_seq_next should increase position index
> > > >     1c6e75702fd1 netfilter: nf_conntrack: ct_cpu_seq_next should increase position index
> > > >     3ca828bd0fcb iommu/vt-d: quirk_ioat_snb_local_iommu: replace WARN_TAINT with pr_warn + add_taint
> > > >     ad29b9fd6672 virtio-blk: fix hw_queue stopped on arbitrary error
> > > >     c656fc438758 iwlwifi: mvm: Do not require PHY_SKU NVM section for 3168 devices
> > > >     55c81e9b1b5c netfilter: nf_tables: fix infinite loop when expr is not available
> > > >     72655d842636 cgroup: Iterate tasks that did not finish do_exit()
> > > >     cb81ee946e15 cgroup: cgroup_procs_next should increase position index
> > > >     6b22fba4c15b net: phy: Avoid multiple suspends
> > > >     1375e2ca1f2d net: dsa: Don't instantiate phylink for CPU/DSA ports unless needed
> > > >     dd359b5a7bd4 selftests/net/fib_tests: update addr_metric_test for peer route testing
> > > >     8759b193d8f8 net/ipv6: remove the old peer route if change it to a new one
> > > >     2eaf298d121f net/ipv6: need update peer route when modify metric
> > > >     886345d9305a net: phy: fix MDIO bus PM PHY resuming
> > > >     4d365c7b4747 net: phy: avoid clearing PHY interrupts twice in irq handler
> > > >     7030138e3c6d nfc: add missing attribute validation for vendor subcommand
> > > >     c9f29e311fc2 nfc: add missing attribute validation for deactivate target
> > > >     4cba04a3272b nfc: add missing attribute validation for SE API
> > > >     4c16ef8ee16c tipc: add missing attribute validation for MTU property
> > > >     6049f6122a51 team: add missing attribute validation for array index
> > > >     cae05c2998ae team: add missing attribute validation for port ifindex
> > > >     e31cd96bce59 net: taprio: add missing attribute validation for txtime delay
> > > >     7b8f902c5130 net: fq: add missing attribute validation for orphan mask
> > > >     05b1a3781204 macsec: add missing attribute validation for port
> > > >     f77e588fb745 can: add missing attribute validation for termination
> > > >     e9438d517277 nl802154: add missing attribute validation for dev_type
> > > >     84eaa53dbea8 nl802154: add missing attribute validation
> > > >     e80e3f725244 fib: add missing attribute validation for tun_id
> > > >     dd4708377988 devlink: validate length of region addr/len
> > > >     4136c4ee4159 devlink: validate length of param values
> > > >     c0a7416a5403 net: memcg: fix lockdep splat in inet_csk_accept()
> > > >     4a1444818200 net: memcg: late association of sock to memcg
> > > >     01f4cb0005a7 cgroup: memcg: net: do not associate sock with unrelated cgroup
> > > >     4461ae0c15f6 bnxt_en: fix error handling when flashing from file
> > > >     97207f491014 bnxt_en: reinitialize IRQs when MTU is modified
> > > >     51925ac4c547 bonding/alb: make sure arp header is pulled before accessing it
> > > >     6c7247106941 taprio: Fix sending packets without dequeueing them
> > > >     ea5d05c59430 slip: make slhc_compress() more robust against malicious packets
> > > >     312a5fa6877e sfc: detach from cb_page in efx_copy_channel()
> > > >     d21ba36e4091 r8152: check disconnect status after long sleep
> > > >     6ea05d53b996 net: systemport: fix index check to avoid an array out of bounds access
> > > >     62a24fad9610 net: stmmac: dwmac1000: Disable ACS if enhanced descs are not used
> > > >     d0042bc982f1 net: phy: bcm63xx: fix OOPS due to missing driver name
> > > >     a200e439c08b net/packet: tpacket_rcv: do not increment ring index on drop
> > > >     5afc3791c83e net: nfc: fix bounds checking bugs on "pipe"
> > > >     f815f9a89536 net: macsec: update SCI upon MAC address change.
> > > >     04f430a90bf0 netlink: Use netlink header as base to calculate bad attribute offset
> > > >     608f54653eaf net/ipv6: use configured metric when add peer route
> > > >     8f4cd4bed97b net: hns3: fix a not link up issue when fibre port supports autoneg
> > > >     e9d416dba4cc net: fec: validate the new settings in fec_enet_set_coalesce()
> > > >     9739d3d1bbb1 net: dsa: mv88e6xxx: fix lockup on warm boot
> > > >     9dd6cb14dd01 net: dsa: fix phylink_start()/phylink_stop() calls
> > > >     7b5db04f24a2 macvlan: add cond_resched() during multicast processing
> > > >     f992458686b8 ipvlan: don't deref eth hdr before checking it's set
> > > >     1f72737eecd7 ipvlan: do not use cond_resched_rcu() in ipvlan_process_multicast()
> > > >     c46034cfa1d4 ipvlan: do not add hardware address of master to its unicast filter list
> > > >     e4d08bef04df ipvlan: add cond_resched_rcu() while processing muticast backlog
> > > >     1f905985fe19 ipv6/addrconf: call ipv6_mc_up() for non-Ethernet interface
> > > >     8be8c4555431 inet_diag: return classid for all socket types
> > > >     aece82f5de2a gre: fix uninit-value in __iptunnel_pull_header
> > > >     0a062dd0d460 cgroup, netclassid: periodically release file_lock on classid updating
> > > >     8d22f4147325 ALSA: hda/realtek - Fixed one of HP ALC671 platform Headset Mic supported
> > > >     986af74c63a8 ALSA: hda/realtek - Add Headset Mic supported for HP cPC
> > > >     effe2041c3bf ALSA: hda/realtek - More constifications
> > > >     8f310017aab2 virtio_balloon: Adjust label in virtballoon_probe
> > > >     18fe53f6dfbc Linux 5.4.25
> > > >     564f7c2b5691 drm/virtio: module_param_named() requires linux/moduleparam.h
> > > >     09a8dd779e47 csky: Implement copy_thread_tls
> > > >     e28c9b3caf6b block, bfq: remove ifdefs from around gets/puts of bfq groups
> > > >     92ed51e65167 block, bfq: get a ref to a group when adding it to a service tree
> > > >     e657b1f6b9f4 efi: READ_ONCE rng seed size before munmap
> > > >     cca130fc00cd efi/x86: Handle by-ref arguments covering multiple pages in mixed mode
> > > >     61a7f1e13b92 efi/x86: Align GUIDs to their size in the mixed mode runtime wrapper
> > > >     da44902fcfdd powerpc: fix hardware PMU exception bug on PowerVM compatibility mode systems
> > > >     90335d6681ea EDAC/synopsys: Do not print an error with back-to-back snprintf() calls
> > > >     956ba569cc60 bus: ti-sysc: Fix 1-wire reset quirk
> > > >     8937a74575e1 arm64: dts: meson: fix gxm-khadas-vim2 wifi
> > > >     5293e17978c4 dmaengine: coh901318: Fix a double lock bug in dma_tc_handle()
> > > >     08d67499d2d2 dma-buf: free dmabuf->name in dma_buf_release()
> > > >     709c6990aec7 hwmon: (adt7462) Fix an error return in ADT7462_REG_VOLT()
> > > >     61f64d9de25a ARM: dts: imx7-colibri: Fix frequency for sd/mmc
> > > >     1439f05ce981 ARM: dts: dra7xx-clocks: Fixup IPU1 mux clock parent source
> > > >     9113989a57c2 ARM: dts: am437x-idk-evm: Fix incorrect OPP node names
> > > >     dc06a0977754 ARM: imx: build v7_cpu_resume() unconditionally
> > > >     dc04fb60d718 IB/hfi1, qib: Ensure RCU is locked when accessing list
> > > >     3286ef3a1605 RMDA/cm: Fix missing ib_cm_destroy_id() in ib_cm_insert_listen()
> > > >     3d5d75f8c26e regulator: stm32-vrefbuf: fix a possible overshoot when re-enabling
> > > >     baec58de4ab5 RDMA/core: Fix protection fault in ib_mr_pool_destroy
> > > >     785823b3b2bc RDMA/iwcm: Fix iwcm work deallocation
> > > >     a793097d7c16 RDMA/siw: Fix failure handling during device creation
> > > >     10faa91ce493 RDMA/nldev: Fix crash when set a QP to a new counter but QPN is missing
> > > >     4a2acf74a816 RDMA/rw: Fix error flow during RDMA context initialization
> > > >     194f9e8e3d13 Revert "RDMA/cma: Simplify rdma_resolve_addr() error flow"
> > > >     80ccc2588f6a soc: imx-scu: Align imx sc msg structs to 4
> > > >     30eb1ea78a58 firmware: imx: Align imx_sc_msg_req_cpu_start to 4
> > > >     a3bede27ca04 firmware: imx: scu-pd: Align imx sc msg structs to 4
> > > >     1bebf41fb8c1 firmware: imx: misc: Align imx sc msg structs to 4
> > > >     67a6b0adb1ac arm64: dts: imx8qxp-mek: Remove unexisting Ethernet PHY
> > > >     14bd791e38c6 ARM: dts: imx6: phycore-som: fix emmc supply
> > > >     4115c053a35e phy: mapphone-mdm6600: Fix write timeouts with shorter GPIO toggle interval
> > > >     6cc80013ad37 phy: mapphone-mdm6600: Fix timeouts by adding wake-up handling
> > > >     362fbe8e9dd6 drm/i915/selftests: Fix return in assert_mmap_offset()
> > > >     2845fe63f751 drm/i915: Program MBUS with rmw during initialization
> > > >     609b392e8523 drm/sun4i: de2/de3: Remove unsupported VI layer formats
> > > >     a49ddfae6c1a drm/sun4i: Fix DE2 VI layer format support
> > > >     dfe25f9a1c26 drm/sun4i: Add separate DE3 VI layer formats
> > > >     d9163ba414d8 drm: kirin: Revert "Fix for hikey620 display offset problem"
> > > >     95e0c61d7f66 drm/panfrost: Don't try to map on error faults
> > > >     2ce46334cc87 spi: atmel-quadspi: fix possible MMIO window size overrun
> > > >     278025119968 ASoC: dapm: Correct DAPM handling of active widgets during shutdown
> > > >     a87fe1f24fe7 ASoC: Intel: Skylake: Fix available clock counter incrementation
> > > >     94c472e7b4e1 ASoC: pcm512x: Fix unbalanced regulator enable call in probe error path
> > > >     757ed44a19a3 ASoC: pcm: Fix possible buffer overflow in dpcm state sysfs output
> > > >     b408bfa79b5e powerpc/mm: Fix missing KUAP disable in flush_coherent_icache()
> > > >     42dac16dc4b0 powerpc: Convert flush_icache_range & friends to C
> > > >     ec21f6d52bd4 powerpc: define helpers to get L1 icache sizes
> > > >     bbc02b018d73 ASoC: intel: skl: Fix possible buffer overflow in debug outputs
> > > >     1dd4d68f19cf ASoC: intel: skl: Fix pin debug prints
> > > >     488c6c340df5 ASoC: SOF: Fix snd_sof_ipc_stream_posn()
> > > >     e259388d69f5 ASoC: topology: Fix memleak in soc_tplg_manifest_load()
> > > >     a6e3b2aedf8a ASoC: topology: Fix memleak in soc_tplg_link_elems_load()
> > > >     9998ebb5e73c drm/virtio: fix resource id creation race
> > > >     d41f6cfd9aa7 drm/virtio: make resource id workaround runtime switchable.
> > > >     ad7f9c865af7 spi: bcm63xx-hsspi: Really keep pll clk enabled
> > > >     12e7f2771650 ARM: dts: ls1021a: Restore MDIO compatible to gianfar
> > > >     422d098fe633 arm64: dts: meson-sm1-sei610: add missing interrupt-names
> > > >     2a767bab5ac0 dm: fix congested_fn for request-based device
> > > >     5c929bcb7af9 dm zoned: Fix reference counter initial value of chunk works
> > > >     7b753d805e1a dm writecache: verify watermark during resume
> > > >     86543852e43b dm: report suspended device during destroy
> > > >     e600edc7d835 dm cache: fix a crash due to incorrect work item cancelling
> > > >     a7ab1264e830 dm integrity: fix invalid table returned due to argument count mismatch
> > > >     f9d35915324c dm integrity: fix a deadlock due to offloading to an incorrect workqueue
> > > >     5b3f03f6e232 dm integrity: fix recalculation when moving from journal mode to bitmap mode
> > > >     ac5e2d2d5fc6 dmaengine: tegra-apb: Prevent race conditions of tasklet vs free list
> > > >     454ee4a82050 dmaengine: tegra-apb: Fix use-after-free
> > > >     1cdb96461185 dmaengine: imx-sdma: Fix the event id check to include RX event for UART6
> > > >     772e5f29c942 dmaengine: imx-sdma: fix context cache
> > > >     31c5755caf69 s390/mm: fix panic in gup_fast on large pud
> > > >     88fbd1d31291 s390/pci: Fix unexpected write combine on resource
> > > >     c8f3adc4069d x86/pkeys: Manually set X86_FEATURE_OSPKE to preserve existing changes
> > > >     83b2a8fe43bd spi: spidev: Fix CS polarity if GPIO descriptors are used
> > > >     fc73ded13f16 perf arm-spe: Fix endless record after being terminated
> > > >     8ae75e508894 perf cs-etm: Fix endless record after being terminated
> > > >     d15530fc9250 perf intel-bts: Fix endless record after being terminated
> > > >     7d3adab14857 perf intel-pt: Fix endless record after being terminated
> > > >     8fd458b647f5 media: v4l2-mem2mem.c: fix broken links
> > > >     cd48f84cf7ce media: vicodec: process all 4 components for RGB32 formats
> > > >     37c554b3fe98 media: mc-entity.c: use & to check pad flags, not ==
> > > >     9be09b4583f1 media: hantro: Fix broken media controller links
> > > >     9a9c13ad21a8 vt: selection, push sel_lock up
> > > >     119ee545581a vt: selection, push console lock down
> > > >     4387bfa60520 vt: selection, close sel_buffer race
> > > >     e64fbf0e9f2d serial: 8250_exar: add support for ACCES cards
> > > >     5932199be8ed tty: serial: fsl_lpuart: free IDs allocated by IDA
> > > >     143217fe63b1 tty:serial:mvebu-uart:fix a wrong return
> > > >     cdca61a19081 arm: dts: dra76x: Fix mmc3 max-frequency
> > > >     637627d832bd arm64: dts: socfpga: agilex: Fix gmac compatible
> > > >     0c8eccc28e69 btrfs: fix RAID direct I/O reads with alternate csums
> > > >     557693d1d3a7 fat: fix uninit-memory access for partial initialized inode
> > > >     d467fbc93cdb mm, hotplug: fix page online with DEBUG_PAGEALLOC compiled but not enabled
> > > >     c2043281943e mm: fix possible PMD dirty bit lost in set_pmd_migration_entry()
> > > >     4b62bbcc8618 mm, numa: fix bad pmd by atomically check for pmd_trans_huge when marking page tables prot_numa
> > > >     5d230547476e vgacon: Fix a UAF in vgacon_invert_region
> > > >     c8137e78b8c6 usb: core: port: do error out if usb_autopm_get_interface() fails
> > > >     739721ebbc26 usb: core: hub: do error out if usb_autopm_get_interface() fails
> > > >     dc96ee7948d7 usb: core: hub: fix unhandled return by employing a void function
> > > >     cb05b3e1b16a usb: cdns3: gadget: toggle cycle bit before reset endpoint
> > > >     39b57e6ab298 usb: cdns3: gadget: link trb should point to next request
> > > >     f1809fb28cab usb: dwc3: gadget: Update chain bit correctly when using sg list
> > > >     807569e0dc58 usb: quirks: add NO_LPM quirk for Logitech Screen Share
> > > >     c71ce693e4e7 usb: storage: Add quirk for Samsung Fit flash
> > > >     e76e39f7c65b cifs: fix rename() by ensuring source handle opened with DELETE bit
> > > >     98cc1bd575d2 cifs: don't leak -EAGAIN for stat() during reconnect
> > > >     6369c1e0b646 ALSA: hda/realtek - Enable the headset of ASUS B9450FA with ALC294
> > > >     332464f910a7 ALSA: hda/realtek - Fix silent output on Gigabyte X570 Aorus Master
> > > >     6cb8b8760b7b ALSA: hda/realtek - Add Headset Button supported for ThinkPad X1
> > > >     f35e259c5444 ALSA: hda/realtek - Add Headset Mic supported
> > > >     f30f3aa5c3b9 binder: prevent UAF for binderfs devices II
> > > >     a2d63e7734ed binder: prevent UAF for binderfs devices
> > > >     3227ecd0ef53 firmware: imx: scu: Ensure sequential TX
> > > >     0f121ace25f1 selftests: forwarding: vxlan_bridge_1d: use more proper tos value
> > > >     2ab5bd41c6d7 arch/csky: fix some Kconfig typos
> > > >     479466726bf1 csky: Fixup compile warning for three unimplemented syscalls
> > > >     3469dfd86e09 csky: Fixup ftrace modify panic
> > > >     c7ce725c525a csky/smp: Fixup boot failed when CONFIG_SMP
> > > >     eb2ac8c497cd csky: Set regs->usp to kernel sp, when the exception is from kernel
> > > >     6db7f3bdc153 csky/mm: Fixup export invalid_pte_table symbol
> > > >     229fa6c8d284 net: thunderx: workaround BGX TX Underflow issue
> > > >     a90f613e1b44 x86/xen: Distribute switch variables for initialization
> > > >     10b00764ed11 ice: Don't tell the OS that link is going down
> > > >     9b6be0d2f942 nvme: Fix uninitialized-variable warning
> > > >     b290fb0b7971 s390/qdio: fill SL with absolute addresses
> > > >     ad50dbbf5729 x86/boot/compressed: Don't declare __force_order in kaslr_64.c
> > > >     ccef9c5f646b nvme-pci: Use single IRQ vector for old Apple models
> > > >     e13797d5ec54 nvme/pci: Add sleep quirk for Samsung and Toshiba drives
> > > >     9b412c4aa34b iommu/amd: Disable IOMMU on Stoney Ridge systems
> > > >     236efa8971f8 net/mlx5: DR, Fix matching on vport gvmi
> > > >     4a1e1dda56e2 efi: Only print errors about failing to get certs if EFI vars are found
> > > >     4d459c82abec s390: make 'install' not depend on vmlinux
> > > >     25fb2908b9c4 s390/cio: cio_ignore_proc_seq_next should increase position index
> > > >     764fc2ea82d8 watchdog: da9062: do not ping the hw during stop()
> > > >     1b1939fedc86 net: ethernet: dm9000: Handle -EPROBE_DEFER in dm9000_parse_dt()
> > > >     05e26a842a47 net: ks8851-ml: Fix 16-bit IO operation
> > > >     63c064a83568 net: ks8851-ml: Fix 16-bit data access
> > > >     8e8396edb093 net: ks8851-ml: Remove 8-bit bus accessors
> > > >     30f5a66eebc9 net: atlantic: check rpc result and wait for rpc address
> > > >     58eecbf16e97 selftests: forwarding: vxlan_bridge_1d: fix tos value
> > > >     5c0f7f2097b8 selftests: forwarding: use proto icmp for {gretap, ip6gretap}_mac testing
> > > >     d04dd98b9b37 drm/msm/dsi/pll: call vco set rate explicitly
> > > >     b6e3a6be56bd drm/msm/dsi: save pll state before dsi host is powered off
> > > >     26bfd300f7fd scsi: megaraid_sas: silence a warning
> > > >     f7c069e31daa drm/modes: Allow DRM_MODE_ROTATE_0 when applying video mode parameters
> > > >     9a426889f435 drm/modes: Make sure to parse valid rotation value from cmdline
> > > >     85c17bb5bf0f drm: msm: Fix return type of dsi_mgr_connector_mode_valid for kCFI
> > > >     49c1c5f5fc62 drm/msm/mdp5: rate limit pp done timeout warnings
> > > >     68b73cd158d8 habanalabs: patched cb equals user cb in device memset
> > > >     83946b4c96ee habanalabs: do not halt CoreSight during hard reset
> > > >     4b183f6748ac habanalabs: halt the engines before hard-reset
> > > >     5d48ee321160 usb: gadget: serial: fix Tx stall after buffer overflow
> > > >     a3a7d31645e5 usb: gadget: ffs: ffs_aio_cancel(): Save/restore IRQ flags
> > > >     aae7167626ce usb: gadget: composite: Support more than 500mA MaxPower
> > > >     dbeec9bda6cf selftests: fix too long argument
> > > >     c2d5c4df27e0 serial: ar933x_uart: set UART_CS_{RX,TX}_READY_ORIDE
> > > >     1cb3c0cecc31 ALSA: hda: do not override bus codec_mask in link_get()
> > > >     82782235544f blktrace: fix dereference after null check
> > > >     4771b3f60633 kprobes: Fix optimize_kprobe()/unoptimize_kprobe() cancellation logic
> > > >     c2a5e97de44a kbuild: fix 'No such file or directory' warning when cleaning
> > > >     0769cdddb88d RDMA/core: Fix use of logical OR in get_new_pps
> > > >     f7ed42f10334 RDMA/core: Fix pkey and port assignment in get_new_pps
> > > >     9d729f5aa06f dm thin metadata: fix lockdep complaint
> > > >     95aeaec9e63d net: stmmac: fix notifier registration
> > > >     551132b2943f net: dsa: bcm_sf2: Forcibly configure IMP port for 1Gb/sec
> > > >     2f87f58ca901 ALSA: hda/realtek - Fix a regression for mute led on Lenovo Carbon X1
> > > >     63f42809f0f3 block, bfq: do not insert oom queue into position tree
> > > >     594fca1d04fb block, bfq: get extra ref to prevent a queue from being freed during a group move
> > > >     cff670b3eb68 Linux 5.4.24
> > > >     6f9cff84dde8 blktrace: Protect q->blk_trace with RCU
> > > >     cad53d5e2e23 kvm: nVMX: VMWRITE checks unsupported field before read-only field
> > > >     119b1e588a76 kvm: nVMX: VMWRITE checks VMCS-link pointer before VMCS field
> > > >     0bae7e7fac97 mm, thp: fix defrag setting if newline is not used
> > > >     0eb282cb1ff7 mm/huge_memory.c: use head to check huge zero page
> > > >     8cb5db61afa3 mm/gup: allow FOLL_FORCE for get_user_pages_fast()
> > > >     2bb9bfcde8b5 mm/debug.c: always print flags in dump_page()
> > > >     2482da809fd3 locking/lockdep: Fix lockdep_stats indentation problem
> > > >     0d70361dec88 xfs: clear kernel only flags in XFS_IOC_ATTRMULTI_BY_HANDLE
> > > >     7906e29efaf1 bus: tegra-aconnect: Remove PM_CLK dependency
> > > >     dd3fd6dec30c netfilter: nf_flowtable: fix documentation
> > > >     beffc17b843c netfilter: nft_tunnel: no need to call htons() when dumping ports
> > > >     860a70e2a6f6 thermal: brcmstb_thermal: Do not use DT coefficients
> > > >     c981ab6a1c08 thermal: db8500: Depromote debug print
> > > >     8e78726fb7e8 ubifs: Fix ino_t format warnings in orphan_delete()
> > > >     ef0dcab6d21c rcu: Allow only one expedited GP to run concurrently with wakeups
> > > >     2aa7abbdc297 KVM: x86: Remove spurious clearing of async #PF MSR
> > > >     64521f9b2ca9 KVM: x86: Remove spurious kvm_mmu_unload() from vcpu destruction path
> > > >     56671961b34d x86/resctrl: Check monitoring static key in the MBM overflow handler
> > > >     d847804f8f8a perf ui gtk: Add missing zalloc object
> > > >     27f7e492d8fe perf hists browser: Restore ESC as "Zoom out" of DSO/thread/etc
> > > >     f68b6a015a81 pwm: omap-dmtimer: put_device() after of_find_device_by_node()
> > > >     1fabae5c846f lib/vdso: Update coarse timekeeper unconditionally
> > > >     91ebef8618bf lib/vdso: Make __arch_update_vdso_data() logic understandable
> > > >     74c515e04911 kprobes: Set unoptimized flag after unoptimizing code
> > > >     e8807eb1e688 ima: ima/lsm policy rule loading logic bug fixes
> > > >     caadb4b91b41 drivers: net: xgene: Fix the order of the arguments of 'alloc_etherdev_mqs()'
> > > >     c2e2f561d27f RDMA/hns: Bugfix for posting a wqe with sge
> > > >     3065f57761bd RDMA/hns: Simplify the calculation and usage of wqe idx for post verbs
> > > >     7fd3329a4df0 f2fs: fix to add swap extent correctly
> > > >     a25ae553903d sched/fair: Optimize select_idle_cpu
> > > >     ea307804e4fc KVM: Check for a bad hva before dropping into the ghc slow path
> > > >     487113220d0b KVM: SVM: Override default MMIO mask if memory encryption is enabled
> > > >     4aa42ab64edd mwifiex: delete unused mwifiex_get_intf_num()
> > > >     6d807dd31955 mwifiex: drop most magic numbers from mwifiex_process_tdls_action_frame()
> > > >     8a7d7fa16150 namei: only return -ECHILD from follow_dotdot_rcu()
> > > >     c15a3d8f5ecc kbuild: make single target builds even faster
> > > >     2e54f93a3b9b kbuild: remove unneeded variable, single-all
> > > >     ecd77a3261ab kbuild: move headers_check rule to usr/include/Makefile
> > > >     ef134d8b493c kbuild: remove header compile test
> > > >     20e559d8f745 selftests: Install settings files to fix TIMEOUT failures
> > > >     483724e27eb5 net: ena: make ena rxfh support ETH_RSS_HASH_NO_CHANGE
> > > >     21709608638e net/smc: no peer ID in CLC decline for SMCD
> > > >     10e0190f0b96 net: atlantic: fix out of range usage of active_vlans array
> > > >     10b2668cb3db net: atlantic: fix potential error handling
> > > >     be96a355858a net: atlantic: fix use after free kasan warn
> > > >     5306d0c41979 net: netlink: cap max groups which will be considered in netlink_bind()
> > > >     5b04f396f002 s390/qeth: vnicc Fix EOPNOTSUPP precedence
> > > >     567b108c9425 nvme-pci: Hold cq_poll_lock while completing CQEs
> > > >     fbc28154dec9 usb: charger: assign specific number for enum value
> > > >     e65381111339 hv_netvsc: Fix unwanted wakeup in netvsc_attach()
> > > >     f5cfa47505ac kbuild: fix DT binding schema rule to detect command line changes
> > > >     f2688e753764 mac80211: Remove a redundant mutex unlock
> > > >     813757b78216 nl80211: fix potential leak in AP start
> > > >     8100d19dc0fb drm/i915/gvt: Separate display reset from ALL_ENGINES reset
> > > >     30b8a98a1ab3 drm/i915/gvt: Fix orphan vgpu dmabuf_objs' lifetime
> > > >     55105073e43c i2c: jz4780: silence log flood on txabrt
> > > >     bda7565d4e15 i2c: altera: Fix potential integer overflow
> > > >     7cf412def885 MIPS: VPE: Fix a double free and a memory leak in 'release_vpe()'
> > > >     d5684b0515fc HID: hiddev: Fix race in in hiddev_disconnect()
> > > >     e7c5c8fd532d HID: alps: Fix an error handling path in 'alps_input_configured()'
> > > >     782077bff3a6 netfilter: xt_hashlimit: reduce hashlimit_mutex scope for htable_put()
> > > >     6c717726f341 netfilter: ipset: Fix forceadd evaluation path
> > > >     f09fbb1175cf vhost: Check docket sk_family instead of call getname
> > > >     68c601f2a208 net/smc: transfer fasync_list in case of fallback
> > > >     5dd9488ae410 netfilter: ipset: Fix "INFO: rcu detected stall in hash_xxx" reports
> > > >     7eaf718b83ff io_uring: fix 32-bit compatability with sendmsg/recvmsg
> > > >     9629f47d7d1c cpufreq: Fix policy initialization for internal governor drivers
> > > >     386a71f635b4 amdgpu/gmc_v9: save/restore sdpif regs during S3
> > > >     8e7ddaf759c6 Revert "PM / devfreq: Modify the device name as devfreq(X) for sysfs"
> > > >     b20f83ef019a tracing: Disable trace_printk() on post poned tests
> > > >     176cacef0119 macintosh: therm_windtunnel: fix regression when instantiating devices
> > > >     73c8048e277e drm/radeon: Inline drm_get_pci_dev
> > > >     582ce26a7e24 drm/amdgpu: Drop DRIVER_USE_AGP
> > > >     d310188d4ef6 HID: core: increase HID report buffer size to 8KiB
> > > >     819f8ab78a31 HID: core: fix off-by-one memset in hid_report_raw_event()
> > > >     a30a85e74dcd HID: ite: Only bind to keyboard USB interface on Acer SW5-012 keyboard dock
> > > >     9154d430dcbd KVM: VMX: check descriptor table exits on instruction emulation
> > > >     07fec9a84c15 ACPI: watchdog: Fix gas->access_width usage
> > > >     6b077e6fa7e2 ACPICA: Introduce ACPI_ACCESS_BYTE_WIDTH() macro
> > > >     82a6cb7a8ade audit: always check the netlink payload length in audit_receive_msg()
> > > >     37f4c2775267 audit: fix error handling in audit_data_to_entry()
> > > >     1e74ccd38e19 ext4: potential crash on allocation error in ext4_alloc_flex_bg_array()
> > > >     36d7477fabed nvme/pci: move cqe check after device shutdown
> > > >     b1fd0e551eeb nvme: prevent warning triggered by nvme_stop_keep_alive
> > > >     d4d26a5069da nvme/tcp: fix bug on double requeue when send fails
> > > >     3b4cf3b98895 net: hns3: fix a copying IPv6 address error in hclge_fd_get_flow_tuples()
> > > >     87a5534a1ae4 net: hns3: add management table after IMP reset
> > > >     e98e13176e27 mac80211: fix wrong 160/80+80 MHz setting
> > > >     f0593f5b1b64 cfg80211: add missing policy for NL80211_ATTR_STATUS_CODE
> > > >     99b2040d1b6b cifs: Fix mode output in debugging statements
> > > >     7072ad3b1d6c ice: update Unit Load Status bitmask to check after reset
> > > >     b81cc04e2aef net: ena: ena-com.c: prevent NULL pointer dereference
> > > >     d737658c9a11 net: ena: ethtool: use correct value for crc32 hash
> > > >     b7f8a4e82a41 net: ena: fix corruption of dev_idx_to_host_tbl
> > > >     5408a8088d59 net: ena: fix incorrectly saving queue numbers when setting RSS indirection table
> > > >     fdc142e4c282 net: ena: rss: store hash function as values and not bits
> > > >     eb9b6ff1fd71 net: ena: rss: fix failure to get indirection table
> > > >     6ab7207ad11d net: ena: rss: do not allocate key when not supported
> > > >     d6f54019b964 net: ena: fix incorrect default RSS key
> > > >     6088f3f70186 net: ena: add missing ethtool TX timestamping indication
> > > >     1c27b8d64571 net: ena: fix uses of round_jiffies()
> > > >     5bc08766658f net: ena: fix potential crash when rxfh key is NULL
> > > >     c17f8a738f59 i40e: Fix the conditional for i40e_vc_validate_vqs_bitmaps
> > > >     136702882691 soc/tegra: fuse: Fix build with Tegra194 configuration
> > > >     3c4b25053248 amdgpu: Prevent build errors regarding soft/hard-float FP ABI tags
> > > >     cd32771da12c drm/amd/display: Add initialitions for PLL2 clock source
> > > >     147fcd07ceba drm/amd/display: Limit minimum DPPCLK to 100MHz.
> > > >     2e5154923c1f drm/amd/display: Check engine is not NULL before acquiring
> > > >     eb62f4c2eb9a RDMA/siw: Remove unwanted WARN_ON in siw_cm_llp_data_ready()
> > > >     083afcaccb58 drm/amd/display: Do not set optimized_require to false after plane disable
> > > >     3bf72abda2dc ARM: dts: sti: fixup sound frame-inversion for stihxxx-b2120.dtsi
> > > >     b520f78ba428 ceph: do not execute direct write in parallel if O_APPEND is specified
> > > >     3b0a0bd12963 perf/x86/msr: Add Tremont support
> > > >     d1fdeaf6e9fe perf/x86/cstate: Add Tremont support
> > > >     6b1ca90fa4d7 perf/x86/intel: Add Elkhart Lake support
> > > >     75061b865142 perf/smmuv3: Use platform_get_irq_optional() for wired interrupt
> > > >     862e4c3a4b00 NFSv4: Fix races between open and dentry revalidation
> > > >     6eceafad2fff qmi_wwan: unconditionally reject 2 ep interfaces
> > > >     f5fe94e8dcfe qmi_wwan: re-add DW5821e pre-production variant
> > > >     a1b2925e6bc8 s390/zcrypt: fix card and queue total counter wrap
> > > >     fd206c770d41 cfg80211: check wiphy driver existence for drvinfo report
> > > >     5d6df86cad5e mac80211: consider more elements in parsing CRC
> > > >     bb232821faf5 dax: pass NOWAIT flag to iomap_apply
> > > >     36b5fcc140a7 sched/fair: Prevent unlimited runtime on throttled group
> > > >     166d6008fa2a timers/nohz: Update NOHZ load in remote tick
> > > >     5a309e3bf1e8 sched/core: Don't skip remote tick for idle CPUs
> > > >     b855c6399c1f drm/msm: Set dma maximum segment size for mdss
> > > >     66bc95c1955a ipmi:ssif: Handle a possible NULL pointer reference
> > > >     8097108725c3 ipv6: Fix nlmsg_flags when splitting a multipath route
> > > >     5b3beff4e8f9 ipv6: Fix route replacement with dev-only route
> > > >     5a908830e69b bonding: fix lockdep warning in bond_get_stats()
> > > >     97e5c947ad35 net: export netdev_next_lower_dev_rcu()
> > > >     d59a701d4cae bonding: add missing netdev_update_lockdep_key()
> > > >     177489edbe24 bnxt_en: Issue PCIe FLR in kdump kernel to cleanup pending DMAs.
> > > >     7daf11d64b8a bnxt_en: Improve device shutdown method.
> > > >     c360e0530107 sctp: move the format error check out of __sctp_sf_do_9_1_abort
> > > >     e72258bf6a57 udp: rehash on disconnect
> > > >     63d5320a0c9b Revert "net: dev: introduce support for sch BYPASS for lockless qdisc"
> > > >     129a1e235cc9 qede: Fix race between rdma destroy workqueue and link change event
> > > >     45f0d4b40131 nfc: pn544: Fix occasional HW initialization failure
> > > >     f3844aed8e86 net/tls: Fix to avoid gettig invalid tls record
> > > >     50acd32ea7f6 net: sched: correct flower port blocking
> > > >     bd53844bc91e net: phy: restore mdio regs in the iproc mdio driver
> > > >     248b7751391f net: mscc: fix in frame extraction
> > > >     e99e2f59d9a2 net: macb: ensure interface is not suspended on at91rm9200
> > > >     9310357f6151 net: fib_rules: Correctly set table field when table number exceeds 8 bits
> > > >     59b5714c6779 net: dsa: b53: Ensure the default VID is untagged
> > > >     728afb955b57 EDAC: skx_common: downgrade message importance on missing PCI device
> > > >     cac68d12c531 io_uring: grab ->fs as part of async offload
> > > >
> > > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > ---
> > > >  .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
> > > >  .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
> > > >  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
> > > >  3 files changed, 18 insertions(+), 18 deletions(-)
> > > >
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > > index 1c238c9b88..a02a4a14ed 100644
> > > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > > @@ -11,13 +11,13 @@ python () {
> > > >          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> > > >  }
> > > >
> > > > -SRCREV_machine ?= "f617c0993374d56792e266e37606d424166b1edd"
> > > > -SRCREV_meta ?= "b8c82ba37370e4698ff0c42f3e54b8b4f2fb4ac0"
> > > > +SRCREV_machine ?= "8908d882dee239b858bd3b42f0c951a35220efb1"
> > > > +SRCREV_meta ?= "9fe365b9395a05831177ec309e9857962b2496a9"
> > > >
> > > >  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> > > >             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
> > > >
> > > > -LINUX_VERSION ?= "5.4.23"
> > > > +LINUX_VERSION ?= "5.4.27"
> > > >
> > > >  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > > >
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > > > index 193bd9ba77..653f33f9cb 100644
> > > > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > > > @@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
> > > >
> > > >  require recipes-kernel/linux/linux-yocto.inc
> > > >
> > > > -LINUX_VERSION ?= "5.4.23"
> > > > +LINUX_VERSION ?= "5.4.27"
> > > >  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > > >
> > > >  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> > > > @@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
> > > >  KMETA = "kernel-meta"
> > > >  KCONF_BSP_AUDIT_LEVEL = "2"
> > > >
> > > > -SRCREV_machine_qemuarm ?= "d361ce4ddedafa6d504d726c5da098d32f46886e"
> > > > -SRCREV_machine ?= "06356153574af37fccb30f5e632edeb54ddd1f7b"
> > > > -SRCREV_meta ?= "b8c82ba37370e4698ff0c42f3e54b8b4f2fb4ac0"
> > > > +SRCREV_machine_qemuarm ?= "c90bb8009bf65f13d120f8e4989763f85133762e"
> > > > +SRCREV_machine ?= "20eb96b378204dcc435b193c5d692bdf561beff0"
> > > > +SRCREV_meta ?= "9fe365b9395a05831177ec309e9857962b2496a9"
> > > >
> > > >  PV = "${LINUX_VERSION}+git${SRCPV}"
> > > >
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > > > index ab7c646fec..d3fed81c56 100644
> > > > --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > > > @@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
> > > >  KBRANCH_qemux86-64 ?= "v5.4/standard/base"
> > > >  KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
> > > >
> > > > -SRCREV_machine_qemuarm ?= "3745c440f4781ffaab809f999c14da1abd3457bb"
> > > > -SRCREV_machine_qemuarm64 ?= "06356153574af37fccb30f5e632edeb54ddd1f7b"
> > > > -SRCREV_machine_qemumips ?= "eb0e84ae58eb7a88a48bdbddfb53095228840974"
> > > > -SRCREV_machine_qemuppc ?= "06356153574af37fccb30f5e632edeb54ddd1f7b"
> > > > -SRCREV_machine_qemuriscv64 ?= "06356153574af37fccb30f5e632edeb54ddd1f7b"
> > > > -SRCREV_machine_qemux86 ?= "06356153574af37fccb30f5e632edeb54ddd1f7b"
> > > > -SRCREV_machine_qemux86-64 ?= "06356153574af37fccb30f5e632edeb54ddd1f7b"
> > > > -SRCREV_machine_qemumips64 ?= "7ca67eee407193dff5132da8bacc036f670faaea"
> > > > -SRCREV_machine ?= "06356153574af37fccb30f5e632edeb54ddd1f7b"
> > > > -SRCREV_meta ?= "b8c82ba37370e4698ff0c42f3e54b8b4f2fb4ac0"
> > > > +SRCREV_machine_qemuarm ?= "e28b25e558cdc53d13f67df8b249bb770f3dcfba"
> > > > +SRCREV_machine_qemuarm64 ?= "20eb96b378204dcc435b193c5d692bdf561beff0"
> > > > +SRCREV_machine_qemumips ?= "0e1fe5b6bb2a34ed05dcc69fadec6581cbb0f9f5"
> > > > +SRCREV_machine_qemuppc ?= "20eb96b378204dcc435b193c5d692bdf561beff0"
> > > > +SRCREV_machine_qemuriscv64 ?= "20eb96b378204dcc435b193c5d692bdf561beff0"
> > > > +SRCREV_machine_qemux86 ?= "20eb96b378204dcc435b193c5d692bdf561beff0"
> > > > +SRCREV_machine_qemux86-64 ?= "20eb96b378204dcc435b193c5d692bdf561beff0"
> > > > +SRCREV_machine_qemumips64 ?= "ac5e243548907567d8285492c9fa0cbcf7d35d8a"
> > > > +SRCREV_machine ?= "20eb96b378204dcc435b193c5d692bdf561beff0"
> > > > +SRCREV_meta ?= "9fe365b9395a05831177ec309e9857962b2496a9"
> > > >
> > > >  # remap qemuarm to qemuarma15 for the 5.4 kernel
> > > >  # KMACHINE_qemuarm ?= "qemuarma15"
> > > > @@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
> > > >             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
> > > >
> > > >  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > > > -LINUX_VERSION ?= "5.4.23"
> > > > +LINUX_VERSION ?= "5.4.27"
> > > >
> > > >  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> > > >  DEPENDS += "openssl-native util-linux-native"
> > > > --
> > > > 2.19.1
> > > >
> > > > 
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
