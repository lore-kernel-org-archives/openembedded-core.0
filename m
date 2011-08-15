Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Qt3n1-0004u3-CW
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 22:29:39 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7FKOvCA019821;
	Mon, 15 Aug 2011 13:24:59 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 15 Aug 2011 16:24:51 -0400
Message-Id: <913d25d506eaf9f0847b2f07c75e4d7c16b3544d.1313439568.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1313439568.git.bruce.ashfield@windriver.com>
References: <cover.1313439568.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1313439568.git.bruce.ashfield@windriver.com>
References: <cover.1313439568.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/3] linux-yocto: bump version string to 3.0.1
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
X-List-Received-Date: Mon, 15 Aug 2011 20:29:39 -0000

There was some confusion around the 3.0 version string in the
linux-yocto recipe when the merged version was 3.0.1. Bumping
the version string should clarify what version will be fetched.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_3.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index ba352e2..132ee0f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -11,7 +11,7 @@ KMACHINE_qemuarm  = "yocto/standard/arm-versatile-926ejs"
 KBRANCH = ${KMACHINE}
 KMETA = meta
 
-LINUX_VERSION ?= "3.0"
+LINUX_VERSION ?= "3.0.1"
 LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
 
 SRCREV_machine_qemuarm = "36b4cdddcafc711f0ec9ad97882f23a6443c61b2"
@@ -22,7 +22,7 @@ SRCREV_machine_qemux86-64 = "d0b814813bce09971c5cbb0d22bacb8842146fa0"
 SRCREV_machine = "ad13129a87957656c18584793abcee51de0e196a"
 SRCREV_meta = "7782fc673afd6a1c742409896ae787560d96fce8"
 
-PR = "r0"
+PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
 SRCREV_FORMAT = "meta_machine"
 
-- 
1.7.4.1



