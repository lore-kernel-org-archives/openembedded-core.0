Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RGnUt-0002nx-R8
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 09:57:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Oct 2011 00:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="64982217"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2011 00:51:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 00:50:51 -0700
Message-Id: <81adbcd266912e731ba1625f424cac783f9cb9bd.1319096633.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL - v2 15/26] libxml-sax-perl: update to 0.99
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
X-List-Received-Date: Thu, 20 Oct 2011 07:57:04 -0000

From: Kang Kai <kai.kang@windriver.com>

Update libxml-sax-perl to 0.99

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 ...ml-sax-perl_0.96.bb => libxml-sax-perl_0.99.bb} |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/perl/{libxml-sax-perl_0.96.bb => libxml-sax-perl_0.99.bb} (85%)

diff --git a/meta/recipes-extended/perl/libxml-sax-perl_0.96.bb b/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb
similarity index 85%
rename from meta/recipes-extended/perl/libxml-sax-perl_0.96.bb
rename to meta/recipes-extended/perl/libxml-sax-perl_0.99.bb
index 97d2025..ee9ac30 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_0.96.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb
@@ -11,13 +11,14 @@ SECTION = "libs"
 LICENSE = "Artistic|GPLv1+"
 DEPENDS += "libxml-namespacesupport-perl-native"
 RDEPENDS_${PN} += "libxml-namespacesupport-perl perl-module-file-temp"
-PR = "r1"
+PR = "r0"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=65c4cd8f39c24c7135ed70dacbcb09e3"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GR/GRANTM/XML-SAX-${PV}.tar.gz"
-SRC_URI[md5sum] = "bdcd4119a62505184e211e9dfaef0ab1"
-SRC_URI[sha256sum] = "9bbef613afa42c46df008d537decc5a61df7e92d65463f3c900769f39e5c8e08"
+
+SRC_URI[md5sum] = "290f5375ae87fdebfdb5bc3854019f24"
+SRC_URI[sha256sum] = "32b04b8e36b6cc4cfc486de2d859d87af5386dd930f2383c49347050d6f5ad84"
 
 S = "${WORKDIR}/XML-SAX-${PV}"
 
-- 
1.7.6.2



