Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32DBB785BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 13:47:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8EDl5i5029258
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 Sep 2017 06:47:05 -0700 (PDT)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 14 Sep 2017 06:47:04 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 14 Sep 2017 09:46:55 -0400
Message-ID: <629df450518b70c94f68895eee8205cec4d8e885.1505396619.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1505396619.git.bruce.ashfield@windriver.com>
References: <cover.1505396619.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/9] linux-yocto/4.12: update to v4.12.12
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
X-List-Received-Date: Thu, 14 Sep 2017 13:47:05 -0000
Content-Type: text/plain

Integrating the korg stable update comprising the following commits:

   6ff98e8e5d24 Linux 4.12.12
   ce4ef9346d9f rtlwifi: Fix fallback firmware loading
   21da5e36f41e rtlwifi: Fix memory leak when firmware request fails
   3ef5220bdba7 of/device: Prevent buffer overflow in of_device_modalias()
   aee0b37b710e scsi: sg: recheck MMAP_IO request length with lock held
   b0f24dc0e57b scsi: sg: protect against races between mmap() and SG_SET_RESERVED_SIZE
   1054309aca02 cs5536: add support for IDE controller variant
   e5298cd80371 ahci: don't use MSI for devices with the silly Intel NVMe remapping scheme
   f21c4eea8bb4 workqueue: Fix flag collision
   daf316ac4a6c drm/nouveau: Fix error handling in nv50_disp_atomic_commit
   75bc569a0d4b drm/nouveau/pci/msi: disable MSI on big-endian platforms by default
   e3b9fb20262f s390/mm: fix BUG_ON in crst_table_upgrade
   2ce0e0495177 s390/mm: avoid empty zero pages for KVM guests to avoid postcopy hangs
   d859d5a434f1 MCB: add support for SC31 to mcb-lpc
   f7fb789880dd mwifiex: correct channel stat buffer overflows
   0bfb078274ed dlm: avoid double-free on error path in dlm_device_{register,unregister}
   985696916329 iwlwifi: pci: add new PCI ID for 7265D
   cbe865a2e67d Bluetooth: Add support of 13d3:3494 RTL8723BE device
   7d20c5530a56 rtlwifi: rtl_pci_probe: Fix fail path of _rtl_pci_find_adapter
   a47814b210eb Input: trackpoint - assume 3 buttons when buttons detection fails
   d49ea1b6f98f ath10k: fix memory leak in rx ring buffer allocation
   270f0aadd1d2 intel_th: pci: Add Cannon Lake PCH-LP support
   d2192374b951 intel_th: pci: Add Cannon Lake PCH-H support
   055be595e016 fpga: altera-hps2fpga: fix multiple init of l3_remap_lock
   ba89dc8dce4e crypto: caam/qi - fix compilation with DEBUG enabled
   aa57cf57df95 crypto: caam/qi - fix compilation with CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
   693ef09dc616 binder: free memory on error
   bbe1a3b3d20d HID: wacom: Do not completely map WACOM_HID_WD_TOUCHRINGSTATUS usage
   af617519a8c2 driver core: bus: Fix a potential double free
   6c6c3c6bd954 iio: adc: ti-ads1015: add adequate wait time to get correct conversion
   00202ded930e iio: adc: ti-ads1015: don't return invalid value from buffer setup callbacks
   303d31eb5adf iio: adc: ti-ads1015: avoid getting stale result after runtime resume
   6c164a8ad918 iio: adc: ti-ads1015: enable conversion when CONFIG_PM is not set
   6c5595e0815d iio: adc: ti-ads1015: fix scale information for ADS1115
   1d7fadc5937f iio: adc: ti-ads1015: fix incorrect data rate setting update
   70bfcf9e319e staging/rts5208: fix incorrect shift to extract upper nybble
   ed68c935f5ae USB: core: Avoid race of async_completed() w/ usbdev_release()
   ffdb5b9e299a ANDROID: binder: add hwbinder,vndbinder to BINDER_DEVICES.
   74ffccfed38f ANDROID: binder: add padding to binder_fd_array_object.
   68596cc21060 USB: musb: fix external abort on suspend
   c927f42c8e38 usb:xhci:Fix regression when ATI chipsets detected
   0e8e379786da usb: Add device quirk for Logitech HD Pro Webcam C920-C
   c8ff3d1a47a2 USB: serial: option: add support for D-Link DWM-157 C1
   572bcfc7fbce usb: quirks: add delay init quirk for Corsair Strafe RGB keyboard
   13817987369a Linux 4.12.11
   9c2144e80db8 epoll: fix race between ep_poll_callback(POLLFREE) and ep_free()/ep_remove()
   38f5d65ad997 drm/nouveau/i2c/gf119-: add support for address-only transactions
   bdacc5fcf4f9 nvme: fix the definition of the doorbell buffer config support bit
   c6d2779d8f0d drm/ttm: Fix accounting error when fail to get pages for pool
   6c5b60edd786 xfrm: policy: check policy direction value
   6cc6f45db016 lib/mpi: kunmap after finishing accessing buffer
   a3deff1d3285 mmc: sdhci-xenon: add set_power callback
   d767ccb7c387 wl1251: add a missing spin_lock_init()
   619d31a0d247 drm/vmwgfx: Fix F26 Wayland screen update issue
   399081a50c48 dm mpath: do not lock up a CPU with requeuing activity
   77ab9e7fb431 CIFS: remove endian related sparse warning
   0627f7136685 CIFS: Fix maximum SMB2 header size
   f3e9dc4504b1 alpha: uapi: Add support for __SANE_USERSPACE_TYPES__
   ae53897e22db cpuset: Fix incorrect memory_pressure control file mapping
   fd20ca80f807 cpumask: fix spurious cpumask_of_node() on non-NUMA multi-node configs
   3d7aeba120fd ceph: fix readpage from fscache
   b3010084e111 mm, madvise: ensure poisoned pages are removed from per-cpu lists
   8c46edd78de9 mm, uprobes: fix multiple free of ->uprobes_state.xol_area
   726bd348ead3 crypto: algif_skcipher - only call put_page on referenced and used pages
   44c6b4a96625 i2c: ismt: Return EMSGSIZE for block reads with bogus length
   7a90bfae6345 i2c: ismt: Don't duplicate the receive length for block reads
   6fb972d03751 crypto: chacha20 - fix handling of chunked input
   6b31ae8707a7 Input: xpad - fix PowerA init quirk for some gamepad models
   2ed56448f555 Input: synaptics - fix device info appearing different on reconnect
   55a5a10ce349 irqchip: mips-gic: SYNC after enabling GIC region
   691208979811 x86/io: Add "memory" clobber to insb/insw/insl/outsb/outsw/outsl
   34ed350889dd arm64: mm: abort uaccess retries upon fatal signal

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.12.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
index f3130ad91b7d..f19e1248a90a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.12.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
-SRCREV_meta ?= "91b4e89037c3575912d6c3cc8977db7ea83b81f1"
+SRCREV_machine ?= "873830670b1af7765428166db40d413018c40e28"
+SRCREV_meta ?= "4fdd56fe602ceb2690407df44283e45ff1c9cd0e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.12.10"
+LINUX_VERSION ?= "4.12.12"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
index a1ba04102ec3..fa3cd2075b8f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.12.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.12.10"
+LINUX_VERSION ?= "4.12.12"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
-SRCREV_meta ?= "91b4e89037c3575912d6c3cc8977db7ea83b81f1"
+SRCREV_machine ?= "873830670b1af7765428166db40d413018c40e28"
+SRCREV_meta ?= "4fdd56fe602ceb2690407df44283e45ff1c9cd0e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
index 6cd82df8d2ff..e9838247f45e 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "fd1626821467303bd084dc28d41f9093d60c3f31"
-SRCREV_machine_qemuarm64 ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
-SRCREV_machine_qemumips ?= "0d351d8eb3feeb121e859cb77c16dd0f46007a15"
-SRCREV_machine_qemuppc ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
-SRCREV_machine_qemux86 ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
-SRCREV_machine_qemux86-64 ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
-SRCREV_machine_qemumips64 ?= "ec95c3aebd1d653a409e844779d2a34666627f59"
-SRCREV_machine ?= "b5c8cfda2dfe296410d51e131289fb09c69e1e7d"
-SRCREV_meta ?= "91b4e89037c3575912d6c3cc8977db7ea83b81f1"
+SRCREV_machine_qemuarm ?= "1f5c932260cac2118d256d38b475a2811a8551e5"
+SRCREV_machine_qemuarm64 ?= "873830670b1af7765428166db40d413018c40e28"
+SRCREV_machine_qemumips ?= "a9f98cc2715a65537877c86808a101429028d48b"
+SRCREV_machine_qemuppc ?= "873830670b1af7765428166db40d413018c40e28"
+SRCREV_machine_qemux86 ?= "873830670b1af7765428166db40d413018c40e28"
+SRCREV_machine_qemux86-64 ?= "873830670b1af7765428166db40d413018c40e28"
+SRCREV_machine_qemumips64 ?= "1863c93b44aeb6badb4993fd9a6ab3d360bf30d1"
+SRCREV_machine ?= "873830670b1af7765428166db40d413018c40e28"
+SRCREV_meta ?= "4fdd56fe602ceb2690407df44283e45ff1c9cd0e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.12;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.12.10"
+LINUX_VERSION ?= "4.12.12"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


