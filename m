Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 4C1DD79DD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 01:19:40 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id B8563220413;
	Fri, 14 Dec 2018 14:19:40 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 14:19:36 +1300
Message-Id: <20181214011937.16881-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/2] acl: trivial: whitespace only
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
X-List-Received-Date: Fri, 14 Dec 2018 01:19:41 -0000

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/recipes-support/attr/acl_2.2.52.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/attr/acl_2.2.52.bb b/meta/recipes-support/attr/acl_2.2.52.bb
index 6bc77d868d..7f5883a5d7 100644
--- a/meta/recipes-support/attr/acl_2.2.52.bb
+++ b/meta/recipes-support/attr/acl_2.2.52.bb
@@ -47,6 +47,7 @@ do_install_ptest() {
 	install -m 644 ${S}/include/builddefs ${S}/include/buildmacros ${S}/include/buildrules ${D}${PTEST_PATH}/include/
 }
 
-RDEPENDS_${PN}-ptest = "acl bash coreutils perl perl-module-filehandle perl-module-getopt-std perl-module-posix shadow"
+RDEPENDS_${PN}-ptest = "acl bash coreutils \
+                        perl perl-module-filehandle perl-module-getopt-std perl-module-posix shadow"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


