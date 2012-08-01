Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Morgan.Little@windriver.com>) id 1SwZqK-0000Tc-FD
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 16:24:09 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q71ECTHl010028
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2012 07:12:29 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 1 Aug 2012 07:12:29 -0700
From: Morgan Little <morgan.little@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2012 10:12:13 -0400
Message-ID: <1343830340-25351-13-git-send-email-morgan.little@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
References: <1343830340-25351-1-git-send-email-morgan.little@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 12/19] which: use new update-alternatives
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
X-List-Received-Date: Wed, 01 Aug 2012 14:24:10 -0000
Content-Type: text/plain


Signed-off-by: Morgan Little <morgan.little@windriver.com>
---
 meta/recipes-extended/which/which_2.18.bb |    6 +++---
 meta/recipes-extended/which/which_2.20.bb |    6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/which/which_2.18.bb b/meta/recipes-extended/which/which_2.18.bb
index d54e776..db2d7dc 100644
--- a/meta/recipes-extended/which/which_2.18.bb
+++ b/meta/recipes-extended/which/which_2.18.bb
@@ -9,7 +9,7 @@
 BUGTRACKER = "n/a"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://www.xs4all.nl/~carlo17/which/which-${PV}.tar.gz \
            file://fix_name_conflict_group_member.patch"
@@ -30,7 +30,7 @@
 do_install_append() {
 	mv ${D}/${bindir}/which ${D}/${bindir}/which.${BPN}
 }
 
-ALTERNATIVE_NAME = "which"
-ALTERNATIVE_PATH = "which.${BPN}"
+ALTERNATIVE_${PN} = "which"
+ALTERNATIVE_TARGET[which] = "${bindir}/which.${BPN}"
 ALTERNATIVE_PRIORITY = "100"
 
diff --git a/meta/recipes-extended/which/which_2.20.bb b/meta/recipes-extended/which/which_2.20.bb
index 9b43943..21b4bec 100644
--- a/meta/recipes-extended/which/which_2.20.bb
+++ b/meta/recipes-extended/which/which_2.20.bb
@@ -8,7 +8,7 @@
 DEPENDS     = "cwautomacros-native"
 
 inherit autotools update-alternatives
 
-PR = "r2"
+PR = "r3"
 
 EXTRA_OECONF = "--disable-iberty"
 
@@ -27,6 +27,6 @@
 do_install() {
 	mv ${D}${bindir}/which ${D}${bindir}/which.${BPN}
 }
 
-ALTERNATIVE_NAME = "which"
-ALTERNATIVE_PATH = "which.${BPN}"
+ALTERNATIVE_${PN} = "which"
+ALTERNATIVE_TARGET[which] = "${bindir}/which.${BPN}"
 ALTERNATIVE_PRIORITY = "100"
-- 
1.7.0.4



