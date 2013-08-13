Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id EBD376B5FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 06:51:43 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r7D6pf1R010844; 
	Tue, 13 Aug 2013 01:51:42 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2013 11:52:36 +0500
Message-Id: <1376376758-24991-1-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/3] lighttpd: Replace spaces with tabs in shell function
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
X-List-Received-Date: Tue, 13 Aug 2013 06:51:45 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

As per OE-Core convention, indentation should be TAB for shell.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
index df6ce97..6635e31 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.32.bb
@@ -45,10 +45,10 @@ INITSCRIPT_NAME = "lighttpd"
 INITSCRIPT_PARAMS = "defaults 70"
 
 do_install_append() {
-    install -d ${D}${sysconfdir}/init.d ${D}/www/logs ${D}/www/pages/dav ${D}/www/var
-    install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
-    install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
+	install -d ${D}${sysconfdir}/init.d ${D}/www/logs ${D}/www/pages/dav ${D}/www/var
+	install -m 0755 ${WORKDIR}/lighttpd ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/lighttpd.conf ${D}${sysconfdir}
+	install -m 0644 ${WORKDIR}/index.html.lighttpd ${D}/www/pages/index.html
 }
 
 FILES_${PN} += "${sysconfdir} /www"
-- 
1.7.9.5


