Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QeEWw-0006wc-0p
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jul 2011 00:55:46 +0200
Received: by rex (Postfix, from userid 1000)
	id 9A7783132E; Tue,  5 Jul 2011 23:51:25 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 23:51:07 +0100
Message-Id: <3778c8a5c7800d301b8dc926fecd254c86f9ad81.1309906154.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
References: <696f00b67217242f3a372d070c2473f8ced639ed.1309906154.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
References: <cover.1309906154.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 06/17] eds-dbus: Package unpackaged files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jul 2011 22:55:46 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-sato/eds/eds-dbus_2.20.0.bb |    7 +++++--
 meta/recipes-sato/eds/eds-dbus_git.bb    |    9 +++++++--
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-sato/eds/eds-dbus_2.20.0.bb b/meta/recipes-sato/eds/eds-dbus_2.20.0.bb
index 2cbc903..2acc5b5 100644
--- a/meta/recipes-sato/eds/eds-dbus_2.20.0.bb
+++ b/meta/recipes-sato/eds/eds-dbus_2.20.0.bb
@@ -34,6 +34,7 @@ PACKAGES =+ "libcamel libcamel-dev libebook libebook-dev libecal libecal-dev \
              libedataserver libedataserver-dev \
              libedataserverui libedataserverui-dev"
 
+FILES_${PN} =+ "${datadir}/evolution-data-server-*/ui/"
 FILES_${PN}-dev =+ "${libdir}/pkgconfig/evolution-data-server-*.pc"
 FILES_${PN}-dbg =+ "${libdir}/evolution-data-server-*/camel-providers/.debug \
                     ${libdir}/evolution-data-server*/extensions/.debug/"
@@ -45,6 +46,7 @@ FILES_libcamel = "${libexecdir}/camel-* ${libdir}/libcamel-*.so.* \
                   ${libdir}/evolution-data-server-*/camel-providers/*.urls"
 FILES_libcamel-dev = "${libdir}/libcamel-*.so ${libdir}/libcamel-provider-*.so \
                       ${libdir}/pkgconfig/camel*pc \
+                    ${libdir}/evolution-data-server-*/camel-providers/*.la \
                       ${includedir}/evolution-data-server*/camel"
 
 FILES_libebook = "${libdir}/libebook-*.so.*"
@@ -55,7 +57,6 @@ RRECOMMENDS_libebook = "libedata-book"
 
 FILES_libecal = "${libdir}/libecal-*.so.* \
                  ${datadir}/evolution-data-server-1.4/zoneinfo"
-
 FILES_libecal-dev = "${libdir}/libecal-*.so ${libdir}/pkgconfig/libecal-*.pc \
                      ${includedir}/evolution-data-server*/libecal/*.h \
                      ${includedir}/evolution-data-server*/libical/*.h"
@@ -68,6 +69,7 @@ FILES_libedata-book = "${libexecdir}/e-addressbook-factory \
                        ${datadir}/evolution-data-server-1.4/weather/Locations.xml"
 FILES_libedata-book-dev = "${libdir}/libedata-book-*.so \
                            ${libdir}/pkgconfig/libedata-book-*.pc \
+                           ${libdir}/evolution-data-server-*/extensions/libebook*.la \
                            ${includedir}/evolution-data-server-*/libedata-book"
 
 FILES_libedata-cal = "${libexecdir}/e-calendar-factory \
@@ -76,7 +78,8 @@ FILES_libedata-cal = "${libexecdir}/e-calendar-factory \
                       ${libdir}/evolution-data-server-*/extensions/libecal*.so"
 FILES_libedata-cal-dev = "${libdir}/libedata-cal-*.so \
                           ${libdir}/pkgconfig/libedata-cal-*.pc \
-                          ${includedir}/evolution-data-server-*/libedata-cal"
+                          ${includedir}/evolution-data-server-*/libedata-cal \
+                          ${libdir}/evolution-data-server-*/extensions/libecal*.la"
 
 FILES_libedataserver = "${libdir}/libedataserver-*.so.*"
 FILES_libedataserver-dev = "${libdir}/libedataserver-*.so \
diff --git a/meta/recipes-sato/eds/eds-dbus_git.bb b/meta/recipes-sato/eds/eds-dbus_git.bb
index a8100ad..0d920cd 100644
--- a/meta/recipes-sato/eds/eds-dbus_git.bb
+++ b/meta/recipes-sato/eds/eds-dbus_git.bb
@@ -51,6 +51,7 @@ PACKAGES =+ "libcamel libcamel-dev libebook libebook-dev libecal libecal-dev \
              libedataserver libedataserver-dev \
              libedataserverui libedataserverui-dev"
 
+FILES_${PN} =+ "${datadir}/evolution-data-server-*/ui/"
 FILES_${PN}-dev =+ "${libdir}/pkgconfig/evolution-data-server-*.pc"
 FILES_${PN}-dbg =+ "${libdir}/evolution-data-server-*/camel-providers/.debug \
                     ${libdir}/evolution-data-server*/extensions/.debug/"
@@ -62,6 +63,7 @@ FILES_libcamel = "${libexecdir}/camel-* ${libdir}/libcamel-*.so.* \
                   ${libdir}/evolution-data-server-*/camel-providers/*.urls"
 FILES_libcamel-dev = "${libdir}/libcamel-*.so ${libdir}/libcamel-provider-*.so \
                       ${libdir}/pkgconfig/camel*pc \
+                    ${libdir}/evolution-data-server-*/camel-providers/*.la \
                       ${includedir}/evolution-data-server*/camel"
 
 FILES_libebook = "${libdir}/libebook-*.so.*"
@@ -80,9 +82,11 @@ RRECOMMENDS_libecal = "libedata-cal tzdata"
 FILES_libedata-book = "${libexecdir}/e-addressbook-factory \
                        ${datadir}/dbus-1/services/*.AddressBook.service \
                        ${libdir}/libedata-book-*.so.* \
-                       ${libdir}/evolution-data-server-*/extensions/libebook*.so"
+                       ${libdir}/evolution-data-server-*/extensions/libebook*.so \
+                       ${datadir}/evolution-data-server-1.4/weather/Locations.xml"
 FILES_libedata-book-dev = "${libdir}/libedata-book-*.so \
                            ${libdir}/pkgconfig/libedata-book-*.pc \
+                           ${libdir}/evolution-data-server-*/extensions/libebook*.la \
                            ${includedir}/evolution-data-server-*/libedata-book"
 
 FILES_libedata-cal = "${libexecdir}/e-calendar-factory \
@@ -91,7 +95,8 @@ FILES_libedata-cal = "${libexecdir}/e-calendar-factory \
                       ${libdir}/evolution-data-server-*/extensions/libecal*.so"
 FILES_libedata-cal-dev = "${libdir}/libedata-cal-*.so \
                           ${libdir}/pkgconfig/libedata-cal-*.pc \
-                          ${includedir}/evolution-data-server-*/libedata-cal"
+                          ${includedir}/evolution-data-server-*/libedata-cal \
+                          ${libdir}/evolution-data-server-*/extensions/libecal*.la"
 
 FILES_libedataserver = "${libdir}/libedataserver-*.so.*"
 FILES_libedataserver-dev = "${libdir}/libedataserver-*.so \
-- 
1.7.4.1



