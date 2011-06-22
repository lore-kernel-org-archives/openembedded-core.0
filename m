Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QZREZ-0007hG-34
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 19:28:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5MHPO2t026728
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 10:25:24 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 22 Jun 2011 10:25:23 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Jun 2011 12:36:11 -0500
Message-ID: <bae6c215ad82d54a260507b2beaecef8d67941cf.1308763995.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1308763995.git.mark.hatle@windriver.com>
References: <cover.1308763995.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 17/40] psmisc: Remove custom -dbg packages, use default
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
X-List-Received-Date: Wed, 22 Jun 2011 17:28:59 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/psmisc/psmisc.inc      |    8 +-------
 meta/recipes-extended/psmisc/psmisc_22.13.bb |    2 +-
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-extended/psmisc/psmisc.inc b/meta/recipes-extended/psmisc/psmisc.inc
index 8b391f4..025c223 100644
--- a/meta/recipes-extended/psmisc/psmisc.inc
+++ b/meta/recipes-extended/psmisc/psmisc.inc
@@ -18,25 +18,19 @@ inherit autotools gettext
 
 ALLOW_EMPTY = "1"
 
-PACKAGES = "${PN} \
-       fuser-dbg fuser fuser-doc \
-	   killall-dbg killall killall-doc \
-	   pstree-dbg pstree pstree-doc"
+PACKAGES =+ "fuser fuser-doc killall killall-doc pstree pstree-doc "
 
 FILES_${PN} = ""
 RDEPENDS_${PN} = "fuser killall pstree"
 
 FILES_fuser = "${bindir}/fuser.${PN}"
 FILES_fuser-doc = "${mandir}/man1/fuser*"
-FILES_fuser-dbg = "${bindir}/.debug/fuser"
 
 FILES_killall = "${bindir}/killall.${PN}"
 FILES_killall-doc = "${mandir}/man1/killall*"
-FILES_killall-dbg = "${bindir}/.debug/killall*"
 
 FILES_pstree = "${bindir}/pstree"
 FILES_pstree-doc = "${mandir}/man1/pstree*"
-FILES_pstree-dbg = "${bindir}/.debug/pstree"
 
 do_install_append() {
 	mv ${D}${bindir}/killall ${D}${bindir}/killall.${PN}
diff --git a/meta/recipes-extended/psmisc/psmisc_22.13.bb b/meta/recipes-extended/psmisc/psmisc_22.13.bb
index 598c144..757e097 100644
--- a/meta/recipes-extended/psmisc/psmisc_22.13.bb
+++ b/meta/recipes-extended/psmisc/psmisc_22.13.bb
@@ -1,7 +1,7 @@
 require psmisc.inc
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "e2c339e6b65b730042084023784a729e"
 SRC_URI[sha256sum] = "06d25e8ebb4722dbcede98a787c39a9ed341f8e58fde10c0b2d6b35990b35daa"
-- 
1.7.3.4



