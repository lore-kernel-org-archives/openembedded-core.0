Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id BDE3B7E418
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 12:44:48 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id j204so3797731ite.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 05:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=3cp6auky69uvQZ5E5lK6XAGuKjOrlpr9skG7RiM/zNs=;
	b=lDnINWrKv8QE09NCAPshGtjcgMyTQoRS6KM9lRJpjKPX/zsCawF9//D5Mm5d5brk8K
	oa8ErXIRBim++0G6vdgCQDt/22pNS2qVoIf3gpOKgF8k46ytO5tFKalDRCLC0Q9uRE4F
	OSoOh7NqABVGF9W0jrJN50bPXlAkrMv7MZK0c9zTx9Bf5lFCBzehKVpi2QzyQH6HhahU
	wyiJ6uLXxQIf6ze/57mY5bWjUBSy2Qt/sp8GVAxSCqn9/yjXKunfe1fcCAl5Rv2ieNSK
	hdkCSBKLW1BWvsZu4HKQtcC9lOrzg6HMBqXg5YNhm9n9Sh4HH9VgJud3IMpGc6G8RNug
	4IOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=3cp6auky69uvQZ5E5lK6XAGuKjOrlpr9skG7RiM/zNs=;
	b=fKULZtKFR7w6rzhMk0pf0FvJ6nzX8E9TfzAW2+j9ZRANP8xeMCZ21aCcY2Xe1rXoON
	AChT55txUOFLrXW5mOXyZtdWPYqfAZjDAoYKVW+JUQbBSs9DrthQuTI02LFgXpSp/YWy
	NNCIqQY/57N34aeyXh2yHmYqnLSJnjMmeMsl4Ve7Uc8b2l3mMT+UJbulTMcvVtVhhNpo
	fNujiShy/s3I0nSByUaCHbdLDinn3dnhLAdE5FXjaEe0MW8SdwNrtTrfNzW7l8MKhAoa
	8iVSU569emrMY7Dut4Ta+naVJQLPBQrgqtgMYCUuJ0X/9sQWaX4Q7gEGsgdckxw6r4Co
	xdiA==
X-Gm-Message-State: APjAAAUnWyBD1KaiQLYE40qBBlKID6G1qAQn/30fDMpDacMrATAKjXUM
	rEcWrwj44amRXNVL/Hxkd/QfOuTm3sc=
X-Google-Smtp-Source: APXvYqxZ66/jv28L7UZ7rT089klovQogzRJFw0WhNcWcYBg0En0S7cAcX6sBlgAHVKrRL/4qNkzSGA==
X-Received: by 2002:a24:2249:: with SMTP id o70mr2558279ito.101.1559220289055; 
	Thu, 30 May 2019 05:44:49 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	s70sm1034266itb.16.2019.05.30.05.44.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 05:44:48 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu, 30 May 2019 08:44:36 -0400
