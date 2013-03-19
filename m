Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1UHnHH-0004b7-4Y
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 04:31:55 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2J26KHx016013
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2013 19:06:20 -0700 (PDT)
Received: from jesse-wrs-desktop.wrs.com (128.224.162.230) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 18 Mar 2013 19:06:19 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Mar 2013 10:07:01 +0800
Message-ID: <1363658821-23679-2-git-send-email-sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1363658821-23679-1-git-send-email-sen.zhang@windriver.com>
References: <1363658821-23679-1-git-send-email-sen.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] Perl packages shouldn't be allarch
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
X-List-Received-Date: Tue, 19 Mar 2013 03:31:55 -0000
Content-Type: text/plain

Perl packages should know about arch so that they could install to the
correct libdir. Or else they always install to the default libdir in
multilib builds.

Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
---
 meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb         | 2 +-
 meta/recipes-extended/perl/libtimedate-perl_2.30.bb             | 2 +-
 meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb | 2 +-
 meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb         | 2 +-
 meta/recipes-extended/perl/libxml-sax-perl_0.99.bb              | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
index f6937ec..cd3141a 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.26.bb
@@ -11,7 +11,7 @@ SRC_URI[sha256sum] = "5db8b62fa0d036bd0cabc869ffe17941ad587d9a2af1ff030d554872ad
 
 S = "${WORKDIR}/Convert-ASN1-${PV}"
 
-inherit cpan allarch
+inherit cpan
 
 EXTRA_PERLFLAGS = "-I ${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}"
 
diff --git a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
index e2aa86b..80595af 100644
--- a/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
+++ b/meta/recipes-extended/perl/libtimedate-perl_2.30.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/TimeDate-${PV}.tar.
 
 S = "${WORKDIR}/TimeDate-${PV}"
 
-inherit cpan allarch
+inherit cpan
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
index 9284403..9a9e710 100644
--- a/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
+++ b/meta/recipes-extended/perl/libxml-namespacesupport-perl_1.11.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "6d8151f0a3f102313d76b64bfd1c2d9ed46bfe63a16f038e7d860fda28
 
 S = "${WORKDIR}/XML-NamespaceSupport-${PV}"
 
-inherit cpan allarch
+inherit cpan
 
 BBCLASSEXTEND="native"
 
diff --git a/meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb b/meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb
index d7389a0..3242f7b 100644
--- a/meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb
+++ b/meta/recipes-extended/perl/libxml-sax-base-perl_1.08.bb
@@ -19,6 +19,6 @@ SRC_URI[sha256sum] = "666270318b15f88b8427e585198abbc19bc2e6ccb36dc4c0a4f2d98073
 
 S = "${WORKDIR}/XML-SAX-Base-${PV}"
 
-inherit cpan allarch
+inherit cpan
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb b/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb
index 647cb77..e2e0341 100644
--- a/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb
+++ b/meta/recipes-extended/perl/libxml-sax-perl_0.99.bb
@@ -22,6 +22,6 @@ SRC_URI[sha256sum] = "32b04b8e36b6cc4cfc486de2d859d87af5386dd930f2383c49347050d6
 
 S = "${WORKDIR}/XML-SAX-${PV}"
 
-inherit cpan allarch
+inherit cpan
 
 BBCLASSEXTEND = "native"
-- 
1.7.11.7



