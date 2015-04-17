Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6BAF873D37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 06:15:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="90819530"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 17 Apr 2015 14:12:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t3H6EdLi013257
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Apr 2015 14:14:39 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 17 Apr 2015 14:15:54 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Apr 2015 14:15:40 +0800
Message-ID: <1429251340-44321-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.48]
Subject: [PATCH] cairo_1.14.2: Modified the license of cairo-trace.
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
X-List-Received-Date: Fri, 17 Apr 2015 06:15:51 -0000
Content-Type: text/plain

Because the license of cairo-trace is GPLv3(util/cairo-trace/COPYING).
So pickup cairo-trace,and modified the license to GPLv3.

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 meta/recipes-graphics/cairo/cairo.inc       |  6 +++++-
 meta/recipes-graphics/cairo/cairo_1.14.2.bb | 10 ++++------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index cd37559..98add5a 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -9,7 +9,11 @@ Extension."
 HOMEPAGE = "http://cairographics.org"
 BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "libs"
-LICENSE = "MPL-1 & LGPLv2.1"
+LICENSE = "MPL-1 & LGPLv2.1 & GPLv3+"
+LICENSE_${PN} = "MPL-1 & LGPLv2.1"
+LICENSE_${PN}-dev = "MPL-1 & LGPLv2.1"
+LICENSE_${PN}-gobject = "MPL-1 & LGPLv2.1"
+LICENSE_${PN}-perf-utils = "GPLv3+"
 X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
 
diff --git a/meta/recipes-graphics/cairo/cairo_1.14.2.bb b/meta/recipes-graphics/cairo/cairo_1.14.2.bb
index 3272eb3..3817dbf 100644
--- a/meta/recipes-graphics/cairo/cairo_1.14.2.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.14.2.bb
@@ -29,12 +29,10 @@ to replay rendering."
 DESCRIPTION_cairo-perf-utils = "The Cairo library performance utilities"
 
 FILES_${PN} = "${libdir}/libcairo.so.*"
-FILES_${PN}-dev += "${libdir}/cairo/*.la ${libdir}/cairo/*.so"
-#FILES_${PN}-dbg += "${libdir}/cairo/.debug"
-#FILES_${PN}-staticdev += "${libdir}/cairo/*.a"
-FILES_cairo-gobject = "${libdir}/libcairo-gobject.so.*"
-FILES_cairo-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
-FILES_cairo-perf-utils = "${bindir}/cairo-trace ${libdir}/cairo/libcairo-trace.so.*"
+FILES_${PN}-dev += "${libdir}/cairo/*.so"
+FILES_${PN}-gobject = "${libdir}/libcairo-gobject.so.*"
+FILES_${PN}-script-interpreter = "${libdir}/libcairo-script-interpreter.so.*"
+FILES_${PN}-perf-utils = "${bindir}/cairo-trace ${libdir}/cairo/*.la ${libdir}/cairo/libcairo-trace.so.*"
 
 do_install_append () {
 	rm -rf ${D}${bindir}/cairo-sphinx
-- 
1.8.4.2


