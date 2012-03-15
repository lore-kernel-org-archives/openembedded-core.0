Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S8GHV-00032W-8X
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 20:24:13 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Mar 2012 12:15:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="121397450"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.152])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2012 12:15:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Mar 2012 12:15:13 -0700
Message-Id: <aecc9a8ac625a48792f91afbb40def08e3a06991.1331837170.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1331837170.git.sgw@linux.intel.com>
References: <cover.1331837170.git.sgw@linux.intel.com>
In-Reply-To: <cover.1331837170.git.sgw@linux.intel.com>
References: <cover.1331837170.git.sgw@linux.intel.com>
Subject: [PATCH 01/11] bitbake.conf: Modify PACKAGE list ordering to insert -staticdev file before PN
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
X-List-Received-Date: Thu, 15 Mar 2012 19:24:13 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/bitbake.conf |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 216da75..d4357d1 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -253,7 +253,7 @@ SOLIBSDEV_darwin = ".dylib"
 SOLIBSDEV_darwin8 = ".dylib"
 SOLIBSDEV_darwin9 = ".dylib"
 
-PACKAGES = "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-locale"
+PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN} ${PN}-doc ${PN}-dev ${PN}-locale"
 PACKAGES_DYNAMIC = "${PN}-locale-*"
 FILES = ""
 
@@ -277,7 +277,7 @@ SECTION_${PN}-dev = "devel"
 ALLOW_EMPTY_${PN}-dev = "1"
 RDEPENDS_${PN}-dev = "${PN} (= ${EXTENDPKGV})"
 
-FILES_${PN}-staticdev = "${libdir}/*.a ${base_libdir}/*.a"
+FILES_${PN}-staticdev = "${libdir}/*.a ${base_libdir}/*.a ${libdir}/${BPN}/*.a"
 SECTION_${PN}-staticdev = "devel"
 RDEPENDS_${PN}-staticdev = "${PN}-dev (= ${EXTENDPKGV})"
 
-- 
1.7.7.6



