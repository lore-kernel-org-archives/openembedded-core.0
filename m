Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 234B471B1F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 20:16:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v78KG5lq002593
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Aug 2017 13:16:05 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 8 Aug 2017 13:16:05 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Aug 2017 13:16:05 -0700
Message-ID: <20170808201605.139537-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] php: move to version 7.1.8
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
X-List-Received-Date: Tue, 08 Aug 2017 20:16:08 -0000
Content-Type: text/plain

Fixes many CVEs.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 .../{php-7.1.0 => php-7.1.8}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch | 0
 meta-oe/recipes-devtools/php/{php_7.1.0.bb => php_7.1.8.bb}         | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/php/{php-7.1.0 => php-7.1.8}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
 rename meta-oe/recipes-devtools/php/{php_7.1.0.bb => php_7.1.8.bb} (64%)

diff --git a/meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php-7.1.8/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
similarity index 100%
rename from meta-oe/recipes-devtools/php/php-7.1.0/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
rename to meta-oe/recipes-devtools/php/php-7.1.8/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
diff --git a/meta-oe/recipes-devtools/php/php_7.1.0.bb b/meta-oe/recipes-devtools/php/php_7.1.8.bb
similarity index 64%
rename from meta-oe/recipes-devtools/php/php_7.1.0.bb
rename to meta-oe/recipes-devtools/php/php_7.1.8.bb
index 210d91f..c0b2541 100644
--- a/meta-oe/recipes-devtools/php/php_7.1.0.bb
+++ b/meta-oe/recipes-devtools/php/php_7.1.8.bb
@@ -1,10 +1,10 @@
 require php.inc
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b602636d46a61c0ac0432bbf5c078fe4"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c0af599f66d0461c5837c695fcbc5c1e"
 
 SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch"
-SRC_URI[md5sum] = "54e364b60a88db77adb96aacb10f10a4"
-SRC_URI[sha256sum] = "68bcfd7deed5b3474d81dec9f74d122058327e2bed0ac25bbc9ec70995228e61"
+SRC_URI[md5sum] = "d22451dc20bbdf4b8bb656dc787c2a36"
+SRC_URI[sha256sum] = "7064a00a9450565190890c7a4be04e646e0be73b2e0f8c46ae34419f343ca2f8"
 
 PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
                         --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
-- 
2.7.4


