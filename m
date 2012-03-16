Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S8aJk-0001DL-DT
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 17:47:52 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2GGcx35023581;
	Fri, 16 Mar 2012 09:39:00 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 16 Mar 2012 12:38:45 -0400
Message-Id: <a6a457798bea28b979a5775a5bea562cc481d120.1331915755.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1331915755.git.bruce.ashfield@windriver.com>
References: <cover.1331915755.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1331915755.git.bruce.ashfield@windriver.com>
References: <cover.1331915755.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/4] linux-yocto/3.0: update meta SRCREV
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
X-List-Received-Date: Fri, 16 Mar 2012 16:47:52 -0000

Bumping the meta branch for two changes:

  cac43c1 fri2: Update fri2.cfg for hardware specific support
  892bd13 meta: Create scc file for pvr merge

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index e944416..a9a921d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "49d1d57f98a9ac378a1f12f5d23301c11495a5df"
 SRCREV_machine_qemuppc ?= "7b3162e269c49c6a4653d43292c62c188add8d67"
-SRCREV_meta ?= "e559129b4a6f39f68b75141096b2d516cf7a7f35"
+SRCREV_meta ?= "cac43c16d4c0cbbb857c9c110195208629975b06"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
index a3a6167..b67ddee 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb
@@ -11,7 +11,7 @@ KBRANCH = "${KMACHINE}"
 LINUX_VERSION ?= "3.0.23"
 
 SRCREV_machine ?= "8fd24b3570ab995848e4123ef13bac64e2c924be"
-SRCREV_meta ?= "e559129b4a6f39f68b75141096b2d516cf7a7f35"
+SRCREV_meta ?= "cac43c16d4c0cbbb857c9c110195208629975b06"
 
 PR = "r3"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index d76bac8..cb4ded2 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?= "16f1ebf66ce2b58cbfc0ff7c8883c91c883e216a"
 SRCREV_machine_qemux86 ?= "bc2cb6560d3dedf8337b5df8228a6e8002b6a98c"
 SRCREV_machine_qemux86-64 ?= "b9cbe895ce0c259b4684355ea1602402b2653ca5"
 SRCREV_machine ?= "8fd24b3570ab995848e4123ef13bac64e2c924be"
-SRCREV_meta ?= "e559129b4a6f39f68b75141096b2d516cf7a7f35"
+SRCREV_meta ?= "cac43c16d4c0cbbb857c9c110195208629975b06"
 
 PR = "r4"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.5.4



