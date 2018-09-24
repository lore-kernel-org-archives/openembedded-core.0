Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D3E8793BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 19:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 00700184A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 3M5IQdG0DEST
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:19 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id D440A184A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:18 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A02801E092
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:18 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9501D1E091
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:18 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:18 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 8951E192C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:18 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id w8OJ3IRD032100
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:18 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id w8OJ3Ivj032099
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2018 21:03:18 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Sep 2018 21:03:13 +0200
Message-Id: <20180924190313.32027-3-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <20180924190313.32027-1-pkj@axis.com>
References: <20180924190313.32027-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [PATCH 3/3] libxml2: Make it compatible with externalsrc
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
X-List-Received-Date: Mon, 24 Sep 2018 19:03:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fetch the test tar ball to a subdirectory in ${S}. This avoids the
following error after having done `devtool modify libxml2`:

| DEBUG: Executing shell function do_configure
| find: ‘.../build/tmp/work/mips32r2el-nf-poky-linux/libxml2/2.9.4-r0/xmlconf/’: No such file or directory

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/libxml/libxml2_2.9.8.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2_2.9.8.bb b/meta/recipes-core/libxml/libxml2_2.9.8.bb
index f01cb2cd34..4ec03c6d15 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.8.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.8.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://Copyright;md5=2044417e2e5006b65a8b9067b683fcf1 \
 DEPENDS = "zlib virtual/libiconv"
 
 SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
-           http://www.w3.org/XML/Test/xmlts20080827.tar.gz;name=testtar \
+           http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=testtar \
            file://libxml-64bit.patch \
            file://runtest.patch \
            file://run-ptest \
@@ -76,7 +76,7 @@ FILES_${PN}-python += "${PYTHON_SITEPACKAGES_DIR}"
 
 do_configure_prepend () {
 	# executables take longer to package: these should not be executable
-	find ${WORKDIR}/xmlconf/ -type f -exec chmod -x {} \+
+	find ${S}/xmlconf/ -type f -exec chmod -x {} \+
 }
 
 do_compile_ptest() {
@@ -84,7 +84,7 @@ do_compile_ptest() {
 }
 
 do_install_ptest () {
-	cp -r ${WORKDIR}/xmlconf ${D}${PTEST_PATH}
+	cp -r ${S}/xmlconf ${D}${PTEST_PATH}
 	if [ "${@bb.utils.filter('PACKAGECONFIG', 'python', d)}" ]; then
 		sed -i -e 's|^\(PYTHON = \).*|\1${USRBINPATH}/${PYTHON_PN}|' \
 		    ${D}${PTEST_PATH}/python/tests/Makefile
-- 
2.12.0


