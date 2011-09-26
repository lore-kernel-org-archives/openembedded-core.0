Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1R8Hik-00064M-R0
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Sep 2011 22:24:11 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(overflow-147-248.ottawa.windriver.com [128.224.147.248])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p8QKIfVx011873;
	Mon, 26 Sep 2011 13:18:42 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Mon, 26 Sep 2011 16:18:38 -0400
Message-Id: <425f8f5237ccc2a3e01cdceb94c982b532fe0c21.1317068205.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1317068205.git.bruce.ashfield@windriver.com>
References: <cover.1317068205.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1317068205.git.bruce.ashfield@windriver.com>
References: <cover.1317068205.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 1/1] linux-yocto/meta: eg20t and live boot config changes
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
X-List-Received-Date: Mon, 26 Sep 2011 20:24:11 -0000

Merging the following configuration changes:

 67a46a6 meta/common-pc-64: enable live booting for common-pc-64
 1010905 meta/common-pc: enable live booting for common-pc
 b3c5fa7 meta/atom-pc: enable live booting for atom-pc
 41c090e meta: update boot live config and move it to cfg/
 d51b0e7 eg20t: update config options

The first 4 make the live-boot configuration shared and then reuse
them for the boards that currently are live bootable. The eg20t
is a cleanup of obselete kernel options and is part of the cleanup
of options for the 3.0 kernel.

[YOCTO: #940]
[YOCTO: #686]

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 2b7a4f9..0c59a5b 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "0936e13cc65d816f1759e2322c5e3fc82a5037f3"
 SRCREV_machine_qemuppc ?= "0936e13cc65d816f1759e2322c5e3fc82a5037f3"
-SRCREV_meta ?= "0dcdf7bb40a8e1fb18fd27d442fa5ace8cff4941"
+SRCREV_meta ?= "67a46a608f47c19f16995be7de7b272025864b1b"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index f11c0ea..9ece25c 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -18,7 +18,7 @@ SRCREV_machine_qemuppc ?= "eccd57eaa4c2b580b9adbbc39e19ecbff56779ae"
 SRCREV_machine_qemux86 ?= "72671808fdbe69a9fe03fd8f094e7c59da04a28c"
 SRCREV_machine_qemux86-64 ?= "2b2d0954a6fd12b4bb7f02f019bc62633c8060a1"
 SRCREV_machine ?= "6b2c7d65b844e686eae7d5cccb9b638887afe28e"
-SRCREV_meta ?= "0dcdf7bb40a8e1fb18fd27d442fa5ace8cff4941"
+SRCREV_meta ?= "67a46a608f47c19f16995be7de7b272025864b1b"
 
 PR = "r2"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



