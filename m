Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U4tFv-0007ll-0w
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Feb 2013 14:17:23 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Feb 2013 05:00:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,643,1355126400"; d="scan'208";a="261026362"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga001.jf.intel.com with ESMTP; 11 Feb 2013 05:00:54 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Feb 2013 15:01:48 +0200
Message-Id: <1360587708-5044-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH] qemu: upgrade to 1.3.1
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
X-List-Received-Date: Mon, 11 Feb 2013 13:17:24 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-devtools/qemu/{qemu_1.3.0.bb => qemu_1.3.1.bb} | 4 ++--
 meta/recipes-devtools/qemu/qemu_git.bb                      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu_1.3.0.bb => qemu_1.3.1.bb} (64%)

diff --git a/meta/recipes-devtools/qemu/qemu_1.3.0.bb b/meta/recipes-devtools/qemu/qemu_1.3.1.bb
similarity index 64%
rename from meta/recipes-devtools/qemu/qemu_1.3.0.bb
rename to meta/recipes-devtools/qemu/qemu_1.3.1.bb
index 7d007ea..c04b2be 100644
--- a/meta/recipes-devtools/qemu/qemu_1.3.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.3.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
 
 SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
-SRC_URI[md5sum] = "a4030ddd2ba324152a97d65d3c0b247d"
-SRC_URI[sha256sum] = "878055ec05bc28fecfe2da97eb8bc992e8635575b67cebdfc5ca1ede171140a8"
+SRC_URI[md5sum] = "5dbc6c22f47efca71dfaae0dd80dcf9e"
+SRC_URI[sha256sum] = "3772e7ef0c9b4178195edcf90e711f12ba123f465fcf09fb43b56bdacaca0eaf"
 
 PR = "r0"
diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools/qemu/qemu_git.bb
index 9465203..328e3bf 100644
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ b/meta/recipes-devtools/qemu/qemu_git.bb
@@ -1,6 +1,6 @@
 require qemu.inc
 
-SRCREV = "6d6c9f59ca1b1a76ade7ad868bef191818f58819"
+SRCREV = "04024dea2674861fcf13582a77b58130c67fccd8"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
                     file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
-- 
1.7.11.7



