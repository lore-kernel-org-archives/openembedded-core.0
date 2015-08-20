Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5B2C1759CD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 08:10:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 20 Aug 2015 01:10:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,714,1432623600"; d="scan'208";a="772278371"
Received: from ljegan-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.54])
	by fmsmga001.fm.intel.com with ESMTP; 20 Aug 2015 01:10:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 09:10:16 +0100
Message-Id: <c1bf624ba05e37e6c102e875ea1b41a899538191.1440058148.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1440058148.git.paul.eggleton@linux.intel.com>
References: <cover.1440058148.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1440058148.git.paul.eggleton@linux.intel.com>
References: <cover.1440058148.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] packagegroup-qt*-toolchain-target: fix hard dependency on phonon library
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
X-List-Received-Date: Thu, 20 Aug 2015 08:10:33 -0000

Having disabled phonon by default in Qt4 we need to ensure this
packagegroup is still buildable when it's not available.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
index 02a0326..e09782d 100644
--- a/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
+++ b/meta/recipes-qt/packagegroups/packagegroup-qt-toolchain-target.inc
@@ -11,7 +11,6 @@ RDEPENDS_${PN} += " \
         packagegroup-core-standalone-sdk-target \
         qt4${QTLIBPREFIX}-mkspecs \
         libqt${QTLIBPREFIX}multimedia4-dev \
-        libqt${QTLIBPREFIX}phonon4-dev \
         libqt${QTLIBPREFIX}3support4-dev \
         libqt${QTLIBPREFIX}clucene4-dev \
         libqt${QTLIBPREFIX}core4-dev \
@@ -34,3 +33,7 @@ RDEPENDS_${PN} += " \
         libsqlite3-dev \
         expat-dev \
         "
+
+RRECOMMENDS_${PN} += " \
+        libqt${QTLIBPREFIX}phonon4-dev \
+        "
-- 
2.1.0