Message-Id: <720e188ef8921212a20c7035b138aeda98a37322.1559220004.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1559220004.git.bruce.ashfield@gmail.com>
References: <cover.1559220004.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] linux-yocto/4.19: update to v4.19.40
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
X-List-Received-Date: Thu, 30 May 2019 12:44:49 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating to the latest -stable release which comprises the following
changes:

   1656b1457209 Linux 4.19.40
   cc313d405b0c ath10k: Drop WARN_ON()s that always trigger during system resume
   d0a5000f10e7 ALSA: line6: use dynamic buffers
   68d49ff47789 KVM: nVMX: Fix size checks in vmx_set_nested_state
   499bbe739d5a KVM: x86: Whitelist port 0x7e for pre-incrementing %rip
   d0771bd41c27 net/tls: fix copy to fragments in reencrypt
   dd424182bc2d net/tls: don't copy negative amounts of data in reencrypt
   f1fd68e93409 bnxt_en: Fix uninitialized variable usage in bnxt_rx_pkt().
   396350737326 bnxt_en: Free short FW command HWRM memory in error path in bnxt_init_one()
   09a921361353 bnxt_en: Improve multicast address setup logic.
   6a57fa6fa7d5 packet: validate msg_namelen in send directly
   7a42cf4dfa43 selftests: fib_rule_tests: print the result and return 1 if any tests failed
   b563e9bbabfe sctp: avoid running the sctp state machine recursively
   fdd36abd9d09 rxrpc: Fix net namespace cleanup
   a976384b9553 net/tls: avoid NULL pointer deref on nskb->sk in fallback
   1d412d873a12 net: phy: marvell: Fix buffer overrun with stats counters
   b48a0a1207e9 net: dsa: bcm_sf2: fix buffer overflow doing set_rxnfc
   485f382f2c6d l2tp: use rcu_dereference_sk_user_data() in l2tp_udp_encap_recv()
   e571a33963f4 l2ip: fix possible use-after-free
   f78ec0cd0664 ipv6: invert flowlabel sharing check in process and user mode
   39eddbb7cab3 ipv6/flowlabel: wait rcu grace period before put_pid()
   1a9e0134af40 ipv6: fix races in ip6_dst_destroy()
   7ea4f000c41f ipv6: A few fixes on dereferencing rt->from
   3f611a479962 ipv4: ip_do_fragment: Preserve skb_iif during fragmentation
   ad119c970bbe Linux 4.19.39
   ee096f0dc4a4 leds: trigger: netdev: use memcpy in device_name_store
   2663959af22c leds: pca9532: fix a potential NULL pointer dereference
   13a6a6dd3c11 ptrace: take into account saved_sigmask in PTRACE{GET,SET}SIGMASK
   71f3397a1c31 iommu/amd: Reserve exclusion range in iova-domain
   75a5e3e6340c kconfig/[mn]conf: handle backspace (^H) key
   458a65c71029 perf machine: Update kernel map address and re-order properly
   60d3b51d05a7 nvme-multipath: relax ANA state check
   a918af5b6fd8 gpio: of: Fix of_gpiochip_add() error path
   43dba153d52b libata: fix using DMA buffers on stack
   6a364b2e47a6 x86/mm: Don't exceed the valid physical address space
   a138f995ab84 scsi: zfcp: reduce flood of fcrscn1 trace records on multi-element RSCN
   97c4f3a8853c ceph: fix use-after-free on symlink traversal
   90ce58d457c2 usb: u132-hcd: fix resource leak
   fe71e625e23f x86/realmode: Don't leak the trampoline kernel address
   04cac1dce923 leds: trigger: netdev: fix refcnt leak on interface rename
   0018c21f34d6 usb: usb251xb: fix to avoid potential NULL pointer dereference
   4135e588274e scsi: qla4xxx: fix a potential NULL pointer dereference
   a2b302e4f2fb scsi: aacraid: Insure we don't access PCIe space during AER/EEH
   2c8c8ef8d3b4 scsi: mpt3sas: Fix kernel panic during expander reset
   6222f1c6ed97 ARM: davinci: fix build failure with allnoconfig
   5d545dde8d9d drm/meson: Uninstall IRQ handler
   efa69a66697c drm/meson: Fix invalid pointer in meson_drv_unbind()
   c87a5086d354 gpio: aspeed: fix a potential NULL pointer dereference
   c5eb9a424ebd drm: Fix drm_release() and device unplug
   11242181f52f net: ethernet: ti: fix possible object reference leak
   ae6e6bbc1741 net: ibm: fix possible object reference leak
   b9c8db41912f net: xilinx: fix possible object reference leak
   b989a3e9d260 NFS: Fix a typo in nfs_init_timeout_values()
   e0c34051669c drm/tegra: hub: Fix dereference before check
   abd76731f899 ARM: dts: imx6qdl: Fix typo in imx6qdl-icore-rqs.dtsi
   2b0e6d6bf088 net/sched: don't dereference a->goto_chain to read the chain index
   b435a79e5a87 net: macb: Add null check for PCLK and HCLK
   f85682bc594a staging: rtlwifi: Fix potential NULL pointer dereference of kzalloc
   c5750b45e406 staging: rtl8712: uninitialized memory in read_bbreg_hdl()
   5a5f1decd6fc staging: rtlwifi: rtl8822b: fix to avoid potential NULL pointer dereference
   d55bfd0746ae staging: rtl8188eu: Fix potential NULL pointer dereference of kcalloc
   bfa4cd06a902 net: ks8851: Set initial carrier state to down
   3796ab4828ed net: ks8851: Delay requesting IRQ until opened
   3005509f88e3 net: ks8851: Reassert reset pin if chip ID check fails
   fb6ca157d738 net: ks8851: Dequeue RX packets explicitly
   cdef35e83c3f i2c: i801: Add support for Intel Comet Lake
   c6694e7c8bf6 ARM: dts: pfla02: increase phy reset duration
   41be4abfb04d usb: gadget: net2272: Fix net2272_dequeue()
   edaebfe7721c usb: gadget: net2280: Fix net2280_dequeue()
   346eab0d1559 usb: gadget: net2280: Fix overrun of OUT messages
   710d4f29fe38 usb: dwc3: pci: add support for Comet Lake PCH ID
   e4705ae72736 KVM: arm/arm64: vgic-its: Take the srcu lock when parsing the memslots
   0371fa033741 KVM: arm/arm64: vgic-its: Take the srcu lock when writing to guest memory
   51a5d70a59ee KVM: arm64: Reset the PMU in preemptible context
   2ba0421f2b77 serial: ar933x_uart: Fix build failure with disabled console
   1d815c5a9434 sc16is7xx: missing unregister/delete driver on error in sc16is7xx_init()
   2cbb465e526a ARM: imx51: fix a leaked reference by adding missing of_node_put
   f67021192cc1 s390/qeth: fix race when initializing the IP address table
   e634fc48661f netfilter: ip6t_srh: fix NULL pointer dereferences
   506375f509b8 netfilter: fix NETFILTER_XT_TARGET_TEE dependencies
   a5374a3086d6 netfilter: bridge: set skb transport_header before entering NF_INET_PRE_ROUTING
   5f7e5b9bba19 netfilter: nft_set_rbtree: check for inactive element after flag mismatch
   2fbb4c48f138 staging, mt7621-pci: fix build without pci support
   99f1ba88d7f8 staging: axis-fifo: add CONFIG_OF dependency
   947bd0d9bdbc xsk: fix umem memory leak on cleanup
   fc055dffa575 qlcnic: Avoid potential NULL pointer dereference
   98650508a9d0 net: stmmac: don't set own bit too early for jumbo frames
   24a46cad0e18 ieee802154: hwsim: propagate genlmsg_reply return code
   f722b7789afa net: ieee802154: fix a potential NULL pointer dereference
   a1e34e289e15 s390: limit brk randomization to 32MB
   d52dfdf1845d ARM: dts: bcm283x: Fix hdmi hpd gpio pull
   0311ff82b70f fs: prevent page refcount overflow in pipe_buf_get
   d972ebbf42ba mm: prevent get_user_pages() from overflowing page refcount
   0612cae7ec6b mm: add 'try_get_page()' helper function
   9f6da5fd0557 mm: make page ref count overflow check tighter and more explicit
   99ae2bd0772f Revert "ACPICA: Clear status of GPEs before enabling them"
   145f6a70bb9b selinux: use kernel linux/socket.h for genheaders and mdp
   a03957ab0fd5 Linux 4.19.38
   5cb299c80651 powerpc/fsl: Add FSL_PPC_BOOK3E as supported arch for nospectre_v2 boot arg
   53db65232428 net/tls: don't leak IV and record seq when offload fails
   d3bdd359fa53 net/tls: avoid potential deadlock in tls_set_device_offload_rx()
   041b3224e8f8 net/mlx5e: Fix use-after-free after xdp_return_frame
   ae6b07107458 net/mlx5e: Fix the max MTU check in case of XDP
   b08774d38882 mlxsw: spectrum: Put MC TCs into DWRR mode
   21e47998d959 mlxsw: pci: Reincrease PCI reset timeout
   e875a409594b net: hns: Fix WARNING when hns modules installed
   7ce836e8a963 team: fix possible recursive locking when add slaves
   1f78e75e85bb stmmac: pci: Adjust IOT2000 matching
   e97f0bc7be88 net/tls: fix refcount adjustment in fallback
   b02f8aa85604 net: stmmac: move stmmac_check_ether_addr() to driver probe
   d7b10dfe6c31 net/rose: fix unbound loop in rose_loopback_timer()
   ed1866aa608a net: rds: exchange of 8K and 1M pool
   7da11d6a5d85 net/mlx5e: ethtool, Remove unsupported SFP EEPROM high pages query
   829fd9849e44 mlxsw: spectrum: Fix autoneg status in ethtool
   250e51f856e1 ipv4: set the tcp_min_rtt_wlen range from 0 to one day
   07445fea9575 ipv4: add sanity checks in ipv4_link_failure()
   d4ff57d0320b x86/fpu: Don't export __kernel_fpu_{begin,end}()
   423497a96d4a mm: Fix warning in insert_pfn()
   e923c6b70ce2 x86/retpolines: Disable switch jump tables when retpolines are enabled
   6cfcff3cfb0e x86, retpolines: Raise limit for generating indirect calls from switch-case
   e9e47779aaa7 Fix aio_poll() races
   aab66dfb757a aio: store event at final iocb_put()
   c20202c51d2b aio: keep io_event in aio_kiocb
   592ea630b081 aio: fold lookup_kiocb() into its sole caller
   c7f2525abfec pin iocb through aio.
   d6b2615f7d31 aio: simplify - and fix - fget/fput for io_submit()
   2afa01cd9186 aio: initialize kiocb private in case any filesystems expect it.
   a812f7b68a39 aio: abstract out io_event filler helper
   d384f8b855a5 aio: split out iocb copy from io_submit_one()
   4d677689742a aio: use iocb_put() instead of open coding it
   ef529eead8cf aio: don't zero entire aio_kiocb aio_get_req()
   730198c889d8 aio: separate out ring reservation from req allocation
   b3373253f0ba aio: use assigned completion handler
   9101cbe70ef6 aio: clear IOCB_HIPRI
   920ecc72093d rxrpc: fix race condition in rxrpc_input_packet()
   5a228d5ddca2 net/rds: Check address length before reading address family
   e30203e4f94d net: netrom: Fix error cleanup path of nr_proto_init
   a0cb0faa15f3 tipc: check link name with right length in tipc_nl_compat_link_set
   f21fae8049cd tipc: check bearer name with right length in tipc_nl_compat_bearer_enable
   9b9b0df4e788 fm10k: Fix a potential NULL pointer dereference
   f7dc13d6e4a2 netfilter: ebtables: CONFIG_COMPAT: drop a bogus WARN_ON
   94ad68a6e570 NFS: Forbid setting AF_INET6 to "struct sockaddr_in"->sin_family.
   245a94a0ffab sched/deadline: Correctly handle active 0-lag timers
   6bf7d3c5c0c5 binder: fix handling of misaligned binder object
   8c37f7c23c02 workqueue: Try to catch flush_work() without INIT_WORK().
   4d476a00b3f9 fs/proc/proc_sysctl.c: Fix a NULL pointer dereference
   bce00f419c9d intel_th: gth: Fix an off-by-one in output unassigning
   9c8c39bae89a slip: make slhc_free() silently accept an error pointer
   f41d2de67101 USB: Consolidate LPM checks to avoid enabling LPM twice
   50cda8891818 USB: Add new USB LPM helpers
   8c700e902ceb drm/vc4: Fix compilation error reported by kbuild test bot
   2bc7ce32eb21 Revert "drm/i915/fbdev: Actually configure untiled displays"
   2c892ef09435 drm/vc4: Fix memory leak during gpu reset.
   087341c0f40d powerpc/mm/radix: Make Radix require HUGETLB_PAGE
   478afe341d29 ARM: 8857/1: efi: enable CP15 DMB instructions before cleaning the cache
   129c337c6659 dmaengine: sh: rcar-dmac: Fix glitch in dmaengine_tx_status
   0f00e1c599b3 dmaengine: sh: rcar-dmac: With cyclic DMA residue 0 is valid
   f7b467ad1be0 vfio/type1: Limit DMA mappings per container
   ac9e2bece112 Input: synaptics-rmi4 - write config register values to the right offset
   37ecf31a3e5e perf/x86/intel: Update KBL Package C-state events to also include PC8/PC9/PC10 counters
   c0309570a5f1 sunrpc: don't mark uninitialised items as VALID.
   b4d4b5e4b839 nfsd: Don't release the callback slot unless it was actually held
   950eec812600 ceph: fix ci->i_head_snapc leak
   246d2bf32da1 ceph: ensure d_name stability in ceph_dentry_hash()
   8d693ef0141c ceph: only use d_name directly when parent is locked
   9b8c07129ddf sched/numa: Fix a possible divide-by-zero
   1af34bf97eca RDMA/mlx5: Do not allow the user to write to the clock page
   8ac57d1bdc25 IB/rdmavt: Fix frwr memory registration
   d0264d10ae6a trace: Fix preempt_enable_no_resched() abuse
   7f9c9d1d79fd MIPS: scall64-o32: Fix indirect syscall number load
   ce900ddd660d lib/Kconfig.debug: fix build error without CONFIG_BLOCK
   710733e539d1 zram: pass down the bvec we need to read into in the work struct
   a19e4a1b4c63 gpio: eic: sprd: Fix incorrect irq type setting for the sync EIC
   cffeb9c84d20 tracing: Fix buffer_ref pipe ops
   0e78e92da2d8 tracing: Fix a memory leak by early error exit in trace_pid_write()
   ee231063ff95 cifs: do not attempt cifs operation on smb2+ rename error
   d5bf783a09a0 cifs: fix memory leak in SMB2_read
   15e978391577 net: dsa: mv88e6xxx: add call to mv88e6xxx_ports_cmode_init to probe for new DSA framework
   984c4e00c387 ALSA: hda/ca0132 - Fix build error without CONFIG_PCI
   1e0cab1bce57 powerpc/vdso32: fix CLOCK_MONOTONIC on PPC64
   ae5e0c773ca6 ipvs: fix warning on unused variable
   8e59639791f2 vsock/virtio: fix kernel panic from virtio_transport_reset_no_sock
   416699b9bb90 drm/rockchip: fix for mailbox read validation.
   1832b1517c2b loop: do not print warn message if partition scan is successful
   070e34b627f4 tipc: handle the err returned from cmd header function
   8766cc7d0d1d ext4: fix some error pointer dereferences
   816e3e2258e8 net: mvpp2: fix validate for PPv2.1
   e7ddd6af17e4 net/ibmvnic: Fix RTNL deadlock during device reset
   ffc1d85e8c5f netfilter: nf_tables: bogus EBUSY in helper removal from transaction
   e313d5da057b netfilter: nf_tables: bogus EBUSY when deleting set after flush
   25ddad73070c netfilter: nf_tables: fix set double-free in abort path
   8906234c5015 netfilter: nft_compat: use .release_ops and remove list of extension
   4f67e8976f7b netfilter: nft_compat: don't use refcount_inc on newly allocated entry
   af26f3e2903b netfilter: nf_tables: unbind set in rule from commit path
   27458b5457d3 netfilter: nf_tables: warn when expr implements only one of activate/deactivate
   cb2e343d1d85 netfilter: nft_compat: destroy function must not have side effects
   3dbba8ebb066 netfilter: nf_tables: split set destruction in deactivate and destroy phase
   7693bae6b314 netfilter: nft_compat: make lists per netns
   db99f122cbf8 netfilter: nft_compat: use refcnt_t type for nft_xt reference count
   19bb613acb9a Linux 4.19.37
   cdd369fe0f98 kernel/sysctl.c: fix out-of-bounds access when setting file-max
   ac54bc121e1f Revert "locking/lockdep: Add debug_locks check in __lock_downgrade()"
   9c1862566176 i2c-hid: properly terminate i2c_hid_dmi_desc_override_table[] array
   52dde1160f17 ASoC: rockchip: add missing INTERLEAVED PCM attribute
   a782f8475715 tools include: Adopt linux/bits.h
   6580376fe810 percpu: stop printing kernel addresses
   8a6f2ea0c3dd ALSA: info: Fix racy addition/deletion of nodes
   1343fd8f9629 mm/vmstat.c: fix /proc/vmstat format for CONFIG_DEBUG_TLBFLUSH=y CONFIG_SMP=n
   628c99a836dd device_cgroup: fix RCU imbalance in error case
   c3edd427d538 sched/fair: Limit sched_cfs_period_timer() loop to avoid hard lockup
   c21bcc2352e9 Revert "kbuild: use -Oz instead of -Os when using clang"
   1c36862e8be8 tpm: Fix the type of the return value in calc_tpm2_event_size()
   18af9b7b9138 tpm/tpm_i2c_atmel: Return -E2BIG when the transfer is incomplete
   7de43cb71116 modpost: file2alias: check prototype of handler
   aa0e8cc9d7a8 modpost: file2alias: go back to simple devtable lookup
   87eadc0b8c2a mmc: sdhci: Handle auto-command errors
   ba8a6c055677 mmc: sdhci: Rename SDHCI_ACMD12_ERR and SDHCI_INT_ACMD12ERR
   b2be40b73b29 mmc: sdhci: Fix data command CRC error handling
   be608583d9c4 nfit/ars: Avoid stale ARS results
   40221d56ae28 nfit/ars: Allow root to busy-poll the ARS state machine
   bc18c2593635 nfit/ars: Introduce scrub_flags
   82a13a006ed5 nfit/ars: Remove ars_start_flags
   cd37fd46b485 timers/sched_clock: Prevent generic sched_clock wrap caused by tick_freeze()
   5680b0635cda x86/speculation: Prevent deadlock on ssb_state::lock
   90e17512f1e4 perf/x86: Fix incorrect PEBS_REGS
   293926b37013 x86/cpu/bugs: Use __initconst for 'const' init data
   f45829e6250a perf/x86/amd: Add event map for AMD Family 17h
   ba407222f563 drm/amdgpu/gmc9: fix VM_L2_CNTL3 programming
   39cad03c4360 mac80211: do not call driver wake_tx_queue op during reconfig
   852de0d53d14 rt2x00: do not increment sequence number while re-transmitting
   23a926e5edd9 kprobes: Fix error check when reusing optimized probes
   426e2a8024c2 kprobes: Mark ftrace mcount handler functions nokprobe
   1fab567a270b x86/kprobes: Verify stack frame on kretprobe
   5105fc758bdc arm64: futex: Restore oldval initialization to work around buggy compilers
   96800ba9e565 drm/ttm: fix out-of-bounds read in ttm_put_pages() v2
   fbe5cff93229 crypto: x86/poly1305 - fix overflow during partial reduction
   dacdbc115d23 ipmi: fix sleep-in-atomic in free_user at cleanup SRCU user->release_barrier
   6ff17bc5936e coredump: fix race condition between mmget_not_zero()/get_task_mm() and core dumping
   3e1b3e4d3c83 Revert "svm: Fix AVIC incomplete IPI emulation"
   ee4b8e266229 Revert "scsi: fcoe: clear FC_RP_STARTED flags when receiving a LOGO"
   1aa2682d0a98 scsi: core: set result when the command cannot be dispatched
   8f2ef0e8f967 vt: fix cursor when clearing the screen
   38b7f09a9e83 serial: sh-sci: Fix HSCIF RX sampling point calculation
   de6d6b8902fb serial: sh-sci: Fix HSCIF RX sampling point adjustment
   ec96f65e1214 Input: elan_i2c - add hardware ID for multiple Lenovo laptops
   b50e435df2d8 ALSA: core: Fix card races between register and disconnect
   4171b6ee9328 ALSA: hda/realtek - add two more pin configuration sets to quirk table
   4e78a1fb8d1d staging: comedi: ni_usb6501: Fix possible double-free of ->usb_rx_buf
   09f9bacae118 staging: comedi: ni_usb6501: Fix use of uninitialized mutex
   edf2f548baa9 staging: comedi: vmk80xx: Fix possible double-free of ->usb_rx_buf
   1f01a970b8c2 staging: comedi: vmk80xx: Fix use of uninitialized semaphore
   a1da981f6643 staging: most: core: use device description as name
   b007c64d860f io: accel: kxcjk1013: restore the range after resume.
   bbe0bed4647c iio: core: fix a possible circular locking dependency
   98171e1947b6 iio: adc: at91: disable adc channel interrupt in timeout case
   36971130bb2f iio: Fix scan mask selection
   0e47edde9132 iio: dac: mcp4725: add missing powerdown bits in store eeprom
   5ad173ea6c3a iio: ad_sigma_delta: select channel when reading register
   42eae0cff22a iio: cros_ec: Fix the maths for gyro scale calculation
   adfb0f0b17a3 iio:chemical:bme680: Fix SPI read interface
   a3117576a73f iio:chemical:bme680: Fix, report temperature in millidegrees
   f7ee6890caa5 iio/gyro/bmg160: Use millidegrees for temperature scale
   8bd3fd46ec23 iio: gyro: mpu3050: fix chip ID reading
   6f3e66b155f0 staging: iio: ad7192: Fix ad7193 channel address
   c54d1258c637 Staging: iio: meter: fixed typo
   c9e34935a351 KVM: x86: svm: make sure NMI is injected after nmi_singlestep
   18cf09a81771 KVM: x86: Don't clear EFER during SMM transitions for 32-bit vCPU
   2fcee5eaae6e cifs: fix handle leak in smb2_query_symlink()
   c69330a855ab cifs: Fix use-after-free in SMB2_read
   8fb89b43b65f cifs: Fix use-after-free in SMB2_write
   8092ecc306d8 CIFS: keep FileInfo handle live during oplock break
   6e2081f29392 net: IP6 defrag: use rbtrees in nf_conntrack_reasm.c
   684685326ab0 net: IP6 defrag: use rbtrees for IPv6 defrag
   702ddf862d9d net: IP defrag: encapsulate rbtree defrag code into callable functions
   e24be8e38cd7 sch_cake: Simplify logic in cake_select_tin()
   8d9051a4680a nfp: flower: remove vlan CFI bit from push vlan action
   06f7d2182f9d nfp: flower: replace CFI with vlan present
   cbce0413f783 sch_cake: Make sure we can write the IP header before changing DSCP bits
   490532225e20 sch_cake: Use tc_skb_protocol() helper for getting packet protocol
   5f72cb2ab51d route: Avoid crash from dereferencing NULL rt->from
   1d2499b08600 net/mlx5: FPGA, tls, idr remove on flow delete
   785833b9eee0 net/tls: prevent bad memory access in tls_is_sk_tx_device_offloaded()
   7cfddb81a817 net/mlx5: FPGA, tls, hold rcu read lock a bit longer
   d1785bea2f34 net: thunderx: don't allow jumbo frames with XDP
   9de22b997fe4 net: thunderx: raise XDP MTU to 1508
   7ba5ec69e1a7 ipv4: ensure rcu_read_lock() in ipv4_link_failure()
   8a430e56a648 ipv4: recompile ip options in ipv4_link_failure
   b82df42059fb vhost: reject zero size iova range
   242e5746cb47 tipc: missing entries in name table of publications
   a60a47206a31 team: set slave to promisc if team is already in promisc mode
   6728c6174a47 tcp: tcp_grow_window() needs to respect tcp_space()
   1cd878836822 net: fou: do not use guehdr after iptunnel_pull_offloads in gue_udp_recv
   2804598764f9 net: Fix missing meta data in skb with vlan packet
   97fd88e04c8d net: bridge: multicast: use rcu to access port list from br_multicast_start_querier
   08b0b4f28008 net: bridge: fix per-port af_packet sockets
   bcb964012d1b net: atm: Fix potential Spectre v1 vulnerabilities
   fae6053d7611 failover: allow name change on IFF_UP slave interfaces
   2a458eddc4c2 bonding: fix event handling for stacked bonds
   c98875d930e9 Linux 4.19.36
   0c00f71e7d7c appletalk: Fix compile regression
   9e91db59e3b9 mm: hide incomplete nr_indirectly_reclaimable in sysfs
   d49dea545af4 mm: hide incomplete nr_indirectly_reclaimable in /proc/zoneinfo
   7a4626798276 IB/hfi1: Failed to drain send queue when QP is put into error state
   e8eef7ad9841 bpf: fix use after free in bpf_evict_inode
   40c6d718d78c include/linux/swap.h: use offsetof() instead of custom __swapoffset macro
   48b0309f85ae f2fs: fix to dirty inode for i_mode recovery
   11582064271d rxrpc: Fix client call connect/disconnect race
   a7e90c1892d9 lib/div64.c: off by one in shift
   6c42507f426b appletalk: Fix use-after-free in atalk_proc_exit
   539282e9cd9b drm/amdkfd: use init_mqd function to allocate object for hid_mqd (CI)
   91583411b5d1 ARM: 8839/1: kprobe: make patch_lock a raw_spinlock_t
   1b871f39097a drm/nouveau/volt/gf117: fix speedo readout register
   ad854fa3c8dc PCI: Blacklist power management of Gigabyte X299 DESIGNARE EX PCIe ports
   4984d918cd46 coresight: cpu-debug: Support for CA73 CPUs
   2a3c322d46e0 Revert "ACPI / EC: Remove old CLEAR_ON_RESUME quirk"
   5f516d0ba082 crypto: axis - fix for recursive locking from bottom half
   862adb5b0da6 drm/panel: panel-innolux: set display off in innolux_panel_unprepare
   2be8987a076f lkdtm: Add tests for NULL pointer dereference
   55588aebde38 lkdtm: Print real addresses
   8387c1455d34 soc/tegra: pmc: Drop locking from tegra_powergate_is_powered()
   29b934dd5fa0 scsi: core: Avoid that system resume triggers a kernel warning
   38855a84d891 iommu/dmar: Fix buffer overflow during PCI bus notification
   8c5e9ea11730 net: ip6_gre: fix possible NULL pointer dereference in ip6erspan_set_version
   d7a90ee5aadd crypto: sha512/arm - fix crash bug in Thumb2 build
   1f52fa127898 crypto: sha256/arm - fix crash bug in Thumb2 build
   bbbe47463da9 xfrm: destroy xfrm_state synchronously on net exit path
   5be4bb315de2 net/rds: fix warn in rds_message_alloc_sgs
   d801282dfd2a ACPI: EC / PM: Disable non-wakeup GPEs for suspend-to-idle
   e434fbf4f049 ALSA: hda: fix front speakers on Huawei MBXP
   b10cc0837472 drm/ttm: Fix bo_global and mem_global kfree error
   cb09e99b9ad3 platform/x86: Add Intel AtomISP2 dummy / power-management driver
   491dee743d6b kernel: hung_task.c: disable on suspend
   e9603cffb1ca cifs: fallback to older infolevels on findfirst queryinfo retry
   fc34758d4af6 net: stmmac: Set OWN bit for jumbo frames
   8722566b7870 f2fs: cleanup dirty pages if recover failed
   263ed7e66b17 netfilter: nf_flow_table: remove flowtable hook flush routine in netns exit routine
   19e6ff0146ef compiler.h: update definition of unreachable()
   f35e2a685c81 KVM: nVMX: restore host state in nested_vmx_vmexit for VMFail
   3d11fc93aa28 HID: usbhid: Add quirk for Redragon/Dragonrise Seymur 2
   1424b7fefd6b ACPI / SBS: Fix GPE storm on recent MacBookPro's
   0d41c7b3860e usbip: fix vhci_hcd controller counting
   360186d8ab02 ARM: samsung: Limit SAMSUNG_PM_CHECK config option to non-Exynos platforms
   1475ce4ff957 pinctrl: core: make sure strcmp() doesn't get a null parameter
   8e271100efa6 HID: i2c-hid: override HID descriptors for certain devices
   09b6c08061bb Bluetooth: Fix debugfs NULL pointer dereference
   6496b9636f74 media: au0828: cannot kfree dev before usb disconnect
   6947d853be19 powerpc/pseries: Remove prrn_work workqueue
   7863304bc00f serial: uartps: console_setup() can't be placed to init section
   1f2b1c6ab353 netfilter: xt_cgroup: shrink size of v2 path
   14b183214c08 f2fs: fix to do sanity check with current segment number
   7fcce1828e5f ASoC: Fix UBSAN warning at snd_soc_get/put_volsw_sx()
   4369f8a38085 9p locks: add mount option for lock retry interval
   db77c7890ed7 9p: do not trust pdu content for stat item size
   f9368366b4d1 f2fs: fix to avoid NULL pointer dereference on se->discard_map
   de1fd69b6541 rsi: improve kernel thread handling to fix kernel panic
   93b7c722637c gpio: pxa: handle corner case of unprobed device
   13cc3e6b2a18 drm/cirrus: Use drm_framebuffer_put to avoid kernel oops in clean-up
   6fd66bec6d6a ext4: prohibit fstrim in norecovery mode
   83e3e89d6639 x86/gart: Exclude GART aperture from kcore
   40276e4e2fd0 fix incorrect error code mapping for OBJECTID_NOT_FOUND
   777cd2681b2d x86/hw_breakpoints: Make default case in hw_breakpoint_arch_parse() return an error
   cff04fad89b9 iommu/vt-d: Check capability before disabling protected memory
   181117a1b4f3 drm/nouveau/debugfs: Fix check of pm_runtime_get_sync failure
   276084f0e017 x86/cpu/cyrix: Use correct macros for Cyrix calls on Geode processors
   16dab2916615 x86/hyperv: Prevent potential NULL pointer dereference
   30d9b740e201 x86/hpet: Prevent potential NULL pointer dereference
   ac0343a48e7e irqchip/mbigen: Don't clear eventid when freeing an MSI
   f3c3b0f1fae5 irqchip/stm32: Don't clear rising/falling config registers at init
   41b1234677bd drm/exynos/mixer: fix MIXER shadow registry synchronisation code
   bde271d1ad0e blk-iolatency: #include "blk.h"
   b63df738ce7d PM / Domains: Avoid a potential deadlock
   19302c51c043 ACPI / utils: Drop reference in test for device presence
   00059edd3121 perf tests: Fix a memory leak in test__perf_evsel__tp_sched_test()
   2c843ae984a8 perf tests: Fix memory leak by expr__find_other() in test__expr()
   a077618a3af8 perf tests: Fix a memory leak of cpu_map object in the openat_syscall_event_on_all_cpus test
   cf050670d092 perf evsel: Free evsel->counts in perf_evsel__exit()
   28848061d882 perf hist: Add missing map__put() in error case
   bb644ded9e6d perf top: Fix error handling in cmd_top()
   df894a047f37 perf build-id: Fix memory leak in print_sdt_events()
   871aa38e9525 perf config: Fix a memory leak in collect_config()
   9007d724cb08 perf config: Fix an error in the config template documentation
   93d449bd6552 perf list: Don't forget to drop the reference to the allocated thread_map
   c5d9104281b9 tools/power turbostat: return the exit status of a command
   ada35b525486 x86/mm: Don't leak kernel addresses
   52466ab20393 sched/core: Fix buffer overflow in cgroup2 property cpu.max
   a8c1de3ab8b6 sched/cpufreq: Fix 32-bit math overflow
   a629c32ac2d1 scsi: iscsi: flush running unbind operations when removing a session
   5b67d518eaaf thermal/intel_powerclamp: fix truncated kthread name
   193dd213bebd thermal/int340x_thermal: fix mode setting
   10313672b3f0 thermal/int340x_thermal: Add additional UUIDs
   c5161c689e81 thermal: bcm2835: Fix crash in bcm2835_thermal_debugfs
   8fd403fc2a8e thermal: samsung: Fix incorrect check after code merge
   0644ee713c00 thermal/intel_powerclamp: fix __percpu declaration of worker_data
   a803600c5b90 ALSA: opl3: fix mismatch between snd_opl3_drum_switch definition and declaration
   94a6f47a5ecb mmc: davinci: remove extraneous __init annotation
   f596ad9ea8a4 i40iw: Avoid panic when handling the inetdev event
   74ed2226e65a IB/mlx4: Fix race condition between catas error reset and aliasguid flows
   5e4dc4b6fc10 drm/udl: use drm_gem_object_put_unlocked.
   cbba1f554b4f auxdisplay: hd44780: Fix memory leak on ->remove()
   317e716a8ad9 ALSA: sb8: add a check for request_region
   17829309ec00 ALSA: echoaudio: add a check for ioremap_nocache
   a793860c0f52 ext4: report real fs size after failed resize
   f5a94fd3b375 ext4: add missing brelse() in add_new_gdb_meta_bg()
   90a1327e4ed3 ext4: avoid panic during forced reboot
   673e23ce80a6 perf/core: Restore mmap record type correctly
   ca306c17d2ed inotify: Fix fsnotify_mark refcount leak in inotify_update_existing_watch()
   618490ba5841 arc: hsdk_defconfig: Enable CONFIG_BLK_DEV_RAM
   2296eedef0c5 ARC: u-boot args: check that magic number is correct
   4b0e041c9dad Linux 4.19.35
   59bf185ae6b7 KVM: x86: nVMX: fix x2APIC VTPR read intercept
   119031be7b0a KVM: x86: nVMX: close leak of L0's x2APIC MSRs (CVE-2019-3887)
   f8053df634d4 ACPICA: AML interpreter: add region addresses in global list during initialization
   fad502a9439e arm64: dts: rockchip: Fix vcc_host1_5v GPIO polarity on rk3328-rock64
   c963475972f6 arm64: dts: rockchip: fix vcc_host1_5v pin assign on rk3328-rock64
   aa9ee4b1ed46 dm integrity: fix deadlock with overlapping I/O
   469b40a429c5 dm table: propagate BDI_CAP_STABLE_WRITES to fix sporadic checksum errors
   4f5c99e0421c dm: revert 8f50e358153d ("dm: limit the max bio size as BIO_MAX_PAGES * PAGE_SIZE")
   30dc4d7b299d dm integrity: change memcmp to strncmp in dm_integrity_ctr
   5be6e02cfbdf PCI: pciehp: Ignore Link State Changes after powering off a slot
   250fef8de77c PCI: Add function 1 DMA alias quirk for Marvell 9170 SATA controller
   056264656a67 x86/perf/amd: Remove need to check "running" bit in NMI handler
   23d39b0af08e x86/perf/amd: Resolve NMI latency issues for active PMCs
   e5a791b4ab56 x86/perf/amd: Resolve race condition when disabling PMC
   4b004504bfcc x86/asm: Use stricter assembly constraints in bitops
   356ae4deab4b x86/asm: Remove dead __GNUC__ conditionals
   f7b778b9007e xtensa: fix return_address
   cb75a0c5d381 sched/fair: Do not re-read ->h_load_next during hierarchical load calculation
   ed3adb562fc8 xen: Prevent buffer overflow in privcmd ioctl
   84c6c2af4c53 arm64: backtrace: Don't bother trying to unwind the userspace stack
   1ec54cee6333 arm64: dts: rockchip: fix rk3328 rgmii high tx error rate
   82a30a5d60e3 arm64: futex: Fix FUTEX_WAKE_OP atomic ops with non-zero result value
   4362ff977bc6 ARM: dts: at91: Fix typo in ISC_D0 on PC9
   627a7d5a4422 ARM: dts: am335x-evm: Correct the regulators for the audio codec
   57a9c1f40f5b ARM: dts: am335x-evmsk: Correct the regulators for the audio codec
   3ba48b3cf850 ARM: dts: rockchip: fix rk3288 cpu opp node reference
   32fdac09765d virtio: Honour 'may_reduce_num' in vring_create_virtqueue
   8b4f68b47448 genirq: Initialize request_mutex if CONFIG_SPARSE_IRQ=n
   cd5b06a93997 genirq: Respect IRQCHIP_SKIP_SET_WAKE in irq_chip_set_wake_parent()
   543bb48dc48b block: fix the return errno for direct IO
   2591bfc68282 block: do not leak memory in bio_copy_user_iov()
   7af20b60f6db riscv: Fix syscall_get_arguments() and syscall_set_arguments()
   54fb5c9da6cd btrfs: prop: fix vanished compression property after failed set
   fbfbb996d58e btrfs: prop: fix zstd compression parameter validation
   16515acd5bc3 Btrfs: do not allow trimming when a fs is mounted with the nologreplay option
   e6265e368022 ASoC: fsl_esai: fix channel swap issue when stream starts
   19b0a7f5a083 ASoC: intel: Fix crash at suspend/resume after failed codec registration
   43f47331a4ce mm: writeback: use exact memcg dirty counts
   576f22ac47ba include/linux/bitrev.h: fix constant bitrev
   c4f103f6ac3a kvm: svm: fix potential get_num_contig_pages overflow
   93d60348edcb drm/udl: add a release method and delay modeset teardown
   df4106f23d0b drm/i915/gvt: do not deliver a workload if its creation fails
   a5277bcc1b7d alarmtimer: Return correct remaining time
   5db86e2a9b36 parisc: also set iaoq_b in instruction_pointer_set()
   53bb8444eab2 parisc: regs_return_value() should return gpr28
   41cf8111f3cb parisc: Detect QEMU earlier in boot process
   ba5765a243ed arm64: dts: rockchip: fix rk3328 sdmmc0 write errors
   9a62d69114d7 mm/huge_memory.c: fix modifying of page protection by insert_pfn_pmd()
   b3a8a3728d7e ALSA: hda - Add two more machines to the power_save_blacklist
   bfea74941d6d ALSA: hda/realtek - Add quirk for Tuxedo XC 1509
   c6d25f0b3653 ALSA: hda/realtek: Enable headset MIC of Acer TravelMate B114-21 with ALC233
   73b50a56e51e ALSA: seq: Fix OOB-reads from strlcpy
   d4b4aeea5506 ACPICA: Namespace: remove address node from global list after method termination
   ed52b07bd698 ACPICA: Clear status of GPEs before enabling them
   370004024aec hwmon: (w83773g) Select REGMAP_I2C to fix build error
   4ebab60d6561 tty: ldisc: add sysctl to prevent autoloading of ldiscs
   894dc8495898 tty: mark Siemens R3964 line discipline as BROKEN
   902eaef7781c arm64: kaslr: Reserve size of ARM64_MEMSTART_ALIGN in linear region
   40177a7931e0 netfilter: nfnetlink_cttimeout: fetch timeouts for udplite and gre, too
   c2d27b330a98 netfilter: nfnetlink_cttimeout: pass default timeout policy to obj_to_nlattr
   564f0391b783 Revert "clk: meson: clean-up clock registration"
   3412671a781b lib/string.c: implement a basic bcmp
   c7415f2a3ad6 x86/vdso: Drop implicit common-page-size linker flag
   f66a52d991de kbuild: clang: choose GCC_TOOLCHAIN_DIR not on LD
   23605a4664ae kbuild: deb-pkg: fix bindeb-pkg breakage when O= is used
   da9b353c78b8 net/mlx5e: Update xon formula
   e2d92a74a353 net/mlx5e: Update xoff formula
   eab86503fec0 net: mlx5: Add a missing check on idr_find, free buf
   b787544dc5e7 r8169: disable default rx interrupt coalescing on RTL8168
   55a7f7b20c40 net: core: netif_receive_skb_list: unlist skb before passing to pt->func
   a2ef7723a13c net: ip6_gre: fix possible use-after-free in ip6erspan_rcv
   5c6f2f4c0e9f net: ip_gre: fix possible use-after-free in erspan_rcv
   ecee513a5273 bnxt_en: Reset device on RX buffer errors.
   d2d055a55403 bnxt_en: Improve RX consumer index validity check.
   a333fcc41075 nfp: disable netpoll on representors
   81da1314596c nfp: validate the return code from dev_queue_xmit()
   c297e8814578 net/mlx5e: Add a lock on tir list
   9441317513b7 net/mlx5e: Fix error handling when refreshing TIRs
   0516ef27ddba vrf: check accept_source_route on the original netdevice
   7243e3520956 tcp: fix a potential NULL pointer dereference in tcp_sk_exit
   0e0afb06e11c tcp: Ensure DCTCP reacts to losses
   87349583e517 sctp: initialize _pad of sockaddr_in before copying to user memory
   1e4a7e7869ac r8169: disable ASPM again
   84dc2f872d2d qmi_wwan: add Olicard 600
   ec0e32da41a6 openvswitch: fix flow actions reallocation
   eeedfa94c195 net/sched: fix ->get helper of the matchall cls
   15c0770e2e83 net/sched: act_sample: fix divide by zero in the traffic path
   78b4bf26a8a7 net: rds: force to destroy connection if t_sock is NULL in rds_tcp_kill_sock().
   a1c2f3229734 netns: provide pure entropy for net_hash_mix()
   53a1906859a2 net/mlx5: Decrease default mr cache size
   b87ec81362ac net-gro: Fix GRO flush when receiving a GSO packet.
   80c205813d3f net: ethtool: not call vzalloc for zero sized memory request
   b7b058315577 kcm: switch order of device registration to fix a crash
   42f1fa0fcf55 ipv6: sit: reset ip header pointer in ipip6_rcv
   ea06796f8857 ipv6: Fix dangling pointer when ipv6 fragment
   8e4b4da3d3d9 ip6_tunnel: Match to ARPHRD_TUNNEL6 for dev type
   167019572ca8 ibmvnic: Fix completion structure initialization
   9a7c4f5acc0e hv_netvsc: Fix unwanted wakeup after tx_disable
   902eca1a0ccf powerpc/tm: Limit TM code inside PPC_TRANSACTIONAL_MEM
   8ad895bf4b8b drm/i915/gvt: do not let pin count of shadow mm go negative
   646f8e01fc37 kvm: nVMX: NMI-window and interrupt-window exiting should wake L2 from HLT

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_4.19.bb              |  6 +++---
 .../linux/linux-yocto-tiny_4.19.bb            |  8 ++++----
 meta/recipes-kernel/linux/linux-yocto_4.19.bb | 20 +++++++++----------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
