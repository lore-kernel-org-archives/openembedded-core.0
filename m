Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRerq-00041u-3P
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:22 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203820"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:47 -0700
Message-Id: <8d635c284140bcdaa65c4b8622e6512726a5c8c6.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 20/32] qmmp: update to 0.5.1
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:22 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../qt-apps/{qmmp_0.5.0.bb => qmmp_0.5.1.bb}       |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-qt/qt-apps/{qmmp_0.5.0.bb => qmmp_0.5.1.bb} (92%)

diff --git a/meta/recipes-qt/qt-apps/qmmp_0.5.0.bb b/meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
similarity index 92%
rename from meta/recipes-qt/qt-apps/qmmp_0.5.0.bb
rename to meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
index 055bfd5..948c32a 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.5.0.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.5.1.bb
@@ -11,8 +11,9 @@ RDEPENDS_${PN} += "taglib alsa-lib curl"
 
 SRC_URI = "http://qmmp.ylsoftware.com/files/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "e4cce9e0b70230c02263ebcbe958e9c0"
-SRC_URI[sha256sum] = "0fc75012546744657c2cdcea7f30f1be371a9d812811b6901019faa9427f7ba9"
+SRC_URI[md5sum] = "7934c069256bf2fc4ab762ad2683db2f"
+SRC_URI[sha256sum] = "16ab0334f368a5ef14d631a1d43d7cae876ee06b7185643377b5e9cfd6143099"
+
 
 PARALLEL_MAKE = ""
 
-- 
1.7.3.4



