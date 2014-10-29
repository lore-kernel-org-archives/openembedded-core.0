Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B1FD86E633
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 07:11:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9T7BtKj022699
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Oct 2014 00:11:55 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 29 Oct 2014 00:11:55 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Oct 2014 15:08:44 +0800
Message-ID: <ba7a4bc229dc090e4b8242ca3f784c15a1656518.1414566472.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1414566472.git.Chong.Lu@windriver.com>
References: <cover.1414566472.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] docbook-xsl-stylesheets: add perl to RDEPENDS
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
X-List-Received-Date: Wed, 29 Oct 2014 07:11:57 -0000
Content-Type: text/plain

This solves the following warning:

docbook-xsl-stylesheets-1.78.1: docbook-xsl-stylesheets requires /usr/bin/perl,
/bin/bash, but no providers in its RDEPENDS [file-rdeps]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
index 39528c8..b546043 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.78.1.bb
@@ -36,6 +36,7 @@ do_install () {
 		roundtrip slides template tests tools webhelp website \
 		xhtml xhtml-1_1 catalog.xml \
 	${D}${datadir}/xml/docbook/xsl-stylesheets-1.78.1
+	sed -e "s|bash|sh|g" -i ${D}${datadir}/xml/docbook/xsl-stylesheets-1.78.1/tools/bin/docbook-xsl-update
 
 	ln -s VERSION ${D}/${datadir}/xml/docbook/xsl-stylesheets-1.78.1/VERSION.xsl
 
@@ -63,5 +64,6 @@ docbook_xsl_stylesheets_sysroot_preprocess () {
     sed -i -e "s|file:///usr/share/xml|file://${datadir}/xml|g" ${SYSROOT_DESTDIR}${sysconfdir}/xml/docbook-xsl.xml
 }
 
+RDEPENDS_${PN} += "perl"
 FILES_${PN} = "${datadir}/xml/* ${sysconfdir}/xml/docbook-xsl.xml"
 FILES_${PN}-doc = "${datadir}/doc/*"
-- 
1.9.1


