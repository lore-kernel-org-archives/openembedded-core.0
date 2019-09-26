Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0390C72E8C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 16:54:54 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id b19so8402012iob.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2019 09:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ubfS+cgmortfzsihDVkn1l/UbNgJCXlz/vXszxwMcog=;
	b=jnIkMWQhIhRN9IFEDTDghrYeBlreRyzvrOwD2zWJ10R1O4h4swgRZ6QEM+U9qx+COF
	TfgNaqhBCF7rKengvb5O+NPzaPRdAVUzaUjlhDRsyvCXUI2A57prptX2zeEgnXMrOGMV
	JPlxwaGxIanmGSLS6Z5M38HsZS8LEFDqjTVRZyibmIWeI+ZEgDatY7Yaoup9/BrtTMm7
	PyWJ67zP7TJcaOimOkLsqNbU0o03oxtBaSIdWcihEvAPao7GNkgjA0x4v6POzXfiQeop
	//y90r/t2qiBYfmNFUzvSQ9C46xae46Ho33qv5v6SIfiyRhv19qgr0llgQLN4RZlD/5T
	+p6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ubfS+cgmortfzsihDVkn1l/UbNgJCXlz/vXszxwMcog=;
	b=MGz3RJqKU0yowVzL/KvcYjqCV2uvUM5qq5w+j/EKC+nTz7na9lAJzbzBDo6zH8oRUp
	gmJKBw9uiATPvxsD9DPAbfgphKu5H5hEWp8lhHq5dDZYlYUxo/uoaPxZGD/QEHdNA0Cn
	zBLJnp7RDOXq72v/QQ76f+JtSa33S2+MBla/xsKlbJXZJPKmnxQq4SnK7IIHqMr8A1RW
	rpijo3o8D/JKBeMmLCcPwiftOE4tOJwOPP9cxB4glyTPN9nTwpTuB+U9PuQFDykU1jKg
	/kdtbLZs1lBoOnpZPF/mKTxysaKMQ+DS1N/T0t0URbyt9qAEITGzKEtSPbHIPGvK+x9t
	FGDg==
X-Gm-Message-State: APjAAAWSP0DGY2rj+9zEz1D57JXMh71lwgsRoeecUZFFNNDzG4EAzVI8
	To/xxUI5/aK1MJgD6p1Wdfg=
X-Google-Smtp-Source: APXvYqwJbTgpv6tSEiKG8CNSgoANe3oMp51qkyW2atY9hKXXphVtXk+RgVvubQdWAKY4ulxgW3nMUQ==
X-Received: by 2002:a02:b156:: with SMTP id s22mr4158493jah.102.1569516895413; 
	Thu, 26 Sep 2019 09:54:55 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id y16sm832996ilp.37.2019.09.26.09.54.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 09:54:54 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Thu, 26 Sep 2019 12:54:52 -0400
