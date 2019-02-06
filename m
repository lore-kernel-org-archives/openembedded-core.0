Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com
	[209.85.166.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0B6F679EC1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Feb 2019 19:50:44 +0000 (UTC)
Received: by mail-it1-f171.google.com with SMTP id m62so8929871ith.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 11:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=STJNTU4W3GHABHAypczstfrdI/VwSDZyPe1lYk98fkc=;
	b=RsibHUF1ayGg8tfgl/nutx3M6eU1am0TZuuTN3NVuZrzRwU/Twx0L3MJTurPDGbmWu
	OJ68vLky1rfejUPImeTyGv5G5aCPYVnpG7RlQ6eM8JWjdSkNSFGHfxCwG9CW0l05h5/W
	Hu/13Ct560KDIiDnQ2oAnzhl+qwpMDf9PUrOrQwBBaUkORXQs+lnzEcB869N1erYhwqb
	xYeZRiSIt6FfWOLpUG/vqNO/mtRq4iWbeWcp2ccUWYN47BQKKeLXScPEtfQPS1qecFQx
	PUhyuoydqcCwBIEruc133C+6+8NCOVuM2GPJln2wK1oWFrG3PSnqupHxUWkIxfxj+Wzc
	ZNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=STJNTU4W3GHABHAypczstfrdI/VwSDZyPe1lYk98fkc=;
	b=BmYPpdgnCY5GeTKnbiaMaIipz5cZBshhcca4IP/RPbTmCW3h5kQ9oOV1VN5++XCYhy
	1aZCxqah8mtbgFCoxv2eHdCILio6hdPf3EOAT2BlGKJUNyccVH33dupCmVKDWLg3j9LA
	jaUfQGc8DP3hdLV/7UyhoU4+vbN74r077Z/Kfyja0Ms2OKwsNS3h9kVC/WUOFwiL8YWF
	hXehSxd7p730l62va0NyZWMZAGqq5ezsgtHR6u3h52Bl21m51gWzNPUfVmenoZwyCIno
	bdOMONDoDCpR1yYNbl/Wlg5PXmwabahWcj5d+WKzFts/q9ntcLYVQOZmyfxKw9vXc5Yy
	/60A==
X-Gm-Message-State: AHQUAubTzlOTMZhG1bPe7XrRQpJdHztFN9iWoW2BI0U142MwBqJCs2uR
	WLjTRbw43I3wP6P0wPZ/9LzBoO2mVOJbCQ==
X-Google-Smtp-Source: AHgI3IZ6MBTgQSF2L0Na8fwkTERi5J7nAm5Il2Hs5ysckg6zzasqmweiDT22RbXYDfcHWj8spxz6xg==
X-Received: by 2002:a24:648f:: with SMTP id t137mr2945785itc.95.1549482645613; 
	Wed, 06 Feb 2019 11:50:45 -0800 (PST)
Received: from localhost.localdomain ([174.116.254.195])
	by smtp.gmail.com with ESMTPSA id
	w26sm3302983iol.60.2019.02.06.11.50.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Feb 2019 11:50:44 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  6 Feb 2019 19:50:39 +0000
Message-Id: <9a3a34a01e8d16548205f019ad30847188babe18.1549481175.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1549481175.git.bruce.ashfield@gmail.com>
References: <cover.1549481175.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] linux-yocto/4.18: update to v4.18.27
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
X-List-Received-Date: Wed, 06 Feb 2019 19:50:45 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the -stable updates from Paul Gortmaker that comprise the
following commits:

   fb957805a800 Linux 4.18.27
   e40e99b6b15d ipmi:ssif: Fix handling of multi-part return messages
   ec5b2f3f897b ipmi: Prevent use-after-free in deliver_response
   d605dfec5314 ipmi: msghandler: Fix potential Spectre v1 vulnerabilities
   6fcd5c67bbed ipmi: fix use-after-free of user->release_barrier.rda
   8978d7c6dec4 Bluetooth: Fix unnecessary error message for HCI request completion
   9aa6a6afdc9d iwlwifi: mvm: Send LQ command as async when necessary
   be293e2c8d5d mm, proc: be more verbose about unstable VMA flags in /proc/<pid>/smaps
   5da1802b5dd9 userfaultfd: clear flag if remap event not enabled
   08861c6db0c1 mm/swap: use nr_node_ids for avail_lists in swap_info_struct
   fbd6851e6d57 mm/page-writeback.c: don't break integrity writeback on ->writepage() error
   42af1b118dec ocfs2: fix panic due to unrecovered local alloc
   e701c6b47b1e scsi: megaraid: fix out-of-bound array accesses
   c2414688a11f scsi: smartpqi: call pqi_free_interrupts() in pqi_shutdown()
   248849ffcee8 ath10k: fix peer stats null pointer dereference
   e6e7a27d9894 scsi: smartpqi: correct lun reset issues
   f82c77b69dd4 scsi: mpt3sas: fix memory ordering on 64bit writes
   7fe3902a1b30 IB/usnic: Fix potential deadlock
   07716336ae4f sysfs: Disable lockdep for driver bind/unbind files
   52223b291461 ALSA: bebob: fix model-id of unit for Apogee Ensemble
   f55b7d8c5747 dm: Check for device sector overflow if CONFIG_LBDAF is not set
   744fb8e55bdc clocksource/drivers/integrator-ap: Add missing of_node_put()
   c7e5ef0fad26 quota: Lock s_umount in exclusive mode for Q_XQUOTA{ON,OFF} quotactls.
   051f86c6e4fe perf tools: Add missing open_memstream() prototype for systems lacking it
   f40cb62ae378 perf tools: Add missing sigqueue() prototype for systems lacking it
   fe10d3ee10ae dm snapshot: Fix excessive memory usage and workqueue stalls
   dbb2e01442dd tools lib subcmd: Don't add the kernel sources to the include path
   9844e0dbc6d0 perf stat: Avoid segfaults caused by negated options
   d8dc75d3d9fc dm kcopyd: Fix bug causing workqueue stalls
   dff3fa1af70f dm crypt: use u64 instead of sector_t to store iv_offset
   26dfea580c42 x86/topology: Use total_cpus for max logical packages calculation
   5f13f97aad1e netfilter: ipt_CLUSTERIP: fix deadlock in netns exit routine
   d5e112ef684d netfilter: ipt_CLUSTERIP: remove wrong WARN_ON_ONCE in netns exit routine
   ed843e0c755b netfilter: ipt_CLUSTERIP: check MAC address when duplicate config is set
   ab68568470d6 perf vendor events intel: Fix Load_Miss_Real_Latency on SKL/SKX
   5ddf63d48c16 perf parse-events: Fix unchecked usage of strncpy()
   882079829dfb perf svghelper: Fix unchecked usage of strncpy()
   e689fb5da3fc perf tests ARM: Disable breakpoint tests 32-bit
   ef3ae9b3e540 perf intel-pt: Fix error with config term "pt=0"
   8639a6aacfd7 tty/serial: do not free trasnmit buffer page under port lock
   80c3cdea380c btrfs: improve error handling of btrfs_add_link
   2202b846b13c btrfs: alloc_chunk: fix more DUP stripe size handling
   ab3a0bbe8b0b mmc: atmel-mci: do not assume idle after atmci_request_end
   32f972da3d3a kconfig: fix memory leak when EOF is encountered in quotation
   10d9a6a992ee kconfig: fix file name and line number of warn_ignored_character()
   f7bcc8b2f7ef bpf: relax verifier restriction on BPF_MOV | BPF_ALU
   eec0856907da arm64: Fix minor issues with the dcache_by_line_op macro
   f2300824da71 clk: imx6q: reset exclusive gates on init
   1604baf07d22 arm64: kasan: Increase stack size for KASAN_EXTRA
   13ba93449b46 selftests: do not macro-expand failed assertion expressions
   3bbd076d9136 scsi: target: use consistent left-aligned ASCII INQUIRY data
   e37db031ef5a net: call sk_dst_reset when set SO_DONTROUTE
   fb614921bc34 media: venus: core: Set dma maximum segment size
   eb2c9c4ca615 ASoC: use dma_ops of parent device for acp_audio_dma
   68a03c142063 media: firewire: Fix app_info parameter type in avc_ca{,_app}_info
   b60c7a6713d5 powerpc/pseries/cpuidle: Fix preempt warning
   df30a1b5d8d2 powerpc/xmon: Fix invocation inside lock region
   4f03e69412ba media: uvcvideo: Refactor teardown of uvc on USB disconnect
   e6b355ae24ba pstore/ram: Do not treat empty buffers as valid
   72d479d16ec9 clk: imx: make mux parent strings const
   277364cbbd21 jffs2: Fix use of uninitialized delayed_work, lockdep breakage
   d206a38109fc efi/libstub: Disable some warnings for x86{,_64}
   643a876a5b01 rxe: IB_WR_REG_MR does not capture MR's iova field
   f5d7d77be0a6 scsi: qedi: Check for session online before getting iSCSI TLV data.
   5c28f6e86aff ASoC: pcm3168a: Don't disable pcm3168a when CONFIG_PM defined
   6ca660928969 selinux: always allow mounting submounts
   128146d4fb71 fpga: altera-cvp: fix probing for multiple FPGAs on the bus
   3e60aeeefaeb usb: gadget: udc: renesas_usb3: add a safety connection way for forced_b_device
   e1c8feafd5fe samples: bpf: fix: error handling regarding kprobe_events
   2b3081b77e3f clk: meson: meson8b: fix incorrect divider mapping in cpu_scale_table
   0bf0163094a9 drm/atomic-helper: Complete fake_commit->flip_done potentially earlier
   21330a217643 arm64: perf: set suppress_bind_attrs flag to true
   066b9fddd721 crypto: ecc - regularize scalar for scalar multiplication
   e26359f1620c MIPS: SiByte: Enable swiotlb for SWARM, LittleSur and BigSur
   3afff9e63c8e x86/mce: Fix -Wmissing-prototypes warnings
   9b3a195320ca ALSA: oxfw: add support for APOGEE duet FireWire
   04aba67bbf94 bpf: Allow narrow loads with offset > 0
   f30cc07af44f serial: set suppress_bind_attrs flag only if builtin
   d264a0f394ba writeback: don't decrement wb->refcnt if !wb->bdi
   74691a75e365 of: overlay: add missing of_node_put() after add new node to changeset
   419af4cd1015 selftests/bpf: enable (uncomment) all tests in test_libbpf.sh
   2e3f88e667c6 e1000e: allow non-monotonic SYSTIM readings
   f782c9d1da48 platform/x86: asus-wmi: Tell the EC the OS will handle the display off hotkey
   1261977d0ab4 ixgbe: allow IPsec Tx offload in VEPA mode
   7c73931b7303 drm/amd/display: Guard against null stream_state in set_crc_source
   39d92f35a8dc gpio: pl061: Move irq_chip definition inside struct pl061
   3aec221e313a netfilter: ipset: Allow matching on destination MAC address for mac and ipmac sets
   6a5be9a2ffef ipv6: Take rcu_read_lock in __inet6_bind for mapped addresses
   50d329eca381 r8169: Add support for new Realtek Ethernet
   d1aad26bb964 qmi_wwan: add MTU default to qmap network interface
   62b4f9e777bf net, skbuff: do not prefer skb allocation fails early
   eb5c8d69ea42 net: dsa: mv88x6xxx: mv88e6390 errata
   993bc7d54dac mlxsw: spectrum_switchdev: Set PVID correctly during VLAN deletion
   8fb8533a5309 mlxsw: spectrum: Disable lag port TX before removing it
   75daf3c475df ipv6: Consider sk_bound_dev_if when binding a socket to a v4 mapped address
   73827a8e2e30 nbd: Use set_blocksize() to set device blocksize
   f65d7d5574e1 drm/fb-helper: Ignore the value of fb_var_screeninfo.pixclock
   528fa9207170 loop: drop caches if offset or block_size are changed
   3df31feee60d loop: Fix double mutex_unlock(&loop_ctl_mutex) in loop_control_ioctl()
   d4082dc05ac9 loop: Get rid of 'nested' acquisition of loop_ctl_mutex
   78f210acfd34 loop: Avoid circular locking dependency between loop_ctl_mutex and bd_mutex
   3ebf94b079ba loop: Fix deadlock when calling blkdev_reread_part()
   fc4a4583f9f1 loop: Move loop_reread_partitions() out of loop_ctl_mutex
   2c2c3aa3ab1c loop: Move special partition reread handling in loop_clr_fd()
   e2c6ee2931ca loop: Push loop_ctl_mutex down to loop_change_fd()
   b442997a7285 loop: Push loop_ctl_mutex down to loop_set_fd()
   33d682700fb0 loop: Push loop_ctl_mutex down to loop_set_status()
   49f911a6a4c0 loop: Push loop_ctl_mutex down to loop_get_status()
   c3be2cd6ad9e loop: Push loop_ctl_mutex down into loop_clr_fd()
   9a4a7555c177 loop: Split setting of lo_state from loop_clr_fd
   d1f05249099a loop: Push lo_ctl_mutex down into individual ioctls
   50bbdfab99c1 loop: Get rid of loop_index_mutex
   bc40dc95afdc loop: Fold __loop_release into loop_release
   23d5eac305d0 block/loop: Use global lock for ioctl() operation.
   e0d29ef2a8b0 block/loop: Don't grab "struct file" for vfs_getattr() operation.
   8281310f32aa tipc: fix uninit-value in tipc_nl_compat_doit
   95c94c995d8e tipc: fix uninit-value in tipc_nl_compat_name_table_dump
   b099f94e1e4d tipc: fix uninit-value in tipc_nl_compat_link_set
   8e649a4839e0 tipc: fix uninit-value in tipc_nl_compat_bearer_enable
   e54458ac168e tipc: fix uninit-value in tipc_nl_compat_link_reset_stats
   9a8f56b713dc tipc: fix uninit-value in in tipc_conn_rcv_sub
   08ea8e1bfd4b sctp: allocate sctp_sockaddr_entry with kzalloc
   4c02dbac416c blockdev: Fix livelocks on loop device
   af7bec66e3ee selinux: fix GPF on invalid policy
   de9b736152ed block: use rcu_work instead of call_rcu to avoid sleep in softirq
   b232d75be71a netfilter: ebtables: account ebt_table_info to kmemcg
   aa4d1d6641b5 sunrpc: handle ENOMEM in rpcb_getport_async
   ddb29b79dbff media: vb2: be sure to unlock mutex on errors
   b9f0f2f9cf59 media: vb2: vb2_mmap: move lock up
   7308ece86dd0 LSM: Check for NULL cred-security on free
   71ba5763243b ipv6: make icmp6_send() robust against null skb->dev
   05e6bff7e7a6 bpf: in __bpf_redirect_no_mac pull mac only if present
   4181e7d61b1a media: vivid: set min width/height to a value > 0
   cbfc610ae5f2 media: vivid: fix error handling of kthread_run
   05f5b1394483 omap2fb: Fix stack memory disclosure
   28063cb50ed8 fix int_sqrt64() for very large numbers
   37112a960b7f Disable MSI also when pcie-octeon.pcie_disable on
   8fd61f25fcf3 arm64: dts: marvell: armada-ap806: reserve PSCI area
   58c3acda1754 arm64: kaslr: ensure randomized quantities are clean to the PoC
   9a013b991c02 pstore/ram: Avoid allocation and leak of platform data
   1aa9985076dc RDMA/nldev: Don't expose unsafe global rkey to regular user
   b409b102c7d8 media: v4l: ioctl: Validate num_planes for debug messages
   92dd1f93a3c9 mfd: tps6586x: Handle interrupts on suspend
   2e63388cbfdb OF: properties: add missing of_node_put
   1957d16bceca drm/i915/gvt: Fix mmap range check
   f1e756d98a46 MIPS: lantiq: Fix IPI interrupt handling
   ac8f34885340 mips: fix n32 compat_ipc_parse_version
   0830f02f81b3 scsi: sd: Fix cache_type_store()
   f25d687e3d8b scsi: core: Synchronize request queue PM status only on successful resume
   0f7357d9b8e4 Yama: Check for pid death before checking ancestry
   f94e8c0566d0 btrfs: wait on ordered extents on abort cleanup
   4b1129e59323 Revert "btrfs: balance dirty metadata pages in btrfs_finish_ordered_io"
   f9ac2ffa0255 xen: Fix x86 sched_clock() interface for xen
   79ad9eda6689 x86/xen/time: Output xen sched_clock time from 0
   7b3718f98f17 crypto: talitos - fix ablkcipher for CONFIG_VMAP_STACK
   c194e944dc98 crypto: talitos - reorder code in talitos_edesc_alloc()
   0b612c90335c crypto: authenc - fix parsing key with misaligned rta_len
   bed3cec44833 crypto: bcm - convert to use crypto_authenc_extractkeys()
   f1daff3d1cb1 crypto: ccree - convert to use crypto_authenc_extractkeys()
   b445d866e2fa crypto: authencesn - Avoid twice completion call in decrypt path
   1d5d8babb9a8 crypto: caam - fix zero-length buffer DMA mapping
   04836f6b86bd crypto: sm3 - fix undefined shift by >= width of value
   42cd579fd790 bonding: update nest level on unlink
   12dff858b935 r8169: don't try to read counters if chip is in a PCI power-save state
   5087c2825807 smc: move unhash as early as possible in smc_release()
   cf652d77ac45 tun: publish tfile after it's fully initialized
   faee48550bf4 tcp: change txhash on SYN-data timeout
   e87c244b11cd net: bridge: fix a bug on using a neighbour cache entry without checking its state
   c499692ded84 ipv6: fix kernel-infoleak in ipv6_local_error()
   a3ab077a3f79 arm64: Don't trap host pointer auth use to EL2
   6f127252fe5f arm64/kvm: consistently handle host HCR_EL2 flags
   e5fed8d49b5b scsi: target: iscsi: cxgbit: fix csk leak
   f1778e1523fa netfilter: nf_conncount: don't skip eviction when age is negative
   df00c2c10e4f can: gw: ensure DLC boundaries after CAN frame modification
   58e9f5227691 tty: Don't hold ldisc lock in tty_reopen() if ldisc present
   c6e522371001 tty: Simplify tty->count math in tty_reopen()
   e3ac534b8aa5 tty: Hold tty_ldisc_lock() during tty_reopen()
   3456ecaf8d34 tty/ldsem: Wake up readers after timed out down_write()
   2b1afc9c3506 Btrfs: use nofs context when initializing security xattrs to avoid deadlock
   403d0f9134a7 Btrfs: fix access to available allocation bits when starting balance
   343ae5df68a2 KVM: arm/arm64: Fix VMID alloc race by reverting to lock-less
   42e3a4424b12 sunrpc: use-after-free in svc_process_common()
   39e372a81d13 mm: page_mapped: don't assume compound page is huge or THP
   845f8457893a ext4: track writeback errors using the generic tracking infrastructure
   a0e9782472b8 ext4: use ext4_write_inode() when fsyncing w/o a journal
   c60e8096cc4d ext4: avoid kernel warning when writing the superblock to a dead device
   3ec6f7792def ext4: fix a potential fiemap/page fault deadlock w/ inline_data
   02d823cdb2a4 ext4: make sure enough credits are reserved for dioread_nolock writes
   154261392771 rbd: don't return 0 on unmap if RBD_DEV_FLAG_REMOVING is set
   98213a9d5ce0 drm/amdgpu: Don't fail resume process if resuming atomic state fails
   dc2660871a4a drm/amdgpu: Don't ignore rc from drm_dp_mst_topology_mgr_resume()
   26089047b42c drm/amd/display: Fix MST dp_blank REG_WAIT timeout
   003d29ca6fba PCI: dwc: Move interrupt acking into the proper callback
   b90e95417c02 PCI: dwc: Take lock when ACKing an interrupt
   d51df9e16301 PCI: dwc: Use interrupt masking instead of disabling
   c122260b25cd drm/amdgpu: Add new VegaM pci id
   789040bc5039 vfio/type1: Fix unmap overflow off-by-one
   86cecca3d93e i2c: dev: prevent adapter retries and timeout being set as minus value
   50558f1ca67b ACPI / PMIC: xpower: Fix TS-pin current-source handling
   4b75905144c7 ACPI: power: Skip duplicate power resource references in _PRx
   c78b2116c9d7 mm, memcg: fix reclaim deadlock with writeback
   8bf6869b4d75 mm/usercopy.c: no check page span for stack objects
   d6c879709135 slab: alien caches must not be initialized if the allocation of the alien cache failed
   bb1c250d55ff USB: Add USB_QUIRK_DELAY_CTRL_MSG quirk for Corsair K70 RGB
   39fa1b192449 USB: storage: add quirk for SMI SM3350
   4385b42a4cc2 USB: storage: don't insert sane sense for SPC3+ when bad sense specified
   d10e7b64e2b3 usb: cdc-acm: send ZLP for Telit 3G Intel based modems
   af318dc8d1f4 cifs: Fix potential OOB access of lock element array
   4c26d3a072da CIFS: Do not hide EINTR after sending network packets
   50c6b89008ec CIFS: Fix adjustment of credits for MTU requests
   a7eb3c3dc214 ALSA: hda/realtek - Disable headset Mic VREF for headset mode of ALC225
   dcb78b2a6e1c ALSA: hda/realtek - Add unplug function into unplug state of Headset Mode for ALC225
   26b78760c7ae ALSA: hda/realtek - Support Dell headset mode for New AIO platform
   94ddf9e27eb5 cpufreq: scmi: Fix frequency invariance in slow path
   516c5e5f484f Revert "x86/hyper-v: Check cpumask_to_vpset() return value in hyperv_flush_tlb_others_ex()"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_4.18.bb               |  4 ++--
 .../linux/linux-yocto-tiny_4.18.bb             |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.18.bb  | 18 +++++++++---------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
