Return-Path: <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
Received: from 92m-galaxy.eurogiciel.fr (mailhost2.eurogiciel.fr [93.17.39.83])
	by mail.openembedded.org (Postfix) with SMTP id 0316A6CC88
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 14:08:47 +0000 (UTC)
Received: from 31l-syracuse.eurogiciel.fr ([172.16.88.4]) by
	92m-galaxy.eurogiciel.fr with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 14 Oct 2013 16:08:45 +0200
Received: from intel13.vannes ([172.16.100.253]) by 31l-syracuse.eurogiciel.fr
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 14 Oct 2013 16:08:44 +0200
From: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2013 16:08:36 +0200
Message-Id: <1381759718-11554-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
X-Mailer: git-send-email 1.7.10.4
X-OriginalArrivalTime: 14 Oct 2013 14:08:44.0821 (UTC)
	FILETIME=[E4DF8450:01CEC8E6]
Subject: [PATCH v4 1/3] Wayland : Bump to version 1.3.0
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
X-List-Received-Date: Mon, 14 Oct 2013 14:08:49 -0000

Remove do_configure_append_class-native() function useless for this version
(file wayland-scanner.m4.in does not exist anymore)
Signed-off-by: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
---
 .../wayland/{wayland_1.1.0.bb => wayland_1.3.0.bb}      |   15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)
 rename meta/recipes-graphics/wayland/{wayland_1.1.0.bb => wayland_1.3.0.bb} (62%)

diff --git a/meta/recipes-graphics/wayland/wayland_1.1.0.bb b/meta/recipes-graphics/wayland/wayland_1.3.0.bb
similarity index 62%
rename from meta/recipes-graphics/wayland/wayland_1.1.0.bb
rename to meta/recipes-graphics/wayland/wayland_1.3.0.bb
index a71402e..41c88e8 100644
--- a/meta/recipes-graphics/wayland/wayland_1.1.0.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.3.0.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
                     file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
 
 SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "d2dc9398a83692cafc16eba6e45f85d8"
-SRC_URI[sha256sum] = "2ef587cf1a0e52b6dee44eeb9c288110e8180819abf4e419d247dfe234867a5c"
+SRC_URI[md5sum] = "d16d27081e0871de82d08840c2f133fc"
+SRC_URI[sha256sum] = "2e817685f68a26acd19964d69ddbc4549ba5412114ad95e1a9f5934cce470d6e"
 
 SRC_URI_append_class-native = " file://just-scanner.patch"
 
@@ -26,14 +26,3 @@ DEPENDS = "expat libffi wayland-native"
 
 EXTRA_OECONF_virtclass-native = "--disable-documentation"
 EXTRA_OECONF = "--disable-documentation --disable-scanner"
-
-# Wayland installs a M4 macro for other projects to use. This M4 macro includes
-# a path to a Makefile fragment to get the rules to generate stubs from protocol
-# description files.  The paths to the sysroot end up incorrect, so fix them.
-do_configure_append_class-native() {
-  sed -e 's,@prefix@,${STAGING_DIR_NATIVE},g' \
-      -e 's,@exec_prefix@,${STAGING_DIR_NATIVE},g' \
-      -e 's,@bindir@,${STAGING_BINDIR_NATIVE},g' \
-      -e 's,@datarootdir@,${STAGING_DATADIR_NATIVE},g' \
-  ${S}/wayland-scanner.m4.in > ${B}/wayland-scanner.m4
-}
-- 
1.7.10.4


