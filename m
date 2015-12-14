Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6DCF47317D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:08:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 14 Dec 2015 07:08:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="707064144"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 14 Dec 2015 07:08:09 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 17:05:19 +0200
Message-Id: <b5f9ecf16e492f8a1fcd24d46adaffe436de725b.1450104283.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
References: <cover.1450104283.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/20] libxml-simple-perl: update to 2.22
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
X-List-Received-Date: Mon, 14 Dec 2015 15:08:08 -0000

LICENSE checksum changed because of copyright year change in the text.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../perl/{libxml-simple-perl_2.20.bb => libxml-simple-perl_2.22.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/perl/{libxml-simple-perl_2.20.bb => libxml-simple-perl_2.22.bb} (78%)

diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.22.bb
similarity index 78%
rename from meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
rename to meta/recipes-devtools/perl/libxml-simple-perl_2.22.bb
index 4721b4b..2243bb2 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.22.bb
@@ -7,13 +7,13 @@ where the original uses plain Perl or SAX parsers."
 HOMEPAGE = "http://search.cpan.org/~markov/XML-LibXML-Simple-0.93/lib/XML/LibXML/Simple.pod"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e7dbb3e2241fac8457967053fc1a1ddb"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fa1187fceda00eee10b62961407ea7be"
 DEPENDS += "libxml-parser-perl"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Simple-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "4d10964e123b76eca36678464daa63cd"
-SRC_URI[sha256sum] = "5cff13d0802792da1eb45895ce1be461903d98ec97c9c953bc8406af7294434a"
+SRC_URI[md5sum] = "0914abddfce749453ed89b54029f2643"
+SRC_URI[sha256sum] = "b9450ef22ea9644ae5d6ada086dc4300fa105be050a2030ebd4efd28c198eb49"
 
 S = "${WORKDIR}/XML-Simple-${PV}"
 
-- 
2.6.2


