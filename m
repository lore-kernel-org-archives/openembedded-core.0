Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7999B73FDA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 08:58:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4C8wqQq021026
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 May 2015 01:58:52 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 12 May 2015 01:58:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 May 2015 01:58:51 -0700
Message-ID: <0b18e7cdd95e338066f98e9518edeee7f3055a36.1431421106.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431421106.git.liezhi.yang@windriver.com>
References: <cover.1431421106.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] openssl/orc: virtclass-native -> class-native
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
X-List-Received-Date: Tue, 12 May 2015 08:58:51 -0000
Content-Type: text/plain

The virtclass-native is out of date.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl.inc |    2 +-
 meta/recipes-devtools/orc/orc_0.4.23.bb       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index ba9bca6..53dcfd9 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -203,7 +203,7 @@ do_install_ptest () {
 	install util/shlib_wrap.sh     ${D}${PTEST_PATH}/util
 }
 
-do_install_append_virtclass-native() {
+do_install_append_class-native() {
 	create_wrapper ${D}${bindir}/openssl \
 	    OPENSSL_CONF=${libdir}/ssl/openssl.cnf \
 	    SSL_CERT_DIR=${libdir}/ssl/certs \
diff --git a/meta/recipes-devtools/orc/orc_0.4.23.bb b/meta/recipes-devtools/orc/orc_0.4.23.bb
index 0e07731..d4257c3 100644
--- a/meta/recipes-devtools/orc/orc_0.4.23.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.23.bb
@@ -20,6 +20,6 @@ python populate_packages_prepend () {
     do_split_packages(d, libdir, '^lib(.*)\.so\.*', 'lib%s', 'ORC %s library', extra_depends='', allow_links=True)
 }
 
-do_compile_prepend_virtclass-native () {
+do_compile_prepend_class-native () {
     sed -i -e 's#/tmp#.#g' ${S}/orc/orccodemem.c
 }
-- 
1.7.9.5


