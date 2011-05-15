Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QLQEm-00068T-11
	for openembedded-core@lists.openembedded.org;
	Sun, 15 May 2011 03:35:16 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 14 May 2011 18:32:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,368,1301900400"; 
   d="scan'208";a="1790500"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by fmsmga002.fm.intel.com with ESMTP; 14 May 2011 18:32:21 -0700
Message-Id: <8ad4aa73a6a3d172a4524351cce3d53cb00f8cf4.1305422996.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305422996.git.sgw@linux.intel.com>
References: <cover.1305422996.git.sgw@linux.intel.com>
Old-Date: Fri, 6 May 2011 10:17:59 +0800
Date: Sat, 14 May 2011 18:32:21 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 01/15] libxml-sax-perl: added to create LSB olver test report
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
X-List-Received-Date: Sun, 15 May 2011 01:35:16 -0000

From: Kang Kai <kai.kang@windriver.com>

libxml-sax-perl is need to create LSB olver test report,
so import it and its dependecy libxml-namespacesupport-perl from oe.
Add LICENSE and reset PR.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 .../perl/libxml-namespacesupport-perl_1.11.bb      |   22 ++++++++++++++++
 meta/recipes-extended/perl/libxml-sax-perl_0.96.bb |   26 ++++++++++++++++++++
 2 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
 create mode 100644 meta/recipes-extended/perl/libxml-sax-perl_0.96.bb

diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
new file mode 100644
index 0000000..d96430e
--- /dev/null
+++ b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Perl module for supporting simple generic namespaces"
+DESCRIPTION = "XML::NamespaceSupport offers a simple way to process namespace-based XML names. \
+                It also helps maintain a prefix-to-namespace URI map, and provides a number of \
+                basic checks. "
+
+SECTION = "libs"
+LICENSE = "Artistic|GPLv1+"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://META.yml;beginline=22;endline=22;md5=3b2b564dae8b9af9e8896e85c07dcbe5"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-NamespaceSupport-${PV}.tar.gz"
+SRC_URI[md5sum] = "222cca76161cd956d724286d36b607da"
+SRC_URI[sha256sum] = "6d8151f0a3f102313d76b64bfd1c2d9ed46bfe63a16f038e7d860fda287b74ea"
+
+
+S = "${WORKDIR}/XML-NamespaceSupport-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND="native"
+
diff --git a/meta/recipes-extended/perl/libxml-sax-perl_0.96.bb b/meta/recipes-extended/perl/libxml-sax-perl_0.96.bb
new file mode 100644
index 0000000..13956cb
--- /dev/null
+++ b/meta/recipes-extended/perl/libxml-sax-perl_0.96.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Perl module for using and building Perl SAX2 XML processors" 
+DESCRIPTION = "XML::SAX consists of several framework classes for using and \
+building Perl SAX2 XML parsers, filters, and drivers.  It is designed \ 
+around the need to be able to "plug in" different SAX parsers to an \
+application without requiring programmer intervention.  Those of you \
+familiar with the DBI will be right at home.  Some of the designs \
+come from the Java JAXP specification (SAX part), only without the \
+javaness."
+
+SECTION = "libs"
+LICENSE = "Artistic|GPLv1+"
+DEPENDS += "libxml-namespacesupport-perl-native"
+RDEPENDS_${PN} += "libxml-namespacesupport-perl perl-module-file-temp"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=65c4cd8f39c24c7135ed70dacbcb09e3"
+
+SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GR/GRANTM/XML-SAX-${PV}.tar.gz"
+SRC_URI[md5sum] = "bdcd4119a62505184e211e9dfaef0ab1"
+SRC_URI[sha256sum] = "9bbef613afa42c46df008d537decc5a61df7e92d65463f3c900769f39e5c8e08"
+
+S = "${WORKDIR}/XML-SAX-${PV}"
+
+inherit cpan
+
+BBCLASSEXTEND = "native"
-- 
1.7.1.1



