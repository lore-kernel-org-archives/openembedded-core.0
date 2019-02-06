Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f176.google.com (mail-it1-f176.google.com
	[209.85.166.176])
	by mail.openembedded.org (Postfix) with ESMTP id B87A77BD97
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Feb 2019 19:50:46 +0000 (UTC)
Received: by mail-it1-f176.google.com with SMTP id z20so9045807itc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 11:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MUjE+Ig5QcuHflgNlfZdWit9gp+hdhgE2wTR45PWexg=;
	b=Ae58esw4b6QGSUqiooF21c08/B+8tpuKKA6t5GxnRtVg8vEsJ18/tbAfeUZaYTiv9p
	pZvcxiXY5/LZh2Wev8GdD6iJas42NYmGKfnK21kggcAaAojiI6dP5HI2y6pk6RREDp8j
	MjCH8zBx0lbPZRCDnn9fEu6EfJE9/nTu8Yct2ei9Bj8j+D4mAsAeF5KIvAZOEHOnlwvK
	KKJKNuHGZmBmGeY776+4MwNXpl5eEx70lY1IiK6L/GuzSLm7qaJh14N0WMB0acnhPL8u
	bP51C2lONrDddm+XI0E/wWY8g/mxR53ilPxsRgbhOUKp6+hJtO9B2r9zeTXDc5RXUVmL
	frBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MUjE+Ig5QcuHflgNlfZdWit9gp+hdhgE2wTR45PWexg=;
	b=gvySNmF6Fn/o9eFcaAc305a5BPsaScj6S7pbFgA4ARvhsfQZGUuifPQlJDHdT0AGJQ
	9mdNXP51mtsEWBSyQ1tzE4VMAo2yJH7fTMECacSQVq/E8hVgEcjOJ3qxIOVxCiN/po5N
	CH1VvY9oTINh1RlBFoGa+zAAvcp8NFjn0hqNjJ5d5KUjg4SNbbfLkdPHovvk20rfFq0/
	1koEtv7r5RGfp5LrKm38UTnFd/TWhLz+0oqfoQw1GuB/us3LKRUIJ5j25jDoRj3xersn
	ZaaQ25SlUWVqt/pIZYGfKsmGhPIhk5YXwKKAKDw33C3IcFzGjQsuTmtd6TJgIKbPSkrA
	XhAA==
X-Gm-Message-State: AHQUAuYtBQY/G3i/e1evgBP4wlhwtt2yBnyl0b4ACmhhxZnAcovNGwa+
	IratsbF+XT4ufsMjDUBg3Z9ivuuwHmTkyA==
X-Google-Smtp-Source: AHgI3IZO1Mj9IfZHV1JenCYZtF5e+//BYCg9dF407MvBwThGHj0z7k6qCFPTOFuDuyTzSJUmDxvhiw==
X-Received: by 2002:a24:26c4:: with SMTP id v187mr3448606itv.54.1549482646994; 
	Wed, 06 Feb 2019 11:50:46 -0800 (PST)
Received: from localhost.localdomain ([174.116.254.195])
	by smtp.gmail.com with ESMTPSA id
	w26sm3302983iol.60.2019.02.06.11.50.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Feb 2019 11:50:46 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  6 Feb 2019 19:50:40 +0000
