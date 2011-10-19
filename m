Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RGMBg-0000Z5-Mu
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 04:47:25 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9J2fXba029077
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 19:41:33 -0700 (PDT)
Received: from localhost (128.224.162.225) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 18 Oct 2011 19:41:33 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Oct 2011 10:42:39 +0800
Message-ID: <a413bf52de3395cffd30c7c305cacbb5fa6e466c.1318991782.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.1.300.gc565c
In-Reply-To: <cover.1318991782.git.kai.kang@windriver.com>
References: <cover.1318991782.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.225]
Subject: [PATCH 3/5] libxml-sax-perl: update to 0.96
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
X-List-Received-Date: Wed, 19 Oct 2011 02:47:25 -0000
Content-Type: text/plain

Update libxml-sax-perl to 0.96

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
1.7.5.1.300.gc565c