Message-Id: <20190926165452.11672-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] linux-yocto/5.2: update to v5.2.17
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
X-List-Received-Date: Thu, 26 Sep 2019 16:54:55 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.2 to the latest korg -stable release that comprises
the following commits:

    5e408889e4af Linux 5.2.17
    12434939ba58 vfs: Fix refcounting of filenames in fs_parser
    d4911cc1f4b6 media: technisat-usb2: break out of loop at end of buffer
    19ad4c4fe19c floppy: fix usercopy direction
    d7aa8c546ab9 ovl: fix regression caused by overlapping layers detection
    52f2aba47d71 Revert "arm64: Remove unnecessary ISBs from set_{pte,pmd,pud}"
    785ca708a908 iommu/amd: Fix race in increase_address_space()
    ed52f6cf0e84 iommu/amd: Flush old domains in kdump kernel
    24962eb0edd0 keys: Fix missing null pointer check in request_key_auth_describe()
    16ed4b9b7bf7 dmaengine: rcar-dmac: Fix DMACHCLR handling if iommu is mapped
    d604a12cc6d5 dmaengine: sprd: Fix the DMA link-list configuration
    d5898d2f06fc iommu/vt-d: Remove global page flush support
    5df0a5fd4d1c x86/hyper-v: Fix overflow bug in fill_gva_list()
    4bdb9988ad38 x86/uaccess: Don't leak the AC flags into __get_user() argument evaluation
    4dabe50389c4 dmaengine: ti: omap-dma: Add cleanup in omap_dma_probe()
    9de496fe242a dmaengine: ti: dma-crossbar: Fix a memory leak bug
    4b898223a979 arm64: dts: renesas: r8a77995: draak: Fix backlight regulator name
    4ad64281e4d3 net: seeq: Fix the function used to release some memory in an error handling path
    0275857577e5 enetc: Add missing call to 'pci_free_irq_vectors()' in probe and remove functions
    d18638671b96 net: dsa: microchip: add KSZ8563 compatibility string
    05172612ab3a net: aquantia: fix out of memory condition on rx side
    95acd66ba70a net: aquantia: linkstate irq should be oneshot
    e4d1449ca4a5 net: aquantia: reapply vlan filters on up
    6a6e09b7a519 net: aquantia: fix removal of vlan 0
    b5789a160c2d tools/power turbostat: Fix CPU%C1 display value
    54f4f3b38133 tools/power turbostat: Add Ice Lake NNPI support
    8bae84e5203b tools/power turbostat: Fix Haswell Core systems
    0926ee9f5327 tools/power turbostat: fix buffer overrun
    94132aca9472 tools/power turbostat: fix file descriptor leaks
    0a1ba2cd9d62 tools/power turbostat: fix leak of file descriptor on error return path
    caab8b8b3aca tools/power x86_energy_perf_policy: Fix argument parsing
    edf8ba32bc2b tools/power x86_energy_perf_policy: Fix "uninitialized variable" warnings at -O2
    e9e492c92d8c netfilter: nf_flow_table: clear skb tstamp before xmit
    27264af16969 amd-xgbe: Fix error path in xgbe_mod_init()
    8b7bf7b1b2dd i2c: mediatek: disable zero-length transfers for mt8183
    316c15048f40 i2c: iproc: Stop advertising support of SMBUS quick cmd
    9027939cc8f7 perf/x86/amd/ibs: Fix sample bias for dispatched micro-ops
    e1efdaaa9b46 perf/x86/intel: Restrict period on Nehalem
    1ffda54f0546 i2c: designware: Synchronize IRQs when unregistering slave client
    0910434c455d sky2: Disable MSI on yet another ASUS boards (P6Xxxx)
    cd6901e723fc ibmvnic: Do not process reset during or after device removal
    3ee4ed9cd3a0 ARM: 8901/1: add a criteria for pfn_valid of arm
    eaaa11a4f8d0 RISC-V: Fix FIXMAP area corruption on RV32 systems
    22c521335522 usb: host: xhci-tegra: Set DMA mask correctly
    97b1d81abc61 libceph: don't call crypto_free_sync_skcipher() on a NULL tfm
    b8632186884a cifs: Use kzfree() to zero out the password
    8db988a98290 cifs: set domainName when a domain-key is used in multiuser
    a8bf51b5c6f5 drm/amd/powerplay: correct Vega20 dpm level related settings
    f5c6d0245f97 netfilter: conntrack: make sysctls per-namespace again
    6612f6edf1f1 kallsyms: Don't let kallsyms_lookup_size_offset() fail on retrieving the first symbol
    7c1a4283b606 NFS: remove set but not used variable 'mapping'
    de932b20ed88 NFSv2: Fix write regression
    646d295fdded NFSv2: Fix eof handling
    16986c7cf8b5 netfilter: nf_conntrack_ftp: Fix debug output
    0dec70d3c249 netfilter: xt_physdev: Fix spurious error message in physdev_mt_check
    e3813a30bd6f drm/amdgpu: fix dma_fence_wait without reference
    9b914306b0f7 NFS: Fix writepage(s) error handling to not report errors twice
    78f0f9007523 NFS: Fix spurious EIO read errors
    fa38f165c78a pNFS/flexfiles: Don't time out requests on hard mounts
    7999b21e2224 x86/apic: Fix arch_dynirq_lower_bound() bug for DT enabled machines
    c19a0d7ef095 r8152: Set memory to all 0xFFs on failed reg reads
    f1b6d7c8de4c bpf: allow narrow loads of some sk_reuseport_md fields with offset > 0
    5e0251d82954 flow_dissector: Fix potential use-after-free on BPF_PROG_DETACH
    31320b857d13 batman-adv: Only read OGM2 tvlv_len after buffer len check
    9ae47d48cd2d ARM: 8874/1: mm: only adjust sections of valid mm structures
    b77b8c17df13 drm/virtio: use virtio_max_dma_size
    5a2ffd1ffa54 drm/omap: Fix port lookup for SDI output
    fc45ccc7b85b qed: Add cleanup in qed_slowpath_start()
    304a65866fbe selftests/bpf: add config fragment BPF_JIT
    c963cd4ec138 selftests/bpf: fix test_cgroup_storage on s390
    f4a9b28782c6 xdp: unpin xdp umem pages in error path
    b484e28554d0 Kconfig: Fix the reference to the IDT77105 Phy driver in the description of ATM_NICSTAR_USE_IDT77105
    b8438c08476c NFS: On fatal writeback errors, we need to call nfs_inode_remove_request()
    518c9d0158e0 NFS: Fix initialisation of I/O result struct in nfs_pgio_rpcsetup
    d29a04e98cdb NFSv4: Fix return value in nfs_finish_open()
    b8cb57c86f93 NFSv4: Fix return values for nfs4_file_open()
    7844dde203db netfilter: xt_nfacct: Fix alignment mismatch in xt_nfacct_match_info
    f30dade2d5d5 netfilter: nft_flow_offload: missing netlink attribute policy
    399676d85515 netfilter: ebtables: Fix argument order to ADD_COUNTER
    5b0d408d8ad6 fpga: altera-ps-spi: Fix getting of optional confd gpio
    52ba08b93fee tools: bpftool: close prog FD before exit on showing a single program
    840aec7a8b48 selftests/bpf: fix "bind{4, 6} deny specific IP & port" on s390
    99eb87b50faa s390/bpf: use 32-bit index for tail calls
    62c3bfff7d9e ARM: dts: Fix incomplete dts data for am3 and am4 mmc
    0a3d2a039339 bus: ti-sysc: Simplify cleanup upon failures in sysc_probe()
    e92814b0aae1 ARM: OMAP1: ams-delta-fiq: Fix missing irq_ack
    3d8729676adb ARM: dts: dra74x: Fix iodelay configuration for mmc3
    70af7f6d9e6a ARM: dts: am335x: Fix UARTs length
    b6858c94d535 ARM: OMAP2+: Fix omap4 errata warning on other SoCs
    71d668a95351 s390/bpf: fix lcgr instruction encoding
    f262a47d4bc9 arm64: dts: meson-g12a: add missing dwc2 phy-names
    3d3879d57e3b ARM: dts: Fix incorrect dcan register mapping for am3, am4 and dra7
    6d326307187b ARM: dts: Fix flags for gpio7
    de457d8d0f18 bus: ti-sysc: Fix using configured sysc mask value
    84b9540898a9 bus: ti-sysc: Fix handling of forced idle
    9f500d6b3df2 ARM: OMAP2+: Fix missing SYSC_HAS_RESET_STATUS for dra7 epwmss
    cff4410f5d31 ARM: dts: am57xx: Disable voltage switching for SD card
    05b57db138f3 ieee802154: hwsim: unregister hw while hwsim_subscribe_all_others fails
    b090ed1779d8 ieee802154: hwsim: Fix error handle path in hwsim_init_module
    6fc6065f5f2c nl80211: Fix possible Spectre-v1 for CQM RSSI thresholds
    fb91d697f851 mwifiex: Fix three heap overflow at parsing element in cfg80211_ap_settings
    314a961abd99 tty/serial: atmel: reschedule TX after RX was started
    3bf0e241c813 serial: sprd: correct the wrong sequence of arguments
    3049e5125169 firmware: google: check if size is valid when decoding VPD data
    ad0ef1b06e7b KVM: coalesced_mmio: add bounds checking
    0d84424bdfcd net: dsa: Fix load order between DSA drivers and taggers
    7f4aa339581b xen-netfront: do not assume sk_buff_head list is empty in error handling
    82369aa61ec7 udp: correct reuseport selection with connected sockets
    a4cb1c43dc6c net_sched: let qdisc_put() accept NULL pointer
    81608038502a net/sched: fix race between deactivation and dequeue for NOLOCK qdisc
    8a00845c5d64 ip6_gre: fix a dst leak in ip6erspan_tunnel_xmit
    8d3dc8dfe890 net: aquantia: fix limit of vlan filters
    bd950d777e3a net: hns: fix LED configuration for marvell phy
    854c67e19e73 scripts/decode_stacktrace: match basepath using shell prefix operator, not regex
    88f16147459f powerpc/mm/radix: Use the right page size for vmemmap mapping
    badbf863ed91 nfs: disable client side deduplication
    543792290cce media: stm32-dcmi: fix irq = 0 case
    1fb6db57b831 SUNRPC: Handle connection breakages correctly in call_status()
    5d96613b372d Input: elan_i2c - remove Lenovo Legion Y7000 PnpID
    41a22481ec5d HID: wacom: generic: read HID_DG_CONTACTMAX from any feature report
    7902ff2b8c97 netfilter: nf_flow_table: set default timeout after successful insertion
    e9bc4f96c596 net: hns3: adjust hns3_uninit_phy()'s location in the hns3_client_uninit()
    32e50e282ea7 phy: renesas: rcar-gen3-usb2: Disable clearing VBUS in over-current
    262c7b193cbb media: tm6000: double free if usb disconnect while streaming
    1fc15d29540a USB: usbcore: Fix slab-out-of-bounds bug during device reset

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Richard,

