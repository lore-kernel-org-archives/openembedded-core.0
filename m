Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E70CC7E7C6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2019 10:49:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5GAnDa8011710
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Jun 2019 03:49:13 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Sun, 16 Jun 2019 03:48:54 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 16 Jun 2019 06:48:51 -0400
Message-ID: <20190616104851.141319-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH] openssl: fix failure of ptest test_shlibload
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
X-List-Received-Date: Sun, 16 Jun 2019 10:49:13 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to run ptest case test_shlibload which requires libcrypto.so
and libssl.so with version numbers now.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1c.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
index 669b1a1034..534be57540 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1c.bb
@@ -166,8 +166,8 @@ do_install_ptest () {
 	cp -r ${S}/external ${B}/test ${S}/test ${B}/fuzz ${S}/util ${B}/util ${D}${PTEST_PATH}
 
 	# For test_shlibload
-	ln -s ${libdir}/libcrypto.so.1.1 ${D}${PTEST_PATH}/libcrypto.so
-	ln -s ${libdir}/libssl.so.1.1 ${D}${PTEST_PATH}/libssl.so
+	ln -s ${libdir}/libcrypto.so.1.1 ${D}${PTEST_PATH}/
+	ln -s ${libdir}/libssl.so.1.1 ${D}${PTEST_PATH}/
 
 	install -d ${D}${PTEST_PATH}/apps
 	ln -s ${bindir}/openssl ${D}${PTEST_PATH}/apps
-- 
2.20.0


