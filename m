Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C58C1610D0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2020 23:30:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2020 15:30:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,477,1574150400"; d="scan'208";a="255410057"
Received: from pgsmsx113.gar.corp.intel.com ([10.108.55.202])
	by orsmga002.jf.intel.com with ESMTP; 23 Feb 2020 15:30:14 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.77]) by
	pgsmsx113.gar.corp.intel.com ([169.254.6.177]) with mapi id
	14.03.0439.000; Mon, 24 Feb 2020 07:30:07 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: "bruce.ashfield@gmail.com" <bruce.ashfield@gmail.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 03/10] linux-yocto/5.2: update to v5.2.29
Thread-Index: AQHV6N74OeMFncdyr0Wm1nDNyDW756gpb+Ug
Date: Sun, 23 Feb 2020 23:30:06 +0000
Message-ID: <C0207330DF60C5409302EC78C3FE68F30344C367@PGSMSX101.gar.corp.intel.com>
References: <cover.1582306887.git.bruce.ashfield@gmail.com>
	<d8759e58c654453056e27a6cca60face1ff97e2b.1582306887.git.bruce.ashfield@gmail.com>
In-Reply-To: <d8759e58c654453056e27a6cca60face1ff97e2b.1582306887.git.bruce.ashfield@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMzdhNjJkOGYtMDUxOC00YmNhLTkwYmItYmM1ZTY3ODM3ZWQ2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZ3Rqb3RzZlQyMXdWSEFScDlPcGprcGJTWnNWVzdvVzV5azhlblV0b29ld3YxalAzSCtrSDZiY1ByK3dsRHArbSJ9
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
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
X-List-Received-Date: Sun, 23 Feb 2020 23:30:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This is causing error when building linux-yocto-rt 5.2:

| In file included from <builddir>/build/tmp/work-shared/intel-core2-32/ker=
nel-source/include/linux/spinlock.h:51,
|                  from <builddir>/build/tmp/work-shared/intel-core2-32/ker=
nel-source/include/linux/mmzone.h:8,
|                  from <builddir>/build/tmp/work-shared/intel-core2-32/ker=
nel-source/include/linux/gfp.h:6,
|                  from <builddir>/build/tmp/work-shared/intel-core2-32/ker=
nel-source/include/linux/slab.h:15,
|                  from <builddir>/build/tmp/work-shared/intel-core2-32/ker=
nel-source/include/linux/crypto.h:19,
|                  from <builddir>/build/tmp/work-shared/intel-core2-32/ker=
nel-source/arch/x86/kernel/asm-offsets.c:9:
| <builddir>/build/tmp/work-shared/intel-core2-32/kernel-source/include/lin=
ux/spinlock_api_smp.h: In function '__raw_spin_trylock':
| <builddir>/build/tmp/work-shared/intel-core2-32/kernel-source/include/lin=
ux/preempt.h:190:3: error: implicit declaration of function '__preempt_sche=
dule' [-Werror=3Dimplicit-function-declaration]
|   190 |   __preempt_schedule(); \
|       |   ^~~~~~~~~~~~~~~~~~
| <builddir>/build/tmp/work-shared/intel-core2-32/kernel-source/include/lin=
ux/spinlock_api_smp.h:93:2: note: in expansion of macro 'preempt_enable'
|    93 |  preempt_enable();
|       |  ^~~~~~~~~~~~~~
| <builddir>/build/tmp/work-shared/intel-core2-32/kernel-source/include/lin=
ux/rcupdate.h: In function 'rcu_read_unlock_sched_notrace':
| <builddir>/build/tmp/work-shared/intel-core2-32/kernel-source/include/lin=
ux/preempt.h:197:3: error: implicit declaration of function '__preempt_sche=
dule_notrace'; did you mean 'preempt_enable_notrace'? [-Werror=3Dimplicit-f=
unction-declaration]
|   197 |   __preempt_schedule_notrace(); \
|       |   ^~~~~~~~~~~~~~~~~~~~~~~~~~
| <builddir>/build/tmp/work-shared/intel-core2-32/kernel-source/include/lin=
ux/rcupdate.h:731:2: note: in expansion of macro 'preempt_enable_notrace'
|   731 |  preempt_enable_notrace();
|       |  ^~~~~~~~~~~~~~~~~~~~~~

