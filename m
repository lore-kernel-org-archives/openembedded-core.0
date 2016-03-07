Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B8EB66FFA1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 17:59:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u27HxJfD017018
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Mar 2016 09:59:19 -0800 (PST)
Received: from msp-dhcp15.wrs.com (172.25.34.15) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 7 Mar 2016 09:59:18 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Mar 2016 11:59:10 -0600
Message-ID: <defe1392649033e078433c47ff510c3be661962c.1457373422.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457373422.git.mark.hatle@windriver.com>
References: <cover.1457373422.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/7 v4] rpmresolve: It is not necessary to manually specify -lpopt
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
X-List-Received-Date: Mon, 07 Mar 2016 17:59:18 -0000
Content-Type: text/plain

Popt may be internal or external to rpm.  Either way the rpm libraries
will link properly with or without -lpopt.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpmresolve_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpmresolve_1.0.bb b/meta/recipes-devtools/rpm/rpmresolve_1.0.bb
index 04a55fd..0c13a67 100644
--- a/meta/recipes-devtools/rpm/rpmresolve_1.0.bb
+++ b/meta/recipes-devtools/rpm/rpmresolve_1.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "file://rpmresolve.c"
 S = "${WORKDIR}"
 
 do_compile() {
-	${CC} ${CFLAGS} -ggdb -I${STAGING_INCDIR}/rpm ${LDFLAGS} rpmresolve.c -o rpmresolve -lrpmbuild -lrpm -lrpmio -lrpmdb -lpopt
+	${CC} ${CFLAGS} -ggdb -I${STAGING_INCDIR}/rpm ${LDFLAGS} rpmresolve.c -o rpmresolve -lrpmbuild -lrpm -lrpmio -lrpmdb
 }
 
 do_install() {
-- 
2.5.0


