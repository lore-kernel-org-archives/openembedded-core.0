Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E0E378557
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 02:25:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w1J2PvGd026845
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 18 Feb 2018 18:25:57 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Sun, 18 Feb 2018 18:25:40 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Sun, 18 Feb 2018 21:25:48 -0500
Message-ID: <b13180439bbcfc0646b6c13227ff1b66238e13a1.1519006338.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1519006338.git.bruce.ashfield@windriver.com>
References: <cover.1519006338.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/4.15: update to v4.15.3
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
X-List-Received-Date: Mon, 19 Feb 2018 02:25:56 -0000
Content-Type: text/plain

Integrating the korg -stable updates that comprise the following
changes:

   e6e2d12fa46b Linux 4.15.3
   b78dc2478714 crypto: tcrypt - fix S/G table for test_aead_speed()
   65a4a2157f0b gpio: uniphier: fix mismatch between license text and MODULE_LICENSE
   222090655dbb media: tegra-cec: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   bc87735cb005 media: soc_camera: soc_scale_crop: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   fe70ce28670e media: mtk-vcodec: add missing MODULE_LICENSE/DESCRIPTION
   25de2482a958 net: sched: fix use-after-free in tcf_block_put_ext
   41551c14bf0d net_sched: get rid of rcu_barrier() in tcf_block_put_ext()
   4c92abe86a20 soreuseport: fix mem leak in reuseport_add_sock()
   07055dd6c806 ipv6: Fix SO_REUSEPORT UDP socket with implicit sk_ipv6only
   ce6fa12a7ba5 cls_u32: add missing RCU annotation.
   a742a89695ce tcp_bbr: fix pacing_gain to always be unity when using lt_bw
   759f8b0b3ad8 rocker: fix possible null pointer dereference in rocker_router_fib_event_work
   d19a4d19ccab net: ipv6: send unsolicited NA after DAD
   b22b76fbd802 Revert "defer call to mem_cgroup_sk_alloc()"
   81259f3592f8 ipv6: change route cache aging logic
   513f3cc3d1d3 ipv6: addrconf: break critical section in addrconf_verify_rtnl()
   cb0fddba2081 vhost_net: stop device during reset owner
   f76c9a0fbf5b tcp: release sk_frag.page in tcp_disconnect
   b0acbef9edb2 r8169: fix RTL8168EP take too long to complete driver initialization.
   514377344c30 qmi_wwan: Add support for Quectel EP06
   da1761bde55f qlcnic: fix deadlock bug
   ca89dee1eb41 net: igmp: add a missing rcu locking section
   6555d5440ba2 ip6mr: fix stale iterator
   db22ec452bb4 Linux 4.15.2
   35314545f115 fpga: region: release of_parse_phandle nodes after use
   b796d30928fe serial: core: mark port as initialized after successful IRQ change
   bad75ea552a8 KVM/SVM: Allow direct access to MSR_IA32_SPEC_CTRL
   6d45809fe88f KVM/VMX: Allow direct access to MSR_IA32_SPEC_CTRL
   3d6e862c967f KVM/VMX: Emulate MSR_IA32_ARCH_CAPABILITIES
   4659554aecb0 KVM/x86: Add IBPB support
   f13d17517fd0 KVM/x86: Update the reverse_cpuid list to include CPUID_7_EDX
   9e4d1de59c95 x86/speculation: Fix typo IBRS_ATT, which should be IBRS_ALL
   d13d4d2a597a x86/pti: Mark constant arrays as __initconst
   28cf1d82995c x86/spectre: Simplify spectre_v2 command line parsing
   76e36defe096 x86/retpoline: Avoid retpolines for built-in __init functions
   9ec4cfcef13f x86/kvm: Update spectre-v1 mitigation
   b399b9864988 KVM: VMX: make MSR bitmaps per-VCPU
   6e337065e6de x86/paravirt: Remove 'noreplace-paravirt' cmdline option
   061c8e740e90 x86/speculation: Use Indirect Branch Prediction Barrier in context switch
   9a417b0fe093 x86/cpuid: Fix up "virtual" IBRS/IBPB/STIBP feature bits on Intel
   7aa1a1703133 x86/spectre: Fix spelling mistake: "vunerable"-> "vulnerable"
   bdfaac0f1811 x86/spectre: Report get_user mitigation for spectre_v1
   d583ef2659da nl80211: Sanitize array index in parse_txq_params
   64dab840017d vfs, fdtable: Prevent bounds-check bypass via speculative execution
   fecca4925b89 x86/syscall: Sanitize syscall table de-references under speculation
   31d4cf78bb3d x86/get_user: Use pointer masking to limit speculation
   d193324bd64f x86/uaccess: Use __uaccess_begin_nospec() and uaccess_try_nospec
   bd74e76bfd3d x86/usercopy: Replace open coded stac/clac with __uaccess_{begin, end}
   fa46638b0bbf x86: Introduce __uaccess_begin_nospec() and uaccess_try_nospec
   7ec7f5580122 x86: Introduce barrier_nospec
   d9f24681fd02 x86: Implement array_index_mask_nospec
   8a1c71c817f7 array_index_nospec: Sanitize speculative array de-references
   a35f71001b40 Documentation: Document array_index_nospec
   6adfc96f74dc x86/asm: Move 'status' from thread_struct to thread_info
   6a35b18b3dca x86/entry/64: Push extra regs right away
   dd9708c3dbac x86/entry/64: Remove the SYSCALL64 fast path
   6ff25f602b37 x86/spectre: Check CONFIG_RETPOLINE in command line parser
   62c00e6122a6 x86/mm: Fix overlap of i386 CPU_ENTRY_AREA with FIX_BTMAP
   dd1256185482 objtool: Warn on stripped section symbol
   1e7c7191e892 objtool: Add support for alternatives at the end of a section
   0603b3626273 objtool: Improve retpoline alternative handling
   3dcc78148a15 KVM: VMX: introduce alloc_loaded_vmcs
   81e19f12d180 KVM: nVMX: Eliminate vmcs02 pool
   b053d9d2926b ASoC: pcm512x: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   793cc747e390 pinctrl: pxa: pxa2xx: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   39e8aa5b30d6 iio: adc/accel: Fix up module licenses
   c7faead761c5 auxdisplay: img-ascii-lcd: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   0f6e6bce69d9 x86/speculation: Simplify indirect_branch_prediction_barrier()
   058840da8002 x86/retpoline: Simplify vmexit_fill_RSB()
   24516e9a2e3f x86/cpufeatures: Clean up Spectre v2 related CPUID flags
   d815b3ac3a14 x86/cpu/bugs: Make retpoline module warning conditional
   b63521664040 x86/bugs: Drop one "mitigation" from dmesg
   88106347fcd4 x86/nospec: Fix header guards names
   739050a47dc6 x86/alternative: Print unadorned pointers
   c96b2819eb8f x86/speculation: Add basic IBPB (Indirect Branch Prediction Barrier) support
   727eca64fb2b x86/cpufeature: Blacklist SPEC_CTRL/PRED_CMD on early Spectre v2 microcodes
   bcfd19e90a7d x86/pti: Do not enable PTI on CPUs which are not vulnerable to Meltdown
   c32525a0ee28 x86/msr: Add definitions for new speculation control MSRs
   c11a94aef481 x86/cpufeatures: Add AMD feature bits for Speculation Control
   6acd374af3f3 x86/cpufeatures: Add Intel feature bits for Speculation Control
   ad35224462a1 x86/cpufeatures: Add CPUID_7_EDX CPUID leaf
   2ce5583273b2 module/retpoline: Warn about missing retpoline in module
   96e1c36869e3 KVM: VMX: Make indirect call speculation safe
   be88e936a27d KVM: x86: Make indirect calls in emulator speculation safe
   d55dce9083d0 Linux 4.15.1
   d4374d0a85e5 x86/efi: Clarify that reset attack mitigation needs appropriate userspace
   589aadd6577b Input: synaptics-rmi4 - do not delete interrupt memory too early
   e66aa9b5cedf Input: synaptics-rmi4 - unmask F03 interrupts when port is opened
   d7e9ad33f4a9 test_firmware: fix missing unlock on error in config_num_requests_store()
   b82021cb0001 iio: chemical: ccs811: Fix output of IIO_CONCENTRATION channels
   ce868fb5d84b iio: adc: stm32: fix scan of multiple channels with DMA
   bac4bf53ca7c spi: imx: do not access registers while clocks disabled
   68c610bf1e38 serial: imx: Only wakeup via RTSDEN bit if the system has RTS/CTS
   150becd9a389 serial: 8250_dw: Revert "Improve clock rate setting"
   c0dbcbb52e8c serial: 8250_uniphier: fix error return code in uniphier_uart_probe()
   970aeba3f3e5 serial: 8250_of: fix return code when probe function fails to get reset
   4e45815fcd38 mei: me: allow runtime pm for platform with D0i3
   76ee8f3d7af2 android: binder: use VM_ALLOC to get vm area
   7654cae54337 ANDROID: binder: remove waitqueue when thread exits.
   fe188a034ead usb/gadget: Fix "high bandwidth" check in usb_gadget_ep_match_desc()
   5f9ec18949c5 usb: uas: unconditionally bring back host after reset
   05ebcaef21aa usb: f_fs: Prevent gadget unbind if it is already unbound
   16d643ddaa3b USB: serial: simple: add Motorola Tetra driver
   7ec7c9e0abda usbip: list: don't list devices attached to vhci_hcd
   053cef5ae90a usbip: prevent bind loops on devices attached to vhci_hcd
   327b34d402aa USB: serial: io_edgeport: fix possible sleep-in-atomic
   6b5cd469cffb CDC-ACM: apply quirk for card reader
   af6e0b55ee7c USB: cdc-acm: Do not log urb submission errors on disconnect
   167c2b3bb56d USB: serial: pl2303: new device id for Chilitag
   f09196b83366 usb: option: Add support for FS040U modem
   3e1995ed770e tty: fix data race between tty_init_dev and flush of buf
   e880bc8b35f8 staging: ccree: fix fips event irq handling build
   d3a65e371e24 staging: ccree: NULLify backup_info when unused
   c857988cb332 staging: lustre: separate a connection destroy from free struct kib_conn
   5a313f217cdd scsi: storvsc: missing error code in storvsc_probe()
   a63f24a621bd scsi: aacraid: Fix hang in kdump
   623130d4173a scsi: aacraid: Fix udev inquiry race condition
   bbaf9ef523bf ima/policy: fix parsing of fsuuid
   50b1c3e02986 igb: Free IRQs when device is hotplugged
   7981935860a3 mtd: nand: denali_pci: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   2db691195247 gpio: ath79: add missing MODULE_DESCRIPTION/LICENSE
   397b9b19bfbd gpio: iop: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   14fe41dd0295 power: reset: zx-reboot: add missing MODULE_DESCRIPTION/AUTHOR/LICENSE
   c08a3601eadd HID: wacom: Fix reporting of touch toggle (WACOM_HID_WD_MUTE_DEVICE) events
   a952547e89fc HID: wacom: EKR: ensure devres groups at higher indexes are released
   cc5daa4b691b crypto: af_alg - whitelist mask and type
   66ae99ca89cb crypto: sha3-generic - fixes for alignment and big endian operation
   e02e32d0b7b2 crypto: inside-secure - avoid unmapping DMA memory that was not mapped
   cb06c7a568b0 crypto: inside-secure - fix hash when length is a multiple of a block
   13f2e2db18a8 crypto: aesni - Fix out-of-bounds access of the AAD buffer in generic-gcm-aesni
   eef10a3e99c7 crypto: aesni - Fix out-of-bounds access of the data buffer in generic-gcm-aesni
   8a393aecc4d7 crypto: aesni - add wrapper for generic gcm(aes)
   799cdd8acd71 crypto: aesni - fix typo in generic_gcmaes_decrypt
   c862ace9b73d crypto: aesni - handle zero length dst buffer
   436bcaa6bc35 crypto: ecdh - fix typo in KPP dependency of CRYPTO_ECDH
   7bccfc3bccae ALSA: hda - Reduce the suspend time consumption for ALC256
   5e5a8be02370 gpio: Fix kernel stack leak to userspace
   b98fe1634c13 gpio: stmpe: i2c transfer are forbiden in atomic context
   70f19ee8b455 tools/gpio: Fix build error with musl libc
   ed3bbbc84f13 Bluetooth: hci_serdev: Init hci_uart proto_lock to avoid oops

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.15.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
index 03726a46a40d..7e2d6998fea2 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
-SRCREV_meta ?= "64ad69e5b4a38e678500d7a70791ac5154c6c154"
+SRCREV_machine ?= "a6a3a6a73d628798fc6eb6832bf829a9ea43f6bd"
+SRCREV_meta ?= "030f397472fc8ea8e7f8a069153bc3b6d52f3d45"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.15"
+LINUX_VERSION ?= "4.15.3"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
index 60b7e600d24d..72abe438eda5 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.15.bb
@@ -18,13 +18,13 @@ SRCREV_machine_qemuppc ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemux86 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemux86-64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
 SRCREV_machine_qemumips64 ?= "f9a3a72209bde080e4ecb4fbe7a0f99954643131"