Thanks,

Anuj

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of bruce.ashfield@gmail.com
> Sent: Saturday, February 22, 2020 01:46 AM
> To: richard.purdie@linuxfoundation.org
> Cc: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 03/10] linux-yocto/5.2: update to v5.2.29
>=20
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> Updating linux-yocto/5.2 to the latest korg -stable release that comprise=
s the following
> commits:
>=20
>     928ea9c56927 Linux 5.2.29
>     4e41907620bc slip: Fix use-after-free Read in slip_open
>     d11814f97a05 can: slcan: Fix use-after-free Read in slcan_open
>     01313dcf66e7 can: kvaser_usb: kvaser_usb_leaf: Fix some info-leaks to=
 USB
> devices
>     7f006e58efc2 scsi: libsas: stop discovering if oob mode is disconnect=
ed
>     0e5c48d6b011 staging: comedi: usbduxfast: usbduxfast_ai_cmdtest round=
ing error
>     d8b3d5fb8765 USB: serial: option: add support for Foxconn T77W968 LTE
> modules
>     c4fe1d495f9c USB: serial: option: add support for DW5821e with eSIM s=
upport
>     4ac031b15d86 USB: serial: mos7840: fix remote wakeup
>     4d44a218aea6 USB: serial: mos7720: fix remote wakeup
>     3561f4d3242f USB: serial: mos7840: add USB ID to support Moxa UPort 2=
210
>     13a33fb9debe appledisplay: fix error handling in the scheduled work
>     0cd437d7c16b USB: chaoskey: fix error case of a timeout
>     2136119fde46 usb-serial: cp201x: support Mark-10 digital force gauge
>     3a71173a4a45 usbip: tools: fix fd leakage in the function of read_att=
r_usbip_status
>     726510907c68 USBIP: add config dependency for SGL_ALLOC
>     7dd553573bc5 media: mceusb: fix out of bounds read in MCE receiver bu=
ffer
>     1e4921f684ca media: imon: invalid dereference in imon_touch_event
>     d482dfe2776a media: cxusb: detect cxusb_ctrl_msg error in query
>     ab4952849dd8 media: b2c2-flexcop-usb: add sanity checking
>     e2aa61cda115 media: uvcvideo: Fix error path in control parsing failu=
re
>     115fa3afd4d1 cpufreq: Add NULL checks to show() and store() methods o=
f
> cpufreq
>     767facdefa23 media: usbvision: Fix races among open, close, and disco=
nnect
>     ba90b62cb0bd media: usbvision: Fix invalid accesses after device disc=
onnect
>     829b703e9706 media: vivid: Set vid_cap_streaming and vid_out_streamin=
g to true
>     57f2b5c44f02 nfc: port100: handle command failure cleanly
>     5fc4dc967e06 ALSA: usb-audio: Fix NULL dereference at parsing BADD
>     c938307a439a futex: Prevent robust futex exit race
>     8b0f13ee2b7b nbd: prevent memory leak
>     1bfd67a1c47b ARM: 8904/1: skip nomap memblocks while finding the
> lowmem/highmem boundary
>     a634776bcd5e md/raid10: prevent access of uninitialized resync_pages =
offset
>     40c0b4538c8b Revert "dm crypt: use WQ_HIGHPRI for the IO and crypt
> workqueues"
>     53eaf5993eea ath9k_hw: fix uninitialized variable data
>     5a1b959a78ea ath10k: Fix a NULL-ptr-deref bug in
> ath10k_usb_alloc_urb_from_pipe
>     8b16c7096bc9 ath10k: Fix HOST capability QMI incompatibility
>     ceee3b64b0b5 ath10k: restore QCA9880-AR1A (v1) detection
>     08c0402ed497 Bluetooth: Fix invalid-free in bcsp_close()
>     c1ed057fbe33 drm/i915/userptr: Try to acquire the page lock around
> set_page_dirty()
>     5ec5ba44bd85 drm/i915/pmu: "Frequency" is reported as accumulated cyc=
les
>     c7ceeaf80706 drm/amd/powerplay: issue no PPSMC_MSG_GetCurrPkgPwr on
> unsupported ASICs
>     1c3fb0c8357e drm/amdgpu: disable gfxoff on original raven
>     ccd9d21f783e drm/amdgpu: disable gfxoff when using register read inte=
rface
>     6e745cbc5051 mm/ksm.c: don't WARN if page is still mapped in
> remove_stable_node()
>     79194b4a342c mm/memory_hotplug: don't access uninitialized memmaps in
> shrink_zone_span()
>     01d151b7e74e virtio_balloon: fix shrinker count
>     caae62219805 virtio_ring: fix return code on DMA mapping fails
>     272ed6b7ca4a virtio_console: allocate inbufs in add_port() only if it=
 is needed
