Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1QwSoC-0003ud-Qe
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 07:48:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7P5i84u012414
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Aug 2011 22:44:08 -0700 (PDT)
Received: from localhost (128.224.162.196) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 24 Aug 2011 22:44:08 -0700
Message-ID: <ab1c244ce66b213cb39a4b4431db1bf1d2bb5d54.1314242316.git.kai.kang@windriver.com>
In-Reply-To: <cover.1314242316.git.kai.kang@windriver.com>
References: <cover.1314242316.git.kai.kang@windriver.com>
Old-Date: Thu, 25 Aug 2011 10:41:57 +0800
Date: Thu, 25 Aug 2011 13:44:05 +0800
To: <sgw@linux.intel.com>
From: Kang Kai <kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.196]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] qt4-tools-nativesdk: remove gcc standard paths
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
X-List-Received-Date: Thu, 25 Aug 2011 05:48:57 -0000
Content-Type: text/plain

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
1.7.5.1.300.gc565c



