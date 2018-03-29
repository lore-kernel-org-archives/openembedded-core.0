Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B7BBE71ABD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 07:39:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Mar 2018 00:39:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,376,1517904000"; d="scan'208";a="43155283"
Received: from chiron.jf.intel.com ([10.7.159.63])
	by orsmga001.jf.intel.com with ESMTP; 29 Mar 2018 00:39:40 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2018 00:39:24 -0700
Message-Id: <20180329073924.43399-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH] libxml-sax-perl: upgrade 0.99 -> 1.00
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
X-List-Received-Date: Thu, 29 Mar 2018 07:39:39 -0000

Upstream release notes:
1.00  15 Feb 2018  Grant McLean
    - Add makefile dependency to fix order of build steps RT#62289 (patch from
      Ed J)

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 .../perl/{libxml-sax-perl_0.99.bb => libxml-sax-perl_1.00.bb}        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/perl/{libxml-sax-perl_0.99.bb => libxml-sax-perl_1.00.bb} (88%)

diff --git a/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb b/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb
similarity index 88%
rename from meta/recipes-extended/perl/libxml-sax-perl_0.99.bb
rename to meta/recipes-extended/perl/libxml-sax-perl_1.00.bb
index cdcbebffce..141830efe8 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_1.00.bb
@@ -12,14 +12,13 @@ SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 DEPENDS += "libxml-namespacesupport-perl-native"
 RDEPENDS_${PN} += "libxml-namespacesupport-perl libxml-sax-base-perl perl-module-file-temp"
-PR = "r2"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=65c4cd8f39c24c7135ed70dacbcb09e3"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GR/GRANTM/XML-SAX-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "290f5375ae87fdebfdb5bc3854019f24"
-SRC_URI[sha256sum] = "32b04b8e36b6cc4cfc486de2d859d87af5386dd930f2383c49347050d6f5ad84"
+SRC_URI[md5sum] = "861a454f7bf269990ed2c1c125f4db48"
+SRC_URI[sha256sum] = "45ea6564ef8692155d57b2de0862b6442d3c7e29f4a9bc9ede5d7ecdc74c2ae3"
 
 S = "${WORKDIR}/XML-SAX-${PV}"
 
-- 
2.14.3


