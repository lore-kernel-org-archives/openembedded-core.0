Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id EADCC78415
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 16:26:10 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id m26so503402pfj.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 08:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=CrjTg1PQyEg84M0zNYBaHEukkkYbZNdr41pW2uOzZos=;
	b=kMtfkwzqcaTqsd9l1n8//LuHV+a1dB2E85BmScgMQ+3pIQhDA60fZ3WIrLo07EnO+Q
	gTAxfp9b8wqyBXxZ/JEwiMWgy1VefOnmxbkKRyj2rHWkPjR7YvEKVbevCAGJI5psrFbb
	V6emYaKJwqYWQ5ZRAQf11pyBMM6eDExLGW/do1SaeDieCnIAWybmJnor58uBTTr4Dsnd
	GyQONO8Xm32/pV2mXpibsee9anxWGFU+fsAapXEX3GobY3uKaaSHKQeZdbFBfkEOX/CF
	FiTa5Bez00QdDhCtZsRJYCwI+sL7SUzXZtak56wDyfi0nJz22wkop5dNZHaoWrVhKuJT
	20wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=CrjTg1PQyEg84M0zNYBaHEukkkYbZNdr41pW2uOzZos=;
	b=FQRS8uVgXv7604bX0STdviAQLJdB0sAH3GMt6okRQyLztn0pOWd5Pr3UtlDE7+IZ+N
	S1oECejiWt/+a/ar8jyNw0sChmU3fflZ1PEPwR7DzZVGTPwzVHlI9OACPVmUiwoxU6XH
	lsJTf8T+6SyfwBAPn69GEcbK+gapqWRLP+8iOKBbcM7cUJ+faBZiqr0gZ/xh927OZ5mv
	acONxCx+XhaYgdUiupifx2i1PeO9xaGoa6on0PZD+dCgFwRG1c6/NX+ZGSFBG5tJsfTU
	5cz6vBCn7Efe055o36SA5yoNl5TBJmhsyrzkq7ZbiaIc0++WtxF7uVP+x2fAJj7IRCsF
	H+cQ==
X-Gm-Message-State: AJaThX5eJpJrk7C97xpL7VqvT7bBR48mRq/+kMRYDi2NG1pMWkYwCmhi
	fygMGn3YOXIjy0lGILBUEY+neg==
X-Google-Smtp-Source: AGs4zMZ+7xdvRLHoD7LikIjtWYeyDTCGtFIos5JdWHYCnqzQZiOLPP2a3FdNf+vhzaiuQfl7zc5KFg==
X-Received: by 10.84.234.135 with SMTP id n7mr18000845plk.298.1512491171183;
	Tue, 05 Dec 2017 08:26:11 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:893f:c8b0:d297:c295?
	([2601:202:4001:9ea0:893f:c8b0:d297:c295])
	by smtp.gmail.com with ESMTPSA id x6sm946171pfx.29.2017.12.05.08.26.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Dec 2017 08:26:10 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@windriver.com>,
	richard.purdie@linuxfoundation.org
References: <cover.1512401707.git.bruce.ashfield@windriver.com>
	<a27126fdaf0a5446efef819bb4e7964d12d5f82d.1512401707.git.bruce.ashfield@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <3229541e-d5d4-5889-6a65-2f5e22cb2724@gmail.com>
Date: Tue, 5 Dec 2017 08:26:09 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <a27126fdaf0a5446efef819bb4e7964d12d5f82d.1512401707.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: Re: [PATCH 4/8] linux-yocto/4.12: update to v4.12.16
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
X-List-Received-Date: Tue, 05 Dec 2017 16:26:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Bruce,


On 12/04/2017 07:39 AM, Bruce Ashfield wrote:
> Integrating the -stable updates from Paul Gortmaker that cover the
> following commits:
>
>    8500552cb6f7 Linux 4.12.16

What is your take on 4.14 ?

