Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1SwCmj-0004Ka-Uy
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 15:46:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 Jul 2012 06:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="200444344"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.62])
	by fmsmga002.fm.intel.com with ESMTP; 31 Jul 2012 06:35:14 -0700
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 16:37:28 +0300
Message-Id: <1343741848-7753-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] libconvert-asn1-perl: updated to 0.26
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
X-List-Received-Date: Tue, 31 Jul 2012 13:46:54 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 ...1-perl_0.22.bb => libconvert-asn1-perl_0.26.bb} |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.22.bb => libconvert-asn1-perl_0.26.bb} (60%)

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
similarity index 60%
rename from meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb
rename to meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
index dc950f1..d3a1fd6 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.22.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
@@ -1,13 +1,12 @@
 DESCRIPTION = "Convert::ASN1 - ASN.1 Encode/Decode library"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://README;beginline=10;endline=12;md5=a64b291b13ffddeef33b14f047ee8b26"
-PR = "r3"
+LIC_FILES_CHKSUM = "file://README.md;beginline=93;endline=96;md5=223dc4bd67e994f3c371158686e19c19"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "64a555e44adc79d92072b9fc7a6779c4"
-SRC_URI[sha256sum] = "be63d5cc715d7306e54b41d3c68c3617ca306289cff619a2ca43505e35f2f6ee"
+SRC_URI[md5sum] = "1c846c8c1125e6a075444abe65d99b63"
+SRC_URI[sha256sum] = "5db8b62fa0d036bd0cabc869ffe17941ad587d9a2af1ff030d554872adbc1ca1"
 
 S = "${WORKDIR}/Convert-ASN1-${PV}"
 
-- 
1.7.9.5



