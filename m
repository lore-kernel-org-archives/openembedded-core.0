Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id CFDDF6D495
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 23:43:53 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 95BD22205ED;
	Thu, 29 Nov 2018 12:43:49 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 12:43:43 +1300
Message-Id: <20181128234345.19191-7-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181128234345.19191-1-douglas.royds@taitradio.com>
References: <20181128045316.24102-1-douglas.royds@taitradio.com>
	<20181128234345.19191-1-douglas.royds@taitradio.com>
Subject: [PATCH v4 6/8] acl: Use install instead of cp
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
X-List-Received-Date: Wed, 28 Nov 2018 23:43:55 -0000

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/recipes-support/attr/acl_2.2.52.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/attr/acl_2.2.52.bb b/meta/recipes-support/attr/acl_2.2.52.bb
index 8b89de9b42..318308a009 100644
--- a/meta/recipes-support/attr/acl_2.2.52.bb
+++ b/meta/recipes-support/attr/acl_2.2.52.bb
@@ -41,8 +41,8 @@ inherit ptest
 
 do_install_ptest() {
 	tar -c --exclude=nfs test/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
-	mkdir ${D}${PTEST_PATH}/include
-	cp ${S}/include/builddefs ${S}/include/buildmacros ${S}/include/buildrules ${D}${PTEST_PATH}/include/
+	install -d ${D}${PTEST_PATH}/include
+	install -m 644 ${S}/include/builddefs ${S}/include/buildmacros ${S}/include/buildrules ${D}${PTEST_PATH}/include/
 	# Remove any build host references
 	sed -e "s:--sysroot=${STAGING_DIR_TARGET}::g" \
 	    -e 's:${HOSTTOOLS_DIR}/::g' \
-- 
2.17.1


