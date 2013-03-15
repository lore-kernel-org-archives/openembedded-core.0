Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1UGSsB-0007Z2-Nl
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2013 12:32:36 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2F8493U008697
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Mar 2013 01:04:09 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 15 Mar 2013 01:04:09 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Mar 2013 16:04:01 +0800
Message-ID: <b058232219a5a046452fdaa4de0a97ea9e8ae962.1363333753.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1363333753.git.jackie.huang@windriver.com>
References: <cover.1363333753.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com, Jackie.Huang@windriver.com
Subject: [PATCH 2/4] gnupg: fix PN -> BPN in do_install for multilibs
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
X-List-Received-Date: Fri, 15 Mar 2013 11:32:45 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta/recipes-support/gnupg/gnupg_1.4.7.bb |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/gnupg/gnupg_1.4.7.bb b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
index 8c2f7f6..7fbc3d3 100644
--- a/meta/recipes-support/gnupg/gnupg_1.4.7.bb
+++ b/meta/recipes-support/gnupg/gnupg_1.4.7.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
-PR = "r8"
+PR = "r9"
 
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/gnupg/gnupg-${PV}.tar.bz2 \
            file://long-long-thumb.patch \
@@ -79,9 +79,9 @@ EXTRA_OECONF = "--disable-ldap \
 
 do_install () {
 	autotools_do_install
-	install -d ${D}${docdir}/${PN}
-	mv ${D}${datadir}/${PN}/* ${D}/${docdir}/${PN}/ || :
-	mv ${D}${prefix}/doc/* ${D}/${docdir}/${PN}/ || :
+	install -d ${D}${docdir}/${BPN}
+	mv ${D}${datadir}/${BPN}/* ${D}/${docdir}/${BPN}/ || :
+	mv ${D}${prefix}/doc/* ${D}/${docdir}/${BPN}/ || :
 }
 
 # split out gpgv from main package
@@ -90,5 +90,5 @@ PACKAGES =+ "gpgv"
 FILES_gpgv = "${bindir}/gpgv"
 
 # Exclude debug files from the main packages
-FILES_${PN} = "${bindir}/* ${datadir}/${PN} ${libexecdir}/${PN}/*"
-FILES_${PN}-dbg += "${libexecdir}/${PN}/.debug"
+FILES_${PN} = "${bindir}/* ${datadir}/${BPN} ${libexecdir}/${BPN}/*"
+FILES_${PN}-dbg += "${libexecdir}/${BPN}/.debug"
-- 
1.7.4.1



