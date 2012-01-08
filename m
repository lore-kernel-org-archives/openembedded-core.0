Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RjxCV-00070B-Lp
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jan 2012 19:10:35 +0100
Received: (qmail invoked by alias); 08 Jan 2012 18:03:09 -0000
Received: from p4FDF1573.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.21.115]
	by mail.gmx.net (mp034) with SMTP; 08 Jan 2012 19:03:09 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/AcIQKoNfA5CULfpM407hd1rPMnHyCPCCuX/WILg
	CJU6ZYJ8rdZBge
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jan 2012 19:04:09 +0100
Message-Id: <1326045849-21938-3-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1326045849-21938-1-git-send-email-schnitzeltony@gmx.de>
References: <1326045849-21938-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [PATCH 2/2] libusb-compat: keep *.la in base_libdir
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

build-tested from scratch in angstrom environment.

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 meta/recipes-support/libusb/libusb-compat_0.1.3.bb |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/libusb/libusb-compat_0.1.3.bb b/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
index e070463..60ebcc2 100644
--- a/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
+++ b/meta/recipes-support/libusb/libusb-compat_0.1.3.bb
@@ -15,7 +15,7 @@ DEPENDS = "libusb1"
 PROVIDES = "libusb"
 
 PE = "1"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-compat-${PV}.tar.bz2 \
            file://0.1.0-beta1-gcc3.4-fix.patch"
@@ -29,7 +29,6 @@ EXTRA_OECONF = "--libdir=${base_libdir}"
 
 do_install_append() {
 	install -d ${D}${libdir}
-	mv ${D}${base_libdir}/*.la ${D}${libdir}
 	mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
 }
 
-- 
1.7.4.4



