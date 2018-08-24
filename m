Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44A387960A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2018 15:00:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7OF0BTJ012338
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 24 Aug 2018 08:00:11 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 24 Aug 2018 08:00:10 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 24 Aug 2018 10:59:53 -0400
Message-ID: <27a59a482cec47054c07a4ac47bf164351430348.1535118570.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1535118570.git.bruce.ashfield@windriver.com>
References: <cover.1535118570.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 06/12] linux-yocto/4.12: update to v4.12.28
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
X-List-Received-Date: Fri, 24 Aug 2018 15:00:11 -0000
Content-Type: text/plain

Integrating Paul Gortmaker's -stable updates to 4.12 that comprise the
following changes:

    f4fd7580487d Linux 4.12.28
    d15dfc7d192f net: mvneta: eliminate wrong call to handle rx descriptor error
    c7a79cbd2b44 net: mvneta: use proper rxq_number in loop on rx queues
    f65f1aed2ef2 net: mvneta: clear interface link status on port disable
    402f4ea26693 tcp: add tcp_ooo_try_coalesce() helper
    035eddf502ef tcp: call tcp_drop() from tcp_data_queue_ofo()
    c224a5920d55 tcp: detect malicious patterns in tcp_collapse_ofo_queue()
    7c5d21c36cec tcp: avoid collapses in tcp_prune_queue() if possible
    f999a5cfc3eb tcp: free batches of packets in tcp_prune_ofo_queue()
    3471d76b1128 net: add rb_to_skb() and other rb tree helpers
    fcd212157f50 libnvdimm, pfn: fix start_pad handling for aligned namespaces
    d90d61722843 libnvdimm, dax: fix 1GB-aligned namespaces vs physical misalignment
    df6a2110169e drm/sun4i: Fix error path handling
    d2d90272068d drm/i915: Flush pending GTT writes before unbinding
    55e3ba836aee powerpc/perf: Dereference BHRB entries safely
    32c5b092ac7e clk: sunxi: sun9i-mmc: Implement reset callback for reset controls
    a472f9b5c546 pinctrl: cherryview: Mask all interrupts on Intel_Strago based systems
    32f9f01a1b49 spi: a3700: Fix clk prescaling for coefficient over 15
    39e2376e2774 spi: xilinx: Detect stall with Unknown commands
    104bf43e4653 Revert "parisc: Re-enable interrupts early"
    2c6a864363b5 parisc: Hide Diva-built-in serial aux and graphics card
    4e92abc4d371 parisc: Align os_hpmc_size on word boundary
    8df2ad333664 ALSA: usb-audio: Add native DSD support for Esoteric D-05X
    2d7184d7f8b1 ALSA: rawmidi: Avoid racy info ioctl via ctl device
    425708ccc413 mfd: twl6040: Fix child-node lookup
    d99aacab316b mfd: twl4030-audio: Fix sibling-node lookup
    cd2ca561cdd7 mfd: cros ec: spi: Don't send first message too soon
    f5d153b69e6a crypto: mcryptd - protect the per-CPU queue with a lock
    01b2634b17f4 acpi, nfit: fix health event notification
    1170a37d5339 ACPI: APEI / ERST: Fix missing error handling in erst_reader()
    0cf5d1f5ce10 bpf: fix incorrect sign extension in check_alu_op()
    39cc58874bfc bpf, sparc: fix usage of wrong reg for load_skb_regs after call
    8c570303798e bpf, ppc64: do not reload skb pointers in non-skb context
    05bd23b36b88 bpf, s390x: do not reload skb pointers in non-skb context
    da92e092ffa7 platform/x86: asus-wireless: send an EV_SYN/SYN_REPORT between state changes
    ab3980511fa0 thermal/drivers/hisi: Fix multiple alarm interrupts firing
    ed7ec377cb05 thermal/drivers/hisi: Simplify the temperature/step computation
    b4322338048d thermal/drivers/hisi: Fix kernel panic on alarm interrupt
    e9b4b6019cc2 thermal/drivers/hisi: Fix missing interrupt enablement
    01f1870f5aa8 IB/opa_vnic: Properly return the total MACs in UC MAC list
    59522364dab2 IB/opa_vnic: Properly clear Mac Table Digest
    84cf0ea1cb2a cpuidle: fix broadcast control when broadcast can not be entered
    fdb28a72dafa rtc: set the alarm to the next expiring timer
    245a952509f6 tcp: fix under-evaluated ssthresh in TCP Vegas
    ebe28298b759 clk: sunxi-ng: sun6i: Rename HDMI DDC clock to avoid name collision
    c31c122f7744 staging: greybus: light: Release memory obtained by kasprintf
    7900ee86e495 net: ipv6: send NS for DAD when link operationally up
    0c8d7ea9c7db ibmvnic: Set state UP
    eb3237c59a98 fm10k: ensure we process SM mbx when processing VF mbx
    a076534d71b3 vfio/pci: Virtualize Maximum Payload Size
    0e8c3cf3f83e i40e: fix client notify of VF reset
    2e3bad157461 scsi: lpfc: PLOGI failures during NPIV testing
    022e3fe9ac98 scsi: lpfc: Fix secure firmware updates
    9e7341570bf9 fm10k: fix mis-ordered parameters in declaration for .ndo_set_vf_bw
    af88451b2676 ASoC: codecs: msm8916-wcd-analog: fix module autoload
    2fc38deb5bed ASoC: img-parallel-out: Add pm_runtime_get/put to set_fmt callback
    4529e660bc83 tracing: Exclude 'generic fields' from histograms
    3485fd44f243 PCI/AER: Report non-fatal errors only to the affected endpoint
    64e367610786 Bluetooth: BT_HCIUART now depends on SERIAL_DEV_BUS
    47663fe61367 Bluetooth: hci_uart_set_flow_control: Fix NULL deref when using serdev
    58adf4fe65f8 md: always set THREAD_WAKEUP and wake up wqueue if thread existed
    e9f7be0e550e block,bfq: Disable writeback throttling
    c09fcc304541 IB/rxe: put the pool on allocation failure
    392f4c00adca IB/rxe: check for allocation failure on elem
    179099ba0d69 ixgbe: fix use of uninitialized padding
    e2e131da3b6b i40e: use the safe hash table iterator when deleting mac filters
    757ad831c703 igb: check memory allocation failure
    e156a3afb676 PM / OPP: Move error message to debug level
    9bd17b3b4bb6 PCI: Create SR-IOV virtfn/physfn links before attaching driver
    54da833e63b0 scsi: mpt3sas: Fix IO error occurs on pulling out a drive from RAID1 volume created on two SATA drive
    929cc7c94e3b scsi: cxgb4i: fix Tx skb leak
    84aa72a81de3 PCI: Avoid bus reset if bridge itself is broken
    3932edaebc65 net: phy: at803x: Change error to EINVAL for invalid MAC
    e9bd07539e3f rtc: pl031: make interrupt optional
    9f77ab2f562c crypto: lrw - Fix an error handling path in 'create()'
    59e5a2e7eec9 crypto: crypto4xx - increase context and scatter ring buffer elements
    13c0df6a379d clk: sunxi-ng: sun5i: Fix bit offset of audio PLL post-divider
    68e13e506d6e clk: sunxi-ng: nm: Check if requested rate is supported by fractional clock
    3996734fc715 drm: Add retries for lspcon mode detection
    77190a6d2d57 backlight: pwm_bl: Fix overflow condition
    d3b4b8043ff7 optee: fix invalid of_node_put() in optee_driver_init()
    752218b19686 posix-timer: Properly check sigevent->sigev_notify
    16c39a33a5c6 ACPI / APEI: adjust a local variable type in ghes_ioremap_pfn_irq()
    ba0b2e6cbb82 Linux 4.12.27
    feea4d492d73 usb: musb: da8xx: fix babble condition handling
    6d8d83c4ec67 ath10k: fix build errors with !CONFIG_PM
    00e875f83a3c ath9k: fix tx99 potential info leak
    01cf18e17476 lightnvm: pblk: fix min size for page mempool
    4413575d48be lightnvm: pblk: initialize debug stat counter
    87135620a06a lightnvm: pblk: fix changing GC group list for a line
    3b1abf7d20f6 icmp: don't fail on fragment reassembly time exceeded
    4be8ae2da97b IB/ipoib: Fix lockdep issue found on ipoib_ib_dev_heavy_flush
    7d284754ed54 IB/ipoib: Grab rtnl lock on heavy flush when calling ndo_open/stop
    634b3e0fefd7 RDMA/cma: Avoid triggering undefined behavior
    f9f24086ba42 macvlan: Only deliver one copy of the frame to the macvlan interface
    aba3745fc9b0 udf: Avoid overflow when session starts at large offset
    4a9bf3983ef9 md-cluster: fix wrong condition check in raid1_write_request
    e08da1a3d9d5 raid5-ppl: check recovery_offset when performing ppl recovery
    a6b9b60622b0 scsi: bfa: integer overflow in debugfs
    a6adc19ff5a4 scsi: sd: change allow_restart to bool in sysfs interface
    d23a6641b217 scsi: sd: change manage_start_stop to bool in sysfs interface
    be59ef05ed52 rtl8188eu: Fix a possible sleep-in-atomic bug in rtw_disassoc_cmd
    9257df5ece69 vt6655: Fix a possible sleep-in-atomic bug in vt6655_suspend
    5d0d0b750520 IB/core: Fix calculation of maximum RoCE MTU
    950215a22a7a scsi: scsi_devinfo: Add REPORTLUN2 to EMC SYMMETRIX blacklist entry
    40dd3da9911d raid5: Set R5_Expanded on parity devices as well as data.
    d63147f7712f pinctrl: adi2: Fix Kconfig build problem
    b25a34c20291 dev/dax: fix uninitialized variable build warning
    3b928d69ed7c tty fix oops when rmmod 8250
    6fd73bd5acc5 ipv4: ipv4_default_advmss() should use route mtu
    e8552a24db2a soc: mediatek: pwrap: fix compiler errors
    023499e5fff8 powerpc/xmon: Check before calling xive functions
    7092b9c569ee powerpc/perf/hv-24x7: Fix incorrect comparison in memord
    d85bb8676f60 serdev: ttyport: enforce tty-driver open() requirement
    dcc2d9b7db19 mfd: mxs-lradc: Fix error handling in mxs_lradc_probe()
    d7630ac47698 scsi: hpsa: destroy sas transport properties before scsi_host
    a2133c918746 scsi: hpsa: cleanup sas_phy structures in sysfs when unloading
    37686080a0c8 PCI: Detach driver before procfs & sysfs teardown on device remove
    585eb66776b7 RDMA/cxgb4: Declare stag as __be32
    06a21042a540 xfs: fix incorrect extent state in xfs_bmap_add_extent_unwritten_real
    98da748f2c95 xfs: fix log block underflow during recovery cycle verification
    9aaebfb38490 l2tp: cleanup l2tp_tunnel_delete calls
    4fd806e81bcb nvme: use kref_get_unless_zero in nvme_find_get_ns
    377d9449f868 platform/x86: hp_accel: Add quirk for HP ProBook 440 G4
    89e9f0fce2a4 liquidio: fix kernel panic in VF driver
    85aad298ecc2 samples/bpf: adjust rlimit RLIMIT_MEMLOCK for xdp1
    767f9da42096 ARM64: dts: meson-gxbb-odroidc2: fix usb1 power supply
    65743dd02181 mtd: spi-nor: stm32-quadspi: Fix uninitialized error return code
    0501313aa697 btrfs: tests: Fix a memory leak in error handling path in 'run_test()'
    563e097ec448 btrfs: avoid null pointer dereference on fs_info when calling btrfs_crit
    3faadbbe68b1 btrfs: undo writable superblocke when sprouting fails
    7028f26c6034 btrfs: Explicitly handle btrfs_update_root failure
    3f0a4dfc8eb9 Bluetooth: hci_ldisc: Fix another race when closing the tty.
    abb921b20fa0 Ib/hfi1: Return actual operational VLs in port info query
    879b18ebb8f4 bcache: fix wrong cache_misses statistics
    744eb7bd3386 bcache: explicitly destroy mutex while exiting
    653aad5c1702 media: usbtv: fix brightness and contrast controls
    c4d5c7940953 GFS2: Take inode off order_write list when setting jdata flag
    2e510357e1a6 scsi: scsi_debug: write_same: fix error report
    56c755841ee6 misc: pci_endpoint_test: Avoid triggering a BUG()
    b55d52393e28 misc: pci_endpoint_test: Fix failure path return values in probe
    aeac8e4c0c15 thermal/drivers/step_wise: Fix temperature regulation misbehavior
    aaca414203c4 ASoC: rsnd: rsnd_ssi_run_mods() needs to care ssi_parent_mod
    0587e5a36d00 ppp: Destroy the mutex when cleanup
    4a7735ca4455 clk: tegra: Fix cclk_lp divisor register
    0006385aadd0 clk: tegra: Use readl_relaxed_poll_timeout_atomic() in tegra210_clock_init()
    6ae2754d991b blk-mq-sched: dispatch from scheduler IFF progress is made in ->dispatch
    ec4585cdc959 clk: hi6220: mark clock cs_atb_syspll as critical
    f203d6193f5c clk: imx6: refine hdmi_isfr's parent to make HDMI work on i.MX6 SoCs w/o VPU
    c9ce9a4d1734 clk: imx: imx7d: Fix parent clock for OCRAM_CLK
    5f200f317929 clk: mediatek: add the option for determining PLL source clock
    6f7955a0aa2a crypto: tcrypt - fix buffer lengths in test_aead_speed()
    40734099baaa xfs: truncate pagecache before writeback in xfs_setattr_size()
    165b974bd72a iommu/amd: Limit the IOVA page range to the specified addresses
    a2e1fcc04fb6 badblocks: fix wrong return value in badblocks_set if badblocks are disabled
    75920b77b802 target/file: Do not return error for UNMAP if length is zero
    ca73c042292d target:fix condition return in core_pr_dump_initiator_port()
    8e2ee3f5ff33 iscsi-target: fix memory leak in lio_target_tiqn_addtpg()
    f1ae60da96df target/iscsi: Fix a race condition in iscsit_add_reject_from_cmd()
    d5adfbee09dc target/iscsi: Detect conn_cmd_list corruption early
    edd7fdf83184 platform/x86: intel_punit_ipc: Fix resource ioremap warning
    da2aa58cb07b powerpc/pseries/vio: Dispose of virq mapping on vdevice unregister
    2ae1d60028ab powerpc/ipic: Fix status get and status clear
    1d0cfd6df447 powerpc/opal: Fix EBUSY bug in acquiring tokens
    88189efa7ee7 netfilter: ipvs: Fix inappropriate output of procfs
    39254860365c iommu/mediatek: Fix driver name
    c82f9ea385ab PCI: dwc: Fix enumeration end when reaching root subordinate
    5dad0dfd17df PCI: Do not allocate more buses than available in parent
    4a917030981d powerpc: Don't preempt_disable() in show_cpuinfo()
    0bc0d339ff6c powerpc/powernv/cpufreq: Fix the frequency read by /proc/cpuinfo
    7842177fdc43 PCI/PME: Handle invalid data when reading Root Status
    301c44edb5a1 dmaengine: ti-dma-crossbar: Correct am335x/am43xx mux value type
    2761bc37b1c2 ASoC: Intel: Skylake: Fix uuid_module memory leak in failure case
    c42830902147 PM / s2idle: Clear the events_check_enabled flag
    9c70ec2c413d scsi: aacraid: address UBSAN warning regression
    3819c3c756b0 scsi: aacraid: use timespec64 instead of timeval
    e262d43729be rtc: pcf8563: fix output clock rate
    3ecf1bdeb61e video: fbdev: au1200fb: Return an error code if a memory allocation fails
    d56242baba22 video: fbdev: au1200fb: Release some resources if a memory allocation fails
    3b53b4e4c0ab video: udlfb: Fix read EDID timeout
    f50c8ab6dc0d fbdev: controlfb: Add missing modes to fix out of bounds access
    bfbfacb318cd sfc: don't warn on successful change of MAC
    ae058bf77e63 HID: cp2112: fix broken gpio_direction_input callback
    91590951dec1 ext4: fix crash when a directory's i_size is too small
    4fae0491c35c ext4: fix fdatasync(2) after fallocate(2) operation
    df19eb58d7be dmaengine: dmatest: fix container_of member in dmatest_callback
    100cb4506fb4 dmaengine: dmatest: move callback wait queue to thread context
    4d873e954ac0 eeprom: at24: change nvmem stride to 1
    b90737b239b0 iw_cxgb4: only insert drain cqes if wq is flushed
    6b1f48a27656 dm: fix various targets to dm_register_target after module __init resources created
    26c2e6fc10f1 scsi: core: Fix a scsi_show_rq() NULL pointer dereference
    04039227baf7 nfsd: auth: Fix gid sorting when rootsquash enabled
    143fdc512ac6 NFS: Fix unstable write completion
    7482c56f758c NFS: Use an atomic_long_t to count the number of commits
    3ef4a32040bf nfs: don't wait on commit in nfs_commit_inode() if there were no commit requests
    4a70dd38f444 xhci: Don't add a virt_dev to the devs array before it's fully allocated
    fa7944fd5601 usb: xhci: fix TDS for MTK xHCI1.1
    80aa2eb9b51b ceph: drop negative child dentries before try pruning inode's alias
    b9db0ab47687 mmc: core: apply NO_CMD23 quirk to some specific cards
    ff1b82c5314c usbip: fix stub_send_ret_submit() vulnerability to null transfer_buffer
    cea2ad71f37b usbip: fix stub_rx: harden CMD_SUBMIT path to handle malicious input
    1e5edda8ccd3 usbip: fix stub_rx: get_pipe() to validate endpoint number
    3ac1e4089c48 USB: core: prevent malicious bNumInterfaces overflow
    2479ee21bf60 USB: uas and storage: Add US_FL_BROKEN_FUA for another JMicron JMS567 ID
    b3fd05a19818 tracing: Allocate mask_str buffer dynamically
    5eb37713e296 kernel: make groups_sort calling a responsibility group_info allocators
    d87a616735d8 cifs: fix NULL deref in SMB2_read
    d22121ce1210 crypto: rsa - fix buffer overread when stripping leading zeroes
    0ad02bd37731 mfd: fsl-imx25: Clean up irq settings during removal

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index afd76c2272bc..a6a8b60e1b0f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7ba09f891939cbf2c58801a7a4a740365896d6ba"
-SRCREV_meta ?= "99bef6252a7b9b5e38ea15112e9466ed6974a3fe"
+SRCREV_machine ?= "ef88c3326f62cec4b98340324ddbe7f7f7704fd5"
+SRCREV_meta ?= "2ae65226f64ed5c888d60eef76b6249db678d060"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.12.26"
+LINUX_VERSION ?= "4.12.28"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index 870e7662fb46..cb4ef3a659c1 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.12.26"
+LINUX_VERSION ?= "4.12.28"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "bd8f931e213614bc5fdc6aeaa132d273caa002af"
-SRCREV_meta ?= "99bef6252a7b9b5e38ea15112e9466ed6974a3fe"
+SRCREV_machine ?= "e562267bae5b518acca880c929fbbdf6be047e0a"
+SRCREV_meta ?= "2ae65226f64ed5c888d60eef76b6249db678d060"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 57f29949c743..0aea05b83f2a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,22 +11,22 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "86b02dd23be1e3b3449885b38ed1b876ebec31e8"
-SRCREV_machine_qemuarm64 ?= "bd8f931e213614bc5fdc6aeaa132d273caa002af"
-SRCREV_machine_qemumips ?= "67b93101c52504fd5077166c70baa296190e6166"
-SRCREV_machine_qemuppc ?= "bd8f931e213614bc5fdc6aeaa132d273caa002af"
-SRCREV_machine_qemux86 ?= "bd8f931e213614bc5fdc6aeaa132d273caa002af"
-SRCREV_machine_qemux86-64 ?= "bd8f931e213614bc5fdc6aeaa132d273caa002af"
-SRCREV_machine_qemumips64 ?= "38da8c72733da9619bbbddf14140204631faf488"
-SRCREV_machine ?= "bd8f931e213614bc5fdc6aeaa132d273caa002af"
-SRCREV_meta ?= "99bef6252a7b9b5e38ea15112e9466ed6974a3fe"
+SRCREV_machine_qemuarm ?= "b84ecefc243a6ed67d8b6020394963de1240a9f0"
+SRCREV_machine_qemuarm64 ?= "e562267bae5b518acca880c929fbbdf6be047e0a"
+SRCREV_machine_qemumips ?= "15b1ab68f73fa60dd95a74c640e87e05fad1716d"
+SRCREV_machine_qemuppc ?= "e562267bae5b518acca880c929fbbdf6be047e0a"
+SRCREV_machine_qemux86 ?= "e562267bae5b518acca880c929fbbdf6be047e0a"
+SRCREV_machine_qemux86-64 ?= "e562267bae5b518acca880c929fbbdf6be047e0a"
+SRCREV_machine_qemumips64 ?= "57a3f72a020fc84f2da5b0b4c5de4cdbc22b3284"
+SRCREV_machine ?= "e562267bae5b518acca880c929fbbdf6be047e0a"
+SRCREV_meta ?= "2ae65226f64ed5c888d60eef76b6249db678d060"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
 DEPENDS += "openssl-native util-linux-native"
 
-LINUX_VERSION ?= "4.12.26"
+LINUX_VERSION ?= "4.12.28"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


