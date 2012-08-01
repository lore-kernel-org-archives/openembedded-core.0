Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1SwZqH-0000SV-OS
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 16:24:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q71ECPP2008513
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 07:12:25 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 07:12:24 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2012 10:12:05 -0400
Message-ID: <1343830340-25351-5-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
References: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/19] gawk: use new update-alternatives
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
X-List-Received-Date: Wed, 01 Aug 2012 14:24:07 -0000
Content-Type: text/plain


Signed-off-by: Morgan Little <morgan.little@windriver.com>
---
 meta/recipes-extended/gawk/gawk_3.1.5.bb |    8 ++++----
 meta/recipes-extended/gawk/gawk_4.0.1.bb |    8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-extended/gawk/gawk_3.1.5.bb b/meta/recipes-extended/gawk/gawk_3.1.5.bb
index 89dd01c..00684e8 100644
--- a/meta/recipes-extended/gawk/gawk_3.1.5.bb
+++ b/meta/recipes-extended/gawk/gawk_3.1.5.bb
@@ -13,7 +13,7 @@
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 RDEPENDS_gawk += "gawk-common"
 RDEPENDS_pgawk += "gawk-common"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
 	file://gawk-3.1.5_fix_for_automake-1.12.patch"
@@ -30,9 +30,9 @@
 FILES_gawk-common += "${datadir}/awk/* ${libexecdir}/awk/*"
 FILES_pgawk = "${bindir}/pgawk*"
 FILES_${PN}-dbg += "${libexecdir}/awk/.debug"
 
-ALTERNATIVE_NAME = "awk"
-ALTERNATIVE_PATH = "gawk"
-ALTERNATIVE_LINK = "${bindir}/awk"
+ALTERNATIVE_${PN} = "awk"
+ALTERNATIVE_TARGET[awk] = "gawk"
+ALTERNATIVE_LINK_NAME[awk] = "${bindir}/awk"
 ALTERNATIVE_PRIORITY = "100"
 
 CFLAGS += "-D PROTOTYPES"
diff --git a/meta/recipes-extended/gawk/gawk_4.0.1.bb b/meta/recipes-extended/gawk/gawk_4.0.1.bb
index b986ebd..5cc3b7b 100644
--- a/meta/recipes-extended/gawk/gawk_4.0.1.bb
+++ b/meta/recipes-extended/gawk/gawk_4.0.1.bb
@@ -11,7 +11,7 @@
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 RDEPENDS_gawk += "gawk-common"
 RDEPENDS_pgawk += "gawk-common"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz"
 
@@ -28,9 +28,9 @@
 FILES_pgawk = "${bindir}/pgawk*"
 FILES_${PN}-dbg += "${libexecdir}/awk/.debug"
 FILES_dgawk = "${bindir}/dgawk*"
 
-ALTERNATIVE_NAME = "awk"
-ALTERNATIVE_PATH = "gawk"
-ALTERNATIVE_LINK = "${bindir}/awk"
+ALTERNATIVE_${PN} = "awk"
+ALTERNATIVE_TARGET[awk] = "gawk"
+ALTERNATIVE_LINK_NAME[awk] = "${bindir}/awk"
 ALTERNATIVE_PRIORITY = "100"
 
 do_install_append() {
-- 
1.7.0.4



