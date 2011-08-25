Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QwRl9-0002Kb-0G
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 06:41:43 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7P4alMu005357;
	Wed, 24 Aug 2011 21:36:49 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 25 Aug 2011 00:36:34 -0400
Message-Id: <d9e0d7d4811b8b70fb7f0c198f530b453a70da38.1314246387.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1314246387.git.bruce.ashfield@windriver.com>
References: <cover.1314246387.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1314246387.git.bruce.ashfield@windriver.com>
References: <cover.1314246387.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto: update meta SRCREV to sync version strings
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
X-List-Received-Date: Thu, 25 Aug 2011 04:41:43 -0000

During the update of the bitbake recipe's string to 3.0.3 the internal
version marker in the kernel stayed at v3.0. This meant that kernel
configuration auditing the constructed file couldn't be found and audit
warnings were thrown. This syncs all the recipes and get back to
clean configurations.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 61210de..16daddf 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -11,12 +11,12 @@ KMACHINE_qemumips = "mti-malta32-be"
 KBRANCH = "yocto/standard/preempt-rt/base"
 KBRANCH_qemuppc = "yocto/standard/preempt-rt/qemu-ppc32"
 
-LINUX_VERSION ?= "3.0"
+LINUX_VERSION ?= "3.0.3"
 LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "67ce0924042a2faa12b71ac3e92175c789c32af6"
 SRCREV_machine_qemuppc ?= "839638f4efda0c70c6f491161ab2c042f5bc3e66"
-SRCREV_meta ?= "13dbce30d6a647228bf5a9483a9b9c2da1514f78"
+SRCREV_meta ?= "5b535279e61197cb194bb2dfceb8b7a04128387c"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index a5e208b..e39be0d 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?= "c0da1d35dee9fb63ba6bfc7907a77b0feb89766e"
 SRCREV_machine_qemux86 ?= "8b51ddba0f85a6bb8e105b37a9ac03fb58b9de20"
 SRCREV_machine_qemux86-64 ?= "965dd365cf3652347960f7145ac188c86c323070"
 SRCREV_machine ?= "49d93fb0c9e1645ba0bb8951be23e56ea227a5bd"
-SRCREV_meta ?= "13dbce30d6a647228bf5a9483a9b9c2da1514f78"
+SRCREV_meta ?= "5b535279e61197cb194bb2dfceb8b7a04128387c"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



