Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1TgCbA-00066N-EV
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 11:53:04 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Dec 2012 02:37:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,221,1355126400"; d="scan'208";a="176405277"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Dec 2012 02:37:33 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Dec 2012 12:40:37 +0200
Message-Id: <1354704037-10299-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Constantin Musca <constantinx.musca@intel.com>
Subject: [PATCH] libconvert-asn1-perl: upgrade to 0.26
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
X-List-Received-Date: Wed, 05 Dec 2012 10:53:04 -0000

From: Constantin Musca <constantinx.musca@intel.com>

License md5sum change due to:
- README is removed
- README.md contains license info

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 ...{libconvert-asn1-perl_0.22.bb => libconvert-asn1-perl_0.26.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.22.bb => libconvert-asn1-perl_0.26.bb} (60%)

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
similarity index 60%
rename from meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb
rename to meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
index dc950f1..f6937ec 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "Convert::ASN1 - ASN.1 Encode/Decode library"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://README;beginline=10;endline=12;md5=a64b291b13ffddeef33b14f047ee8b26"
-PR = "r3"
+LIC_FILES_CHKSUM = "file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8e8e0d3d23e096a63f"
+PR = "r0"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "64a555e44adc79d92072b9fc7a6779c4"
-SRC_URI[sha256sum] = "be63d5cc715d7306e54b41d3c68c3617ca306289cff619a2ca43505e35f2f6ee"
+SRC_URI[md5sum] = "1c846c8c1125e6a075444abe65d99b63"
+SRC_URI[sha256sum] = "5db8b62fa0d036bd0cabc869ffe17941ad587d9a2af1ff030d554872adbc1ca1"
 
 S = "${WORKDIR}/Convert-ASN1-${PV}"
 
-- 
1.7.11.7