Message-Id: <898a09cc9b4af16fd3f8b5393e7d9959acb3d511.1549481175.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1549481175.git.bruce.ashfield@gmail.com>
References: <cover.1549481175.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] linux-yocto/4.19: update to v4.19.19
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
X-List-Received-Date: Wed, 06 Feb 2019 19:50:47 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the korg -stable updates that comprise the following
commits:

   dffbba4348e9 Linux 4.19.19
   3a3b6a6b15db Input: input_event - fix the CONFIG_SPARC64 mixup
   d4a6ac28d44a ide: fix a typo in the settings proc file name
   25ad17d692ad usb: dwc3: gadget: Clear req->needs_extra_trb flag on cleanup
   6bab957396ce Revert "mm, memory_hotplug: initialize struct pages for the full memory section"
   7dbf12973d53 nvmet-rdma: fix null dereference under heavy load
   fa9184be67a6 nvmet-rdma: Add unlikely for response allocated check
   48046a0177e6 s390/smp: Fix calling smp_call_ipl_cpu() from ipl CPU
   37c9e3ee4239 bpf: fix inner map masking to prevent oob under speculation
   eed84f94ff8d bpf: fix sanitation of alu op with pointer / scalar type from different paths
   f92a819b4cbe bpf: prevent out of bounds speculation on pointer arithmetic
   4f7f708d0e6c bpf: fix check_map_access smin_value test when pointer contains offset
   44f8fc649980 bpf: restrict unknown scalars of mixed signed bounds for unprivileged
   5332dda94f63 bpf: restrict stack pointer arithmetic for unprivileged
   9e57b2969d4a bpf: restrict map value pointer arithmetic for unprivileged
   232ac70dd38b bpf: enable access to ax register also from verifier rewrite
   b855e3103740 bpf: move tmp variable into ax register in interpreter
   333a31c89ae2 bpf: move {prev_,}insn_idx into verifier env
   437112946263 bpf: add per-insn complexity limit
   7da6cd690c43 bpf: improve verifier branch analysis
   ce8d0581ae33 drm/meson: Fix atomic mode switching regression
   8b4dffe8261a vt: invoke notifier on screen size change
   18ef43def81c vt: always call notifier with the console lock held
   855f7e64169f vt: make vt_console_print() compatible with the unicode screen buffer
   6f4f2a443d87 can: flexcan: fix NULL pointer exception during bringup
   576f474fb2d3 can: bcm: check timer values before ktime conversion
   8d85aa96c54b can: dev: __can_get_echo_skb(): fix bogous check for non-existing skb by removing it
   bdcf74e735b1 irqchip/gic-v3-its: Align PCI Multi-MSI allocation on their size
   6f4db68ab5ce net: sun: cassini: Cleanup license conflict
   21c0d1621b8d posix-cpu-timers: Unbreak timer rearming
   dd085f9b1dc1 x86/entry/64/compat: Fix stack switching for XEN PV
   ed334be9c2ed x86/kaslr: Fix incorrect i8254 outb() parameters
   334c0e1b3cdd x86/selftests/pkeys: Fork() to check for state being preserved
   db01b8d40feb x86/pkeys: Properly copy pkey state at fork()
   f9203cd03125 KVM/nVMX: Do not validate that posted_intr_desc_addr is page aligned
   d58f5e638b18 kvm: x86/vmx: Use kzalloc for cached_vmcs12
   bbb8c5c75f6e KVM: x86: WARN_ONCE if sending a PV IPI returns a fatal error
   b2598858ac21 KVM: x86: Fix PV IPIs for 32-bit KVM host
   6d3dabbdf46e KVM: x86: Fix single-step debugging
   c1bfae340367 drm/amdgpu: Add APTX quirk for Lenovo laptop
   b911f1dcb60d dm crypt: fix parsing of extended IV arguments
   5b779f841773 dm thin: fix passdown_double_checking_shared_status()
   eba68bd45672 scsi: ufs: Use explicit access size in ufshcd_dump_regs
   b18931c5fe0d acpi/nfit: Fix command-supported detection
   3cb00cfa3d37 acpi/nfit: Block function zero DSMs
   92fbac528fd0 Input: uinput - fix undefined behavior in uinput_validate_absinfo()
   71b1af87749b Input: input_event - provide override for sparc64
   865a07956db5 Input: xpad - add support for SteelSeries Stratus Duo
   06d9f987201f smb3: add credits we receive from oplock/break PDUs
   779c65bb7739 CIFS: Do not reconnect TCP session in add_credits()
   2ae6fedbd5cb CIFS: Fix credit calculation for encrypted reads with errors
   0380ed9b1cd3 CIFS: Fix credits calculations for reads with errors
   07b9e5e35e8f CIFS: Fix possible hang during async MTU reads and writes
   f4abbb16ed9a vgacon: unconfuse vc_origin when using soft scrollback
   a912e16faeda Drivers: hv: vmbus: Check for ring when getting debug info
   bfe482b9b299 hv_balloon: avoid touching uninitialized struct page during tail onlining
   71d1a74f36a7 tty/n_hdlc: fix __might_sleep warning
   6d15ef2c912a uart: Fix crash in uart_write and uart_put_char
   80250b48803a tty: Handle problem if line discipline does not have receive_buf
   3209eeded863 staging: rtl8188eu: Add device code for D-Link DWA-121 rev B1
   75a08b9a0fcb mmc: meson-gx: Free irq in release() callback
   4a559dfe6603 mmc: dw_mmc-bluefield: : Fix the license information
   d3faea2d152e char/mwave: fix potential Spectre v1 vulnerability
   0479bdbf55d8 misc: ibmvsm: Fix potential NULL pointer dereference
   049c7b068dd1 s390/smp: fix CPU hotplug deadlock with CPU rescan
   e0d573a08f23 s390/early: improve machine detection
   b563764443a3 s390/mm: always force a load of the primary ASCE on context switch
   8cbca17381ac ARC: perf: map generic branches to correct hardware condition
   2f0d2f3ace1f ARC: adjust memblock_reserve of kernel memory
   7bb78e62f712 ARCv2: lib: memeset: fix doing prefetchw outside of buffer
   cf662d989425 ALSA: hda - Add mute LED support for HP ProBook 470 G5
   2173f5a1b0d7 ALSA: hda/realtek - Fix typo for ALC225 model
   a719cbe07847 inotify: Fix fd refcount leak in inotify_add_watch().
   afb4a7ca7818 clk: socfpga: stratix10: fix naming convention for the fixed-clocks
   cf8ea8d536a4 clk: socfpga: stratix10: fix rate calculation for pll clocks
   0af64fda917d ASoC: tlv320aic32x4: Kernel OOPS while entering DAPM standby mode
   4fedd516d554 ASoC: rt5514-spi: Fix potential NULL pointer dereference
   d6847f539bd6 ASoC: atom: fix a missing check of snd_pcm_lib_malloc_pages
   3e05ceedf143 ceph: clear inode pointer when snap realm gets dropped by its inode
   8e7320b9f551 USB: serial: pl2303: add new PID to support PL2303TB
   4d984aab54a6 USB: serial: simple: add Motorola Tetra TPG2200 device id
   a70e5cd09361 USB: leds: fix regression in usbport led trigger
   f8982204cbea mei: me: add denverton innovation engine device IDs
   adfda26bdf47 mei: me: mark LBG devices as having dma support
   2cade15d58ca tcp: allow MSG_ZEROCOPY transmission also in CLOSE_WAIT state
   6c4d069aec0f ip6_gre: update version related info when changing link
   c9fe9d194d45 net: phy: marvell: Fix deadlock from wrong locking
   552cd931b483 erspan: build the header with the right proto according to erspan_ver
   0449da6fc203 ip6_gre: fix tunnel list corruption for x-netns
   e3fa624ee7af udp: with udp_segment release on error path
   84bf74307c88 net/sched: cls_flower: allocate mask dynamically in fl_change()
   bdafc159ac8c mlxsw: pci: Ring CQ's doorbell before RDQ's
   c82f4684d330 mlxsw: spectrum_fid: Update dummy FID index
   adbf7e580994 net: ipv4: Fix memory leak in network namespace dismantle
   bc4e2300e44a mlxsw: pci: Increase PCI SW reset timeout
   1688e75cae7d vhost: log dirty page correctly
   3d997bf0074e openvswitch: Avoid OOB read when parsing flow nlattrs
   916c27c8cf88 net_sched: refetch skb protocol for each filter
   02239e797ac7 net/sched: act_tunnel_key: fix memory leak in case of action replace
   3e4cd0677715 net: phy: mdio_bus: add missing device_del() in mdiobus_register() error handling
   1a864e38b39e net: phy: marvell: Errata for mv88e6390 internal PHYs
   40f2f08030fa net: Fix usage of pskb_trim_rcsum
   e287968a3837 net: bridge: Fix ethernet header pointer before check skb forwardable
   779a5077d9cf amd-xgbe: Fix mdio access for non-zero ports and clause 45 PHYs
   34ae65724615 Linux 4.19.18
   b40aec33eeb5 ipmi: Don't initialize anything in the core until something uses it
   031a94ff8ac4 ipmi:ssif: Fix handling of multi-part return messages
   821a003d8e81 ipmi: Prevent use-after-free in deliver_response
   753abe2a6339 ipmi: msghandler: Fix potential Spectre v1 vulnerabilities
   1c393ca118cf ipmi: fix use-after-free of user->release_barrier.rda
   7557895b3dda Bluetooth: Fix unnecessary error message for HCI request completion
   d9bcbcb7d77c iwlwifi: mvm: Send LQ command as async when necessary
   0d73e773edc9 mm, proc: be more verbose about unstable VMA flags in /proc/<pid>/smaps
   2011eb741803 userfaultfd: clear flag if remap event not enabled
   b0cd52e644ef mm/swap: use nr_node_ids for avail_lists in swap_info_struct
   dc15e3fd3fbe mm/page-writeback.c: don't break integrity writeback on ->writepage() error
   5a404f39f8fa ocfs2: fix panic due to unrecovered local alloc
   c9dcb871b1a9 iomap: don't search past page end in iomap_is_partially_uptodate
   00886cebcce5 scsi: megaraid: fix out-of-bound array accesses
   d640fb10cab4 scsi: smartpqi: call pqi_free_interrupts() in pqi_shutdown()
   dd619b90dd71 ath10k: fix peer stats null pointer dereference
   ca8ad9bcbebd scsi: smartpqi: correct lun reset issues
   868152e4ca97 scsi: mpt3sas: fix memory ordering on 64bit writes
   6fa75685aa3a IB/usnic: Fix potential deadlock
   a13daf038b49 sysfs: Disable lockdep for driver bind/unbind files
   959bf5c190ea ALSA: bebob: fix model-id of unit for Apogee Ensemble
   c5e68453be0c Bluetooth: btusb: Add support for Intel bluetooth device 8087:0029
   887b1c9a7d17 dm: Check for device sector overflow if CONFIG_LBDAF is not set
   decca9bc2116 clocksource/drivers/integrator-ap: Add missing of_node_put()
   876b79b973f2 quota: Lock s_umount in exclusive mode for Q_XQUOTA{ON,OFF} quotactls.
   77f14a495530 perf tools: Add missing open_memstream() prototype for systems lacking it
   e2a1f8d695c2 perf tools: Add missing sigqueue() prototype for systems lacking it
   4bc4b575131f perf cs-etm: Correct packets swapping in cs_etm__flush()
   9e5be33b1061 dm snapshot: Fix excessive memory usage and workqueue stalls
   d9513fdbeb62 tools lib subcmd: Don't add the kernel sources to the include path
   8603cac28a78 perf stat: Avoid segfaults caused by negated options
   cbd257f3bbc9 dm kcopyd: Fix bug causing workqueue stalls
   4e26ee3149e4 dm crypt: use u64 instead of sector_t to store iv_offset
   a4772e8b3e60 x86/topology: Use total_cpus for max logical packages calculation
   9d51378a6893 netfilter: ipt_CLUSTERIP: fix deadlock in netns exit routine
   bb7b6c49cc34 netfilter: ipt_CLUSTERIP: remove wrong WARN_ON_ONCE in netns exit routine
   744383c88e2e netfilter: ipt_CLUSTERIP: check MAC address when duplicate config is set
   bd1040e646d6 perf vendor events intel: Fix Load_Miss_Real_Latency on SKL/SKX
   58c67a0b06a7 perf parse-events: Fix unchecked usage of strncpy()
   b332b4cd25e7 perf svghelper: Fix unchecked usage of strncpy()
   f54fc4c23eea perf tests ARM: Disable breakpoint tests 32-bit
   c3e8c335e788 perf intel-pt: Fix error with config term "pt=0"
   f74fc96e32ab tty/serial: do not free trasnmit buffer page under port lock
   310f8296d630 btrfs: improve error handling of btrfs_add_link
   38b17eee7074 btrfs: fix use-after-free due to race between replace start and cancel
   720b86a53a10 btrfs: alloc_chunk: fix more DUP stripe size handling
   bb5717a4a165 btrfs: volumes: Make sure there is no overlap of dev extents at mount time
   c21991ed17e9 mmc: atmel-mci: do not assume idle after atmci_request_end
   461991104dcb kconfig: fix memory leak when EOF is encountered in quotation
   ba8efcdc5779 kconfig: fix file name and line number of warn_ignored_character()
   344b51e7ce13 bpf: relax verifier restriction on BPF_MOV | BPF_ALU
   dfbf8c981f83 arm64: Fix minor issues with the dcache_by_line_op macro
   73f0b2e36e40 clk: imx6q: reset exclusive gates on init
   8f183b332398 arm64: kasan: Increase stack size for KASAN_EXTRA
   656257cf1cbd selftests: do not macro-expand failed assertion expressions
   3ad8148ce042 scsi: target/core: Make sure that target_wait_for_sess_cmds() waits long enough
   25d3546acd60 scsi: target: use consistent left-aligned ASCII INQUIRY data
   50deccdceb59 net: call sk_dst_reset when set SO_DONTROUTE
   fd4c7fe100fc staging: erofs: fix use-after-free of on-stack `z_erofs_vle_unzip_io'
   38be2cbae300 media: venus: core: Set dma maximum segment size
   9df6861a35d1 ASoC: use dma_ops of parent device for acp_audio_dma
   597a09e0ce2c media: firewire: Fix app_info parameter type in avc_ca{,_app}_info
   3049cdc28409 powerpc/pseries/cpuidle: Fix preempt warning
   115a0d668793 powerpc/xmon: Fix invocation inside lock region
   819e2e0760f3 media: uvcvideo: Refactor teardown of uvc on USB disconnect
   265242d82a3c pstore/ram: Do not treat empty buffers as valid
   ed99d79a158c clk: imx: make mux parent strings const
   c356972f27cc jffs2: Fix use of uninitialized delayed_work, lockdep breakage
   50063ba9dd51 efi/libstub: Disable some warnings for x86{,_64}
   fded1b0e0c89 rxe: IB_WR_REG_MR does not capture MR's iova field
   e34e54f925e2 drm/amdgpu: Reorder uvd ring init before uvd resume
   4614fe394c55 scsi: qedi: Check for session online before getting iSCSI TLV data.
   22e568af3989 ASoC: pcm3168a: Don't disable pcm3168a when CONFIG_PM defined
   34ea589d97d7 selinux: always allow mounting submounts
   e4c04fd44157 fpga: altera-cvp: fix probing for multiple FPGAs on the bus
   7cae65dbc7b4 usb: gadget: udc: renesas_usb3: add a safety connection way for forced_b_device
   7187ac3e3c4d samples: bpf: fix: error handling regarding kprobe_events
   5e1be9c72310 clk: meson: meson8b: fix incorrect divider mapping in cpu_scale_table
   6ebffc54843b drm/atomic-helper: Complete fake_commit->flip_done potentially earlier
   6f88ff119205 arm64: perf: set suppress_bind_attrs flag to true
   dbb97f7663c0 crypto: ecc - regularize scalar for scalar multiplication
   6e5be6e3f56a MIPS: SiByte: Enable swiotlb for SWARM, LittleSur and BigSur
   1d839c72fc13 x86/mce: Fix -Wmissing-prototypes warnings
   3945c33a608e ALSA: oxfw: add support for APOGEE duet FireWire
   464b01e4406e bpf: Allow narrow loads with offset > 0
   4c7c36a7f348 serial: set suppress_bind_attrs flag only if builtin
   e7a5f0073533 writeback: don't decrement wb->refcnt if !wb->bdi
   b6d75422462a of: overlay: add missing of_node_put() after add new node to changeset
   d216d503a0b2 selftests/bpf: enable (uncomment) all tests in test_libbpf.sh
   579f3fc1f46f usb: typec: tcpm: Do not disconnect link for self powered devices
   88f3beae5836 e1000e: allow non-monotonic SYSTIM readings
   e5090418fbb0 platform/x86: asus-wmi: Tell the EC the OS will handle the display off hotkey
   3dc1bc575e75 ixgbe: allow IPsec Tx offload in VEPA mode
   bd240b1182da drm/amdkfd: fix interrupt spin lock
   07f4cf9547d9 drm/amd/display: Guard against null stream_state in set_crc_source
   414dbd6c00b9 gpio: pl061: Move irq_chip definition inside struct pl061
   ad7013cd6d6a netfilter: ipset: Allow matching on destination MAC address for mac and ipmac sets
   183144815e34 net: clear skb->tstamp in bridge forwarding path
   c1fa98a5748f ipv6: Take rcu_read_lock in __inet6_bind for mapped addresses
   19ad57e220a1 r8169: Add support for new Realtek Ethernet
   8bb38336b721 qmi_wwan: add MTU default to qmap network interface
   598e57e02929 net, skbuff: do not prefer skb allocation fails early
   e10411389248 net: dsa: mv88x6xxx: mv88e6390 errata
   07348a7ebb58 mlxsw: spectrum_switchdev: Set PVID correctly during VLAN deletion
   cac1bffc77e9 mlxsw: spectrum: Disable lag port TX before removing it
   9b25d7b69d61 ipv6: Consider sk_bound_dev_if when binding a socket to a v4 mapped address
   23b6b8bf9011 Linux 4.19.17
   9a9c3c02eace nbd: Use set_blocksize() to set device blocksize
   685cc9c3ee48 media: vb2: be sure to unlock mutex on errors
   7696248f9b5a selftests: Fix test errors related to lib.mk khdr target
   241e514850a1 drm/fb-helper: Ignore the value of fb_var_screeninfo.pixclock
   8868a72d4201 loop: drop caches if offset or block_size are changed
   30805ece5068 loop: Fix double mutex_unlock(&loop_ctl_mutex) in loop_control_ioctl()
   b42e24aa3b88 loop: Get rid of 'nested' acquisition of loop_ctl_mutex
   5c684c250bf3 loop: Avoid circular locking dependency between loop_ctl_mutex and bd_mutex
   5f0db37d916b loop: Fix deadlock when calling blkdev_reread_part()
   6e0d69353095 loop: Move loop_reread_partitions() out of loop_ctl_mutex
   ed281a7230c9 loop: Move special partition reread handling in loop_clr_fd()
   dc717408cef0 loop: Push loop_ctl_mutex down to loop_change_fd()
   9218b108062e loop: Push loop_ctl_mutex down to loop_set_fd()
   90386ad72fcf loop: Push loop_ctl_mutex down to loop_set_status()
   8de64127b2aa loop: Push loop_ctl_mutex down to loop_get_status()
   ed87dc660171 loop: Push loop_ctl_mutex down into loop_clr_fd()
   18974320825e loop: Split setting of lo_state from loop_clr_fd
   b8463897a294 loop: Push lo_ctl_mutex down into individual ioctls
   ea5df5077091 loop: Get rid of loop_index_mutex
   38d9cce3d61f loop: Fold __loop_release into loop_release
   342b3360aeb1 block/loop: Use global lock for ioctl() operation.
   f5d3c785c1d3 block/loop: Don't grab "struct file" for vfs_getattr() operation.
   21172412a727 tipc: fix uninit-value in tipc_nl_compat_doit
   2d5fc1d492d1 tipc: fix uninit-value in tipc_nl_compat_name_table_dump
   04d87429738a tipc: fix uninit-value in tipc_nl_compat_link_set
   7960fb71aad9 tipc: fix uninit-value in tipc_nl_compat_bearer_enable
   1d61caf05721 tipc: fix uninit-value in tipc_nl_compat_link_reset_stats
   927733365214 tipc: fix uninit-value in in tipc_conn_rcv_sub
   7f902f7c146c sctp: allocate sctp_sockaddr_entry with kzalloc
   1e11b1d630f8 blockdev: Fix livelocks on loop device
   5a79e71e0bc8 selinux: fix GPF on invalid policy
   4cc66cc4f81f block: use rcu_work instead of call_rcu to avoid sleep in softirq
   2663bcba075f netfilter: ebtables: account ebt_table_info to kmemcg
   61b29bed9010 sunrpc: handle ENOMEM in rpcb_getport_async
   c4f39cba6fd0 media: vb2: vb2_mmap: move lock up
   a19aedf1a77c LSM: Check for NULL cred-security on free
   a72e572f8a2d ipv6: make icmp6_send() robust against null skb->dev
   341906cb25f9 bpf: in __bpf_redirect_no_mac pull mac only if present
   d9c249a302cb media: vivid: set min width/height to a value > 0
   4497ce43a5d0 media: vivid: fix error handling of kthread_run
   4190c5fd8a7f omap2fb: Fix stack memory disclosure
   328f3de2ef76 fix int_sqrt64() for very large numbers
   89a9f049f8b9 Disable MSI also when pcie-octeon.pcie_disable on
   3832c115bf80 arm64: dts: marvell: armada-ap806: reserve PSCI area
   ca8080c308f4 arm64: kaslr: ensure randomized quantities are clean to the PoC
   483ac8e65a8a pstore/ram: Avoid allocation and leak of platform data
   a10cabbf7a76 net: dsa: realtek-smi: fix OF child-node lookup
   0098f2e791d7 kbuild: Disable LD_DEAD_CODE_DATA_ELIMINATION with ftrace & GCC <= 4.7
   ec485378a4c4 RDMA/vmw_pvrdma: Return the correct opcode when creating WR
   836edf22ffd1 RDMA/nldev: Don't expose unsafe global rkey to regular user
   8f4a0e7d8bef media: v4l: ioctl: Validate num_planes for debug messages
   d846f48c1dd5 mfd: tps6586x: Handle interrupts on suspend
   a752c6d6de80 OF: properties: add missing of_node_put
   ac8b9e8e7ddd drm/i915/gvt: Fix mmap range check
   434b1b91573c MIPS: lantiq: Fix IPI interrupt handling
   19f41f32a4b4 MIPS: BCM47XX: Setup struct device for the SoC
   8f469dc0e6dc mips: fix n32 compat_ipc_parse_version
   9d37f4a046c2 scsi: sd: Fix cache_type_store()
   d368f540ac3e scsi: core: Synchronize request queue PM status only on successful resume
   b955a2c75675 Yama: Check for pid death before checking ancestry
   01634ac56393 btrfs: wait on ordered extents on abort cleanup
   4675f90ef892 Revert "btrfs: balance dirty metadata pages in btrfs_finish_ordered_io"
   4432362af3a3 xen: Fix x86 sched_clock() interface for xen
   64e986444138 crypto: talitos - fix ablkcipher for CONFIG_VMAP_STACK
   c6578f509312 crypto: talitos - reorder code in talitos_edesc_alloc()
   44c67402c3f7 crypto: authenc - fix parsing key with misaligned rta_len
   97a6662b035c crypto: bcm - convert to use crypto_authenc_extractkeys()
   93242fa04d87 crypto: ccree - convert to use crypto_authenc_extractkeys()
   659080376639 crypto: authencesn - Avoid twice completion call in decrypt path
   9107b2f43432 crypto: caam - fix zero-length buffer DMA mapping
   68afc7c36461 crypto: sm3 - fix undefined shift by >= width of value
   6e09bef3cbe2 r8169: load Realtek PHY driver module before r8169
   eb02c17fcce5 ip: on queued skb use skb_header_pointer instead of pskb_may_pull
   d2898aae0da6 bonding: update nest level on unlink
   d976151a51c8 r8169: don't try to read counters if chip is in a PCI power-save state
   8dc262df0c6f smc: move unhash as early as possible in smc_release()
   f352903d5d78 lan743x: Remove phy_read from link status change function
   08be4b72f362 tun: publish tfile after it's fully initialized
   d7fe54c17aa3 tcp: change txhash on SYN-data timeout
   3dc241b8fa94 packet: Do not leak dev refcounts on error exit
   54cbcff82d5e net: bridge: fix a bug on using a neighbour cache entry without checking its state
   c0e1392e37e1 ipv6: fix kernel-infoleak in ipv6_local_error()
   d29d3891c009 arm64: Don't trap host pointer auth use to EL2
   a31edd1c1b7b arm64/kvm: consistently handle host HCR_EL2 flags
   a200574da87b scsi: target: iscsi: cxgbit: fix csk leak
   25c0f7a24a4c scsi: target: iscsi: cxgbit: fix csk leak
   ec98b3f39feb Revert "scsi: target: iscsi: cxgbit: fix csk leak"
   e276420e4828 mmc: sdhci-msm: Disable CDR function on TX
   6567515e4a7c netfilter: nf_conncount: fix argument order to find_next_bit
   b01b92417d09 netfilter: nf_conncount: speculative garbage collection on empty lists
   aea1d19594e6 netfilter: nf_conncount: move all list iterations under spinlock
   bdc6c893ba37 netfilter: nf_conncount: merge lookup and add functions
   13c639424bc2 netfilter: nf_conncount: restart search when nodes have been erased
   d6b3ff0222fb netfilter: nf_conncount: split gc in two phases
   ef68fdb5179c netfilter: nf_conncount: don't skip eviction when age is negative
   c5cbe95a4ba8 netfilter: nf_conncount: replace CONNCOUNT_LOCK_SLOTS with CONNCOUNT_SLOTS
   8db82a6f2b76 can: gw: ensure DLC boundaries after CAN frame modification
   a13520e0d5f5 tty: Don't hold ldisc lock in tty_reopen() if ldisc present
   a42c97862837 tty: Simplify tty->count math in tty_reopen()
   e6a4caa0b4dd tty: Hold tty_ldisc_lock() during tty_reopen()
   028c13f7caf2 tty/ldsem: Wake up readers after timed out down_write()
   9c5931b65a7b Linux 4.19.16
   7a1b9b76bac7 Btrfs: use nofs context when initializing security xattrs to avoid deadlock
   79aa5c0daa5c Btrfs: fix deadlock when enabling quotas due to concurrent snapshot creation
   829431a2a5a8 Btrfs: fix access to available allocation bits when starting balance
   6c9a2046297f arm64: compat: Don't pull syscall number from regs in arm_compat_syscall
   4f14f446d115 KVM: arm/arm64: Fix VMID alloc race by reverting to lock-less
   44e7bab39f87 sunrpc: use-after-free in svc_process_common()
   160f79c0a039 mm: page_mapped: don't assume compound page is huge or THP
   5dc41af3d19e ext4: fix special inode number checks in __ext4_iget()
   bb80ad0dc392 ext4: track writeback errors using the generic tracking infrastructure
   da38a1b47b02 ext4: use ext4_write_inode() when fsyncing w/o a journal
   01db6e5cf81f ext4: avoid kernel warning when writing the superblock to a dead device
   926cdac10439 ext4: fix a potential fiemap/page fault deadlock w/ inline_data
   7c2ea25e1364 ext4: make sure enough credits are reserved for dioread_nolock writes
   997255351a29 rbd: don't return 0 on unmap if RBD_DEV_FLAG_REMOVING is set
   c7ca8e94dbb5 drm/amdgpu: Don't fail resume process if resuming atomic state fails
   f05d02b3b4c8 drm/amdgpu: Don't ignore rc from drm_dp_mst_topology_mgr_resume()
   d1a5113cf41b drm/i915: Unwind failure on pinning the gen7 ppgtt
   f57bef95d6f8 drm/fb-helper: Partially bring back workaround for bugs of SDL 1.2
   7398668b3110 drm/fb_helper: Allow leaking fbdev smem_start
   b7c3696f68ad drm/amd/display: Fix MST dp_blank REG_WAIT timeout
   857af87dcdce PCI: dwc: Move interrupt acking into the proper callback
   c408aac37787 PCI: dwc: Take lock when ACKing an interrupt
   11637a3a383b PCI: dwc: Use interrupt masking instead of disabling
   c051be2b2621 drm/amdgpu: Add new VegaM pci id
   719aee2c5ba1 vfio/type1: Fix unmap overflow off-by-one
   1e235ec00be0 mtd: rawnand: qcom: fix memory corruption that causes panic
   fca4eb31e096 i2c: dev: prevent adapter retries and timeout being set as minus value
   3fdb8121e90a ACPI/IORT: Fix rc_dma_get_range()
   6fd3d1975105 ACPI / PMIC: xpower: Fix TS-pin current-source handling
   fec7361193b4 ACPI: power: Skip duplicate power resource references in _PRx
   97b02b632466 mm, memcg: fix reclaim deadlock with writeback
   8a4b6e8cb796 mm/usercopy.c: no check page span for stack objects
   f928ca391747 slab: alien caches must not be initialized if the allocation of the alien cache failed
   33c96bc68ff3 USB: Add USB_QUIRK_DELAY_CTRL_MSG quirk for Corsair K70 RGB
   12388881ce0d USB: storage: add quirk for SMI SM3350
   621ecb93578a USB: storage: don't insert sane sense for SPC3+ when bad sense specified
   51b2a8e263cb usb: cdc-acm: send ZLP for Telit 3G Intel based modems
   2a71a47e03ff cifs: Fix potential OOB access of lock element array
   7dcc5b36ea7f CIFS: Fix credit computation for compounded requests
   d2f76f6f9fa9 CIFS: Do not hide EINTR after sending network packets
   c3606c646783 CIFS: Do not set credits to 1 if the server didn't grant anything
   d1130682d127 CIFS: Fix adjustment of credits for MTU requests
   045e3d2f1216 ALSA: hda/realtek - Disable headset Mic VREF for headset mode of ALC225
   0fd36f024a70 ALSA: hda/realtek - Add unplug function into unplug state of Headset Mode for ALC225
   50a67b1a85b9 ALSA: hda/realtek - Support Dell headset mode for New AIO platform
   4bef2bacb1c5 x86, modpost: Replace last remnants of RETPOLINE with CONFIG_RETPOLINE
   4ecbd88bf994 cpufreq: scmi: Fix frequency invariance in slow path
   f64231cb4f13 staging: rtl8188eu: Fix module loading from tasklet for WEP encryption
   ce588054801d staging: rtl8188eu: Fix module loading from tasklet for CCMP encryption
   d7068618ae1f Btrfs: fix deadlock when using free space tree due to block group creation
   e31851235412 Linux 4.19.15
   6384c67c64b5 bnx2x: Fix NULL pointer dereference in bnx2x_del_all_vlans() on some hw
   8e3a1c500288 drm/amd/display: Fix unintialized max_bpc state values
   5f0ab980de1a drm/rockchip: psr: do not dereference encoder before it is null checked.
   05a0177d84d9 drm/vc4: Set ->is_yuv to false when num_planes == 1
   85c8c61007dd drm/nouveau/drm/nouveau: Check rc from drm_dp_mst_topology_mgr_resume()
   4f44e58a5614 lib: fix build failure in CONFIG_DEBUG_VIRTUAL test
   8dbea64423dc of: __of_detach_node() - remove node from phandle cache
   1cb5a0333a5d of: of_node_get()/of_node_put() nodes held in phandle cache
   daa67bd5d1ec power: supply: olpc_battery: correct the temperature units
   f65b4d4ff3aa intel_th: msu: Fix an off-by-one in attribute store
   998c3537af41 genwqe: Fix size check
   86dcb94392f7 drivers/perf: hisi: Fixup one DDRC PMU register offset
   c1aa0c845c36 video: fbdev: pxafb: Fix "WARNING: invalid free of devm_ allocated data"
   9797226bf661 ceph: don't update importing cap's mseq when handing cap export
   dc8408ea0b22 sched/fair: Fix infinite loop in update_blocked_averages() by reverting a9e7f6544b9c
   87b868070f41 iommu/vt-d: Handle domain agaw being less than iommu agaw
   f408aac3104c RDMA/srpt: Fix a use-after-free in the channel release code
   c03d6b0f9a95 rxe: fix error completion wr_id and qp_num
   6bf97c01b948 9p/net: put a lower bound on msize
   af7cc8ebab4a iio: dac: ad5686: fix bit shift read register
   a854ab8f6446 powerpc/tm: Set MSR[TS] just prior to recheckpoint
   6d9e96f37d38 Revert "powerpc/tm: Unset MSR[TS] if not recheckpointing"
   eb05c02903a7 leds: pwm: silently error out on EPROBE_DEFER
   ae5c75e660e2 arm64: relocatable: fix inconsistencies in linker script and options
   9873efe708bb arm64: drop linker script hack to hide __efistub_ symbols
   3f26e68af5c0 nfsd4: zero-length WRITE should succeed
   0b6001b941af lockd: Show pid of lockd for remote locks
   b541ebbe0cf0 PCI / PM: Allow runtime PM without callback functions
   b37fdd941036 selinux: policydb - fix byte order and alignment issues
   c6c59adbc19a b43: Fix error in cordic routine
   6ef56c9ad7f1 gfs2: Fix loop in gfs2_rbm_find
   310486107d41 gfs2: Get rid of potential double-freeing in gfs2_create_inode
   30d3dfd4c420 dlm: memory leaks on error path in dlm_user_request()
   c5fa01a0153f dlm: lost put_lkb on error path in receive_convert() and receive_unlock()
   294776562f96 dlm: possible memory leak on error path in create_lkb()
   03acbec28a24 dlm: fixed memory leaks after failed ls_remove_names allocation
   6353c0a03791 block: mq-deadline: Fix write completion handling
   69e9b2858b20 block: deactivate blk_stat timer in wbt_disable_default()
   a85449199539 Fix failure path in alloc_pid()
   5781b53dd89c driver core: Add missing dev->bus->need_parent_lock checks
   b57b3b008284 srcu: Lock srcu_data structure in srcu_gp_start()
   378f9dfa495a ALSA: usb-audio: Always check descriptor sizes in parser code
   6c8c16479b23 ALSA: usb-audio: Fix an out-of-bound read in create_composite_quirks
   b389f9c4c97a ALSA: usb-audio: Check mixer unit descriptors more strictly
   8ee6f180d56f ALSA: usb-audio: Avoid access before bLength check in build_audio_procunit()
   281a9e46a94c ALSA: cs46xx: Potential NULL dereference in probe
   6584ae39fa60 media: cx23885: only reset DMA on problematic CPUs
   b6f66e8b227f mt76x0: init hw capabilities
   13e554feddbd dma-direct: do not include SME mask in the DMA supported check
   439022e0c2ec raid6/ppc: Fix build for clang
   7dfb22b5abaa powerpc/boot: Set target when cross-compiling for clang
   f4c27d53b15d Makefile: Export clang toolchain variables
   1637d5d2e299 kbuild: consolidate Clang compiler flags
   dcaab8b5d745 kbuild: add -no-integrated-as Clang option unconditionally
   28e1d143b868 powerpc: Disable -Wbuiltin-requires-header when setjmp is used
   ba1fe90be68f powerpc: avoid -mno-sched-epilog on GCC 4.9 and newer
   24e26062b90e powerpc: consolidate -mno-sched-epilog into FTRACE flags
   5b59eeba6b00 powerpc: remove old GCC version checks
   668ecd6b17b9 sunrpc: use SVC_NET() in svcauth_gss_* functions
   807957cecdc7 sunrpc: fix cache_head leak due to queued request
   1c5e0be35de1 memcg, oom: notify on oom killer invocation from the charge path
   8da70752f5fa mm, swap: fix swapoff with KSM pages
   0f1a62e0737a mm, hmm: mark hmm_devmem_{add, add_resource} EXPORT_SYMBOL_GPL
   e890a867060b mm, hmm: use devm semantics for hmm_devmem_{add, remove}
   c215c66ceab5 mm, devm_memremap_pages: add MEMORY_DEVICE_PRIVATE support
   ec5471c92fb2 mm, devm_memremap_pages: fix shutdown handling
   0a38f2e4a4c7 mm, devm_memremap_pages: kill mapping "System RAM" support
   b30ea244cf3e mm, devm_memremap_pages: mark devm_memremap_pages() EXPORT_SYMBOL_GPL
   2c87072a3bf9 hwpoison, memory_hotplug: allow hwpoisoned pages to be offlined
   e3af83bd44ec zram: fix double free backing device
   bc999b5099d7 fork: record start_time late
   d257d4299ae7 scsi: lpfc: do not set queue->page_count to 0 if pc_sli4_params.wqpcnt is invalid
   06fd6847c4a1 scsi: zfcp: fix posting too many status read buffers leading to adapter shutdown
   218c81851f11 auxdisplay: charlcd: fix x/y command parsing
   dc68052427be serial/sunsu: fix refcount leak
   08e7661cdd56 qmi_wwan: Fix qmap header retrieval in qmimux_rx_fixup
   2fb13e2004e8 net: netxen: fix a missing check and an uninitialized use
   8bb68ed82f01 Input: synaptics - enable SMBus for HP EliteBook 840 G4
   ae247d60588c gpio: mvebu: only fail on missing clk if pwm is actually to be used
   332fc66790d6 lan743x: Remove MAC Reset from initialization
   e1b3575c474e virtio: fix test build after uio.h change
   e46d5bd8fd89 m68k: Fix memblock-related crashes
   ae206a1a5e3a kbuild: fix false positive warning/error about missing libelf
   ff014712e5d3 mac80211: free skb fraglist before freeing the skb
   366fc5858720 nl80211: fix memory leak if validate_pae_over_nl80211() fails
   098143bfc29e vxge: ensure data0 is initialized in when fetching firmware version information
   945b416a973b lan78xx: Resolve issue with changing MAC address
   c26419f3574e lan743x: Expand phy search for LAN7431
   98876c46efd0 net: macb: add missing barriers when reading descriptors
   6e48c0fc14af net: macb: fix dropped RX frames due to a race
   873f9a559bcb net: macb: fix random memory corruption on RX with 64-bit DMA
   12024f4fc118 qed: Fix an error code qed_ll2_start_xmit()
   233ba13db681 SUNRPC: Fix a race with XPRT_CONNECTING
   4f784484bd96 mac80211: fix a kernel panic when TXing after TXQ teardown
   97fd4c7f6ddf net: hns: Fix ping failed when use net bridge and send multicast
   1f89e4e8b54d net: hns: Add mac pcs config when enable|disable mac
   b686b8c073c0 net: hns: Fix ntuple-filters status error.
   db2ca348c80c net: hns: Avoid net reset caused by pause frames storm
   c8e78cbcde24 net: hns: Free irq when exit from abnormal branch
   ac9ae1930a1b net: hns: Clean rx fbd when ae stopped.
   1b2f8d7cc1b2 net: hns: Fixed bug that netdev was opened twice
   17eeca6e3d9b net: hns: Some registers use wrong address according to the datasheet.
   341b8840435a net: hns: All ports can not work when insmod hns ko after rmmod.
   41d54657e34b net: hns: Incorrect offset address used for some registers.
   2cd0c6f8d050 w90p910_ether: remove incorrect __init annotation
   997cb5039dba net/tls: Init routines in create_ctx
   7a2b5258682f drivers: net: xgene: Remove unnecessary forward declarations
   37fc22c6cf22 x86, hyperv: remove PCI dependency
   2e2127508297 mt76: fix potential NULL pointer dereference in mt76_stop_tx_queues
   131366ebda88 scsi: target: iscsi: cxgbit: add missing spin_lock_init()
   c9cef2c71a89 scsi: target: iscsi: cxgbit: fix csk leak
   a01345407c43 bnx2x: Send update-svid ramrod with retry/poll flags enabled
   53471f0d893d bnx2x: Remove configured vlans as part of unload sequence.
   096795d4ccc7 bnx2x: Clear fip MAC when fcoe offload support is disabled
   7fd995d3b444 netfilter: nf_conncount: use rb_link_node_rcu() instead of rb_link_node()
   ba364929ff0c netfilter: nat: can't use dst_hold on noref dst
   9e4041016015 netfilter: ipset: do not call ipset_nest_end after nla_nest_cancel
   27f59f342f7c ixgbe: Fix race when the VF driver does a reset
   3bfed541c3ee i40e: fix mac filter delete when setting mac address
   56769ef90b83 x86/dump_pagetables: Fix LDT remap address marker
   62075c982bf7 x86/mm: Fix guard hole handling
   af03a980e86f ieee802154: ca8210: fix possible u8 overflow in ca8210_rx_done
   e4bcb09d3b48 ibmvnic: Fix non-atomic memory allocation in IRQ context
   733f5216eb54 ibmvnic: Convert reset work item mutex to spin lock
   b7e2af3fdf8a Input: synaptics - enable RMI on ThinkPad T560
   c5dabddc2ccc Input: omap-keypad - fix idle configuration to not block SoC idle states
   c0c14b758c0c scsi: bnx2fc: Fix NULL dereference in error handling
   98ce676bea96 Revert "scsi: qla2xxx: Fix NVMe Target discovery"
   6bcf9ef86c86 netfilter: seqadj: re-load tcp header pointer after possible head reallocation
   cee05c0371a6 netfilter: nf_tables: fix suspicious RCU usage in nft_chain_stats_replace()
   537e9a8c301d ieee802154: hwsim: fix off-by-one in parse nested
   083d552a890c xfrm: Fix NULL pointer dereference in xfrm_input when skb_dst_force clears the dst_entry.
   00eff089dfb7 xfrm: Fix bucket count reported to userspace
   34a2f36c0115 xfrm: Fix error return code in xfrm_output_one()
   7519ffa9118c checkstack.pl: fix for aarch64
   8c9c3747750a IB/core: Fix oops in netdev_next_upper_dev_rcu()
   a8d16017db2e drm/amdgpu: Fix DEBUG_LOCKS_WARN_ON(depth <= 0) in amdgpu_ctx.lock
   54568ab2e11f powerpc/mm: Fallback to RAM if the altmap is unusable
   52e1f29e8bcf Input: restore EV_ABS ABS_RESERVED
   b4592b838322 IB/mlx5: Block DEVX umem from the non applicable cases
   aad142a61ebb ARM: dts: imx7d-nitrogen7: Fix the description of the Wifi clock
   eab3109e1547 ARM: imx: update the cpu power up timing setting on i.mx6sx
   94541b595ad4 ARM: dts: imx7d-pico: Describe the Wifi clock
   270a08ffa1b9 HID: ite: Add USB id match for another ITE based keyboard rfkill key quirk
   d4fdc5e82357 powerpc/mm: Fix linux page tables build with some configs
   4642a5c58299 powerpc: Fix COFF zImage booting on old powermacs
   a294de739535 arm64: dts: mt7622: fix no more console output on rfb1
   cd9ff62bad88 pinctrl: meson: fix pull enable register calculation
   0dc2ffac869c ARM: dts: sun8i: a83t: bananapi-m3: increase vcc-pd voltage to 3.3V

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_4.19.bb              |  6 +++---
 .../linux/linux-yocto-tiny_4.19.bb            |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 9784607cd6..79eebb49f5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7a0b04e5a8d036cd9dcc6ee64a838e8d8d5cdd56"
-SRCREV_meta ?= "70d33ded25747f73381baff8d8758e86967e4ee2"
+SRCREV_machine ?= "7759e970a7e106bd37bd62b63ab67bdae54a2152"
+SRCREV_meta ?= "4c0da29403e242f3d429196cf4a03200211e6ff4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.19.14"
+LINUX_VERSION ?= "4.19.19"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index f8d60c76c3..69d0a6136d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.19.14"
+LINUX_VERSION ?= "4.19.19"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "d11db6c6617f689e6b9e2afaa3d3b2036c6d3d30"
-SRCREV_machine ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
-SRCREV_meta ?= "70d33ded25747f73381baff8d8758e86967e4ee2"
+SRCREV_machine_qemuarm ?= "64017daf053fdb31049248e45f42e0abd55117d3"
+SRCREV_machine ?= "ad24af0809e17882e33fb4bd77426e691f47b46d"
+SRCREV_meta ?= "4c0da29403e242f3d429196cf4a03200211e6ff4"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index af0dc9f50c..11f7e15bad 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -11,21 +11,21 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
 KBRANCH_qemux86-64 ?= "v4.19/standard/base"
 KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b960e1b087a8b0f192e5a9a3441dd47aecfa7d48"
-SRCREV_machine_qemuarm64 ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
-SRCREV_machine_qemumips ?= "99a57b9439d36397ce975cc45ab23264c02b96d4"
-SRCREV_machine_qemuppc ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
-SRCREV_machine_qemux86 ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
-SRCREV_machine_qemux86-64 ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
-SRCREV_machine_qemumips64 ?= "dff23f01307cbab688d9677ecd4b5f350ec435d9"
-SRCREV_machine ?= "eebb51300a07804a020ec468b5f8c5bf720198d9"
-SRCREV_meta ?= "70d33ded25747f73381baff8d8758e86967e4ee2"
+SRCREV_machine_qemuarm ?= "21a0a68be12c2e549fcc63c3253f22123dc46b72"
+SRCREV_machine_qemuarm64 ?= "ad24af0809e17882e33fb4bd77426e691f47b46d"
+SRCREV_machine_qemumips ?= "27542dfa0e04bf9d8453a172fce459176787fd97"
+SRCREV_machine_qemuppc ?= "ad24af0809e17882e33fb4bd77426e691f47b46d"
+SRCREV_machine_qemux86 ?= "ad24af0809e17882e33fb4bd77426e691f47b46d"
+SRCREV_machine_qemux86-64 ?= "ad24af0809e17882e33fb4bd77426e691f47b46d"
+SRCREV_machine_qemumips64 ?= "5abad938eff63706ca30fdf09b31f1c7b36f5308"
+SRCREV_machine ?= "ad24af0809e17882e33fb4bd77426e691f47b46d"
+SRCREV_meta ?= "4c0da29403e242f3d429196cf4a03200211e6ff4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.19.14"
+LINUX_VERSION ?= "4.19.19"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


