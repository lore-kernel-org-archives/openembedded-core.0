Return-Path: <muhammad_shakeel@mentor.com>
Received: from gemini.alm.mentorg.com (nat-lmt.mentorg.com [139.181.28.34])
	by mail.openembedded.org (Postfix) with ESMTP id 3D0A06B664
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 06:51:52 +0000 (UTC)
Received: from pkl-mshakeel-ubuntu.mgc.mentorg.com ([137.202.157.119])
	by gemini.alm.mentorg.com (8.14.4/8.14.4) with ESMTP id r7D6pf1S010844; 
	Tue, 13 Aug 2013 01:51:51 -0500
From: "Shakeel, Muhammad" <muhammad_shakeel@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Aug 2013 11:52:37 +0500
Message-Id: <1376376758-24991-2-git-send-email-muhammad_shakeel@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1376376758-24991-1-git-send-email-muhammad_shakeel@mentor.com>
References: <1376376758-24991-1-git-send-email-muhammad_shakeel@mentor.com>
Subject: [PATCH 2/3] rpcbind: Replace spaces with tabs in shell function
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
X-List-Received-Date: Tue, 13 Aug 2013 06:51:52 -0000

From: Muhammad Shakeel <muhammad_shakeel@mentor.com>

As per OE-Core convention, indentation should be TAB for shell.

Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
---
 meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
index f4a0367..be2897c 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_0.2.0.bb
@@ -36,11 +36,11 @@ INITSCRIPT_NAME = "rpcbind"
 INITSCRIPT_PARAMS = "start 43 S . start 32 0 6 . stop 81 1 ."
 
 do_install_append () {
-    mv ${D}${bindir} ${D}${sbindir}
+	mv ${D}${bindir} ${D}${sbindir}
 
-    install -d ${D}${sysconfdir}/init.d
-    sed -e 's,/etc/,${sysconfdir}/,g' \
-        -e 's,/sbin/,${sbindir}/,g' \
-        ${WORKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbind
-    chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
+	install -d ${D}${sysconfdir}/init.d
+	sed -e 's,/etc/,${sysconfdir}/,g' \
+		-e 's,/sbin/,${sbindir}/,g' \
+		${WORKDIR}/init.d > ${D}${sysconfdir}/init.d/rpcbind
+	chmod 0755 ${D}${sysconfdir}/init.d/rpcbind
 }
-- 
1.7.9.5


