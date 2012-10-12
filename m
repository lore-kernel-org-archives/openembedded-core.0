Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TMcyJ-0003lO-NJ
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Oct 2012 13:00:03 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so1952334wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2012 03:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=iaOcmTwlAYDNNN7jUqCa4BxrSzaCQZHbdpiNMjzQ974=;
	b=iHsizoANWe/HBE+p4T3o9BbHMWbc+X8NWrsJ1s1VQ3qpg9piha9sFUkLZ/kmn5Ac6S
	moRNQSvBw5GAbg2RUuhZ2Bd2kRbFJnzC7jkoQlEb/py0fmmiNWEMvwLZDxiQlkwi1epW
	sFCm36Flx9k7IlitR80OMR601Sa9Np6zL9J+NVPhNNNmyX3qzaE1y5j9D7HEino8ASNh
	zXkINdWWJAZwhJaqZD/tLwv8neKbvNYQxYrSkFTW4KS+Ce5oNe8gFXE/g5troAVwFZY7
	iS0M3QmZc08WtyeMzUiqdjp895oRzoiET9OKiTLQ/+WhdX4nxBVE6M1X5OHmxlISJHdD
	nf+Q==
Received: by 10.180.79.100 with SMTP id i4mr5124741wix.12.1350038812495;
	Fri, 12 Oct 2012 03:46:52 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id p4sm3030904wix.0.2012.10.12.03.46.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Oct 2012 03:46:51 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Oct 2012 12:46:39 +0200
Message-Id: <1350038799-22567-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <1350038799-22567-1-git-send-email-Martin.Jansa@gmail.com>
References: <1350038799-22567-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 2/2] PACKAGES_DYNAMIC: use += instead of = in most cases
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
X-List-Received-Date: Fri, 12 Oct 2012 11:00:04 -0000

* to keep ${PN}-locale from
  bitbake.conf:PACKAGES_DYNAMIC = "^${PN}-locale-.*"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/connman/connman.inc            | 2 +-
 meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 2 +-
 meta/recipes-devtools/perl/perl_5.14.2.bb                | 4 ++--
 meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb        | 2 +-
 meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb     | 2 +-
 meta/recipes-graphics/directfb/directfb.inc              | 2 +-
 meta/recipes-graphics/mesa/mesa-dri.inc                  | 2 +-
 meta/recipes-graphics/pango/pango.inc                    | 2 +-
 meta/recipes-multimedia/gstreamer/gst-plugins.inc        | 2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc        | 2 +-
 meta/recipes-qt/qt-apps/qmmp_0.6.1.bb                    | 2 +-
 meta/recipes-qt/qt4/qt4.inc                              | 2 +-
 12 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 1460ba9..33c0be6 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -93,7 +93,7 @@ RDEPENDS_${PN} = "\
 	${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
 	"
 