index 834b8fc03c..dbcafcbee9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.19.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c279a81f1e654023c4cc78afa9f14350ee5f836f"
-SRCREV_meta ?= "9bda6190bfc9e7858c2f7588109a0ec966f37a09"
+SRCREV_machine ?= "6f1eb46dc80d3f2639a88f188814dff33bad5816"
+SRCREV_meta ?= "6fface2df8bc35e72aaf3d79352413fd84175879"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.19.34"
+LINUX_VERSION ?= "4.19.40"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
index dea7f2bf53..e8f6618685 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.19.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.19.34"
+LINUX_VERSION ?= "4.19.40"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "6fbb768bd43d85b2cfd905e431101e214c580634"
-SRCREV_machine ?= "1afd139db231e38e8e0f5ea03dcb77f9537ba2e0"
-SRCREV_meta ?= "9bda6190bfc9e7858c2f7588109a0ec966f37a09"
+SRCREV_machine_qemuarm ?= "ef6efa945df9868dc9a0f7db3020a8a731567cd9"
+SRCREV_machine ?= "91f882dd7e774154eecc333db321f4e5e97bd144"
+SRCREV_meta ?= "6fface2df8bc35e72aaf3d79352413fd84175879"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.19.bb b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
index de4ae92878..10db960268 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.19.bb
@@ -11,22 +11,22 @@ KBRANCH_qemux86  ?= "v4.19/standard/base"
 KBRANCH_qemux86-64 ?= "v4.19/standard/base"
 KBRANCH_qemumips64 ?= "v4.19/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "b266576aa10e76afeded8e13ffce93c4638b8ddb"
