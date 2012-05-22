Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SWut1-0001jK-DE
	for openembedded-core@lists.openembedded.org;
	Tue, 22 May 2012 21:36:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4MJQfvK026929
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2012 12:26:41 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 22 May 2012 12:26:41 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 May 2012 14:30:11 -0500
Message-ID: <4704af24f3a7b678065a2ba5b8cd0389f8e42ff4.1337714416.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1337714416.git.mark.hatle@windriver.com>
References: <cover.1337714416.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 03/30] which: use BPN for alternatives
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
X-List-Received-Date: Tue, 22 May 2012 19:36:51 -0000
Content-Type: text/plain

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-extended/which/which_2.18.bb |    4 ++--
 meta/recipes-extended/which/which_2.20.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/which/which_2.18.bb b/meta/recipes-extended/which/which_2.18.bb
index f87929b..d54e776 100644
--- a/meta/recipes-extended/which/which_2.18.bb
+++ b/meta/recipes-extended/which/which_2.18.bb
@@ -27,10 +27,10 @@ do_configure_prepend() {
 	sed -i "s#${OLD}#${NEW}#g" `grep -rl ${OLD} ${S}`
 }
 do_install_append() {
-	mv ${D}/${bindir}/which ${D}/${bindir}/which.${PN}
+	mv ${D}/${bindir}/which ${D}/${bindir}/which.${BPN}
 }
 
 ALTERNATIVE_NAME = "which"
-ALTERNATIVE_PATH = "which.${PN}"
+ALTERNATIVE_PATH = "which.${BPN}"
 ALTERNATIVE_PRIORITY = "100"
 
diff --git a/meta/recipes-extended/which/which_2.20.bb b/meta/recipes-extended/which/which_2.20.bb
index a4e860b..9b43943 100644
--- a/meta/recipes-extended/which/which_2.20.bb
+++ b/meta/recipes-extended/which/which_2.20.bb
@@ -24,9 +24,9 @@ do_configure_prepend() {
 
 do_install() {
 	autotools_do_install
-	mv ${D}${bindir}/which ${D}${bindir}/which.${PN}
+	mv ${D}${bindir}/which ${D}${bindir}/which.${BPN}
 }
 
 ALTERNATIVE_NAME = "which"
-ALTERNATIVE_PATH = "which.${PN}"
+ALTERNATIVE_PATH = "which.${BPN}"
 ALTERNATIVE_PRIORITY = "100"
-- 
1.7.3.4



