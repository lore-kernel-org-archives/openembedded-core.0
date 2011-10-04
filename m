Received: from outbound.icp-qv1-irony-out3.iinet.net.au ([203.59.1.148])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <james@digitalmatter.com.au>) id 1RAwYL-0000cp-0F
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 06:24:25 +0200
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: ApsHACyIik7LO4Se/2dsb2JhbABCmTSOUIEFglMogSnAF4chBId1kTCMCQ
X-IronPort-AV: E=Sophos;i="4.68,483,1312128000"; d="scan'208";a="731378859"
Received: from unknown (HELO gentoo_vm.DMA.local) ([203.59.132.158])
	by outbound.icp-qv1-irony-out3.iinet.net.au with ESMTP;
	04 Oct 2011 12:18:48 +0800
From: James Limbouris <james@digitalmatter.com.au>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Oct 2011 09:42:22 +0800
Message-Id: <1317692542-32543-1-git-send-email-james@digitalmatter.com.au>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH] qt4-embedded: move qt4-embedded-conf from RDEPENDS to RRECOMMENDS
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
X-List-Received-Date: Tue, 04 Oct 2011 04:24:25 -0000

qt4-embedded-conf contains an environment setup script for profile.d.
It has been packaged seperately to allow for its exclusion, but this is
only practical if it is added to RRECOMMENDS, rather than RDEPENDS.

Signed-off-by: James Limbouris <james@digitalmatter.com.au>
---
 meta/recipes-qt/qt4/qt4-embedded.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index ed872b0..c04c49c 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -3,7 +3,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1 | GPLv3"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r32"
+INC_PR = "r33"
 
 QT_BASE_NAME ?= "qt4-embedded"
 QT_BASE_LIB  ?= "libqt-embedded"
@@ -31,7 +31,7 @@ do_install_append() {
 # with depending on the global package qt4-embedded
 PACKAGES += " ${PN}-conf"
 FILES_${PN}-conf += " ${sysconfdir}/profile.d/qte.sh"
-RDEPENDS_${PN} += " ${PN}-conf"
+RRECOMMENDS_${PN} += " ${PN}-conf"
 
 inherit qt4e
 
-- 
1.7.3.4



