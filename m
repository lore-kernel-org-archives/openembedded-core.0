Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 518B16B664
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:29:57 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:29:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457009946"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:29:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:04 +0000
Message-Id: <b8f5a1f732366cb6a2ce850e80154d3624ec98ed.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/38] qmmp: add SUMMARY and tweak DESCRIPTION
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Dec 2013 22:29:57 -0000

Also fix plugin descriptions to be more readable by adding missing
spaces.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt-apps/qmmp_0.6.6.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt-apps/qmmp_0.6.6.bb b/meta/recipes-qt/qt-apps/qmmp_0.6.6.bb
index 2f5e0d5..ddfdfdc 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.6.6.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.6.6.bb
@@ -1,4 +1,5 @@
-DESCRIPTION = "Qmmp (Qt-based Multimedia Player) is an audio-player, written with help of Qt library"
+SUMMARY = "Qt-based Multimedia Player"
+DESCRIPTION = "Qmmp is an audio player, written with the help of the Qt library. The user interface is similar to Winamp or XMMS."
 HOMEPAGE = "http://qmmp.ylsoftware.com"
 LICENSE = "GPLv2"
 LICENSE_FLAGS = "commercial"
@@ -58,7 +59,7 @@ python populate_packages_prepend () {
 
     for plug_dir in plug_dirs:
         g_plug_dir = os.path.join(qmmp_libdir,plug_dir)
-        do_split_packages(d, g_plug_dir, '^lib(.*)\.so$', 'qmmp-plugin-' + plug_dir.lower() + '-%s', 'Qmmp' + plug_dir  + 'plugin for %s')
+        do_split_packages(d, g_plug_dir, '^lib(.*)\.so$', 'qmmp-plugin-' + plug_dir.lower() + '-%s', 'Qmmp ' + plug_dir  + ' plugin for %s')
 }
 
 FILES_${PN} = "\
-- 
1.8.1.2


