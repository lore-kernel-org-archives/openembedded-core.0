Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 725AE78873
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 08:17:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Mar 2018 01:17:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,349,1517904000"; d="scan'208";a="44641309"
Received: from chiron.jf.intel.com ([10.7.159.63])
	by orsmga002.jf.intel.com with ESMTP; 23 Mar 2018 01:17:28 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2018 01:17:22 -0700
Message-Id: <20180323081723.65091-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.14.3
Subject: [PATCH 1/2] libxml-simple-perl: upgrade 2.24 -> 2.25
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
X-List-Received-Date: Fri, 23 Mar 2018 08:17:28 -0000

* Fix RDEPENDS

Upstream release notes:
2.25      2018-03-18 16:18:24+13:00 Pacific/Auckland
  - disable entity expansion when using XML::Parser, for more secure default
    behaviour (patch from Ray Morris)
  - call to XML::Parser constructor is now in its own method to ease overriding

License-Update: update year to 2018
---
 ...l-simple-perl_2.24.bb => libxml-simple-perl_2.25.bb} | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/perl/{libxml-simple-perl_2.24.bb => libxml-simple-perl_2.25.bb} (65%)

diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.24.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
similarity index 65%
rename from meta/recipes-devtools/perl/libxml-simple-perl_2.24.bb
rename to meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
index f9d00d2e28..53788d5585 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.24.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.25.bb
@@ -7,13 +7,13 @@ where the original uses plain Perl or SAX parsers."
 HOMEPAGE = "http://search.cpan.org/~markov/XML-LibXML-Simple-0.93/lib/XML/LibXML/Simple.pod"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=23477e18a0d04392cdf44ae70e49b495"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cf206df8c9fe775f1d4c484386491eac"
 DEPENDS += "libxml-parser-perl"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Simple-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1cd2e8e3421160c42277523d5b2f4dd2"
-SRC_URI[sha256sum] = "9a14819fd17c75fbb90adcec0446ceab356cab0ccaff870f2e1659205dc2424f"
+SRC_URI[md5sum] = "bb841dce889a26c89a1c2739970e9fbc"
+SRC_URI[sha256sum] = "531fddaebea2416743eb5c4fdfab028f502123d9a220405a4100e68fc480dbf8"
 
 S = "${WORKDIR}/XML-Simple-${PV}"
 
@@ -21,4 +21,15 @@ EXTRA_PERLFLAGS = "-I ${PERLHOSTLIB}"
 
 inherit cpan ptest-perl
 
+RDEPENDS_${PN} += " \
+    libxml-namespacesupport-perl \
+    libxml-parser-perl \
+    libxml-sax-perl \
+"
+
+RDEPENDS_${PN}-ptest += " \
+    perl-module-file-temp \
+    perl-module-test-more \
+"
+
 BBCLASSEXTEND = "native"
-- 
2.14.3


