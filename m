Received: from nat-lmt.mentorg.com ([139.181.28.34] helo=alm.mentorg.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <noor_ahsan@mentor.com>) id 1TnokF-0001qh-7r
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Dec 2012 12:01:55 +0100
Received: from pkl-ahsann-ubuntu.mgc.mentorg.com ([137.202.157.70])
	by alm.mentorg.com (8.12.10/8.12.10) with ESMTP id qBQAkwaF029290;
	Wed, 26 Dec 2012 04:46:59 -0600
From: "Noor, Ahsan" <noor_ahsan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Dec 2012 15:46:56 +0500
Message-Id: <1356518816-5211-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] cairo: Adds libxext in X11DEPENDS.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Dec 2012 11:01:55 -0000

From: Noor Ahsan <noor_ahsan@mentor.com>

* cairo was giving redefinition error of struct _XLinearGradient,
struct _XCircle and struct _XRadialGradient.
* cario now depends on libxext. Adding that dependency resolved
above errors.
* Verified it on P2020RDB.
* Bump PR.

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 meta/recipes-graphics/cairo/cairo.inc       |    2 +-
 meta/recipes-graphics/cairo/cairo_1.12.8.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 3059fae..217e297 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://cairographics.org"
 BUGTRACKER = "http://bugs.freedesktop.org"
 SECTION = "libs"
 LICENSE = "MPL-1 & LGPLv2.1"
-X11DEPENDS = "virtual/libx11 libsm libxrender"
+X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 DEPENDS = "libpng fontconfig pixman glib-2.0"
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
            ${@base_contains('DISTRO_FEATURES', 'gtk-directfb', 'gtk-directfb', '', d)}"
diff --git a/meta/recipes-graphics/cairo/cairo_1.12.8.bb b/meta/recipes-graphics/cairo/cairo_1.12.8.bb
index 058854c..567a17f 100644
--- a/meta/recipes-graphics/cairo/cairo_1.12.8.bb
+++ b/meta/recipes-graphics/cairo/cairo_1.12.8.bb
@@ -2,7 +2,7 @@ require cairo.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e73e999e0c72b5ac9012424fa157ad77"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://cairographics.org/releases/cairo-${PV}.tar.xz"
 
-- 
1.7.9.5



