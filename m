Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id 78CBB7E870
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2019 22:12:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jun 2019 15:12:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,386,1557212400"; d="scan'208";a="185891263"
Received: from chiron.jf.intel.com ([10.54.74.38])
	by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2019 15:12:05 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jun 2019 15:11:41 -0700
Message-Id: <4257db7fa68b94728d4e6be8db38bca75dfd51d6.1560809373.git.timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1560809373.git.timothy.t.orling@linux.intel.com>
References: <cover.1560809373.git.timothy.t.orling@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] libxml-sax-perl: upgrade 1.00 -> 1.02
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
X-List-Received-Date: Mon, 17 Jun 2019 22:12:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* Sort ptest dependencies alphabetically

Upstream release notes:

1.02  14 Jun 2019  Grant McLean
    - Spelling fixes (patch from Ville Skyttä)
    - Add repo location to metadata (patches from Ville Skyttä & Martin McGrath)
    - Reorganise module files under lib/XML
    - Regenerate MANIFEST using 'make manifest' to include missing test files

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 ...xml-sax-perl_1.00.bb => libxml-sax-perl_1.02.bb} | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/perl/{libxml-sax-perl_1.00.bb => libxml-sax-perl_1.02.bb} (79%)

diff --git a/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb b/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
similarity index 79%
rename from meta/recipes-extended/perl/libxml-sax-perl_1.00.bb
rename to meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
index 80a1c8e39b3..02ee34ee17e 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_1.02.bb
@@ -17,8 +17,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=65c4cd8f39c24c7135ed70dacbcb09e3"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GR/GRANTM/XML-SAX-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "861a454f7bf269990ed2c1c125f4db48"
-SRC_URI[sha256sum] = "45ea6564ef8692155d57b2de0862b6442d3c7e29f4a9bc9ede5d7ecdc74c2ae3"
+SRC_URI[md5sum] = "b62e3754523695c7f5bbcafa3676a38d"
+SRC_URI[sha256sum] = "4506c387043aa6a77b455f00f57409f3720aa7e553495ab2535263b4ed1ea12a"
 
 S = "${WORKDIR}/XML-SAX-${PV}"
 
@@ -30,6 +30,13 @@ do_install_ptest() {
 }
 
 RDEPENDS_${PN} += "perl-module-encode perl-module-perlio"
-RDEPENDS_${PN}-ptest += "perl-module-test perl-module-base perl-module-fatal perl-module-encode-unicode perl-module-encode-byte"
+
+RDEPENDS_${PN}-ptest += " \
+    perl-module-base  \
+    perl-module-encode-byte \
+    perl-module-encode-unicode \
+    perl-module-fatal \
+    perl-module-test \
+"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


