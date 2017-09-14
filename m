Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25329785BC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 13:47:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8EDl7Lo030759
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 14 Sep 2017 06:47:07 -0700
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Thu, 14 Sep 2017 06:47:06 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Thu, 14 Sep 2017 09:46:57 -0400
Message-ID: <050daea67c5da262f4a2a8dd3a88046aab75406b.1505396619.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1505396619.git.bruce.ashfield@windriver.com>
References: <cover.1505396619.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/9] linux-yocto/4.4: update to v4.4.87
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
X-List-Received-Date: Thu, 14 Sep 2017 13:47:07 -0000
Content-Type: text/plain

Integrating the -stable update with the following commits:

   573b59e17e37 Linux 4.4.87
   d95827490c39 crypto: algif_skcipher - only call put_page on referenced and used pages
   ab3ee6b53d67 epoll: fix race between ep_poll_callback(POLLFREE) and ep_free()/ep_remove()
   628212c89fae kvm: arm/arm64: Force reading uncached stage2 PGD
   57ff696f54b5 kvm: arm/arm64: Fix race in resetting stage2 PGD
   94183009ac0e drm/ttm: Fix accounting error when fail to get pages for pool
   9b3dcc98d8df xfrm: policy: check policy direction value
   c0c2e7567a34 wl1251: add a missing spin_lock_init()
   5f08f0aebf70 CIFS: remove endian related sparse warning
   e596cc1454d4 CIFS: Fix maximum SMB2 header size
   6cdda3497db8 alpha: uapi: Add support for __SANE_USERSPACE_TYPES__
   ed48d9230e30 cpuset: Fix incorrect memory_pressure control file mapping
   15e94ec4ec21 cpumask: fix spurious cpumask_of_node() on non-NUMA multi-node configs
   857d0b3dd756 ceph: fix readpage from fscache
   043ccc9781cc i2c: ismt: Return EMSGSIZE for block reads with bogus length
   fab3229af4e5 i2c: ismt: Don't duplicate the receive length for block reads
   e119fc492de9 irqchip: mips-gic: SYNC after enabling GIC region
   cd99a4f3f43b Linux 4.4.86
   c81c4d453edf drm/i915: fix compiler warning in drivers/gpu/drm/i915/intel_uncore.c
   b7571624fe98 scsi: sg: reset 'res_in_use' after unlinking reserved array
   a4075bbb67b9 scsi: sg: protect accesses to 'reserved' page array
   823086b057aa arm64: fpsimd: Prevent registers leaking across exec
   218720fe5939 x86/io: Add "memory" clobber to insb/insw/insl/outsb/outsw/outsl
   a7a074f3a4d5 arm64: mm: abort uaccess retries upon fatal signal
   da981044d049 lpfc: Fix Device discovery failures during switch reboot test.
   389328ea1379 p54: memset(0) whole array
   5acdbe667cf4 lightnvm: initialize ppa_addr in dev_to_generic_addr()
   d255fffdb532 gcov: support GCC 7.1
   2f3e97a814c8 gcov: add support for gcc version >= 6
   41685ae5cd7b i2c: jz4780: drop superfluous init
   05429bbfd726 btrfs: remove duplicate const specifier
   9a64425945a0 ALSA: au88x0: Fix zero clear of stream->resources
   da8477a6695a scsi: isci: avoid array subscript warning

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.4.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
index b797dff25afd..f808f9bb9c99 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1ac44e48420edba265d0fa18e4040e6d975776e6"
-SRCREV_meta ?= "8e9afd032ff3be672506a0e5ed51cde9dc45031f"
+SRCREV_machine ?= "7c9e95ef538ddfed606500281e20c42bc1ac1ae0"
+SRCREV_meta ?= "804d2b3164ec25ed519fd695de9aa0908460c92e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.85"
+LINUX_VERSION ?= "4.4.87"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
index d10803ae91a3..56dd6f40e895 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.4.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.4.85"
+LINUX_VERSION ?= "4.4.87"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "0327f8213797c4885f86aec26cf55aeef5834180"
-SRCREV_meta ?= "8e9afd032ff3be672506a0e5ed51cde9dc45031f"
+SRCREV_machine ?= "7078ebf077771189f5da4b676f70dddc92abba42"
+SRCREV_meta ?= "804d2b3164ec25ed519fd695de9aa0908460c92e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
index 5634928b9388..9e8f43c3cdb9 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "50253831d9b2d3dfb8e910debda66405cb11900a"
-SRCREV_machine_qemuarm64 ?= "0327f8213797c4885f86aec26cf55aeef5834180"
-SRCREV_machine_qemumips ?= "d49ac34e4781b4bcd4c1728338668bb1fd321f7c"
-SRCREV_machine_qemuppc ?= "0327f8213797c4885f86aec26cf55aeef5834180"
-SRCREV_machine_qemux86 ?= "0327f8213797c4885f86aec26cf55aeef5834180"
-SRCREV_machine_qemux86-64 ?= "0327f8213797c4885f86aec26cf55aeef5834180"
-SRCREV_machine_qemumips64 ?= "310df4a803d8938415e761668426391985193398"
-SRCREV_machine ?= "0327f8213797c4885f86aec26cf55aeef5834180"
-SRCREV_meta ?= "8e9afd032ff3be672506a0e5ed51cde9dc45031f"
+SRCREV_machine_qemuarm ?= "799a97a6f555d98479a55d92e580d91e6f621118"
+SRCREV_machine_qemuarm64 ?= "7078ebf077771189f5da4b676f70dddc92abba42"
+SRCREV_machine_qemumips ?= "18ad0e32668a585380b7f48b5dacd288b0c882d3"
+SRCREV_machine_qemuppc ?= "7078ebf077771189f5da4b676f70dddc92abba42"
+SRCREV_machine_qemux86 ?= "7078ebf077771189f5da4b676f70dddc92abba42"
+SRCREV_machine_qemux86-64 ?= "7078ebf077771189f5da4b676f70dddc92abba42"
+SRCREV_machine_qemumips64 ?= "1b88be0ada672b2b74221d9a810d3072cb92cf37"
+SRCREV_machine ?= "7078ebf077771189f5da4b676f70dddc92abba42"
+SRCREV_meta ?= "804d2b3164ec25ed519fd695de9aa0908460c92e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.4.85"
+LINUX_VERSION ?= "4.4.87"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


