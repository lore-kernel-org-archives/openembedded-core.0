Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 202DD73CA4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 00:56:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t2U0uiLN022518
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Mar 2015 17:56:44 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.139) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Sun, 29 Mar 2015 17:56:43 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Mar 2015 08:56:42 +0800
Message-ID: <1427677002-12772-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Subject: [PATCH] libxml-simple-perl/libconvert-asn1-perl: using PERLHOSTLIB
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
X-List-Received-Date: Mon, 30 Mar 2015 00:56:45 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Using PERLHOSTLIB as possible, which is same as
${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb   | 2 +-
 meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb b/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
index b72afc0..4721b4b 100644
--- a/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
+++ b/meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "5cff13d0802792da1eb45895ce1be461903d98ec97c9c953bc8406af72
 
 S = "${WORKDIR}/XML-Simple-${PV}"
 
-EXTRA_PERLFLAGS = "-I ${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}"
+EXTRA_PERLFLAGS = "-I ${PERLHOSTLIB}"
 
 inherit cpan
 
diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb b/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
index ebe0422..170e7ec 100644
--- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
+++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb
@@ -12,6 +12,6 @@ S = "${WORKDIR}/Convert-ASN1-${PV}"
 
 inherit cpan
 
-EXTRA_PERLFLAGS = "-I ${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}"
+EXTRA_PERLFLAGS = "-I ${PERLHOSTLIB}"
 
 BBCLASSEXTEND = "native"
-- 
2.1.0


