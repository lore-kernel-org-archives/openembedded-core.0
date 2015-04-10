Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB2373D2D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 09:30:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3A9UA4E028434
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 02:30:10 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 10 Apr 2015 02:30:10 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Apr 2015 02:29:59 -0700
Message-ID: <885e893585592766f5584a80475d59ed9775885e.1428656126.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1428656126.git.liezhi.yang@windriver.com>
References: <cover.1428656126.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/15] cogl: remove extra dev from PACKAGES
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
X-List-Received-Date: Fri, 10 Apr 2015 09:30:09 -0000
Content-Type: text/plain

There should be only one dev and dbg package.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc |   24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
index af06484..3da31c8 100644
--- a/meta/recipes-graphics/cogl/cogl-1.0.inc
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -6,10 +6,8 @@ inherit clutter
 
 DEPENDS = "glib-2.0 gdk-pixbuf"
 PACKAGES =+ "${PN}-examples \
-             libcogl libcogl-dev \
-             libcogl-gles2 libcogl-gles2-dev \
-             libcogl-pango libcogl-pango-dev \
-             libcogl-path libcogl-path-dev"
+             libcogl libcogl-gles2 libcogl-pango libcogl-path \
+            "
 AUTOTOOLS_AUXDIR = "${S}/build"
 
 # Extra DEPENDS for PACKAGECONFIG
@@ -61,28 +59,10 @@ PACKAGECONFIG ??= "cogl-pango gles2 \
 
 FILES_${PN}-examples = "${bindir}/* ${datadir}/cogl/examples-data/*"
 FILES_libcogl = "${libdir}/libcogl${SOLIBS}"
-FILES_libcogl-dev = "${includedir}/cogl/cogl \
-                     ${libdir}/libcogl${SOLIBSDEV} \
-                     ${libdir}/libcogl.la \
-                     ${libdir}/pkgconfig/cogl-1.0.pc \
-                     ${libdir}/pkgconfig/cogl-2.0-experimental.pc \
-                     ${libdir}/pkgconfig/cogl-gl-1.0.pc"
 FILES_libcogl-gles2 = "${libdir}/libcogl-gles2${SOLIBS}"
-FILES_libcogl-gles2-dev = "${includedir}/cogl/cogl-gles2 \
-                           ${libdir}/libcogl-gles2${SOLIBSDEV} \
-                           ${libdir}/libcogl-gles2.la \
-                           ${libdir}/pkgconfig/cogl-gles2-*.pc"
 FILES_libcogl-pango = "${libdir}/libcogl-pango${SOLIBS}"
-FILES_libcogl-pango-dev = "${includedir}/cogl/cogl-pango \
-                           ${libdir}/libcogl-pango${SOLIBSDEV} \
-                           ${libdir}/libcogl-pango.la \
-                           ${libdir}/pkgconfig/cogl-pango-*.pc"
 
 FILES_libcogl-path = "${libdir}/libcogl-path${SOLIBS}"
-FILES_libcogl-path-dev = "${includedir}/cogl/cogl-path \
-                          ${libdir}/libcogl-path${SOLIBSDEV} \
-                          ${libdir}/libcogl-path.la \
-                          ${libdir}/pkgconfig/cogl-path-*.pc"
 
 # For backwards compatibility after Debian-renaming
 RPROVIDES_libcogl = "cogl-1.0"
-- 
1.7.9.5