>     abce58c3af15 nbd:fix memory leak in nbd_get_socket()
>     2601193dc253 tools: gpio: Correctly add make dependencies for gpio_ut=
ils
>     3608aa07bac2 gpio: max77620: Fixup debounce delays
>     c6bf6af12a68 vhost/vsock: split packets to send using multiple buffer=
s
>     95a617d1f70c net/mlx5: Update the list of the PCI supported devices
>     febceda6db3f net/mlx5e: Do not use non-EXT link modes in EXT mode
>     f8bddf0e192a net/mlx5e: Fix error flow cleanup in
> mlx5e_tc_tun_create_header_ipv4/6
>     e049e3c43308 taprio: don't reject same mqprio settings
>     8345d40b83bf ipv6/route: return if there is no fib_nh_gw_family
>     1edfc6649c92 net/tls: enable sk_msg redirect to tls socket egress
>     27845a1dd06b net/mlx5: Fix auto group size calculation
>     ec6d299939c3 net/mlx5e: Fix set vf link state error flow
>     bab144f2a957 net/mlxfw: Verify FSM error code translation doesn't exc=
eed array
> size
>     3eb4c2e70dce sfc: Only cancel the PPS workqueue if it exists
>     a03585b724bc net: sched: ensure opts_len <=3D IP_TUNNEL_OPTS_MAX in
> act_tunnel_key
>     285a19d8dde0 net/sched: act_pedit: fix WARN() in the traffic path
>     8e40158af458 net: rtnetlink: prevent underflows in do_setvfinfo()
>     1afad75b2dba net/mlx4_en: Fix wrong limitation for number of TX rings
>     ce1291041c39 net/mlx4_en: fix mlx4 ethtool -N insertion
>     2a7ad86813a4 mlxsw: spectrum_router: Fix determining underlay for a G=
RE tunnel
>     da957117e731 fbdev: Ditch fb_edid_add_monspecs
>     1f043415c4f5 arm64: uaccess: Ensure PAN is re-enabled after unhandled=
 uaccess
> fault
>     0063e9b69796 mm/memory_hotplug: fix updating the node span
>     d27074543286 mm/memory_hotplug: don't access uninitialized memmaps in
> shrink_pgdat_span()
>     62ca688436d3 block, bfq: deschedule empty bfq_queues not referred by =
any
> process
>     045a481acd16 slcan: Fix memory leak in error path
>     22bc38eae704 mmc: sdhci-of-at91: fix quirk2 overwrite
>     8505966cdc7e mm/page_io.c: do not free shared swap slots
>     349d5ccf8971 mm: hugetlb: switch to css_tryget() in
> hugetlb_cgroup_charge_cgroup()
>     cb4df7d810ac mm: memcg: switch to css_tryget() in get_mem_cgroup_from=
_mm()
>     eec30082ea78 mm: mempolicy: fix the wrong return value and potential =
pages leak
> of mbind
>     c4b3eaf0585b iommu/vt-d: Fix QI_DEV_IOTLB_PFSID and
> QI_DEV_EIOTLB_PFSID macros
>     5a705e36d350 net: ethernet: dwmac-sun8i: Use the correct function in =
exit path
>     50d4170ffddd ntp/y2038: Remove incorrect time_t truncation
>     f701a893aba0 ecryptfs_lookup_interpose(): lower_dentry->d_parent is n=
ot stable
> either
>     97dd5923ba23 ecryptfs_lookup_interpose(): lower_dentry->d_inode is no=
t stable
>     3c130e6cddae x86/quirks: Disable HPET on Intel Coffe Lake platforms
>     a0f63a47ab13 i2c: acpi: Force bus speed to 400KHz if a Silead touchsc=
reen is
> present
>     ca7d1676d537 IB/hfi1: Use a common pad buffer for 9B and 16B packets
>     b8b6479e3cc9 IB/hfi1: Ensure full Gen3 speed in a Gen4 system
>     72ff837e69c5 IB/hfi1: TID RDMA WRITE should not return
> IB_WC_RNR_RETRY_EXC_ERR
>     3c1db8a639ac IB/hfi1: Calculate flow weight based on QP MTU for TID R=
DMA
>     d2f5dd2fd992 IB/hfi1: Ensure r_tid_ack is valid before building TID R=
DMA ACK
> packet
>     e88f0707f216 KVM: MMU: Do not treat ZONE_DEVICE pages as being reserv=
ed
>     9e35e5bc4a04 Input: synaptics-rmi4 - destroy F54 poller workqueue whe=
n
> removing
>     2eaf311ccd38 Input: synaptics-rmi4 - clear IRQ enables for F54
>     f05aacf5a7b9 Input: synaptics-rmi4 - do not consume more data than we=
 have
