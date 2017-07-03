Return-Path: <gordan.markus@pelagicore.com>
X-Greylist: delayed 325 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 03 Jul 2017 12:40:09 UTC
Received: from ORO-EDGE-02.luxoft.com (oro-edge-02.luxoft.com [109.166.244.22])
	by mail.openembedded.org (Postfix) with ESMTP id A406171AB7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jul 2017 12:40:09 +0000 (UTC)
Received: from ORO-HUBT-02.luxoft.com (172.30.115.36) by
	oro-edge-02.luxoft.com (172.30.19.22) with Microsoft SMTP Server (TLS)
	id 14.3.319.2; Mon, 3 Jul 2017 15:34:42 +0300
Received: from gordanmarkus-XPS13.luxoft.com (172.31.240.163) by
	ORO-HUBT-02.luxoft.com (172.30.115.101) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Mon, 3 Jul 2017 15:34:42 +0300
From: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Jul 2017 14:34:33 +0200
Message-ID: <20170703123433.23528-2-gordan.markus@pelagicore.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
X-Originating-IP: [172.31.240.163]
Cc: =?UTF-8?q?Gordan=20Marku=C5=A1?= <gordan.markus@pelagicore.com>
Subject: [PATCH] cairo: fix QA Issue
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
X-List-Received-Date: Mon, 03 Jul 2017 12:40:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

QA Issue: cairo: Files/directories were installed but not shipped in any
package: /usr/lib/cairo

Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
---
 meta/recipes-graphics/cairo/cairo_1.14.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo_1.14.8.bb b/meta/recipes-graphics/cairo/cairo_1.14.8.bb
index af6be56..9460191 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.8.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.8.bb
@@ -31,7 +31,7 @@ to replay rendering."
 DESCRIPTION_cairo-perf-utils = "The Cairo library performance utilities"
 
 FILES_${PN} = "${libdir}/libcairo.so.*"
-FILES_${PN}-dev += "${libdir}/cairo/*.so"
+FILES_${PN}-dev += "${libdir}/cairo ${libdir}/cairo/*.so"
 FILES_${PN}-gobject = "${libdir}/libcairo-gobject.so.*"
 FILES_${PN}-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
 FILES_${PN}-perf-utils = "${bindir}/cairo-trace ${libdir}/cairo/*.la ${libdir}/cairo/libcairo-trace.so.*"
-- 
2.9.3


