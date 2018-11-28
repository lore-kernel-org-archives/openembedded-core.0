Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id 4F6E66D2AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 04:53:26 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 8069A220541;
	Wed, 28 Nov 2018 17:53:24 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 17:53:13 +1300
Message-Id: <20181128045316.24102-6-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181128045316.24102-1-douglas.royds@taitradio.com>
References: <20181128045316.24102-1-douglas.royds@taitradio.com>
Subject: [PATCH 5/8] acl: Use install instead of cp
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
X-List-Received-Date: Wed, 28 Nov 2018 04:53:27 -0000

Also, hard-tabs begone

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/recipes-support/attr/acl_2.2.52.bb | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-support/attr/acl_2.2.52.bb b/meta/recipes-support/attr/acl_2.2.52.bb
index 8b89de9b42..260975d93e 100644
--- a/meta/recipes-support/attr/acl_2.2.52.bb
+++ b/meta/recipes-support/attr/acl_2.2.52.bb
@@ -27,27 +27,27 @@ require ea-acl.inc
 
 # avoid RPATH hardcode to staging dir
 do_configure_append() {
-	sed -i ${S}/config.status -e s,^\\\(hardcode_into_libs=\\\).*$,\\1\'no\',
-	${S}/config.status
+    sed -i ${S}/config.status -e s,^\\\(hardcode_into_libs=\\\).*$,\\1\'no\',
+    ${S}/config.status
 }
 
 # libdir should point to .la
 do_install_append() {
-	sed -i ${D}${libdir}/libacl.la -e \
-	    s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
+    sed -i ${D}${libdir}/libacl.la \
+        -e s,^libdir=\'${base_libdir}\'$,libdir=\'${libdir}\',
 }
 
 inherit ptest
 
 do_install_ptest() {
-	tar -c --exclude=nfs test/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
-	mkdir ${D}${PTEST_PATH}/include
-	cp ${S}/include/builddefs ${S}/include/buildmacros ${S}/include/buildrules ${D}${PTEST_PATH}/include/
-	# Remove any build host references
-	sed -e "s:--sysroot=${STAGING_DIR_TARGET}::g" \
-	    -e 's:${HOSTTOOLS_DIR}/::g' \
-	    -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
-	    -i ${D}${PTEST_PATH}/include/builddefs
+    tar -c --exclude=nfs test/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
+    install -d ${D}${PTEST_PATH}/include
+    install -m 644 ${S}/include/builddefs ${S}/include/buildmacros ${S}/include/buildrules ${D}${PTEST_PATH}/include/
+    # Remove any build host references
+    sed -e "s:--sysroot=${STAGING_DIR_TARGET}::g" \
+        -e 's:${HOSTTOOLS_DIR}/::g' \
+        -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
+        -i ${D}${PTEST_PATH}/include/builddefs
 }
 
 RDEPENDS_${PN}-ptest = "acl bash coreutils perl perl-module-filehandle perl-module-getopt-std perl-module-posix shadow"
-- 
2.17.1