-SRCREV_machine_qemuarm64 ?= "1afd139db231e38e8e0f5ea03dcb77f9537ba2e0"
-SRCREV_machine_qemumips ?= "f6ef1a5233db0a1f569d7d6638fa803ebe5c867b"
-SRCREV_machine_qemuppc ?= "1afd139db231e38e8e0f5ea03dcb77f9537ba2e0"
-SRCREV_machine_qemux86 ?= "1afd139db231e38e8e0f5ea03dcb77f9537ba2e0"
-SRCREV_machine_qemux86-64 ?= "1afd139db231e38e8e0f5ea03dcb77f9537ba2e0"
-SRCREV_machine_qemumips64 ?= "f5b26e4d7a0eee36298d970590c50c26a800b84d"
-SRCREV_machine ?= "1afd139db231e38e8e0f5ea03dcb77f9537ba2e0"
-SRCREV_meta ?= "9bda6190bfc9e7858c2f7588109a0ec966f37a09"
+SRCREV_machine_qemuarm ?= "0b50626d5ad94c4df20132c5c6064a7196220740"
+SRCREV_machine_qemuarm64 ?= "91f882dd7e774154eecc333db321f4e5e97bd144"
+SRCREV_machine_qemumips ?= "db8e2bdaa546eb0c36752f235bad2133a9421564"
+SRCREV_machine_qemuppc ?= "91f882dd7e774154eecc333db321f4e5e97bd144"
+SRCREV_machine_qemux86 ?= "91f882dd7e774154eecc333db321f4e5e97bd144"
+SRCREV_machine_qemux86-64 ?= "91f882dd7e774154eecc333db321f4e5e97bd144"
+SRCREV_machine_qemumips64 ?= "392200ca22945e3f7bb8ad794607cdfa70f5ec76"
+SRCREV_machine ?= "91f882dd7e774154eecc333db321f4e5e97bd144"
+SRCREV_meta ?= "6fface2df8bc35e72aaf3d79352413fd84175879"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.19;destsuffix=${KMETA} \
           "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "4.19.34"
+LINUX_VERSION ?= "4.19.40"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


