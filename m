Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1UB4QO-0000s7-Ei
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 15:25:32 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Feb 2013 06:07:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,755,1355126400"; d="scan'208";a="269071175"
Received: from bogdanm (HELO localhost.localdomain) ([10.237.105.166])
	by orsmga001.jf.intel.com with ESMTP; 28 Feb 2013 06:09:07 -0800
From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Feb 2013 16:12:30 +0200
Message-Id: <1362060750-23828-1-git-send-email-bogdan.a.marinescu@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] libtimedate-perl: updated to 2.30
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
X-List-Received-Date: Thu, 28 Feb 2013 14:25:33 -0000

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../perl/{libtimedate-perl_1.20.bb => libtimedate-perl_2.30.bb}  |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/perl/{libtimedate-perl_1.20.bb => libtimedate-perl_2.30.bb} (79%)

diff --git a/meta/recipes-extended/perl/libtimedate-perl_1.20.bb b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
similarity index 79%
rename from meta/recipes-extended/perl/libtimedate-perl_1.20.bb
rename to meta/recipes-extended/perl/libtimedate-perl_2.30.bb
index 780f774..e2aa86b 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_1.20.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
@@ -3,7 +3,7 @@ SECTION = "libs"
 # You can redistribute it and/or modify it under the same terms as Perl itself.
 LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://README;beginline=21;md5=576b7cb41e5e821501a01ed66f0f9d9e"
-PR = "r4"
+PR = "r0"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/TimeDate-${PV}.tar.gz"
 
@@ -16,5 +16,5 @@ BBCLASSEXTEND = "native"
 RDEPENDS_${PN}_class-native = ""
 RDEPENDS_${PN} += "perl-module-carp perl-module-exporter perl-module-strict perl-module-time-local"
 
-SRC_URI[md5sum] = "7da7452bce4c684e4238e6d09b390200"
-SRC_URI[sha256sum] = "f8251a791f6692c69952b4af697c01df93981ad1ab133279d034656a03cd3755"
+SRC_URI[md5sum] = "b1d91153ac971347aee84292ed886c1c"
+SRC_URI[sha256sum] = "75bd254871cb5853a6aa0403ac0be270cdd75c9d1b6639f18ecba63c15298e86"
-- 
1.7.10.4



