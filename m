Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 14291779F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 22:29:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Aug 2017 15:29:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,379,1498546800"; d="scan'208";a="123971470"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.142])
	by orsmga002.jf.intel.com with ESMTP; 15 Aug 2017 15:29:02 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 17:30:13 -0500
Message-Id: <20170815223013.32757-1-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] liburi-perl: Upgrade to 1.72
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
X-List-Received-Date: Tue, 15 Aug 2017 22:29:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../perl/{liburi-perl_1.71.bb => liburi-perl_1.72.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_1.71.bb => liburi-perl_1.72.bb} (85%)

diff --git a/meta/recipes-devtools/perl/liburi-perl_1.71.bb b/meta/recipes-devtools/perl/liburi-perl_1.72.bb
similarity index 85%
rename from meta/recipes-devtools/perl/liburi-perl_1.71.bb
rename to meta/recipes-devtools/perl/liburi-perl_1.72.bb
index a800198b331..a399c10b5ca 100644
--- a/meta/recipes-devtools/perl/liburi-perl_1.71.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_1.72.bb
@@ -13,8 +13,8 @@ DEPENDS += "perl"
 
 SRC_URI = "http://www.cpan.org/authors/id/E/ET/ETHER/URI-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "247c3da29a794f72730e01aa5a715daf"
-SRC_URI[sha256sum] = "9c8eca0d7f39e74bbc14706293e653b699238eeb1a7690cc9c136fb8c2644115"
+SRC_URI[md5sum] = "cd56d81ed429efaa97e7f3ff08851b48"
+SRC_URI[sha256sum] = "35f14431d4b300de4be1163b0b5332de2d7fbda4f05ff1ed198a8e9330d40a32"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.11.0


