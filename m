Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q7wve-0008N1-K4
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 23:39:50 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Apr 2011 14:37:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,319,1299484800"; d="scan'208";a="415676226"
Received: from unknown (HELO localhost) ([10.255.12.228])
	by azsmga001.ch.intel.com with ESMTP; 07 Apr 2011 14:37:36 -0700
Message-Id: <b2bc3a1833a25a6adb6b8412fd083fa6d11ab416.1302211549.git.sgw@linux.intel.com>
In-Reply-To: <cover.1302211549.git.sgw@linux.intel.com>
References: <cover.1302211549.git.sgw@linux.intel.com>
Old-Date: Wed, 6 Apr 2011 17:55:38 -0700
Date: Thu, 07 Apr 2011 14:37:35 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH 03/11] qmmp: update to version .4.3
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
X-List-Received-Date: Thu, 07 Apr 2011 21:39:50 -0000

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../qt-apps/{qmmp_0.4.3.bb => qmmp_0.5.0.bb}       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-qt/qt-apps/{qmmp_0.4.3.bb => qmmp_0.5.0.bb} (92%)

diff --git a/meta/recipes-qt/qt-apps/qmmp_0.4.3.bb b/meta/recipes-qt/qt-apps/qmmp_0.5.0.bb
similarity index 92%
rename from meta/recipes-qt/qt-apps/qmmp_0.4.3.bb
rename to meta/recipes-qt/qt-apps/qmmp_0.5.0.bb
index ea70312..055bfd5 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.4.3.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.5.0.bb
@@ -11,8 +11,8 @@ RDEPENDS_${PN} += "taglib alsa-lib curl"
 
 SRC_URI = "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "b79ce55ed8aca31a29360ff828ce1881"
-SRC_URI[sha256sum] = "a75c2c676515182ecfbe811cba29ba4ca736912e52fde283db4d03eb116457a4"
+SRC_URI[md5sum] = "e4cce9e0b70230c02263ebcbe958e9c0"
+SRC_URI[sha256sum] = "0fc75012546744657c2cdcea7f30f1be371a9d812811b6901019faa9427f7ba9"
 
 PARALLEL_MAKE = ""
 
-- 
1.7.1



