Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 12C6B71B86
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 13:54:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0IDsfGt018747
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 18 Jan 2017 05:54:41 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 18 Jan 2017 05:54:40 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Wed, 18 Jan 2017 08:54:25 -0500
Message-ID: <9ee2c8a30ab4db37996ca5339ae9fc87bca9bd8c.1484747560.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1484747560.git.bruce.ashfield@windriver.com>
References: <cover.1484747560.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/14] linux-yocto/4.1: update to v4.1.37
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
X-List-Received-Date: Wed, 18 Jan 2017 13:54:41 -0000
Content-Type: text/plain

Integrating the -stable release. Changes are as follows:

   35327468a79d Linux 4.1.37
   c27edfb64bbf scsi: megaraid_sas: fix macro MEGASAS_IS_LOGICAL to avoid regression
   016d02981cce tipc: check minimum bearer MTU
   efcf38bd4020 net: ping: check minimum size on ICMP header length
   e29fdf045048 packet: fix race condition in packet_set_ring
   fabaaaa96d54 net: add recursion limit to GRO
   7abf32087c1d Bluetooth: Fix potential NULL dereference in RFCOMM bind callback
   74cd81c810b9 ptrace: being capable wrt a process requires mapped uids/gids
   8165fc3eb28c scsi: arcmsr: Buffer overflow in arcmsr_iop_message_xfer()
   1171afc4a34e mnt: Add a per mount namespace limit on the number of mounts
   62fa696b7b43 posix_acl: Clear SGID bit when setting file permissions
   de42b9559d0c fs: Avoid premature clearing of capabilities
   cb8e1eef351b fs: Give dentry to inode_change_ok() instead of inode
   2ee3ceeccd34 nfsd: Disable NFSv2 timestamp workaround for NFSv3+
   820bc4582ab9 fuse: Propagate dentry down to inode_change_ok()
   89bc54c54027 xfs: Propagate dentry down to inode_change_ok()
   1b364dc9edba xattr: Option to disable meta-data block cache
   9a66bc6ee0f9 tcp: fix use after free in tcp_xmit_retransmit_queue()
   ebdb88b8e465 x86/kexec: add -fno-PIE
   672612a21845 scripts/has-stack-protector: add -fno-PIE
   e06ded86d961 x86/init: Fix cr4_init_shadow() on CR4-less machines
   eec746939372 ARM: 8617/1: dma: fix dma_max_pfn()
   58024f829d0b mm,ksm: fix endless looping in allocating memory when ksm enable
   d427d645ccf9 can: dev: fix deadlock reported after bus-off
   791a92897274 cpuset: handle race between CPU hotplug and cpuset_hotplug_work
   6b82b0601ac2 mtd: nand: davinci: Reinitialize the HW ECC engine in 4bit hwctl
   e537a0977f3e drm/msm: fix use of copy_from_user() while holding spinlock
   b56eb9cdc5f1 bus: arm-ccn: Fix PMU handling of MN
   7298a8bf4c63 bus: arm-ccn: Provide required event arguments

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb   |  6 +++---
 meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_4.1.bb      | 20 ++++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
index 70658832a92e..dc9a8dcd3246 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipPackage("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f3ffbf4880a5103504a4e11c9427b0bdbf222939"
-SRCREV_meta ?= "44719fa8f73fd7c444044ad3c04f5fc66f57b993"
+SRCREV_machine ?= "109fa96e6ae89b0585e78186b374b57b9f37fcbb"
+SRCREV_meta ?= "4de9b8f96c8dca0c55a496792a2ad4d2776e6657"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.36"
+LINUX_VERSION ?= "4.1.37"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
index 80be144e4ee4..ed5a70b43c8d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_4.1.bb
@@ -4,13 +4,13 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "4.1.36"
+LINUX_VERSION ?= "4.1.37"
 
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "fec49247816d7045aa8abe0047bcd4737af9a853"
-SRCREV_meta ?= "44719fa8f73fd7c444044ad3c04f5fc66f57b993"
+SRCREV_machine ?= "61d2bedf25deac15c19413ee1b057067657d97d3"
+SRCREV_meta ?= "4de9b8f96c8dca0c55a496792a2ad4d2776e6657"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_4.1.bb b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
index b55487782776..19f321721c35 100644
--- a/meta/recipes-kernel/linux/linux-yocto_4.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_4.1.bb
@@ -11,20 +11,20 @@ KBRANCH_qemux86  ?= "standard/base"
 KBRANCH_qemux86-64 ?= "standard/base"
 KBRANCH_qemumips64 ?= "standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "c8ab8bf2bdff3b355710065725f4e272bf0a5a5d"
-SRCREV_machine_qemuarm64 ?= "fec49247816d7045aa8abe0047bcd4737af9a853"
-SRCREV_machine_qemumips ?= "475a0182d9e940351a3fecaecb31e55effad45ad"
-SRCREV_machine_qemuppc ?= "88a3e5a3a8f693d25b09b64cd2be5df783933f74"
-SRCREV_machine_qemux86 ?= "fec49247816d7045aa8abe0047bcd4737af9a853"
-SRCREV_machine_qemux86-64 ?= "fec49247816d7045aa8abe0047bcd4737af9a853"
-SRCREV_machine_qemumips64 ?= "9ffd7155a07e7cfed2229b3a78d2278f3b56f13d"
-SRCREV_machine ?= "fec49247816d7045aa8abe0047bcd4737af9a853"
-SRCREV_meta ?= "44719fa8f73fd7c444044ad3c04f5fc66f57b993"
+SRCREV_machine_qemuarm ?= "0ec64d1dadd3de6736b5b9acd5ffc7b3b9a22071"
+SRCREV_machine_qemuarm64 ?= "61d2bedf25deac15c19413ee1b057067657d97d3"
+SRCREV_machine_qemumips ?= "8d5c7074354cef47bbc2e3aabd926a3409f02b12"
+SRCREV_machine_qemuppc ?= "11c828d1e438aba1be93c4e19cb458f6391c3aa6"
+SRCREV_machine_qemux86 ?= "61d2bedf25deac15c19413ee1b057067657d97d3"
+SRCREV_machine_qemux86-64 ?= "61d2bedf25deac15c19413ee1b057067657d97d3"
+SRCREV_machine_qemumips64 ?= "03a03f3543a050b8a83618ed25d408beaa099371"
+SRCREV_machine ?= "61d2bedf25deac15c19413ee1b057067657d97d3"
+SRCREV_meta ?= "4de9b8f96c8dca0c55a496792a2ad4d2776e6657"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.1.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "4.1.36"
+LINUX_VERSION ?= "4.1.37"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
-- 
2.5.0