index 6ecb57efa4..9b8609b425 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.18.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ad21eff3cd97f23ceecad649f7f669223d218959"
+SRCREV_machine ?= "917ee880b11f569d7a1118dc3575fd24d8ff349b"
 SRCREV_meta ?= "9e348b6f9db185cb60a34d18fd14a18b5def2c31"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.18.26"
+LINUX_VERSION ?= "4.18.27"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
index 9ff5913c07..0be7f0889a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.18.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.18.26"
+LINUX_VERSION ?= "4.18.27"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "0a2fc6e7fa406b0667c4b45f88f71c37edebdde9"
-SRCREV_machine ?= "5dacbcd48c2352caaa87d62bfbec5779b709f17f"
+SRCREV_machine_qemuarm ?= "8f59516428463985f2a636b024b6c3f1b2178855"
+SRCREV_machine ?= "62f0a3acffffd555f68ed97d5e4faade2b28f3c0"
 SRCREV_meta ?= "9e348b6f9db185cb60a34d18fd14a18b5def2c31"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.18.bb b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
index 10c7ee8dce..4a9febc062 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.18.bb
@@ -11,21 +11,21 @@ KBRANCH_qemux86  ?= "v4.18/standard/base"
 KBRANCH_qemux86-64 ?= "v4.18/standard/base"
 KBRANCH_qemumips64 ?= "v4.18/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "49fc5ca3eeb33c93ee551b778db488b630018e1b"