> (F11, F12)
>     7e649c757a1a Input: synaptics-rmi4 - disable the relative position IR=
Q in the F12
> driver
>     4b482d7281a6 Input: synaptics-rmi4 - fix video buffer size
>     74e0752ee79e cgroup: freezer: call cgroup_enter_frozen() with preempt=
ion
> disabled in ptrace_stop()
>     a9cae67b7a20 Btrfs: fix log context list corruption after rename exch=
ange operation
>     011e452b4d84 ALSA: usb-audio: not submit urb for stopped endpoint
>     c7801593d92a ALSA: usb-audio: Fix missing error check at mixer resolu=
tion test
>     ff24b83d0f73 dpaa2-eth: free already allocated channels on probe defe=
r
>     21790068a579 tcp: remove redundant new line from tcp_event_sk_skb
>     364436976763 slip: Fix memory leak in slip_open error path
>     b75c75d36816 net: usb: qmi_wwan: add support for Foxconn T77W968 LTE
> modules
>     c8a648ae5f96 net/smc: fix fastopen for non-blocking connect()
>     b392b2d28e58 net: gemini: add missed free_netdev
>     612aeedfe77d ipmr: Fix skb headroom in ipmr_get_route().
>     5fa89b3526c5 ax88172a: fix information leak on short answers
>     609d02229b16 scsi: core: Handle drivers which set sg_tablesize to zer=
o
>     efa2c8c477dd x86/entry/32: Fix FIXUP_ESPFIX_STACK with user CR3
>     a0f6ee27e686 x86/pti/32: Calculate the various PTI cpu_entry_area siz=
es correctly,
> make the CPU_ENTRY_AREA_PAGES assert precise
>     60418beeefd7 selftests/x86/sigreturn/32: Invalidate DS and ES when ab=
using the
> kernel
>     777b0ee4fd79 selftests/x86/mov_ss_trap: Fix the SYSENTER test
>     07b7c6191853 x86/entry/32: Fix NMI vs ESPFIX
>     62433c16a282 x86/entry/32: Unwind the ESPFIX stack earlier on excepti=
on entry
>     4a2364594599 x86/entry/32: Move FIXUP_FRAME after pushing %fs in
> SAVE_ALL
>     0593a806b430 x86/entry/32: Use %ss segment where required
>     26ce03ac3327 x86/entry/32: Fix IRET exception
>     f74d7e9547de x86/cpu_entry_area: Add guard page for entry stack on 32=
bit
>     41cb303e1436 x86/pti/32: Size initial_page_table correctly
>     2d2e7fe408eb x86/doublefault/32: Fix stack canaries in the double fau=
lt handler
>     1fd0ff871abe x86/xen/32: Simplify ring check in xen_iret_crit_fixup()
>     68ef02e30623 x86/xen/32: Make xen_iret_crit_fixup() independent of fr=
ame
> layout
>     ef15170227e2 x86/stackframe/32: Repair 32-bit Xen PV
>     37880a369c68 x86/speculation: Fix redundant MDS mitigation message
>     459c71f82b48 x86/speculation: Fix incorrect MDS/TAA mitigation status
>     c77d64c158c6 x86/insn: Fix awk regexp warnings
>     41bbdde13b43 x86: Use CONFIG_PREEMPTION
>     217d051d8efd x86/entry/32: Pass cr2 to do_async_page_fault()
>     1ecceee4c859 x86/entry/64: Prevent clobbering of saved CR2 value
>     8ccce28352fe x86/mm, tracing: Fix CR2 corruption
>     8873fea5f2d4 x86/entry/64: Update comments and sanity tests for creat=
e_gap
>     7801660649a0 x86/entry/64: Simplify idtentry a little
>     5d305a697f40 x86/entry/32: Simplify common_exception
>     216401f82bef x86/paravirt: Make read_cr2() CALLEE_SAVE
>     bf8b9dd0d0bf x86/asm: Move native_write_cr0/4() out of line
>     222093f0acfd x86/pgtable/32: Fix LOWMEM_PAGES constant
>     7998b2c4801a x86/alternatives: Fix int3_emulate_call() selftest stack=
 corruption
