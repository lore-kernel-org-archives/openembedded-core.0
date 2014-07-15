Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 087BE701C9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:19:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6FEJY6b022738
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 07:19:34 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 07:19:33 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Jul 2014 07:18:56 -0700
Message-ID: <0279dc47cc936140df3dfc4fb2ccd216eec6c67b.1405433828.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1405433828.git.liezhi.yang@windriver.com>
References: <cover.1405433828.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/38] groff: add perl to RDEPENDS_groff
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
X-List-Received-Date: Tue, 15 Jul 2014 14:19:35 -0000
Content-Type: text/plain

The following files are perl scripts:

/usr/lib/groff/groffer/perl_test.pl
/usr/lib/groff/groffer/man.pl
/usr/lib/groff/groffer/func.pl
/usr/bin/afmtodit
/usr/bin/roff2dvi
/usr/bin/groffer
/usr/bin/roff2x
/usr/bin/grog
/usr/bin/roff2ps
/usr/bin/roff2pdf
/usr/bin/chem
/usr/bin/roff2html
/usr/bin/gropdf
/usr/bin/mmroff
/usr/bin/roff2text
/usr/bin/pdfmom

[YOCTO #1662]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/groff/groff_1.22.2.bb |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/groff/groff_1.22.2.bb b/meta/recipes-extended/groff/groff_1.22.2.bb
index 63f0425..5a52d67 100644
--- a/meta/recipes-extended/groff/groff_1.22.2.bb
+++ b/meta/recipes-extended/groff/groff_1.22.2.bb
@@ -64,3 +64,5 @@ FILES_${PN} += "${libdir}/${BPN}/site-tmac \
                 ${libdir}/${BPN}/groffer/"
 
 BBCLASSEXTEND = "native"
+
+RDEPENDS_${PN} += "perl"
-- 
1.7.9.5


