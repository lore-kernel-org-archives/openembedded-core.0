Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Randy.MacLeod@windriver.com>) id 1UCMwT-0005yD-6K
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 05:24:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r241YWkn027238
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 3 Mar 2013 17:34:32 -0800 (PST)
Received: from fidler.wrs.com (128.224.21.195) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 3 Mar 2013 17:34:32 -0800
From: <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 3 Mar 2013 20:34:30 -0500
Message-ID: <1362360870-12148-1-git-send-email-randy.macleod@windriver.com>
X-Mailer: git-send-email 1.8.1
MIME-Version: 1.0
Subject: [PATCH] apr: add libtool to SSTATE_SCAN_FILES
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
X-List-Received-Date: Mon, 04 Mar 2013 04:24:02 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The hardcoded paths in libtool will cause apache2 compile fail at
link stage when the package apr is installed from sstate cache, so
add libtool to SSTATE_SCAN_FILES.

[ CQID: WIND00405372 ]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/recipes-support/apr/apr_1.4.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/apr/apr_1.4.6.bb b/meta/recipes-support/apr/apr_1.4.6.bb
index b7220e0..77dffee 100644
--- a/meta/recipes-support/apr/apr_1.4.6.bb
+++ b/meta/recipes-support/apr/apr_1.4.6.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0c35ff3c4c83b89d2f076e315caac28b \
 
 BBCLASSEXTEND = "native"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.bz2 \
            file://configure_fixes.patch \
@@ -43,7 +43,7 @@ do_install_append() {
 	cp ${S}/${HOST_SYS}-libtool ${D}${datadir}/build-1/libtool
 }
 
-SSTATE_SCAN_FILES += "apr_rules.mk"
+SSTATE_SCAN_FILES += "apr_rules.mk libtool"
 
 SYSROOT_PREPROCESS_FUNCS += "apr_sysroot_preprocess"
 
-- 
1.8.1



