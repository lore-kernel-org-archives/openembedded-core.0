Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QDWO1-0005Bj-Ha
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Apr 2011 08:32:09 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2011 23:29:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,257,1301900400"; d="scan'208";a="737332130"
Received: from unknown (HELO localhost) ([10.255.12.237])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2011 23:29:22 -0700
Message-Id: <3724d1e1f5377e86b1e3cc68f5c1999d17f4d458.1303539961.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303539961.git.sgw@linux.intel.com>
References: <cover.1303539961.git.sgw@linux.intel.com>
Old-Date: Fri, 8 Apr 2011 02:24:13 -0700
Date: Fri, 22 Apr 2011 23:29:22 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Sat, 23 Apr 2011 08:41:36 +0200
Cc: Koen Kooi <koen@dominion.thruhere.net>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 28/37] libxml-parser-perl: upgrade from 2.36 to 2.40
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
X-List-Received-Date: Sat, 23 Apr 2011 06:32:09 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

---
 ...e_2.36.bb => libxml-parser-perl-native_2.40.bb} |    0
 ...ser-perl_2.36.bb => libxml-parser-perl_2.40.bb} |    8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/perl/{libxml-parser-perl-native_2.36.bb => libxml-parser-perl-native_2.40.bb} (100%)
 rename meta/recipes-devtools/perl/{libxml-parser-perl_2.36.bb => libxml-parser-perl_2.40.bb} (61%)

diff --git a/meta/recipes-devtools/perl/libxml-parser-perl-native_2.36.bb b/meta/recipes-devtools/perl/libxml-parser-perl-native_2.40.bb
similarity index 100%
rename from meta/recipes-devtools/perl/libxml-parser-perl-native_2.36.bb
rename to meta/recipes-devtools/perl/libxml-parser-perl-native_2.40.bb
diff --git a/meta/recipes-devtools/perl/libxml-parser-perl_2.36.bb b/meta/recipes-devtools/perl/libxml-parser-perl_2.40.bb
similarity index 61%
rename from meta/recipes-devtools/perl/libxml-parser-perl_2.36.bb
rename to meta/recipes-devtools/perl/libxml-parser-perl_2.40.bb
index 3287d26..c2d1bdb 100644
--- a/meta/recipes-devtools/perl/libxml-parser-perl_2.36.bb
+++ b/meta/recipes-devtools/perl/libxml-parser-perl_2.40.bb
@@ -1,14 +1,14 @@
 SECTION = "libs"
 LICENSE = "Artistic"
-LIC_FILES_CHKSUM = "file://README;endline=6;md5=fa7bbbd54d37d6ecf4ef33b7c98b9cd7"
+LIC_FILES_CHKSUM = "file://README;beginline=2;endline=6;md5=c8767d7516229f07b26e42d1cf8b51f1"
 DEPENDS += "expat expat-native"
 
-PR = "r1"
+PR = "r0"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV}.tar.gz"
 
-SRC_URI[md5sum] = "1b868962b658bd87e1563ecd56498ded"
-SRC_URI[sha256sum] = "9fd529867402456bd826fe0e5588d35b3a2e27e586a2fd838d1352b71c2ed73f"
+SRC_URI[md5sum] = "c66e9adba003d0667cc40115ccd837a5"
+SRC_URI[sha256sum] = "e5e433684e799ef7b6b852c0ca31b71054717628555444d3dc9fceac0df71512"
 
 S = "${WORKDIR}/XML-Parser-${PV}"
 
-- 
1.7.1.1



