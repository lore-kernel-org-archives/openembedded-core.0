Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 868C4731BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:55:48 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 19 Jan 2016 13:55:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,319,1449561600"; d="scan'208";a="32546163"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.intel.com)
	([10.23.219.47])
	by fmsmga004.fm.intel.com with ESMTP; 19 Jan 2016 13:55:40 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jan 2016 21:56:28 +0000
Message-Id: <464df82b2db7df048ad9d9e6b2bea6841023bbf9.1453239938.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <cbf1df80ebfa0611333ac37e9adf4c7c28db6338.1453239938.git.alejandro.hernandez@linux.intel.com>
References: <cbf1df80ebfa0611333ac37e9adf4c7c28db6338.1453239938.git.alejandro.hernandez@linux.intel.com>
In-Reply-To: <cover.1453239938.git.alejandro.hernandez@linux.intel.com>
References: <cover.1453239938.git.alejandro.hernandez@linux.intel.com>
Subject: [PATCH 5/9] python-nose: upgrade to 1.3.7
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
X-List-Received-Date: Tue, 19 Jan 2016 21:55:49 -0000

Updates runtime dependencies, python-nose now depends on unittest.

Signed-off-by: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
---
 .../python/{python-nose_1.3.6.bb => python-nose_1.3.7.bb}         | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python-nose_1.3.6.bb => python-nose_1.3.7.bb} (75%)

diff --git a/meta/recipes-devtools/python/python-nose_1.3.6.bb b/meta/recipes-devtools/python/python-nose_1.3.7.bb
similarity index 75%
rename from meta/recipes-devtools/python/python-nose_1.3.6.bb
rename to meta/recipes-devtools/python/python-nose_1.3.7.bb
index d9daea2..ec6158f 100644
--- a/meta/recipes-devtools/python/python-nose_1.3.6.bb
+++ b/meta/recipes-devtools/python/python-nose_1.3.7.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://lgpl.txt;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
 SRC_URI = "http://pypi.python.org/packages/source/n/nose/nose-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "0ca546d81ca8309080fc80cb389e7a16"
-SRC_URI[sha256sum] = "f61e0909a743eed37b1207e38a8e7b4a2fe0a82185e36f2be252ef1b3f901758"
+SRC_URI[md5sum] = "4d3ad0ff07b61373d2cefc89c5d0b20b"
+SRC_URI[sha256sum] = "f1bffef9cbc82628f6e7d7b40d7e255aefaa1adb6a1b1d26c69a8b79e6208a98"
 
 UPSTREAM_CHECK_URI = "https://pypi.python.org/pypi/nose/"
 UPSTREAM_CHECK_REGEX = "/nose/(?P<pver>(\d+[\.\-_]*)+)"
@@ -17,4 +17,8 @@ S = "${WORKDIR}/nose-${PV}"
 
 inherit setuptools
 
+RDEPENDS_${PN} = "\
+  python-unittest \
+  "
+
 BBCLASSEXTEND = "native nativesdk"
-- 
1.8.4.5


