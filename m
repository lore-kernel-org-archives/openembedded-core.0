Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QsuER-0002c1-My
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 12:17:19 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Aug 2011 03:12:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,373,1309762800"; d="scan'208";a="41534192"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.18.70])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2011 03:12:42 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Aug 2011 11:12:36 +0100
Message-Id: <8d3f17c8c744e447ec7ac83ff09a35c6fdb5b1b6.1313402929.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1313402929.git.paul.eggleton@linux.intel.com>
References: <cover.1313402929.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1313402929.git.paul.eggleton@linux.intel.com>
References: <cover.1313402929.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] qt4-native: restore build of uic3, qdbuscpp2xml and qdbusxml2cpp
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
X-List-Received-Date: Mon, 15 Aug 2011 10:17:20 -0000

These tools are required to build some external utilities (such as those
found in KDE). We avoid building qdbus and qdbusviewer as these are
not required.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4-native.inc |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-native.inc b/meta/recipes-qt/qt4/qt4-native.inc
index 3baea20..7ed6a63 100644
--- a/meta/recipes-qt/qt4/qt4-native.inc
+++ b/meta/recipes-qt/qt4/qt4-native.inc
@@ -54,8 +54,11 @@ TOBUILD = "\
   src/gui \
   src/testlib \
   src/qt3support \
+  src/tools/uic3 \
   tools/linguist/lrelease \
   tools/linguist/lupdate \
+  tools/qdbus/qdbuscpp2xml \
+  tools/qdbus/qdbusxml2cpp \
 "
 
 do_compile() {
@@ -67,7 +70,7 @@ do_compile() {
 do_install() {
 	install -d ${D}${bindir}/
 	install -m 0755 bin/qmake ${D}${bindir}/qmake2
-	for i in moc uic rcc lrelease lupdate; do
+	for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qdbusxml2cpp; do
 		install -m 0755 bin/${i} ${D}${bindir}/${i}4
 	done
     
-- 
1.7.4.1



