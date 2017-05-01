Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 45DE66011A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 May 2017 18:08:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 May 2017 11:08:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,401,1488873600"; d="scan'208";a="851733797"
Received: from jmadams-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.254.179.75])
	by FMSMGA003.fm.intel.com with ESMTP; 01 May 2017 11:08:10 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 May 2017 13:08:06 -0500
Message-Id: <1493662087-12167-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH 1/2] libxml-sax-base-perl: upgrade to 1.09
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
X-List-Received-Date: Mon, 01 May 2017 18:08:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../{libxml-sax-base-perl_1.08.bb => libxml-sax-base-perl_1.09.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/perl/{libxml-sax-base-perl_1.08.bb => libxml-sax-base-perl_1.09.bb} (83%)

diff --git a/meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
similarity index 83%
rename from meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb
rename to meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
index 14a3370..f92c107 100644
--- a/meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb
+++ b/meta/recipes-extended/perl/libxml-sax-base-perl_1.09.bb
@@ -13,8 +13,8 @@ LIC_FILES_CHKSUM = "file://dist.ini;endline=5;md5=8f9c9a55340aefaee6e9704c884664
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GR/GRANTM/XML-SAX-Base-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "38c8c3247dfd080712596118d70dbe32"
-SRC_URI[sha256sum] = "666270318b15f88b8427e585198abbc19bc2e6ccb36dc4c0a4f2d9807330219e"
+SRC_URI[md5sum] = "ec347a14065dd7aec7d9fb181b2d7946"
+SRC_URI[sha256sum] = "66cb355ba4ef47c10ca738bd35999723644386ac853abbeb5132841f5e8a2ad0"
 
 S = "${WORKDIR}/XML-SAX-Base-${PV}"
 
-- 
2.1.4


