Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9E7B96167B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 04:06:46 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id r21so10316222edq.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 20:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=z3jytVeekourejYouNVYx76u8nsKxoPY30smfPdYOHc=;
	b=CVz50jyFyBPWd/JBX1vTmp5sNScgTHK3zwDX2WptffJLpGCK3TyiDDC85xrOqxO+cc
	sYnukesh28JmFMKCcgxFYKX1z2AA5FQPBAPE3t910zLf42MeRc/W0mvmwvdNKELFaONp
	VaWcbj0S5Sj0e9p2y7lf4HmqgSU6rjobDhNqUJNklFaVTWcWKhVb2evq+FABbuGKVd0b
	Axe3fwD+QizCtgBEl7imJZsfA2oMe/udsqzxbPQ0Cs8pPMHda4Gzqfg79nMAkRHCncSv
	jpA1VZXbd0A97gAegwINxVSf7Jps0uFQRTkwGec4tuy/dMerVqDRl0ft0PbyafWw2fqZ
	1GZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=z3jytVeekourejYouNVYx76u8nsKxoPY30smfPdYOHc=;
	b=bn9vJDMzGOvxCnDN84Ezu/Ogjp+TUMbLhu4QgqClwuvu3HQRsyOmiIgbrW2hLtJYiY
	4/WyykENlxSlmRCeUtpjtzQ5hfwT0z+8XEqX56gUAOddcd8a2JsqUkMc+z4L60ogN1LB
	f+n3sbszScffqT9+NymvxBl6BtAu/SmQF/OfoXnifqXQRDGnajypCkIpc8yPtD+MdkYW
	luWfziCg1iUpbaEfAZdl9C8evT+n1q3mi8l7YMLLDdty1MDP6AhBxt76unaoeEAMfvpv
	Y9MuCn9Lk2ZKnmLziKgXSAvfEGdCJJhxNkTa1m/2njSb3sHEcDNZ9d0xWdGkeMjGkLWt
	m7dA==
X-Gm-Message-State: APjAAAV07mmoV8M/HVbEASrF7LXJ0zT+6Tcr9m3dfE+ZSqXpXSgQo/6r
	0YlozxbXj9EiOnVxNZpCX8BRKmcjsUPSGEOI++o=
X-Google-Smtp-Source: APXvYqx8w29FwTDy5Sx5D6l7n4AZT99+VH7V5PatES97iiK13o/cr5cJDGAFkL34a0wSJe8LG+jskoM6RhsBAPHUITA=
X-Received: by 2002:aa7:cf81:: with SMTP id z1mr44719350edx.234.1582517206867; 
	Sun, 23 Feb 2020 20:06:46 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582306887.git.bruce.ashfield@gmail.com>
	<d8759e58c654453056e27a6cca60face1ff97e2b.1582306887.git.bruce.ashfield@gmail.com>
	<C0207330DF60C5409302EC78C3FE68F30344C367@PGSMSX101.gar.corp.intel.com>
In-Reply-To: <C0207330DF60C5409302EC78C3FE68F30344C367@PGSMSX101.gar.corp.intel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 23 Feb 2020 23:06:35 -0500
Message-ID: <CADkTA4OyKvYyWGUMy0f5dUR-KyUCDk0aVUy4w7xkGpe5BB8MQA@mail.gmail.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/10] linux-yocto/5.2: update to v5.2.29
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Feb 2020 04:06:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 23, 2020 at 6:30 PM Mittal, Anuj <anuj.mittal@intel.com> wrote:
>
> This is causing error when building linux-yocto-rt 5.2:
>

It's already fixed in the tree (up to the .32 version), so I can send
those bumps out shortly (although that will be followed quickly by the
removal of 5.2 from master).

Cheers,

Bruce

