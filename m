Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1UGCdl-0003Yd-Ny
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Mar 2013 19:12:34 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Mar 2013 10:55:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,845,1355126400"; d="scan'208";a="214773887"
Received: from unknown (HELO dell-desktop.rb.intel.com) ([10.237.105.59])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Mar 2013 10:55:40 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Mar 2013 19:55:09 +0200
Message-Id: <0fd95799d127599f0d4b617dfe6e133f3aa3e0dd.1363283478.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
In-Reply-To: <cover.1363283478.git.radu.moisan@intel.com>
References: <cover.1363283478.git.radu.moisan@intel.com>
Subject: [PATCH 10/17] hdparm: Upgrade to v9.43
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Mar 2013 18:12:35 -0000

Signed-off-by: Radu Moisan <radu.moisan@intel.com>
---
 .../hdparm/{hdparm_9.39.bb => hdparm_9.43.bb}      |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/hdparm/{hdparm_9.39.bb => hdparm_9.43.bb} (87%)

diff --git a/meta/recipes-extended/hdparm/hdparm_9.39.bb b/meta/recipes-extended/hdparm/hdparm_9.43.bb
similarity index 87%
rename from meta/recipes-extended/hdparm/hdparm_9.39.bb
rename to meta/recipes-extended/hdparm/hdparm_9.43.bb
index 1dfc57f..0371477 100644
--- a/meta/recipes-extended/hdparm/hdparm_9.39.bb
+++ b/meta/recipes-extended/hdparm/hdparm_9.43.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=910a8a42c962d238619c75fdb78bdb24 \
                     file://wiper/GPLv2.txt;md5=fcb02dc552a041dee27e4b85c7396067 \
                     file://wiper/wiper.sh;beginline=7;endline=31;md5=b7bc642addc152ea307505bf1a296f09"
 
-PR = "r3"
+PR = "r0"
 
 PACKAGES += "wiper"
 
@@ -18,8 +18,8 @@ RDEPENDS_wiper = "bash gawk stat"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/hdparm/hdparm-${PV}.tar.gz "
 
-SRC_URI[md5sum] = "2bc17b72403885d4faf959682944243b"
-SRC_URI[sha256sum] = "72d550af4526aa96f0841c79321a0ee39d636cbaf1f294e52193e90c054b3cea"
+SRC_URI[md5sum] = "f73233be118d86c779a8463d8b6a3cdb"
+SRC_URI[sha256sum] = "2bbe92274971182192901ab220e94bd2e4896f924fa6b225d0cffd7d8c16b52a"
 
 EXTRA_OEMAKE += 'STRIP="echo"'
 
-- 
1.7.9.5



