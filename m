Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C164A78890
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 07:48:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0V7mifR001984
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 23:48:45 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 30 Jan 2018 23:48:44 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Jan 2018 02:48:17 -0500
Message-ID: <aeb6f0b637919b3aca7fa6072152fdd9716948bd.1517383469.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1517383469.git.hongxu.jia@windriver.com>
References: <cover.1517383469.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] apr-util: 1.6.0 -> 1.6.1
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
X-List-Received-Date: Wed, 31 Jan 2018 07:48:43 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/apr/{apr-util_1.6.0.bb => apr-util_1.6.1.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-support/apr/{apr-util_1.6.0.bb => apr-util_1.6.1.bb} (95%)

diff --git a/meta/recipes-support/apr/apr-util_1.6.0.bb b/meta/recipes-support/apr/apr-util_1.6.1.bb
similarity index 95%
rename from meta/recipes-support/apr/apr-util_1.6.0.bb
rename to meta/recipes-support/apr/apr-util_1.6.1.bb
index 748d196..88b4300 100644
--- a/meta/recipes-support/apr/apr-util_1.6.0.bb
+++ b/meta/recipes-support/apr/apr-util_1.6.1.bb
@@ -15,8 +15,8 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://run-ptest \
 "
 
-SRC_URI[md5sum] = "3b03dbff60728a4f4c33f5d929e8b35a"
-SRC_URI[sha256sum] = "483ef4d59e6ac9a36c7d3fd87ad7b9db7ad8ae29c06b9dd8ff22dda1cc416389"
+SRC_URI[md5sum] = "bd502b9a8670a8012c4d90c31a84955f"
+SRC_URI[sha256sum] = "b65e40713da57d004123b6319828be7f1273fbc6490e145874ee1177e112c459"
 
 EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \ 
 		--without-odbc \
@@ -29,8 +29,6 @@ EXTRA_OECONF = "--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
 
 inherit autotools lib_package binconfig
 
-PR = "r1"
-
 OE_BINCONFIG_EXTRA_MANGLE = " -e 's:location=source:location=installed:'"
 
 do_configure_append() {
-- 
2.8.1


