Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1R3u0g-00088i-Gg
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 20:16:34 +0200
Received: from localhost.localdomain (yow-pbarrett-lx.ottawa.windriver.com
	[128.224.146.11])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8EIBIX7010737;
	Wed, 14 Sep 2011 11:11:20 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 14 Sep 2011 14:11:11 -0400
Message-Id: <69194189787feef64eeb00eabc8858b90c2132c1.1316023378.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1316023378.git.bruce.ashfield@windriver.com>
References: <cover.1316023378.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1316023378.git.bruce.ashfield@windriver.com>
References: <cover.1316023378.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org,
	saul.wold@intel.com
Subject: [PATCH 2/3] linux-yocto: split e100 and e1000 support
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
X-List-Received-Date: Wed, 14 Sep 2011 18:16:34 -0000

Merging the following meta changes:

12574e5 meta: create seperate feature for 10/100 LAN support
c8b37bf meta: Remove 10/100 LAN support.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index ebf6054..36717d6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "0b805cce57f61a244eb3b8fce460b14f1be442b3"
 SRCREV_machine_qemuppc ?= "48207085609f2b73a54e3c1ef4139894eef627af"
-SRCREV_meta ?= "3c9ebeed2598b74798a0c9247ef7c385e0cd96a7"
+SRCREV_meta ?= "12574e5a77597f6938315ef82d18fc5e229fb79c"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index b296558..4b1bdb2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?= "eccd57eaa4c2b580b9adbbc39e19ecbff56779ae"
 SRCREV_machine_qemux86 ?= "72671808fdbe69a9fe03fd8f094e7c59da04a28c"
 SRCREV_machine_qemux86-64 ?= "2b2d0954a6fd12b4bb7f02f019bc62633c8060a1"
 SRCREV_machine ?= "6b2c7d65b844e686eae7d5cccb9b638887afe28e"
-SRCREV_meta ?= "3c9ebeed2598b74798a0c9247ef7c385e0cd96a7"
+SRCREV_meta ?= "12574e5a77597f6938315ef82d18fc5e229fb79c"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



