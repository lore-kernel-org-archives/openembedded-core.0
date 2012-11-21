Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TbI81-00087V-8o
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 22:46:47 +0100
Received: from yow-bashfiel-d3.corp.ad.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qALLWUKq020293;
	Wed, 21 Nov 2012 13:32:32 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 21 Nov 2012 16:32:24 -0500
Message-Id: <afda12a746bb9f13954a914fa93f949a4e954ca7.1353532567.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1353532567.git.bruce.ashfield@windriver.com>
References: <cover.1353532567.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1353532567.git.bruce.ashfield@windriver.com>
References: <cover.1353532567.git.bruce.ashfield@windriver.com>
Cc: dvhart@linux.intel.com, linux-yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/3.4: uprobes: reinstate config options for 'uprobe' feature
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2012 21:46:47 -0000

bumping the meta SRCREV to import the following fix:

[
    uprobes: reinstate config options for 'uprobe' feature

    commit 17ec51adfff (meta: cleanup invalid/obselete 3.4 CONFIG options)
    removed the uprobes config options, this restores them.
]

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb   |    2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb      |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index 1176404..76ee542 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "2572b13999da8129c37eb2bf7e9a8fa68dc2a4bf"
 SRCREV_machine_qemuppc ?= "2004632314104d4f31bb1577e955da53796f517c"
-SRCREV_meta ?= "553a8512fd924420db5cc2320ece4a6fd9b1e486"
+SRCREV_meta ?= "472aaf880c9176a40de98c97e14355fe77478598"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
index 6cfec92..50890a3 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.4.bb
@@ -13,7 +13,7 @@ LINUX_VERSION ?= "3.4.18"
 KMETA = "meta"
 
 SRCREV_machine ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
-SRCREV_meta ?= "553a8512fd924420db5cc2320ece4a6fd9b1e486"
+SRCREV_meta ?= "472aaf880c9176a40de98c97e14355fe77478598"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 7a58e1c..587bdd6 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "ae8e2cd14e47bceb9c2bdcb927b3a0ea61f6c311"
 SRCREV_machine_qemux86 ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
 SRCREV_machine_qemux86-64 ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
 SRCREV_machine ?= "f1c2320544eaffd6ecc7fcb8b18f8a0ed4ba2e14"
-SRCREV_meta ?= "553a8512fd924420db5cc2320ece4a6fd9b1e486"
+SRCREV_meta ?= "472aaf880c9176a40de98c97e14355fe77478598"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.10.4