- armin
>    3041c36e51aa vmbus: more host signalling avoidance
>    170ce449d952 vmbus: eliminate duplicate cached index
>    1843e4c61d03 vmbus: refactor hv_signal_on_read
>    3114e4beb799 vmbus: simplify hv_ringbuffer_read
>    47cd1be8a9b1 HID: hid-elecom: extend to fix descriptor for HUGE trackball
>    663b5513c683 mm: page_vma_mapped: ensure pmd is loaded with READ_ONCE outside of lock
>    8a0af0f30b6b perf pmu: Unbreak perf record for arm/arm64 with events with explicit PMU
>    20ce8834fc99 KVM: nVMX: update last_nonleaf_level when initializing nested EPT
>    bf6a0ec7751f x86/alternatives: Fix alt_max_short macro to really be a max()
>    8566ad9542c8 x86/microcode: Do the family check first
>    d369002c85c7 RAS/CEC: Use the right length for "cec_disable"
>    2f5df0825d43 USB: serial: console: fix use-after-free after failed setup
>    38d29750c751 USB: serial: console: fix use-after-free on disconnect
>    3312688774a5 USB: serial: qcserial: add Dell DW5818, DW5819
>    8ceb1ab5b8b6 USB: serial: option: add support for TP-Link LTE module
>    9a492331d4d8 USB: serial: cp210x: add support for ELV TFD500
>    05a76c3972a3 USB: serial: cp210x: fix partnum regression
>    36db7ee477f7 USB: serial: ftdi_sio: add id for Cypress WICED dev board
>    f5f28aa1189d bio_copy_user_iov(): don't ignore ->iov_offset
>    2e23ac57b91b more bio_map_user_iov() leak fixes
>    be96ea60abf4 fix unbalanced page refcounting in bio_map_user_iov
>    62272a78cd64 direct-io: Prevent NULL pointer access in submit_page_section
>    da889b1de1e2 usb: gadget: composite: Fix use-after-free in usb_composite_overwrite_options
>    82bb04bf4ef3 usb: gadget: configfs: Fix memory leak of interface directory data
>    48f321f266d2 drm/i915: Use crtc_state_is_legacy_gamma in intel_color_check
>    300533678314 drm/i915/bios: parse DDI ports also for CHV for HDMI DDC pin and DP AUX channel
>    6e7077ce8b8f drm/i915: Read timings from the correct transcoder in intel_crtc_mode_get()
>    a89c571ae8a8 drm/i915/edp: Get the Panel Power Off timestamp after panel is off
>    002894140f21 drm/atomic: Unref duplicated drm_atomic_state in drm_atomic_helper_resume()
>    7e9518d4926c ALSA: line6: Fix leftover URB at error-path during probe
>    44a4ce6662bd ALSA: line6: Fix missing initialization before error path
>    7f16c070632d ALSA: line6: Fix NULL dereference at podhd_disconnect()
>    317938e88d45 ALSA: caiaq: Fix stray URB at probe error path
>    39921169c481 ALSA: seq: Fix copy_from_user() call inside lock
>    dc744c119f6d ALSA: seq: Fix use-after-free at creating a port
>    3da32e1a4a3a ALSA: usb-audio: Kill stray URB at exiting
>    cbf3f880a31c fs/mpage.c: fix mpage_writepage() for pages with buffers
>    24bb3d33bf9c Revert "vmalloc: back off when the current task is killed"
>    076e98e18525 device property: Track owner device of device property
>    2404f2c63a8f iommu/amd: Finish TLB flush in amd_iommu_unmap()
>    2681ccd7a877 usb: renesas_usbhs: Fix DMAC sequence for receiving zero-length packet
>    014b37ece737 KVM: nVMX: fix guest CR4 loading when emulating L2 to L1 exit
>    c0f617345da5 KVM: MMU: always terminate page walks at level 1
>    810fa30a4ec6 crypto: shash - Fix zero-length shash ahash digest crash
>    c55f32198aa4 crypto: skcipher - Fix crash on zero-length input
>    688d47df70db HID: usbhid: fix out-of-bounds bug
>    fceb5f74236c NFS: Fix uninitialized rpc_wait_queue
>    3936965498e9 dmaengine: ti-dma-crossbar: Fix possible race condition with dma_inuse
>    232ab7abddce dmaengine: edma: Align the memcpy acnt array size with the transfer
>    a1b8e04e4478 mei: always use domain runtime pm callbacks.
>    ff7884c2afbf MIPS: math-emu: Remove pr_err() calls from fpu_emu()
>    c43a87667d3f USB: dummy-hcd: Fix deadlock caused by disconnect detection
>    111001ffa651 watchdog: Revert "iTCO_wdt: all versions count down twice"
>    d6703459b5bf udp: perform source validation for mcast early demux
>    5a2bdca5336a nl80211: Define policy for packet pattern attributes
>    fd4bee8c17d9 mmc: core: add driver strength selection when selecting hs400es
>    11a49827d263 nvme-pci: Use PCI bus address for data/queues in CMB
>    bfd19d3e3511 drm/i915/bios: ignore HDMI on port A
>    8ab3d473cbfd drm/i915: always update ELD connector type after get modes
>    ec338aac41a5 brcmfmac: setup passive scan if requested by user-space
>    a2db156a40ef brcmfmac: add length check in brcmf_cfg80211_escan_handler()
>    fda708d0e6c9 scsi: sd: Do not override max_sectors_kb sysfs setting
>    9d0c3a0c8ed3 scsi: sd: Implement blacklist option for WRITE SAME w/ UNMAP
>    e57b8ad57afc scsi: remove various unused blist flags
>    86d40a1cfd5e iwlwifi: mvm: use IWL_HCMD_NOCOPY for MCAST_FILTER_CMD
>    0a1447d60118 kvm/x86: Avoid async PF preempting the kernel incorrectly
>    9dfcfa3ac381 KVM: PPC: Book3S: Fix server always zero from kvmppc_xive_get_xive()
>    4d93aae9b293 dm crypt: fix memory leak in crypt_ctr_cipher_old()
>    8ab4dc921826 dm crypt: reject sector_size feature if device length is not aligned to it
>    da3c3bd6ad07 netlink: fix nla_put_{u8,u16,u32} for KASAN
>    dbe7d8a9dba2 rocker: fix rocker_tlv_put_* functions for KASAN
>    1fa70078bcba HID: wacom: bits shifted too much for 9th and 10th buttons
>    de1b19226d80 HID: wacom: Always increment hdev refcount within wacom_get_hdev_data
>    78fbbdd94b75 HID: wacom: generic: Clear ABS_MISC when tool leaves proximity
>    4c0d78da4868 HID: wacom: generic: Send MSC_SERIAL and ABS_MISC when leaving prox
>    f4efe333405d HID: wacom: Correct coordinate system of touchring and pen twist
>    3dd5dae733f6 HID: wacom: Properly report negative values from Intuos Pro 2 Bluetooth
>    429ea46a9d3a HID: wacom: leds: Don't try to control the EKR's read-only LEDs
>    ffb802b9d7f9 HID: i2c-hid: allocate hid buffers for real worst case
>    9a95f1edac92 HID: rmi: Make sure the HID device is opened on resume
>    16be0f8ec04d arm64: Ensure the instruction emulation is ready for userspace
>    8fe55ce33212 ftrace: Fix kmemleak in unregister_ftrace_graph
>    86f8a516079a auxdisplay: charlcd: properly restore atomic counter on error path
>    99ff327c8738 stm class: Fix a use-after-free
>    d68b3c9e3511 vmbus: don't acquire the mutex in vmbus_hvsock_device_unregister()
>    07d4af70fd2e Drivers: hv: fcopy: restore correct transfer length
>    c106e296904b cgroup: Reinit cgroup_taskset structure before cgroup_migrate_execute() returns
>    336cc70e7777 driver core: platform: Don't read past the end of "driver_override" buffer
>    4384e4fd5416 intel_th: pci: Add Lewisburg PCH support
>    6b8889bc67cf percpu: make this_cpu_generic_read() atomic w.r.t. interrupts
>    5524a161ced3 powerpc/tm: Fix illegal TM state in signal handler
>    11939f4de59b powerpc/64s: Use emergency stack for kernel TM Bad Thing program checks
>    19cae92eb3d3 powerpc/powernv: Increase memory block size to 1GB on radix
>    6834ed0682d8 ALSA: usx2y: Suppress kernel warning at page allocation failures
>    c73650323e57 Revert "ALSA: echoaudio: purge contradictions between dimension matrix members and total number of members"
>    435ad40590e7 ALSA: compress: Remove unused variable
>    d62ff966e300 lsm: fix smack_inode_removexattr and xattr_getsecurity memleak
>    8907604ceee1 lib/ratelimit.c: use deferred printk() version
>    a646d2e16d5e userfaultfd: non-cooperative: fix fork use after free
>    7376b8c10bde mm: avoid marking swap cached page as lazyfree
>    d912b7cf15a6 mm: fix RODATA_TEST failure "rodata_test: test data was not read only"
>    3a8584637eb7 mm, oom_reaper: skip mm structs with mmu notifiers
>    a3a2270666cb ksm: fix unlocked iteration over vmas in cmp_and_merge_page()
>    0b833e6215f1 staging: vchiq_2835_arm: Fix NULL ptr dereference in free_pagelist
>    21163f7980af uwb: ensure that endpoint is interrupt
>    3474cb66fea2 uwb: properly check kthread_run return value
>    27a8bc07aaaa iio: adc: mcp320x: Fix oops on module unload
>    3f8385a599bb iio: adc: mcp320x: Fix readout of negative voltages
>    143b44819564 iio: ad7793: Fix the serial interface reset
>    c15998910ffd iio: trigger: stm32-timer: fix a corner case to write preset
>    e4445ff462ff iio: trigger: stm32-timer: preset shouldn't be buffered
>    620dfbd1d966 IIO: BME280: Updates to Humidity readings need ctrl_reg write!
>    3f78bc054bd0 iio: core: Return error for failed read_reg
>    bb9ad7727c30 staging: iio: ad7192: Fix - use the dedicated reset function avoiding dma from stack.
>    ef8f8aac9c40 iio: ad_sigma_delta: Implement a dedicated reset function
>    91cec30e5600 iio: adc: twl4030: Disable the vusb3v1 rugulator in the error handling path of 'twl4030_madc_probe()'
>    0694b17d52b5 iio: adc: twl4030: Fix an error handling path in 'twl4030_madc_probe()'
>    9598144dd7fe Revert "xhci: Limit USB2 port wake support for AMD Promontory hosts"
>    d075a0375ff9 xhci: set missing SuperSpeedPlus Link Protocol bit in roothub descriptor
>    214dd70fd584 usb: host: xhci-plat: allow sysdev to inherit from ACPI
>    f1741099affe xhci: fix wrong endpoint ESIT value shown in tracing
>    ce2e382d152c xhci: fix finding correct bus_state structure for USB 3.1 hosts
>    49398e9c9987 USB: fix out-of-bounds in usb_set_configuration
>    fbe76115049a usb: Increase quirk delay for USB devices
>    2d3ad4d1d46d USB: core: harden cdc_parse_cdc_header
>    58134902731a USB: uas: fix bug in handling of alternate settings
>    4fea0da59600 USB: devio: Don't corrupt user memory
>    14e7521b5253 USB: devio: Prevent integer overflow in proc_do_submiturb()
>    7b6d9826473c USB: dummy-hcd: Fix erroneous synchronization change
>    110b5cb4d9b4 USB: dummy-hcd: fix infinite-loop resubmission bug
>    86481bcda003 USB: dummy-hcd: fix connection failures (wrong speed)
>    4ffa59b1c5ef USB: cdc-wdm: ignore -EPIPE from GetEncapsulatedResponse
>    9faf2caf8cfa usb: pci-quirks.c: Corrected timeout values used in handshake
>    d039e3d01004 ALSA: usb-audio: Check out-of-bounds access by corrupted buffer descriptor
>    7c4a2bdf47db usb: renesas_usbhs: fix usbhsf_fifo_clear() for RX direction
>    928b7190418b usb: renesas_usbhs: fix the BCLR setting condition for non-DCP pipe
>    a6302dbe96dc usb-storage: fix bogus hardware error messages for ATA pass-thru devices
>    78b35c89cf5e usb-storage: unusual_devs entry to fix write-access regression for Seagate external drives
>    c2aafffef836 usb: gadget: udc: renesas_usb3: Fix return value of usb3_write_pipe()
>    3317d2d0ff4c usb: gadget: udc: renesas_usb3: fix Pn_RAMMAP.Pn_MPKT value
>    251a4b607db6 usb: gadget: udc: renesas_usb3: fix for no-data control transfer
>    3cb875dbac15 usb: gadget: udc: atmel: set vbus irqflags explicitly
>    21f8963948de USB: gadgetfs: fix copy_to_user while holding spinlock
>    57dddf4436e3 USB: gadgetfs: Fix crash caused by inadequate synchronization
>    13ac3ba437dd bpf: fix bpf_tail_call() x64 JIT
>    9377e85e3d96 net: rtnetlink: fix info leak in RTM_GETSTATS call
>    73229f01c713 socket, bpf: fix possible use after free
>    721915e62286 l2tp: fix l2tp_eth module loading
>    ef4721707447 tipc: use only positive error codes in messages
>    9b2249636b6e IPv4: early demux can return an error code
>    857c4b1f1004 ip6_tunnel: update mtu properly for ARPHRD_ETHER tunnel device in tx path
>    5222b3c935d8 ip6_gre: ip6gre_tap device should keep dst
>    59d0df52c04c netlink: do not proceed if dump's start() errs
>    cd53a041d929 net/mlx5e: IPoIB, Fix access to invalid memory address
>    6e2af86f894f net: Set sk_prot_creator when cloning sockets to the right proto
>    fd767b3c9282 net: dsa: mv88e6xxx: lock mutex when freeing IRQs
>    a9b7868d8603 packet: only test po->has_vnet_hdr once in packet_snd
>    49791a17d4f4 packet: in packet_do_bind, test fanout with bind_lock held
>    c45234f432ed tun: bail out from tun_get_user() if the skb is empty
>    f6a0ed8e5f3c l2tp: fix race condition in l2tp_tunnel_delete
>    b2861a38475a vti: fix use after free in vti_tunnel_xmit/vti6_tnl_xmit
>    b1c7b474de2d net: qcom/emac: specify the correct size when mapping a DMA buffer
>    366fcb432b12 net_sched: always reset qdisc backlog in qdisc_reset()
>    95cee692dafa isdn/i4l: fetch the ppp_write buffer in one shot
>    2f707d184b55 net: change skb->mac_header when Generic XDP calls adjust_head
>    53097ad73f85 bpf: one perf event close won't free bpf program attached by another perf event
>    f42a78ad68f6 packet: hold bind lock when rebinding to fanout hook
>    495589ad7efc net: ipv6: fix regression of no RTM_DELADDR sent after DAD failure
>    f8fcd8e80c6b net: emac: Fix napi poll list corruption
>    942383d73c7e tcp: fastopen: fix on syn-data transmit failure
>    b9156f4cbc05 8139too: revisit napi_complete_done() usage
>    c7da54ebfc21 net/sched: cls_matchall: fix crash when used with classful qdisc
>    d366a6d8fa78 ip6_tunnel: do not allow loading ip6_tunnel if ipv6 is disabled in cmdline
>    13b1a41fff28 net: phy: Fix mask value write on gmii2rgmii converter speed register
>    8786b0419353 ip6_gre: skb_push ipv6hdr before packing the header in ip6gre_header
>    4064c6617aca udpv6: Fix the checksum computation when HW checksum does not apply
>    8c1ca8be42a4 bpf/verifier: reject BPF_ALU64|BPF_END
>    8c8468276d86 tcp: update skb->skb_mstamp more carefully
>    6746b3e1e62f tcp: use tp->tcp_mstamp in output path
>    1708658272d8 sctp: potential read out of bounds in sctp_ulpevent_type_enabled()
>    4adf05c23f5d net: sched: fix use-after-free in tcf_action_destroy and tcf_del_walker
>    807813b1440a net_sched: gen_estimator: fix scaling error in bytes/packets samples
>    2280d8256b8f net: bonding: fix tlb_dynamic_lb default value
>    9ba28de2fb47 mlxsw: spectrum: Prevent mirred-related crash on removal
>    d843223f43a8 net: bonding: Fix transmit load balancing in balance-alb mode if specified by sysfs
>    1b7ddba95ec0 Linux 4.12.15
>    9d16c1a513c7 video: fbdev: aty: do not leak uninitialized padding in clk to userspace
>    bc94f3c025d3 KVM: VMX: use cmpxchg64
>    cea4b7ad6495 KVM: VMX: remove WARN_ON_ONCE in kvm_vcpu_trigger_posted_interrupt
>    4cebefacc13f KVM: VMX: do not change SN bit in vmx_update_pi_irte()
>    5a44051221c3 x86/mm: Fix fault error path using unsafe vma pointer
>    d791f8cc082d PM / OPP: Call notifier without holding opp_table->lock
>    8fa3761f3899 btrfs: prevent to set invalid default subvolid
>    8b7eb4320d6e btrfs: propagate error to btrfs_cmp_data_prepare caller
>    66fff45ff37a btrfs: finish ordered extent cleaning if no progress is found
>    d382eb1c62d7 btrfs: clear ordered flag on cleaning up ordered extents
>    61f18171d910 btrfs: fix NULL pointer dereference from free_reloc_roots()
>    3f619f467ff2 PCI: Fix race condition with driver_override
>    8420e1f0af47 md: separate request handling
>    12319e7484d2 md: fix a race condition for flush request handling
>    e676df0b1216 futex: Fix pi_state->owner serialization
>    b36416a27475 etnaviv: fix gem object list corruption
>    691ffb4f0df4 etnaviv: fix submit error path
>    a84cfcb017eb mtd: nand: atmel: fix buffer overflow in atmel_pmecc_user
>    10abcdf16087 sched/sysctl: Check user input value of sysctl_sched_time_avg
>    5419de995f66 xfs: validate bdev support for DAX inode flag
>    1e278dd0b455 kvm: nVMX: Don't allow L2 to access the hardware CR8
>    25d709528376 KVM: VMX: Do not BUG() on out-of-bounds guest IRQ
>    1b5878780e93 kvm/x86: Handle async PF in RCU read-side critical sections
>    acc5982be80a KVM: VMX: simplify and fix vmx_vcpu_pi_load
>    1c16ff161d31 KVM: VMX: avoid double list add with VT-d posted interrupts
>    0a43cc31678e KVM: VMX: extract __pi_post_block
>    e7eb9c1ba767 arm64: fault: Route pte translation faults via do_translation_fault
>    7babcf8e63c1 arm64: mm: Use READ_ONCE when dereferencing pointer to pte table
>    38085d92217f arm64: Make sure SPsel is always set
>    94a2d9d24d33 seccomp: fix the usage of get/put_seccomp_filter() in seccomp_get_filter()
>    65185bc520d1 selftests/seccomp: Support glibc 2.26 siginfo_t.h
>    fc5162ded95e extable: Enable RCU if it is not watching in kernel_text_address()
>    e022bf93a924 extable: Consolidate *kernel_text_address() functions
>    6d755f70dff5 mmc: sdhci-pci: Fix voltage switch for some Intel host controllers
>    c2125202b46c rcu: Allow for page faults in NMI handlers
>    0b4ff86ce0a2 iw_cxgb4: put ep reference in pass_accept_req()
>    70f0bf226a5e iw_cxgb4: remove the stid on listen create failure
>    c39cd8c519dd iw_cxgb4: drop listen destroy replies if no ep found
>    48a056a511a4 bsg-lib: don't free job in bsg_prepare_job
>    0f4a3495da6a gfs2: Fix debugfs glocks dump
>    5284e4435c06 brd: fix overflow in __brd_direct_access
>    da1b0075cf0c nl80211: check for the required netlink attributes presence
>    f5231169840c vfs: Return -ENXIO for negative SEEK_HOLE / SEEK_DATA offsets
>    98da77ff8eb5 SMB3: Don't ignore O_SYNC/O_DSYNC and O_DIRECT flags
>    60746c15130d SMB3: handle new statx fields
>    f874292f3df8 SMB: Validate negotiate (to protect against downgrade) even if signing off
>    274d2957576d SMB3: Warn user if trying to sign connection that authenticated as guest
>    69543984ef44 Fix SMB3.1.1 guest authentication to Samba
>    848c26a04de0 Revert "IB/ipoib: Update broadcast object if PKey value was changed in index 0"
>    df3f543b639e PM: core: Fix device_pm_check_callbacks()
>    65bee7492116 s390/mm: fix write access check in gup_huge_pmd()
>    b0b70437296e s390/mm: make pmdp_invalidate() do invalidation only
>    3d8166e70730 s390/perf: fix bug when creating per-thread event
>    5887ff9cbff2 MIPS: Fix perf event init
>    ef9d7b3442ab powerpc/pseries: Fix parent_dn reference leak in add_dt_node()
>    0970872dc16c KEYS: prevent KEYCTL_READ on negative key
>    7427f0ec5e24 KEYS: prevent creating a different user's keyrings
>    535c77f6cc0c KEYS: fix writing past end of user-supplied buffer in keyring_read()
>    65e577e5d218 security/keys: rewrite all of big_key crypto
>    6e4990d8d226 random: add get_random_{bytes,u32,u64,int,long,once}_wait family
>    20543a488913 random: add wait_for_random_bytes() API
>    37e408cf708d security/keys: properly zero out sensitive key material in big_key
>    a25aa12be307 crypto: talitos - fix hashing
>    e2a61a9c8de8 crypto: talitos - fix sha224
>    deea80b71ca1 crypto: talitos - Don't provide setkey for non hmac hashing algs.
>    42b449e1e74b crypto: drbg - fix freeing of resources
>    60b92951710b drm/radeon: disable hard reset in hibernate for APUs
>    b9e88e67fa58 Revert "drm/i915/bxt: Disable device ready before shutdown command"
>    3f97a3dc28cc drm/i915/gvt: Fix incorrect PCI BARs reporting
>    5cde5ed0e3e9 scsi: aacraid: Fix 2T+ drives on SmartIOC-2000
>    31fe32c4c118 scsi: scsi_transport_iscsi: fix the issue that iscsi_if_rx doesn't parse nlmsg properly
>    b051b4ae9e6a md/raid5: preserve STRIPE_ON_UNPLUG_LIST in break_stripe_batch_list
>    58b050319933 md/raid5: fix a race condition in stripe batch
>    805f300c67bd tracing: Remove RCU work arounds from stack tracer
>    682542006df3 tracing: Erase irqsoff trace with empty write
>    82306dc328b9 tracing: Fix trace_pipe behavior for instance traces
>    dbc8d3db80a1 KVM: PPC: Book3S HV: Hold kvm->lock around call to kvmppc_update_lpcr
>    ffd067e2cbb0 genirq/msi: Fix populating multiple interrupts
>    aab5f168d7c6 genirq: Make sparse_irq_lock protect what it should protect
>    dac8a5354b20 mac80211: flush hw_roc_start work before cancelling the ROC
>    f6dc54e4edf3 mac80211_hwsim: Use proper TX power
>    e991455baa63 mac80211: fix VLAN handling with TXQs
>    3722540c8cb3 scsi: scsi_transport_fc: fix NULL pointer dereference in fc_bsg_job_timeout
>    71a7d27fd864 fs/proc: Report eip/esp in /prod/PID/stat for coredumping
>    3941feee3478 cifs: release auth_key.response for reconnect.
>    86806e1ac9ab cifs: release cifs root_cred after exit_cifs
>    0de25f7acd91 cifs: check rsp for NULL before dereferencing in SMB2_open
>    8737eec0e579 sched/cpuset/pm: Fix cpuset vs. suspend-resume bugs
>    a3f1d53c1c2b bcache: fix bch_hprint crash and improve output
>    0fa332456800 bcache: fix for gc and write-back race
>    6ec401ab79a1 bcache: fix sequential large write IO bypass
>    273676b9a143 bcache: Correct return value for sysfs attach errors
>    d8cc6ff5d172 bcache: correct cache_dirty_target in __update_writeback_rate()
>    64a03d02ce82 bcache: do not subtract sectors_to_gc for bypassed IO
>    bec155f8ae9b bcache: Fix leak of bdev reference
>    809094f51397 bcache: initialize dirty stripes in flash_dev_run()
>    6c2a71ced908 ALSA: seq: Cancel pending autoload work at unbinding device
>    c29f8277f34c PM / devfreq: Fix memory leak when fail to register device
>    2872fe22451a media: adv7180: add missing adv7180cp, adv7180st i2c device IDs
>    c84111b698c8 media: uvcvideo: Prevent heap overflow when accessing mapped controls
>    56575dd7a0ed media: v4l2-compat-ioctl32: Fix timespec conversion
>    bb6ccacff00c s390/mm: fix race on mm->context.flush_mm
>    7b33ee224620 s390/mm: fix local TLB flushing vs. detach of an mm address space
>    e2813581906a net/netfilter/nf_conntrack_core: Fix net_conntrack_lock()
>    77f420b4d792 PCI: pciehp: Report power fault only once until we clear it
>    a58bbffad34d PCI: shpchp: Enable bridge bus mastering if MSI is enabled
>    9caa334f7158 ARC: Re-enable MMU upon Machine Check exception
>    fceed125b7a5 tracing: Apply trace_clock changes to instance max buffer
>    e183b93ae81e tracing: Add barrier to trace_printk() buffer nesting modification
>    b9b3fa21babe ftrace: Fix memleak when unregistering dynamic ops when tracing disabled
>    82e12dcbfd1f ftrace: Fix selftest goto location on error
>    5ab726174eae ftrace: Fix debug preempt config name in stack_tracer_{en,dis}able
>    59ce93476f82 mailbox: bcm-flexrm-mailbox: Fix mask used in CMPL_START_ADDR_VALUE()
>    ddaf72eb0d17 scsi: qla2xxx: Fix an integer overflow in sysfs code
>    f74974648540 scsi: qla2xxx: Use fabric name for Get Port Speed command
>    b4cb86cdb179 scsi: qla2xxx: Use BIT_6 to acquire FAWWPN from switch
>    432d773132a5 scsi: qla2xxx: Correction to vha->vref_count timeout
>    6fa7602be640 scsi: sg: fixup infoleak when using SG_GET_REQUEST_TABLE
>    d55c1d09656d scsi: sg: Re-fix off by one in sg_fill_request_table()
>    3992966852f4 scsi: sg: factor out sg_fill_request_table()
>    c15de6f030a9 scsi: storvsc: fix memory leak on ring buffer busy
>    3c710fb3c2a0 scsi: megaraid_sas: Return pended IOCTLs with cmd_status MFI_STAT_WRONG_STATE in case adapter is dead
>    8323a8af45f4 scsi: megaraid_sas: Check valid aen class range to avoid kernel panic
>    b06876d957af scsi: megaraid_sas: set minimum value of resetwaittime to be 1 secs
>    a128d0520218 scsi: megaraid_sas: mismatch of allocated MFI frame size and length exposed in MFI MPT pass through command
>    d3065824b5d8 scsi: aacraid: Fix command send race condition
>    9ef86a2c2f9c scsi: qedi: off by one in qedi_get_cmd_from_tid()
>    991a1a973948 scsi: zfcp: trace high part of "new" 64 bit SCSI LUN
>    7373c36cf075 scsi: zfcp: trace HBA FSF response by default on dismiss or timedout late response
>    2bfe5894d999 scsi: zfcp: fix payload with full FCP_RSP IU in SCSI trace records
>    c679798f4383 scsi: zfcp: fix missing trace records for early returns in TMF eh handlers
>    d456a6a7eba5 scsi: zfcp: fix passing fsf_req to SCSI trace on TMF to correlate with HBA
>    c3542a2687e4 scsi: zfcp: fix capping of unsuccessful GPN_FT SAN response trace records
>    159e38c80f1c scsi: zfcp: add handling for FCP_RESID_OVER to the fcp ingress path
>    c6c3b0a8f550 scsi: zfcp: fix queuecommand for scsi_eh commands when DIX enabled
>    c3df0e8d390b skd: Submit requests to firmware before triggering the doorbell
>    90b434ca7fd1 skd: Avoid that module unloading triggers a use-after-free
>    d850e6fbdea2 md/bitmap: disable bitmap_resize for file-backed bitmaps.
>    aee5be4e0cf6 md/bitmap: copy correct data for bitmap super
>    ee6afcd47b63 block: directly insert blk-mq request from blk_insert_cloned_request()
>    4dfcf18b9669 block: Relax a check in blk_start_queue()
>    dd7a87a9600e powerpc: Fix DAR reporting when alignment handler faults
>    4ccf03cf6796 powerpc/pseries: Don't attempt to acquire drc during memory hot add for assigned lmbs
>    57a7853a3297 powerpc/powernv/npu: Move tlb flush before launching ATSD
>    fce49edeb7b8 cxl: Fix driver use count
>    adcbc87965eb ext4: fix quota inconsistency during orphan cleanup for read-only mounts
>    6d8326041868 ext4: fix incorrect quotaoff if the quota feature is enabled
>    699ec491aa59 ext4: in ext4_seek_{hole,data}, return -ENXIO for negative offsets
>    b9aa3e877bea wcn36xx: Introduce mutual exclusion of fw configuration
>    b51f1d0bed48 regulator: cpcap: Fix standby mode
>    961497c9322b crypto: AF_ALG - remove SGL terminator indicator when chaining
>    e66082e0af79 crypto: caam/qi - properly set IV after {en,de}crypt
>    be48e355e2b0 crypto: caam/qi - fix typo in authenc alg driver name
>    c1b0aa5e489e crypto: scompress - don't sleep with preemption disabled
>    bedc673ee431 crypto: ccp - Fix XTS-AES-128 support on v5 CCPs
>    32bb68256227 docs: disable KASLR when debugging kernel
>    ebb451616d95 MIPS: math-emu: <MADDF|MSUBF>.D: Fix accuracy (64-bit case)
>    8a9e0b68b344 MIPS: math-emu: <MADDF|MSUBF>.S: Fix accuracy (32-bit case)
>    f1045424c538 MIPS: math-emu: <MADDF|MSUBF>.<D|S>: Clean up "maddf_flags" enumeration
>    db1ba5de2711 MIPS: math-emu: <MADDF|MSUBF>.<D|S>: Fix some cases of zero inputs
>    b9891c4cf672 MIPS: math-emu: <MADDF|MSUBF>.<D|S>: Fix some cases of infinite inputs
>    12ab5ebcc3f3 MIPS: math-emu: <MADDF|MSUBF>.<D|S>: Fix NaN propagation
>    b3a6ac0d63b6 MIPS: math-emu: MINA.<D|S>: Fix some cases of infinity and zero inputs
>    797910efa67c MIPS: math-emu: <MAXA|MINA>.<D|S>: Fix cases of both infinite inputs
>    32401438ab1c MIPS: math-emu: <MAXA|MINA>.<D|S>: Fix cases of input values with opposite signs
>    b4095004e721 MIPS: math-emu: <MAX|MIN>.<D|S>: Fix cases of both inputs negative
>    47e062700023 MIPS: math-emu: <MAX|MAXA|MIN|MINA>.<D|S>: Fix cases of both inputs zero
>    9db3b8a2ffed MIPS: math-emu: <MAX|MAXA|MIN|MINA>.<D|S>: Fix quiet NaN propagation
>    c8b054b62131 Input: i8042 - add Gigabyte P57 to the keyboard reset table
>    39d29eb95f64 pinctrl/amd: save pin registers over suspend/resume
>    b36d90f0b2fb pinctrl: samsung: Fix NULL pointer exception on external interrupts on S3C24xx
>    b098a309db19 pinctrl: samsung: Fix invalid register offset used for Exynos5433 external interrupts
>    a6a33ff37c4c tty: improve tty_insert_flip_char() slow path
>    d584d1580fc4 tty: improve tty_insert_flip_char() fast path
>    361c23e37c1f drm/amdgpu: read reg in each iterator of psp_wait_for loop
>    c29802eb2b14 Input: xpad - validate USB endpoint type during probe
>    f56b7f2bf63e smp/hotplug: Handle removal correctly in cpuhp_store_callbacks()
>    c4705a91ac8f srcu: Provide ordering for CPU not involved in grace period
>    7ac16054fc2b IB/mlx5: Fix cached MR allocation flow
>    1183d4d2624c IB/{qib, hfi1}: Avoid flow control testing for RDMA write operation
>    3e5ed45a45e0 IB/hfi1: Revert egress pkey check enforcement
>    1994169a2b63 <linux/uaccess.h>: Fix copy_in_user() declaration
>    f8d5b811ae66 orangefs: Don't clear SGID when inheriting ACLs
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
>  meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++++++++----------
>  3 files changed, 16 insertions(+), 16 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> index abd25a87f85b..6431ffbfe342 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
> @@ -11,13 +11,13 @@ python () {
>          raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
>  }
>  
> -SRCREV_machine ?= "55000a68d7b8ba26ce1733d48f9efa384528e67c"
> -SRCREV_meta ?= "b9735e238841b9932bb324e8b4d9fb536d812ed1"
> +SRCREV_machine ?= "1a58be8c58386b680d6086ca527acf5c6d173a74"
> +SRCREV_meta ?= "146a863c246f803a074a5abc12e69737bc6751b2"
>  
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
>  
> -LINUX_VERSION ?= "4.12.14"
> +LINUX_VERSION ?= "4.12.16"
>  
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>  
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
> index 68d5a8ad85a3..2e749950654e 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
> @@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
>  
>  require recipes-kernel/linux/linux-yocto.inc
>  
> -LINUX_VERSION ?= "4.12.14"
> +LINUX_VERSION ?= "4.12.16"
>  
>  KMETA = "kernel-meta"
>  KCONF_BSP_AUDIT_LEVEL = "2"
>  
> -SRCREV_machine ?= "0b17e1b52f9953a5672890e478de94ac8c44775f"
> -SRCREV_meta ?= "b9735e238841b9932bb324e8b4d9fb536d812ed1"
> +SRCREV_machine ?= "42a33c00cd35d9de9566488bcedd01d9c6b0ab03"
> +SRCREV_meta ?= "146a863c246f803a074a5abc12e69737bc6751b2"
>  
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>  
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> index a45d90bfaf2c..20e2fd37957f 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> @@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
>  KBRANCH_qemux86-64 ?= "standard/base"
>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
>  
> -SRCREV_machine_qemuarm ?= "b6b85e6055b8af3ef9a8e74f4edb5c0a69bd031b"
> -SRCREV_machine_qemuarm64 ?= "0b17e1b52f9953a5672890e478de94ac8c44775f"
> -SRCREV_machine_qemumips ?= "788655446537fbf4a7c7cb720b4ea3dfa0ca9d20"
> -SRCREV_machine_qemuppc ?= "0b17e1b52f9953a5672890e478de94ac8c44775f"
> -SRCREV_machine_qemux86 ?= "0b17e1b52f9953a5672890e478de94ac8c44775f"
> -SRCREV_machine_qemux86-64 ?= "0b17e1b52f9953a5672890e478de94ac8c44775f"
> -SRCREV_machine_qemumips64 ?= "d3f5808a2f7787e02057df9fea1fa97fb939fd6c"
> -SRCREV_machine ?= "0b17e1b52f9953a5672890e478de94ac8c44775f"
> -SRCREV_meta ?= "b9735e238841b9932bb324e8b4d9fb536d812ed1"
> +SRCREV_machine_qemuarm ?= "d28b66327c41ded21f49bd1b4bf35e8d3a5684c3"
> +SRCREV_machine_qemuarm64 ?= "42a33c00cd35d9de9566488bcedd01d9c6b0ab03"
> +SRCREV_machine_qemumips ?= "2e6d1d8f4d63400aac07dcadfd94c1337d4b7e2f"
> +SRCREV_machine_qemuppc ?= "42a33c00cd35d9de9566488bcedd01d9c6b0ab03"
> +SRCREV_machine_qemux86 ?= "42a33c00cd35d9de9566488bcedd01d9c6b0ab03"
> +SRCREV_machine_qemux86-64 ?= "42a33c00cd35d9de9566488bcedd01d9c6b0ab03"
> +SRCREV_machine_qemumips64 ?= "5ad067fb6b042cc68252ba746a244d7a97be75fc"
> +SRCREV_machine ?= "42a33c00cd35d9de9566488bcedd01d9c6b0ab03"
> +SRCREV_meta ?= "146a863c246f803a074a5abc12e69737bc6751b2"
>  
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
>  
> -LINUX_VERSION ?= "4.12.14"
> +LINUX_VERSION ?= "4.12.16"
>  
>  PV = "${LINUX_VERSION}+git${SRCPV}"
>  