> | In file included from <builddir>/build/tmp/work-shared/intel-core2-32/kernel-source/include/linux/spinlock.h:51,
> |                  from <builddir>/build/tmp/work-shared/intel-core2-32/kernel-source/include/linux/mmzone.h:8,
> |                  from <builddir>/build/tmp/work-shared/intel-core2-32/kernel-source/include/linux/gfp.h:6,
> |                  from <builddir>/build/tmp/work-shared/intel-core2-32/kernel-source/include/linux/slab.h:15,
> |                  from <builddir>/build/tmp/work-shared/intel-core2-32/kernel-source/include/linux/crypto.h:19,
> |                  from <builddir>/build/tmp/work-shared/intel-core2-32/kernel-source/arch/x86/kernel/asm-offsets.c:9:
> | <builddir>/build/tmp/work-shared/intel-core2-32/kernel-source/include/linux/spinlock_api_smp.h: In function '__raw_spin_trylock':
> | <builddir>/build/tmp/work-shared/intel-core2-32/kernel-source/include/linux/preempt.h:190:3: error: implicit declaration of function '__preempt_schedule' [-Werror=implicit-function-declaration]
> |   190 |   __preempt_schedule(); \
> |       |   ^~~~~~~~~~~~~~~~~~
> | <builddir>/build/tmp/work-shared/intel-core2-32/kernel-source/include/linux/spinlock_api_smp.h:93:2: note: in expansion of macro 'preempt_enable'
> |    93 |  preempt_enable();
> |       |  ^~~~~~~~~~~~~~
> | <builddir>/build/tmp/work-shared/intel-core2-32/kernel-source/include/linux/rcupdate.h: In function 'rcu_read_unlock_sched_notrace':
> | <builddir>/build/tmp/work-shared/intel-core2-32/kernel-source/include/linux/preempt.h:197:3: error: implicit declaration of function '__preempt_schedule_notrace'; did you mean 'preempt_enable_notrace'? [-Werror=implicit-function-declaration]
> |   197 |   __preempt_schedule_notrace(); \
> |       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> | <builddir>/build/tmp/work-shared/intel-core2-32/kernel-source/include/linux/rcupdate.h:731:2: note: in expansion of macro 'preempt_enable_notrace'
> |   731 |  preempt_enable_notrace();
> |       |  ^~~~~~~~~~~~~~~~~~~~~~
>
> Thanks,
>
> Anuj
>
> > -----Original Message-----
> > From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-
> > bounces@lists.openembedded.org> On Behalf Of bruce.ashfield@gmail.com
> > Sent: Saturday, February 22, 2020 01:46 AM
> > To: richard.purdie@linuxfoundation.org
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH 03/10] linux-yocto/5.2: update to v5.2.29
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Updating linux-yocto/5.2 to the latest korg -stable release that comprises the following
> > commits:
> >
> >     928ea9c56927 Linux 5.2.29
> >     4e41907620bc slip: Fix use-after-free Read in slip_open
> >     d11814f97a05 can: slcan: Fix use-after-free Read in slcan_open
> >     01313dcf66e7 can: kvaser_usb: kvaser_usb_leaf: Fix some info-leaks to USB
> > devices
> >     7f006e58efc2 scsi: libsas: stop discovering if oob mode is disconnected
> >     0e5c48d6b011 staging: comedi: usbduxfast: usbduxfast_ai_cmdtest rounding error
> >     d8b3d5fb8765 USB: serial: option: add support for Foxconn T77W968 LTE
> > modules
> >     c4fe1d495f9c USB: serial: option: add support for DW5821e with eSIM support
> >     4ac031b15d86 USB: serial: mos7840: fix remote wakeup
> >     4d44a218aea6 USB: serial: mos7720: fix remote wakeup
> >     3561f4d3242f USB: serial: mos7840: add USB ID to support Moxa UPort 2210
> >     13a33fb9debe appledisplay: fix error handling in the scheduled work
> >     0cd437d7c16b USB: chaoskey: fix error case of a timeout
> >     2136119fde46 usb-serial: cp201x: support Mark-10 digital force gauge
> >     3a71173a4a45 usbip: tools: fix fd leakage in the function of read_attr_usbip_status
> >     726510907c68 USBIP: add config dependency for SGL_ALLOC
> >     7dd553573bc5 media: mceusb: fix out of bounds read in MCE receiver buffer
> >     1e4921f684ca media: imon: invalid dereference in imon_touch_event
> >     d482dfe2776a media: cxusb: detect cxusb_ctrl_msg error in query
> >     ab4952849dd8 media: b2c2-flexcop-usb: add sanity checking
> >     e2aa61cda115 media: uvcvideo: Fix error path in control parsing failure
> >     115fa3afd4d1 cpufreq: Add NULL checks to show() and store() methods of
> > cpufreq
> >     767facdefa23 media: usbvision: Fix races among open, close, and disconnect
> >     ba90b62cb0bd media: usbvision: Fix invalid accesses after device disconnect
> >     829b703e9706 media: vivid: Set vid_cap_streaming and vid_out_streaming to true
> >     57f2b5c44f02 nfc: port100: handle command failure cleanly
> >     5fc4dc967e06 ALSA: usb-audio: Fix NULL dereference at parsing BADD
> >     c938307a439a futex: Prevent robust futex exit race
> >     8b0f13ee2b7b nbd: prevent memory leak
> >     1bfd67a1c47b ARM: 8904/1: skip nomap memblocks while finding the
> > lowmem/highmem boundary
> >     a634776bcd5e md/raid10: prevent access of uninitialized resync_pages offset
> >     40c0b4538c8b Revert "dm crypt: use WQ_HIGHPRI for the IO and crypt
> > workqueues"
> >     53eaf5993eea ath9k_hw: fix uninitialized variable data
> >     5a1b959a78ea ath10k: Fix a NULL-ptr-deref bug in
> > ath10k_usb_alloc_urb_from_pipe
> >     8b16c7096bc9 ath10k: Fix HOST capability QMI incompatibility
> >     ceee3b64b0b5 ath10k: restore QCA9880-AR1A (v1) detection
> >     08c0402ed497 Bluetooth: Fix invalid-free in bcsp_close()
> >     c1ed057fbe33 drm/i915/userptr: Try to acquire the page lock around
> > set_page_dirty()
> >     5ec5ba44bd85 drm/i915/pmu: "Frequency" is reported as accumulated cycles
> >     c7ceeaf80706 drm/amd/powerplay: issue no PPSMC_MSG_GetCurrPkgPwr on
> > unsupported ASICs
> >     1c3fb0c8357e drm/amdgpu: disable gfxoff on original raven
> >     ccd9d21f783e drm/amdgpu: disable gfxoff when using register read interface
> >     6e745cbc5051 mm/ksm.c: don't WARN if page is still mapped in
> > remove_stable_node()
> >     79194b4a342c mm/memory_hotplug: don't access uninitialized memmaps in
> > shrink_zone_span()
> >     01d151b7e74e virtio_balloon: fix shrinker count
> >     caae62219805 virtio_ring: fix return code on DMA mapping fails
> >     272ed6b7ca4a virtio_console: allocate inbufs in add_port() only if it is needed
> >     abce58c3af15 nbd:fix memory leak in nbd_get_socket()
> >     2601193dc253 tools: gpio: Correctly add make dependencies for gpio_utils
> >     3608aa07bac2 gpio: max77620: Fixup debounce delays
> >     c6bf6af12a68 vhost/vsock: split packets to send using multiple buffers
> >     95a617d1f70c net/mlx5: Update the list of the PCI supported devices
> >     febceda6db3f net/mlx5e: Do not use non-EXT link modes in EXT mode
> >     f8bddf0e192a net/mlx5e: Fix error flow cleanup in
> > mlx5e_tc_tun_create_header_ipv4/6
> >     e049e3c43308 taprio: don't reject same mqprio settings
> >     8345d40b83bf ipv6/route: return if there is no fib_nh_gw_family
> >     1edfc6649c92 net/tls: enable sk_msg redirect to tls socket egress
> >     27845a1dd06b net/mlx5: Fix auto group size calculation
> >     ec6d299939c3 net/mlx5e: Fix set vf link state error flow
> >     bab144f2a957 net/mlxfw: Verify FSM error code translation doesn't exceed array
> > size
> >     3eb4c2e70dce sfc: Only cancel the PPS workqueue if it exists
> >     a03585b724bc net: sched: ensure opts_len <= IP_TUNNEL_OPTS_MAX in
> > act_tunnel_key
> >     285a19d8dde0 net/sched: act_pedit: fix WARN() in the traffic path
> >     8e40158af458 net: rtnetlink: prevent underflows in do_setvfinfo()
> >     1afad75b2dba net/mlx4_en: Fix wrong limitation for number of TX rings
> >     ce1291041c39 net/mlx4_en: fix mlx4 ethtool -N insertion
> >     2a7ad86813a4 mlxsw: spectrum_router: Fix determining underlay for a GRE tunnel
> >     da957117e731 fbdev: Ditch fb_edid_add_monspecs
> >     1f043415c4f5 arm64: uaccess: Ensure PAN is re-enabled after unhandled uaccess
> > fault
> >     0063e9b69796 mm/memory_hotplug: fix updating the node span
> >     d27074543286 mm/memory_hotplug: don't access uninitialized memmaps in
> > shrink_pgdat_span()
> >     62ca688436d3 block, bfq: deschedule empty bfq_queues not referred by any
> > process
> >     045a481acd16 slcan: Fix memory leak in error path
> >     22bc38eae704 mmc: sdhci-of-at91: fix quirk2 overwrite
> >     8505966cdc7e mm/page_io.c: do not free shared swap slots
> >     349d5ccf8971 mm: hugetlb: switch to css_tryget() in
> > hugetlb_cgroup_charge_cgroup()
> >     cb4df7d810ac mm: memcg: switch to css_tryget() in get_mem_cgroup_from_mm()
> >     eec30082ea78 mm: mempolicy: fix the wrong return value and potential pages leak
> > of mbind
> >     c4b3eaf0585b iommu/vt-d: Fix QI_DEV_IOTLB_PFSID and
> > QI_DEV_EIOTLB_PFSID macros
> >     5a705e36d350 net: ethernet: dwmac-sun8i: Use the correct function in exit path
> >     50d4170ffddd ntp/y2038: Remove incorrect time_t truncation
> >     f701a893aba0 ecryptfs_lookup_interpose(): lower_dentry->d_parent is not stable
> > either
> >     97dd5923ba23 ecryptfs_lookup_interpose(): lower_dentry->d_inode is not stable
> >     3c130e6cddae x86/quirks: Disable HPET on Intel Coffe Lake platforms
> >     a0f63a47ab13 i2c: acpi: Force bus speed to 400KHz if a Silead touchscreen is
> > present
> >     ca7d1676d537 IB/hfi1: Use a common pad buffer for 9B and 16B packets
> >     b8b6479e3cc9 IB/hfi1: Ensure full Gen3 speed in a Gen4 system
> >     72ff837e69c5 IB/hfi1: TID RDMA WRITE should not return
> > IB_WC_RNR_RETRY_EXC_ERR
> >     3c1db8a639ac IB/hfi1: Calculate flow weight based on QP MTU for TID RDMA
> >     d2f5dd2fd992 IB/hfi1: Ensure r_tid_ack is valid before building TID RDMA ACK
> > packet
> >     e88f0707f216 KVM: MMU: Do not treat ZONE_DEVICE pages as being reserved
> >     9e35e5bc4a04 Input: synaptics-rmi4 - destroy F54 poller workqueue when
> > removing
> >     2eaf311ccd38 Input: synaptics-rmi4 - clear IRQ enables for F54
> >     f05aacf5a7b9 Input: synaptics-rmi4 - do not consume more data than we have
> > (F11, F12)
> >     7e649c757a1a Input: synaptics-rmi4 - disable the relative position IRQ in the F12
> > driver
> >     4b482d7281a6 Input: synaptics-rmi4 - fix video buffer size
> >     74e0752ee79e cgroup: freezer: call cgroup_enter_frozen() with preemption
> > disabled in ptrace_stop()
> >     a9cae67b7a20 Btrfs: fix log context list corruption after rename exchange operation
> >     011e452b4d84 ALSA: usb-audio: not submit urb for stopped endpoint
> >     c7801593d92a ALSA: usb-audio: Fix missing error check at mixer resolution test
> >     ff24b83d0f73 dpaa2-eth: free already allocated channels on probe defer
> >     21790068a579 tcp: remove redundant new line from tcp_event_sk_skb
> >     364436976763 slip: Fix memory leak in slip_open error path
> >     b75c75d36816 net: usb: qmi_wwan: add support for Foxconn T77W968 LTE
> > modules
> >     c8a648ae5f96 net/smc: fix fastopen for non-blocking connect()
> >     b392b2d28e58 net: gemini: add missed free_netdev
> >     612aeedfe77d ipmr: Fix skb headroom in ipmr_get_route().
> >     5fa89b3526c5 ax88172a: fix information leak on short answers
> >     609d02229b16 scsi: core: Handle drivers which set sg_tablesize to zero
> >     efa2c8c477dd x86/entry/32: Fix FIXUP_ESPFIX_STACK with user CR3
> >     a0f6ee27e686 x86/pti/32: Calculate the various PTI cpu_entry_area sizes correctly,
> > make the CPU_ENTRY_AREA_PAGES assert precise
> >     60418beeefd7 selftests/x86/sigreturn/32: Invalidate DS and ES when abusing the
> > kernel
> >     777b0ee4fd79 selftests/x86/mov_ss_trap: Fix the SYSENTER test
> >     07b7c6191853 x86/entry/32: Fix NMI vs ESPFIX
> >     62433c16a282 x86/entry/32: Unwind the ESPFIX stack earlier on exception entry
> >     4a2364594599 x86/entry/32: Move FIXUP_FRAME after pushing %fs in
> > SAVE_ALL
> >     0593a806b430 x86/entry/32: Use %ss segment where required
> >     26ce03ac3327 x86/entry/32: Fix IRET exception
> >     f74d7e9547de x86/cpu_entry_area: Add guard page for entry stack on 32bit
> >     41cb303e1436 x86/pti/32: Size initial_page_table correctly
> >     2d2e7fe408eb x86/doublefault/32: Fix stack canaries in the double fault handler
> >     1fd0ff871abe x86/xen/32: Simplify ring check in xen_iret_crit_fixup()
> >     68ef02e30623 x86/xen/32: Make xen_iret_crit_fixup() independent of frame
> > layout
> >     ef15170227e2 x86/stackframe/32: Repair 32-bit Xen PV
> >     37880a369c68 x86/speculation: Fix redundant MDS mitigation message
> >     459c71f82b48 x86/speculation: Fix incorrect MDS/TAA mitigation status
> >     c77d64c158c6 x86/insn: Fix awk regexp warnings
> >     41bbdde13b43 x86: Use CONFIG_PREEMPTION
> >     217d051d8efd x86/entry/32: Pass cr2 to do_async_page_fault()
> >     1ecceee4c859 x86/entry/64: Prevent clobbering of saved CR2 value
> >     8ccce28352fe x86/mm, tracing: Fix CR2 corruption
> >     8873fea5f2d4 x86/entry/64: Update comments and sanity tests for create_gap
> >     7801660649a0 x86/entry/64: Simplify idtentry a little
> >     5d305a697f40 x86/entry/32: Simplify common_exception
> >     216401f82bef x86/paravirt: Make read_cr2() CALLEE_SAVE
> >     bf8b9dd0d0bf x86/asm: Move native_write_cr0/4() out of line
> >     222093f0acfd x86/pgtable/32: Fix LOWMEM_PAGES constant
> >     7998b2c4801a x86/alternatives: Fix int3_emulate_call() selftest stack corruption
> >     e4a8155be9bd x86/ldt: Initialize the context lock for init_mm
> >     f07a9a3a9ad4 x86/alternatives: Add int3_emulate_call() selftest
> >     29b042bbfab8 x86/stackframe/32: Allow int3_emulate_push()
> >     22334402db00 x86/stackframe/32: Provide consistent pt_regs
> >     ed6c118e4451 x86/stackframe, x86/ftrace: Add pt_regs frame annotations
> >     7159ebba55a4 x86/stackframe, x86/kprobes: Fix frame pointer annotations
> >     ba09efb8b35b x86/stackframe: Move ENCODE_FRAME_POINTER to
> > asm/frame.h
> >     c2f632a32c05 x86/entry/32: Clean up return from interrupt preemption path
> >     ce394d5e28c6 x86/asm: Pin sensitive CR0 bits
> >     b3327106585c x86/asm: Pin sensitive CR4 bits
> >     e3534ce1de0c Documentation/x86: Fix path to entry_32.S
> >     487a6cb63d71 x86/asm: Remove unused TASK_TI_flags from asm-offsets.c
> >     2bd8a406516b x86/entry/64: Don't compile ignore_sysret if 32-bit emulation is
> > enabled
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
> >  .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
> >  meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
> >  3 files changed, 18 insertions(+), 18 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-
> > kernel/linux/linux-yocto-rt_5.2.bb
> > index 5391e052c5..79da8c14b3 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
> > @@ -11,13 +11,13 @@ python () {
> >          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to
> > linux-yocto-rt to enable it")  }
> >
> > -SRCREV_machine ?= "e2d396270864afd14f5882ce8921d8fb562f5665"
> > -SRCREV_meta ?= "dd6019025cbb701b9818102f267c26e87031a59b"
> > +SRCREV_machine ?= "e1abc7e80e4df82d180aecd09e0d80b579d79c34"
> > +SRCREV_meta ?= "9a13706c994275b544f78dbfc9ed8ff98cd94aef"
> >
> >  SRC_URI = "git://git.yoctoproject.org/linux-
> > yocto.git;branch=${KBRANCH};name=machine \
> >             git://git.yoctoproject.org/yocto-kernel-
> > cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
> >
> > -LINUX_VERSION ?= "5.2.28"
> > +LINUX_VERSION ?= "5.2.29"
> >
> >  LIC_FILES_CHKSUM =
> > "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-
> > kernel/linux/linux-yocto-tiny_5.2.bb
> > index 986dd6e351..d88cb5d742 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
> > @@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
> >
> >  require recipes-kernel/linux/linux-yocto.inc
> >
> > -LINUX_VERSION ?= "5.2.28"
> > +LINUX_VERSION ?= "5.2.29"
> >  LIC_FILES_CHKSUM =
> > "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> >
> >  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> > @@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
> >  KMETA = "kernel-meta"
> >  KCONF_BSP_AUDIT_LEVEL = "2"
> >
> > -SRCREV_machine_qemuarm ?= "d79fa780eef7c3b08fcff8a44070c211afa91214"
> > -SRCREV_machine ?= "992280855e88289b7e7019ee2cf9dff867c58b94"
> > -SRCREV_meta ?= "dd6019025cbb701b9818102f267c26e87031a59b"
> > +SRCREV_machine_qemuarm ?= "f5a3e7e2c94b9d35d1b1933c503ffdaf1e9abec8"
> > +SRCREV_machine ?= "6f93a47515b2008468437f2f655404906337c574"
> > +SRCREV_meta ?= "9a13706c994275b544f78dbfc9ed8ff98cd94aef"
> >
> >  PV = "${LINUX_VERSION}+git${SRCPV}"
> >
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-
> > kernel/linux/linux-yocto_5.2.bb
> > index 358c0ad80a..59cc08e9a3 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
> > @@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
> >  KBRANCH_qemux86-64 ?= "v5.2/standard/base"
> >  KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
> >
> > -SRCREV_machine_qemuarm ?= "ed43b791f2cca6e87928fa47556e540333385187"
> > -SRCREV_machine_qemuarm64 ?=
> > "992280855e88289b7e7019ee2cf9dff867c58b94"
> > -SRCREV_machine_qemumips ?= "5d47f37ab0b7bcd5c0aaf0ecbd6d00bb8a22ddf4"
> > -SRCREV_machine_qemuppc ?= "992280855e88289b7e7019ee2cf9dff867c58b94"
> > -SRCREV_machine_qemuriscv64 ?=
> > "992280855e88289b7e7019ee2cf9dff867c58b94"
> > -SRCREV_machine_qemux86 ?= "992280855e88289b7e7019ee2cf9dff867c58b94"
> > -SRCREV_machine_qemux86-64 ?=
> > "992280855e88289b7e7019ee2cf9dff867c58b94"
> > -SRCREV_machine_qemumips64 ?=
> > "894ee953d9c4036003f41e0800315efe3bab8492"
> > -SRCREV_machine ?= "992280855e88289b7e7019ee2cf9dff867c58b94"
> > -SRCREV_meta ?= "dd6019025cbb701b9818102f267c26e87031a59b"
> > +SRCREV_machine_qemuarm ?= "6080c11f80fbba3ae018518af53564a226e7efcf"
> > +SRCREV_machine_qemuarm64 ?=
> > "6f93a47515b2008468437f2f655404906337c574"
> > +SRCREV_machine_qemumips ?=
> > "078d960b86b2b6539e6823f1da884e85b07e50f3"
> > +SRCREV_machine_qemuppc ?= "6f93a47515b2008468437f2f655404906337c574"
> > +SRCREV_machine_qemuriscv64 ?=
> > "6f93a47515b2008468437f2f655404906337c574"
> > +SRCREV_machine_qemux86 ?= "6f93a47515b2008468437f2f655404906337c574"
> > +SRCREV_machine_qemux86-64 ?=
> > "6f93a47515b2008468437f2f655404906337c574"
> > +SRCREV_machine_qemumips64 ?=
> > "ad3efcb4a297394ceb0ab2357737bd8be9846fec"
> > +SRCREV_machine ?= "6f93a47515b2008468437f2f655404906337c574"
> > +SRCREV_meta ?= "9a13706c994275b544f78dbfc9ed8ff98cd94aef"
> >
> >  # remap qemuarm to qemuarma15 for the 5.2 kernel  # KMACHINE_qemuarm ?=
> > "qemuarma15"
> > @@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-
> > yocto.git;name=machine;branch=${KBRA
> >             git://git.yoctoproject.org/yocto-kernel-
> > cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
> >
> >  LIC_FILES_CHKSUM =
> > "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
> > -LINUX_VERSION ?= "5.2.28"
> > +LINUX_VERSION ?= "5.2.29"
> >
> >  DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
> >  DEPENDS += "openssl-native util-linux-native"
> > --
> > 2.19.1
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

