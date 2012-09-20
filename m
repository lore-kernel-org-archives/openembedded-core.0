Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1TEkqv-0006F4-FX
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 19:47:53 +0200
Received: from yow-bashfiel-l1.wrs.com (yow-bashfiel-d3.wrs.com
	[128.224.147.67])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q8KHZ72c019013;
	Thu, 20 Sep 2012 10:35:07 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 20 Sep 2012 13:34:43 -0400
Message-Id: <e1cb0ebb7d6ae858d6b82202f199f9073b537e8f.1348162346.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1348162346.git.bruce.ashfield@windriver.com>
References: <cover.1348162346.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1348162346.git.bruce.ashfield@windriver.com>
References: <cover.1348162346.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] linux-yocto/3.4: use profiling and latencytop features in yocto bsps
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
X-List-Received-Date: Thu, 20 Sep 2012 17:47:53 -0000

Updating the meta SRCREVs to pickup the following configuration change:

    594994c meta: use profiling and latencytop features in yocto bsps

Signed-off-by: Tom Zanussi <tom.zanussi@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    2 +-
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
index e42216b..62858fc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb
@@ -10,7 +10,7 @@ KMETA = "meta"
 
 SRCREV_machine ?= "dcecefa43e05f5450886648a93e2fda2ec35e2dc"
 SRCREV_machine_qemuppc ?= "5e8709c4777f07a12b0a05a22f0864f552ef9449"
-SRCREV_meta ?= "7c50e572635d356f0b66d9ab90823f127f835744"
+SRCREV_meta ?= "594994cb4c19bb4f2e8100ffe0599aef8b2e8b4c"
 
 PR = "${INC_PR}.0"
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
index 7c082e7..cbd3ea1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -9,7 +9,7 @@ SRCREV_machine_qemuppc ?= "cf4bad14983753ad4b592c40fb36466b202b24a4"
 SRCREV_machine_qemux86 ?= "59c3ff750831338d05ab67d5efd7fc101c451aff"
 SRCREV_machine_qemux86-64 ?= "59c3ff750831338d05ab67d5efd7fc101c451aff"
 SRCREV_machine ?= "59c3ff750831338d05ab67d5efd7fc101c451aff"
-SRCREV_meta ?= "7c50e572635d356f0b66d9ab90823f127f835744"
+SRCREV_meta ?= "594994cb4c19bb4f2e8100ffe0599aef8b2e8b4c"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.4.git;protocol=git;nocheckout=1;branch=${KBRANCH},meta;name=machine,meta"
 
-- 
1.7.5.4



