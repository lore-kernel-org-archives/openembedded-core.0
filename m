Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RWN8q-0002b4-Op
	for openembedded-core@openembedded.org; Fri, 02 Dec 2011 08:02:41 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 01 Dec 2011 22:55:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,282,1320652800"; d="scan'208";a="43189775"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.251])
	by AZSMGA002.ch.intel.com with ESMTP; 01 Dec 2011 22:55:53 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu,  1 Dec 2011 22:55:42 -0800
Message-Id: <a6945fe6fa8a6c1ad5ceec5c05b8eb29a29c4d18.1322808632.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
In-Reply-To: <cover.1322808632.git.sgw@linux.intel.com>
References: <cover.1322808632.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/18] kern-tools: add pre_config and merge_config.sh to the list of tools
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
X-List-Received-Date: Fri, 02 Dec 2011 07:02:41 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

As a transition step to moving kern_tools into the kernel tree
itself this change adopts merge_config.sh as a common base for
merging configuration fragments. So we add merge_config.sh and
pre_config to the list of kern_tools.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../kern-tools/kern-tools-native_git.bb            |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 87aa574..ef078ce 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://git/tools/kgit;beginline=5;endline=9;md5=e2bf4415f3d8
 DEPENDS = "git-native guilt-native"
 
 SRCREV = "364437739c45a5e771d1f7b3ac73c35f1328fd97"
-PR = r10
+PR = r11
 PV = "0.1+git${SRCPV}"
 
 inherit native
@@ -16,7 +16,8 @@ S = "${WORKDIR}"
 kern_tools_LIST = kgit kgit-init kgit-meta \
                   kgit-checkpoint kgit-clean \
                   generate_cfg kconf_check configme \
-		  createme updateme patchme get_defconfig scc
+		  createme updateme patchme get_defconfig scc \
+                  pre_config merge_config.sh
 
 do_compile() { 
 	:
-- 
1.7.6.4



