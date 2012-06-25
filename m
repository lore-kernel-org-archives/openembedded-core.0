Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1SjCog-0000V2-Gq
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 19:11:10 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5PH09tI017802;
	Mon, 25 Jun 2012 10:00:12 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 25 Jun 2012 12:59:45 -0400
Message-Id: <c4bfd8375fd7ee5a8421410199f929d1b745a2a3.1340643139.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1340643139.git.bruce.ashfield@windriver.com>
References: <cover.1340643139.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1340643139.git.bruce.ashfield@windriver.com>
References: <cover.1340643139.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 2/5] linux-yocto/3.4: update and categorize configuration options
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jun 2012 17:11:10 -0000

Updating the 3.4 kernel tree with some initial results of the 3.4
kernel configuration audit and refresh. This is the start of the
3.4 kernel configuration policy update and includes a refresh / update
with respect to kernel.org defaults and new categorization of
configuration fragments.

 0f6975b Sched: Import base BFS-423 for v3.4
 c517c5c cfg: strip off redundant path prefixes
 689fd20 cfg: create timer subdir for HZ and HPET related settings
 5367b46 cfg: add a fs dir for filesystem related configs
 67a784b x86/x86_64: disable MTRR sanitizer
 5da51ea x86/x86_64: consolidate ACPI and EFI settings
 7627402 x86/x86_64: enable CONFIG_NO_HZ=y by default.
 9ca6026 mips: select HZ=100 by default.
 149efc6 arm: select HZ=100 by default.
 29c9fc7 x86/x86_64: use HZ=1000
 700b8b5 x86/x86_64: enable boot mem corruption checks; align with korg defaults
 bbd054d x86: enable CONFIG_HIGHPTE=y by default.
 2569871 x86: align to korg defconfig on IRQ fixups and microcode
 ec5cdc2 x86/x86_64: enable SMP by default
 b9932fa cfg: relocate/add a frag for HPET / RTC enablement
 f9645f5 8250: separate out the 8250 configuration from feature dir
 5e8fea0 bsp: tie cfg/x86.scc into all "KARCH i386" boards
 4020ade cfg: make a common landing ground for ARCH=x86
 e126316 cfg: add basic HZ fragments
 4a8627b cfg: delete instances of any reference to dmesg buf size.
 0794c16 routerstationpro: lib/kobject_uevent: switch to uevent_sock_mutex

[YOCTO #1694]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 52f2dd1..bd6f222 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -11,7 +11,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "9dc5e97d144abb03deec411acb9c64883602cff9"
 SRCREV_machine_qemuppc ?= "241a41d6104df6916280f1273894bbd7fa7cdd71"
-SRCREV_meta ?= "aa226dcc5a1351fae49da40d77b718c4c3a76e7c"
+SRCREV_meta ?= "0f6975b8d01ffba0cd5f3548812e763c8610965b"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index eb5e888..0ff40be 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -16,7 +16,7 @@ SRCREV_machine_qemuppc ?= "4988a7e34bccd531b511c57f93358de9fcc672a0"
 SRCREV_machine_qemux86 ?= "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
 SRCREV_machine_qemux86-64 ?= "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
 SRCREV_machine ?= "a8291fa6f723b0182d2b7033b5d59f412ba7cf72"
-SRCREV_meta ?= "aa226dcc5a1351fae49da40d77b718c4c3a76e7c"
+SRCREV_meta ?= "0f6975b8d01ffba0cd5f3548812e763c8610965b"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.5.4



