Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UV47f-0004Xt-Gt
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 20:08:52 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 24 Apr 2013 10:50:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,545,1363158000"; d="scan'208";a="231632495"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.249])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Apr 2013 10:50:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 18:48:48 +0100
Message-Id: <f79d474c436e9b13e8d9dba6385b8de5cb1f4a86.1366825663.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 11/21] libxml-simple-perl: add SUMMARY, DESCRIPTION and HOMEPAGE
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
X-List-Received-Date: Wed, 24 Apr 2013 18:09:00 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
index 6434ff7..31294ea 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
@@ -1,3 +1,10 @@
+SUMMARY = "Perl module for reading and writing XML"
+DESCRIPTION = "The XML::Simple Perl module provides a simple API layer \
+on top of an underlying XML parsing module to maintain XML files \
+(especially configuration files). It is a blunt rewrite of XML::Simple \
+(by Grant McLean) to use the XML::LibXML parser for XML structures, \
+where the original uses plain Perl or SAX parsers."
+HOMEPAGE = "http://search.cpan.org/~markov/XML-LibXML-Simple-0.93/lib/XML/LibXML/Simple.pod"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e7dbb3e2241fac8457967053fc1a1ddb"
-- 
1.7.10.4