I had to send this along with the refernce board update patch (to
yocto-bsps), since otherwise they'd be mismatched and the fix we
need for the reference boards is in with v5.2.17.

Bruce

 .../linux/linux-yocto-rt_5.2.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.2.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.2.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
index 51897cecf0..6ab1f8d3ee 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.2.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "ba6587bae365332e58b2b6a30e4a93b9ff1c0b26"
-SRCREV_meta ?= "3f2c84ec315b2907de990a5097efe23c605d9e51"
+SRCREV_machine ?= "04d5cfbbd09ba202134f97f8818372c7c9c81fe7"
+SRCREV_meta ?= "56f5bc749e5a8e40b55a3819288ac277813ec5ef"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.2.16"
+LINUX_VERSION ?= "5.2.17"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
index c2b13c8f68..e6eb78198c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.2.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.2.16"
+LINUX_VERSION ?= "5.2.17"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "370a0916e3713a04268fef6b835d0a43faf15196"
-SRCREV_machine ?= "23cc3d3314b5d3482c595baaa036edd2b6d1b69b"
-SRCREV_meta ?= "3f2c84ec315b2907de990a5097efe23c605d9e51"
+SRCREV_machine_qemuarm ?= "e31887832108a1dfac19601459a84a2fa38207f7"
+SRCREV_machine ?= "25b14cdf9659c68ab32d66616dfdbbe2ece3fd94"
+SRCREV_meta ?= "56f5bc749e5a8e40b55a3819288ac277813ec5ef"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.2.bb b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
index 23b4f4f5af..49b14b6185 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.2.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.2/standard/base"
 KBRANCH_qemux86-64 ?= "v5.2/standard/base"
 KBRANCH_qemumips64 ?= "v5.2/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "279084b42cecd49010a59e2850887f39772226d8"
