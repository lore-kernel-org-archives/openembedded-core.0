Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 969C3C636D6
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 15:01:10 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.12721.1675436462105182182
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Feb 2023 07:01:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=WLi10mOr;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.43, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f43.google.com with SMTP id lu11so16118916ejb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 07:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B9vVhwvPrMFUpBEKsLfaa6LqC4elMaSW60UUEP2rFgQ=;
        b=WLi10mOrp9KZYrCgUAPbFmIooxmDQb223b/egXZxEeyw0MDXsMhbVaowipf98xiJca
         sRo5Vhd5yovhqdpFyvGUE6HguBQ3ixS9CfUJYD/7o/l+Tu6sGD9nf+e30mKba8s4Rn75
         5IwzY5BwcmY1Q4Xj2DeemdR+FFR6g29gAMmbAvyGrUWC71qp/Nv/DUSHHHGkHzP7yxPp
         e9HoRQtgTeblroQ5AAX75T4OAPzde6s3sbW2zqDR+VVCMj7p19KgwmJgbweTFqle10XX
         E1SrzUIutoNLZY4xjo3IDV6mG8J8TiNPYjT8zMX+S1a8excR+4WAYoMQmP6Pomkd9ApA
         6XGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9vVhwvPrMFUpBEKsLfaa6LqC4elMaSW60UUEP2rFgQ=;
        b=zdKsKPFsVGlDIsuO0cQ4eChjtz89GeWm6iZGCnLmgM/sP6A4Bo5jHQH0ivni1ddOlR
         JbIlR6HXrK00px3J485BfjrhTkRZvGrD0/SPU/gD2qt9g37VsPJRogoSzZ5/qNZnKO3p
         5rWpeTYvEuVSt9xfdih9NXJUFnnYhCQRNVaDrF07gSq52Wx5sU5zLkchs7mOR7crTVDi
         Q2ApGyRjyXpT8EoYmqJn3D36NFQHDkGAuzlkWT5hhywzvVgj0m2kBSNPHXuG+vhli2rx
         0+RqIigIbxTTcLt+1mkIadakuG91n3gSCoL/Pr56BtRliQvrgRd61Hws/n/AQ8yaxy6F
         Qn+Q==
X-Gm-Message-State: AO0yUKUzMKbx+/JxqqBSVt5NstmRceZJRMijM3+flcvGoYxgu3KJWSEW
	5StwhQvHQQkpbxNv0lLUzi33JHBwFQvZOtE1y9eGog==
X-Google-Smtp-Source: AK7set9QYF0SQL49ser7tAb2eYBeewuEoJbc3Uigg6bob+Q6hx4C4So71gDrnI8h64EIWJ4lH75GbAoCUyQs/prjwx0=
X-Received: by 2002:a17:906:32cb:b0:87b:d4df:32bc with SMTP id
 k11-20020a17090632cb00b0087bd4df32bcmr2782785ejk.303.1675436460022; Fri, 03
 Feb 2023 07:01:00 -0800 (PST)
MIME-Version: 1.0
References: <20230201164007.2205984-1-bruce.ashfield@gmail.com>
 <CAOSpxdZRb7hEf+Zi_BdKMvY_pmuEnTPEEkGgkXBjvauNEdi2EA@mail.gmail.com> <CADkTA4MkDP9AO73eONXz80gh2YS16Bd7aLAHbB4pFvsDwxX=+Q@mail.gmail.com>
In-Reply-To: <CADkTA4MkDP9AO73eONXz80gh2YS16Bd7aLAHbB4pFvsDwxX=+Q@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 3 Feb 2023 05:00:48 -1000
Message-ID: <CAOSpxdYhcjs9qfXz+0Y7aG72H246T_QiRVL81dS50pjW8CHCpQ@mail.gmail.com>
Subject: Re: [1/2][dunfell] linux-yocto/5.4: update to v5.4.229
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Feb 2023 15:01:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176721

