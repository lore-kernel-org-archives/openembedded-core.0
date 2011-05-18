Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QMcvq-00020r-Bl
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 11:20:42 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 18 May 2011 02:09:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,230,1304319600"; 
   d="scan'208";a="3853570"
Received: from unknown (HELO helios) ([10.255.16.147])
	by fmsmga001.fm.intel.com with SMTP; 18 May 2011 02:08:59 -0700
Received: by helios (sSMTP sendmail emulation); Wed, 18 May 2011 10:08:59 +0100
Message-Id: <65b7187b8f82f45f226e40a0e08ed20d0510d6f6.1305709034.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1305709034.git.paul.eggleton@linux.intel.com>
References: <cover.1305709034.git.paul.eggleton@linux.intel.com>
Old-Date: Tue, 17 May 2011 17:18:16 +0100
Date: Wed, 18 May 2011 10:08:59 +0100
To: openembedded-core@lists.openembedded.org
CC: 
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] qt4: re-enable two 4.6.x patches in 4.7.3
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
X-List-Received-Date: Wed, 18 May 2011 09:20:42 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Two patches that were being applied in 4.6.x are now applied for 4.7.3.
The functions of these two patches are:

* Add support for 2bpp (only affects qt4-embedded)
* Use correct infix on QtUiTools library (only affects qt4-embedded as
  qt4-x11-free does not define an infix)

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt-4.7.3.inc          |    2 ++
 meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb |    2 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb |    2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt-4.7.3.inc b/meta/recipes-qt/qt4/qt-4.7.3.inc
index 7f26b9b..c58679f 100644
--- a/meta/recipes-qt/qt4/qt-4.7.3.inc
+++ b/meta/recipes-qt/qt4/qt-4.7.3.inc
@@ -9,6 +9,8 @@ SRC_URI = "http://get.qt.nokia.com/qt/source/qt-everywhere-opensource-src-${PV}.
            file://0004-no-qmake.patch \
            file://hack-out-pg2-4.7.0.patch \
            file://0006-freetype-host-includes.patch \
+           file://0008-qt-lib-infix.patch \
+           file://0009-support-2bpp.patch \
            file://0001-Added-Openembedded-crossarch-option.patch \
            file://g++.conf \
            file://linux.conf \
diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb b/meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb
index b88b1e9..c3f6713 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb
@@ -1,7 +1,7 @@
 require qt-${PV}.inc
 require qt4-embedded.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb
index 359a756..75c6314 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb
@@ -1,7 +1,7 @@
 require qt4-x11-free.inc
 require qt-${PV}.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
 
-- 
1.7.4.1



