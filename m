Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qx2Kd-0006Xu-Da
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 21:44:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 26 Aug 2011 12:39:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,286,1312182000"; d="scan'208";a="45450512"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.251])
	by fmsmga001.fm.intel.com with ESMTP; 26 Aug 2011 12:39:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2011 12:39:37 -0700
Message-Id: <be86cbf54f3aeeda1105acd153fe09348a7ac267.1314387279.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314387279.git.sgw@linux.intel.com>
References: <cover.1314387279.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 07/21] qt4-tools-nativesdk: remove gcc standard paths
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
X-List-Received-Date: Fri, 26 Aug 2011 19:44:47 -0000

From: Kang Kai <kai.kang@windriver.com>

gcc-crosssdk can't find the standard headers before, and it was fixed.
So it is not needed to search the gcc standard paths by
qt4-tools-nativesdk itself.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
index cc83b72..068528e 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
@@ -4,7 +4,7 @@ SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 LICENSE = "LGPLv2.1 | GPLv3"
 
-INC_PR = "r4"
+INC_PR = "r5"
 
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/qt-${PV}:"
 
@@ -43,13 +43,8 @@ EXTRA_OECONF = "-prefix ${prefix} \
                 -arch ${@qt_arch(d)} \
                 -embedded -no-freetype -no-glib -no-iconv \
                 -qt3support \
-                -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include \
                 -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/dbus-1.0 \
-                -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/lib/dbus-1.0/include \
-                -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++ \
-                -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++/${TARGET_SYS} \
-                -L${STAGING_DIR_HOST}${SDKPATHNATIVE}/lib \
-                -L${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/lib"
+                -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/lib/dbus-1.0/include"
 
 # yank default -e, otherwise we get the following error:
 # moc_qbuffer.cpp: No such file or directory
-- 
1.7.6



