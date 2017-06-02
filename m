Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwkm03.jp.fujitsu.com (mgwkm03.jp.fujitsu.com [202.219.69.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4F2F76059E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 06:28:57 +0000 (UTC)
Received: from kw-mxoi1.gw.nic.fujitsu.com (unknown [192.168.231.131]) by
	mgwkm03.jp.fujitsu.com with smtp
	id 4857_263c_6deaf5b2_8235_4f52_bec6_5a675b42c8ca;
	Fri, 02 Jun 2017 15:28:51 +0900
Received: from g01jpfmpwyt01.exch.g01.fujitsu.local
	(g01jpfmpwyt01.exch.g01.fujitsu.local [10.128.193.38])
	by kw-mxoi1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F083AC0139
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 15:28:51 +0900 (JST)
Received: from G01JPEXCHYT14.g01.fujitsu.local
	(G01JPEXCHYT14.g01.fujitsu.local [10.128.194.53])
	by g01jpfmpwyt01.exch.g01.fujitsu.local (Postfix) with ESMTP id
	241E76D6794 for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 15:28:50 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT14.g01.fujitsu.local (10.128.194.53) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 2 Jun 2017 15:28:50 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Jun 2017 15:30:07 +0900
Message-ID: <1496385007-18661-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-Encrypted: FENCE-Mail/3.1.1
X-TM-AS-MML: disable
Subject: [PATCH] cairo: Upgrade 1.14.8 -> 1.15.4
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
X-List-Received-Date: Fri, 02 Jun 2017 06:28:59 -0000
Content-Type: text/plain

1. Upgrade cairo from 1.14.8 to 1.15.4

2. Update the SRC_URI according to the release note
   https://www.cairographics.org/news/cairo-1.15.4/

3. Fix the -dev package contains non-symlink .so error.

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 meta/recipes-graphics/cairo/{cairo_1.14.8.bb => cairo_1.15.4.bb} | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/cairo/{cairo_1.14.8.bb => cairo_1.15.4.bb} (86%)

diff --git a/meta/recipes-graphics/cairo/cairo_1.14.8.bb b/meta/recipes-graphics/cairo/cairo_1.15.4.bb
similarity index 86%
rename from meta/recipes-graphics/cairo/cairo_1.14.8.bb
rename to meta/recipes-graphics/cairo/cairo_1.15.4.bb
index 5a3c74f..f48effa 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.8.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.15.4.bb
@@ -2,10 +2,10 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
+SRC_URI = "http://cairographics.org/snapshots/cairo-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "4ef0db2eacb271c74f8a3fd87822aa98"
-SRC_URI[sha256sum] = "d1f2d98ae9a4111564f6de4e013d639cf77155baf2556582295a0f00a9bc5e20"
+SRC_URI[md5sum] = "891ddce3c1c73df791efafd627240cdc"
+SRC_URI[sha256sum] = "deddf31e196e826e7790bbbf7d0f4b3fd15df243aa48511b349f1791b96be291"
 
 PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
 
@@ -32,7 +32,7 @@ FILES_${PN} = "${libdir}/libcairo.so.*"
 FILES_${PN}-dev += "${libdir}/cairo/*.so"
 FILES_${PN}-gobject = "${libdir}/libcairo-gobject.so.*"
 FILES_${PN}-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
-FILES_${PN}-perf-utils = "${bindir}/cairo-trace ${libdir}/cairo/*.la ${libdir}/cairo/libcairo-trace.so.*"
+FILES_${PN}-perf-utils = "${bindir}/cairo-trace ${libdir}/cairo/*.la ${libdir}/cairo/libcairo-trace.so"
 
 do_install_append () {
 	rm -rf ${D}${bindir}/cairo-sphinx
@@ -41,3 +41,4 @@ do_install_append () {
 	rm -rf ${D}${libdir}/cairo/.debug/cairo-fdr*
 	rm -rf ${D}${libdir}/cairo/.debug/cairo-sphinx*
 }
+
-- 
1.9.1


