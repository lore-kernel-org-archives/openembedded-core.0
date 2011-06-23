Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1QZelN-00029F-67
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 09:55:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5N7q9VI019846
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2011 00:52:09 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 23 Jun 2011 00:52:08 -0700
Message-ID: <1a6bcb62666b0fc67a66bd38a1c3f2a3399a249f.1308723458.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1308723458.git.xiaofeng.yan@windriver.com>
References: <cover.1308723458.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 22 Jun 2011 14:03:50 +0800
Date: Thu, 23 Jun 2011 15:48:02 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.28]
Subject: [PATCH 1/1] meta-qt3: Resolve the compilation error when building an lsb image for qemuarm
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
X-List-Received-Date: Thu, 23 Jun 2011 07:55:45 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

The difference for the variable TARGET_OS and BUILD_OS caused compilation error.
I submit this patch to fix this problem.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb b/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb
index e068b27..e64256f 100644
--- a/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb
+++ b/recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb
@@ -57,7 +57,7 @@ do_install() {
  
     install -d ${D}${datadir}/qt3/
     cp -PfR mkspecs ${D}${datadir}/qt3/
-    ln -sf linux-g++ ${D}${datadir}/qt3/mkspecs/${BUILD_OS}-oe-g++
+    ln -sf linux-g++ ${D}${datadir}/qt3/mkspecs/${TARGET_OS}-oe-g++
     ln -s ${D}${datadir}/qt3/mkspecs/ ${D}${datadir}/qmake
     install -d ${D}${libdir}/
     oe_soinstall lib/libqt-mt.so.${PV} ${D}${libdir}/
-- 
1.7.0.4



