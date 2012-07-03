Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Sm4ym-0007lE-Hd
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 17:25:28 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q63FELjc005061;
	Tue, 3 Jul 2012 08:14:23 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  3 Jul 2012 11:14:13 -0400
Message-Id: <bad529d15d3642fdf3a2ad21a2c46c24f3427e65.1341327590.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1341327589.git.bruce.ashfield@windriver.com>
References: <cover.1341327589.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1341327589.git.bruce.ashfield@windriver.com>
References: <cover.1341327589.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 2/4] linux-yocto/3.4: v3.4.4 + configuration updates
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
X-List-Received-Date: Tue, 03 Jul 2012 15:25:29 -0000

Bumping the kernel version to v3.4.4 and importing the following
meta branch commits:

 9b7c74b meta: bump kver to v3.4.4
 8231dec ck: relocate config post patches
 26b965e net_sched: remove dupicate configuration option
 df8bf19 meta: remove non applying routerstationpro patch
 292d8ea arm: import upstream versatile io.h fix
 f4824b1 net_sched: select ACT as a dependency of INGRESS
 30ae722 cgroups: delete obsolete namespace option
 51f94f0 meta: add qemumipsel mapping

Built and boot tested on qemu*

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    8 ++++----
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   17 ++++++++---------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 4afcf65..f856837 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -3,14 +3,14 @@ require recipes-kernel/linux/linux-yocto.inc
 KBRANCH = "standard/preempt-rt/base"
 KBRANCH_qemuppc = "standard/preempt-rt/qemuppc"
 
-LINUX_VERSION ?= "3.4.3"
+LINUX_VERSION ?= "3.4.4"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 KMETA = "meta"
 
-SRCREV_machine ?= "4a688295a1c6d44f3eea409d51a0344c8830d829"
-SRCREV_machine_qemuppc ?= "83843542dd524007547eddba507690cd4bab393b"
-SRCREV_meta ?= "51f94f06fe908a910564687942fdd82809f82348"
+SRCREV_machine ?= "e24c02204c70e9280115d6512eb54c884dee5fa7"
+SRCREV_machine_qemuppc ?= "b610e46c0ae57e483449c08619d92b8531e75ef5"
+SRCREV_meta ?= "9b7c74bc8e205edb403744098b9d62690c25803e"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 892f058..b21c15d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -10,18 +10,17 @@ KBRANCH_qemumips64 = "standard/mti-malta64"
 KBRANCH_qemumips64el = "standard/mti-malta64"
 KBRANCH_qemuarm  = "standard/arm-versatile-926ejs"
 
-SRCREV_machine_qemuarm ?= "4e354f7fa345464f284525a27eb1544cbc60968d"
-SRCREV_machine_qemumips  ?= "c65bc98cd501459bb6ffc7b5ec5a7e72c41dceef"
-SRCREV_machine_qemumipsel ?= "c65bc98cd501459bb6ffc7b5ec5a7e72c41dceef"
-SRCREV_machine_qemuppc ?= "ee3475b4ca8c9e26f55f6e107101d832e7dec7ac"
-SRCREV_machine_qemux86 ?= "a1cdb60720c452c3965eaec3ec2cd10f06261cc5"
-SRCREV_machine_qemux86-64 ?= "a1cdb60720c452c3965eaec3ec2cd10f06261cc5"
-SRCREV_machine ?= "a1cdb60720c452c3965eaec3ec2cd10f06261cc5"
-SRCREV_meta ?= "51f94f06fe908a910564687942fdd82809f82348"
+SRCREV_machine_qemuarm ?= "168ed084c978a39eabf0071f0049b623bc05c856"
+SRCREV_machine_qemumips  ?= "66dbebd43d65eb070e0afa25f63f6b69ddd47c65"
+SRCREV_machine_qemuppc ?= "bc74ca65c9cae025861455d7f0a259458cd4a829"
+SRCREV_machine_qemux86 ?= "d345461f0d52d1a82553c2edd845a8bee908923f"
+SRCREV_machine_qemux86-64 ?= "d345461f0d52d1a82553c2edd845a8bee908923f"
+SRCREV_machine ?= "d345461f0d52d1a82553c2edd845a8bee908923f"
+SRCREV_meta ?= "9b7c74bc8e205edb403744098b9d62690c25803e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-LINUX_VERSION ?= "3.4.3"
+LINUX_VERSION ?= "3.4.4"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4



