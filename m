Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A38CB7384D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 10:30:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t22AUhM6023269
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Mar 2015 02:30:43 -0800 (PST)
Received: from pek-lzhou2-d1.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Mon, 2 Mar 2015 02:30:42 -0800
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Mar 2015 18:30:22 +0800
Message-ID: <1425292222-2756-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [128.224.162.243]
Subject: [PATCH] libtool: put libltdl.la in the right package.
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
X-List-Received-Date: Mon, 02 Mar 2015 10:30:42 -0000
Content-Type: text/plain

The libltdl libraries are put in libltdl-* packages, but libltdl.la
is packaged in libtool-dev. This change puts libltdl.la in libltdl-dev
package instead of libtool-dev.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 meta/recipes-devtools/libtool/libtool-2.4.6.inc |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/libtool/libtool-2.4.6.inc b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
index ff5abcb..2125de3 100644
--- a/meta/recipes-devtools/libtool/libtool-2.4.6.inc
+++ b/meta/recipes-devtools/libtool/libtool-2.4.6.inc
@@ -45,6 +45,7 @@ FILES_${PN}-dev = "${includedir} ${FILES_SOLIBSDEV} ${libdir}/*.la \
 #FILES_${PN}-dev := "${@oe_filter_out('${datadir}/aclocal', '${FILES_libtool-dev}', d)}"
 FILES_libltdl = "${libdir}/libltdl${SOLIBS}"
 FILES_libltdl-dev = "${libdir}/libltdl${SOLIBSDEV} ${includedir}"
+FILES_libltdl-dev =+ "${libdir}/libltdl.la"
 FILES_libltdl-staticdev = "${libdir}/libltdl.a"
 FILES_libltdl-dbg = "${libdir}/.debug/"
 
-- 
1.7.9.5


