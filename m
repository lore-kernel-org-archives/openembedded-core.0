Return-Path: <huangqy.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 655B671A39
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 02:34:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="18622461"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 May 2017 10:34:11 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id EEA1947C677F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 10:34:08 +0800 (CST)
Received: from localhost.localdomain (10.167.226.81) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Tue, 9 May 2017 10:34:08 +0800
From: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 May 2017 10:34:18 +0800
Message-ID: <1494297258-15742-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.167.226.81]
X-yoursite-MailScanner-ID: EEA1947C677F.AA908
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: huangqy.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: [PATCH] libpng: 1.6.28 -> 1.6.29
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
X-List-Received-Date: Tue, 09 May 2017 02:34:12 -0000
Content-Type: text/plain

1) Upgrade libpng from 1.6.28 to 1.6.29.
2) License checksum changed,since the copyright date and contributing authors were updated.

Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
---
 .../libpng/{libpng_1.6.28.bb => libpng_1.6.29.bb}                 | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.28.bb => libpng_1.6.29.bb} (67%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.28.bb b/meta/recipes-multimedia/libpng/libpng_1.6.29.bb
similarity index 67%
rename from meta/recipes-multimedia/libpng/libpng_1.6.28.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.29.bb
index 9cb2967..8a3056e 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.28.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.29.bb
@@ -2,14 +2,14 @@ SUMMARY = "PNG image format decoding library"
 HOMEPAGE = "http://www.libpng.org/"
 SECTION = "libs"
 LICENSE = "Libpng"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=67d8837410863f9821bbd606536f0329 \
-                    file://png.h;endline=144;md5=abfa0497feb393b5842d3d82c1009520"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f9acafc1325f8f8da80aeee94dbc1bda \
+                    file://png.h;endline=144;md5=0b2aa20c7ff55d9411108317df8ff0c9"
 DEPENDS = "zlib"
 
 SRC_URI = "${GENTOO_MIRROR}/libpng-${PV}.tar.xz \
           "
-SRC_URI[md5sum] = "425354f86c392318d31aedca71019372"
-SRC_URI[sha256sum] = "d8d3ec9de6b5db740fefac702c37ffcf96ae46cb17c18c1544635a3852f78f7a"
+SRC_URI[md5sum] = "3245dbd76ea91e1437507357b858ec97"
+SRC_URI[sha256sum] = "4245b684e8fe829ebb76186327bb37ce5a639938b219882b53d64bd3cfc5f239"
 
 BINCONFIG = "${bindir}/libpng-config ${bindir}/libpng16-config"
 
-- 
2.7.4




