Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U2fBH-0006Tm-Gz
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 10:51:13 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Feb 2013 01:35:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,602,1355126400"; d="scan'208";a="281086924"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 05 Feb 2013 01:35:14 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 11:35:01 +0200
Message-Id: <d760ae0f13d72d3aac64bd7420bdd0ffcebd42ba.1360055640.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360055640.git.laurentiu.palcu@intel.com>
References: <cover.1360055640.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360055640.git.laurentiu.palcu@intel.com>
References: <cover.1360055640.git.laurentiu.palcu@intel.com>
Subject: [PATCH 7/8] package_ipk, rootfs_ipk: remove the "set -x"
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
X-List-Received-Date: Tue, 05 Feb 2013 09:51:14 -0000

Comment the "set -x" lines since these will add a lot of extra, not
always necessary, debug messages in the log.do_rootfs.

[YOCTO #2599]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/package_ipk.bbclass |    2 +-
 meta/classes/rootfs_ipk.bbclass  |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 433d0bb..412c3f8 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -196,7 +196,7 @@ ipk_log_check() {
 # Update the Packages index files in ${DEPLOY_DIR_IPK}
 #
 package_update_index_ipk () {
-	set -x
+	#set -x
 
 	ipkgarchs="${ALL_MULTILIB_PACKAGE_ARCHS} ${SDK_PACKAGE_ARCHS}"
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 0e2fa12..d6a7ac4 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -26,7 +26,7 @@ BAD_RECOMMENDATIONS ?= ""
 MULTILIBRE_ALLOW_REP = "${opkglibdir}"
 
 fakeroot rootfs_ipk_do_rootfs () {
-	set -x
+	#set -x
 
 	rm -f ${IPKGCONF_TARGET}
 	touch ${IPKGCONF_TARGET}
-- 
1.7.9.5