-SRCREV_machine ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
-SRCREV_meta ?= "64ad69e5b4a38e678500d7a70791ac5154c6c154"
+SRCREV_machine ?= "a6a3a6a73d628798fc6eb6832bf829a9ea43f6bd"
+SRCREV_meta ?= "030f397472fc8ea8e7f8a069153bc3b6d52f3d45"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.15"
+LINUX_VERSION ?= "4.15.3"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.15.bb b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
index 60b7e600d24d..fea14ccf8ea5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.15.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "v4.15/standard/base"
 KBRANCH_qemux86-64 ?= "v4.15/standard/base"
 KBRANCH_qemumips64 ?= "v4.15/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "5fdc3d579c5f50fbaaa5faecae79e20b73810346"
-SRCREV_machine_qemuarm64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
-SRCREV_machine_qemumips ?= "5afbe5a7e271f1c115a7c77bea4a71356c6f2792"
-SRCREV_machine_qemuppc ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
-SRCREV_machine_qemux86 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
-SRCREV_machine_qemux86-64 ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
-SRCREV_machine_qemumips64 ?= "f9a3a72209bde080e4ecb4fbe7a0f99954643131"
-SRCREV_machine ?= "9c2e6c0fc71526c45fc7ddf3ec91e2e2f27e3da0"
-SRCREV_meta ?= "64ad69e5b4a38e678500d7a70791ac5154c6c154"
+SRCREV_machine_qemuarm ?= "312b80a833f6be40034526f3155360f61d78608a"
+SRCREV_machine_qemuarm64 ?= "a6a3a6a73d628798fc6eb6832bf829a9ea43f6bd"
+SRCREV_machine_qemumips ?= "a52de76fa49f7c93031a807d8668ae2d7c2c4d0a"
+SRCREV_machine_qemuppc ?= "a6a3a6a73d628798fc6eb6832bf829a9ea43f6bd"
+SRCREV_machine_qemux86 ?= "a6a3a6a73d628798fc6eb6832bf829a9ea43f6bd"
+SRCREV_machine_qemux86-64 ?= "a6a3a6a73d628798fc6eb6832bf829a9ea43f6bd"
+SRCREV_machine_qemumips64 ?= "3a25d83e268bd34ff12f12011b0b8254e86833a2"
+SRCREV_machine ?= "a6a3a6a73d628798fc6eb6832bf829a9ea43f6bd"
+SRCREV_meta ?= "030f397472fc8ea8e7f8a069153bc3b6d52f3d45"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.15"
+LINUX_VERSION ?= "4.15.3"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.5.0


