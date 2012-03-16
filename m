Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S8aJk-0001DM-N9
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 17:47:53 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2GGcx36023581;
	Fri, 16 Mar 2012 09:39:01 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 16 Mar 2012 12:38:46 -0400
Message-Id: <9d79b6cb58c7c1ddfb83f19cdde6211ba09ff589.1331915755.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331915755.git.bruce.ashfield@windriver.com>
References: <cover.1331915755.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1331915755.git.bruce.ashfield@windriver.com>
References: <cover.1331915755.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/4] linux-yocto/3.2: update fri2 configuration
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
X-List-Received-Date: Fri, 16 Mar 2012 16:47:53 -0000

Bumping the meta SRCREV to pickup the following change

    fri2: Update fri2.cfg for hardware specific support

    The FRI2 does not require R8169 or PATA support. It does not need SFF
    or GENERIC ATA options either.

    The FRI2 does require IEEE802154 (Zigbee), BT (Bluetooth), and IWLWIFI.
    The latter is compiled as a module to avoid the need for an initrd
    containing the firmware blobs.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.2.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
index 24a885f..85e2f56 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "ae15fb7aaba7d12c48e1a1d30e5b8857d40b9b10"
 SRCREV_machine_qemuppc ?= "963f79376e583ff79c55fd275b79bfc9a3aedd8e"
-SRCREV_meta ?= "8295227f068f78ec3c433529e4012a38773a88c9"
+SRCREV_meta ?= "42fff722188e0de7246a3a6900eeeeaf69f87047"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.2.bb b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
index fdfde8a..c98937f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.2.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.2.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemuppc ?= "74364f1062a219eb242d7cb300a404516c297601"
 SRCREV_machine_qemux86 ?= "ea0a62d6821aede782c2b9457639f1ca7f2ddc07"
 SRCREV_machine_qemux86-64 ?= "626165edf65281d9b933a6129e935c7a73ab63a7"
 SRCREV_machine ?= "6f164ae4ef5aeec2bef40a1b936ac1f9b9db46ba"
-SRCREV_meta ?= "8295227f068f78ec3c433529e4012a38773a88c9"
+SRCREV_meta ?= "42fff722188e0de7246a3a6900eeeeaf69f87047"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4



