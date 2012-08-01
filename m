Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1SwZqI-0000TJ-IU
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 16:24:06 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q71ECRw0010022
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 07:12:27 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 07:12:27 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2012 10:12:10 -0400
Message-ID: <1343830340-25351-10-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
References: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/19] sed: use new update-alternatives
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
 meta/recipes-extended/sed/sed_4.1.2.bb |    8 ++++----
 meta/recipes-extended/sed/sed_4.2.1.bb |    8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-extended/sed/sed_4.1.2.bb b/meta/recipes-extended/sed/sed_4.1.2.bb
index 3455c20..cffbec3 100644
--- a/meta/recipes-extended/sed/sed_4.1.2.bb
+++ b/meta/recipes-extended/sed/sed_4.1.2.bb
@@ -4,7 +4,7 @@
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://sed/sed.h;beginline=1;endline=17;md5=e00ffd1837f298439a214fd197f6a407"
 SECTION = "console/utils"
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz \
            file://fix_return_type.patch \
@@ -22,9 +22,9 @@
 do_install () {
 	rmdir ${D}${bindir}/
 }
 
-ALTERNATIVE_NAME = "sed"
-ALTERNATIVE_PATH = "sed.${BPN}"
-ALTERNATIVE_LINK = "${base_bindir}/sed"
+ALTERNATIVE_${PN} = "sed"
+ALTERNATIVE_TARGET[sed] = "${base_bindir}/sed.${BPN}"
+ALTERNATIVE_LINK_NAME[sed] = "${base_bindir}/sed"
 ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
diff --git a/meta/recipes-extended/sed/sed_4.2.1.bb b/meta/recipes-extended/sed/sed_4.2.1.bb
index b39eca0..60d4b20 100644
--- a/meta/recipes-extended/sed/sed_4.2.1.bb
+++ b/meta/recipes-extended/sed/sed_4.2.1.bb
@@ -4,7 +4,7 @@
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949 \
                     file://sed/sed.h;beginline=1;endline=17;md5=767ab3a06d7584f6fd0469abaec4412f"
 SECTION = "console/utils"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz"
 
@@ -22,9 +22,9 @@
 do_install () {
 	rmdir ${D}${bindir}/
 }
 
-ALTERNATIVE_NAME = "sed"
-ALTERNATIVE_PATH = "sed.${BPN}"
-ALTERNATIVE_LINK = "${base_bindir}/sed"
+ALTERNATIVE_${PN} = "sed"
+ALTERNATIVE_TARGET[sed] = "${base_bindir}/sed.${BPN}"
+ALTERNATIVE_LINK_NAME[sed] = "${base_bindir}/sed"
 ALTERNATIVE_PRIORITY = "100"
 
 BBCLASSEXTEND = "native"
-- 
1.7.0.4