-SRCREV_machine_qemuarm64 ?= "23cc3d3314b5d3482c595baaa036edd2b6d1b69b"
-SRCREV_machine_qemumips ?= "e4e184d31c8e43987077a47d84d8e40963e4bf70"
-SRCREV_machine_qemuppc ?= "23cc3d3314b5d3482c595baaa036edd2b6d1b69b"
-SRCREV_machine_qemuriscv64 ?= "23cc3d3314b5d3482c595baaa036edd2b6d1b69b"
-SRCREV_machine_qemux86 ?= "23cc3d3314b5d3482c595baaa036edd2b6d1b69b"
-SRCREV_machine_qemux86-64 ?= "23cc3d3314b5d3482c595baaa036edd2b6d1b69b"
-SRCREV_machine_qemumips64 ?= "cf8ce04ac2a888234fbd168c7208504f632407fa"
-SRCREV_machine ?= "23cc3d3314b5d3482c595baaa036edd2b6d1b69b"
-SRCREV_meta ?= "3f2c84ec315b2907de990a5097efe23c605d9e51"
+SRCREV_machine_qemuarm ?= "d956bb318771761069228fc70fea722ceabecb75"
+SRCREV_machine_qemuarm64 ?= "25b14cdf9659c68ab32d66616dfdbbe2ece3fd94"
+SRCREV_machine_qemumips ?= "9e95334637a4a85b19bea120f9027ff0028d7069"
+SRCREV_machine_qemuppc ?= "25b14cdf9659c68ab32d66616dfdbbe2ece3fd94"
+SRCREV_machine_qemuriscv64 ?= "25b14cdf9659c68ab32d66616dfdbbe2ece3fd94"
+SRCREV_machine_qemux86 ?= "25b14cdf9659c68ab32d66616dfdbbe2ece3fd94"
+SRCREV_machine_qemux86-64 ?= "25b14cdf9659c68ab32d66616dfdbbe2ece3fd94"
+SRCREV_machine_qemumips64 ?= "29a8d126f60d1b9e9cf0985b38da2033ebde25db"
+SRCREV_machine ?= "25b14cdf9659c68ab32d66616dfdbbe2ece3fd94"
+SRCREV_meta ?= "56f5bc749e5a8e40b55a3819288ac277813ec5ef"
 
 # remap qemuarm to qemuarma15 for the 5.2 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.2;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.2.16"
+LINUX_VERSION ?= "5.2.17"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


