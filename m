Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RjxCU-00070A-Ty
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jan 2012 19:10:35 +0100
Received: (qmail invoked by alias); 08 Jan 2012 18:03:08 -0000
Received: from p4FDF1573.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.21.115]
	by mail.gmx.net (mp034) with SMTP; 08 Jan 2012 19:03:08 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX19D5Clu6xpDZEwweUPbGXZb8WOq5FXVBWOxHXDSCC
	XsyDlTuEvswlBR
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jan 2012 19:04:08 +0100
Message-Id: <1326045849-21938-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1326045849-21938-1-git-send-email-schnitzeltony@gmx.de>
References: <1326045849-21938-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [PATCH 1/2] libusb1: keep *.la in base_libdir
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
X-List-Received-Date: Sun, 08 Jan 2012 18:10:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fixes the following error found during build from scratch for
meta-oe / obexd:

| arm-angstrom-linux-gnueabi-libtool: link: cannot find the library
| `/home/Superandy/tmp/oe-core-eglibc/sysroots/overo/lib/libusb-1.0.la' or
| unhandled argument `=/lib/libusb-1.0.la'

build-tested from scratch in angstrom environment.

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta/recipes-support/libusb/libusb1_1.0.8.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.8.bb b/meta/recipes-support/libusb/libusb1_1.0.8.bb
index 5a921e0..8873de7 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.8.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.8.bb
@@ -6,7 +6,7 @@ SECTION = "libs"
 LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2"
 
@@ -20,7 +20,6 @@ EXTRA_OECONF = "--libdir=${base_libdir}"
 
 do_install_append() {
 	install -d ${D}${libdir}
-	mv ${D}${base_libdir}/*.la ${D}${libdir}
 	mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
 }
 
-- 
1.7.4.4



