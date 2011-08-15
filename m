Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QswJH-00072s-0X
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 14:30:27 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Aug 2011 05:25:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,374,1309762800"; d="scan'208";a="41560219"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.157])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2011 05:25:49 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 15 Aug 2011 20:33:54 +0800
Message-Id: <ea7e8c6075396cc5bc69a3f6ac8d630151ce9e86.1313411289.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1313411289.git.ke.yu@intel.com>
References: <cover.1313411289.git.ke.yu@intel.com>
In-Reply-To: <cover.1313411289.git.ke.yu@intel.com>
References: <cover.1313411289.git.ke.yu@intel.com>
Subject: [PATCH 1/2] qt4.inc: revise RRECOMMENDS
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
X-List-Received-Date: Mon, 15 Aug 2011 12:30:27 -0000

using ${QT_BASE_NAME}-dbg as RRECOMMENDS is not correct in qt4-x11-free
case, because ${QT_BASE_NAME}-dbg i.e. qt4-dbg does not exist

this patch fix it by using ${PN}

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/recipes-qt/qt4/qt4.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 881b445..4d26c64 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -51,7 +51,7 @@ python __anonymous () {
                   ${includedir}/${QT_DIR_NAME}/%(incname)s
                   ${libdir}/pkgconfig/%(name)s${QT_LIBINFIX}.pc""" % locals(), d)
         bb.data.setVar("FILES_%s-dbg" % pkg, "${libdir}/.debug/lib%(name)s${QT_LIBINFIX}.so.*" % locals(), d)
-        bb.data.setVar("RRECOMMENDS_%s-dbg" % pkg, "${QT_BASE_NAME}-dbg", d)
+        bb.data.setVar("RRECOMMENDS_%s-dbg" % pkg, "${PN}-dbg", d)
         lib_packages.append(pkg)
         dev_packages.append("%s-dev" % pkg)
         dbg_packages.append("%s-dbg" % pkg)
@@ -68,7 +68,7 @@ python __anonymous () {
                   ${includedir}/${QT_DIR_NAME}/%(incname)s
                   ${libdir}/pkgconfig/%(name)s.pc""" % locals(), d)
         bb.data.setVar("FILES_%s-dbg" % pkg, "${libdir}/.debug/lib%(name)s.so.*" % locals(), d)
-        bb.data.setVar("RRECOMMENDS_%s-dbg" % pkg, "${QT_BASE_NAME}-dbg", d)
+        bb.data.setVar("RRECOMMENDS_%s-dbg" % pkg, "${PN}-dbg", d)
         lib_packages.append(pkg)
         dev_packages.append("%s-dev" % pkg)
         dbg_packages.append("%s-dbg" % pkg)
-- 
1.7.0.4