On Fri, Feb 3, 2023 at 4:57 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> On Fri, Feb 3, 2023 at 9:43 AM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > Hi Bruce,
> >
> > Sadly this version bump breaks lttng-modules in dunfell:
> >
> > In file included from
> > TOPDIR/tmp/work/qemuarm-poky-linux-gnueabi/lttng-modules/2.11.6-r0/lttng-modules-2.11.6/probes/../probes/define_trace.h:87,
> >                  from
> > TOPDIR/tmp/work/qemuarm-poky-linux-gnueabi/lttng-modules/2.11.6-r0/lttng-modules-2.11.6/probes/../instrumentation/events/lttng-module/jbd2.h:183,
> >                  from
> > TOPDIR/tmp/work/qemuarm-poky-linux-gnueabi/lttng-modules/2.11.6-r0/lttng-modules-2.11.6/probes/lttng-probe-jbd2.c:29:
> > TOPDIR/tmp/work/qemuarm-poky-linux-gnueabi/lttng-modules/2.11.6-r0/lttng-modules-2.11.6/probes/../probes/lttng-tracepoint-event-impl.h:130:6:
> > error: conflicting types for 'trace_jbd2_run_stats'
> >   130 | void trace_##_name(_proto);
> >       |      ^~~~~~
> > TOPDIR/tmp/work/qemuarm-poky-linux-gnueabi/lttng-modules/2.11.6-r0/lttng-modules-2.11.6/probes/../probes/lttng-tracepoint-event-impl.h:42:2:
> > note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP'
> >    42 |  LTTNG_TRACEPOINT_EVENT_INSTANCE_MAP(map, name, map,
> > PARAMS(proto), PARAMS(args))
> >       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > TOPDIR/tmp/work/qemuarm-poky-linux-gnueabi/lttng-modules/2.11.6-r0/lttng-modules-2.11.6/probes/../probes/lttng-tracepoint-event-impl.h:84:2:
> > note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT_MAP'
> >    84 |  LTTNG_TRACEPOINT_EVENT_MAP(name, name,    \
> >       |  ^~~~~~~~~~~~~~~~~~~~~~~~~~
> > TOPDIR/tmp/work/qemuarm-poky-linux-gnueabi/lttng-modules/2.11.6-r0/lttng-modules-2.11.6/probes/../instrumentation/events/lttng-module/jbd2.h:107:1:
> > note: in expansion of macro 'LTTNG_TRACEPOINT_EVENT'
> >   107 | LTTNG_TRACEPOINT_EVENT(jbd2_run_stats,
> >       | ^~~~~~~~~~~~~~~~~~~~~~
> > In file included from
> > TOPDIR/tmp/work-shared/qemuarm/kernel-source/include/trace/events/jbd2.h:9,
> >                  from
> > TOPDIR/tmp/work/qemuarm-poky-linux-gnueabi/lttng-modules/2.11.6-r0/lttng-modules-2.11.6/probes/lttng-probe-jbd2.c:18:
> > TOPDIR/tmp/work-shared/qemuarm/kernel-source/include/linux/tracepoint.h:243:21:
> > note: previous definition of 'trace_jbd2_run_stats' was here
> >   243 |  static inline void trace_##name(proto)    \
> >       |                     ^~~~~~
> > TOPDIR/tmp/work-shared/qemuarm/kernel-source/include/linux/tracepoint.h:406:2:
> > note: in expansion of macro '__DECLARE_TRACE'
> >   406 |  __DECLARE_TRACE(name, PARAMS(proto), PARAMS(args),  \
> >       |  ^~~~~~~~~~~~~~~
> > TOPDIR/tmp/work-shared/qemuarm/kernel-source/include/linux/tracepoint.h:542:2:
> > note: in expansion of macro 'DECLARE_TRACE'
> >   542 |  DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
> >       |  ^~~~~~~~~~~~~
> > TOPDIR/tmp/work-shared/qemuarm/kernel-source/include/trace/events/jbd2.h:234:1:
> > note: in expansion of macro 'TRACE_EVENT'
> >   234 | TRACE_EVENT(jbd2_run_stats,
> >       | ^~~~~~~~~~~
> >   CC [M]  TOPDIR/tmp/work/qemuarm-poky-linux-gnueabi/lttng-modules/2.11.6-r0/lttng-modules-2.11.6/probes/lttng-probe-ext4.o
> >
> > I tried doing version bumps for lttng-modules from 2.11.6 -> 2.11.9
> > but the issue persists.
> >
> > Thoughts?
>
> I've never had much luck manually doing lttng fixes. You quickly get
> lost in the macros and prototypes.
>
> We could report the issue to lttng and see if they are willing to do a
> fix, but otherwise, we can wait a bit and see if they update .. since
> these are recent releases of 5.4, and lttng likely just hasn't seen
> the problem yet.
>
> So for now, I'll suggest just waiting and I can monitor to see if
> anything has already been reported or if I see a fix upstream.

Sounds like a plan, I'll put these two version bumps on the shelf for a bit.

I will however keep my lttng-modules version bumps so that we are at
the most recent 2.11 stable branch release.

Steve

> > On Wed, Feb 1, 2023 at 6:40 AM <bruce.ashfield@gmail.com> wrote:
> > >
> > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > >
> > > Updating  to the latest korg -stable release that comprises
> > > the following commits:
> > >
> > >     1349fe3a332a Linux 5.4.229
> > >     68a37dc77e2f tipc: call tipc_lxc_xmit without holding node_read_lock
> > >     1140c3f7adbc ocfs2: fix freeing uninitialized resource on ocfs2_dlm_shutdown
> > >     2db88851fa4d tipc: Add a missing case of TIPC_DIRECT_MSG type
> > >     38b5d7054d75 tty: serial: tegra: Handle RX transfer in PIO mode if DMA wasn't started
> > >     3188f80b80d6 tipc: fix use-after-free in tipc_disc_rcv()
> > >     3eeb06132d36 Revert "usb: ulpi: defer ulpi_register on ulpi_read_id timeout"
> > >     ecd47ffc99d3 mm: Always release pages to the buddy allocator in memblock_free_late().
> > >     5fcf75a8a4c3 efi: fix NULL-deref in init error path
> > >     b30e5dd0778e arm64: cmpxchg_double*: hazard against entire exchange variable
> > >     ecdd65051b17 arm64: atomics: remove LL/SC trampolines
> > >     f840000928af arm64: atomics: format whitespace consistently
> > >     d01d6d2b06c0 drm/virtio: Fix GEM handle creation UAF
> > >     3030f11f27e7 x86/resctrl: Fix task CLOSID/RMID update race
> > >     22c4eeafc31b x86/resctrl: Use task_curr() instead of task_struct->on_cpu to prevent unnecessary IPI
> > >     b3f924246700 iommu/mediatek-v1: Fix an error handling path in mtk_iommu_v1_probe()
> > >     ecfe33e0757d iommu/mediatek-v1: Add error handle for mtk_iommu_probe
> > >     ec049ae2b462 net/mlx5: Fix ptp max frequency adjustment range
> > >     62d707dabb5c net/mlx5: Rename ptp clock info
> > >     2b157c3c5d6b net/sched: act_mpls: Fix warning during failed attribute validation
> > >     9424d2205fe9 nfc: pn533: Wait for out_urb's completion in pn533_usb_send_frame()
> > >     576eadef2c8d hvc/xen: lock console list traversal
> > >     7d04fe153dfc tipc: fix unexpected link reset due to discovery messages
> > >     95b2d4889fbd tipc: eliminate checking netns if node established
> > >     d6418829cef1 tipc: improve throughput between nodes in netns
> > >     d443308edbfb regulator: da9211: Use irq handler when ready
> > >     43f48e6c3076 EDAC/device: Fix period calculation in edac_device_reset_delay_period()
> > >     a5b737623eaa x86/boot: Avoid using Intel mnemonics in AT&T syntax asm
> > >     d0c6d2a31026 powerpc/imc-pmu: Fix use of mutex in IRQs disabled section
> > >     feefb33eefa1 netfilter: ipset: Fix overflow before widen in the bitmap_ip_create() function.
> > >     e431b4fb1fb8 ext4: fix uninititialized value in 'ext4_evict_inode'
> > >     026a4490b538 ext4: fix use-after-free in ext4_orphan_cleanup
> > >     fa41a133ea23 ext4: lost matching-pair of trace in ext4_truncate
> > >     1d5524832ff2 ext4: fix bug_on in __es_tree_search caused by bad quota inode
> > >     3da22d06e078 quota: Factor out setup of quota inode
> > >     ecb9d0d2e123 jbd2: use the correct print format
> > >     06bb3f4e3b06 usb: ulpi: defer ulpi_register on ulpi_read_id timeout
> > >     a2689a446427 wifi: wilc1000: sdio: fix module autoloading
> > >     3998dba0f78a ipv6: raw: Deduct extension header length in rawv6_push_pending_frames
> > >     53cefa802f07 ixgbe: fix pci device refcount leak
> > >     e0d6f3b62b29 platform/x86: sony-laptop: Don't turn off 0x153 keyboard backlight during probe
> > >     1ad759df6a6f drm/msm/adreno: Make adreno quirks not overwrite each other
> > >     098416c4e322 cifs: Fix uninitialized memory read for smb311 posix symlink create
> > >     d6546426cdf4 ALSA: hda/hdmi: Add a HP device 0x8715 to force connect list
> > >     eaa5580a74cc ALSA: pcm: Move rwsem lock inside snd_ctl_elem_read to prevent UAF
> > >     c6d29a5ffdbc net/ulp: prevent ULP without clone op from entering the LISTEN status
> > >     b318d41f1bd1 s390/percpu: add READ_ONCE() to arch_this_cpu_to_op_simple()
> > >     f6da927c92ec s390/kexec: fix ipl report address for kdump
> > >     4bf6e11c34c5 perf auxtrace: Fix address filter duplicate symbol selection
> > >     2e4164d3d1e7 docs: Fix the docs build with Sphinx 6.0
> > >     3ed183074c20 efi: tpm: Avoid READ_ONCE() for accessing the event log
> > >     3ad31129ce72 KVM: arm64: Fix S1PTW handling on RO memslots
> > >     9b83ec63d0de net: sched: disallow noqueue for qdisc classes
> > >     aa52acefc629 driver core: Fix bus_type.match() error handling in __driver_attach()
> > >     8d60a90560ef selftests: set the BUILD variable to absolute path
> > >     cad6d2bb4726 selftests: Fix kselftest O=objdir build from cluttering top level objdir
> > >     320dbbd86f81 parisc: Align parisc MADV_XXX constants with all other architectures
> > >     d868597b71c1 mbcache: Avoid nesting of cache->c_list_lock under bit locks
> > >     da23752d9660 hfs/hfsplus: avoid WARN_ON() for sanity check, use proper error handling
> > >     781fa141414e hfs/hfsplus: use WARN_ON for sanity check
> > >     b47c69010943 ext4: don't allow journal inode to have encrypt flag
> > >     1464feb5b6fa riscv: uaccess: fix type of 0 variable on error in get_user()
> > >     da41069c613d nfsd: fix handling of readdir in v4root vs. mount upcall timeout
> > >     8cbd7f264387 x86/bugs: Flush IBP in ib_prctl_set()
> > >     ba780bff9ff9 ASoC: Intel: bytcr_rt5640: Add quirk for the Advantech MICA-071 tablet
> > >     e66ae100e7c7 udf: Fix extension of the last extent in the file
> > >     33df9c5d5e2a caif: fix memory leak in cfctrl_linkup_request()
> > >     3cb1ee82e4ed drm/i915: unpin on error in intel_vgpu_shadow_mm_pin()
> > >     ebe6d2fcf783 usb: rndis_host: Secure rndis_query check against int overflow
> > >     a07b4895b9d1 drivers/net/bonding/bond_3ad: return when there's no aggregator
> > >     2f7a09c1eebc perf tools: Fix resources leak in perf_data__open_dir()
> > >     6b17b84634f9 net: sched: cbq: dont intepret cls results when asked to drop
> > >     63e469cb54a8 net: sched: atm: dont intepret cls results when asked to drop
> > >     d16e5fefd8e4 RDMA/mlx5: Fix validation of max_rd_atomic caps for DC
> > >     564fdc2f8bff RDMA/uverbs: Silence shiftTooManyBitsSigned warning
> > >     00616bd1913a net: phy: xgmiitorgmii: Fix refcount leak in xgmiitorgmii_probe
> > >     904ad95b3985 net: amd-xgbe: add missed tasklet_kill
> > >     a15cbe9b8453 vhost: fix range used in translate_desc()
> > >     d8e410315ad3 nfc: Fix potential resource leaks
> > >     8f97eeb02a55 qlcnic: prevent ->dcb use-after-free on qlcnic_dcb_enable() failure
> > >     55ac68b53f1c net: sched: fix memory leak in tcindex_set_parms
> > >     b6a0623f756b net: hns3: add interrupts re-initialization while doing VF FLR
> > >     f9c551d87426 nfsd: shut down the NFSv4 state objects before the filecache
> > >     7eaaee526809 bpf: pull before calling skb_postpull_rcsum()
> > >     1d449cd2409a SUNRPC: ensure the matching upcall is in-flight upon downcall
> > >     af5306527637 ext4: fix deadlock due to mbcache entry corruption
> > >     711ef736dd99 mbcache: automatically delete entries from cache on freeing
> > >     af8ecc8d20e7 ext4: fix race when reusing xattr blocks
> > >     ea4b9091aae7 ext4: unindent codeblock in ext4_xattr_block_set()
> > >     a5f9bd4beae8 ext4: remove EA inode entry from mbcache on inode eviction
> > >     951ea4d3dfa9 mbcache: add functions to delete entry if unused
> > >     81b0bb1eb2c6 mbcache: don't reclaim used entries
> > >     c2f1e12b659b ext4: use kmemdup() to replace kmalloc + memcpy
> > >     6453836e371f fs: ext4: initialize fsdata in pagecache_write()
> > >     1af609646c60 ext4: use memcpy_to_page() in pagecache_write()
> > >     49dac5e017eb mm/highmem: Lift memcpy_[to|from]_page to core
> > >     f44dcd9dceb8 ext4: correct inconsistent error msg in nojournal mode
> > >     b02aa6a05a5f ext4: goto right label 'failed_mount3a'
> > >     e0fce1d665d8 ravb: Fix "failed to switch device to config mode" message during unbind
> > >     0ebcfdc8c920 KVM: nVMX: Properly expose ENABLE_USR_WAIT_PAUSE control to L1
> > >     e723bafd8f61 KVM: VMX: Fix the spelling of CPU_BASED_USE_TSC_OFFSETTING
> > >     72906690452b KVM: VMX: Rename NMI_PENDING to NMI_WINDOW
> > >     da8ff59210b4 KVM: VMX: Rename INTERRUPT_PENDING to INTERRUPT_WINDOW
> > >     db99c8d6b78b KVM: retpolines: x86: eliminate retpoline from vmx.c exit handlers
> > >     2c82f134b9af KVM: x86: optimize more exit handlers in vmx.c
> > >     6e3f6d95625a perf probe: Fix to get the DW_AT_decl_file and DW_AT_call_file as unsinged data
> > >     fc67c00def19 perf probe: Use dwarf_attr_integrate as generic DWARF attr accessor
> > >     d06a7e2049e3 dm thin: resume even if in FAIL mode
> > >     28cdd90c26f3 media: s5p-mfc: Fix in register read and write for H264
> > >     640075400c7c media: s5p-mfc: Clear workbit to handle error condition
> > >     4a52a1a3eac8 media: s5p-mfc: Fix to handle reference queue during finishing
> > >     b9275d8a927f PM/devfreq: governor: Add a private governor_data for governor
> > >     839f3ca8bc02 btrfs: replace strncpy() with strscpy()
> > >     b5db13545759 ext4: allocate extended attribute value in vmalloc area
> > >     6ef8b0a74350 ext4: avoid unaccounted block allocation when expanding inode
> > >     b14a553b0f87 ext4: initialize quota before expanding inode in setproject ioctl
> > >     9ef603086c5b ext4: fix inode leak in ext4_xattr_inode_create() on an error path
> > >     7138ef745ef4 ext4: avoid BUG_ON when creating xattrs
> > >     4d84ec8e5c3e ext4: fix error code return to user-space in ext4_get_branch()
> > >     a4c3c1d57db3 ext4: fix corruption when online resizing a 1K bigalloc fs
> > >     6f4200ec76a0 ext4: fix delayed allocation bug in ext4_clu_mapped for bigalloc + inline
> > >     f263e349bacc ext4: init quota for 'old.inode' in 'ext4_rename'
> > >     78e335fb573e ext4: fix bug_on in __es_tree_search caused by bad boot loader inode
> > >     362ce137d56b ext4: fix reserved cluster accounting in __es_remove_extent()
> > >     e1d946d9c82f ext4: add helper to check quota inums
> > >     2142dfa1de61 ext4: add EXT4_IGET_BAD flag to prevent unexpected bad inode
> > >     4690a4bdcf14 ext4: fix undefined behavior in bit shift for ext4_check_flag_values
> > >     e347c269b5d6 ext4: add inode table check in __ext4_get_inode_loc to aovid possible infinite loop
> > >     94b283341f9f drm/vmwgfx: Validate the box size for the snooped cursor
> > >     eea62f0461a9 drm/connector: send hotplug uevent on connector cleanup
> > >     fbfd6dee521e device_cgroup: Roll back to original exceptions after copy failure
> > >     5e4500454d75 parisc: led: Fix potential null-ptr-deref in start_task()
> > >     662dc7c6be7b iommu/amd: Fix ivrs_acpihid cmdline parsing code
> > >     93e919d9acb2 crypto: n2 - add missing hash statesize
> > >     a5866d531b47 PCI/sysfs: Fix double free in error path
> > >     65bd0962992a PCI: Fix pci_device_is_present() for VFs by checking PF
> > >     d23006f2a56e ipmi: fix use after free in _ipmi_destroy_user()
> > >     cf19abbe4b9a ima: Fix a potential NULL pointer access in ima_restore_measurement_list
> > >     b16336353576 mtd: spi-nor: Check for zero erase size in spi_nor_find_best_erase_type()
> > >     74531c23adc5 ipmi: fix long wait in unload when IPMI disconnect
> > >     d4f48c648a66 efi: Add iMac Pro 2017 to uefi skip cert quirk
> > >     2c4832a0893a md/bitmap: Fix bitmap chunk size overflow issues
> > >     b869cb7a3d52 cifs: fix missing display of three mount options
> > >     149babe5e019 cifs: fix confusing debug message
> > >     a29d62130988 media: dvb-core: Fix UAF due to refcount races at releasing
> > >     b21f62b49ee9 media: dvb-core: Fix double free in dvb_register_device()
> > >     50c2379f8795 ARM: 9256/1: NWFPE: avoid compiler-generated __aeabi_uldivmod
> > >     c42cb66a8915 tracing: Fix infinite loop in tracing_read_pipe on overflowed print_trace_line
> > >     cb03fc217b0d tracing/hist: Fix wrong return value in parse_action_params()
> > >     f5489d5a2420 x86/microcode/intel: Do not retry microcode reloading on the APs
> > >     cf79d5410a56 tracing/hist: Fix out-of-bound write on 'action_data.var_ref_idx'
> > >     1a5165e80a80 dm cache: set needs_check flag after aborting metadata
> > >     2f097dfac757 dm cache: Fix UAF in destroy()
> > >     520b56cfd9fa dm clone: Fix UAF in clone_dtr()
> > >     792e51aac376 dm integrity: Fix UAF in dm_integrity_dtr()
> > >     7ae6aa649394 dm thin: Fix UAF in run_timer_softirq()
> > >     f758987ff0af dm thin: Use last transaction's pmd->root when commit failed
> > >     200aa33b5d78 dm thin: Fix ABBA deadlock between shrink_slab and dm_pool_abort_metadata
> > >     f472bfc95d9c dm cache: Fix ABBA deadlock between shrink_slab and dm_cache_metadata_abort
> > >     52ba5b87a36e binfmt: Fix error return code in load_elf_fdpic_binary()
> > >     33933af45d1d binfmt: Move install_exec_creds after setup_new_exec to match binfmt_elf
> > >     3cdd91a91632 cpufreq: Init completion before kobject_init_and_add()
> > >     6ccb116e6b99 selftests: Use optional USERCFLAGS and USERLDFLAGS
> > >     2b8f2e127d7a arm64: dts: qcom: sdm850-lenovo-yoga-c630: correct I2C12 pins drive strength
> > >     b22d683c9014 ARM: ux500: do not directly dereference __iomem
> > >     c59ee1528b34 btrfs: fix resolving backrefs for inline extent followed by prealloc
> > >     e63e1c67932d mmc: sdhci-sprd: Disable CLK_AUTO when the clock is less than 400K
> > >     3de2c3628351 ktest.pl minconfig: Unset configs instead of just removing them
> > >     d10523afa822 kest.pl: Fix grub2 menu handling for rebooting
> > >     d089baa5b68a soc: qcom: Select REMAP_MMIO for LLCC driver
> > >     bcce46e11594 media: stv0288: use explicitly signed char
> > >     de2ea2a0ad51 net/af_packet: make sure to pull mac header
> > >     ad3f90a9c4a2 net/af_packet: add VLAN support for AF_PACKET SOCK_RAW GSO
> > >     aa91afe59740 SUNRPC: Don't leak netobj memory when gss_read_proxy_verf() fails
> > >     e027f3b9fabd tpm: tpm_tis: Add the missed acpi_put_table() to fix memory leak
> > >     927860dfa161 tpm: tpm_crb: Add the missed acpi_put_table() to fix memory leak
> > >     f1c08947ab05 mmc: vub300: fix warning - do not call blocking ops when !TASK_RUNNING
> > >     f4b5a27f56c5 f2fs: should put a page when checking the summary info
> > >     f02d2e2b9b89 mm, compaction: fix fast_isolate_around() to stay within boundaries
> > >     384ef33d37ce md: fix a crash in mempool_free
> > >     2dae4211b579 pnode: terminate at peers of source
> > >     25e8c6ecb468 ALSA: line6: fix stack overflow in line6_midi_transmit
> > >     10a07d81f693 ALSA: line6: correct midi status byte when receiving data from podxt
> > >     0e727c328eeb ovl: Use ovl mounter's fsuid and fsgid in ovl_link()
> > >     cae6dddef222 hfsplus: fix bug causing custom uid and gid being unable to be assigned with mount
> > >     fe83242eab19 HID: plantronics: Additional PIDs for double volume key presses quirk
> > >     b201fe49eeb8 HID: multitouch: fix Asus ExpertBook P2 P2451FA trackpoint
> > >     515959eb49e6 powerpc/rtas: avoid scheduling in rtas_os_term()
> > >     c2fa91abf22a powerpc/rtas: avoid device tree lookups in rtas_os_term()
> > >     418ef921cce2 objtool: Fix SEGFAULT
> > >     28046827c305 nvme: fix the NVME_CMD_EFFECTS_CSE_MASK definition
> > >     24561f5d0990 nvme: resync include/linux/nvme.h with nvmecli
> > >     e69e8d78679d ata: ahci: Fix PCS quirk application for suspend
> > >     e74d9f13a408 nvme-pci: fix doorbell buffer value endianness
> > >     e8e2861cc325 cifs: fix oops during encryption
> > >     3c3baa40dcf8 media: dvbdev: fix refcnt bug
> > >     334a76861b25 media: dvbdev: fix build warning due to comments
> > >     2a0e42877dff gcov: add support for checksum field
> > >     328f3c084fd8 regulator: core: fix deadlock on regulator enable
> > >     fb0407d8cd35 iio: adc128s052: add proper .data members in adc128_of_match table
> > >     bcb052a87d8b iio: adc: ad_sigma_delta: do not use internal iio_dev lock
> > >     ad4eb32cedfa reiserfs: Add missing calls to reiserfs_security_free()
> > >     5a5ef1882fd6 HID: wacom: Ensure bootloader PID is usable in hidraw mode
> > >     9e8f60094e34 usb: dwc3: core: defer probe on ulpi_read_id timeout
> > >     7778fa1ca85f ALSA: hda/hdmi: Add HP Device 0x8711 to force connect list
> > >     12622fa053c1 ALSA: hda/realtek: Add quirk for Lenovo TianYi510Pro-14IOB
> > >     fad324bc0717 pstore: Make sure CONFIG_PSTORE_PMSG selects CONFIG_RT_MUTEXES
> > >     e56423bb8e04 pstore: Switch pmsg_lock to an rt_mutex to avoid priority inversion
> > >     e8a1ccd12017 ASoC: rt5670: Remove unbalanced pm_runtime_put()
> > >     737058bd0bfe ASoC: rockchip: spdif: Add missing clk_disable_unprepare() in rk_spdif_runtime_resume()
> > >     d456c253f3ea ASoC: wm8994: Fix potential deadlock
> > >     2705bb1661c9 ASoC: rockchip: pdm: Add missing clk_disable_unprepare() in rockchip_pdm_runtime_resume()
> > >     ed1376f77140 ASoC: audio-graph-card: fix refcount leak of cpu_ep in __graph_for_each_link()
> > >     df9cd38c3b5e ASoC: mediatek: mt8173-rt5650-rt5514: fix refcount leak in mt8173_rt5650_rt5514_dev_probe()
> > >     56f630a0d5a9 ASoC: Intel: Skylake: Fix driver hang during shutdown
> > >     fd0d3bf37d73 ALSA: hda: add snd_hdac_stop_streams() helper
> > >     d5952155d6d8 ALSA/ASoC: hda: move/rename snd_hdac_ext_stop_streams to hdac_stream.c
> > >     bdc2d33fa232 orangefs: Fix kmemleak in orangefs_{kernel,client}_debug_init()
> > >     2e7c09121064 orangefs: Fix kmemleak in orangefs_prepare_debugfs_help_string()
> > >     511b48ee8e4a drm/sti: Fix return type of sti_{dvo,hda,hdmi}_connector_mode_valid()
> > >     6c00350c9f1d drm/fsl-dcu: Fix return type of fsl_dcu_drm_connector_mode_valid()
> > >     fa7163987351 hugetlbfs: fix null-ptr-deref in hugetlbfs_parse_param()
> > >     713ad301c2d4 clk: st: Fix memory leak in st_of_quadfs_setup()
> > >     0ca298d54846 media: si470x: Fix use-after-free in si470x_int_in_callback()
> > >     21d26381e1f9 mmc: f-sdh30: Add quirks for broken timeout clock capability
> > >     5bfc53df288e regulator: core: fix use_count leakage when handling boot-on
> > >     87fd18016a47 blk-mq: fix possible memleak when register 'hctx' failed
> > >     17217737c174 media: dvb-usb: fix memory leak in dvb_usb_adapter_init()
> > >     6d18b44bb44e media: dvbdev: adopts refcnt to avoid UAF
> > >     438a4a8dece2 media: dvb-frontends: fix leak of memory fw
> > >     89357aa97b52 bpf: Prevent decl_tag from being referenced in func_proto arg
> > >     7da524781c53 ppp: associate skb with a device at tx
> > >     aadb1507a77b mrp: introduce active flags to prevent UAF when applicant uninit
> > >     4bdcc6a5aa9f net: add atomic_long_t to net_device_stats fields
> > >     19d5a0e17aba md/raid1: stop mdx_raid1 thread when raid1 array run failed
> > >     5d8d046f3dba drivers/md/md-bitmap: check the return value of md_bitmap_get_counter()
> > >     2b1b145ca17b drm/sti: Use drm_mode_copy()
> > >     272d12b5f322 drm/rockchip: Use drm_mode_copy()
> > >     20022d551f20 s390/lcs: Fix return type of lcs_start_xmit()
> > >     4bee3c75d5bf s390/netiucv: Fix return type of netiucv_tx()
> > >     e859e02fbfa7 s390/ctcm: Fix return type of ctc{mp,}m_tx()
> > >     f96bd8adc8ad igb: Do not free q_vector unless new one was allocated
> > >     5b06a8a25eba wifi: brcmfmac: Fix potential shift-out-of-bounds in brcmf_fw_alloc_request()
> > >     e390838eeffb hamradio: baycom_epp: Fix return type of baycom_send_packet()
> > >     dbe1a6b930ae net: ethernet: ti: Fix return type of netcp_ndo_start_xmit()
> > >     772431f30ca0 bpf: make sure skb->len != 0 when redirecting to a tunneling device
> > >     9066300fe8bf ipmi: fix memleak when unload ipmi driver
> > >     8234c522effc ASoC: codecs: rt298: Add quirk for KBL-R RVP platform
> > >     7360b323e034 wifi: ar5523: Fix use-after-free on ar5523_cmd() timed out
> > >     ca57748593dd wifi: ath9k: verify the expected usb_endpoints are present
> > >     3cc9299036bd brcmfmac: return error when getting invalid max_flowrings from dongle
> > >     e44bfef5bffb drm/etnaviv: add missing quirks for GC300
> > >     90103ccb6e60 hfs: fix OOB Read in __hfs_brec_find
> > >     a815a3e01945 acct: fix potential integer overflow in encode_comp_t()
> > >     d706485dffbb nilfs2: fix shift-out-of-bounds/overflow in nilfs_sb2_bad_offset()
> > >     9ef353c92f9d ACPICA: Fix error code path in acpi_ds_call_control_method()
> > >     50163a115831 fs: jfs: fix shift-out-of-bounds in dbDiscardAG
> > >     156d440dea97 udf: Avoid double brelse() in udf_rename()
> > >     359616ce587e fs: jfs: fix shift-out-of-bounds in dbAllocAG
> > >     419b808504c2 binfmt_misc: fix shift-out-of-bounds in check_special_flags
> > >     3d92527a919e rcu: Fix __this_cpu_read() lockdep warning in rcu_force_quiescent_state()
> > >     4f1d37ff4226 net: stream: purge sk_error_queue in sk_stream_kill_queues()
> > >     fbae0dc7e22a myri10ge: Fix an error handling path in myri10ge_probe()
> > >     67af8655c889 rxrpc: Fix missing unlock in rxrpc_do_sendmsg()
> > >     93e794d4fe48 net_sched: reject TCF_EM_SIMPLE case for complex ematch module
> > >     b3a5c76f61e2 mailbox: zynq-ipi: fix error handling while device_register() fails
> > >     668dc454bcbd skbuff: Account for tail adjustment during pull operations
> > >     8b74211bf60b openvswitch: Fix flow lookup to use unmasked key
> > >     0e91836628d6 rtc: mxc_v2: Add missing clk_disable_unprepare()
> > >     b0a61359026b r6040: Fix kmemleak in probe and remove
> > >     8bddef54cbe9 nfc: pn533: Clear nfc_target before being used
> > >     db77d4d005c2 mISDN: hfcmulti: don't call dev_kfree_skb/kfree_skb() under spin_lock_irqsave()
> > >     82ff73638cd6 mISDN: hfcpci: don't call dev_kfree_skb/kfree_skb() under spin_lock_irqsave()
> > >     5a35d18e7952 mISDN: hfcsusb: don't call dev_kfree_skb/kfree_skb() under spin_lock_irqsave()
> > >     fddac3b4578d nfsd: under NFSv4.1, fix double svc_xprt_put on rpc_create failure
> > >     f06d3feee910 NFSD: Add tracepoints to NFSD's duplicate reply cache
> > >     fe142d5ceeb5 nfsd: Define the file access mode enum for tracing
> > >     aa5fafd4a6b4 rtc: pic32: Move devm_rtc_allocate_device earlier in pic32_rtc_probe()
> > >     686f0793f790 rtc: st-lpc: Add missing clk_disable_unprepare in st_rtc_probe()
> > >     1240ed71a0f6 remoteproc: qcom_q6v5_pas: Fix missing of_node_put() in adsp_alloc_memory_region()
> > >     27441fab2651 remoteproc: sysmon: fix memory leak in qcom_add_sysmon_subdev()
> > >     292c0f3b4ae0 pwm: sifive: Call pwm_sifive_update_clock() while mutex is held
> > >     2b7ad4357438 selftests/powerpc: Fix resource leaks
> > >     39633b4051ee powerpc/hv-gpci: Fix hv_gpci event list
> > >     aed862896d53 powerpc/83xx/mpc832x_rdb: call platform_device_put() in error case in of_fsl_spi_probe()
> > >     d539b77bae1e powerpc/perf: callchain validate kernel stack pointer bounds
> > >     cfb5bbfcb63b powerpc/xive: add missing iounmap() in error path in xive_spapr_populate_irq_data()
> > >     f2d60f6ba173 cxl: Fix refcount leak in cxl_calc_capp_routing
> > >     9bf842ffdd21 powerpc/52xx: Fix a resource leak in an error handling path
> > >     b703da16dc97 macintosh/macio-adb: check the return value of ioremap()
> > >     b29a2f1dd33a macintosh: fix possible memory leak in macio_add_one_device()
> > >     17fd44059496 iommu/fsl_pamu: Fix resource leak in fsl_pamu_probe()
> > >     8581ec1feb89 iommu/amd: Fix pci device refcount leak in ppr_notifier()
> > >     0d96a6f5db64 rtc: pcf85063: Fix reading alarm
> > >     bb1bdc72dd24 rtc: snvs: Allow a time difference on clock register read
> > >     6a54d033372d include/uapi/linux/swab: Fix potentially missing __always_inline
> > >     f170d4bd38dd RDMA/siw: Fix pointer cast warning
> > >     8ea68b4e3fa9 power: supply: fix null pointer dereferencing in power_supply_get_battery_info
> > >     61e80e792918 HSI: omap_ssi_core: Fix error handling in ssi_init()
> > >     7ae85631aead perf symbol: correction while adjusting symbol
> > >     739b4294f86a perf trace: Handle failure when trace point folder is missed
> > >     1b4053ad54b7 perf trace: Use macro RAW_SYSCALL_ARGS_NUM to replace number
> > >     443aaf605f9f perf trace: Add a strtoul() method to 'struct syscall_arg_fmt'
> > >     339e08e1858d perf trace: Allow associating scnprintf routines with well known arg names
> > >     97cc27a28ddc perf trace: Add the syscall_arg_fmt pointer to syscall_arg
> > >     a2fcb44f5e55 perf trace: Factor out the initialization of syscal_arg_fmt->scnprintf
> > >     ba67de37ad20 perf trace: Separate 'struct syscall_fmt' definition from syscall_fmts variable
> > >     6086919d8c2a perf trace: Return error if a system call doesn't exist
> > >     f84fff700dea power: supply: fix residue sysfs file in error handle route of __power_supply_register()
> > >     ef87ed9added HSI: omap_ssi_core: fix possible memory leak in ssi_probe()
> > >     e9a32f7523eb HSI: omap_ssi_core: fix unbalanced pm_runtime_disable()
> > >     0f049375ad49 fbdev: uvesafb: Fixes an error handling path in uvesafb_probe()
> > >     3c9aaa58f71d fbdev: vermilion: decrease reference count in error path
> > >     9413f188efc5 fbdev: via: Fix error in via_core_init()
> > >     65dbd8eefaa8 fbdev: pm2fb: fix missing pci_disable_device()
> > >     77738055e203 fbdev: ssd1307fb: Drop optional dependency
> > >     72c8770e3526 samples: vfio-mdev: Fix missing pci_disable_device() in mdpy_fb_probe()
> > >     19b651db9421 tracing/hist: Fix issue of losting command info in error_log
> > >     fab2536ba13d usb: storage: Add check for kcalloc
> > >     cdcbae2c5003 i2c: ismt: Fix an out-of-bounds bug in ismt_access()
> > >     f3f65c417784 vme: Fix error not catched in fake_init()
> > >     e5c97a433cc3 staging: rtl8192e: Fix potential use-after-free in rtllib_rx_Monitor()
> > >     288ada16a93a staging: rtl8192u: Fix use after free in ieee80211_rx()
> > >     c226717aa864 i2c: pxa-pci: fix missing pci_disable_device() on error in ce4100_i2c_probe
> > >     d85b5247a793 chardev: fix error handling in cdev_device_add()
> > >     110dc34c9fa3 mcb: mcb-parse: fix error handing in chameleon_parse_gdd()
> > >     68e54d9ee822 drivers: mcb: fix resource leak in mcb_probe()
> > >     80dc47e751a8 usb: gadget: f_hid: fix refcount leak on error path
> > >     c78c87c4e389 usb: gadget: f_hid: fix f_hidg lifetime vs cdev
> > >     efa2ed93e5b4 usb: gadget: f_hid: optional SETUP/SET_REPORT mode
> > >     5e193764c26e usb: roles: fix of node refcount leak in usb_role_switch_is_parent()
> > >     76740fd8c608 counter: stm32-lptimer-cnt: fix the check on arr and cmp registers update
> > >     361412dae169 cxl: fix possible null-ptr-deref in cxl_pci_init_afu|adapter()
> > >     60b2ed21a65f cxl: fix possible null-ptr-deref in cxl_guest_init_afu|adapter()
> > >     0078dd875856 misc: sgi-gru: fix use-after-free error in gru_set_context_option, gru_fault and gru_handle_user_call_os
> > >     ee2715faf7e7 misc: tifm: fix possible memory leak in tifm_7xx1_switch_media()
> > >     0cd05062371a misc: ocxl: fix possible name leak in ocxl_file_register_afu()
> > >     628de998a3ab test_firmware: fix memory leak in test_firmware_init()
> > >     98c01a728b46 serial: sunsab: Fix error handling in sunsab_init()
> > >     61f4146a7e5f serial: altera_uart: fix locking in polling mode
> > >     ce40c44e62bc tty: serial: altera_uart_{r,t}x_chars() need only uart_port
> > >     071bb9e36327 tty: serial: clean up stop-tx part in altera_uart_tx_chars()
> > >     d165388227aa serial: pch: Fix PCI device refcount leak in pch_request_dma()
> > >     06c886548c03 serial: pl011: Do not clear RX FIFO & RX interrupt in unthrottle.
> > >     965f07ea5fd1 serial: amba-pl011: avoid SBSA UART accessing DMACR register
> > >     4f257e2eba41 usb: typec: tcpci: fix of node refcount leak in tcpci_register_port()
> > >     af4049a2ff7b usb: typec: Check for ops->exit instead of ops->enter in altmode_exit
> > >     a45ba33d398a staging: vme_user: Fix possible UAF in tsi148_dma_list_add
> > >     90e227d8b48b usb: fotg210-udc: Fix ages old endianness issues
> > >     12d20ba3ce2c uio: uio_dmem_genirq: Fix deadlock between irq config and handling
> > >     eca77a25a7cb uio: uio_dmem_genirq: Fix missing unlock in irq configuration
> > >     c2163ecc4873 vfio: platform: Do not pass return buffer to ACPI _RST method
> > >     3e0efc3f3f5e class: fix possible memory leak in __class_register()
> > >     0c44f584e387 serial: tegra: Read DMA status before terminating
> > >     dcb26ea75d40 tty: serial: tegra: Activate RX DMA transfer by request
> > >     da64e01da40c drivers: dio: fix possible memory leak in dio_init()
> > >     d4bf3fcccd18 IB/IPoIB: Fix queue count inconsistency for PKEY child interfaces
> > >     5cc818ad53df hwrng: geode - Fix PCI device refcount leak
> > >     1199f8e02941 hwrng: amd - Fix PCI device refcount leak
> > >     c75ea343e4b9 crypto: img-hash - Fix variable dereferenced before check 'hdev->req'
> > >     76a9a58a7141 orangefs: Fix sysfs not cleanup when dev init failed
> > >     5a2028369de8 RDMA/hfi1: Fix error return code in parse_platform_config()
> > >     7917484c9923 crypto: omap-sham - Use pm_runtime_resume_and_get() in omap_sham_probe()
> > >     c21a09ed1e08 f2fs: avoid victim selection from previous victim section
> > >     91f63dd62272 RDMA/nldev: Add checks for nla_nest_start() in fill_stat_counter_qps()
> > >     6866154c23fb scsi: snic: Fix possible UAF in snic_tgt_create()
> > >     be5f1a82ad60 scsi: fcoe: Fix transport not deattached when fcoe_if_init() fails
> > >     eccbec017c95 scsi: ipr: Fix WARNING in ipr_init()
> > >     c9f83544fbfc scsi: fcoe: Fix possible name leak when device_register() fails
> > >     3c4bb9446d72 scsi: hpsa: Fix possible memory leak in hpsa_add_sas_device()
> > >     6fac40d80691 scsi: hpsa: Fix error handling in hpsa_add_sas_host()
> > >     d60000cb1195 scsi: mpt3sas: Fix possible resource leaks in mpt3sas_transport_port_add()
> > >     89e3f7324a38 crypto: tcrypt - Fix multibuffer skcipher speed test mem leak
> > >     f8fc2f186529 scsi: hpsa: Fix possible memory leak in hpsa_init_one()
> > >     bd7106a6004f RDMA/rxe: Fix NULL-ptr-deref in rxe_qp_do_cleanup() when socket create failed
> > >     a36c929fd78d crypto: ccree - Make cc_debugfs_global_fini() available for module init function
> > >     895bbed5ae53 RDMA/hfi: Decrease PCI device reference count in error path
> > >     7e68c0d09573 PCI: Check for alloc failure in pci_request_irq()
> > >     a234815cee9e crypto: ccree - Remove debugfs when platform_driver_register failed
> > >     ca438aa466b8 crypto: ccree - swap SHA384 and SHA512 larval hashes at build time
> > >     263d21afbac0 scsi: scsi_debug: Fix a warning in resp_write_scat()
> > >     b5848661f123 RDMA/siw: Set defined status for work completion with undefined status
> > >     ad1676587c54 RDMA/nldev: Return "-EAGAIN" if the cm_id isn't from expected port
> > >     6af043089d3f RDMA/siw: Fix immediate work request flush to completion queue
> > >     ef6079d98f49 f2fs: fix normal discard process
> > >     7826e4c85ed8 RDMA/core: Fix order of nldev_exit call
> > >     3339d808b609 apparmor: Use pointer to struct aa_label for lbs_cred
> > >     f7368ac846ae apparmor: Fix abi check to include v8 abi
> > >     e1a68ac0154a apparmor: fix lockdep warning when removing a namespace
> > >     eb0f78e28cbc apparmor: fix a memleak in multi_transaction_new()
> > >     df121012e439 stmmac: fix potential division by 0
> > >     203d604bd521 Bluetooth: RFCOMM: don't call kfree_skb() under spin_lock_irqsave()
> > >     5e832e018288 Bluetooth: hci_core: don't call kfree_skb() under spin_lock_irqsave()
> > >     8ae86c1ec22e Bluetooth: hci_bcsp: don't call kfree_skb() under spin_lock_irqsave()
> > >     f36058569115 Bluetooth: hci_h5: don't call kfree_skb() under spin_lock_irqsave()
> > >     78e76830c73a Bluetooth: hci_ll: don't call kfree_skb() under spin_lock_irqsave()
> > >     b38b064cba7a Bluetooth: hci_qca: don't call kfree_skb() under spin_lock_irqsave()
> > >     f6d822ce4b56 Bluetooth: btusb: don't call kfree_skb() under spin_lock_irqsave()
> > >     a6b9e0940310 ntb_netdev: Use dev_kfree_skb_any() in interrupt context
> > >     3f2946a54b89 net: lan9303: Fix read error execution path
> > >     7d67e8ccfc5f can: tcan4x5x: Remove invalid write in clear_interrupts
> > >     068672e75b08 net: amd-xgbe: Check only the minimum speed for active/passive cables
> > >     291b9669f664 net: amd-xgbe: Fix logic around active and passive cables
> > >     bc06c239d54c net: amd: lance: don't call dev_kfree_skb() under spin_lock_irqsave()
> > >     1e39d57a0ec8 hamradio: don't call dev_kfree_skb() under spin_lock_irqsave()
> > >     20dd87360543 net: ethernet: dnet: don't call dev_kfree_skb() under spin_lock_irqsave()
> > >     3b748ba07bae net: emaclite: don't call dev_kfree_skb() under spin_lock_irqsave()
> > >     4b8256d9bf0a net: apple: bmac: don't call dev_kfree_skb() under spin_lock_irqsave()
> > >     bc51a3cadffc net: apple: mace: don't call dev_kfree_skb() under spin_lock_irqsave()
> > >     303000c793f7 net/tunnel: wait until all sk_user_data reader finish before releasing the sock
> > >     0c5f2c7700cb net: farsync: Fix kmemleak when rmmods farsync
> > >     cf7416aa019b ethernet: s2io: don't call dev_kfree_skb() under spin_lock_irqsave()
> > >     9ec5781879b4 of: overlay: fix null pointer dereferencing in find_dup_cset_node_entry() and find_dup_cset_prop()
> > >     a44490abaf00 drivers: net: qlcnic: Fix potential memory leak in qlcnic_sriov_init()
> > >     429370c40d03 net: stmmac: selftests: fix potential memleak in stmmac_test_arpoffload()
> > >     bba527e4ec0a net: defxx: Fix missing err handling in dfx_init()
> > >     f54731a70c8d net: vmw_vsock: vmci: Check memcpy_from_msg()
> > >     6f2198914fb9 clk: socfpga: Fix memory leak in socfpga_gate_init()
> > >     dbd1a4fdf5ed clk: socfpga: use clk_hw_register for a5/c5
> > >     49513eabda46 clk: socfpga: clk-pll: Remove unused variable 'rc'
> > >     fe783eeac48c blktrace: Fix output non-blktrace event when blk_classic option enabled
> > >     d628d5c5b4f5 wifi: brcmfmac: Fix error return code in brcmf_sdio_download_firmware()
> > >     1a49bba59db0 wifi: rtl8xxxu: Add __packed to struct rtl8723bu_c2h
> > >     9e8440a65711 spi: spi-gpio: Don't set MOSI as an input if not 3WIRE mode
> > >     a00b4e0fa273 clk: samsung: Fix memory leak in _samsung_clk_register_pll()
> > >     7a2c66429b04 media: coda: Add check for kmalloc
> > >     2b436f141024 media: coda: Add check for dcoda_iram_alloc
> > >     6250bc73317a media: c8sectpfe: Add of_node_put() when breaking out of loop
> > >     0fcee27507aa mmc: mmci: fix return value check of mmc_add_host()
> > >     0a41ea4fd449 mmc: wbsd: fix return value check of mmc_add_host()
> > >     f59ef2a47a22 mmc: via-sdmmc: fix return value check of mmc_add_host()
> > >     9e11c6bb745b mmc: meson-gx: fix return value check of mmc_add_host()
> > >     f153c9e15f89 mmc: omap_hsmmc: fix return value check of mmc_add_host()
> > >     6bb26abb92f2 mmc: atmel-mci: fix return value check of mmc_add_host()
> > >     c7a328cea791 mmc: wmt-sdmmc: fix return value check of mmc_add_host()
> > >     3b29f8769d32 mmc: vub300: fix return value check of mmc_add_host()
> > >     3dbb69a0242c mmc: toshsd: fix return value check of mmc_add_host()
> > >     937112e991ed mmc: rtsx_usb_sdmmc: fix return value check of mmc_add_host()
> > >     0b7b63422579 mmc: pxamci: fix return value check of mmc_add_host()
> > >     32eb502c972d mmc: mxcmmc: fix return value check of mmc_add_host()
> > >     b174f2b36c63 mmc: moxart: fix return value check of mmc_add_host()
> > >     289c964fe182 mmc: alcor: fix return value check of mmc_add_host()
> > >     e8f20523cf98 NFSv4.x: Fail client initialisation if state manager thread can't run
> > >     f7a8a1e36ded SUNRPC: Fix missing release socket in rpc_sockname()
> > >     bcebcb11fcbc xprtrdma: Fix regbuf data not freed in rpcrdma_req_create()
> > >     c7e9624d90bf ALSA: mts64: fix possible null-ptr-defer in snd_mts64_interrupt
> > >     6a8c0abcb502 media: saa7164: fix missing pci_disable_device()
> > >     4cabc3af4a6f bpf, sockmap: fix race in sock_map_free()
> > >     35593d60b162 regulator: core: fix resource leak in regulator_register()
> > >     90c38f57a821 configfs: fix possible memory leak in configfs_create_dir()
> > >     6dea95f64069 hsr: Avoid double remove of a node.
> > >     de7dbee4bd4a clk: qcom: clk-krait: fix wrong div2 functions
> > >     339ba693daaf regulator: core: fix module refcount leak in set_supply()
> > >     46dfff91025b wifi: cfg80211: Fix not unregister reg_pdev when load_builtin_regdb_keys() fails
> > >     624a989db916 spi: spidev: mask SPI_CS_HIGH in SPI_IOC_RD_MODE
> > >     52fb0ffee06d bonding: uninitialized variable in bond_miimon_inspect()
> > >     31631c2ab4a9 bpf, sockmap: Fix data loss caused by using apply_bytes on ingress redirect
> > >     7508b9f4daac bpf, sockmap: Fix repeated calls to sock_put() when msg has more_data
> > >     d4145d028a12 netfilter: conntrack: set icmpv6 redirects as RELATED
> > >     27c09443ddcc ASoC: pcm512x: Fix PM disable depth imbalance in pcm512x_probe
> > >     981024abf5fe drm/amdgpu: Fix PCI device refcount leak in amdgpu_atrm_get_bios()
> > >     470a77989037 drm/radeon: Fix PCI device refcount leak in radeon_atrm_get_bios()
> > >     190685ff4ee0 ASoC: mediatek: mt8173: Enable IRQ when pdata is ready
> > >     0e1e311fd929 wifi: iwlwifi: mvm: fix double free on tx path.
> > >     8b0c003e37d5 ALSA: asihpi: fix missing pci_disable_device()
> > >     5447f1ad0bc1 NFSv4: Fix a deadlock between nfs4_open_recover_helper() and delegreturn
> > >     e53a7c28a428 NFSv4.2: Fix initialisation of struct nfs4_label
> > >     b2b472bcda7b NFSv4.2: Fix a memory stomp in decode_attr_security_label
> > >     96f3c70600a5 NFSv4.2: Clear FATTR4_WORD2_SECURITY_LABEL when done decoding
> > >     2672977dc089 ASoC: mediatek: mtk-btcvsd: Add checks for write and read of mtk_btcvsd_snd
> > >     d63e9eca9485 ASoC: dt-bindings: wcd9335: fix reset line polarity in example
> > >     4ea79d074776 drm/tegra: Add missing clk_disable_unprepare() in tegra_dc_probe()
> > >     542a87f1cfc6 media: s5p-mfc: Add variant data for MFC v7 hardware for Exynos 3250 SoC
> > >     8b256d23361c media: dvb-usb: az6027: fix null-ptr-deref in az6027_i2c_xfer()
> > >     9103bf21874e media: dvb-core: Fix ignored return value in dvb_register_frontend()
> > >     3359f8d5338d pinctrl: pinconf-generic: add missing of_node_put()
> > >     ffd53b7892c8 clk: imx: replace osc_hdmi with dummy
> > >     aa79b53df799 clk: imx8mn: correct the usb1_ctrl parent to be usb_bus
> > >     1d8521e1121a media: imon: fix a race condition in send_packet()
> > >     cf9c4c25caad mtd: maps: pxa2xx-flash: fix memory leak in probe
> > >     a7fc25159d6f bonding: fix link recovery in mode 2 when updelay is nonzero
> > >     0879f594a7c4 bonding: Rename slave_arr to usable_slaves
> > >     9eaeb3e460b9 bonding: Export skip slave logic to function
> > >     26b94635f1c8 clk: rockchip: Fix memory leak in rockchip_clk_register_pll()
> > >     96be283d10ef regulator: core: use kfree_const() to free space conditionally
> > >     d884ed9a2f0e ALSA: seq: fix undefined behavior in bit shift for SNDRV_SEQ_FILTER_USE_EVENT
> > >     497279199d4c ALSA: pcm: fix undefined behavior in bit shift for SNDRV_PCM_RATE_KNOT
> > >     e6364854f5b0 HID: hid-sensor-custom: set fixed size for custom attributes
> > >     75a5bf8eebc8 bpf: Move skb->len == 0 checks into __bpf_redirect
> > >     61688b8819ea media: videobuf-dma-contig: use dma_mmap_coherent
> > >     9ca9d7fd7df4 media: platform: exynos4-is: Fix error handling in fimc_md_init()
> > >     7b02c50d3978 media: solo6x10: fix possible memory leak in solo_sysfs_init()
> > >     f81f63168f08 Input: elants_i2c - properly handle the reset GPIO when power is off
> > >     8eb64dc5a790 mtd: lpddr2_nvm: Fix possible null-ptr-deref
> > >     8e51f5894df2 wifi: ath10k: Fix return value in ath10k_pci_init()
> > >     8176538866cb ima: Fix misuse of dereference of pointer in template_desc_init_fields()
> > >     9b7c44885a07 integrity: Fix memory leakage in keyring allocation error path
> > >     4d3dc0de9c46 amdgpu/pm: prevent array underflow in vega20_odn_edit_dpm_table()
> > >     d39937f8de64 regulator: core: fix unbalanced of node refcount in regulator_dev_lookup()
> > >     a8baccb79de2 ASoC: pxa: fix null-pointer dereference in filter()
> > >     6f13a895cef8 drm/mediatek: Modify dpi power on/off sequence.
> > >     a0f26560be2c drm/radeon: Add the missed acpi_put_table() to fix memory leak
> > >     832d0e19ce12 rxrpc: Fix ack.bufferSize to be 0 when generating an ack
> > >     c9c9350d30e9 net, proc: Provide PROC_FS=n fallback for proc_create_net_single_write()
> > >     fe443b3fe36c media: camss: Clean up received buffers on failed start of streaming
> > >     08114dc18580 wifi: rsi: Fix handling of 802.3 EAPOL frames sent via control port
> > >     fa0d32ab8407 mtd: Fix device name leak when register device failed in add_mtd_device()
> > >     d70fa0a6ce74 bpf: propagate precision in ALU/ALU64 operations
> > >     54f259906039 media: vivid: fix compose size exceed boundary
> > >     38d48fd22403 ima: Handle -ESTALE returned by ima_filter_rule_match()
> > >     ecd0a6f81a1a ima: Fix fall-through warnings for Clang
> > >     55e2430e4325 ima: Rename internal filter rule functions
> > >     0b7c47b7f358 drm/panel/panel-sitronix-st7701: Remove panel on DSI attach failure
> > >     3fcdc1534b4c spi: Update reference to struct spi_controller
> > >     d87dd4528d0e clk: renesas: r9a06g032: Repair grave increment error
> > >     a2046e5a361f can: kvaser_usb: Compare requested bittiming parameters with actual parameters in do_set_{,data}_bittiming
> > >     7482f95315d2 can: kvaser_usb: Add struct kvaser_usb_busparams
> > >     f3d20de76fc9 can: kvaser_usb_leaf: Fix bogus restart events
> > >     ad63992b6488 can: kvaser_usb_leaf: Fix wrong CAN state after stopping
> > >     920879577060 can: kvaser_usb_leaf: Fix improved state not being reported
> > >     60ad08be78fd can: kvaser_usb_leaf: Set Warning state even without bus errors
> > >     12d95e65f709 can: kvaser_usb: kvaser_usb_leaf: Handle CMD_ERROR_EVENT
> > >     5779a9d0e358 can: kvaser_usb: kvaser_usb_leaf: Rename {leaf,usbcan}_cmd_error_event to {leaf,usbcan}_cmd_can_error_event
> > >     0e56748852f1 can: kvaser_usb: kvaser_usb_leaf: Get capabilities from device
> > >     3a9d74f33988 can: kvaser_usb: do not increase tx statistics when sending error message frames
> > >     3f2384f09ba0 media: i2c: ad5820: Fix error path
> > >     e8e2da03c287 pata_ipx4xx_cf: Fix unsigned comparison with less than zero
> > >     5994e7a806a0 wifi: rtl8xxxu: Fix reading the vendor of combo chips
> > >     988bd27de248 wifi: ath9k: hif_usb: Fix use-after-free in ath9k_hif_usb_reg_in_cb()
> > >     9850791d389b wifi: ath9k: hif_usb: fix memory leak of urbs in ath9k_hif_usb_dealloc_tx_urbs()
> > >     bb7397f6312d rapidio: devices: fix missing put_device in mport_cdev_open
> > >     6a95b17e4d4c hfs: Fix OOB Write in hfs_asc2mac
> > >     657fea0a8df0 relay: fix type mismatch when allocating memory in relay_create_buf()
> > >     e275249e5e65 eventfd: change int to __u64 in eventfd_signal() ifndef CONFIG_EVENTFD
> > >     311b488405ac rapidio: fix possible UAF when kfifo_alloc() fails
> > >     7aa5325e1b50 fs: sysv: Fix sysv_nblocks() returns wrong value
> > >     cb5859603cd1 MIPS: OCTEON: warn only once if deprecated link status is being used
> > >     b7ca75207e4a MIPS: BCM63xx: Add check for NULL for clk in clk_enable
> > >     14bb4bde3b7b platform/x86: mxm-wmi: fix memleak in mxm_wmi_call_mx[ds|mx]()
> > >     11ad95912b8b PM: runtime: Do not call __rpm_callback() from rpm_idle()
> > >     c40ee4e04b4c PM: runtime: Improve path in rpm_idle() when no callback
> > >     4f983ee5e5de xen/privcmd: Fix a possible warning in privcmd_ioctl_mmap_resource()
> > >     29198f667f44 x86/xen: Fix memory leak in xen_init_lock_cpu()
> > >     ec88254208dd x86/xen: Fix memory leak in xen_smp_intr_init{_pv}()
> > >     6e98158d97e1 xen/events: only register debug interrupt for 2-level events
> > >     314d51053524 uprobes/x86: Allow to probe a NOP instruction with 0x66 prefix
> > >     dfdde4d5138b ACPICA: Fix use-after-free in acpi_ut_copy_ipackage_to_ipackage()
> > >     805665aa5295 clocksource/drivers/sh_cmt: Make sure channel clock supply is enabled
> > >     1bbad5793f40 rapidio: rio: fix possible name leak in rio_register_mport()
> > >     440afd7fd9b1 rapidio: fix possible name leaks when rio_add_device() fails
> > >     7ef516888c4d ocfs2: fix memory leak in ocfs2_mount_volume()
> > >     a4d3062f0ac7 ocfs2: rewrite error handling of ocfs2_fill_super
> > >     227cc62e0049 ocfs2: ocfs2_mount_volume does cleanup job before return error
> > >     5c27b46c20ec debugfs: fix error when writing negative value to atomic_t debugfs file
> > >     c7bd49275da3 docs: fault-injection: fix non-working usage of negative values
> > >     6865a549f261 lib/notifier-error-inject: fix error when writing -errno to debugfs file
> > >     6fc6461672a4 libfs: add DEFINE_SIMPLE_ATTRIBUTE_SIGNED for signed value
> > >     75940697c040 cpufreq: amd_freq_sensitivity: Add missing pci_dev_put()
> > >     d25bf9af860e genirq/irqdesc: Don't try to remove non-existing sysfs files
> > >     b4e28099cd70 nfsd: don't call nfsd_file_put from client states seqfile display
> > >     e6e295a434d1 EDAC/i10nm: fix refcount leak in pci_get_dev_wrapper()
> > >     d5c06dba4612 irqchip: gic-pm: Use pm_runtime_resume_and_get() in gic_probe()
> > >     e293263248f2 perf/x86/intel/uncore: Fix reference count leak in hswep_has_limit_sbox()
> > >     81b024df4755 PNP: fix name memory leak in pnp_alloc_dev()
> > >     821afb8c89c0 selftests/efivarfs: Add checking of the test return value
> > >     c0b8cff0146b MIPS: vpe-cmp: fix possible memory leak while module exiting
> > >     b3325a443525 MIPS: vpe-mt: fix possible memory leak while module exiting
> > >     7c8bf45cea9c ocfs2: fix memory leak in ocfs2_stack_glue_init()
> > >     e039929e3681 lib/fonts: fix undefined behavior in bit shift for get_default_font
> > >     160d6d6f1479 proc: fixup uptime selftest
> > >     d7b9e43a5c57 timerqueue: Use rb_entry_safe() in timerqueue_getnext()
> > >     248fa44cde6d perf: Fix possible memleak in pmu_dev_alloc()
> > >     044ede4c38ee selftests/ftrace: event_triggers: wait longer for test_event_enable
> > >     8511186f10a4 fs: don't audit the capability check in simple_xattr_list()
> > >     c907c55dc7a5 PM: hibernate: Fix mistake in kerneldoc comment
> > >     f0ff6c60bc82 alpha: fix syscall entry in !AUDUT_SYSCALL case
> > >     1399ce344ee8 cpuidle: dt: Return the correct numbers of parsed idle states
> > >     082b55fe9fc6 tpm/tpm_crb: Fix error message in __crb_relinquish_locality()
> > >     4d3126f242a0 pstore: Avoid kcore oops by vmap()ing with VM_IOREMAP
> > >     e2516652da3f ARM: mmp: fix timer_read delay
> > >     2de791ff6f80 pstore/ram: Fix error return code in ramoops_probe()
> > >     ded1b827164f arm64: dts: armada-3720-turris-mox: Add missing interrupt for RTC
> > >     03a666631aa4 ARM: dts: turris-omnia: Add switch port 6 node
> > >     fe1fc4d84d2a ARM: dts: turris-omnia: Add ethernet aliases
> > >     b20454ea05f6 ARM: dts: armada-39x: Fix assigned-addresses for every PCIe Root Port
> > >     1b7017211ecc ARM: dts: armada-38x: Fix assigned-addresses for every PCIe Root Port
> > >     87b951b7c2e5 ARM: dts: armada-375: Fix assigned-addresses for every PCIe Root Port
> > >     e3cf3f7a6d54 ARM: dts: armada-xp: Fix assigned-addresses for every PCIe Root Port
> > >     e302758caf72 ARM: dts: armada-370: Fix assigned-addresses for every PCIe Root Port
> > >     0a8544b7236f ARM: dts: dove: Fix assigned-addresses for every PCIe Root Port
> > >     f707c3fee2e0 arm64: dts: mediatek: mt6797: Fix 26M oscillator unit name
> > >     fdf511fc076d arm64: dts: mt2712-evb: Fix usb vbus regulators unit names
> > >     06fbfc5f4374 arm64: dts: mt2712-evb: Fix vproc fixed regulators unit names
> > >     f0c1f46e4975 arm64: dts: mt2712e: Fix unit address for pinctrl node
> > >     aaabd7e3e4aa arm64: dts: mt2712e: Fix unit_address_vs_reg warning for oscillators
> > >     d69bdb61d577 perf/smmuv3: Fix hotplug callback leak in arm_smmu_pmu_init()
> > >     af2256d7784f perf: arm_dsu: Fix hotplug callback leak in dsu_pmu_init()
> > >     1e9186d628d3 soc: ti: smartreflex: Fix PM disable depth imbalance in omap_sr_probe
> > >     83cfc38091ed soc: ti: knav_qmss_queue: Fix PM disable depth imbalance in knav_queue_probe
> > >     5f07c85ca107 soc: ti: knav_qmss_queue: Use pm_runtime_resume_and_get instead of pm_runtime_get_sync
> > >     f5c521195e49 arm: dts: spear600: Fix clcd interrupt
> > >     3a90edbab8d1 drivers: soc: ti: knav_qmss_queue: Mark knav_acc_firmwares as static
> > >     3459e05ad32b arm64: dts: qcom: sdm845-cheza: fix AP suspend pin bias
> > >     6a24277840dd ARM: dts: qcom: apq8064: fix coresight compatible
> > >     1a19212a711e usb: musb: remove extra check in musb_gadget_vbus_draw
> > >     40075e797577 net: loopback: use NET_NAME_PREDICTABLE for name_assign_type
> > >     9fdc79b57143 Bluetooth: L2CAP: Fix u8 overflow
> > >     77d5e6f260ac HID: uclogic: Add HID_QUIRK_HIDINPUT_FORCE quirk
> > >     c05a7fa01020 HID: ite: Enable QUIRK_TOUCHPAD_ON_OFF_REPORT on Acer Aspire Switch V 10
> > >     d535a33e83a0 HID: ite: Enable QUIRK_TOUCHPAD_ON_OFF_REPORT on Acer Aspire Switch 10E
> > >     7346b2529fed HID: ite: Add support for Acer S1002 keyboard-dock
> > >     2d91b7a0b0e8 xen-netback: move removal of "hotplug-status" to the right place
> > >     c581439a9775 igb: Initialize mailbox message for VF reset
> > >     50aa193a4bf4 USB: serial: f81534: fix division by zero on line-speed change
> > >     0d6bf63eb3ec USB: serial: f81232: fix division by zero on line-speed change
> > >     fe0f214385d4 USB: serial: cp210x: add Kamstrup RF sniffer PIDs
> > >     d48767065423 USB: serial: option: add Quectel EM05-G modem
> > >     b8fb1cba934e usb: gadget: uvc: Prevent buffer overflow in setup handler
> > >     2610c2e59c66 udf: Fix extending file within last block
> > >     ade1726d8c2c udf: Do not bother looking for prealloc extents if i_lenExtents matches i_size
> > >     4d835efd561d udf: Fix preallocation discarding at indirect extent boundary
> > >     0905c78f623e udf: Discard preallocation before extending file with a hole
> > >     0758b5069294 tracing/ring-buffer: Only do full wait when cpu != RING_BUFFER_ALL_CPUS
> > >
> > > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > ---
> > >  .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
> > >  .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
> > >  meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
> > >  3 files changed, 18 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > index e9abb46493..36159ac5b0 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
> > > @@ -11,13 +11,13 @@ python () {
> > >          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
> > >  }
> > >
> > > -SRCREV_machine ?= "acaf6e01f6ecd6d80ac02f552344c6c0de1c7fe1"
> > > -SRCREV_meta ?= "b00c12ce7affe7e5da43fa4285998866a51e6e79"
> > > +SRCREV_machine ?= "430278c953a6c3614604a2852ba836039663bb65"
> > > +SRCREV_meta ?= "d92569bdd24ef1deb731012b3f8e1e05c2f08598"
> > >
> > >  SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
> > >             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
> > >
> > > -LINUX_VERSION ?= "5.4.228"
> > > +LINUX_VERSION ?= "5.4.229"
> > >
> > >  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > > index a9f83f2835..6abed4169f 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
> > > @@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
> > >
> > >  require recipes-kernel/linux/linux-yocto.inc
> > >
> > > -LINUX_VERSION ?= "5.4.228"
> > > +LINUX_VERSION ?= "5.4.229"
> > >  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > >
> > >  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> > > @@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
> > >  KMETA = "kernel-meta"
> > >  KCONF_BSP_AUDIT_LEVEL = "2"
> > >
> > > -SRCREV_machine_qemuarm ?= "575c3de9d720c998b5b4ab0253893a4132b4423f"
> > > -SRCREV_machine ?= "b72387f2b7f2babf1b0ca6e4ced3b22538162474"
> > > -SRCREV_meta ?= "b00c12ce7affe7e5da43fa4285998866a51e6e79"
> > > +SRCREV_machine_qemuarm ?= "d8143ca5ca26eeedcb7935aeb47adcd532e94969"
> > > +SRCREV_machine ?= "3ecac0457b3095be2824b28d025aad72fe5f5e25"
> > > +SRCREV_meta ?= "d92569bdd24ef1deb731012b3f8e1e05c2f08598"
> > >
> > >  PV = "${LINUX_VERSION}+git${SRCPV}"
> > >
> > > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > > index d76ed47f03..3e346b0093 100644
> > > --- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > > +++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
> > > @@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
> > >  KBRANCH_qemux86-64 ?= "v5.4/standard/base"
> > >  KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
> > >
> > > -SRCREV_machine_qemuarm ?= "32654a547b05ba63c604503fc865d7052ae96992"
> > > -SRCREV_machine_qemuarm64 ?= "2bd8ca7c0973870753b103107513689a598383d7"
> > > -SRCREV_machine_qemumips ?= "84a8ba0ada556ba3307c33e2b5a0ca8f9e3df1dd"
> > > -SRCREV_machine_qemuppc ?= "20db90d7935c8760bfc68c0de4f7d7085cba7c14"
> > > -SRCREV_machine_qemuriscv64 ?= "921d9e22542506ba26c2e5e2f25ec00ff9bffa63"
> > > -SRCREV_machine_qemux86 ?= "921d9e22542506ba26c2e5e2f25ec00ff9bffa63"
> > > -SRCREV_machine_qemux86-64 ?= "921d9e22542506ba26c2e5e2f25ec00ff9bffa63"
> > > -SRCREV_machine_qemumips64 ?= "929fde255b362923e9bba63250005b09c3a50f45"
> > > -SRCREV_machine ?= "921d9e22542506ba26c2e5e2f25ec00ff9bffa63"
> > > -SRCREV_meta ?= "b00c12ce7affe7e5da43fa4285998866a51e6e79"
> > > +SRCREV_machine_qemuarm ?= "df7aef2e323db780b804567cd7cf4b9c55e4622d"
> > > +SRCREV_machine_qemuarm64 ?= "4b94e6b1d6938c9e32947fa10376c7ed2e5f914d"
> > > +SRCREV_machine_qemumips ?= "98ca7afaec302294afbc336c3b266ebf60432fe1"
> > > +SRCREV_machine_qemuppc ?= "921849d498a19c70e61c8ba708394c0c1351b21b"
> > > +SRCREV_machine_qemuriscv64 ?= "1448462c1aa2b710dc0d3a6aa0b8b0904dbc7657"
> > > +SRCREV_machine_qemux86 ?= "1448462c1aa2b710dc0d3a6aa0b8b0904dbc7657"
> > > +SRCREV_machine_qemux86-64 ?= "1448462c1aa2b710dc0d3a6aa0b8b0904dbc7657"
> > > +SRCREV_machine_qemumips64 ?= "7ea86c799c5fc1a7cbbb379dcfbd045c4e404406"
> > > +SRCREV_machine ?= "1448462c1aa2b710dc0d3a6aa0b8b0904dbc7657"
> > > +SRCREV_meta ?= "d92569bdd24ef1deb731012b3f8e1e05c2f08598"
> > >
> > >  # remap qemuarm to qemuarma15 for the 5.4 kernel
> > >  # KMACHINE_qemuarm ?= "qemuarma15"
> > > @@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
> > >             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
> > >
> > >  LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > > -LINUX_VERSION ?= "5.4.228"
> > > +LINUX_VERSION ?= "5.4.229"
> > >
> > >  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> > >  DEPENDS += "openssl-native util-linux-native"
> > > --
> > > 2.34.1
> > >
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

