Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1QzgbK-00054z-Qa
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 05:08:59 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8333sLB012398;
	Fri, 2 Sep 2011 20:03:57 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri,  2 Sep 2011 23:03:26 -0400
Message-Id: <e77a7093c5abf6d1ca6c3032aa22c724f789a02e.1315017994.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1315017994.git.bruce.ashfield@windriver.com>
References: <cover.1315017994.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1315017994.git.bruce.ashfield@windriver.com>
References: <cover.1315017994.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 3/3] linux-yocto: clean configuration for v3.0.4
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
X-List-Received-Date: Sat, 03 Sep 2011 03:08:59 -0000

Fixes [YOCTO #940]

Since v3.0.4 is likely the last stable update in the the release
timeframe a configuration audit was performed. This updates the
SRCREV to remove obselete, and improperly defined configuration
items. With this, all qemu* BSPs configure with no warnings.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index e8e251d..d100cea 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "0b805cce57f61a244eb3b8fce460b14f1be442b3"
 SRCREV_machine_qemuppc ?= "48207085609f2b73a54e3c1ef4139894eef627af"
-SRCREV_meta ?= "5b535279e61197cb194bb2dfceb8b7a04128387c"
+SRCREV_meta ?= "258af0b952b723806baa429b65e3d8cb0d742190"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 221f81b..e0e8a1b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?= "af58047d79790a06e5ac5ba09837c6e65220d7aa"
 SRCREV_machine_qemux86 ?= "515e039eeb316494955e46d38c164e56999511ae"
 SRCREV_machine_qemux86-64 ?= "d19118d19d5f95e83d6fbe1268fe6b84f67de6d3"
 SRCREV_machine ?= "6fcf6f1bca9323fa2e9a5ea15fa84153cccbc28b"
-SRCREV_meta ?= "5b535279e61197cb194bb2dfceb8b7a04128387c"
+SRCREV_meta ?= "258af0b952b723806baa429b65e3d8cb0d742190"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