-SRCREV_machine_qemuarm64 ?= "5dacbcd48c2352caaa87d62bfbec5779b709f17f"
-SRCREV_machine_qemumips ?= "8347c02073d6e0a388bb2f055cd026b4fc2560a6"
-SRCREV_machine_qemuppc ?= "5dacbcd48c2352caaa87d62bfbec5779b709f17f"
-SRCREV_machine_qemux86 ?= "5dacbcd48c2352caaa87d62bfbec5779b709f17f"
-SRCREV_machine_qemux86-64 ?= "5dacbcd48c2352caaa87d62bfbec5779b709f17f"
-SRCREV_machine_qemumips64 ?= "e8d0920e7ed5fb0da4eed2ea3872f904583ad824"
-SRCREV_machine ?= "5dacbcd48c2352caaa87d62bfbec5779b709f17f"
+SRCREV_machine_qemuarm ?= "e66e05d38c1a0eda0db1f34090ecf7155226fa4c"
+SRCREV_machine_qemuarm64 ?= "62f0a3acffffd555f68ed97d5e4faade2b28f3c0"
+SRCREV_machine_qemumips ?= "5fb9275fdd72ccd5f61cbbce5fef842fbcf3c957"
+SRCREV_machine_qemuppc ?= "62f0a3acffffd555f68ed97d5e4faade2b28f3c0"
+SRCREV_machine_qemux86 ?= "62f0a3acffffd555f68ed97d5e4faade2b28f3c0"
+SRCREV_machine_qemux86-64 ?= "62f0a3acffffd555f68ed97d5e4faade2b28f3c0"
+SRCREV_machine_qemumips64 ?= "19cccc092a7fe2337153c65045bded55ae4d5e4b"
+SRCREV_machine ?= "62f0a3acffffd555f68ed97d5e4faade2b28f3c0"
 SRCREV_meta ?= "9e348b6f9db185cb60a34d18fd14a18b5def2c31"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.18;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.18.26"
+LINUX_VERSION ?= "4.18.27"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


