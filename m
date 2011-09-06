Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1R0zEw-0002r4-H3
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 19:15:15 +0200
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(dhcp-146-223.ottawa.windriver.com [128.224.146.223])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p86H9aRW009030;
	Tue, 6 Sep 2011 10:09:38 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Tue,  6 Sep 2011 13:09:29 -0400
Message-Id: <8299f110c595287491bda64a0a77f0f9d9dde68b.1315328841.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1315328841.git.bruce.ashfield@windriver.com>
References: <cover.1315328841.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1315328841.git.bruce.ashfield@windriver.com>
References: <cover.1315328841.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/2] linux-yocto: re-enable utrace
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
X-List-Received-Date: Tue, 06 Sep 2011 17:15:15 -0000

Upating the meta data and machine branch contents with the up
to date merge of utrace.

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |   14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
index 2bd69c0..b296ef4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb
@@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE = "preempt-rt"
 
 SRCREV_machine ?= "0b805cce57f61a244eb3b8fce460b14f1be442b3"
 SRCREV_machine_qemuppc ?= "48207085609f2b73a54e3c1ef4139894eef627af"
-SRCREV_meta ?= "82140b960a7cc13d116be61a85d4fe7f7d38680f"
+SRCREV_meta ?= "3c9ebeed2598b74798a0c9247ef7c385e0cd96a7"
 
 PR = "r0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
index 974d384..f504b74 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
@@ -12,13 +12,13 @@ KBRANCH = ${KMACHINE}
 
 LINUX_VERSION ?= "3.0.4"
 
-SRCREV_machine_qemuarm ?= "b18f5c601ccc90b4c94d1d29282cf7c53fcb6e22"
-SRCREV_machine_qemumips ?= "0696ab4056ddc1b4504e8636e47a918bdff5b257"
-SRCREV_machine_qemuppc ?= "af58047d79790a06e5ac5ba09837c6e65220d7aa"
-SRCREV_machine_qemux86 ?= "515e039eeb316494955e46d38c164e56999511ae"
-SRCREV_machine_qemux86-64 ?= "d19118d19d5f95e83d6fbe1268fe6b84f67de6d3"
-SRCREV_machine ?= "6fcf6f1bca9323fa2e9a5ea15fa84153cccbc28b"
-SRCREV_meta ?= "82140b960a7cc13d116be61a85d4fe7f7d38680f"
+SRCREV_machine_qemuarm ?= "7908f38ac44359d58c40b166dbb45e48fc58295c"
+SRCREV_machine_qemumips ?= "7ea75f58d69293e6b1c2f904f8f5790521a7ccee"
+SRCREV_machine_qemuppc ?= "eccd57eaa4c2b580b9adbbc39e19ecbff56779ae"
+SRCREV_machine_qemux86 ?= "72671808fdbe69a9fe03fd8f094e7c59da04a28c"
+SRCREV_machine_qemux86-64 ?= "2b2d0954a6fd12b4bb7f02f019bc62633c8060a1"
+SRCREV_machine ?= "6b2c7d65b844e686eae7d5cccb9b638887afe28e"
+SRCREV_meta ?= "3c9ebeed2598b74798a0c9247ef7c385e0cd96a7"
 
 PR = "r1"
 PV = "${LINUX_VERSION}+git${SRCPV}"
-- 
1.7.4.1



