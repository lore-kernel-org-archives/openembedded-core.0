Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1C06F78322
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 02:45:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA32jcRn024996
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 2 Nov 2017 19:45:38 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 2 Nov 2017 19:45:37 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 2 Nov 2017 22:45:28 -0400
Message-ID: <ee90b52b0025a428336a35089a75d7f072d6cfb7.1509676901.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1509676901.git.bruce.ashfield@windriver.com>
References: <cover.1509676901.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] linux-yocto/4.9: update to v4.9.57
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
X-List-Received-Date: Fri, 03 Nov 2017 02:45:38 -0000
Content-Type: text/plain

Integrating the korg -stable release that comprises the following changes:

   5d7a76acad40 Linux 4.9.57
   28955b03fac3 KVM: nVMX: update last_nonleaf_level when initializing nested EPT
   fb6da44f965e x86/alternatives: Fix alt_max_short macro to really be a max()
   063b57d55618 USB: serial: console: fix use-after-free after failed setup
   638f7fbfd67d USB: serial: qcserial: add Dell DW5818, DW5819
   c98f2ff0013e USB: serial: option: add support for TP-Link LTE module
   dcb2be936c3f USB: serial: cp210x: add support for ELV TFD500
   0c80bbb76814 USB: serial: ftdi_sio: add id for Cypress WICED dev board
   ed35ded9c781 bio_copy_user_iov(): don't ignore ->iov_offset
   e67dfe75b683 more bio_map_user_iov() leak fixes
   5444d8ab9a14 fix unbalanced page refcounting in bio_map_user_iov
   f9139a1a2457 direct-io: Prevent NULL pointer access in submit_page_section
   3941ee20839f usb: gadget: composite: Fix use-after-free in usb_composite_overwrite_options
   3c57f9d8c194 usb: gadget: configfs: Fix memory leak of interface directory data
   80689fdf37a8 drm/i915/bios: parse DDI ports also for CHV for HDMI DDC pin and DP AUX channel
   fd96a9b0150a drm/i915: Read timings from the correct transcoder in intel_crtc_mode_get()
   7c82795f9612 drm/i915/edp: Get the Panel Power Off timestamp after panel is off
   4dbe48b8e1a9 ALSA: line6: Fix leftover URB at error-path during probe
   b65f99b8b1ab ALSA: line6: Fix missing initialization before error path
   bbab59d6c4b2 ALSA: caiaq: Fix stray URB at probe error path
   6571ce840881 ALSA: seq: Fix copy_from_user() call inside lock
   35b84860667f ALSA: seq: Fix use-after-free at creating a port
   e0c70289a1e3 ALSA: usb-audio: Kill stray URB at exiting
   133ca5c71299 fs/mpage.c: fix mpage_writepage() for pages with buffers
   2a077f725847 device property: Track owner device of device property
   3abebf0b8c5f iommu/amd: Finish TLB flush in amd_iommu_unmap()
   4f28d1a742f9 pinctrl/amd: Fix build dependency on pinmux code
   f4753e0ae985 usb: renesas_usbhs: Fix DMAC sequence for receiving zero-length packet
   08e1674e82e5 KVM: nVMX: fix guest CR4 loading when emulating L2 to L1 exit
   3610c4a7838d KVM: MMU: always terminate page walks at level 1
   91daaefbe5df crypto: shash - Fix zero-length shash ahash digest crash
   57265cddde30 HID: usbhid: fix out-of-bounds bug
   9d9c2884da2c dmaengine: ti-dma-crossbar: Fix possible race condition with dma_inuse
   618c786d2bba dmaengine: edma: Align the memcpy acnt array size with the transfer
   b7309209b020 MIPS: math-emu: Remove pr_err() calls from fpu_emu()
   a844e288c811 USB: dummy-hcd: Fix deadlock caused by disconnect detection
   97535791d8f9 rcu: Allow for page faults in NMI handlers
   f012cb75946f nl80211: Define policy for packet pattern attributes
   92d7d3e86702 CIFS: Reconnect expired SMB sessions
   28cbf0693771 ext4: in ext4_seek_{hole,data}, return -ENXIO for negative offsets
   9d36d3eff2f8 Linux 4.9.56
   00449628f352 Revert "socket, bpf: fix possible use after free"
   f82786d7a94f Linux 4.9.55
   922e562b2613 KVM: x86: fix singlestepping over syscall
   ec86c1ca8fbb f2fs: don't allow encrypted operations without keys
   48d7b5a88790 ext4: don't allow encrypted operations without keys
   6007f0f7a47d ext4: Don't clear SGID when inheriting ACLs
   2d605d9188d6 ext4: fix data corruption for mmap writes
   27db1f020373 vfs: deny copy_file_range() for non regular files
   ba15518c2610 sched/cpuset/pm: Fix cpuset vs. suspend-resume bugs
   d9aaef32f32c mmc: core: add driver strength selection when selecting hs400es
   c83bbed23419 nvme-pci: Use PCI bus address for data/queues in CMB
   acf64334817c drm/i915/bios: ignore HDMI on port A
   54aa832c8744 brcmfmac: setup passive scan if requested by user-space
   4d3132d97aa7 brcmfmac: add length check in brcmf_cfg80211_escan_handler()
   12b182a35f45 scsi: sd: Do not override max_sectors_kb sysfs setting
   aee20f321daf iwlwifi: add workaround to disable wide channels in 5GHz
   f8895642cf8e iwlwifi: mvm: use IWL_HCMD_NOCOPY for MCAST_FILTER_CMD
   9a19bc44c636 netlink: fix nla_put_{u8,u16,u32} for KASAN
   57a77fffb0ff rocker: fix rocker_tlv_put_* functions for KASAN
   50b27486ae8a HID: wacom: bits shifted too much for 9th and 10th buttons
   953f5e7c6216 HID: wacom: Always increment hdev refcount within wacom_get_hdev_data
   04b54e8ff7d0 HID: wacom: leds: Don't try to control the EKR's read-only LEDs
   5abb9cd4ff92 HID: i2c-hid: allocate hid buffers for real worst case
   a3ec104976f7 ftrace: Fix kmemleak in unregister_ftrace_graph
   3ff8bc813b13 stm class: Fix a use-after-free
   c541aaad4ac7 Drivers: hv: fcopy: restore correct transfer length
   a97ca4f78018 driver core: platform: Don't read past the end of "driver_override" buffer
   fc3c67226acd percpu: make this_cpu_generic_read() atomic w.r.t. interrupts
   6a988259b1cb powerpc/tm: Fix illegal TM state in signal handler
   afebf5ef60da powerpc/64s: Use emergency stack for kernel TM Bad Thing program checks
   02f7e4101092 socket, bpf: fix possible use after free
   95206ea376b9 net: rtnetlink: fix info leak in RTM_GETSTATS call
   58b1b8407a31 tipc: use only positive error codes in messages
   09788d46b756 ip6_tunnel: update mtu properly for ARPHRD_ETHER tunnel device in tx path
   ab4da56f61be ip6_gre: ip6gre_tap device should keep dst
   b4a119251f6b netlink: do not proceed if dump's start() errs
   cf2eaf16ab28 net: Set sk_prot_creator when cloning sockets to the right proto
   24ee394a82d2 packet: only test po->has_vnet_hdr once in packet_snd
   0f22167d3321 packet: in packet_do_bind, test fanout with bind_lock held
   6eab1f829417 net: dsa: Fix network device registration order
   b8990d2e77c6 tun: bail out from tun_get_user() if the skb is empty
   b4a9b12d9a2c l2tp: fix race condition in l2tp_tunnel_delete
   e5941137f784 l2tp: Avoid schedule while atomic in exit_net
   6689f8358681 vti: fix use after free in vti_tunnel_xmit/vti6_tnl_xmit
   852bdea5e379 net: qcom/emac: specify the correct size when mapping a DMA buffer
   5600c7586ad9 net_sched: always reset qdisc backlog in qdisc_reset()
   93eef2172d23 isdn/i4l: fetch the ppp_write buffer in one shot
   0dee549f7912 bpf: one perf event close won't free bpf program attached by another perf event
   6f7cdd4aa0a4 packet: hold bind lock when rebinding to fanout hook
   6eac2cd24bd9 net: emac: Fix napi poll list corruption
   b463521db854 tcp: fastopen: fix on syn-data transmit failure
   b13bc543b1e6 net/sched: cls_matchall: fix crash when used with classful qdisc
   13c8bd7a21ed ip6_tunnel: do not allow loading ip6_tunnel if ipv6 is disabled in cmdline
   fc2fe7a06d6d net: phy: Fix mask value write on gmii2rgmii converter speed register
   e814bae39ad5 ip6_gre: skb_push ipv6hdr before packing the header in ip6gre_header
   f0a5af78b530 udpv6: Fix the checksum computation when HW checksum does not apply
   85908ccae5c2 tcp: fix data delivery rate
   e159492b3c3e bpf/verifier: reject BPF_ALU64|BPF_END
   186a9c5e7038 tcp: update skb->skb_mstamp more carefully
   b70bb9bb7277 sctp: potential read out of bounds in sctp_ulpevent_type_enabled()
   f86d3b1a28a7 net: sched: fix use-after-free in tcf_action_destroy and tcf_del_walker
   f860ca549de4 mlxsw: spectrum: Prevent mirred-related crash on removal
   065af12fd139 ALSA: usx2y: Suppress kernel warning at page allocation failures
   40e219327fd4 Revert "ALSA: echoaudio: purge contradictions between dimension matrix members and total number of members"
   984b6c96f1e2 ALSA: compress: Remove unused variable
   88c195d638d3 lsm: fix smack_inode_removexattr and xattr_getsecurity memleak
   1c0891295a5a lib/ratelimit.c: use deferred printk() version
   2b8197073a0f mm, oom_reaper: skip mm structs with mmu notifiers
   8a056a115270 staging: vchiq_2835_arm: Fix NULL ptr dereference in free_pagelist
   8928c5b2d318 uwb: ensure that endpoint is interrupt
   8ff7adb930d4 uwb: properly check kthread_run return value
   ec8a7153bbf3 iio: adc: mcp320x: Fix oops on module unload
   1daa7c5aba21 iio: adc: mcp320x: Fix readout of negative voltages
   8b97d5b67e9e iio: ad7793: Fix the serial interface reset
   f0865d60f3a5 IIO: BME280: Updates to Humidity readings need ctrl_reg write!
   9af1bd5e705a iio: core: Return error for failed read_reg
   8edd1ce3e56b staging: iio: ad7192: Fix - use the dedicated reset function avoiding dma from stack.
   1f266a130329 iio: ad_sigma_delta: Implement a dedicated reset function
   a2002c92ffb3 iio: adc: twl4030: Disable the vusb3v1 rugulator in the error handling path of 'twl4030_madc_probe()'
   ab6766146785 iio: adc: twl4030: Fix an error handling path in 'twl4030_madc_probe()'
   a13481f8cdca Revert "xhci: Limit USB2 port wake support for AMD Promontory hosts"
   f77615db8ae8 xhci: set missing SuperSpeedPlus Link Protocol bit in roothub descriptor
   f1a04773d773 xhci: Fix sleeping with spin_lock_irq() held in ASmedia 1042A workaround
   67e752e1d60f xhci: fix finding correct bus_state structure for USB 3.1 hosts
   a6d4ce2e8b65 USB: fix out-of-bounds in usb_set_configuration
   43feb29db4c5 usb: Increase quirk delay for USB devices
   767f7a2cf33a USB: core: harden cdc_parse_cdc_header
   d77606e93d81 USB: uas: fix bug in handling of alternate settings
   da785bb64fa6 USB: g_mass_storage: Fix deadlock when driver is unbound
   2b5c7b95ea36 usb: gadget: mass_storage: set msg_registered after msg registered
   77a4be89599c USB: devio: Don't corrupt user memory
   e39b17143a5b USB: dummy-hcd: Fix erroneous synchronization change
   795f5501b95c USB: dummy-hcd: fix infinite-loop resubmission bug
   5effe995310e USB: dummy-hcd: fix connection failures (wrong speed)
   12071de6c37d USB: cdc-wdm: ignore -EPIPE from GetEncapsulatedResponse
   0b104f92ed21 usb: pci-quirks.c: Corrected timeout values used in handshake
   37b6d898388e ALSA: usb-audio: Check out-of-bounds access by corrupted buffer descriptor
   eb5df140ca29 usb: renesas_usbhs: fix usbhsf_fifo_clear() for RX direction
   4661c9b526c3 usb: renesas_usbhs: fix the BCLR setting condition for non-DCP pipe
   760d0f10410a usb-storage: fix bogus hardware error messages for ATA pass-thru devices
   dd52953f6c48 usb-storage: unusual_devs entry to fix write-access regression for Seagate external drives
   d21653d09a0b usb: gadget: udc: renesas_usb3: Fix return value of usb3_write_pipe()
   db73b389775a usb: gadget: udc: renesas_usb3: fix Pn_RAMMAP.Pn_MPKT value
   25533678e580 usb: gadget: udc: renesas_usb3: fix for no-data control transfer
   744f9e1da2a5 usb: gadget: udc: atmel: set vbus irqflags explicitly
   7f850036134c USB: gadgetfs: fix copy_to_user while holding spinlock
   fd5336c0d1e3 USB: gadgetfs: Fix crash caused by inadequate synchronization
   f37eb7b586f1 Linux 4.9.54
   75903d40aaec s390/mm: make pmdp_invalidate() do invalidation only
   14b502e491a8 ttpci: address stringop overflow warning
   c637027054ae ALSA: au88x0: avoid theoretical uninitialized access
   cf2cd9feb8e6 ASoC: rt5660: remove double const
   617c7735db3d ASoC: rt5659: drop double const
   2f4835ee5505 ASoC: rt5514: fix gcc-7 warning
   d8ba70c09407 ARM: remove duplicate 'const' annotations'
   a4f11d61e305 IB/qib: fix false-postive maybe-uninitialized warning
   86c469bea4ae tools/power turbostat: bugfix: GFXMHz column not changing
   c126bc6b94dd ARM: dts: BCM5301X: Fix memory start address
   16db9205d3f8 libata: transport: Remove circular dependency at free time
   49c3226c0657 ASoC: wm_adsp: Return an error on write to a disabled volatile control
   d86f4ea83626 xfs: remove kmem_zalloc_greedy
   943411be40e0 i2c: meson: fix wrong variable usage in meson_i2c_put_data
   625cb13a8929 netfilter: nf_tables: set pktinfo->thoff at AH header if found
   4131c889c278 md/raid10: submit bio directly to replacement disk
   5c6712ab4efb rds: ib: add error handle
   a495f72f8a53 mm/cgroup: avoid panic when init with low memory
   2d59530d9918 iommu/io-pgtable-arm: Check for leaf entry before dereferencing it
   81080d2d83f6 x86/acpi: Restore the order of CPU IDs
   ffb6a7637ce0 cpufreq: intel_pstate: Update pid_params.sample_rate_ns in pid_param_set()
   27848be7eb75 ibmvnic: Free tx/rx scrq pointer array when releasing sub-crqs
   49f1b2c154cb nfs: make nfs4_cb_sv_ops static
   1cf8f9467e86 parisc: perf: Fix potential NULL pointer dereference
   cd402b889606 netfilter: nfnl_cthelper: fix incorrect helper->expect_class_max
   9b6f9da9e55a nvme-rdma: handle cpu unplug when re-establishing the controller
   67e8be27ff72 MIPS: smp-cps: Fix retrieval of VPE mask on big endian CPUs
   db6767e2fdca exynos-gsc: Do not swap cb/cr for semi planar formats
   61b203816b17 iommu/exynos: Block SYSMMU while invalidating FLPD cache
   3798fd14b970 MIPS: IRQ Stack: Unwind IRQ stack onto task stack
   146561a3f1c8 netfilter: invoke synchronize_rcu after set the _hook_ to NULL
   07b653405e3a drivers/rapidio/devices/tsi721.c: make module parameter variable name unique
   5435e4823d81 kasan: do not sanitize kexec purgatory
   dd9640717f3f hugetlbfs: initialize shared policy as part of inode allocation
   c533c11d8f7a sata_via: Enable hotplug only on VT6421
   26899ca9cc6f Btrfs: fix potential use-after-free for cloned bio
   c17acd24c682 Btrfs: fix segmentation fault when doing dio read
   7e2a755497f3 bridge: netlink: register netdevice before executing changelink
   727a153435fa mmc: sdio: fix alignment issue in struct sdio_func
   8f9bd136b50b qed: Fix possible system hang in the dcbnl-getdcbx() path.
   f06316859ce6 net: dsa: b53: Include IMP/CPU port in dumb forwarding mode
   affd26096a59 udp: disable inner UDP checksum offloads in IPsec case
   65a7a7ce7ffd usb: plusb: Add support for PL-27A1
   45eacc855552 team: fix memory leaks
   897e8c528529 net/packet: check length in getsockopt() called with PACKET_HDRLEN
   1dee03af7325 net: core: Prevent from dereferencing null pointer when releasing SKB
   c593091cfc1b lkdtm: Fix Oops when unloading the module
   6329973bee29 mips: ath79: clock:- Unmap region obtained by of_iomap
   30a0220a5b0b MIPS: Lantiq: Fix another request_mem_region() return code check
   fd9597d6ea28 HID: wacom: release the resources before leaving despite devm
   d621f970fd71 drm: mali-dp: Fix transposed horizontal/vertical flip
   c67371165170 drm: mali-dp: Fix destination size handling when rotating
   e2d1a42ed06e ASoC: dapm: fix some pointer error handling
   4302bc4f40b1 rtl8xxxu: Add additional USB IDs for rtl8192eu devices
   3f22900466a1 usb: chipidea: vbus event may exist before starting gadget
   75d1888ddce9 iommu/arm-smmu: Set privileged attribute to 'default' instead of 'unprivileged'
   4af5e6136d76 spi: pxa2xx: Add support for Intel Gemini Lake
   874b5acede78 ath10k: prevent sta pointer rcu violation
   91e66498a96a audit: log 32-bit socketcalls
   de415c812ec9 ASoC: dapm: handle probe deferrals
   0fc89de6ee77 partitions/efi: Fix integer overflow in GPT size calculation
   eaf9616e406c sfc: get PIO buffer size from the NIC
   c6d263e6b30a USB: serial: mos7840: fix control-message error handling
   9553708eb98d USB: serial: mos7720: fix control-message error handling
   09831a957766 drm/amdkfd: fix improper return value on error
   68b94d6c4edb arm: dts: mt2701: Add subsystem clock controller device nodes
   b2e7d1f72b09 IB/ipoib: Replace list_del of the neigh->list with list_del_init
   e335016d1f62 IB/ipoib: rtnl_unlock can not come after free_netdev
   e384bbd585ee IB/ipoib: Fix deadlock over vlan_mutex
   6c25cbaff1e9 serial: 8250_port: Remove dangerous pr_debug()
   ca3e4e77201a tty: goldfish: Fix a parameter of a call to free_irq
   5d29957578ae serial: 8250: moxa: Store num_ports in brd
   d976d68e1726 drm/i915/psr: disable psr2 for resolution greater than 32X20
   e92dca6f5a14 ARM: 8635/1: nommu: allow enabling REMAP_VECTORS_TO_RAM
   e1c355c244b7 IB/rxe: Fix a MR reference leak in check_rkey()
   0081b9e7fcf7 IB/rxe: Add a runtime check in alloc_index()
   2b7aec8839df iio: adc: hx711: Add DT binding for avia,hx711
   ff9b56037dd7 iio: adc: axp288: Drop bogus AXP288_ADC_TS_PIN_CTRL register modifications
   259f317db758 iio: adc: imx25-gcq: Fix module autoload
   772384d7ec40 hwmon: (gl520sm) Fix overflows and crash seen when writing into limit attributes
   d74f860528fb usb: make the MTK XHCI driver compile for older MIPS SoCs
   952d3c52bd85 clk/axs10x: Clear init field in driver probe
   81c961824662 sh_eth: use correct name for ECMR_MPDE bit
   bed7533196b2 reset: ti_syscon: fix a ti_syscon_reset_status issue
   6798f079b0a5 extcon: axp288: Use vbus-valid instead of -present to determine cable presence
   bc438831606a igb: re-assign hw address pointer on reset after PCI error
   484e3e793449 ARM: dts: am335x-chilisom: Wakeup from RTC-only state by power on event
   bc9ad17c7af2 scsi: be2iscsi: Add checks to validate CID alloc/free
   36c56ac0f897 power: supply: axp288_fuel_gauge: Fix fuel_gauge_reg_readb return on error
   0cde56d3b672 MIPS: ralink: Fix incorrect assignment on ralink_soc
   0e22be793ad2 MIPS: ralink: Fix a typo in the pinmux setup.
   84eaa74d734a MIPS: Ensure bss section ends on a long-aligned address
   d1d3a78f3e8f ARM: dts: r8a7790: Use R-Car Gen 2 fallback binding for msiof nodes
   3311a304ec62 RDS: RDMA: Fix the composite message user notification
   aa07a2ccc80d clk: sunxi-ng: fix PLL_CPUX adjusting on H3
   299b924c1f20 ARM: dts: exynos: Add CPU OPPs for Exynos4412 Prime
   48167acb7f5b drm/i915: Fix the overlay frontbuffer tracking
   97766c6a8e58 GFS2: Fix reference to ERR_PTR in gfs2_glock_iter_next
   e236940a87f1 drm: bridge: add DT bindings for TI ths8135
   7df306f1063b drm_fourcc: Fix DRM_FORMAT_MOD_LINEAR #define
   1852eae92c46 Linux 4.9.53
   df13283e4b89 swiotlb-xen: implement xen_swiotlb_dma_mmap callback
   64afde6f956d video: fbdev: aty: do not leak uninitialized padding in clk to userspace
   ea37f61f5de0 KVM: VMX: use cmpxchg64
   cb2da657d3a9 cxl: Fix driver use count
   3ffbe626a254 KVM: VMX: remove WARN_ON_ONCE in kvm_vcpu_trigger_posted_interrupt
   0c4e39ca6700 KVM: VMX: do not change SN bit in vmx_update_pi_irte()
   4c00015385fa timer/sysclt: Restrict timer migration sysctl values to 0 and 1
   e2f803481a84 gfs2: Fix debugfs glocks dump
   5e9b07f30d21 x86/fpu: Don't let userspace set bogus xcomp_bv
   54af98f86b92 x86/mm: Fix fault error path using unsafe vma pointer
   f11525d7ff5d btrfs: prevent to set invalid default subvolid
   ba44bc49bae6 btrfs: propagate error to btrfs_cmp_data_prepare caller
   b86b6c226bea btrfs: fix NULL pointer dereference from free_reloc_roots()
   bb1e06d281a8 PCI: Fix race condition with driver_override
   46f062e05920 etnaviv: fix gem object list corruption
   02c7d98bec6c xfs: validate bdev support for DAX inode flag
   86ef97b2dfd5 kvm: nVMX: Don't allow L2 to access the hardware CR8
   3d4213fac7d1 KVM: VMX: Do not BUG() on out-of-bounds guest IRQ
   e3a643b3288a kvm/x86: Handle async PF in RCU read-side critical sections
   58d2fb119ae6 KVM: VMX: simplify and fix vmx_vcpu_pi_load
   ff5eb8f28ff2 KVM: VMX: avoid double list add with VT-d posted interrupts
   01c58b0edeb1 KVM: VMX: extract __pi_post_block
   d49527ed4888 arm64: fault: Route pte translation faults via do_translation_fault
   7dbd64284b18 arm64: Make sure SPsel is always set
   be69c4c00a68 seccomp: fix the usage of get/put_seccomp_filter() in seccomp_get_filter()
   58052a74d9b0 selftests/seccomp: Support glibc 2.26 siginfo_t.h
   831cca587e7b iw_cxgb4: put ep reference in pass_accept_req()
   f184cf5256b7 iw_cxgb4: remove the stid on listen create failure
   eb4375e1969c bsg-lib: don't free job in bsg_prepare_job
   c820441a7a52 nl80211: check for the required netlink attributes presence
   f3e2e7f0b4d7 vfs: Return -ENXIO for negative SEEK_HOLE / SEEK_DATA offsets
   18a89a10b26b SMB3: Don't ignore O_SYNC/O_DSYNC and O_DIRECT flags
   0e1b85a41a25 SMB: Validate negotiate (to protect against downgrade) even if signing off
   df1be2066433 SMB3: Warn user if trying to sign connection that authenticated as guest
   f2d395b7bde5 Fix SMB3.1.1 guest authentication to Samba
   3a02f8cb5564 PM: core: Fix device_pm_check_callbacks()
   22338c55658d s390/mm: fix write access check in gup_huge_pmd()
   c76655fb0f44 powerpc/ftrace: Pass the correct stack pointer for DYNAMIC_FTRACE_WITH_REGS
   f89f25b53147 powerpc/tm: Flush TM only if CPU has TM feature
   5c23dcf86e2d powerpc/pseries: Fix parent_dn reference leak in add_dt_node()
   dda70d28c0ac KEYS: prevent KEYCTL_READ on negative key
   bfe9d7b8e0f2 KEYS: prevent creating a different user's keyrings
   47e8bd1965fc KEYS: fix writing past end of user-supplied buffer in keyring_read()
   0c70fb88c751 security/keys: rewrite all of big_key crypto
   2f9be92dfffe security/keys: properly zero out sensitive key material in big_key
   b60f791ef32d crypto: talitos - fix hashing
   1492259fc324 crypto: talitos - fix sha224
   70117b773598 crypto: talitos - Don't provide setkey for non hmac hashing algs.
   7e1b2b2db3d7 crypto: drbg - fix freeing of resources
   29825768590e drm/radeon: disable hard reset in hibernate for APUs
   b42bf0f15cf7 scsi: scsi_transport_iscsi: fix the issue that iscsi_if_rx doesn't parse nlmsg properly
   49c2b839b743 md/raid5: preserve STRIPE_ON_UNPLUG_LIST in break_stripe_batch_list
   648798cc2fd7 md/raid5: fix a race condition in stripe batch
   5fb4be27dac5 tracing: Erase irqsoff trace with empty write
   97d402e6eed2 tracing: Fix trace_pipe behavior for instance traces
   8dcf70ab1830 KVM: PPC: Book3S HV: Protect updates to spapr_tce_tables list
   18b7919a9de8 KVM: PPC: Book3S: Fix race and leak in kvm_vm_ioctl_create_spapr_tce()
   3d5960c8c657 genirq: Make sparse_irq_lock protect what it should protect
   e167b4ad529b mac80211: flush hw_roc_start work before cancelling the ROC
   e7e0f0dda28b mac80211_hwsim: Use proper TX power
   59862b0429d9 mac80211: fix VLAN handling with TXQs
   9ad15a25669e fs/proc: Report eip/esp in /prod/PID/stat for coredumping
   b6a77c7ba674 cifs: release auth_key.response for reconnect.
   9a7bc3f0c76a cifs: release cifs root_cred after exit_cifs
   d59dabdc4cb3 Linux 4.9.52
   08f75f2c525d bcache: fix bch_hprint crash and improve output
   57aa1a6967b2 bcache: fix for gc and write-back race
   fa92ff6b77a1 bcache: Correct return value for sysfs attach errors
   e40cb30162d7 bcache: correct cache_dirty_target in __update_writeback_rate()
   8f51f38883dc bcache: do not subtract sectors_to_gc for bypassed IO
   c234e0e77572 bcache: Fix leak of bdev reference
   2a9b55742a9f bcache: initialize dirty stripes in flash_dev_run()
   f5c3fd83284f PM / devfreq: Fix memory leak when fail to register device
   38993f320506 media: uvcvideo: Prevent heap overflow when accessing mapped controls
   7717a7378c53 media: v4l2-compat-ioctl32: Fix timespec conversion
   de4360dd3519 s390/mm: fix race on mm->context.flush_mm
   536ab630f4db s390/mm: fix local TLB flushing vs. detach of an mm address space
   4c7f54a0f977 net/netfilter/nf_conntrack_core: Fix net_conntrack_lock()
   2fd62929c88f PCI: pciehp: Report power fault only once until we clear it
   998a9f51bc74 PCI: shpchp: Enable bridge bus mastering if MSI is enabled
   57e4f87ebe46 ARC: Re-enable MMU upon Machine Check exception
   cf052336d0d3 tracing: Apply trace_clock changes to instance max buffer
   96cf918df428 tracing: Add barrier to trace_printk() buffer nesting modification
   100553e197e2 ftrace: Fix memleak when unregistering dynamic ops when tracing disabled
   df865f86b008 ftrace: Fix selftest goto location on error
   2a913aecc4f7 scsi: qla2xxx: Fix an integer overflow in sysfs code
   6e2a0259da7a scsi: qla2xxx: Correction to vha->vref_count timeout
   90cb12f6dc5a scsi: sg: fixup infoleak when using SG_GET_REQUEST_TABLE
   25d5a8a2958f scsi: sg: factor out sg_fill_request_table()
   c6b9a2007c92 scsi: sg: off by one in sg_ioctl()
   2b2d86b0d43d scsi: sg: use standard lists for sg_requests
   91fb151822d0 scsi: sg: remove 'save_scat_len'
   5b8f80d34abf scsi: storvsc: fix memory leak on ring buffer busy
   d8817f5f2937 scsi: megaraid_sas: Return pended IOCTLs with cmd_status MFI_STAT_WRONG_STATE in case adapter is dead
   c62da79e1be5 scsi: megaraid_sas: Check valid aen class range to avoid kernel panic
   7efc41514a01 scsi: megaraid_sas: set minimum value of resetwaittime to be 1 secs
   c24f722a82b1 scsi: zfcp: trace high part of "new" 64 bit SCSI LUN
   adbbbd349e80 scsi: zfcp: trace HBA FSF response by default on dismiss or timedout late response
   5283787709f8 scsi: zfcp: fix payload with full FCP_RSP IU in SCSI trace records
   8d706e3dd8ab scsi: zfcp: fix missing trace records for early returns in TMF eh handlers
   424a20b09617 scsi: zfcp: fix passing fsf_req to SCSI trace on TMF to correlate with HBA
   0cbb7431a762 scsi: zfcp: fix capping of unsuccessful GPN_FT SAN response trace records
   88187de0e934 scsi: zfcp: add handling for FCP_RESID_OVER to the fcp ingress path
   83245cd18775 scsi: zfcp: fix queuecommand for scsi_eh commands when DIX enabled
   63e606bd9551 skd: Submit requests to firmware before triggering the doorbell
   cb1441bca9bf skd: Avoid that module unloading triggers a use-after-free
   2cee78081b97 md/bitmap: disable bitmap_resize for file-backed bitmaps.
   120ec1e4cddd block: Relax a check in blk_start_queue()
   48564b51ac75 powerpc: Fix DAR reporting when alignment handler faults
   3806cea5c1c5 ext4: fix quota inconsistency during orphan cleanup for read-only mounts
   18d27cb70373 ext4: fix incorrect quotaoff if the quota feature is enabled
   e684db9a7cea crypto: AF_ALG - remove SGL terminator indicator when chaining
   dcb3a4b8d776 crypto: ccp - Fix XTS-AES-128 support on v5 CCPs
   1f143ba19a8f MIPS: math-emu: <MADDF|MSUBF>.D: Fix accuracy (64-bit case)
   d2b488ee6f63 MIPS: math-emu: <MADDF|MSUBF>.S: Fix accuracy (32-bit case)
   5cabf999fdb7 MIPS: math-emu: <MADDF|MSUBF>.<D|S>: Clean up "maddf_flags" enumeration
   d56a9caf6d83 MIPS: math-emu: <MADDF|MSUBF>.<D|S>: Fix some cases of zero inputs
   8981bcaf9a2d MIPS: math-emu: <MADDF|MSUBF>.<D|S>: Fix some cases of infinite inputs
   4f8479c933a7 MIPS: math-emu: <MADDF|MSUBF>.<D|S>: Fix NaN propagation
   4e0694a6411b MIPS: math-emu: Handle zero accumulator case in MADDF and MSUBF separately
   9381a991a36a MIPS: math-emu: MINA.<D|S>: Fix some cases of infinity and zero inputs
   f7d36f6594b8 MIPS: math-emu: <MAXA|MINA>.<D|S>: Fix cases of both infinite inputs
   a04d53797fca MIPS: math-emu: <MAXA|MINA>.<D|S>: Fix cases of input values with opposite signs
   d2b6fcb0b6de MIPS: math-emu: <MAX|MIN>.<D|S>: Fix cases of both inputs negative
   694f6ea0a4e2 MIPS: math-emu: <MAX|MAXA|MIN|MINA>.<D|S>: Fix cases of both inputs zero
   b234149cf77b MIPS: math-emu: <MAX|MAXA|MIN|MINA>.<D|S>: Fix quiet NaN propagation
   fcaec235666c Input: i8042 - add Gigabyte P57 to the keyboard reset table
   6053a5fec569 pinctrl/amd: save pin registers over suspend/resume
   346abf2aca7f tty: fix __tty_insert_flip_char regression
   750462424193 tty: improve tty_insert_flip_char() slow path
   f61a07f3fe97 tty: improve tty_insert_flip_char() fast path
   2f8b06f906fd IB/addr: Fix setting source address in addr6_resolve()
   0fda166fcec8 drm/sun4i: Implement drm_driver lastclose to restore fbdev console
   a29aeb834a96 IB/{qib, hfi1}: Avoid flow control testing for RDMA write operation
   e148702302c5 orangefs: Don't clear SGID when inheriting ACLs
   39f5677232ab mm: prevent double decrease of nr_reserved_highatomic
   f609266b12d2 NFSv4: Fix callback server shutdown
   d9f9b83539ab SUNRPC: Refactor svc_set_num_threads()
   089d7720383d Linux 4.9.51
   7829684088a2 ipv6: Fix may be used uninitialized warning in rt6_check
   ae04a8c4c6fc xfs: fix compiler warnings
   7b5fcb7fc05b md/raid5: release/flush io in raid5_do_work()
   81cb6f1a2a19 xfs: use kmem_free to free return value of kmem_zalloc
   772003c6a428 xfs: open code end_buffer_async_write in xfs_finish_page_writeback
   bb69e8a228a7 xfs: don't set v3 xflags for v2 inodes
   f46a61f686b0 xfs: fix incorrect log_flushed on fsync
   0e8d7e364ec5 xfs: disable per-inode DAX flag
   a46cf59265cf xfs: relog dirty buffers during swapext bmbt owner change
   e2bb92633615 xfs: disallow marking previously dirty buffers as ordered
   a51e3e2cf3cb xfs: move bmbt owner change to last step of extent swap
   f9e583edf1a7 xfs: skip bmbt block ino validation during owner change
   fe211e1744db xfs: don't log dirty ranges for ordered buffers
   19a87a940765 xfs: refactor buffer logging into buffer dirtying helper
   93b645160192 xfs: ordered buffer log items are never formatted
   ba986b3c8498 xfs: remove unnecessary dirty bli format check for ordered bufs
   0f5af7eae884 xfs: open-code xfs_buf_item_dirty()
   81286ade81f7 xfs: check for race with xfs_reclaim_inode() in xfs_ifree_cluster()
   63d184d2955b xfs: evict all inodes involved with log redo item
   536932f39e93 xfs: stop searching for free slots in an inode chunk when there are none
   6b6505d90b77 xfs: add log recovery tracepoint for head/tail
   7549e7c01fb0 xfs: handle -EFSCORRUPTED during head/tail verification
   47db1fc608b8 xfs: fix log recovery corruption error due to tail overwrite
   e34b72a2381e xfs: always verify the log tail during recovery
   35093926c2f8 xfs: fix recovery failure when log record header wraps log end
   0800356def7f xfs: Properly retry failed inode items in case of error during buffer writeback
   7942f605c308 xfs: Add infrastructure needed for error propagation during buffer IO failure
   1ba04933408e xfs: remove xfs_trans_ail_delete_bulk
   9a3f75229090 xfs: toggle readonly state around xfs_log_mount_finish
   01d38e380746 xfs: write unmount record for ro mounts
   ec0d46ef8b7e iomap: fix integer truncation issues in the zeroing and dirtying helpers
   e1a7b7e1f6c2 xfs: don't leak quotacheck dquots when cow recovery
   7fb3e5e373bb xfs: clear MS_ACTIVE after finishing log recovery
   8edd73a13dc0 xfs: fix inobt inode allocation search optimization
   f90756d75d69 xfs: Fix per-inode DAX flag inheritance
   229980158f95 xfs: fix multi-AG deadlock in xfs_bunmapi
   81e27c94f9ab xfs: fix quotacheck dquot id overflow infinite loop
   01bc132048cf xfs: check _alloc_read_agf buffer pointer before using
   c32b1ec8a266 xfs: set firstfsb to NULLFSBLOCK before feeding it to _bmapi_write
   a6247b0189fa xfs: check _btree_check_block value
   e76496fa8554 xfs: don't crash on unexpected holes in dir/attr btrees
   b46382f02aff xfs: free cowblocks and retry on buffered write ENOSPC
   171192c92da6 xfs: free uncommitted transactions during log recovery
   621d0b75a347 xfs: don't allow bmap on rt files
   8913492d12b1 xfs: remove bli from AIL before release on transaction abort
   6c0ecde201d7 xfs: release bli from transaction properly on fs shutdown
   ce83e494d1bb xfs: try to avoid blowing out the transaction reservation when bunmaping a shared extent
   7cb011bbacef xfs: push buffer of flush locked dquot to avoid quotacheck deadlock
   85ab1b23d2d8 xfs: fix spurious spin_is_locked() assert failures on non-smp kernels
   4c1d33c4cf86 xfs: Move handling of missing page into one place in xfs_find_get_desired_pgoff()
   3fddeb80034b x86/switch_to/64: Rewrite FS/GS switching yet again to fix AMD CPUs
   0caec70692a0 x86/fsgsbase/64: Report FSBASE and GSBASE correctly in core dumps
   c7d1ddec251d x86/fsgsbase/64: Fully initialize FS and GS state in start_thread_common
   cc9618c9fffe f2fs: check hot_data for roll-forward recovery
   0f90297cba9b f2fs: let fill_super handle roll-forward errors
   60b94125a1fe ip_tunnel: fix setting ttl and tos value in collect_md mode
   3f60dadbe178 sctp: fix missing wake ups in some situations
   bf8ed95d2ca9 ipv6: fix typo in fib6_net_exit()
   c9335db792c0 ipv6: fix memory leak with multiple tables during netns destruction
   ca7d8a337bd3 ip6_gre: update mtu properly in ip6gre_err
   f5755c0e8700 vhost_net: correctly check tx avail during rx busy polling
   90406e68e42f gianfar: Fix Tx flow control deactivation
   1bcf18718ec6 Revert "net: fix percpu memory leaks"
   5a7a40bad254 Revert "net: use lib/percpu_counter API for fragmentation mem accounting"
   b5a3ae8b127e bridge: switchdev: Clear forward mark when transmitting packet
   73ee5a73e75f mlxsw: spectrum: Forbid linking to devices that have uppers
   a10c510179b3 tcp: initialize rcv_mss to TCP_MIN_MSS instead of 0
   a6e51fda71a2 Revert "net: phy: Correctly process PHY_HALTED in phy_stop_machine()"
   af33da0ed95f kcm: do not attach PF_KCM sockets to avoid deadlock
   8c623e5d0369 packet: Don't write vnet header beyond end of buffer
   2b3bd5972a5c cxgb4: Fix stack out-of-bounds read due to wrong size to t4_record_mbox()
   de2ecec26dba netvsc: fix deadlock betwen link status and removal
   64dfc67548da qlge: avoid memcpy buffer overflow
   08d56d8a99bb sctp: Avoid out-of-bounds reads from address storage
   4d8ee1935bcd fsl/man: Inherit parent device and of_node
   1e39e5c6a2ea udp: on peeking bad csum, drop packets even if not at head
   4b4a194a10e2 macsec: add genl family module alias
   43c792a84880 ipv6: fix sparse warning on rt6i_node
   7f8f23fc8026 ipv6: add rcu grace period before freeing fib6_node
   dccb31be7ef8 ipv6: accept 64k - 1 packet length in ip6_find_1stfragopt()
   4ad5dcaca742 Linux 4.9.50
   5b82e0e938af xfs: XFS_IS_REALTIME_INODE() should be false if no rt device present
   3885bc68ae14 NFS: Sync the correct byte range during synchronous writes
   a70912a6bfff NFS: Fix 2 use after free issues in the I/O code
   301d91e03c9d ARM: 8692/1: mm: abort uaccess retries upon fatal signal
   b40aa8b047b8 ARM64: dts: marvell: armada-37xx: Fix GIC maintenance interrupt
   6300c8bfafe0 Bluetooth: Properly check L2CAP config option output buffer length
   03bea515b9a2 ALSA: msnd: Optimize / harden DSP and MIDI loops
   d21f3eaa09c0 locktorture: Fix potential memory leak with rw lock test
   3c8381df2a56 mm/memory.c: fix mem_cgroup_oom_disable() call missing
   ebf381be016f selftests/x86/fsgsbase: Test selectors 1, 2, and 3
   0f7dbc4d5bc8 btrfs: resume qgroup rescan on rw remount
   f52a535c8438 nvme-fabrics: generate spec-compliant UUID NQNs
   b276bc66d439 mtd: nand: qcom: fix config error for BCH
   f4a272d57839 mtd: nand: qcom: fix read failure without complete bootchain
   865162031c4e mtd: nand: mxc: Fix mxc_v1 ooblayout
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.9.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
index 6734dc0d05e2..b6c98a5bb3bc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.9.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "0817a7b3a853d1bdd3b87a2654ed2ee62f624806"
-SRCREV_meta ?= "6acae6f7200af17b3c2be5ecab2cffdc59a02b35"
+SRCREV_machine ?= "3039bc8f8f7e84de15c5823783c067c3e50fa7b6"
+SRCREV_meta ?= "cdbd35c54b6a62e4fd543164f1dcdf92c85cff2d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.49"
+LINUX_VERSION ?= "4.9.57"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
index 7798161ef0b5..79b8bfdfc82d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.9.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.9.49"
+LINUX_VERSION ?= "4.9.57"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "480ee599fb8df712c10dcf4b7aa6398b79f7d404"
-SRCREV_meta ?= "6acae6f7200af17b3c2be5ecab2cffdc59a02b35"
+SRCREV_machine ?= "cd8f9254aaaacbfa7f45fcc0bf2bb307615a174b"
+SRCREV_meta ?= "cdbd35c54b6a62e4fd543164f1dcdf92c85cff2d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.9.bb b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
index dbe40a338d88..24867928d95c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.9.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.9.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "8caa35a74753d45178720933f03d8d5150a8ff17"
-SRCREV_machine_qemuarm64 ?= "480ee599fb8df712c10dcf4b7aa6398b79f7d404"
-SRCREV_machine_qemumips ?= "fc2a3b9f932779fdf053675a5a73e8f9917507a5"
-SRCREV_machine_qemuppc ?= "480ee599fb8df712c10dcf4b7aa6398b79f7d404"
-SRCREV_machine_qemux86 ?= "480ee599fb8df712c10dcf4b7aa6398b79f7d404"
-SRCREV_machine_qemux86-64 ?= "480ee599fb8df712c10dcf4b7aa6398b79f7d404"
-SRCREV_machine_qemumips64 ?= "aee63978005c04ea853099764acaa08130e65554"
-SRCREV_machine ?= "480ee599fb8df712c10dcf4b7aa6398b79f7d404"
-SRCREV_meta ?= "6acae6f7200af17b3c2be5ecab2cffdc59a02b35"
+SRCREV_machine_qemuarm ?= "d5283083c827e18c5500d80c25b0a5eb76f64607"
+SRCREV_machine_qemuarm64 ?= "cd8f9254aaaacbfa7f45fcc0bf2bb307615a174b"
+SRCREV_machine_qemumips ?= "46f372c4c36868dd3546984efa408c2fe41c8fba"
+SRCREV_machine_qemuppc ?= "cd8f9254aaaacbfa7f45fcc0bf2bb307615a174b"
+SRCREV_machine_qemux86 ?= "cd8f9254aaaacbfa7f45fcc0bf2bb307615a174b"
+SRCREV_machine_qemux86-64 ?= "cd8f9254aaaacbfa7f45fcc0bf2bb307615a174b"
+SRCREV_machine_qemumips64 ?= "b88c2da88e31179a9cf7c22651e69adefcaa250f"
+SRCREV_machine ?= "cd8f9254aaaacbfa7f45fcc0bf2bb307615a174b"
+SRCREV_meta ?= "cdbd35c54b6a62e4fd543164f1dcdf92c85cff2d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.9.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.9;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.9.49"
+LINUX_VERSION ?= "4.9.57"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


