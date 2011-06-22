Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZREX-0007h3-Ka
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:28:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHPM4b026715
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:25:22 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 10:25:22 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 12:36:10 -0500
Message-ID: <68d3d1f6e8c4983c68d8c47e632287458b343373.1308763995.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 16/40] texinfo: Change to use the standard -dbg file
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
X-List-Received-Date: Wed, 22 Jun 2011 17:28:58 -0000
Content-Type: text/plain

Remove the custom -dbg package and replace it the standard configuration.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/texinfo/texinfo_4.13a.bb |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/texinfo/texinfo_4.13a.bb b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
index ac89b66..0133eab 100644
--- a/meta/recipes-extended/texinfo/texinfo_4.13a.bb
+++ b/meta/recipes-extended/texinfo/texinfo_4.13a.bb
@@ -7,7 +7,7 @@ SECTION = "console/utils"
 PRIORITY = "required"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=adefda309052235aa5d1e99ce7557010"
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "zlib"
 
@@ -41,14 +41,12 @@ do_install_append() {
 	install -p -m644 doc/texinfo.tex doc/txi-??.tex ${D}${datadir}/${tex_texinfo} 	
 }
 
-PACKAGES += "info info-doc info-dbg"
+PACKAGES += "info info-doc"
 
 FILES_info = "${bindir}/info ${bindir}/infokey ${bindir}/install-info"
 FILES_info-doc = "${infodir}/info.info ${infodir}/dir ${infodir}/info-*.info \
                   ${mandir}/man1/info.1* ${mandir}/man5/info.5* \
                   ${mandir}/man1/infokey.1* ${mandir}/man1/install-info.1*"
-FILES_info-dbg = "${bindir}/.debug/info ${bindir}/.debug/install-info \
-                  ${bindir}/.debug/infokey"
 
 FILES_${PN} = "${bindir}/makeinfo ${bindir}/texi* ${bindir}/pdftexi2dvi"
 FILES_${PN}-doc = "${datadir}/texinfo ${infodir}/texinfo* \
@@ -56,6 +54,5 @@ FILES_${PN}-doc = "${datadir}/texinfo ${infodir}/texinfo* \
                    ${mandir}/man1/makeinfo.1* ${mandir}/man5/texinfo.5* \
                    ${mandir}/man1/texindex.1* ${mandir}/man1/texi2dvi.1* \
                    ${mandir}/man1/texi2pdf.1* ${mandir}/man1/pdftexi2dvi.1*"
-FILES_${PN}-dbg = "${bindir}/.debug/texindex ${bindir}/.debug/makeinfo"
 
 BBCLASSEXTEND = "native"
-- 
1.7.3.4