-PACKAGES_DYNAMIC = "^${PN}-plugin-.*"
+PACKAGES_DYNAMIC += "^${PN}-plugin-.*"
 
 python populate_packages_prepend() {
     depmap = dict(pppd="ppp")
diff --git a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
index 25eaf73..dfe9a8a 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-sdk.bb
@@ -89,4 +89,4 @@ RRECOMMENDS_packagegroup-core-sdk = "\
 #    d.setVar('PACKAGES', ' '.join(pkgs))
 #}
 #
-#PACKAGES_DYNAMIC = "^packagegroup-core-sdk-.*"
+#PACKAGES_DYNAMIC += "^packagegroup-core-sdk-.*"
diff --git a/meta/recipes-devtools/perl/perl_5.14.2.bb b/meta/recipes-devtools/perl/perl_5.14.2.bb
index 18a453a..0e2c329 100644
--- a/meta/recipes-devtools/perl/perl_5.14.2.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.2.bb
@@ -304,8 +304,8 @@ python populate_packages_prepend () {
     do_split_packages(d, libdir, '(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/|auto\/)[^\/]).*)\.(pm|pl|e2x)', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
 }
 
-PACKAGES_DYNAMIC = "^perl-module-.*"
-PACKAGES_DYNAMIC_virtclass-nativesdk = "^nativesdk-perl-module-.*"
+PACKAGES_DYNAMIC += "^perl-module-.*"
+PACKAGES_DYNAMIC_virtclass-nativesdk += "^nativesdk-perl-module-.*"
 
 RPROVIDES_perl-lib = "perl-lib"
 
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb
index 47f7538..6856f53 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb
@@ -56,7 +56,7 @@ FILES_${PN} += "${sysconfdir} /www"
 
 CONFFILES_${PN} = "${sysconfdir}/lighttpd.conf"
 
-PACKAGES_DYNAMIC = "^lighttpd-module-.*"
+PACKAGES_DYNAMIC += "^lighttpd-module-.*"
 
 python populate_packages_prepend () {
     lighttpd_libdir = d.expand('${libdir}')
diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index d09c2b6..32d7be4 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -10,7 +10,7 @@ DEPENDS = "gtk+"
 
 PR = "r3"
 
-PACKAGES_DYNAMIC = "^gtk-engine-.* ^gtk-theme-.*"
+PACKAGES_DYNAMIC += "^gtk-engine-.* ^gtk-theme-.*"
 
 RDEPENDS_gtk-theme-redmond = "gtk-engine-redmond95"
 RDEPENDS_gtk-theme-metal = "gtk-engine-metal"
diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index 41921dc..bc0071f 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -32,7 +32,7 @@ EXTRA_OECONF = "\
   --disable-x11 \
 "
 
-#PACKAGES_DYNAMIC = "^directfb-inputdrivers-.*"
+#PACKAGES_DYNAMIC += "^directfb-inputdrivers-.*"
 #
 #python populate_packages_prepend () {
 #    inputdrivers_libdir = d.expand('${libdir}/directfb-${RV}/inputdrivers')
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index bae06dd..07544ab 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -21,7 +21,7 @@ python populate_packages_prepend() {
     do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-dri-driver-%s', 'Mesa %s DRI driver', extra_depends='')
 }
 
-PACKAGES_DYNAMIC = "^mesa-dri-driver-.*"
+PACKAGES_DYNAMIC += "^mesa-dri-driver-.*"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
 
diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 318403d..b361978 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -18,7 +18,7 @@ PACKAGECONFIG[x11] = "--with-x,--without-x,${X11DEPENDS}"
 BBCLASSEXTEND = "native"
 DEPENDS_virtclass-native = "glib-2.0-native cairo-native"
 
-PACKAGES_DYNAMIC = "^pango-module-.*"
+PACKAGES_DYNAMIC += "^pango-module-.*"
 
 RRECOMMENDS_${PN} = "${@base_contains('DISTRO_FEATURES', 'x11', 'pango-module-basic-x', '', d)} pango-module-basic-fc" 
 
diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
index b8db0f0..8799a91 100644
--- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
@@ -17,5 +17,5 @@ acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
 require gst-plugins-package.inc
 
-PACKAGES_DYNAMIC = "^${PN}-.*"
+PACKAGES_DYNAMIC += "^${PN}-.*"
 
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index a890c25..4a3813e 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -70,7 +70,7 @@ PACKAGES =+ "libpulsecore libpulsecommon libpulsedsp libpulse libpulse-simple li
 #upgrade path:
 RREPLACES_pulseaudio-server = "libpulse-bin libpulse-conf"
 
-PACKAGES_DYNAMIC = "^pulseaudio-lib.* ^pulseaudio-module.* ^libpulse-lib.* ^libpulse-module.* "
+PACKAGES_DYNAMIC += "^pulseaudio-lib.* ^pulseaudio-module.* ^libpulse-lib.* ^libpulse-module.* "
 
 FILES_libpulsecore = "${libdir}/libpulsecore*.so"
 FILES_libpulsecommon = "${libdir}/libpulsecommon*.so"
diff --git a/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb b/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb
index 15273f7..9068025 100644
--- a/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb
+++ b/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb
@@ -26,7 +26,7 @@ export EXTRA_OECMAKE = "-DQT_QMAKE_EXECUTABLE=${OE_QMAKE_QMAKE} \
                         -DQT_HEADERS_DIR=${OE_QMAKE_INCDIR_QT} \
                         -DQT_QTCORE_INCLUDE_DIR=${OE_QMAKE_INCDIR_QT}/QtCore \
                         "
-PACKAGES_DYNAMIC = "^qmmp-plugin-.* "
+PACKAGES_DYNAMIC += "^qmmp-plugin-.* "
 
 
 python populate_packages_prepend () {
diff --git a/meta/recipes-qt/qt4/qt4.inc b/meta/recipes-qt/qt4/qt4.inc
index 5bc7956..c1a8387 100644
--- a/meta/recipes-qt/qt4/qt4.inc
+++ b/meta/recipes-qt/qt4/qt4.inc
@@ -124,7 +124,7 @@ PACKAGES += " \
              ${STATICDEV_PACKAGES} \
              ${OTHER_PACKAGES}"
 
-PACKAGES_DYNAMIC = "^${QT_BASE_NAME}-plugin-.* ^${QT_BASE_NAME}-translation-.* ^${QT_BASE_NAME}-phrasebook-.*"
+PACKAGES_DYNAMIC += "^${QT_BASE_NAME}-plugin-.* ^${QT_BASE_NAME}-translation-.* ^${QT_BASE_NAME}-phrasebook-.*"
 
 ALLOW_EMPTY_${PN} = "1"
 FILES_${PN}     = ""
-- 
1.7.12