>     e4a8155be9bd x86/ldt: Initialize the context lock for init_mm
>     f07a9a3a9ad4 x86/alternatives: Add int3_emulate_call() selftest
>     29b042bbfab8 x86/stackframe/32: Allow int3_emulate_push()
>     22334402db00 x86/stackframe/32: Provide consistent pt_regs
>     ed6c118e4451 x86/stackframe, x86/ftrace: Add pt_regs frame annotation=
s
>     7159ebba55a4 x86/stackframe, x86/kprobes: Fix frame pointer annotatio=
ns
>     ba09efb8b35b x86/stackframe: Move ENCODE_FRAME_POINTER to
> asm/frame.h
>     c2f632a32c05 x86/entry/32: Clean up return from interrupt preemption =
path
>     ce394d5e28c6 x86/asm: Pin sensitive CR0 bits
>     b3327106585c x86/asm: Pin sensitive CR4 bits
>     e3534ce1de0c Documentation/x86: Fix path to entry_32.S
>     487a6cb63d71 x86/asm: Remove unused TASK_TI_flags from asm-offsets.c
>     2bd8a406516b x86/entry/64: Don't compile ignore_sysret if 32-bit emul=
ation is
> enabled
>=20
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
>  .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
>  meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
>  3 files changed, 18 insertions(+), 18 deletions(-)
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recip=
es-
> kernel/linux/linux-yocto-rt_5.2.bb
> index 5391e052c5..79da8c14b3 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
> @@ -11,13 +11,13 @@ python () {
>          raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel=
 to
> linux-yocto-rt to enable it")  }
>=20
> -SRCREV_machine ?=3D "e2d396270864afd14f5882ce8921d8fb562f5665"
> -SRCREV_meta ?=3D "dd6019025cbb701b9818102f267c26e87031a59b"
> +SRCREV_machine ?=3D "e1abc7e80e4df82d180aecd09e0d80b579d79c34"
> +SRCREV_meta ?=3D "9a13706c994275b544f78dbfc9ed8ff98cd94aef"
>=20
>  SRC_URI =3D "git://git.yoctoproject.org/linux-
> yocto.git;branch=3D${KBRANCH};name=3Dmachine \
>             git://git.yoctoproject.org/yocto-kernel-
> cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.2;destsuffix=3D${KMETA}"
>=20
> -LINUX_VERSION ?=3D "5.2.28"
> +LINUX_VERSION ?=3D "5.2.29"
>=20
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8814"
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/rec=
ipes-
> kernel/linux/linux-yocto-tiny_5.2.bb
> index 986dd6e351..d88cb5d742 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
> @@ -6,7 +6,7 @@ KCONFIG_MODE =3D "--allnoconfig"
>=20
>  require recipes-kernel/linux/linux-yocto.inc
>=20
> -LINUX_VERSION ?=3D "5.2.28"
> +LINUX_VERSION ?=3D "5.2.29"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8814"
>=20
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
> @@ -15,9 +15,9 @@ DEPENDS +=3D "openssl-native util-linux-native"
>  KMETA =3D "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL =3D "2"
>=20
> -SRCREV_machine_qemuarm ?=3D "d79fa780eef7c3b08fcff8a44070c211afa91214"
> -SRCREV_machine ?=3D "992280855e88289b7e7019ee2cf9dff867c58b94"
> -SRCREV_meta ?=3D "dd6019025cbb701b9818102f267c26e87031a59b"
> +SRCREV_machine_qemuarm ?=3D "f5a3e7e2c94b9d35d1b1933c503ffdaf1e9abec8"
> +SRCREV_machine ?=3D "6f93a47515b2008468437f2f655404906337c574"
> +SRCREV_meta ?=3D "9a13706c994275b544f78dbfc9ed8ff98cd94aef"
>=20
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-
> kernel/linux/linux-yocto_5.2.bb
> index 358c0ad80a..59cc08e9a3 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
> @@ -12,16 +12,16 @@ KBRANCH_qemux86  ?=3D "v5.2/standard/base"
>  KBRANCH_qemux86-64 ?=3D "v5.2/standard/base"
>  KBRANCH_qemumips64 ?=3D "v5.2/standard/mti-malta64"
>=20
> -SRCREV_machine_qemuarm ?=3D "ed43b791f2cca6e87928fa47556e540333385187"
> -SRCREV_machine_qemuarm64 ?=3D
> "992280855e88289b7e7019ee2cf9dff867c58b94"
> -SRCREV_machine_qemumips ?=3D "5d47f37ab0b7bcd5c0aaf0ecbd6d00bb8a22ddf4"
> -SRCREV_machine_qemuppc ?=3D "992280855e88289b7e7019ee2cf9dff867c58b94"
> -SRCREV_machine_qemuriscv64 ?=3D
> "992280855e88289b7e7019ee2cf9dff867c58b94"
> -SRCREV_machine_qemux86 ?=3D "992280855e88289b7e7019ee2cf9dff867c58b94"
> -SRCREV_machine_qemux86-64 ?=3D
> "992280855e88289b7e7019ee2cf9dff867c58b94"
> -SRCREV_machine_qemumips64 ?=3D
> "894ee953d9c4036003f41e0800315efe3bab8492"
> -SRCREV_machine ?=3D "992280855e88289b7e7019ee2cf9dff867c58b94"
> -SRCREV_meta ?=3D "dd6019025cbb701b9818102f267c26e87031a59b"
> +SRCREV_machine_qemuarm ?=3D "6080c11f80fbba3ae018518af53564a226e7efcf"
> +SRCREV_machine_qemuarm64 ?=3D
> "6f93a47515b2008468437f2f655404906337c574"
> +SRCREV_machine_qemumips ?=3D
> "078d960b86b2b6539e6823f1da884e85b07e50f3"
> +SRCREV_machine_qemuppc ?=3D "6f93a47515b2008468437f2f655404906337c574"
> +SRCREV_machine_qemuriscv64 ?=3D
> "6f93a47515b2008468437f2f655404906337c574"
> +SRCREV_machine_qemux86 ?=3D "6f93a47515b2008468437f2f655404906337c574"
> +SRCREV_machine_qemux86-64 ?=3D
> "6f93a47515b2008468437f2f655404906337c574"
> +SRCREV_machine_qemumips64 ?=3D
> "ad3efcb4a297394ceb0ab2357737bd8be9846fec"
> +SRCREV_machine ?=3D "6f93a47515b2008468437f2f655404906337c574"
> +SRCREV_meta ?=3D "9a13706c994275b544f78dbfc9ed8ff98cd94aef"
>=20
>  # remap qemuarm to qemuarma15 for the 5.2 kernel  # KMACHINE_qemuarm ?=
=3D
> "qemuarma15"
> @@ -30,7 +30,7 @@ SRC_URI =3D "git://git.yoctoproject.org/linux-
> yocto.git;name=3Dmachine;branch=3D${KBRA
>             git://git.yoctoproject.org/yocto-kernel-
> cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-5.2;destsuffix=3D${KMETA}"
>=20
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dbbea815ee2795b2f4230826c0c6b8814"
> -LINUX_VERSION ?=3D "5.2.28"
> +LINUX_VERSION ?=3D "5.2.29"
>=20
>  DEPENDS +=3D "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '',=
 d)}"
>  DEPENDS +=3D "openssl-native util-linux-native"
> --
> 2.19.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

